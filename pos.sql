/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:55001
 Source Schema         : pos

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 03/01/2024 15:28:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barang
-- ----------------------------
DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `stok_min` double NOT NULL DEFAULT '0',
  `keterangan` text,
  `stok` tinyint NOT NULL DEFAULT '1',
  `jenis_barang_id` bigint DEFAULT NULL,
  `supplier_id` bigint DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL,
  `harga` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `barang_jenis_barang_id_foreign` (`jenis_barang_id`) USING BTREE,
  KEY `barang_obat_pengguna_id_foreign` (`pengguna_id`) USING BTREE,
  KEY `barang_pbf_id_foreign` (`supplier_id`) USING BTREE,
  CONSTRAINT `barang_jenis_barang_id_foreign` FOREIGN KEY (`jenis_barang_id`) REFERENCES `jenis_barang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `barang_obat_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `barang_pbf_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of barang
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for barang_masuk
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk`;
CREATE TABLE `barang_masuk` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tanggal` varchar(255) DEFAULT NULL,
  `faktur` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `jatuh_tempo` date DEFAULT NULL,
  `lunas` date DEFAULT NULL,
  `supplier_id` bigint DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pengguna_id` (`pengguna_id`),
  CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of barang_masuk
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for barang_masuk_detail
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk_detail`;
CREATE TABLE `barang_masuk_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `barang_masuk_id` bigint NOT NULL,
  `barang_id` bigint DEFAULT NULL,
  `harga` decimal(15,0) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `sub_total` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barang_masuk_barang_id_foreign` (`barang_id`) USING BTREE,
  KEY `barang_masuk_detail` (`barang_masuk_id`) USING BTREE,
  CONSTRAINT `barang_masuk_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `barang_masuk_detail` FOREIGN KEY (`barang_masuk_id`) REFERENCES `barang_masuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of barang_masuk_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jenis_barang
-- ----------------------------
DROP TABLE IF EXISTS `jenis_barang`;
CREATE TABLE `jenis_barang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `jenis_barang_pengguna_id_foreign` (`pengguna_id`) USING BTREE,
  CONSTRAINT `jenis_barang_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jenis_barang
-- ----------------------------
BEGIN;
INSERT INTO `jenis_barang` VALUES (138, 'aasdf', 'administrator', '2023-12-31 18:10:08', '2023-12-31 18:10:08', NULL);
INSERT INTO `jenis_barang` VALUES (139, 'aasdf333', 'administrator', '2023-12-31 18:11:02', '2023-12-31 18:11:29', '2023-12-31 18:11:29');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `pengguna_id` varchar(255) NOT NULL,
  PRIMARY KEY (`permission_id`,`model_type`,`pengguna_id`) USING BTREE,
  KEY `model_has_permissions_model_id_model_type_index` (`model_type`) USING BTREE,
  KEY `izin_pengguna_fk` (`pengguna_id`) USING BTREE,
  CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `model_has_permissions_ibfk_2` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
BEGIN;
INSERT INTO `model_has_permissions` VALUES (14, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (15, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (16, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (17, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (18, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (19, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (20, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (21, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (22, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (23, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (24, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (25, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (26, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (27, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (28, 'App\\Models\\Pengguna', 'kasir');
COMMIT;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` int unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `pengguna_id` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`,`model_type`,`pengguna_id`) USING BTREE,
  KEY `model_has_roles_model_id_model_type_index` (`model_type`) USING BTREE,
  KEY `level_pengguna_fk` (`pengguna_id`) USING BTREE,
  CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `model_has_roles_ibfk_2` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
BEGIN;
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\Pengguna', 'administrator');
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\Pengguna', 'kasir');
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pelanggan
-- ----------------------------
DROP TABLE IF EXISTS `pelanggan`;
CREATE TABLE `pelanggan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text,
  `kontak` varchar(255) DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supplier_pengguna_id_foreign` (`pengguna_id`) USING BTREE,
  CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pelanggan
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna` (
  `id` varchar(255) NOT NULL,
  `sandi` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
BEGIN;
INSERT INTO `pengguna` VALUES ('administrator', '$2y$10$8D1JqX6wwuCZuKMRYaIw3O2adcJyxEKxCsiA73cv3ASeyxxD2xbXa', 'Administrator', NULL, NULL, '2020-10-22 06:31:28', NULL);
INSERT INTO `pengguna` VALUES ('kasir', '$2y$10$Q/vIf1owaniTKZXb7vcd8Owxfd2slCT9pnRU38NKRc0n/uRE9faE2', 'Kasir', NULL, '2024-01-03 15:09:09', '2024-01-03 15:09:09', NULL);
COMMIT;

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `keterangan` text,
  `sub_total` decimal(15,2) DEFAULT NULL,
  `tagihan` decimal(15,2) DEFAULT NULL,
  `bayar` decimal(15,2) DEFAULT NULL,
  `sisa` decimal(15,2) DEFAULT NULL,
  `diskon` decimal(15,2) DEFAULT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `lunas` date DEFAULT NULL,
  `pelanggan_id` bigint DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pelanggan_id` (`pelanggan_id`) USING BTREE,
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of penjualan
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for penjualan_detail
-- ----------------------------
DROP TABLE IF EXISTS `penjualan_detail`;
CREATE TABLE `penjualan_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `penjualan_id` varchar(255) NOT NULL,
  `barang_id` bigint NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `qty` double NOT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penjualan_detail_penjualan_id_foreign` (`penjualan_id`) USING BTREE,
  CONSTRAINT `penjualan_detail_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of penjualan_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permissions_name_unique` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES (14, 'dashboard', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (15, 'barangmasuk', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (16, 'datamaster', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (17, 'barang', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (18, 'jenisbarang', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (19, 'pelanggan', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (20, 'supplier', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (21, 'laporan', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (22, 'laporanpenjualan', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (23, 'laporanretur', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (24, 'laporanstokbarang', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (25, 'pengguna', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (26, 'penjualan', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (27, 'retur', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
INSERT INTO `permissions` VALUES (28, 'postingstok', 'web', '2024-01-03 15:08:40', '2024-01-03 15:08:40');
COMMIT;

-- ----------------------------
-- Table structure for retur
-- ----------------------------
DROP TABLE IF EXISTS `retur`;
CREATE TABLE `retur` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `barang_id` bigint DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `harga` decimal(15,2) DEFAULT NULL,
  `pelanggan_id` bigint DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of retur
-- ----------------------------
BEGIN;
INSERT INTO `retur` VALUES (8, '2023-12-31', 1, 231, 'Pcs', 'asdf', 0.00, NULL, 'administrator', '2023-12-31 08:35:58', '2023-12-31 09:04:08', '2023-12-31 09:04:08');
INSERT INTO `retur` VALUES (9, '2023-12-31', 10, 231, 'Pcs', 'asdfasdf', 100000.00, NULL, 'administrator', '2023-12-31 08:40:52', '2023-12-31 09:04:05', '2023-12-31 09:04:05');
INSERT INTO `retur` VALUES (10, '2023-12-31', 1, 231, 'Pcs', 'asd', 100000.00, NULL, 'administrator', '2023-12-31 10:15:24', '2023-12-31 10:15:24', NULL);
INSERT INTO `retur` VALUES (11, '2023-12-31', 1, 231, 'Pcs', 'asdfa', 10000.00, NULL, 'administrator', '2023-12-31 19:00:14', '2023-12-31 19:00:14', NULL);
INSERT INTO `retur` VALUES (12, '2023-12-31', 100, 230, 'pcs', 'asdf', 10000.00, NULL, 'administrator', '2023-12-31 19:03:28', '2023-12-31 19:03:28', NULL);
INSERT INTO `retur` VALUES (13, '2023-12-31', 1, 230, 'pcs', 'asdf', 100000.00, NULL, 'administrator', '2023-12-31 19:03:49', '2023-12-31 19:03:49', NULL);
INSERT INTO `retur` VALUES (14, '2023-12-31', 1, 230, 'pcs', 'aS', 100000.00, NULL, 'administrator', '2023-12-31 19:07:06', '2023-12-31 19:07:06', NULL);
COMMIT;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_name_unique` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, 'super-admin', 'web', '2019-04-23 20:38:59', '2019-04-23 20:38:59');
INSERT INTO `roles` VALUES (2, 'user', 'web', '2019-04-23 20:38:59', '2019-04-23 20:38:59');
INSERT INTO `roles` VALUES (3, 'guest', 'web', '2019-04-23 20:38:59', '2019-04-23 20:38:59');
COMMIT;

-- ----------------------------
-- Table structure for stok_awal
-- ----------------------------
DROP TABLE IF EXISTS `stok_awal`;
CREATE TABLE `stok_awal` (
  `tanggal` date NOT NULL,
  `barang_id` bigint NOT NULL,
  `qty` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`tanggal`,`barang_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of stok_awal
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text,
  `kontak` varchar(255) DEFAULT NULL,
  `pengguna_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supplier_pengguna_id_foreign` (`pengguna_id`) USING BTREE,
  CONSTRAINT `supplier_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
