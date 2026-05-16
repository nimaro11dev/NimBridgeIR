<h1 align="center">NimBridgeIR</h1>

<p align="center" dir="rtl">
  ابزار ساده برای استفاده راحت‌تر از Ubuntu Server روی سرورهای داخل ایران
</p>

<p align="center" dir="rtl">
  ساخته‌شده توسط <strong>nimaro11 dev</strong>
</p>

---

<h2 dir="rtl" align="right">❤️ حمایت از پروژه</h2>

<p dir="rtl" align="right">
اگر NimBridgeIR برای شما مفید بود و دوست داشتید از توسعه و نگهداری آن حمایت کنید، می‌توانید از طریق آدرس‌های زیر دونیت کنید:
</p>

```text
USDT TRC20: TZEkPk6pmxRPFsAXWe7jSqfmwFeEYcxRYq
USDT BEP20: 0x66F98e2980906503f0B4a5E9d14A5BfD7d2aB008
TON: UQDN_FNnzZHr7qks6XRV1k9JKHFfPZ2frq_oymluJksa2MRe
```

<p dir="rtl" align="right">
راه ارتباطی:
<a href="https://t.me/nimaro11dev">@nimaro11dev</a>
</p>

---

<h2 dir="rtl" align="right">NimBridgeIR چیست؟</h2>

<p dir="rtl" align="right">
<strong>NimBridgeIR</strong> یک ابزار ساده برای سرورهای Ubuntu داخل ایران است؛ مخصوصاً سرورهایی که دسترسی مستقیم یا پایدار به اینترنت بین‌الملل ندارند و در کارهای اولیه مثل آپدیت، نصب پکیج، دانلود فایل، نصب Docker یا Pull کردن Docker Imageها به مشکل می‌خورند.
</p>

<p dir="rtl" align="right">
هدف این برنامه این است که کارهای روزمره و ضروری سرور را برای کاربر ساده‌تر کند. کافی است یک HTTP Proxy در برنامه ثبت کنید؛ بعد از آن می‌توانید از منوی ساده برنامه برای انجام کارهای اصلی استفاده کنید.
</p>

<blockquote dir="rtl">
<strong>نکته مهم:</strong>
NimBridgeIR خودش Proxy ارائه نمی‌کند. برای استفاده از برنامه باید یک <strong>HTTP Proxy</strong> فعال و قابل استفاده داشته باشید.
</blockquote>

---

<h2 dir="rtl" align="right">این ابزار برای چه کسانی مناسب است؟</h2>

<ul dir="rtl" align="right">
  <li>کسانی که سرور Ubuntu داخل ایران دارند.</li>
  <li>کسانی که روی سرورشان به GitHub، Docker Hub یا Repositoryهای خارجی دسترسی ندارند.</li>
  <li>کسانی که می‌خواهند بدون درگیر شدن با تنظیمات پیچیده، کارهای اولیه سرور را انجام دهند.</li>
  <li>کسانی که تازه با سرور لینوکسی کار می‌کنند و یک منوی ساده می‌خواهند.</li>
</ul>

---

<h2 dir="rtl" align="right">NimBridgeIR چه کارهایی انجام می‌دهد؟</h2>

<ul dir="rtl" align="right">
  <li>دریافت و ذخیره اطلاعات HTTP Proxy</li>
  <li>بررسی اتصال به منابع مهم</li>
  <li>آپدیت لیست پکیج‌های Ubuntu</li>
  <li>نصب پکیج‌های Ubuntu</li>
  <li>دانلود فایل از لینک مستقیم</li>
  <li>نصب Docker</li>
  <li>آماده‌سازی Docker برای دریافت Image</li>
  <li>Pull کردن Docker Image</li>
  <li>فعال یا غیرفعال کردن تنظیمات برنامه</li>
  <li>حذف برنامه و پاک‌سازی تنظیمات در صورت نیاز</li>
</ul>

---

<h2 dir="rtl" align="right">پیش‌نیاز مهم: HTTP Proxy</h2>

<p dir="rtl" align="right">
در اولین اجرای برنامه، اطلاعات Proxy از شما پرسیده می‌شود:
</p>

```text
Proxy host/IP
Proxy port
Username (optional)
Password (optional)
```

<p dir="rtl" align="right">
اگر Proxy شما نام کاربری و رمز عبور ندارد، قسمت Username را خالی بگذارید. برنامه بعد از ثبت اطلاعات، از همان تنظیمات برای انجام کارهایی مثل آپدیت Ubuntu، نصب پکیج، دانلود فایل و کار با Docker استفاده می‌کند.
</p>

