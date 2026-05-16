<div dir="rtl" align="right">

# NimBridgeIR

**NimBridgeIR** یک ابزار ساده برای سرورهای Ubuntu داخل ایران است.

با NimBridgeIR می‌توانید کارهای اولیه و پرکاربرد سرور را راحت‌تر انجام دهید؛ مثل آپدیت Ubuntu، نصب پکیج‌ها، دانلود فایل، نصب Docker و Pull کردن Docker Imageها.

ساخته‌شده توسط **nimaro11 dev**

---

## ❤️ حمایت از پروژه

اگر این ابزار برای شما مفید بود و دوست داشتید از ادامه توسعه آن حمایت کنید، می‌توانید از طریق آدرس‌های زیر دونیت کنید:

</div>

<div dir="ltr" align="left">

```text
USDT TRC20: TZEkPk6pmxRPFsAXWe7jSqfmwFeEYcxRYq
USDT BEP20: 0x66F98e2980906503f0B4a5E9d14A5BfD7d2aB008
TON: UQDN_FNnzZHr7qks6XRV1k9JKHFfPZ2frq_oymluJksa2MRe
```

</div>

<div dir="rtl" align="right">

---

## قبل از استفاده چه چیزی لازم است؟

برای استفاده از NimBridgeIR باید یک **HTTP Proxy** داشته باشید.

در اولین اجرای برنامه، اطلاعات proxy از شما پرسیده می‌شود:

</div>

<div dir="ltr" align="left">

```text
Proxy host/IP
Proxy port
Username (optional)
Password (optional)
```

</div>

<div dir="rtl" align="right">

اگر proxy شما username و password ندارد، قسمت username را خالی بگذارید.

بعد از ثبت proxy، برنامه از همین تنظیمات برای انجام کارهایی مثل آپدیت، نصب پکیج، دانلود فایل و کار با Docker استفاده می‌کند. کاربر لازم نیست درگیر تنظیمات پیچیده سیستم شود.

---

## NimBridgeIR به چه درد می‌خورد؟

بعضی سرورهای داخل ایران برای دسترسی به منابع خارجی مثل Ubuntu Repository، Docker Hub، GitHub و بعضی لینک‌های دانلود مشکل دارند.

NimBridgeIR این کارها را ساده‌تر می‌کند:

- دریافت اطلاعات دسترسی فقط یک‌بار از کاربر
- تست اتصال به منابع مهم
- آپدیت لیست پکیج‌های Ubuntu
- نصب پکیج‌های Ubuntu
- دانلود فایل از لینک مستقیم
- نصب Docker
- آماده‌سازی Docker برای دریافت image
- Pull کردن Docker Image
- فعال یا غیرفعال کردن تنظیمات برنامه
- حذف کامل برنامه در صورت نیاز

---

## سیستم‌عامل‌های پیشنهادی

این نسخه برای Ubuntu Server طراحی شده است:

- Ubuntu Server 20.04
- Ubuntu Server 22.04
- Ubuntu Server 24.04

برای بهترین نتیجه، برنامه را روی سرور خام یا سروری که تنظیمات شبکه آن خیلی دستکاری نشده تست کنید.

---

## نصب برنامه

### روش اول: نصب با لینک مستقیم

اگر سرور به GitHub دسترسی دارد، از این دستور استفاده کنید:

</div>

<div dir="ltr" align="left">

```bash
curl -fsSL https://raw.githubusercontent.com/nimaro11dev/NimBridgeIR/main/install.sh | sudo bash
```

</div>

<div dir="rtl" align="right">

بعد از نصب، برنامه را اجرا کنید:

</div>

<div dir="ltr" align="left">

```bash
sudo nimbridgeir
```

</div>

<div dir="rtl" align="right">

یا از دستور کوتاه‌تر استفاده کنید:

</div>

<div dir="ltr" align="left">

```bash
sudo nbi
```

</div>

<div dir="rtl" align="right">

### روش دوم: آپلود دستی روی سرور

اگر سرور هنوز دسترسی مناسب برای دانلود از اینترنت ندارد، فایل‌های پروژه را از سیستم خودتان روی سرور آپلود کنید.

روی سیستم خودتان:

</div>

<div dir="ltr" align="left">

```bash
scp -r NimBridgeIR root@SERVER_IP:/root/
```

