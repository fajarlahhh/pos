-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2021 at 12:09 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `barang_id` bigint(20) NOT NULL,
  `nama` varchar(255) CHARACTER SET latin1 NOT NULL,
  `stok_min` double NOT NULL DEFAULT 0,
  `keterangan` text CHARACTER SET latin1 DEFAULT NULL,
  `stok` tinyint(4) NOT NULL DEFAULT 1,
  `jenis_barang_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`barang_id`, `nama`, `stok_min`, `keterangan`, `stok`, `jenis_barang_id`, `supplier_id`, `pengguna_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(222, 'mozarella olden burger 1 kg', 0, NULL, 1, NULL, NULL, 'administrator', '2020-12-29 10:57:36', '2020-12-30 04:30:13', '2020-12-30 04:30:13'),
(223, 'sosis yona 1 kg', 0, NULL, 1, NULL, NULL, 'administrator', '2020-12-29 11:24:38', '2020-12-30 04:30:19', '2020-12-30 04:30:19'),
(224, 'DAGING SLICE', 0, NULL, 1, NULL, NULL, 'administrator', '2020-12-29 11:42:03', '2020-12-30 04:30:06', '2020-12-30 04:30:06'),
(225, 'Mozarella Olden Burger', 12, NULL, 1, NULL, NULL, 'administrator', '2020-12-31 04:35:53', '2021-01-04 08:28:02', '2021-01-04 08:28:02'),
(226, 'Kanzler Chese FrankFurter', -4, NULL, 1, NULL, NULL, 'administrator', '2020-12-31 04:58:37', '2021-01-04 08:27:54', '2021-01-04 08:27:54'),
(227, 'Sosis Yona', 58, NULL, 1, NULL, NULL, 'administrator', '2020-12-31 05:01:11', '2021-01-04 08:28:14', '2021-01-04 08:28:14'),
(228, 'Saus BBQ', 0, NULL, 1, NULL, NULL, 'administrator', '2020-12-31 05:02:35', '2021-01-04 08:28:07', '2021-01-04 08:28:07'),
(229, 'Kentang 2,5kg', 0, NULL, 1, NULL, NULL, 'administrator', '2020-12-31 05:05:25', '2021-01-04 08:28:23', '2021-01-04 08:28:23'),
(230, 'Mozarella Olden Burger', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:41:34', '2021-01-04 11:31:26', NULL),
(231, 'Sosis Yona', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:43:15', '2021-01-04 11:31:50', NULL),
(232, 'Kanzler Chese FrankFurter', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:44:52', '2021-01-04 11:30:33', NULL),
(233, 'Kanzler Chese Cocktail', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:46:42', '2021-01-04 11:30:22', NULL),
(234, 'Kentang DPP 2,5kg', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:48:33', '2021-01-04 11:30:56', NULL),
(235, 'Mix Vegetable', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:49:37', '2021-01-04 11:31:11', NULL),
(236, 'Ayam Slice', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:50:24', '2021-01-04 10:50:24', NULL),
(237, 'Daging Slice', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:51:00', '2021-01-04 10:51:00', NULL),
(238, 'Sosis Belfood Ayam', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:52:01', '2021-01-04 10:52:01', NULL),
(239, 'Sosis Belfood Sapi', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:52:53', '2021-01-04 10:52:53', NULL),
(240, 'Sosis Hemato', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:53:30', '2021-01-04 10:53:30', NULL),
(241, 'Kentang Frozeland', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:54:03', '2021-01-04 10:54:03', NULL),
(242, 'Kentang Bart\'s French Friesh', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:56:38', '2021-01-04 10:56:38', NULL),
(243, 'Kanzler Beef Cocktail 250gr', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:57:43', '2021-01-04 10:57:43', NULL),
(244, 'Kanzler Beef Cocktail 500gr', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:05:20', '2021-01-04 11:05:20', NULL),
(245, 'Sosis Bakar', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:05:58', '2021-01-04 11:05:58', NULL),
(246, 'Mozzarella Kareem 250gr', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:08:44', '2021-01-04 11:08:44', NULL),
(247, 'Susu UHT', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:11:03', '2021-01-04 11:11:03', NULL),
(248, 'Sosis Asimo 1kg', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:11:48', '2021-01-04 11:11:48', NULL),
(249, 'Sosis Asimo 500gr', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:12:19', '2021-01-04 11:12:19', NULL),
(250, 'Nugget Hemato', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:13:26', '2021-01-04 11:13:26', NULL),
(251, 'Saus Keju', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:14:05', '2021-01-04 11:14:05', NULL),
(252, 'Saus BBQ', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:14:45', '2021-01-04 11:14:45', NULL),
(253, 'Saus Tomat ABC', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:15:22', '2021-01-04 11:15:22', NULL),
(254, 'Mayonis Mamayo', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:15:54', '2021-01-04 11:15:54', NULL),
(255, 'Nugget Belfood Ayam', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:17:13', '2021-01-04 11:17:13', NULL),
(256, 'MOZARELLA OLDEN BURGER', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 14:48:46', '2021-01-04 15:26:18', '2021-01-04 15:26:18'),
(257, 'MOZARELLA OLDEN BURGER 1 KG', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 15:18:08', '2021-01-04 15:26:27', '2021-01-04 15:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `barang_masuk_id` bigint(255) NOT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `faktur` varchar(255) DEFAULT NULL,
  `sales` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `lunas` date DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`barang_masuk_id`, `tanggal`, `faktur`, `sales`, `keterangan`, `jatuh_tempo`, `lunas`, `supplier_id`, `pengguna_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, '2020-12-24', '00/27', 'jayadi', NULL, NULL, '2020-12-29', 62, 'administrator', '2020-12-29 11:11:35', '2020-12-29 12:14:18', '2020-12-29 12:14:18'),
(8, '2020-12-29', '000', 'ULFA', NULL, '2020-12-31', '2020-12-29', 63, 'administrator', '2020-12-29 11:30:59', '2020-12-29 12:14:21', '2020-12-29 12:14:21'),
(9, '2020-12-28', '-', NULL, NULL, '2020-12-31', NULL, 62, 'administrator', '2020-12-29 11:47:06', '2020-12-29 11:47:25', '2020-12-29 11:47:25'),
(10, '2021-01-04', '00Z', 'JAYADI', 'MOZARELA OLDEN BURGER', NULL, '2021-01-04', 62, 'administrator', '2021-01-04 14:35:14', '2021-01-04 14:50:37', '2021-01-04 14:50:37'),
(11, '2021-01-04', 'S2101061', 'FERA', 'KANZLER', '2021-01-11', NULL, 64, 'administrator', '2021-01-04 14:40:14', '2021-01-04 14:41:53', '2021-01-04 14:41:53'),
(12, '2021-01-04', 'S2101061', 'FERA', NULL, '2021-01-11', NULL, 64, 'administrator', '2021-01-04 14:45:18', '2021-01-04 14:50:33', '2021-01-04 14:50:33'),
(13, '2021-01-04', '0rr', 'jayadi', NULL, NULL, '2021-01-04', 62, 'administrator', '2021-01-04 14:53:19', '2021-01-04 15:27:00', '2021-01-04 15:27:00'),
(14, '2021-01-04', '00', 'fera', NULL, '2021-01-11', NULL, 64, 'administrator', '2021-01-04 14:55:56', '2021-01-04 14:56:41', '2021-01-04 14:56:41'),
(15, '2021-01-04', 's21011061', 'fera', NULL, '2021-01-11', NULL, 64, 'administrator', '2021-01-04 15:00:22', '2021-01-04 15:00:22', NULL),
(16, '2021-01-04', '00/23', 'WAYAN', NULL, '2021-01-06', NULL, 65, 'administrator', '2021-01-04 15:03:50', '2021-01-04 15:03:50', NULL),
(17, '2021-01-04', '00', 'ULFA', NULL, NULL, '2021-01-04', 63, 'administrator', '2021-01-04 15:07:00', '2021-01-04 15:07:00', NULL),
(18, '2021-01-04', '00/11', 'FERA', NULL, NULL, '2021-01-04', 64, 'administrator', '2021-01-04 15:08:38', '2021-01-04 15:08:38', NULL),
(19, '2021-01-04', 'D5647', 'JAYADI', NULL, NULL, '2021-01-04', 62, 'administrator', '2021-01-04 15:29:04', '2021-01-04 15:29:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk_detail`
--

CREATE TABLE `barang_masuk_detail` (
  `barang_masuk_id` bigint(20) NOT NULL,
  `barang_id` bigint(20) DEFAULT NULL,
  `nomor_batch` varchar(255) DEFAULT NULL,
  `harga_barang` decimal(15,0) DEFAULT NULL,
  `harga_pph` decimal(15,0) DEFAULT NULL,
  `diskon` decimal(15,0) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `kadaluarsa` date DEFAULT NULL,
  `sub_total_ppn` double DEFAULT NULL,
  `sub_total` decimal(15,2) DEFAULT NULL,
  `check` tinyint(255) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `barang_masuk_detail`
--

INSERT INTO `barang_masuk_detail` (`barang_masuk_id`, `barang_id`, `nomor_batch`, `harga_barang`, `harga_pph`, `diskon`, `qty`, `kadaluarsa`, `sub_total_ppn`, `sub_total`, `check`) VALUES
(7, 222, NULL, '936000', '0', '0', 35, '2020-12-29', 0, '32760000.00', 1),
(8, 223, NULL, '60000', '0', '0', 64, '2020-12-29', 0, '3840000.00', 1),
(9, 224, NULL, '25000', '0', '0', 25, '2020-12-29', 0, '625000.00', 1),
(10, 230, NULL, '946000', '0', '0', 50, '2021-01-04', 0, '47300000.00', 0),
(11, 232, NULL, '45500', '0', '0', 10, '2021-01-04', 0, '455000.00', 0),
(12, 232, NULL, '45500', '0', '0', 10, '2021-01-04', 0, '1670000.00', 0),
(12, 243, NULL, '25000', '0', '0', 30, '2021-01-04', 0, '1670000.00', 0),
(12, 233, NULL, '46500', '0', '0', 10, '2021-01-04', 0, '1670000.00', 0),
(13, 256, NULL, '95000', '0', '0', 251, '2021-01-04', 0, '23845000.00', 0),
(14, 243, NULL, '25000', '0', '0', 30, '2021-01-04', 0, '1205000.00', 0),
(14, 232, NULL, '45500', '0', '0', 10, '2021-01-04', 0, '1205000.00', 0),
(15, 232, NULL, '45500', '0', '0', 10, '2021-01-04', 0, '1670000.00', 0),
(15, 243, NULL, '25000', '0', '0', 30, '2021-01-04', 0, '1670000.00', 0),
(15, 233, NULL, '46500', '0', '0', 10, '2021-01-04', 0, '1670000.00', 0),
(16, 234, NULL, '55000', '0', '0', 8, '2021-01-04', 0, '440000.00', 0),
(17, 231, NULL, '55000', '0', '0', 31, '2021-01-04', 0, '1705000.00', 0),
(18, 252, NULL, '15000', '0', '0', 4, '2021-01-04', 0, '60000.00', 0),
(19, 230, NULL, '78833', '0', '0', 251, '2021-01-04', 0, '19787083.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `jenis_barang_id` bigint(20) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `pengguna_id`) VALUES
(1, 'App\\Models\\Pengguna', 'kasir'),
(3, 'App\\Models\\Pengguna', 'kasir'),
(6, 'App\\Models\\Pengguna', 'kasir'),
(8, 'App\\Models\\Pengguna', 'kasir'),
(9, 'App\\Models\\Pengguna', 'kasir'),
(10, 'App\\Models\\Pengguna', 'kasir'),
(12, 'App\\Models\\Pengguna', 'kasir'),
(13, 'App\\Models\\Pengguna', 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `pengguna_id`) VALUES
(1, 'App\\Models\\Pengguna', 'administrator'),
(2, 'App\\Models\\Pengguna', 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `pelanggan_id` bigint(20) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kontak` varchar(255) DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`pelanggan_id`, `nama`, `alamat`, `kontak`, `pengguna_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(62, 'ANGGUN DOMPU', 'Samping Kantor Lurah Karijawa Dompu', '081239888826', 'administrator', '2020-12-29 11:51:09', '2020-12-31 05:09:49', NULL),
(63, 'ANNISA', 'Kebayan Sumbawa Besar', '082340725981', 'administrator', '2020-12-31 05:12:52', '2020-12-31 05:12:52', NULL),
(64, 'HAIFA SOSIS AMPENAN', 'JL. SALEH SUNGKAR AMPENAN', 'AINI', 'administrator', '2021-01-04 15:11:43', '2021-01-04 15:11:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `pengguna_id` varchar(255) NOT NULL,
  `sandi` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`pengguna_id`, `sandi`, `nama`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
('administrator', '$2y$10$8D1JqX6wwuCZuKMRYaIw3O2adcJyxEKxCsiA73cv3ASeyxxD2xbXa', 'Administrator', NULL, NULL, '2020-10-22 06:31:28', NULL),
('kasir', '$2y$10$ZSQZX3VdiZJw.hhJqmGnCufUzzndevyRSCscbqCDgDq5kSmSELTvS', 'kasir', NULL, '2020-12-29 11:58:17', '2020-12-29 11:59:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `penjualan_id` varchar(255) NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `tagihan` decimal(15,2) DEFAULT NULL,
  `bayar` decimal(15,2) DEFAULT NULL,
  `sisa` decimal(15,2) DEFAULT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `lunas` date DEFAULT NULL,
  `pelanggan_id` bigint(20) DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`penjualan_id`, `tanggal`, `keterangan`, `tagihan`, `bayar`, `sisa`, `jatuh_tempo`, `lunas`, `pelanggan_id`, `pengguna_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('20201229061200882922', '2020-12-29', 'BUTUH SEGERA', '950000.00', '995000.00', '45000.00', NULL, '2020-12-29', 62, 'administrator', '2020-12-29 11:54:00', '2020-12-29 11:56:38', '2020-12-29 11:56:38'),
('20201229061221231490', '2020-12-29', '-', '5292000.00', '5292000.00', '0.00', '2021-01-05', NULL, NULL, 'administrator', '2020-12-29 11:20:21', '2020-12-29 11:32:28', '2020-12-29 11:32:28'),
('20210104100124390773', '2021-01-04', 'HAIFA', '5280000.00', '5280000.00', '0.00', '2021-01-12', NULL, 64, 'administrator', '2021-01-04 15:30:24', '2021-01-04 15:30:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `penjualan_id` varchar(255) NOT NULL,
  `barang_id` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `rasio_dari_utama` double NOT NULL,
  `tambahan` decimal(15,2) DEFAULT NULL,
  `qty` double NOT NULL,
  `diskon` double DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `pbf_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`penjualan_id`, `barang_id`, `nama`, `harga`, `rasio_dari_utama`, `tambahan`, `qty`, `diskon`, `total`, `pbf_id`) VALUES
('20201229061221231490', 222, 'dus', '1080000.00', 1, NULL, 5, 2, '5292000.00', NULL),
('20201229061200882922', 222, 'pcs', '95000.00', 12, NULL, 10, 0, '950000.00', NULL),
('20210104100124390773', 230, 'dus max', '88000.00', 60, NULL, 60, 0, '5280000.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(2, 'barangmasuk', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(3, 'datamaster', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(4, 'barang', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(5, 'jenisbarang', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(6, 'pelanggan', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(7, 'supplier', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(8, 'laporan', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(9, 'laporanpenjualan', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(10, 'laporanstokbarang', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(11, 'pengguna', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(12, 'penjualan', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33'),
(13, 'postingstok', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'web', '2019-04-23 20:38:59', '2019-04-23 20:38:59'),
(2, 'user', 'web', '2019-04-23 20:38:59', '2019-04-23 20:38:59'),
(3, 'guest', 'web', '2019-04-23 20:38:59', '2019-04-23 20:38:59');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `barang_id` bigint(20) NOT NULL,
  `urutan` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `rasio_dari_utama` double NOT NULL,
  `utama` tinyint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`barang_id`, `urutan`, `nama`, `harga`, `rasio_dari_utama`, `utama`) VALUES
(222, 0, 'dus', '1080000.00', 1, 1),
(222, 1, 'pcs', '95000.00', 12, 0),
(223, 0, 'pack', '60000.00', 1, 1),
(224, 0, 'PCS', '45000.00', 1, 1),
(225, 0, 'DUS', '1080000.00', 1, 1),
(225, 1, 'Pcs', '95000.00', 1, 0),
(227, 0, 'Pcs', '60000.00', 1, 1),
(228, 0, 'Pcs', '17000.00', 1, 1),
(229, 0, 'Dus', '250000.00', 1, 1),
(229, 1, 'Pcs', '62500.00', 1, 0),
(226, 0, 'Pcs', '50000.00', 1, 1),
(236, 0, 'Pcs', '35000.00', 1, 1),
(237, 0, 'Pcs', '45000.00', 1, 1),
(238, 0, 'Pcs', '32000.00', 1, 1),
(239, 0, 'Pcs', '32000.00', 1, 1),
(240, 0, 'Pcs', '32000.00', 1, 1),
(241, 0, 'Pcs', '26000.00', 1, 1),
(242, 0, 'Pcs', '62500.00', 1, 1),
(243, 0, 'Pcs', '30000.00', 1, 1),
(244, 0, 'Pcs', '55000.00', 1, 1),
(245, 0, 'Pcs', '29000.00', 1, 1),
(246, 0, 'Pcs', '35000.00', 1, 1),
(248, 0, 'Pcs', '32000.00', 1, 1),
(249, 0, 'Pcs', '18000.00', 1, 1),
(250, 0, 'Pcs', '35000.00', 1, 1),
(251, 0, 'Pcs', '20000.00', 1, 1),
(252, 0, 'Pcs', '17000.00', 1, 1),
(253, 0, 'Pcs', '86000.00', 1, 1),
(254, 0, 'Pcs', '26000.00', 1, 1),
(255, 0, 'Pcs', '20000.00', 1, 1),
(233, 0, 'Pcs', '50000.00', 1, 1),
(232, 0, 'Pcs', '50000.00', 1, 1),
(234, 0, 'Pcs', '62500.00', 1, 1),
(235, 0, 'Pcs', '30000.00', 1, 1),
(231, 0, 'Pcs', '60000.00', 1, 1),
(247, 0, 'Dus', '192000.00', 1, 1),
(247, 1, 'Pcs', '15500.00', 1, 0),
(256, 0, 'pcs', '95000.00', 1, 1),
(257, 0, 'DUS', '1056000.00', 1, 1),
(230, 0, 'pcs', '95000.00', 1, 1),
(230, 1, 'Pcs', '95000.00', 1, 0),
(230, 2, 'dus', '90000.00', 12, 0),
(230, 3, 'dus max', '88000.00', 60, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stok_awal`
--

CREATE TABLE `stok_awal` (
  `awal_tanggal` date NOT NULL,
  `barang_id` bigint(20) NOT NULL,
  `qty` double(255,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` bigint(20) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kontak` varchar(255) DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `nama`, `alamat`, `kontak`, `pengguna_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(62, 'CV ZAYCO BOGA ALIFA', 'JAKARTA', 'JAYADI 081299134919', 'administrator', '2020-12-29 11:03:25', '2020-12-29 11:03:25', NULL),
(63, 'PT DAGSAP ENDURA EATORE', 'CAHAYA RAYA BOGOR', '08980784617', 'administrator', '2020-12-29 11:26:41', '2020-12-29 11:26:41', NULL),
(64, 'AGRO GUNA', 'JL. TAMBORA NO. 4 GOMONG MATARAM', '085237424016', 'administrator', '2021-01-04 14:38:01', '2021-01-04 14:38:01', NULL),
(65, 'UD CIPTA', 'BRAWIJAYA MATARAM', '087868702476', 'administrator', '2021-01-04 15:02:04', '2021-01-04 15:02:04', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`barang_id`) USING BTREE,
  ADD KEY `barang_jenis_barang_id_foreign` (`jenis_barang_id`) USING BTREE,
  ADD KEY `barang_obat_pengguna_id_foreign` (`pengguna_id`) USING BTREE,
  ADD KEY `barang_pbf_id_foreign` (`supplier_id`) USING BTREE;

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`barang_masuk_id`) USING BTREE;

--
-- Indexes for table `barang_masuk_detail`
--
ALTER TABLE `barang_masuk_detail`
  ADD KEY `barang_masuk_barang_id_foreign` (`barang_id`) USING BTREE,
  ADD KEY `barang_masuk_detail` (`barang_masuk_id`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`jenis_barang_id`) USING BTREE,
  ADD KEY `jenis_barang_pengguna_id_foreign` (`pengguna_id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_type`,`pengguna_id`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_type`) USING BTREE,
  ADD KEY `izin_pengguna_fk` (`pengguna_id`) USING BTREE;

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_type`,`pengguna_id`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_type`) USING BTREE,
  ADD KEY `level_pengguna_fk` (`pengguna_id`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`pelanggan_id`) USING BTREE,
  ADD KEY `supplier_pengguna_id_foreign` (`pengguna_id`) USING BTREE;

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`pengguna_id`) USING BTREE;

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`penjualan_id`) USING BTREE,
  ADD KEY `pelanggan_id` (`pelanggan_id`) USING BTREE;

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD KEY `penjualan_detail_penjualan_id_foreign` (`penjualan_id`) USING BTREE,
  ADD KEY `penjualan_detail_pbf_id_foreign` (`pbf_id`) USING BTREE;

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_unique` (`name`) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_unique` (`name`) USING BTREE;

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD KEY `satuan_barang_id_foreign` (`barang_id`) USING BTREE;

--
-- Indexes for table `stok_awal`
--
ALTER TABLE `stok_awal`
  ADD PRIMARY KEY (`awal_tanggal`,`barang_id`) USING BTREE;

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`) USING BTREE,
  ADD KEY `supplier_pengguna_id_foreign` (`pengguna_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `barang_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `barang_masuk_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `jenis_barang_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `pelanggan_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_jenis_barang_id_foreign` FOREIGN KEY (`jenis_barang_id`) REFERENCES `jenis_barang` (`jenis_barang_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_obat_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_pbf_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON UPDATE CASCADE;

--
-- Constraints for table `barang_masuk_detail`
--
ALTER TABLE `barang_masuk_detail`
  ADD CONSTRAINT `barang_masuk_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_masuk_detail` FOREIGN KEY (`barang_masuk_id`) REFERENCES `barang_masuk` (`barang_masuk_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD CONSTRAINT `jenis_barang_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `model_has_permissions_ibfk_2` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `model_has_roles_ibfk_2` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`pelanggan_id`) ON UPDATE CASCADE;

--
-- Constraints for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD CONSTRAINT `penjualan_detail_pbf_id_foreign` FOREIGN KEY (`pbf_id`) REFERENCES `supplier` (`supplier_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_detail_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`penjualan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `satuan`
--
ALTER TABLE `satuan`
  ADD CONSTRAINT `satuan_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