---

<h2 dir="rtl" align="right">سیستم‌عامل‌های پیشنهادی</h2>

<p dir="rtl" align="right">
این نسخه برای Ubuntu Server طراحی شده است:
</p>

<ul dir="rtl" align="right">
  <li>Ubuntu Server 20.04</li>
  <li>Ubuntu Server 22.04</li>
  <li>Ubuntu Server 24.04</li>
</ul>

<p dir="rtl" align="right">
برای بهترین نتیجه، برنامه را روی سرور خام یا سروری که تنظیمات شبکه آن خیلی دستکاری نشده تست کنید.
</p>

---

<h2 dir="rtl" align="right">نصب برنامه</h2>

<h3 dir="rtl" align="right">روش اول: نصب مستقیم از GitHub</h3>

<p dir="rtl" align="right">
اگر سرور به GitHub دسترسی دارد، دستور زیر را اجرا کنید:
</p>

```bash
curl -fsSL https://raw.githubusercontent.com/nimaro11dev/NimBridgeIR/main/install.sh | sudo bash
```

<p dir="rtl" align="right">
بعد از نصب، برنامه را اجرا کنید:
</p>

```bash
sudo nimbridgeir
```

<p dir="rtl" align="right">
یا از دستور کوتاه‌تر استفاده کنید:
</p>

```bash
sudo nbi
```

<h3 dir="rtl" align="right">روش دوم: آپلود دستی روی سرور</h3>

<p dir="rtl" align="right">
اگر سرور هنوز دسترسی مناسب برای دانلود از اینترنت ندارد، فایل‌های پروژه را از سیستم خودتان روی سرور آپلود کنید.
</p>

<p dir="rtl" align="right">
روی سیستم خودتان:
</p>

```bash
scp -r NimBridgeIR root@SERVER_IP:/root/
```

<p dir="rtl" align="right">
روی سرور:
</p>

```bash
cd /root/NimBridgeIR
sudo bash install.sh
sudo nimbridgeir
```

---

<h2 dir="rtl" align="right">اجرای اولیه</h2>

<p dir="rtl" align="right">
بعد از اولین اجرا:
</p>

```bash
sudo nimbridgeir
```

<p dir="rtl" align="right">
اگر تنظیمات دسترسی هنوز ثبت نشده باشد، برنامه همان ابتدا اطلاعات HTTP Proxy را از شما می‌پرسد. بعداً هر زمان خواستید، می‌توانید از مسیر زیر Proxy را تغییر دهید:
</p>

```text
Settings > Reconfigure Access
```

---

<h2 dir="rtl" align="right">منوی اصلی برنامه</h2>

```text
1) Check Connection
2) Update Ubuntu Packages
3) Install Ubuntu Package
4) Docker Tools
5) Download File
6) Settings
0) Exit
```

<h3 dir="rtl" align="right">1) Check Connection</h3>

<p dir="rtl" align="right">
وضعیت اتصال به چند منبع مهم را بررسی می‌کند؛ مثل HTTPS عمومی، Ubuntu Packages، GitHub و Docker Registry. اگر یکی از بخش‌ها Failed شد، معمولاً باید اطلاعات Proxy را بررسی کنید یا Proxy دیگری تست کنید.
</p>

<h3 dir="rtl" align="right">2) Update Ubuntu Packages</h3>

<p dir="rtl" align="right">
برای به‌روزرسانی لیست پکیج‌های Ubuntu استفاده می‌شود. این گزینه کاربر را از اجرای دستی دستورهای پیچیده بی‌نیاز می‌کند.
</p>

<h3 dir="rtl" align="right">3) Install Ubuntu Package</h3>

<p dir="rtl" align="right">
با این گزینه می‌توانید یک پکیج Ubuntu نصب کنید. مثال:
</p>

```text
curl
nginx
unzip
```

<h3 dir="rtl" align="right">4) Docker Tools</h3>

<p dir="rtl" align="right">
بخش مخصوص نصب Docker، تست دسترسی Docker و Pull کردن Imageها است.
</p>

<h3 dir="rtl" align="right">5) Download File</h3>

<p dir="rtl" align="right">
برای دانلود فایل از لینک مستقیم استفاده می‌شود. برنامه از شما آدرس فایل و مسیر ذخیره‌سازی را می‌پرسد.
</p>

