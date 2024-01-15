-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 08 Jan 2024 pada 15.15
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gudangkita`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `KodeBarang` varchar(30) NOT NULL,
  `NamaBarang` varchar(50) NOT NULL,
  `JumlahStok` double(15,2) DEFAULT NULL,
  `Harga` double(15,2) DEFAULT NULL,
  `Satuan` varchar(15) NOT NULL,
  `TglAuditTerakhir` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`KodeBarang`, `NamaBarang`, `JumlahStok`, `Harga`, `Satuan`, `TglAuditTerakhir`) VALUES
('002', 'Minuman', 100.00, 10000.00, '20', '2023-12-13 00:00:00'),
('03', 'Elektronik', 200.00, 2000000.00, '20', '2023-12-18 00:00:00'),
('123', 'makanan', 100.00, 20000.00, '20', '2023-12-13 00:00:00'),
('9875', 'Handphone', 110.00, 5000000.00, 'stok', '2024-01-08 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangdigudang`
--

CREATE TABLE IF NOT EXISTS `barangdigudang` (
`IdTransaksi` int(11) NOT NULL,
  `WaktuTransaksi` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusTransaksi` enum('Masuk','Keluar') NOT NULL,
  `Jumlah` double(15,2) DEFAULT NULL,
  `Keterangan` text,
  `KodeGudang` int(11) NOT NULL,
  `KodeBarang` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barangdigudang`
--

INSERT INTO `barangdigudang` (`IdTransaksi`, `WaktuTransaksi`, `StatusTransaksi`, `Jumlah`, `Keterangan`, `KodeGudang`, `KodeBarang`) VALUES
(3, '2023-12-06 00:00:00', 'Keluar', 10.00, 'beli', 2, '123'),
(4, '2024-01-08 00:00:00', 'Keluar', 10.00, 'dibeli', 3, '002'),
(5, '2024-01-16 00:00:00', 'Keluar', 100.00, 'dijual', 2, '03'),
(6, '2024-01-31 00:00:00', 'Masuk', 10.00, 'Barang masuk', 2, '9875'),
(7, '2024-01-08 00:00:00', 'Masuk', 100.00, 'barang masuk', 1, '002'),
(8, '2024-01-08 00:00:00', 'Masuk', 200.00, 'barang masuk\r\n', 3, '03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gudang`
--

CREATE TABLE IF NOT EXISTS `gudang` (
`KodeGudang` int(11) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `gudang`
--

INSERT INTO `gudang` (`KodeGudang`, `Alamat`) VALUES
(1, 'kompi'),
(2, 'Kandang'),
(3, 'Sawah lebar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `KodeLogin` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `NamaPengguna` varchar(50) NOT NULL,
  `Alamat` text,
  `waktudaftar` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
 ADD PRIMARY KEY (`KodeBarang`);

--
-- Indexes for table `barangdigudang`
--
ALTER TABLE `barangdigudang`
 ADD PRIMARY KEY (`IdTransaksi`), ADD KEY `KodeGudang` (`KodeGudang`), ADD KEY `KodeBarang` (`KodeBarang`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
 ADD PRIMARY KEY (`KodeGudang`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
 ADD PRIMARY KEY (`KodeLogin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barangdigudang`
--
ALTER TABLE `barangdigudang`
MODIFY `IdTransaksi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
MODIFY `KodeGudang` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barangdigudang`
--
ALTER TABLE `barangdigudang`
ADD CONSTRAINT `barangdigudang_ibfk_1` FOREIGN KEY (`KodeGudang`) REFERENCES `gudang` (`KodeGudang`),
ADD CONSTRAINT `barangdigudang_ibfk_2` FOREIGN KEY (`KodeBarang`) REFERENCES `barang` (`KodeBarang`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
