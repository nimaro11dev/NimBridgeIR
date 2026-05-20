# Changelog

## v1.1.0

### Added

- پشتیبانی از HTTP Proxy با ورودی جداگانه host، port و اطلاعات ورود اختیاری
- پشتیبانی از SOCKS Proxy
- پشتیبانی از VLESS Link
- پشتیبانی از VMess Link
- اضافه شدن local HTTP bridge با sing-box برای ورودی‌های SOCKS، VLESS و VMess
- انتخاب random port برای bridge داخلی و ذخیره آن در تنظیمات
- نصب bundled sing-box از داخل فایل‌های Release
- fallback دانلود sing-box برای نصب آنلاین
- اضافه شدن منوی VPN Panel Installers
- اضافه شدن نصب‌کننده 3x-ui Sanaei
- نمایش ۱۵ نسخه آخر منتشرشده 3x-ui برای انتخاب نسخه نصب
- اجرای installer رسمی 3x-ui از مسیر دسترسی NimBridgeIR

### Improved

- بهبود رابط کاربری ثبت access با گزینه‌های HTTP، SOCKS، VLESS و VMess
- بهبود سازگاری Docker با ورودی‌های غیر HTTP
- بهبود مدیریت وضعیت bridge داخلی
- بهبود rollback تنظیمات در صورت خطا هنگام ثبت access جدید
- بهبود نصب روی سرورهای بدون دسترسی مستقیم به اینترنت بین‌الملل

## v1.0.0

- انتشار اولین نسخه عمومی NimBridgeIR
- تنظیم ساده دسترسی با HTTP Proxy
- بررسی اتصال به منابع مهم
- آپدیت لیست پکیج‌های Ubuntu
- نصب پکیج‌های Ubuntu
- دانلود فایل از لینک مستقیم
- نصب و آماده‌سازی Docker
- تست دسترسی Docker
- Pull کردن Docker Image
- تنظیمات فعال/غیرفعال برنامه
- حذف برنامه و پاک‌سازی تنظیمات در صورت نیاز