```text
File URL: https://example.com/file.tar.gz
Save as: /root/file.tar.gz
```

<h3 dir="rtl" align="right">6) Settings</h3>

<p dir="rtl" align="right">
برای تغییر تنظیمات ذخیره‌شده، فعال یا غیرفعال کردن برنامه و حذف برنامه استفاده می‌شود.
</p>

---

<h2 dir="rtl" align="right">منوی Docker Tools</h2>

```text
1) Install Docker
2) Check Docker Access
3) Pull Docker Image
4) Enable/Disable Docker Access
0) Back
```

<h3 dir="rtl" align="right">1) Install Docker</h3>

<p dir="rtl" align="right">
Docker و ابزارهای لازم آن را نصب می‌کند. اگر Docker از قبل نصب شده باشد، برنامه فقط تنظیمات دسترسی Docker را بررسی و آماده می‌کند.
</p>

<h3 dir="rtl" align="right">2) Check Docker Access</h3>

<p dir="rtl" align="right">
بررسی می‌کند Docker بتواند از Docker Hub ایمیج دریافت کند یا نه. این گزینه برای تست از image سبک زیر استفاده می‌کند:
</p>

```text
hello-world:latest
```

<h3 dir="rtl" align="right">3) Pull Docker Image</h3>

<p dir="rtl" align="right">
از شما نام Image را می‌گیرد و آن را Pull می‌کند. مثال:
</p>

```text
nginx:latest
postgres:17.6
remnawave/backend:2
```

<h3 dir="rtl" align="right">4) Enable/Disable Docker Access</h3>

<p dir="rtl" align="right">
این گزینه هوشمند است. اگر Docker Access فعال باشد، گزینه برای غیرفعال‌سازی نمایش داده می‌شود. اگر غیرفعال باشد، گزینه برای فعال‌سازی نمایش داده می‌شود.
</p>

<p dir="rtl" align="right">
این گزینه Docker را حذف نمی‌کند؛ فقط تنظیمات دسترسی Docker را فعال یا غیرفعال می‌کند.
</p>

---

<h2 dir="rtl" align="right">منوی Settings</h2>

```text
1) Show Current Status
2) Reconfigure Access
3) Enable/Disable NimBridgeIR
4) Auto Restore on Disable
5) Reset Saved Proxy Settings
6) Uninstall NimBridgeIR
0) Back
```

<h3 dir="rtl" align="right">1) Show Current Status</h3>

<p dir="rtl" align="right">
وضعیت فعلی برنامه را نشان می‌دهد؛ مثل فعال بودن برنامه، Proxy ذخیره‌شده، آماده بودن ابزارهای لازم، نصب بودن Docker، فعال بودن Docker Access و وضعیت Auto Restore.
</p>

<h3 dir="rtl" align="right">2) Reconfigure Access</h3>

<p dir="rtl" align="right">
اگر Proxy شما عوض شد یا اطلاعات را اشتباه وارد کردید، از این گزینه استفاده کنید.
</p>

<h3 dir="rtl" align="right">3) Enable/Disable NimBridgeIR</h3>

<p dir="rtl" align="right">
این گزینه هوشمند است. اگر NimBridgeIR فعال باشد، گزینه برای غیرفعال‌سازی نمایش داده می‌شود. اگر غیرفعال باشد، گزینه برای فعال‌سازی نمایش داده می‌شود.
</p>

<p dir="rtl" align="right">
با Disable کردن، برنامه حذف نمی‌شود؛ فقط تنظیمات فعال آن غیرفعال می‌شود.
</p>

<h3 dir="rtl" align="right">4) Auto Restore on Disable</h3>

<p dir="rtl" align="right">
مشخص می‌کند وقتی NimBridgeIR را غیرفعال می‌کنید، تنظیمات مرتبط به حالت قبلی برگردانده شود یا نه. پیشنهاد معمول این است که این گزینه فعال باشد.
</p>

<h3 dir="rtl" align="right">5) Reset Saved Proxy Settings</h3>

<p dir="rtl" align="right">
اطلاعات Proxy ذخیره‌شده را پاک می‌کند. این گزینه Docker را حذف نمی‌کند و تنظیمات Docker را تغییر نمی‌دهد.
</p>

<h3 dir="rtl" align="right">6) Uninstall NimBridgeIR</h3>

