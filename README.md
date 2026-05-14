# NimBridgeIR

**NimBridgeIR** is a simple Ubuntu helper for Iranian servers that need a practical way to do essential developer tasks such as updating packages, installing packages, downloading files, cloning GitHub repositories, and working with Docker.

Created by **nimaro11 dev**.

> هدف پروژه ساده‌سازی کاربر است. کاربر فقط proxy خود را وارد می‌کند و از منوی ساده استفاده می‌کند؛ جزئیات فنی آماده‌سازی سیستم پشت صحنه انجام می‌شود.

---

## Features

- Interactive terminal menu
- Configure HTTP proxy once
- Check access to common developer resources
- Update Ubuntu package lists
- Install Ubuntu packages
- Download files by URL
- Clone GitHub repositories
- Install Docker Engine
- Configure Docker access
- Pull Docker images
- Load Docker images from `.tar` files
- Enable/disable NimBridgeIR
- Optional restore behavior on disable/uninstall

---

## Supported OS

Currently tested/designed for:

- Ubuntu Server 20.04
- Ubuntu Server 22.04
- Ubuntu Server 24.04

Other Debian-based systems may work later, but the MVP intentionally targets Ubuntu only.

---

## Install

### Method 1: Manual upload

Use this when the server cannot access GitHub yet.

On your local machine:

```bash
scp -r NimBridgeIR root@SERVER_IP:/root/
```

On the server:

```bash
cd /root/NimBridgeIR
sudo bash install.sh
sudo nimbridgeir
```

Shortcut:

```bash
sudo nbi
```

### Method 2: GitHub raw installer

After publishing the repository, this can be used on servers that can reach GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/nimaro11/NimBridgeIR/main/install.sh | sudo bash
```

For restricted servers, prefer Method 1.

---

## Main Menu

```text
NimBridgeIR
Simple access helper for Ubuntu servers in Iran
by nimaro11 dev

1) Configure Access
2) Check Connection
3) Update Ubuntu Packages
4) Install Ubuntu Package
5) Download File
6) Clone GitHub Repository
7) Docker Tools
8) Run Custom Command
9) Settings
0) Exit
```

---

## Docker Tools

```text
1) Install Docker
2) Check Docker Access
3) Pull Docker Image
4) Load Docker Image from File
5) List Docker Images
6) Generate Image Export Command
7) Remove Docker Access Config
0) Back
```

### Offline Docker image flow

On a machine with normal internet access:

```bash
docker pull nginx:latest
docker save -o nginx_latest.tar nginx:latest
```

Upload the file to the restricted server:

```bash
scp nginx_latest.tar root@SERVER_IP:/root/
```

On the restricted server:

```bash
sudo nimbridgeir
# Docker Tools > Load Docker Image from File
```

---

## Maintainer Settings You Should Review Before Release

Open the `nimbridgeir` file and review the **EDITABLE DEFAULTS FOR PROJECT MAINTAINER** section near the top.

### 1. Bootstrap DNS

```bash
NBI_BOOTSTRAP_DNS_1="${NBI_BOOTSTRAP_DNS_1:-178.22.122.100}"
NBI_BOOTSTRAP_DNS_2="${NBI_BOOTSTRAP_DNS_2:-185.51.200.2}"
```

These DNS servers are used only during the hidden bootstrap step, then the previous `/etc/resolv.conf` state is restored.

Change them if you have a better pair.

### 2. Bootstrap Ubuntu mirror

```bash
NBI_BOOTSTRAP_APT_MIRROR="${NBI_BOOTSTRAP_APT_MIRROR:-http://mirror.arvancloud.ir/ubuntu}"
NBI_BOOTSTRAP_SECURITY_MIRROR="${NBI_BOOTSTRAP_SECURITY_MIRROR:-http://mirror.arvancloud.ir/ubuntu}"
```

This mirror is only used to install the internal access engine and basic tools if they are missing.

After bootstrap, the original APT sources are restored.

Before release, test this mirror on a clean Iranian Ubuntu server. If it is slow or unavailable, replace it with a more reliable Iranian Ubuntu mirror.

### 3. Test URLs

```bash
NBI_TEST_URL_GENERAL="${NBI_TEST_URL_GENERAL:-https://example.com}"
NBI_TEST_URL_GITHUB="${NBI_TEST_URL_GITHUB:-https://github.com}"
NBI_TEST_URL_UBUNTU="${NBI_TEST_URL_UBUNTU:-https://archive.ubuntu.com/ubuntu/}"
NBI_TEST_URL_DOCKER="${NBI_TEST_URL_DOCKER:-https://registry-1.docker.io/v2/}"
```

These are used by **Check Connection**.

### 4. Docker no-proxy list

```bash
NBI_DEFAULT_NO_PROXY="${NBI_DEFAULT_NO_PROXY:-localhost,127.0.0.1,::1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16}"
```

Change only if you need custom private networks.

---

## Config and State Paths

Installed command:

```text
/usr/local/bin/nimbridgeir
/usr/local/bin/nbi
```

Configuration:

```text
/etc/nimbridgeir/config.env
/etc/nimbridgeir/engine.conf
```

State and backups:

```text
/var/lib/nimbridgeir/
/var/lib/nimbridgeir/backups/
/var/lib/nimbridgeir/baseline/
```

Log:

```text
/var/log/nimbridgeir.log
```

---

## Enable / Disable Behavior

NimBridgeIR has a settings section:

```text
Settings > Enable NimBridgeIR
Settings > Disable NimBridgeIR
Settings > Restore Behavior
```

When restore behavior is enabled, disabling NimBridgeIR will try to restore related Docker/system access configuration to its previous state.

Temporary bootstrap changes to DNS and APT sources are restored automatically after bootstrap.

---

## Uninstall

Interactive:

```bash
sudo nimbridgeir
# Settings > Uninstall NimBridgeIR
```

Manual:

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh
```

Remove config/state too:

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh --purge
```

Do not restore access configs during uninstall:

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh --no-restore
```

---

## Development Test Checklist

Run on a clean Ubuntu server:

```bash
bash -n nimbridgeir
bash -n install.sh
bash -n uninstall.sh
sudo bash install.sh
sudo nimbridgeir --version
sudo nimbridgeir --status
```

Then test from the menu:

```text
1) Configure Access
2) Check Connection
3) Update Ubuntu Packages
4) Install Ubuntu Package: curl
7) Docker Tools > Install Docker
7) Docker Tools > Pull Docker Image: hello-world:latest
7) Docker Tools > Generate Image Export Command
7) Docker Tools > Load Docker Image from File
9) Settings > Disable NimBridgeIR
```

Also test:

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh --purge
```

---

## Suggested GitHub Release Steps

```bash
git init
git add .
git commit -m "feat: initial NimBridgeIR MVP"
git branch -M main
git remote add origin https://github.com/nimaro11/NimBridgeIR.git
git push -u origin main
```

Suggested first tag:

```bash
git tag v0.1.0
git push origin v0.1.0
```

---

## License

MIT
