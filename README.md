# Kedai Kopi Mbah Buyut - Sistem Pemesanan QR Code & Kasir Berbasis Web

Sistem informasi pemesanan mandiri berbasis QR Code yang terintegrasi langsung dengan aplikasi kasir (Point of Sale) dan manajemen toko untuk Kedai Kopi Mbah Buyut. Sistem ini dirancang untuk mengatasi kesalahan pencatatan transaksi manual, mempercepat alur pelayanan, serta menyediakan laporan keuangan yang akurat secara _real-time_.

---

## Fitur Utama

Sistem memiliki tiga tingkatan hak akses pengguna (_Multi-user Role_):

### 1. Pelanggan (Self-Service Order)

- **Pemesanan QR Code**: Memindai QR Code di meja untuk langsung membuka katalog menu digital tanpa perlu antre di kasir.
- **Kustomisasi Pesanan**: Memilih varian menu (ukuran, level manis, topping), menentukan jumlah pesanan, dan menambahkan catatan khusus.
- **Keranjang & Checkout**: Memilih tipe pesanan (_Dine In_ / _Take Away_) dan metode pembayaran (Tunai / Non-Tunai / QRIS).
- **Sistem Loyalitas Koin**: Mengumpulkan saldo koin dari transaksi dan menukarkannya sebagai potongan harga belanja.
- **Pelacakan Status & Nota**: Memantau status pesanan secara _real-time_ serta mengunduh nota pembayaran digital.

### 2. Kasir (POS / Point of Sale)

- **Manajemen Pesanan Masuk**: Notifikasi pesanan masuk dari meja pelanggan dengan opsi konfirmasi atau tolak pesanan.
- **Pemesanan Manual**: Kemampuan input transaksi manual langsung di kasir untuk pelanggan yang memesan secara konvensional.
- **Kalkulasi & Nota Otomatis**: Perhitungan total belanja otomatis dan pencetakan/pengiriman bukti transaksi.
- **Riwayat Transaksi**: Rekapitulasi transaksi harian yang telah diproses oleh kasir yang bertugas.

### 3. Administrator (Back Office & Manajemen)

- **Dashboard Statistik**: Pemantauan omzet penjualan, tren menu terlaris, dan volume transaksi _real-time_.
- **Manajemen Menu & Varian**: Tambah, ubah, dan hapus kategori hidangan, menu utama, varian, serta penyesuaian harga.
- **Manajemen Pengguna**: Pengelolaan hak akses akun admin, kasir, dan verifikasi akun pelanggan.
- **Manajemen Loyalitas**: Konfigurasi nilai tukar serta riwayat mutasi koin pelanggan.
- **Pengaturan Toko**: Konfigurasi jadwal jam operasional kedai dan penutupan otomatis di luar jam kerja.
- **Ekspor Laporan**: Unduh laporan transaksi dan rekap penjualan dalam format **PDF** dan **Excel**.

---

## Teknologi yang Digunakan

- **Backend Framework**: PHP 8.2+ / Laravel 11
- **Database**: MySQL 8.0 / MariaDB
- **Frontend**: Blade Templating, Tailwind CSS, Alpine.js / JavaScript
- **Library Pendukung**:
  - `simplesoftwareio/simple-qrcode` (Generator QR Code)
  - `barryvdh/laravel-dompdf` (Cetak Laporan PDF)
  - `maatwebsite/excel` (Ekspor Laporan Excel)

---

## Persyaratan Sistem

Pastikan perangkat telah terpasang:

- PHP >= 8.2 (ekstensi: `pdo_mysql`, `mbstring`, `openssl`, `gd`, `bcmath`)
- Composer >= 2.x
- Node.js >= 18.x & NPM
- MySQL / MariaDB Server

---

## Panduan Instalasi

Jalankan perintah berikut di terminal:

1. **Clone repositori**

   ```bash
   git clone [https://github.com/MDaffaAthallahA/kedai-kopi-mbah-buyut-.git](https://github.com/MDaffaAthallahA/kedai-kopi-mbah-buyut-.git)
   cd kedai-kopi-mbah-buyut

   ```

2. **Instal dependensi Backend (Composer)**
   composer install

3. **Instal dependensi Frontend (NPM)**
   npm install

4. **Konfigurasi Environment**
   Salin berkas .env.example ke .env:
   cp .env.example .env
   php artisan key:generate

5. **Pengaturan Database**
   Sesuaikan konfigurasi database pada berkas .env:
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=kedai_kopi_mbah_buyut
   DB_USERNAME=root
   DB_PASSWORD=

6. **Migrasi Basis Data & Seeder**
   Jalankan migrasi tabel dan data awal:
   php artisan migrate --seed

7. **Kompilasi Aset Frontend**
   npm run build

   # Atau untuk mode pengembangan:

   npm run dev

8. **Jalankan Server Lokal**
   php artisan serve
   Aplikasi dapat diakses melalui peramban di http://127.0.0.1:8000.

Alur Pemesanan QR Code

````markdown
# Kedai Kopi Mbah Buyut - Sistem Pemesanan QR Code & Kasir Berbasis Web

Sistem informasi pemesanan mandiri berbasis QR Code yang terintegrasi langsung dengan aplikasi kasir (Point of Sale) dan manajemen toko untuk Kedai Kopi Mbah Buyut. Sistem ini dirancang untuk mengatasi kesalahan pencatatan transaksi manual, mempercepat alur pelayanan, serta menyediakan laporan keuangan yang akurat secara _real-time_.

