-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2019 at 06:14 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbwarnet`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kd_kategori` char(5) NOT NULL,
  `kategori` varchar(11) NOT NULL,
  `perjam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kd_kategori`, `kategori`, `perjam`) VALUES
('KTG01', 'Personal', 3500),
('KTG02', 'Member', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` char(6) NOT NULL,
  `nama_member` varchar(50) NOT NULL,
  `telp_member` varchar(12) NOT NULL,
  `alamat_member` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `telp_member`, `alamat_member`) VALUES
('ID001', 'Faahrul ', '081237469893', 'jetis'),
('ID002', 'Bilad', '09876721222', 'jetis'),
('ID003', 'Fhrlb', '0987654321', 'jetis');

-- --------------------------------------------------------

--
-- Table structure for table `pc`
--

CREATE TABLE `pc` (
  `nomer_pc` char(10) NOT NULL,
  `nama_pc` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pc`
--

INSERT INTO `pc` (`nomer_pc`, `nama_pc`) VALUES
('1', 'PC 01'),
('2', 'PC 02'),
('3', 'PC 03'),
('4', 'PC 04'),
('5', 'PC 05'),
('6', 'PC 06'),
('7', 'PC 07'),
('8', 'PC 08'),
('9', 'PC 09');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` char(6) NOT NULL,
  `id_user` char(6) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `nomer_pc` char(10) NOT NULL,
  `kd_kategori` char(5) NOT NULL,
  `kategori` varchar(11) NOT NULL,
  `id_member` char(6) DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `perjam` int(11) NOT NULL,
  `lama_sewa` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `nama_user`, `nomer_pc`, `kd_kategori`, `kategori`, `id_member`, `nama`, `perjam`, `lama_sewa`, `total_bayar`, `jumlah_bayar`, `kembalian`) VALUES
('TRX001', 'USE001', 'Fahrul Bilad', '5', 'KTG02', 'Member', 'ID002', 'Bilad', 3000, 2, 6000, 30000, 24000),
('TRX002', 'USE001', 'Fahrul Bilad', '2', 'KTG01', 'Personal', 'Member', 'FAHRUK', 3500, 4, 14000, 15000, 1000),
('TRX003', 'USE002', 'BiladFahrul', '6', 'KTG02', 'Member', 'ID002', 'Bilad', 3000, 3, 9000, 10000, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` char(6) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_telp` char(11) NOT NULL,
  `username` varchar(8) NOT NULL,
  `password` varchar(8) NOT NULL,
  `hak_akses` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `alamat`, `no_telp`, `username`, `password`, `hak_akses`) VALUES
('USE001', 'Fahrul Bilad', 'Jetis', '08123787652', 'admin', 'admin', 'admin'),
('USE002', 'BiladFahrul', 'Jetis', '08585858585', 'operator', 'operator', 'operator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kd_kategori`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`nomer_pc`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`,`nomer_pc`,`kd_kategori`,`id_member`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `nomer_pc` (`nomer_pc`),
  ADD KEY `kd_kategori` (`kd_kategori`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`nomer_pc`) REFERENCES `pc` (`nomer_pc`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`kd_kategori`) REFERENCES `kategori` (`kd_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
