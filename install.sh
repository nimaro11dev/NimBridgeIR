#!/usr/bin/env bash
set -euo pipefail

APP_NAME="NimBridgeIR"
APP_CMD="nimbridgeir"
INSTALL_BIN="/usr/local/bin/$APP_CMD"
SHORT_BIN="/usr/local/bin/nbi"
LIB_DIR="/usr/local/lib/nimbridgeir"
CONFIG_DIR="/etc/nimbridgeir"
STATE_DIR="/var/lib/nimbridgeir"
REPO_OWNER="${NBI_REPO_OWNER:-nimaro11dev}"
REPO_NAME="${NBI_REPO_NAME:-NimBridgeIR}"
REPO_BRANCH="${NBI_REPO_BRANCH:-main}"
RAW_BASE="${NBI_RAW_BASE:-https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$REPO_BRANCH}"
SING_BOX_VERSION="${NBI_SING_BOX_VERSION:-1.13.12}"
TMP_DIR=""

trap '[[ -n "${TMP_DIR:-}" ]] && rm -rf "$TMP_DIR"' EXIT

detect_sing_box_arch() {
 local arch
 arch="$(dpkg --print-architecture 2>/dev/null || uname -m)"
 case "$arch" in
  amd64|x86_64) printf 'amd64' ;;
  arm64|aarch64) printf 'arm64' ;;
  *) return 1 ;;
 esac
}

install_bundled_sing_box() {
 local src_dir="$1" arch asset asset_dir
 arch="$(detect_sing_box_arch 2>/dev/null || true)"
 [[ -n "$arch" ]] || return 1
 asset="$src_dir/assets/sing-box/sing-box-linux-$arch"
 asset_dir="$src_dir/assets/sing-box/sing-box-linux-$arch"

 if [[ -f "$asset" ]]; then
  install -m 755 "$asset" "$LIB_DIR/sing-box"
  return 0
 fi

 if [[ -f "$asset_dir/sing-box" ]]; then
  install -m 755 "$asset_dir/sing-box" "$LIB_DIR/sing-box"
  [[ -f "$asset_dir/libcronet.so" ]] && install -m 644 "$asset_dir/libcronet.so" "$LIB_DIR/libcronet.so"
  return 0
 fi

 return 1
}

sing_box_available() {
 [[ -x "$LIB_DIR/sing-box" ]] || command -v sing-box >/dev/null 2>&1
}

download_sing_box() {
 local arch="$1" work archive extracted bin url

 url="https://github.com/SagerNet/sing-box/releases/download/v$SING_BOX_VERSION/sing-box-$SING_BOX_VERSION-linux-$arch.tar.gz"
 work="$(mktemp -d)"
 archive="$work/sing-box.tar.gz"
 extracted="$work/extracted"

 mkdir -p "$extracted"

 echo "Downloading sing-box $SING_BOX_VERSION for linux-$arch..."
 if ! fetch_file "$url" "$archive"; then
  rm -rf "$work"
  return 1
 fi

 if ! tar -xzf "$archive" -C "$extracted"; then
  rm -rf "$work"
  return 1
 fi

 bin="$(find "$extracted" -type f -name sing-box | head -n 1)"
 if [[ -z "$bin" ]]; then
  echo "Error: sing-box binary not found in downloaded archive" >&2
  rm -rf "$work"
  return 1
 fi

 install -m 755 "$bin" "$LIB_DIR/sing-box"
 rm -rf "$work"
}

ensure_sing_box() {
 local src_dir="$1" arch

  install_bundled_sing_box "$src_dir" || true
 sing_box_available && return 0

 arch="$(detect_sing_box_arch 2>/dev/null || true)"
 if [[ -z "$arch" ]]; then
  echo "Error: unsupported architecture for sing-box" >&2
  return 1
 fi

 if ! download_sing_box "$arch"; then
  echo "Error: sing-box is required. Use the offline release package for linux-$arch." >&2
  return 1
 fi
}

require_root() {
  if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
    echo "Error: Please run as root: sudo bash install.sh" >&2
    exit 1
  fi
}

script_dir() {
  cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd
}
 
fetch_file() {
  local url="$1"
  local dest="$2"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$url" -o "$dest"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$dest" "$url"
  else
    echo "Error: curl or wget is required for remote install" >&2
    return 1
  fi
}

prepare_source_dir() {
  local src_dir
  src_dir="$(script_dir 2>/dev/null || true)"

  if [[ -n "$src_dir" && -f "$src_dir/nimbridgeir" ]]; then
    printf '%s' "$src_dir"
    return 0
  fi

  TMP_DIR="$(mktemp -d)"
  fetch_file "$RAW_BASE/nimbridgeir" "$TMP_DIR/nimbridgeir"
  fetch_file "$RAW_BASE/uninstall.sh" "$TMP_DIR/uninstall.sh" || true
  chmod +x "$TMP_DIR/nimbridgeir" "$TMP_DIR/uninstall.sh" 2>/dev/null || true
  printf '%s' "$TMP_DIR"
}

main() {
  require_root
  local src_dir
  src_dir="$(prepare_source_dir)"

  if [[ ! -f "$src_dir/nimbridgeir" ]]; then
    echo "Error: nimbridgeir file not found next to install.sh" >&2
    exit 1
  fi

  chmod +x "$src_dir/nimbridgeir"
  install -d -m 755 "$LIB_DIR"
  install -d -m 700 "$CONFIG_DIR" "$STATE_DIR" "$STATE_DIR/backups" "$STATE_DIR/baseline"
  install -m 755 "$src_dir/nimbridgeir" "$INSTALL_BIN"

  ensure_sing_box "$src_dir"

  if [[ -f "$src_dir/uninstall.sh" ]]; then
    install -m 755 "$src_dir/uninstall.sh" "$LIB_DIR/uninstall.sh"
  fi

  ln -sfn "$INSTALL_BIN" "$SHORT_BIN"

  if [[ ! -f "$CONFIG_DIR/config.env" ]]; then
    cat > "$CONFIG_DIR/config.env" <<'EOF_CONFIG'
NBI_ENABLED=0
NBI_PROXY_TYPE=http
NBI_PROXY_RAW=
NBI_PROXY_HOST=
NBI_PROXY_PORT=
NBI_PROXY_USER=
NBI_PROXY_PASS=
NBI_BRIDGE_PORT=
NBI_AUTO_RESTORE_ON_DISABLE=1
NBI_DOCKER_ACCESS_CONFIGURED=0
NBI_NO_PROXY=localhost\,127.0.0.1\,::1\,10.0.0.0/8\,172.16.0.0/12\,192.168.0.0/16
EOF_CONFIG
    chmod 600 "$CONFIG_DIR/config.env"
  fi

  echo "$APP_NAME installed successfully."
  echo "Run: sudo $APP_CMD"
  echo "Shortcut: sudo nbi"
}

main "$@"