<p dir="rtl" align="right">
برنامه را از سرور حذف می‌کند. در زمان حذف، برنامه از شما می‌پرسد که آیا تنظیمات مرتبط برگردانده شوند و آیا فایل‌های تنظیمات، لاگ‌ها و بکاپ‌ها هم حذف شوند یا نه.
</p>

---

<h2 dir="rtl" align="right">مسیرهای نصب و تنظیمات</h2>

<p dir="rtl" align="right">دستور اصلی:</p>

```text
/usr/local/bin/nimbridgeir
```

<p dir="rtl" align="right">دستور کوتاه:</p>

```text
/usr/local/bin/nbi
```

<p dir="rtl" align="right">تنظیمات برنامه:</p>

```text
/etc/nimbridgeir/config.env
/etc/nimbridgeir/engine.conf
```

<p dir="rtl" align="right">فایل‌های وضعیت و بکاپ:</p>

```text
/var/lib/nimbridgeir/
```

<p dir="rtl" align="right">لاگ برنامه:</p>

```text
/var/log/nimbridgeir.log
```

---

<h2 dir="rtl" align="right">حذف دستی برنامه</h2>

<p dir="rtl" align="right">
اگر خواستید برنامه را دستی حذف کنید:
</p>

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh
```

<p dir="rtl" align="right">
حذف کامل همراه با تنظیمات، لاگ‌ها و بکاپ‌ها:
</p>

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh --purge
```

<p dir="rtl" align="right">
حذف بدون برگرداندن تنظیمات Docker/system:
</p>

```bash
sudo bash /usr/local/lib/nimbridgeir/uninstall.sh --no-restore
```

---

<h2 dir="rtl" align="right">خطاهای رایج</h2>

<h3 dir="rtl" align="right">Docker pull خطای timeout می‌دهد</h3>

<p dir="rtl" align="right">
اول این گزینه را تست کنید:
</p>

```text
Docker Tools > Check Docker Access
```

<p dir="rtl" align="right">
اگر باز هم خطا گرفتید، Proxy را از بخش Settings دوباره وارد کنید یا Proxy دیگری تست کنید.
</p>

<h3 dir="rtl" align="right">apt update کار نمی‌کند</h3>

<p dir="rtl" align="right">
از منوی اصلی این گزینه را تست کنید:
</p>

```text
Check Connection
```

<p dir="rtl" align="right">
اگر Ubuntu Packages یا General HTTPS خطا داشت، معمولاً مشکل از Proxy یا اتصال سرور است.
</p>

<h3 dir="rtl" align="right">Proxy را اشتباه وارد کردم</h3>

<p dir="rtl" align="right">
از این مسیر دوباره اطلاعات را وارد کنید:
</p>

```text
Settings > Reconfigure Access
```

---

<h2 dir="rtl" align="right">نکات مهم</h2>

<ul dir="rtl" align="right">
  <li>این پروژه مخصوص سرورهای Ubuntu داخل ایران است که دسترسی مستقیم یا پایدار به اینترنت بین‌الملل ندارند.</li>
  <li>برای استفاده از NimBridgeIR باید یک HTTP Proxy فعال داشته باشید.</li>
  <li>اگر Proxy قطع باشد، کند باشد یا به Docker Hub و GitHub دسترسی مناسب نداشته باشد، بعضی گزینه‌ها ممکن است با خطا روبه‌رو شوند.</li>
  <li>برای اجرای برنامه معمولاً باید از sudo استفاده کنید.</li>
</ul>

---

<h2 dir="rtl" align="right">ارتباط و حمایت</h2>

<p dir="rtl" align="right">
برای ارتباط، گزارش مشکل یا دنبال کردن بروزرسانی‌ها:
<a href="https://t.me/nimaro11dev">@nimaro11dev</a>
</p>

<p dir="rtl" align="right">
اگر این ابزار برای شما مفید بود، حمایت مالی شما باعث ادامه توسعه و نگهداری بهتر پروژه می‌شود:
</p>

```text
USDT TRC20: TZEkPk6pmxRPFsAXWe7jSqfmwFeEYcxRYq
USDT BEP20: 0x66F98e2980906503f0B4a5E9d14A5BfD7d2aB008
TON: UQDN_FNnzZHr7qks6XRV1k9JKHFfPZ2frq_oymluJksa2MRe
```

---

<p align="center" dir="rtl">
  NimBridgeIR — ساده‌تر کردن کار با Ubuntu Server برای سرورهای داخل ایران
</p>
