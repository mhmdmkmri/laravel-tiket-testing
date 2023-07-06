-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2023 at 11:54 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiket`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'reguler', 'reguler', '2023-07-06 01:34:12', '2023-07-06 01:34:12'),
(2, 'vip', 'vip', '2023-07-06 01:34:17', '2023-07-06 01:34:17'),
(3, 'presale', 'presale', '2023-07-06 01:34:27', '2023-07-06 01:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2020_11_16_131654_create_category_table', 1),
(3, '2020_11_17_004604_create_transportasi_table', 1),
(4, '2020_11_18_081507_create_rute_table', 1),
(5, '2020_11_20_095338_create_pemesanan_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(255) NOT NULL,
  `kursi` varchar(255) DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total` int(11) NOT NULL,
  `status` enum('Belum Bayar','Sudah Bayar') NOT NULL DEFAULT 'Belum Bayar',
  `rute_id` bigint(20) UNSIGNED NOT NULL,
  `penumpang_id` bigint(20) UNSIGNED NOT NULL,
  `petugas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id`, `kode`, `kursi`, `waktu`, `total`, `status`, `rute_id`, `penumpang_id`, `petugas_id`, `created_at`, `updated_at`) VALUES
(1, '9HMYOGS', 'K10', '2023-07-06 00:00:00', 100000, 'Belum Bayar', 1, 5, NULL, '2023-07-06 01:40:28', '2023-07-06 01:40:28'),
(2, 'IXHMQO3', 'K10', '2023-07-13 00:00:00', 100000, 'Belum Bayar', 1, 5, NULL, '2023-07-06 01:40:46', '2023-07-06 01:40:46'),
(3, 'JS0EW57', 'K9', '2023-07-06 08:53:01', 100000, 'Sudah Bayar', 1, 5, 1, '2023-07-06 01:41:03', '2023-07-06 01:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `rute`
--

CREATE TABLE `rute` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `start` varchar(255) NOT NULL,
  `end` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `jam` time NOT NULL,
  `transportasi_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rute`
--

INSERT INTO `rute` (`id`, `tujuan`, `start`, `end`, `harga`, `jam`, `transportasi_id`, `created_at`, `updated_at`) VALUES
(1, 'Stage 1', 'stage 1', 'stage 1', 100000, '07:00:00', 1, '2023-07-06 01:37:25', '2023-07-06 01:37:25'),
(3, 'VIP Stage', 'VIP', 'VIP', 500000, '00:00:00', 3, '2023-07-06 01:38:37', '2023-07-06 01:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `transportasi`
--

CREATE TABLE `transportasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transportasi`
--

INSERT INTO `transportasi` (`id`, `name`, `kode`, `jumlah`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Gelora Indonesia', 'GI-001', 10, 3, '2023-07-06 01:35:39', '2023-07-06 01:35:39'),
(2, 'Gelora Indonesia', 'GI-REGULAR', 100, 1, '2023-07-06 01:36:07', '2023-07-06 01:36:07'),
(3, 'Gelora Indonesia', 'GI-VIP', 10, 2, '2023-07-06 01:36:30', '2023-07-06 01:36:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('Admin','Petugas','Penumpang') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `level`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '$2y$10$iHJkEvBs9bb8hkh4CzKEtOcZCNxudhKCdbaj92s1AEItwibNBcTde', 'Admin', '2021-01-11 20:49:02', '2021-01-11 20:49:02'),
(4, 'petugas', 'petugas', '$2y$10$dRz2.opm6myvMBlZ6AR4g.XGcpPgoMVJNjNe/bIdgHVbUCpl8kZca', 'Petugas', '2023-07-06 01:33:33', '2023-07-06 01:33:33'),
(5, 'pemesan', 'pemesan', '$2y$10$gEfKa8r4kMu1MMT5zQhv1Oir6UHv.iwZVG7ZVyynkTUMz9E.8M8su', 'Penumpang', '2023-07-06 01:33:56', '2023-07-06 01:33:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemesanan_rute_id_foreign` (`rute_id`),
  ADD KEY `pemesanan_penumpang_id_foreign` (`penumpang_id`),
  ADD KEY `pemesanan_petugas_id_foreign` (`petugas_id`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rute_transportasi_id_foreign` (`transportasi_id`);

--
-- Indexes for table `transportasi`
--
ALTER TABLE `transportasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transportasi_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rute`
--
ALTER TABLE `rute`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transportasi`
--
ALTER TABLE `transportasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_penumpang_id_foreign` FOREIGN KEY (`penumpang_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pemesanan_petugas_id_foreign` FOREIGN KEY (`petugas_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pemesanan_rute_id_foreign` FOREIGN KEY (`rute_id`) REFERENCES `rute` (`id`);

--
-- Constraints for table `rute`
--
ALTER TABLE `rute`
  ADD CONSTRAINT `rute_transportasi_id_foreign` FOREIGN KEY (`transportasi_id`) REFERENCES `transportasi` (`id`);

--
-- Constraints for table `transportasi`
--
ALTER TABLE `transportasi`
  ADD CONSTRAINT `transportasi_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
