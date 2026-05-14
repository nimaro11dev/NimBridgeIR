# NimBridgeIR

**NimBridgeIR** یک ابزار ساده برای سرورهای Ubuntu داخل ایران است.

با این ابزار می‌توانید کارهای اولیه و پرکاربرد سرور را راحت‌تر انجام دهید؛ مثل آپدیت Ubuntu، نصب پکیج‌ها، دانلود فایل، نصب Docker و Pull کردن Docker Imageها.

ساخته‌شده توسط **nimaro11 dev**

---

## NimBridgeIR به چه درد می‌خورد؟

بعضی سرورهای داخل ایران برای دسترسی به منابع خارجی مثل Ubuntu Repository، Docker Hub، GitHub و بعضی لینک‌های دانلود مشکل دارند.

NimBridgeIR این کارها را ساده می‌کند:

- گرفتن تنظیمات دسترسی فقط یک‌بار از کاربر
- تست اتصال به منابع مهم
- آپدیت لیست پکیج‌های Ubuntu
- نصب پکیج‌های Ubuntu
- دانلود فایل از لینک مستقیم
- نصب Docker
- تنظیم دسترسی Docker
- Pull کردن Docker Image
- فعال یا غیرفعال کردن تنظیمات NimBridgeIR
- حذف کامل برنامه در صورت نیاز

کاربر لازم نیست درگیر تنظیمات پیچیده سیستم شود. کافی است برنامه را اجرا کند و از منوی ساده استفاده کند.

---

## سیستم‌عامل‌های پیشنهادی

این نسخه برای Ubuntu Server طراحی شده است:

- Ubuntu Server 20.04
- Ubuntu Server 22.04
- Ubuntu Server 24.04

برای بهترین نتیجه، برنامه را روی سرور خام یا سروری که تنظیمات شبکه آن خیلی دستکاری نشده تست کنید.

---

## نصب برنامه

### روش پیشنهادی: آپلود دستی روی سرور

اگر سرور هنوز دسترسی مناسب برای دانلود از اینترنت ندارد، فایل‌های پروژه را از سیستم خودتان روی سرور آپلود کنید.

روی سیستم خودتان:

```bash
scp -r NimBridgeIR root@SERVER_IP:/root/
```

روی سرور:

```bash
cd /root/NimBridgeIR
sudo bash install.sh
sudo nimbridgeir
```

بعد از نصب، می‌توانید از دستور کوتاه‌تر هم استفاده کنید:

```bash
sudo nbi
```

### نصب با لینک مستقیم

