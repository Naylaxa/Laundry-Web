-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2024 at 05:19 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `nama1` text NOT NULL,
  `hp1` text NOT NULL,
  `alamat1` text NOT NULL,
  `nama2` text NOT NULL,
  `hp2` text NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`nama1`, `hp1`, `alamat1`, `nama2`, `hp2`, `pesan`) VALUES
('ikhlas', '0885654546', 'Purbalingga', '', '', 'Kerennn'),
('nayla', '08975645', 'Purbalingga', 'erlina', '0898786756', 'okee'),
('Keyy', '087565657', 'Purbalingga', 'Arl', '0876767', 'Semangatttt');

-- --------------------------------------------------------

--
-- Table structure for table `cuci_kering`
--

CREATE TABLE `cuci_kering` (
  `id` int(11) NOT NULL,
  `paket` varchar(255) DEFAULT NULL,
  `waktu` int(11) DEFAULT NULL,
  `kuantitas` int(11) DEFAULT NULL,
  `tarif` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cuci_kering`
--

INSERT INTO `cuci_kering` (`id`, `paket`, `waktu`, `kuantitas`, `tarif`) VALUES
(1, 'cuci kering reguler', 48, 1, '6000.00'),
(2, 'cuci kering kilat', 24, 1, '9000.00'),
(3, 'cuci kering express', 6, 1, '15000.00');

-- --------------------------------------------------------

--
-- Table structure for table `cuci_komplit`
--

CREATE TABLE `cuci_komplit` (
  `id` int(11) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `waktu` int(11) NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `tarif` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cuci_komplit`
--

INSERT INTO `cuci_komplit` (`id`, `paket`, `waktu`, `kuantitas`, `tarif`) VALUES
(1, 'Cuci Komplit Reguler', 48, 1, '8000.00'),
(2, 'Cuci Komplit Kilat', 24, 1, '15000.00'),
(3, 'Cuci Komplit Express', 5, 1, '20000.00');

-- --------------------------------------------------------

--
-- Table structure for table `cuci_satuan`
--

CREATE TABLE `cuci_satuan` (
  `id` int(11) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `waktu` int(11) NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `tarif` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cuci_satuan`
--

INSERT INTO `cuci_satuan` (`id`, `paket`, `waktu`, `kuantitas`, `tarif`) VALUES
(1, 'Jaket Kulit', 24, 1, '15000.00'),
(2, 'Jaket Non Kulit', 24, 1, '6000.00'),
(3, 'Boneka Kecil', 24, 1, '6000.00'),
(4, 'Boneka Sedang', 24, 1, '10000.00'),
(5, 'Boneka Besar', 24, 1, '15000.00'),
(6, 'Sejadah', 24, 1, '20000.00'),
(7, 'Selimut', 24, 1, '20000.00'),
(8, 'Keset', 24, 1, '20000.00');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `transaksi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nominal_bayar` decimal(11,2) NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `tgl_pembayaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`transaksi_id`, `user_id`, `nominal_bayar`, `metode_pembayaran`, `tgl_pembayaran`) VALUES
(1, 6, '700000.00', 'transfer', '2024-05-29'),
(2, 6, '700000.00', 'transfer', '2024-05-29'),
(3, 6, '700000.00', 'transfer', '2024-05-29'),
(4, 6, '700000.00', 'transfer', '2024-05-29');

-- --------------------------------------------------------

--
-- Table structure for table `tr_cuci_kering`
--

CREATE TABLE `tr_cuci_kering` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `paket_id` int(11) NOT NULL,
  `waktu` int(11) NOT NULL,
  `berat` decimal(10,2) NOT NULL,
  `tarif` decimal(10,2) NOT NULL,
  `tgl_masuk` datetime NOT NULL,
  `tgl_keluar` datetime NOT NULL,
  `total_bayar` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tr_cuci_kering`
--

INSERT INTO `tr_cuci_kering` (`id`, `user_id`, `nama`, `no_hp`, `alamat`, `paket_id`, `waktu`, `berat`, `tarif`, `tgl_masuk`, `tgl_keluar`, `total_bayar`, `status`) VALUES
(6, 13, 'Eleanor', '086757765', 'Kaligondang', 2, 24, '9.90', '9000.00', '2024-05-21 21:26:09', '2024-05-28 23:53:21', '89100.00', 2),
(7, 6, 'Naira', '08124256', 'Kaligondang', 1, 48, '3.55', '6000.00', '2024-05-21 21:52:00', '2024-05-29 23:53:35', '21300.00', 1),
(8, 6, 'Naira', '0878756', 'Purbalingga', 3, 6, '3.45', '15000.00', '2024-05-21 21:58:46', '2024-05-22 03:58:46', '51750.00', 0),
(9, 1, 'Kayla', '0889788', 'Purbalingga', 1, 48, '4.05', '6000.00', '2024-05-22 02:33:16', '2024-05-29 23:53:46', '24300.00', 2),
(10, 1, 'Nayla', '0897876', 'Purbalingga', 1, 48, '5.86', '6000.00', '2024-05-22 02:33:49', '2024-05-29 23:57:57', '35160.00', 1),
(42, 6, 'Naira', '08645498', 'Purbalingga', 1, 48, '8.52', '6000.00', '2024-05-27 16:55:59', '2024-05-29 23:58:10', '51120.00', 2),
(47, 1, 'Aurora', '08953012', 'Purbalingga', 1, 48, '2.45', '6000.00', '2024-05-27 22:50:50', '2024-05-29 22:50:50', '14700.00', 0),
(48, 1, 'Aurora', '08953012', 'Purbalingga', 1, 48, '2.45', '6000.00', '2024-05-27 22:51:22', '2024-05-29 22:51:22', '14700.00', 0),
(49, 1, 'Jenna', '0889788', 'Purbalingga', 2, 24, '4.05', '9000.00', '2024-05-27 22:52:23', '2024-05-28 22:52:23', '36450.00', 0),
(50, 1, 'Eleanor', '087453457846', 'Purbalingga', 2, 24, '11.65', '9000.00', '2024-05-27 23:49:37', '2024-05-28 23:49:37', '104850.00', 0),
(51, 1, 'Syaff', '0876878564', 'Purbalingga', 3, 6, '4.05', '15000.00', '2024-05-27 23:50:05', '2024-05-28 05:50:05', '60750.00', 0),
(52, 1, 'Syafira', '09999999', 'Kajongan', 3, 6, '2.45', '15000.00', '2024-05-27 23:51:09', '2024-05-28 05:51:09', '36750.00', 0),
(53, 13, 'Eleanor', '088978885', 'Purbalingga', 2, 24, '3.45', '9000.00', '2024-05-28 15:15:21', '2024-05-29 15:15:21', '31050.00', 0),
(54, 13, 'Eleanor', '0864549835', 'Purbalingga', 2, 24, '8.87', '9000.00', '2024-05-28 15:22:23', '2024-05-29 15:22:23', '79830.00', 0),
(55, 13, 'Eleanor', '08953012', 'Purbalingga', 1, 48, '3.97', '6000.00', '2024-05-28 15:44:55', '2024-05-30 15:44:55', '23820.00', 0),
(56, 6, 'Naira', '0812497', 'Purbalingga', 1, 48, '5.86', '6000.00', '2024-05-29 05:13:11', '2024-05-31 05:13:11', '35160.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tr_cuci_komplit`
--

CREATE TABLE `tr_cuci_komplit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `paket_id` int(11) NOT NULL,
  `waktu` int(11) NOT NULL,
  `berat` decimal(10,2) NOT NULL,
  `tarif` decimal(10,2) NOT NULL,
  `tgl_masuk` datetime NOT NULL,
  `tgl_keluar` datetime NOT NULL,
  `total_bayar` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tr_cuci_komplit`
--

INSERT INTO `tr_cuci_komplit` (`id`, `user_id`, `nama`, `no_hp`, `alamat`, `paket_id`, `waktu`, `berat`, `tarif`, `tgl_masuk`, `tgl_keluar`, `total_bayar`, `status`) VALUES
(1, 6, 'Naira', '081542656', 'Purbalingga', 3, 6, '8.63', '15000.00', '2024-05-21 22:35:20', '2024-05-22 04:35:20', '129450.00', 0),
(2, 6, 'Naira', '0875655', 'Purbalingga', 2, 24, '5.86', '15000.00', '2024-05-22 03:23:23', '2024-05-29 16:15:32', '87900.00', 2),
(3, 6, 'Naira', '0898756', 'Kaligondang', 2, 24, '2.45', '9000.00', '2024-05-22 03:28:01', '2024-05-23 03:28:01', '22050.00', 0),
(4, 6, 'Naira', '0878756', 'Purbalingga', 1, 48, '3.45', '8000.00', '2024-05-25 14:16:22', '2024-05-30 16:15:46', '27600.00', 1),
(6, 13, 'Eleanor', '08346748', 'Purbalingga', 3, 6, '4.86', '15000.00', '2024-05-26 19:56:42', '2024-05-27 01:56:42', '72900.00', 0),
(12, 6, 'Naira', '084767688442', 'Purbalingga', 1, 48, '2.45', '6000.00', '2024-05-27 00:46:06', '2024-05-29 00:46:06', '14700.00', 0),
(13, 13, 'Eleanor', '08953012', 'Purbalingga', 2, 24, '3.45', '9000.00', '2024-05-28 15:14:17', '2024-05-29 15:14:17', '31050.00', 0),
(15, 6, 'Naira', '0877678', 'Purbalingga', 3, 6, '6.23', '15000.00', '2024-05-29 05:12:22', '2024-05-29 11:12:22', '93450.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tr_cuci_satuan`
--

CREATE TABLE `tr_cuci_satuan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `paket_id` int(11) NOT NULL,
  `waktu` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tarif` decimal(10,2) NOT NULL,
  `tgl_masuk` datetime NOT NULL,
  `tgl_keluar` datetime NOT NULL,
  `total_bayar` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tr_cuci_satuan`
--

INSERT INTO `tr_cuci_satuan` (`id`, `user_id`, `nama`, `no_hp`, `alamat`, `paket_id`, `waktu`, `jumlah`, `tarif`, `tgl_masuk`, `tgl_keluar`, `total_bayar`, `status`) VALUES
(3, 6, 'Naira', '0889788', 'Purbalingga', 7, 24, 6, '20000.00', '2024-05-21 23:14:23', '2024-05-22 23:14:23', '120000.00', 0),
(4, 6, 'Naira', '086765', 'Kaligondang', 5, 24, 8, '15000.00', '2024-05-22 03:25:49', '2024-05-23 03:25:49', '120000.00', 0),
(5, 6, 'Naira', '09999999', 'Purbalingga', 3, 24, 4, '6000.00', '2024-05-25 14:30:49', '2024-05-29 16:21:24', '24000.00', 2),
(6, 13, 'Eleanor', '08645498', 'Purbalingga', 5, 24, 7, '15000.00', '2024-05-26 19:59:14', '2024-05-29 16:21:41', '105000.00', 1),
(7, 6, 'Naira', '08645498', 'Purbalingga', 6, 24, 3, '20000.00', '2024-05-27 00:44:15', '2024-05-28 00:44:15', '60000.00', 0),
(8, 6, 'Naira', '08953012', 'Purbalingga', 1, 24, 6, '15000.00', '2024-05-27 00:44:57', '2024-05-28 00:44:57', '90000.00', 0),
(9, 13, 'Eleanor', '08645498', 'Purbalingga', 1, 24, 2, '15000.00', '2024-05-28 15:48:32', '2024-05-29 15:48:32', '30000.00', 0),
(10, 6, 'Naira', '081743257', 'Purbalingga', 6, 24, 9, '20000.00', '2024-05-29 05:14:00', '2024-05-30 05:14:00', '180000.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_`
--

CREATE TABLE `users_` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_`
--

INSERT INTO `users_` (`id`, `username`, `password`, `role`) VALUES
(1, 'Nayla', '$2y$10$RYcFip7qTL2hwXIWLGpe2ejWRE3X18oA1LiXzyTSGhQ6t00iPCQ.S', 'admin'),
(6, 'Naira', '$2y$10$tokgBn35URaEiAG6QXxA3.5sYzusvvvr5mmsscNktqQPoRWtcAzvW', 'user'),
(7, 'Aurora', '$2y$10$lNhFcstgP7kpvrIFL35Uwe0/ujyrwFEdjjxmq7tU0/xzZ1FCh3jcy', 'user'),
(8, 'Kayla', '$2y$10$c9MKc6OKrElv9K.Ll2oVMOrgGYI88qOJfBhJMkddMiGK.BiNajSxa', 'user'),
(9, 'Syaff', '$2y$10$5EdmkTbHsexbNyTzgwKYFeBwUqUl6iOZQTWKrBGKy9YjzZhOGsEH2', 'user'),
(10, 'Syafira', '$2y$10$3m1K9UqXbjS/zX/peqP7LOECrXzocKEfqrcvFvZb0nRf6QmiU6I0K', 'user'),
(11, 'Ikhlas', '$2y$10$CvrM6QFbAMTvk1mcIRbr..6tDIY6e2jt/vSpT6mf2KIo3y1hdx7oO', 'admin'),
(12, 'Jenna', '0094c3dfe66bedab0254d7f811b7fb40', 'user'),
(13, 'Eleanor', '$2y$10$FB1s670hj0L/aMDx2GbkC.sEHVhMhuAngkOEtDF/o/rZlsILGipiS', 'user'),
(14, 'irfan', '0094c3dfe66bedab0254d7f811b7fb40', 'user'),
(16, 'Elea', '$2y$10$cSp2lIsCEMuCxJowaWAgM.DA0YOzyxYR6eCos4gZ4jToX1UzAEiSu', 'user'),
(17, 'Nayy', '$2y$10$leS2z5OkYTfpbVESNqf6AOHk5.DqKFdBGpupqqlC1YqkQkTYg2xrS', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cuci_kering`
--
ALTER TABLE `cuci_kering`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuci_komplit`
--
ALTER TABLE `cuci_komplit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuci_satuan`
--
ALTER TABLE `cuci_satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `fk_pembayaran` (`user_id`);

--
-- Indexes for table `tr_cuci_kering`
--
ALTER TABLE `tr_cuci_kering`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paket_id` (`paket_id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_nama_username` (`nama`);

--
-- Indexes for table `tr_cuci_komplit`
--
ALTER TABLE `tr_cuci_komplit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paket_id` (`paket_id`),
  ADD KEY `fk_users` (`nama`),
  ADD KEY `fk_customer2` (`user_id`);

--
-- Indexes for table `tr_cuci_satuan`
--
ALTER TABLE `tr_cuci_satuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paket_id` (`paket_id`),
  ADD KEY `fk_users_` (`nama`),
  ADD KEY `fk_customer3` (`user_id`);

--
-- Indexes for table `users_`
--
ALTER TABLE `users_`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cuci_komplit`
--
ALTER TABLE `cuci_komplit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cuci_satuan`
--
ALTER TABLE `cuci_satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tr_cuci_kering`
--
ALTER TABLE `tr_cuci_kering`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tr_cuci_komplit`
--
ALTER TABLE `tr_cuci_komplit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tr_cuci_satuan`
--
ALTER TABLE `tr_cuci_satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users_`
--
ALTER TABLE `users_`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`transaksi_id`) REFERENCES `tr_cuci_komplit` (`id`),
  ADD CONSTRAINT `fk_pembayaran` FOREIGN KEY (`user_id`) REFERENCES `users_` (`id`);

--
-- Constraints for table `tr_cuci_kering`
--
ALTER TABLE `tr_cuci_kering`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`user_id`) REFERENCES `users_` (`id`),
  ADD CONSTRAINT `fk_id_users` FOREIGN KEY (`user_id`) REFERENCES `users_` (`id`),
  ADD CONSTRAINT `fk_nama_username` FOREIGN KEY (`nama`) REFERENCES `users_` (`username`),
  ADD CONSTRAINT `fk_user_ck` FOREIGN KEY (`nama`) REFERENCES `users_` (`username`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_` (`id`),
  ADD CONSTRAINT `tr_cuci_kering_ibfk_1` FOREIGN KEY (`paket_id`) REFERENCES `cuci_kering` (`id`),
  ADD CONSTRAINT `us_users_` FOREIGN KEY (`nama`) REFERENCES `users_` (`username`);

--
-- Constraints for table `tr_cuci_komplit`
--
ALTER TABLE `tr_cuci_komplit`
  ADD CONSTRAINT `fk_customer2` FOREIGN KEY (`user_id`) REFERENCES `users_` (`id`),
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`nama`) REFERENCES `users_` (`username`),
  ADD CONSTRAINT `fko_id_users` FOREIGN KEY (`user_id`) REFERENCES `users_` (`id`),
  ADD CONSTRAINT `tr_cuci_komplit_ibfk_1` FOREIGN KEY (`paket_id`) REFERENCES `cuci_komplit` (`id`);

--
-- Constraints for table `tr_cuci_satuan`
--
ALTER TABLE `tr_cuci_satuan`
  ADD CONSTRAINT `fk_customer3` FOREIGN KEY (`user_id`) REFERENCES `users_` (`id`),
  ADD CONSTRAINT `fk_users_` FOREIGN KEY (`nama`) REFERENCES `users_` (`username`),
  ADD CONSTRAINT `fs_id_users` FOREIGN KEY (`user_id`) REFERENCES `users_` (`id`),
  ADD CONSTRAINT `tr_cuci_satuan_ibfk_1` FOREIGN KEY (`paket_id`) REFERENCES `cuci_satuan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
