-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2024 at 06:22 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudangkita`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `KodeBarang` varchar(30) NOT NULL,
  `NamaBarang` varchar(50) NOT NULL,
  `JumlahStok` double(15,2) DEFAULT NULL,
  `Harga` double(15,2) DEFAULT NULL,
  `Satuan` varchar(15) NOT NULL,
  `TglAuditTerakhir` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`KodeBarang`, `NamaBarang`, `JumlahStok`, `Harga`, `Satuan`, `TglAuditTerakhir`) VALUES
('07022002', 'barang langkah', 7778.00, 1000000.00, '9999999', '2023-12-18 00:00:00'),
('120674', 'rare barang', 1924921.00, 1000000.00, '9999999', '2023-12-18 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `barangdigudang`
--

CREATE TABLE `barangdigudang` (
  `IdTransaksi` int(11) NOT NULL,
  `WaktuTransaksi` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusTransaksi` enum('Masuk','Keluar') NOT NULL,
  `Jumlah` double(15,2) DEFAULT NULL,
  `Keterangan` text,
  `KodeGudang` int(11) NOT NULL,
  `KodeBarang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barangdigudang`
--

INSERT INTO `barangdigudang` (`IdTransaksi`, `WaktuTransaksi`, `StatusTransaksi`, `Jumlah`, `Keterangan`, `KodeGudang`, `KodeBarang`) VALUES
(1, '2023-12-18 00:00:00', 'Masuk', 7777.00, 'barang langkah boy\r\n', 7022002, '07022002'),
(2, '2023-12-18 00:00:00', 'Masuk', 1999.00, 'buat apa', 191220, '120674');

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `KodeGudang` int(11) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gudang`
--

INSERT INTO `gudang` (`KodeGudang`, `Alamat`) VALUES
(191220, 'jln raden fattah'),
(7022002, 'jln kampung bali');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
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
  ADD PRIMARY KEY (`IdTransaksi`),
  ADD KEY `KodeGudang` (`KodeGudang`),
  ADD KEY `KodeBarang` (`KodeBarang`);

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
  MODIFY `IdTransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
  MODIFY `KodeGudang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7022003;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `barangdigudang`
--
ALTER TABLE `barangdigudang`
  ADD CONSTRAINT `barangdigudang_ibfk_1` FOREIGN KEY (`KodeGudang`) REFERENCES `gudang` (`KodeGudang`),
  ADD CONSTRAINT `barangdigudang_ibfk_2` FOREIGN KEY (`KodeBarang`) REFERENCES `barang` (`KodeBarang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