بعد از قرار گرفتن پروژه روی GitHub، اگر سرور به GitHub دسترسی داشت، می‌توانید از این روش استفاده کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/nimaro11/NimBridgeIR/main/install.sh | sudo bash
```

اگر سرور به GitHub دسترسی ندارد، همان روش آپلود دستی بهتر است.

---

## اجرای اولیه

بعد از اولین اجرا:

```bash
sudo nimbridgeir
```

اگر هنوز تنظیمات دسترسی ثبت نشده باشد، برنامه همان ابتدا اطلاعات proxy را از شما می‌پرسد:

```text
Proxy host/IP
Proxy port
Username اختیاری
Password اختیاری
```

اگر proxy شما username/password ندارد، قسمت username را خالی بگذارید.

بعداً هر زمان خواستید، می‌توانید از بخش Settings اطلاعات را دوباره وارد کنید.

---

## منوی اصلی

```text
1) Check Connection
2) Update Ubuntu Packages
3) Install Ubuntu Package
4) Docker Tools
5) Download File
6) Settings
0) Exit
```

### 1) Check Connection

وضعیت اتصال به چند منبع مهم را بررسی می‌کند؛ مثل:

- HTTPS عمومی
- Ubuntu packages
- GitHub
- Docker registry

اگر یکی از بخش‌ها Failed شد، معمولاً باید proxy را بررسی کنید یا proxy دیگری تست کنید.

### 2) Update Ubuntu Packages

معادل ساده‌شده دستور زیر است:

```bash
apt update
```

از این گزینه برای به‌روزرسانی لیست پکیج‌های Ubuntu استفاده کنید.

### 3) Install Ubuntu Package

با این گزینه می‌توانید یک پکیج Ubuntu نصب کنید.

مثلاً اگر برنامه از شما نام پکیج خواست، می‌توانید وارد کنید:

```text
curl
```

یا:

```text
nginx
```

### 4) Docker Tools

بخش مخصوص نصب Docker، تست Docker و Pull کردن Imageها است.

### 5) Download File

برای دانلود فایل از لینک مستقیم استفاده می‌شود.

برنامه از شما دو چیز می‌پرسد:

```text
File URL
Save as
```

مثال:

```text
File URL: https://example.com/file.tar.gz
Save as: /root/file.tar.gz
```

### 6) Settings

برای تغییر تنظیمات ذخیره‌شده، فعال/غیرفعال کردن برنامه و حذف برنامه استفاده می‌شود.

---

## منوی Docker Tools

```text
1) Install Docker
2) Check Docker Access
3) Pull Docker Image
4) Enable/Disable Docker Access
0) Back
```

### 1) Install Docker

Docker و ابزارهای لازم آن را نصب می‌کند.

اگر Docker از قبل نصب شده باشد، برنامه فقط تنظیمات دسترسی Docker را دوباره بررسی و آماده می‌کند.

### 2) Check Docker Access

بررسی می‌کند Docker بتواند از Docker Hub ایمیج بگیرد یا نه.

این گزینه برای تست از image سبک `hello-world:latest` استفاده می‌کند.

### 3) Pull Docker Image

از شما نام image را می‌گیرد و آن را Pull می‌کند.

مثال:

```text
nginx:latest
```

یا:

```text
postgres:17.6
```

یا:

```text
remnawave/backend:2
```

### 4) Enable/Disable Docker Access

این گزینه هوشمند است.

اگر Docker access فعال باشد، متن گزینه به شکل زیر نمایش داده می‌شود:

```text
Disable Docker Access
```

اگر غیرفعال باشد، متن گزینه به شکل زیر نمایش داده می‌شود:

```text
Enable Docker Access
```

این گزینه Docker را حذف نمی‌کند. فقط تنظیمات دسترسی Docker را فعال یا غیرفعال می‌کند.

---

## منوی Settings

```text
1) Show Current Status
2) Reconfigure Access
3) Enable/Disable NimBridgeIR
4) Auto Restore on Disable
5) Reset Saved Proxy Settings
6) Uninstall NimBridgeIR
0) Back
```

### 1) Show Current Status

وضعیت فعلی برنامه را نشان می‌دهد؛ مثل:

- فعال یا غیرفعال بودن NimBridgeIR
- proxy ذخیره‌شده
- آماده بودن ابزارهای لازم
- نصب بودن Docker
- فعال بودن Docker access
- وضعیت Auto Restore

### 2) Reconfigure Access

اگر proxy شما عوض شد یا اطلاعات را اشتباه وارد کردید، از این گزینه استفاده کنید.

### 3) Enable/Disable NimBridgeIR

این گزینه هوشمند است.

اگر NimBridgeIR فعال باشد، گزینه به شکل زیر نمایش داده می‌شود:

```text
Disable NimBridgeIR
```

اگر غیرفعال باشد، گزینه به شکل زیر نمایش داده می‌شود:

```text
Enable NimBridgeIR
```

با Disable کردن، برنامه حذف نمی‌شود؛ فقط تنظیمات فعال آن غیرفعال می‌شود.

### 4) Auto Restore on Disable

مشخص می‌کند وقتی NimBridgeIR را غیرفعال می‌کنید، تنظیمات مرتبط به حالت قبلی برگردانده شود یا نه.

پیشنهاد معمول:

```text
Yes
```

### 5) Reset Saved Proxy Settings

اطلاعات proxy ذخیره‌شده را پاک می‌کند.

این گزینه Docker را حذف نمی‌کند و تنظیمات Docker را تغییر نمی‌دهد.

### 6) Uninstall NimBridgeIR

برنامه را از سرور حذف می‌کند.

در زمان حذف، برنامه از شما می‌پرسد:

- آیا تنظیمات Docker/system قبل از حذف برگردانده شود؟
- آیا تنظیمات ذخیره‌شده، لاگ‌ها و بکاپ‌ها هم پاک شوند؟

اگر می‌خواهید همه‌چیز کامل پاک شود، به گزینه‌های حذف کامل پاسخ مثبت بدهید.

---

## مسیرهای نصب و تنظیمات

دستور اصلی:

```text
/usr/local/bin/nimbridgeir
```

دستور کوتاه:

```text
/usr/local/bin/nbi
```

تنظیمات برنامه:

```text
/etc/nimbridgeir/config.env
/etc/nimbridgeir/engine.conf
```

فایل‌های وضعیت و بکاپ:

```text
/var/lib/nimbridgeir/
```

لاگ برنامه:

```text
/var/log/nimbridgeir.log
```

---

## تنظیمات مهم قبل از انتشار یا استفاده نهایی

داخل فایل `nimbridgeir`، ابتدای فایل این بخش را بررسی کنید:

```bash
# Release defaults
```

### DNS مرحله آماده‌سازی

```bash
NBI_BOOTSTRAP_DNS_1="${NBI_BOOTSTRAP_DNS_1:-217.218.127.127}"
NBI_BOOTSTRAP_DNS_2="${NBI_BOOTSTRAP_DNS_2:-217.218.155.155}"
```

این DNSها فقط برای آماده‌سازی اولیه استفاده می‌شوند.

اگر DNS بهتر و پایدارتر دارید، این دو مقدار را تغییر دهید.

### mirror مرحله آماده‌سازی

```bash
NBI_BOOTSTRAP_APT_MIRROR="${NBI_BOOTSTRAP_APT_MIRROR:-http://ubuntu.parsvds.com/ubuntu}"
NBI_BOOTSTRAP_SECURITY_MIRROR="${NBI_BOOTSTRAP_SECURITY_MIRROR:-http://ubuntu.parsvds.com/ubuntu}"
```

این mirror فقط برای آماده‌سازی اولیه استفاده می‌شود.

بعد از آماده‌سازی، تنظیمات قبلی APT برگردانده می‌شود.

قبل از استفاده جدی، این mirror را روی یک Ubuntu خام داخل ایران تست کنید.

### آدرس‌های تست اتصال

```bash
NBI_TEST_URL_GENERAL="${NBI_TEST_URL_GENERAL:-https://example.com}"
NBI_TEST_URL_GITHUB="${NBI_TEST_URL_GITHUB:-https://github.com}"
NBI_TEST_URL_UBUNTU="${NBI_TEST_URL_UBUNTU:-https://archive.ubuntu.com/ubuntu/}"
NBI_TEST_URL_DOCKER="${NBI_TEST_URL_DOCKER:-https://registry-1.docker.io/v2/}"
```

این آدرس‌ها برای گزینه `Check Connection` استفاده می‌شوند.

---

## حذف دستی برنامه

اگر خواستید برنامه را دستی حذف کنید:

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh
```

حذف کامل همراه با تنظیمات، لاگ‌ها و بکاپ‌ها:

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh --purge
```

حذف بدون برگرداندن تنظیمات Docker/system:

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh --no-restore
```

---

## خطاهای رایج

### Docker pull خطای timeout می‌دهد

اول این گزینه را تست کنید:

```text
Docker Tools > Check Docker Access
```

اگر باز هم خطا گرفتید، proxy را از بخش Settings دوباره وارد کنید یا proxy دیگری تست کنید.

### apt update کار نمی‌کند

از منوی اصلی این گزینه را تست کنید:

```text
Check Connection
```

اگر Ubuntu packages یا General HTTPS خطا داشت، معمولاً مشکل از proxy یا اتصال سرور است.

### proxy را اشتباه وارد کردم

از این مسیر دوباره اطلاعات را وارد کنید:

```text
Settings > Reconfigure Access
```

---

## حمایت مالی

اگر این ابزار برای شما مفید بود، می‌توانید از پروژه حمایت کنید.

```text
USDT TRC20: YOUR_TRC20_WALLET_HERE
USDT ERC20: YOUR_ERC20_WALLET_HERE
BTC: YOUR_BTC_WALLET_HERE
TON: YOUR_TON_WALLET_HERE
```

