-- Buat Database
CREATE DATABASE IF NOT EXISTS kedai_kopi_mbah_buyut;
USE kedai_kopi_mbah_buyut;

-- 1. Tabel Role Pengguna
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_role VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. Tabel Pengguna (Admin, Kasir, Pelanggan)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT NOT NULL,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    no_telepon VARCHAR(20) NULL,
    password VARCHAR(255) NOT NULL,
    saldo_coin INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 3. Tabel Meja & QR Code
CREATE TABLE meja (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomor_meja VARCHAR(10) NOT NULL UNIQUE,
    qr_token VARCHAR(255) NOT NULL UNIQUE,
    status_meja ENUM('tersedia', 'terisi') DEFAULT 'tersedia',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 4. Tabel Jam Operasional Kedai
CREATE TABLE jam_operasional (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hari ENUM('Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu') NOT NULL UNIQUE,
    jam_buka TIME NOT NULL,
    jam_tutup TIME NOT NULL,
    is_buka BOOLEAN DEFAULT TRUE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 5. Tabel Kategori Menu
CREATE TABLE kategori_menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100) NOT NULL UNIQUE,
    deskripsi TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 6. Tabel Menu
CREATE TABLE menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kategori_id INT NOT NULL,
    nama_menu VARCHAR(150) NOT NULL,
    deskripsi TEXT NULL,
    harga_dasar DECIMAL(12, 2) NOT NULL,
    gambar VARCHAR(255) NULL,
    is_aktif BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (kategori_id) REFERENCES kategori_menu(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 7. Tabel Varian Menu
CREATE TABLE varian_menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    menu_id INT NOT NULL,
    nama_varian VARCHAR(100) NOT NULL,
    harga_tambahan DECIMAL(12, 2) DEFAULT 0.00,
    is_aktif BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (menu_id) REFERENCES menu(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 8. Tabel Pesanan
CREATE TABLE pesanan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode_pesanan VARCHAR(50) NOT NULL UNIQUE,
    user_id INT NULL COMMENT 'ID Pelanggan jika login, NULL jika pesanan manual kasir',
    meja_id INT NULL COMMENT 'NULL jika take away',
    kasir_id INT NULL COMMENT 'User ID kasir yang memvalidasi pesanan',
    jenis_pesanan ENUM('dine_in', 'take_away') NOT NULL DEFAULT 'dine_in',
    status_pesanan ENUM('menunggu_konfirmasi', 'dikonfirmasi', 'diproses', 'selesai', 'ditolak') DEFAULT 'menunggu_konfirmasi',
    catatan_pesanan TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (meja_id) REFERENCES meja(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (kasir_id) REFERENCES users(id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 9. Tabel Detail Pesanan
CREATE TABLE detail_pesanan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pesanan_id INT NOT NULL,
    menu_id INT NOT NULL,
    varian_id INT NULL,
    jumlah INT NOT NULL CHECK (jumlah > 0),
    harga_satuan DECIMAL(12, 2) NOT NULL,
    subtotal DECIMAL(12, 2) NOT NULL,
    catatan_item VARCHAR(255) NULL,
    FOREIGN KEY (pesanan_id) REFERENCES pesanan(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (menu_id) REFERENCES menu(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (varian_id) REFERENCES varian_menu(id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 10. Tabel Transaksi / Pembayaran
CREATE TABLE transaksi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode_transaksi VARCHAR(50) NOT NULL UNIQUE,
    pesanan_id INT NOT NULL UNIQUE,
    total_kotor DECIMAL(12, 2) NOT NULL,
    coin_digunakan INT DEFAULT 0,
    potongan_coin DECIMAL(12, 2) DEFAULT 0.00,
    total_bayar DECIMAL(12, 2) NOT NULL,
    metode_pembayaran ENUM('tunai', 'qris', 'transfer') NOT NULL,
    status_pembayaran ENUM('pending', 'lunas', 'batal') DEFAULT 'pending',
    waktu_transaksi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pesanan_id) REFERENCES pesanan(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 11. Tabel Riwayat Coin Loyalitas
CREATE TABLE riwayat_coin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    transaksi_id INT NULL,
    jumlah_coin INT NOT NULL,
    tipe_mutasi ENUM('tambah', 'potong') NOT NULL,
    keterangan VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (transaksi_id) REFERENCES transaksi(id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;