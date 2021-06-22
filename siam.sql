-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2020 at 09:50 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siam`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `username`, `password`, `level`) VALUES
(1, 'iqbal', 'iqbal_maulana@gmail.com', 'iqbal', '76d80224611fc919a5d54f0ff9fba446', 'admin'),
(2, 'Arif Santosa', 'arif@gmail.com', 'arif', '0ff6c3ace16359e41e37d40b8301d67f', 'admin'),
(3, 'Luky Fahmi', 'luky.fahmi11@gmail.com', 'luky', '202cb962ac59075b964b07152d234b70', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `hobi`
--

CREATE TABLE `hobi` (
  `kode_hobi` int(11) NOT NULL,
  `hobi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hobi`
--

INSERT INTO `hobi` (`kode_hobi`, `hobi`) VALUES
(1, 'Membaca'),
(2, 'Olahraga'),
(3, 'Menari'),
(4, 'Menulis');

-- --------------------------------------------------------

--
-- Table structure for table `hobi_mahasiswa`
--

CREATE TABLE `hobi_mahasiswa` (
  `kode_hobi_mahasiswa` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `kode_hobi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hobi_mahasiswa`
--

INSERT INTO `hobi_mahasiswa` (`kode_hobi_mahasiswa`, `nim`, `kode_hobi`) VALUES
(41, '1269', 1),
(42, '1269', 2),
(43, '1270', 3),
(44, '1270', 4),
(45, '1271', 1),
(46, '1271', 3),
(47, '1272', 2),
(48, '1272', 3),
(49, '1273', 1),
(50, '1273', 2),
(51, '1273', 3);

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` int(11) NOT NULL,
  `jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `jurusan`) VALUES
(1, 'Sistem Informasi'),
(2, 'Teknologi Informasi'),
(3, 'Teknologi Informasi'),
(4, 'Teknik Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kode_jurusan` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `kode_jurusan`, `foto`) VALUES
('1269', 'bram', 4, '1269.jpg'),
('1270', 'iqbal', 1, '1270.jpg'),
('1271', 'galih', 3, '1271.jpg'),
('1272', 'cica', 3, '1272.jpg'),
('1273', 'koko', 1, '1273.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `hobi`
--
ALTER TABLE `hobi`
  ADD PRIMARY KEY (`kode_hobi`);

--
-- Indexes for table `hobi_mahasiswa`
--
ALTER TABLE `hobi_mahasiswa`
  ADD PRIMARY KEY (`kode_hobi_mahasiswa`),
  ADD KEY `nim` (`nim`),
  ADD KEY `kode_hobi` (`kode_hobi`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hobi`
--
ALTER TABLE `hobi`
  MODIFY `kode_hobi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hobi_mahasiswa`
--
ALTER TABLE `hobi_mahasiswa`
  MODIFY `kode_hobi_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `kode_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hobi_mahasiswa`
--
ALTER TABLE `hobi_mahasiswa`
  ADD CONSTRAINT `hobi_mahasiswa_ibfk_1` FOREIGN KEY (`kode_hobi`) REFERENCES `hobi` (`kode_hobi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hobi_mahasiswa_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
