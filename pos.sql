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

 Date: 03/01/2024 08:56:26
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
) ENGINE=InnoDB AUTO_INCREMENT=270  ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of barang
-- ----------------------------
BEGIN;
INSERT INTO `barang` VALUES (222, 'mozarella olden burger 1 kg', 0, NULL, 1, NULL, NULL, 'administrator', '2020-12-29 10:57:36', '2024-01-02 08:23:23', '2020-12-30 04:30:13', 'pcs', 10000.00);
INSERT INTO `barang` VALUES (223, 'sosis yona 1 kg', 0, NULL, 1, NULL, NULL, 'administrator', '2020-12-29 11:24:38', '2024-01-02 08:23:23', '2020-12-30 04:30:19', 'pcs', 20000.00);
INSERT INTO `barang` VALUES (224, 'DAGING SLICE', 0, NULL, 1, NULL, NULL, 'administrator', '2020-12-29 11:42:03', '2024-01-02 08:23:23', '2020-12-30 04:30:06', 'pcs', 30000.00);
INSERT INTO `barang` VALUES (225, 'Mozarella Olden Burger', 12, NULL, 1, NULL, NULL, 'administrator', '2020-12-31 04:35:53', '2024-01-02 08:23:23', '2021-01-04 08:28:02', 'pcs', 40000.00);
INSERT INTO `barang` VALUES (226, 'Kanzler Chese FrankFurter', -4, NULL, 1, NULL, NULL, 'administrator', '2020-12-31 04:58:37', '2024-01-02 08:22:23', '2021-01-04 08:27:54', 'pcs', 10000.00);
INSERT INTO `barang` VALUES (227, 'Sosis Yona', 58, NULL, 1, NULL, NULL, 'administrator', '2020-12-31 05:01:11', '2024-01-02 08:22:24', '2021-01-04 08:28:14', 'pcs', 20000.00);
INSERT INTO `barang` VALUES (228, 'Saus BBQ', 0, NULL, 1, NULL, NULL, 'administrator', '2020-12-31 05:02:35', '2024-01-02 08:22:26', '2021-01-04 08:28:07', 'pcs', 30000.00);
INSERT INTO `barang` VALUES (229, 'Kentang 2,5kg', 0, NULL, 1, NULL, NULL, 'administrator', '2020-12-31 05:05:25', '2024-01-02 08:22:28', '2021-01-04 08:28:23', 'pcs', 40000.00);
INSERT INTO `barang` VALUES (230, 'Mozarella Olden Burger', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:41:34', '2024-01-02 08:22:30', NULL, 'pcs', 5000.00);
INSERT INTO `barang` VALUES (231, 'Sosis Yona', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:43:15', '2024-01-02 08:22:33', NULL, 'pcs', 60000.00);
INSERT INTO `barang` VALUES (232, 'Kanzler Chese FrankFurter', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:44:52', '2024-01-02 08:22:55', NULL, 'pcs', 10000.00);
INSERT INTO `barang` VALUES (233, 'Kanzler Chese Cocktail', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:46:42', '2024-01-02 08:22:55', NULL, 'pcs', 20000.00);
INSERT INTO `barang` VALUES (234, 'Kentang DPP 2,5kg', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:48:33', '2024-01-02 08:22:55', NULL, 'pcs', 30000.00);
INSERT INTO `barang` VALUES (235, 'Mix Vegetable', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:49:37', '2024-01-02 08:22:55', NULL, 'pcs', 40000.00);
INSERT INTO `barang` VALUES (236, 'Ayam Slice', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:50:24', '2024-01-02 08:22:55', NULL, 'pcs', 5000.00);
INSERT INTO `barang` VALUES (237, 'Daging Slice', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:51:00', '2024-01-02 08:22:55', NULL, 'pcs', 60000.00);
INSERT INTO `barang` VALUES (238, 'Sosis Belfood Ayam', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:52:01', '2024-01-02 08:23:08', NULL, 'pcs', 10000.00);
INSERT INTO `barang` VALUES (239, 'Sosis Belfood Sapi', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:52:53', '2024-01-02 08:23:08', NULL, 'pcs', 20000.00);
INSERT INTO `barang` VALUES (240, 'Sosis Hemato', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:53:30', '2024-01-02 08:23:08', NULL, 'pcs', 30000.00);
INSERT INTO `barang` VALUES (241, 'Kentang Frozeland', 1, 'Keterangan', 1, NULL, NULL, 'administrator', '2021-01-04 10:54:03', '2024-01-02 16:55:08', NULL, 'pcs', 10000.00);
INSERT INTO `barang` VALUES (242, 'Kentang Bart\'s French Friesh', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:56:38', '2024-01-02 08:23:08', NULL, 'pcs', 5000.00);
INSERT INTO `barang` VALUES (243, 'Kanzler Beef Cocktail 250gr', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 10:57:43', '2024-01-02 08:23:08', NULL, 'pcs', 60000.00);
INSERT INTO `barang` VALUES (244, 'Kanzler Beef Cocktail 500gr', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:05:20', '2024-01-02 08:23:08', NULL, 'pcs', 10000.00);
INSERT INTO `barang` VALUES (245, 'Sosis Bakar', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:05:58', '2024-01-02 08:23:08', NULL, 'pcs', 20000.00);
INSERT INTO `barang` VALUES (246, 'Mozzarella Kareem 250gr', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:08:44', '2024-01-02 08:23:08', NULL, 'pcs', 30000.00);
INSERT INTO `barang` VALUES (247, 'Susu UHT', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:11:03', '2024-01-02 08:23:08', NULL, 'pcs', 40000.00);
INSERT INTO `barang` VALUES (248, 'Sosis Asimo 1kg', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:11:48', '2024-01-02 08:23:08', NULL, 'pcs', 5000.00);
INSERT INTO `barang` VALUES (249, 'Sosis Asimo 500gr', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:12:19', '2024-01-02 08:23:08', NULL, 'pcs', 60000.00);
INSERT INTO `barang` VALUES (250, 'Nugget Hemato', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:13:26', '2024-01-02 08:23:15', NULL, 'pcs', 10000.00);
INSERT INTO `barang` VALUES (251, 'Saus Keju', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:14:05', '2024-01-02 08:23:15', NULL, 'pcs', 20000.00);
INSERT INTO `barang` VALUES (252, 'Saus BBQ', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:14:45', '2024-01-02 08:23:15', NULL, 'pcs', 30000.00);
INSERT INTO `barang` VALUES (253, 'Saus Tomat ABC', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:15:22', '2024-01-02 08:23:15', NULL, 'pcs', 40000.00);
INSERT INTO `barang` VALUES (254, 'Mayonis Mamayo', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:15:54', '2024-01-02 08:23:15', NULL, 'pcs', 5000.00);
INSERT INTO `barang` VALUES (255, 'Nugget Belfood Ayam', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 11:17:13', '2024-01-02 08:23:15', NULL, 'pcs', 60000.00);
INSERT INTO `barang` VALUES (256, 'MOZARELLA OLDEN BURGER', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 14:48:46', '2024-01-02 08:23:15', '2021-01-04 15:26:18', 'pcs', 10000.00);
INSERT INTO `barang` VALUES (257, 'MOZARELLA OLDEN BURGER 1 KG', 0, NULL, 1, NULL, NULL, 'administrator', '2021-01-04 15:18:08', '2024-01-02 08:23:15', '2021-01-04 15:26:27', 'pcs', 20000.00);
INSERT INTO `barang` VALUES (261, 'pcs', 10, NULL, 1, NULL, NULL, 'administrator', '2023-12-31 17:58:40', '2024-01-02 08:23:15', NULL, 'pcs', 30000.00);
INSERT INTO `barang` VALUES (262, 'pcs', 10, NULL, 1, NULL, NULL, 'administrator', '2023-12-31 17:59:30', '2024-01-02 08:23:15', NULL, 'pcs', 40000.00);
INSERT INTO `barang` VALUES (263, 'tes', 10, NULL, 1, NULL, NULL, 'administrator', '2023-12-31 18:00:18', '2024-01-02 08:23:15', NULL, 'pcs', 5000.00);
INSERT INTO `barang` VALUES (264, 'asdf1231', 10, NULL, 1, NULL, NULL, 'administrator', '2023-12-31 18:00:41', '2024-01-02 08:23:27', NULL, 'pcs', 10000.00);
INSERT INTO `barang` VALUES (265, 'Nama', 10, 'keterangan', 1, NULL, 65, 'administrator', '2023-12-31 18:07:50', '2024-01-02 08:23:27', '2023-12-31 18:08:00', 'pcs', 20000.00);
INSERT INTO `barang` VALUES (268, 'asdf', 12, '123123', 1, 138, NULL, 'administrator', '2023-12-31 18:49:48', '2024-01-02 16:55:35', NULL, 'asdf', 12000.00);
INSERT INTO `barang` VALUES (269, 'asf', 123123, NULL, 1, NULL, NULL, 'administrator', '2023-12-31 18:51:03', '2024-01-02 08:23:27', NULL, 'pcs', 40000.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of barang_masuk
-- ----------------------------
BEGIN;
INSERT INTO `barang_masuk` VALUES (7, '2020-12-24', '00/27', NULL, NULL, '2020-12-29', 62, 'administrator', '2020-12-29 11:11:35', '2020-12-29 12:14:18', '2020-12-29 12:14:18');
INSERT INTO `barang_masuk` VALUES (8, '2020-12-29', '000', NULL, '2020-12-31', '2020-12-29', 63, 'administrator', '2020-12-29 11:30:59', '2020-12-29 12:14:21', '2020-12-29 12:14:21');
INSERT INTO `barang_masuk` VALUES (9, '2020-12-28', '-', NULL, '2020-12-31', NULL, 62, 'administrator', '2020-12-29 11:47:06', '2020-12-29 11:47:25', '2020-12-29 11:47:25');
INSERT INTO `barang_masuk` VALUES (10, '2021-01-04', '00Z', 'MOZARELA OLDEN BURGER', NULL, '2021-01-04', 62, 'administrator', '2021-01-04 14:35:14', '2021-01-04 14:50:37', '2021-01-04 14:50:37');
INSERT INTO `barang_masuk` VALUES (11, '2021-01-04', 'S2101061', 'KANZLER', '2021-01-11', NULL, 64, 'administrator', '2021-01-04 14:40:14', '2021-01-04 14:41:53', '2021-01-04 14:41:53');
INSERT INTO `barang_masuk` VALUES (12, '2021-01-04', 'S2101061', NULL, '2021-01-11', NULL, 64, 'administrator', '2021-01-04 14:45:18', '2021-01-04 14:50:33', '2021-01-04 14:50:33');
INSERT INTO `barang_masuk` VALUES (13, '2021-01-04', '0rr', NULL, NULL, '2021-01-04', 62, 'administrator', '2021-01-04 14:53:19', '2021-01-04 15:27:00', '2021-01-04 15:27:00');
INSERT INTO `barang_masuk` VALUES (14, '2021-01-04', '00', NULL, '2021-01-11', NULL, 64, 'administrator', '2021-01-04 14:55:56', '2021-01-04 14:56:41', '2021-01-04 14:56:41');
INSERT INTO `barang_masuk` VALUES (15, '2021-01-04', 's21011061', NULL, '2021-01-11', '2023-12-31', 64, 'administrator', '2021-01-04 15:00:22', '2023-12-31 18:32:39', NULL);
INSERT INTO `barang_masuk` VALUES (16, '2021-01-04', '00/23', NULL, '2021-01-06', '2023-12-31', 65, 'administrator', '2021-01-04 15:03:50', '2023-12-31 18:32:42', NULL);
INSERT INTO `barang_masuk` VALUES (17, '2021-01-04', '00', NULL, NULL, '2021-01-04', 63, 'administrator', '2021-01-04 15:07:00', '2021-01-04 15:07:00', NULL);
INSERT INTO `barang_masuk` VALUES (18, '2021-01-04', '00/11', NULL, NULL, '2021-01-04', 64, 'administrator', '2021-01-04 15:08:38', '2021-01-04 15:08:38', NULL);
INSERT INTO `barang_masuk` VALUES (19, '2021-01-04', 'D5647', NULL, NULL, '2021-01-04', 62, 'administrator', '2021-01-04 15:29:04', '2021-01-04 15:29:04', NULL);
INSERT INTO `barang_masuk` VALUES (21, '2023-12-31', '12312', 'keterangan', NULL, '2023-12-31', NULL, 'administrator', '2023-12-31 17:44:11', '2023-12-31 18:33:29', '2023-12-31 18:33:29');
INSERT INTO `barang_masuk` VALUES (26, '2023-12-31', 'asdf', NULL, NULL, '2023-12-31', 63, 'administrator', '2023-12-31 18:42:36', '2023-12-31 18:43:12', '2023-12-31 18:43:12');
INSERT INTO `barang_masuk` VALUES (27, '2023-12-31', 'asdf', NULL, NULL, '2023-12-31', 64, 'administrator', '2023-12-31 18:43:29', '2023-12-31 18:43:29', NULL);
INSERT INTO `barang_masuk` VALUES (29, '2024-01-01', 'No. Faktur', 'Keterangan', NULL, '2024-01-02', 65, 'administrator', '2024-01-02 16:26:58', '2024-01-02 16:28:38', NULL);
INSERT INTO `barang_masuk` VALUES (30, '2024-01-02', 'asf', NULL, NULL, '2024-01-02', 64, 'administrator', '2024-01-02 16:31:47', '2024-01-02 16:31:47', NULL);
INSERT INTO `barang_masuk` VALUES (31, '2024-01-02', 'No. Faktur', 'Keterangan', NULL, NULL, 63, 'administrator', '2024-01-02 16:34:13', '2024-01-02 16:34:13', NULL);
INSERT INTO `barang_masuk` VALUES (35, '2024-01-02', 'Faktur', 'Keterangan', NULL, '2024-01-02', 65, 'administrator', '2024-01-02 18:52:47', '2024-01-02 18:52:47', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of barang_masuk_detail
-- ----------------------------
BEGIN;
INSERT INTO `barang_masuk_detail` VALUES (1, 7, 222, 936000, 35, 32760000.00);
INSERT INTO `barang_masuk_detail` VALUES (2, 8, 223, 60000, 64, 3840000.00);
INSERT INTO `barang_masuk_detail` VALUES (3, 9, 224, 25000, 25, 625000.00);
INSERT INTO `barang_masuk_detail` VALUES (4, 10, 230, 946000, 50, 47300000.00);
INSERT INTO `barang_masuk_detail` VALUES (5, 11, 232, 45500, 10, 455000.00);
INSERT INTO `barang_masuk_detail` VALUES (6, 12, 232, 45500, 10, 1670000.00);
INSERT INTO `barang_masuk_detail` VALUES (7, 12, 243, 25000, 30, 1670000.00);
INSERT INTO `barang_masuk_detail` VALUES (8, 12, 233, 46500, 10, 1670000.00);
INSERT INTO `barang_masuk_detail` VALUES (9, 13, 256, 95000, 251, 23845000.00);
INSERT INTO `barang_masuk_detail` VALUES (10, 14, 243, 25000, 30, 1205000.00);
INSERT INTO `barang_masuk_detail` VALUES (11, 14, 232, 45500, 10, 1205000.00);
INSERT INTO `barang_masuk_detail` VALUES (12, 15, 232, 45500, 10, 1670000.00);
INSERT INTO `barang_masuk_detail` VALUES (13, 15, 243, 25000, 30, 1670000.00);
INSERT INTO `barang_masuk_detail` VALUES (14, 15, 233, 46500, 10, 1670000.00);
INSERT INTO `barang_masuk_detail` VALUES (15, 16, 234, 55000, 8, 440000.00);
INSERT INTO `barang_masuk_detail` VALUES (16, 17, 231, 55000, 31, 1705000.00);
INSERT INTO `barang_masuk_detail` VALUES (17, 18, 252, 15000, 4, 60000.00);
INSERT INTO `barang_masuk_detail` VALUES (18, 19, 230, 78833, 251, 19787083.00);
INSERT INTO `barang_masuk_detail` VALUES (19, 21, 231, 11, 1, 11100.00);
INSERT INTO `barang_masuk_detail` VALUES (20, 26, 231, 10, 1, 11000.00);
INSERT INTO `barang_masuk_detail` VALUES (21, 27, 230, 10000, 1, 11100.00);
INSERT INTO `barang_masuk_detail` VALUES (22, 29, 230, 50000, 10, 500000.00);
INSERT INTO `barang_masuk_detail` VALUES (23, 30, 231, 10000, 2, 20000.00);
INSERT INTO `barang_masuk_detail` VALUES (24, 31, 231, 10000, 1, 10000.00);
INSERT INTO `barang_masuk_detail` VALUES (25, 35, 230, 20000, 15, 300000.00);
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
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=140 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
BEGIN;
INSERT INTO `model_has_permissions` VALUES (1, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (3, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (6, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (8, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (9, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (10, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (12, 'App\\Models\\Pengguna', 'kasir');
INSERT INTO `model_has_permissions` VALUES (13, 'App\\Models\\Pengguna', 'kasir');
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
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=68 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pelanggan
-- ----------------------------
BEGIN;
INSERT INTO `pelanggan` VALUES (62, 'ANGGUN DOMPU', 'Samping Kantor Lurah Karijawa Dompu', '081239888826', 'administrator', '2020-12-29 11:51:09', '2020-12-31 05:09:49', NULL);
INSERT INTO `pelanggan` VALUES (63, 'ANNISA', 'Kebayan Sumbawa Besar', '082340725981', 'administrator', '2020-12-31 05:12:52', '2020-12-31 05:12:52', NULL);
INSERT INTO `pelanggan` VALUES (64, 'HAIFA SOSIS AMPENAN', 'JL. SALEH SUNGKAR AMPENAN', 'AINI', 'administrator', '2021-01-04 15:11:43', '2021-01-04 15:11:43', NULL);
INSERT INTO `pelanggan` VALUES (65, 'asdfasdf', 'asdf', 'asdf', 'administrator', '2023-12-31 18:12:00', '2023-12-31 18:12:53', '2023-12-31 18:12:53');
INSERT INTO `pelanggan` VALUES (66, '123123asdf', 'asdf', 'asdf123', 'administrator', '2023-12-31 18:12:19', '2023-12-31 18:12:47', '2023-12-31 18:12:47');
INSERT INTO `pelanggan` VALUES (67, '123123asdf11111', 'asdf', 'asdf123', 'administrator', '2023-12-31 18:12:25', '2023-12-31 18:12:51', '2023-12-31 18:12:51');
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
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
BEGIN;
INSERT INTO `pengguna` VALUES ('administrator', '$2y$10$8D1JqX6wwuCZuKMRYaIw3O2adcJyxEKxCsiA73cv3ASeyxxD2xbXa', 'Administrator', NULL, NULL, '2020-10-22 06:31:28', NULL);
INSERT INTO `pengguna` VALUES ('kasir', '$2y$10$ZSQZX3VdiZJw.hhJqmGnCufUzzndevyRSCscbqCDgDq5kSmSELTvS', 'kasir', NULL, '2020-12-29 11:58:17', '2020-12-29 11:59:15', NULL);
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
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of penjualan
-- ----------------------------
BEGIN;
INSERT INTO `penjualan` VALUES ('20201229061200882922', '2020-12-29', 'BUTUH SEGERA', NULL, 950000.00, 995000.00, 45000.00, NULL, NULL, '2020-12-29', 62, 'administrator', '2020-12-29 11:54:00', '2020-12-29 11:56:38', '2020-12-29 11:56:38');
INSERT INTO `penjualan` VALUES ('20201229061221231490', '2020-12-29', '-', NULL, 5292000.00, 5292000.00, 0.00, NULL, '2021-01-05', NULL, NULL, 'administrator', '2020-12-29 11:20:21', '2020-12-29 11:32:28', '2020-12-29 11:32:28');
INSERT INTO `penjualan` VALUES ('20210104100124390773', '2021-01-04', 'HAIFA', NULL, 5280000.00, 5280000.00, 0.00, NULL, '2021-01-12', '2023-12-31', 64, 'administrator', '2021-01-04 15:30:24', '2023-12-31 18:32:44', NULL);
INSERT INTO `penjualan` VALUES ('20240102060120252527', '2024-01-02', NULL, 24000.00, 24000.00, 30000.00, 6000.00, 0.00, NULL, '2024-01-02', NULL, 'administrator', '2024-01-02 18:40:20', '2024-01-02 18:40:20', NULL);
INSERT INTO `penjualan` VALUES ('20240102060128036488', '2024-01-02', NULL, 600000.00, 600000.00, 2222222.00, 1622222.00, 0.00, NULL, '2024-01-02', NULL, 'administrator', '2024-01-02 18:27:28', '2024-01-02 18:27:28', NULL);
INSERT INTO `penjualan` VALUES ('20240102060154417426', '2024-01-02', NULL, 10000.00, 10000.00, 10000.00, 0.00, 0.00, NULL, '2024-01-02', NULL, 'administrator', '2024-01-02 18:40:54', '2024-01-02 18:40:54', NULL);
INSERT INTO `penjualan` VALUES ('20240102060156075719', '2024-01-02', 'asdfasdf', 24000.00, 24000.00, 30000.00, 6000.00, 0.00, NULL, '2024-01-02', NULL, 'administrator', '2024-01-02 18:39:56', '2024-01-02 18:39:56', NULL);
INSERT INTO `penjualan` VALUES ('20240102070120851451', '2024-01-02', NULL, 20000.00, 20000.00, 20000.00, 0.00, 0.00, NULL, '2024-01-02', NULL, 'administrator', '2024-01-02 19:29:20', '2024-01-02 19:29:20', NULL);
INSERT INTO `penjualan` VALUES ('20240102070128622898', '2024-01-02', NULL, 20000.00, 20000.00, 20000.00, 0.00, 0.00, NULL, '2024-01-02', NULL, 'administrator', '2024-01-02 19:34:28', '2024-01-02 19:34:28', NULL);
INSERT INTO `penjualan` VALUES ('20240102070134971983', '2024-01-02', 'asdf', 20000.00, 20000.00, 20000.00, 0.00, 0.00, NULL, '2024-01-02', NULL, 'administrator', '2024-01-02 19:28:34', '2024-01-02 19:28:34', NULL);
INSERT INTO `penjualan` VALUES ('20240102070146827860', '2024-01-02', NULL, 20000.00, 20000.00, 20000.00, 0.00, 0.00, NULL, '2024-01-02', NULL, 'administrator', '2024-01-02 19:35:46', '2024-01-02 19:35:46', NULL);
INSERT INTO `penjualan` VALUES ('20240102080100733659', '2024-01-02', 'asdf', 144000.00, 134000.00, 135000.00, 1000.00, 10000.00, NULL, '2024-01-02', NULL, 'administrator', '2024-01-02 20:42:00', '2024-01-02 20:42:00', NULL);
INSERT INTO `penjualan` VALUES ('20240103080104683132', '2024-01-03', 'asdfasdf', 252000.00, 252000.00, 300000.00, 48000.00, 0.00, NULL, '2024-01-03', NULL, 'administrator', '2024-01-03 08:31:04', '2024-01-03 08:31:04', NULL);
INSERT INTO `penjualan` VALUES ('20240103080113900822', '2024-01-03', NULL, 24000.00, 24000.00, 24000.00, 0.00, 0.00, NULL, '2024-01-03', NULL, 'administrator', '2024-01-03 08:30:13', '2024-01-03 08:30:13', NULL);
INSERT INTO `penjualan` VALUES ('20240103080117364946', '2024-01-03', 'Keterangan', 220000.00, 220000.00, 230000.00, 10000.00, 0.00, NULL, '2024-01-03', NULL, 'administrator', '2024-01-03 08:04:17', '2024-01-03 08:04:17', NULL);
INSERT INTO `penjualan` VALUES ('20240103080158394373', '2024-01-03', 'asdasdf', 20000.00, 20000.00, 20000.00, 0.00, 0.00, NULL, '2024-01-03', NULL, 'administrator', '2024-01-03 08:49:58', '2024-01-03 08:49:58', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of penjualan_detail
-- ----------------------------
BEGIN;
INSERT INTO `penjualan_detail` VALUES (1, '20201229061221231490', 222, 'dus', 1080000.00, 5, 5292000.00);
INSERT INTO `penjualan_detail` VALUES (2, '20201229061200882922', 222, 'pcs', 95000.00, 10, 950000.00);
INSERT INTO `penjualan_detail` VALUES (3, '20210104100124390773', 230, 'dus max', 88000.00, 60, 5280000.00);
INSERT INTO `penjualan_detail` VALUES (4, '20240102060128036488', 246, 'pcs', 30000.00, 20, 600000.00);
INSERT INTO `penjualan_detail` VALUES (5, '20240102060156075719', 268, 'asdf', 12000.00, 2, 24000.00);
INSERT INTO `penjualan_detail` VALUES (6, '20240102060120252527', 268, 'asdf', 12000.00, 2, 24000.00);
INSERT INTO `penjualan_detail` VALUES (7, '20240102060154417426', 264, 'pcs', 10000.00, 1, 10000.00);
INSERT INTO `penjualan_detail` VALUES (8, '20240102070134971983', 264, 'pcs', 10000.00, 2, 20000.00);
INSERT INTO `penjualan_detail` VALUES (9, '20240102070120851451', 264, 'pcs', 10000.00, 2, 20000.00);
INSERT INTO `penjualan_detail` VALUES (10, '20240102070128622898', 264, 'pcs', 10000.00, 2, 20000.00);
INSERT INTO `penjualan_detail` VALUES (11, '20240102070146827860', 264, 'pcs', 10000.00, 2, 20000.00);
INSERT INTO `penjualan_detail` VALUES (12, '20240102080100733659', 268, 'asdf', 12000.00, 12, 144000.00);
INSERT INTO `penjualan_detail` VALUES (13, '20240103080117364946', 244, 'pcs', 10000.00, 22, 220000.00);
INSERT INTO `penjualan_detail` VALUES (15, '20240103080113900822', 268, 'asdf', 12000.00, 2, 24000.00);
INSERT INTO `penjualan_detail` VALUES (16, '20240103080104683132', 268, 'asdf', 12000.00, 21, 252000.00);
INSERT INTO `penjualan_detail` VALUES (17, '20240103080158394373', 264, 'pcs', 10000.00, 2, 20000.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES (1, 'dashboard', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (2, 'barangmasuk', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (3, 'datamaster', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (4, 'barang', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (5, 'jenisbarang', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (6, 'pelanggan', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (7, 'supplier', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (8, 'laporan', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (9, 'laporanpenjualan', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (10, 'laporanstokbarang', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (11, 'pengguna', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (12, 'penjualan', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
INSERT INTO `permissions` VALUES (13, 'postingstok', 'web', '2020-12-28 08:34:33', '2020-12-28 08:34:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=15;

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
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=67 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
INSERT INTO `supplier` VALUES (62, 'CV ZAYCO BOGA ALIFA', 'JAKARTA', 'JAYADI 081299134919', 'administrator', '2020-12-29 11:03:25', '2020-12-29 11:03:25', NULL);
INSERT INTO `supplier` VALUES (63, 'PT DAGSAP ENDURA EATORE', 'CAHAYA RAYA BOGOR', '08980784617', 'administrator', '2020-12-29 11:26:41', '2020-12-29 11:26:41', NULL);
INSERT INTO `supplier` VALUES (64, 'AGRO GUNA', 'JL. TAMBORA NO. 4 GOMONG MATARAM', '085237424016', 'administrator', '2021-01-04 14:38:01', '2021-01-04 14:38:01', NULL);
INSERT INTO `supplier` VALUES (65, 'UD CIPTA', 'BRAWIJAYA MATARAM', '087868702476', 'administrator', '2021-01-04 15:02:04', '2021-01-04 15:02:04', NULL);
INSERT INTO `supplier` VALUES (66, 'asdf123', 'asdf', '1231 123asd123', 'administrator', '2023-12-31 18:13:31', '2023-12-31 18:13:36', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