</div>

<div dir="rtl" align="right">

روی سرور:

</div>

<div dir="ltr" align="left">

```bash
cd /root/NimBridgeIR
sudo bash install.sh
sudo nimbridgeir
```

</div>

<div dir="rtl" align="right">

---

## اجرای اولیه

بعد از اولین اجرا:

</div>

<div dir="ltr" align="left">

```bash
sudo nimbridgeir
```

</div>

<div dir="rtl" align="right">

اگر تنظیمات دسترسی هنوز ثبت نشده باشد، برنامه همان ابتدا اطلاعات proxy را از شما می‌پرسد.

بعداً هر زمان خواستید، می‌توانید از مسیر زیر proxy را تغییر دهید:

</div>

<div dir="ltr" align="left">

```text
Settings > Reconfigure Access
```

</div>

<div dir="rtl" align="right">

---

## منوی اصلی

</div>

<div dir="ltr" align="left">

```text
1) Check Connection
2) Update Ubuntu Packages
3) Install Ubuntu Package
4) Docker Tools
5) Download File
6) Settings
0) Exit
```

</div>

<div dir="rtl" align="right">

### 1) Check Connection

وضعیت اتصال به چند منبع مهم را بررسی می‌کند؛ مثل:

- HTTPS عمومی
- Ubuntu packages
- GitHub
- Docker registry

اگر یکی از بخش‌ها Failed شد، معمولاً باید proxy را بررسی کنید یا proxy دیگری تست کنید.

### 2) Update Ubuntu Packages

برای به‌روزرسانی لیست پکیج‌های Ubuntu استفاده می‌شود.

معادل ساده‌شده این دستور است:

</div>

<div dir="ltr" align="left">

```bash
apt update
```

</div>

<div dir="rtl" align="right">

### 3) Install Ubuntu Package

با این گزینه می‌توانید یک پکیج Ubuntu نصب کنید.

مثال:

</div>

<div dir="ltr" align="left">

```text
curl
nginx
unzip
```

</div>

<div dir="rtl" align="right">

### 4) Docker Tools

بخش مخصوص نصب Docker، تست Docker و Pull کردن Imageها است.

### 5) Download File

برای دانلود فایل از لینک مستقیم استفاده می‌شود.

برنامه از شما دو چیز می‌پرسد:

</div>

<div dir="ltr" align="left">

```text
File URL
Save as
```

</div>

<div dir="rtl" align="right">

مثال:

</div>

<div dir="ltr" align="left">

```text
File URL: https://example.com/file.tar.gz
Save as: /root/file.tar.gz
```

</div>

<div dir="rtl" align="right">

### 6) Settings

برای تغییر تنظیمات ذخیره‌شده، فعال یا غیرفعال کردن برنامه و حذف برنامه استفاده می‌شود.

---

## منوی Docker Tools

</div>

<div dir="ltr" align="left">

```text
1) Install Docker
2) Check Docker Access
3) Pull Docker Image
4) Enable/Disable Docker Access
0) Back
```

</div>

<div dir="rtl" align="right">

### 1) Install Docker

Docker و ابزارهای لازم آن را نصب می‌کند.

اگر Docker از قبل نصب شده باشد، برنامه فقط تنظیمات دسترسی Docker را دوباره بررسی و آماده می‌کند.

### 2) Check Docker Access

بررسی می‌کند Docker بتواند از Docker Hub ایمیج بگیرد یا نه.

این گزینه برای تست از image سبک زیر استفاده می‌کند:

</div>

<div dir="ltr" align="left">

```text
hello-world:latest
```

</div>

<div dir="rtl" align="right">

### 3) Pull Docker Image

از شما نام image را می‌گیرد و آن را Pull می‌کند.

مثال:

</div>

<div dir="ltr" align="left">

```text
nginx:latest
postgres:17.6
remnawave/backend:2
```

</div>

<div dir="rtl" align="right">

### 4) Enable/Disable Docker Access

این گزینه هوشمند است.

اگر Docker access فعال باشد، متن گزینه به شکل زیر نمایش داده می‌شود:

</div>

<div dir="ltr" align="left">

```text
Disable Docker Access
```

</div>

<div dir="rtl" align="right">

اگر غیرفعال باشد، متن گزینه به شکل زیر نمایش داده می‌شود:

</div>

<div dir="ltr" align="left">

```text
Enable Docker Access
```

</div>

<div dir="rtl" align="right">

این گزینه Docker را حذف نمی‌کند. فقط تنظیمات دسترسی Docker را فعال یا غیرفعال می‌کند.

---

## منوی Settings

</div>

<div dir="ltr" align="left">

```text
1) Show Current Status
2) Reconfigure Access
3) Enable/Disable NimBridgeIR
4) Auto Restore on Disable
5) Reset Saved Proxy Settings
6) Uninstall NimBridgeIR
0) Back
```

</div>

<div dir="rtl" align="right">

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

</div>

<div dir="ltr" align="left">

```text
Disable NimBridgeIR
```

</div>

<div dir="rtl" align="right">

اگر غیرفعال باشد، گزینه به شکل زیر نمایش داده می‌شود:

</div>

<div dir="ltr" align="left">

```text
Enable NimBridgeIR
```

</div>

<div dir="rtl" align="right">

با Disable کردن، برنامه حذف نمی‌شود؛ فقط تنظیمات فعال آن غیرفعال می‌شود.

### 4) Auto Restore on Disable

مشخص می‌کند وقتی NimBridgeIR را غیرفعال می‌کنید، تنظیمات مرتبط به حالت قبلی برگردانده شود یا نه.

پیشنهاد معمول:

</div>

<div dir="ltr" align="left">

```text
Yes
```

</div>

<div dir="rtl" align="right">

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

</div>

<div dir="ltr" align="left">

```text
/usr/local/bin/nimbridgeir
```

</div>

<div dir="rtl" align="right">

دستور کوتاه:

</div>

<div dir="ltr" align="left">

```text
/usr/local/bin/nbi
```

</div>

<div dir="rtl" align="right">

تنظیمات برنامه:

</div>

<div dir="ltr" align="left">

```text
/etc/nimbridgeir/config.env
/etc/nimbridgeir/engine.conf
```

</div>

<div dir="rtl" align="right">

فایل‌های وضعیت و بکاپ:

</div>

<div dir="ltr" align="left">

```text
/var/lib/nimbridgeir/
```

</div>

<div dir="rtl" align="right">

لاگ برنامه:

</div>

<div dir="ltr" align="left">

```text
/var/log/nimbridgeir.log
```

</div>

<div dir="rtl" align="right">

---

## حذف دستی برنامه

اگر خواستید برنامه را دستی حذف کنید:

</div>

<div dir="ltr" align="left">

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh
```

</div>

<div dir="rtl" align="right">

حذف کامل همراه با تنظیمات، لاگ‌ها و بکاپ‌ها:

</div>

<div dir="ltr" align="left">

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh --purge
```

</div>

<div dir="rtl" align="right">

حذف بدون برگرداندن تنظیمات Docker/system:

</div>

<div dir="ltr" align="left">

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh --no-restore
```

</div>

<div dir="rtl" align="right">

---

## خطاهای رایج

### Docker pull خطای timeout می‌دهد

اول این گزینه را تست کنید:

</div>

<div dir="ltr" align="left">

```text
Docker Tools > Check Docker Access
```

</div>

<div dir="rtl" align="right">

اگر باز هم خطا گرفتید، proxy را از بخش Settings دوباره وارد کنید یا proxy دیگری تست کنید.

### apt update کار نمی‌کند

از منوی اصلی این گزینه را تست کنید:

</div>

<div dir="ltr" align="left">

```text
Check Connection
```

</div>

<div dir="rtl" align="right">

اگر Ubuntu packages یا General HTTPS خطا داشت، معمولاً مشکل از proxy یا اتصال سرور است.

### proxy را اشتباه وارد کردم

از این مسیر دوباره اطلاعات را وارد کنید:

</div>

<div dir="ltr" align="left">

```text
Settings > Reconfigure Access
```

</div>

<div dir="rtl" align="right">

---

## نکته مهم

NimBridgeIR برای کار کردن به یک HTTP Proxy نیاز دارد. اگر proxy قطع باشد، کند باشد یا به Docker Hub و GitHub دسترسی مناسب نداشته باشد، بعضی گزینه‌ها ممکن است با خطا روبه‌رو شوند.

</div>
