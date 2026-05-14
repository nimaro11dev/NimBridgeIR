#!/usr/bin/env bash
set -euo pipefail

APP_NAME="NimBridgeIR"
CONFIG_DIR="/etc/nimbridgeir"
STATE_DIR="/var/lib/nimbridgeir"
BASELINE_DIR="$STATE_DIR/baseline"
INSTALL_BIN="/usr/local/bin/nimbridgeir"
SHORT_BIN="/usr/local/bin/nbi"
LIB_DIR="/usr/local/lib/nimbridgeir"
LOG_FILE="/var/log/nimbridgeir.log"

require_root() {
  if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
    echo "Error: Please run as root: sudo bash uninstall.sh" >&2
    exit 1
  fi
}

restore_docker_baseline() {
  [[ -f "$BASELINE_DIR/docker/marker" ]] || return 0
  mkdir -p /etc/docker
  if grep -qx 'file' "$BASELINE_DIR/docker/marker"; then
    cp -a "$BASELINE_DIR/docker/daemon.json" /etc/docker/daemon.json
  else
    rm -f /etc/docker/daemon.json
  fi
  if command -v systemctl >/dev/null 2>&1 && systemctl list-unit-files docker.service >/dev/null 2>&1; then
    systemctl restart docker >/dev/null 2>&1 || true
  fi
}

cleanup_temp_files() {
  rm -f /etc/apt/apt.conf.d/99nimbridgeir-access 2>/dev/null || true
  rm -f /etc/apt/sources.list.d/nimbridgeir-bootstrap.list 2>/dev/null || true
}

main() {
  require_root

  local restore="yes"
  local remove_state="no"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --no-restore) restore="no" ;;
      --purge) remove_state="yes" ;;
      --help|-h)
        cat <<EOF_HELP
Usage: sudo bash uninstall.sh [--no-restore] [--purge]

  --no-restore   Do not restore Docker/system access configuration
  --purge        Remove /etc/nimbridgeir and /var/lib/nimbridgeir too
EOF_HELP
        exit 0
        ;;
      *) echo "Unknown option: $1" >&2; exit 1 ;;
    esac
    shift
  done

  if [[ "$restore" == "yes" ]]; then
    restore_docker_baseline || true
    cleanup_temp_files
  fi

  rm -f "$INSTALL_BIN" "$SHORT_BIN"
  rm -rf "$LIB_DIR"

  if [[ "$remove_state" == "yes" ]]; then
    rm -rf "$CONFIG_DIR" "$STATE_DIR" "$LOG_FILE"
  fi

  echo "$APP_NAME uninstalled."
  if [[ "$remove_state" != "yes" ]]; then
    echo "Config/state kept. Use --purge to remove them."
  fi
}

main "$@"
