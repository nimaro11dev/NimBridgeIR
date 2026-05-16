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
TMP_DIR=""

trap '[[ -n "${TMP_DIR:-}" ]] && rm -rf "$TMP_DIR"' EXIT

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

  if [[ -f "$src_dir/uninstall.sh" ]]; then
    install -m 755 "$src_dir/uninstall.sh" "$LIB_DIR/uninstall.sh"
  fi

  ln -sfn "$INSTALL_BIN" "$SHORT_BIN"

  if [[ ! -f "$CONFIG_DIR/config.env" ]]; then
    cat > "$CONFIG_DIR/config.env" <<'EOF_CONFIG'
NBI_ENABLED=0
NBI_PROXY_HOST=
NBI_PROXY_PORT=
NBI_PROXY_USER=
NBI_PROXY_PASS=
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