---

## Fitur Utama

Sistem memiliki tiga tingkatan hak akses pengguna (_Multi-user Role_):

### 1. Pelanggan (Self-Service Order)

- **Pemesanan QR Code**: Memindai QR Code di meja untuk langsung membuka katalog menu digital tanpa perlu antre di kasir.
- **Kustomisasi Pesanan**: Memilih varian menu (ukuran, level manis, topping), menentukan jumlah pesanan, dan menambahkan catatan khusus.
- **Keranjang & Checkout**: Memilih tipe pesanan (_Dine In_ / _Take Away_) dan metode pembayaran (Tunai / Non-Tunai / QRIS).
- **Sistem Loyalitas Koin**: Mengumpulkan saldo koin dari transaksi dan menukarkannya sebagai potongan harga belanja.
- **Pelacakan Status & Nota**: Memantau status pesanan secara _real-time_ serta mengunduh nota pembayaran digital.

### 2. Kasir (POS / Point of Sale)

- **Manajemen Pesanan Masuk**: Notifikasi pesanan masuk dari meja pelanggan dengan opsi konfirmasi atau tolak pesanan.
- **Pemesanan Manual**: Kemampuan input transaksi manual langsung di kasir untuk pelanggan yang memesan secara konvensional.
- **Kalkulasi & Nota Otomatis**: Perhitungan total belanja otomatis dan pencetakan/pengiriman bukti transaksi.
- **Riwayat Transaksi**: Rekapitulasi transaksi harian yang telah diproses oleh kasir yang bertugas.

### 3. Administrator (Back Office & Manajemen)

- **Dashboard Statistik**: Pemantauan omzet penjualan, tren menu terlaris, dan volume transaksi _real-time_.
- **Manajemen Menu & Varian**: Tambah, ubah, dan hapus kategori hidangan, menu utama, varian, serta penyesuaian harga.
- **Manajemen Pengguna**: Pengelolaan hak akses akun admin, kasir, dan verifikasi akun pelanggan.
- **Manajemen Loyalitas**: Konfigurasi nilai tukar serta riwayat mutasi koin pelanggan.
- **Pengaturan Toko**: Konfigurasi jadwal jam operasional kedai dan penutupan otomatis di luar jam kerja.
- **Ekspor Laporan**: Unduh laporan transaksi dan rekap penjualan dalam format **PDF** dan **Excel**.

---

## Teknologi yang Digunakan

- **Backend Framework**: PHP 8.2+ / Laravel 11
- **Database**: MySQL 8.0 / MariaDB
- **Frontend**: Blade Templating, Tailwind CSS, Alpine.js / JavaScript
- **Library Pendukung**:
  - `simplesoftwareio/simple-qrcode` (Generator QR Code)
  - `barryvdh/laravel-dompdf` (Cetak Laporan PDF)
  - `maatwebsite/excel` (Ekspor Laporan Excel)

---

## Persyaratan Sistem

Pastikan perangkat telah terpasang:

- PHP >= 8.2 (ekstensi: `pdo_mysql`, `mbstring`, `openssl`, `gd`, `bcmath`)
- Composer >= 2.x
- Node.js >= 18.x & NPM
- MySQL / MariaDB Server

---

## Panduan Instalasi

Jalankan perintah berikut di terminal:

1. **Clone repositori**
   ```bash
   git clone [https://github.com/username/kedai-kopi-mbah-buyut.git](https://github.com/username/kedai-kopi-mbah-buyut.git)
   cd kedai-kopi-mbah-buyut
   ```
````

2. **Instal dependensi Backend (Composer)**

```bash
composer install

```

3. **Instal dependensi Frontend (NPM)**

```bash
npm install

```

4. **Konfigurasi Environment**
   Salin berkas `.env.example` ke `.env`:

```bash
cp .env.example .env
php artisan key:generate

```

5. **Pengaturan Database**
   Sesuaikan konfigurasi database pada berkas `.env`:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=kedai_kopi_mbah_buyut
DB_USERNAME=root
DB_PASSWORD=

```

6. **Migrasi Basis Data & Seeder**
   Jalankan migrasi tabel dan data awal:

```bash
php artisan migrate --seed

```

7. **Kompilasi Aset Frontend**

```bash
npm run build
# Atau untuk mode pengembangan:
npm run dev

```

8. **Jalankan Server Lokal**

```bash
php artisan serve

```

Aplikasi dapat diakses melalui peramban di `http://127.0.0.1:8000`.

---

## Akun Bawaan (Default Seeder)

| Role          | Email                     | Password   |
| ------------- | ------------------------- | ---------- |
| **Admin**     | `admin@mbahbuyut.com`     | `password` |
| **Kasir**     | `kasir@mbahbuyut.com`     | `password` |
| **Pelanggan** | `pelanggan@mbahbuyut.com` | `password` |

---

## Alur Pemesanan QR Code

```
Pelanggan Pindai QR di Meja
       │
       ▼
Pilih Menu, Varian & Catatan ──► Keranjang
       │
       ▼
Checkout (Tukar Koin / Pilih Pembayaran)
       │
       ▼
Pesanan Terkirim ke Kasir
       │
       ▼
Kasir Konfirmasi Pesanan ──► Dapur Menyiapkan Pesanan
       │
       ▼
Pesanan Selesai & Nota Diterbitkan

```
