/*
 Navicat Premium Data Transfer

 Source Server         : Localhost 57
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : pos

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 28/12/2020 15:25:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barang
-- ----------------------------
DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang`  (
  `barang_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barang_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `barang_stok_min` double NOT NULL DEFAULT 0,
  `barang_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jenis_barang_id` bigint(20) NULL DEFAULT NULL,
  `supplier_id` bigint(20) NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`barang_id`) USING BTREE,
  INDEX `barang_jenis_barang_id_foreign`(`jenis_barang_id`) USING BTREE,
  INDEX `barang_obat_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  INDEX `barang_pbf_id_foreign`(`supplier_id`) USING BTREE,
  CONSTRAINT `barang_jenis_barang_id_foreign` FOREIGN KEY (`jenis_barang_id`) REFERENCES `jenis_barang` (`jenis_barang_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_obat_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_pbf_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang
-- ----------------------------
INSERT INTO `barang` VALUES (1, 'Actifed merah Batuk pilek sirup', 10, NULL, 27, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:56:38', NULL);
INSERT INTO `barang` VALUES (2, 'Acyclovir generik', 10, NULL, 3, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (3, 'Alerzin sirup', 10, NULL, 40, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (4, 'Alkohol 70% 100 ml botol', 10, NULL, 5, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (5, 'Alkohol 70% 300 ml botol', 10, NULL, 5, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (6, 'Alleron ', 10, NULL, 42, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (7, 'Alloris tablet', 10, NULL, 79, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (8, 'Amlodipine 10 mg ', 10, NULL, 9, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (9, 'Amoxan 500 mg', 10, NULL, 10, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (10, 'Amoxan drop ', 10, NULL, 11, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (11, 'Amoxan Forte sirup', 10, NULL, 13, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (12, 'Amoxan sirup ', 10, NULL, 12, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (13, 'Anelat', 10, NULL, 16, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (14, 'Antasida DOEN tablet', 10, NULL, 14, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (15, 'Apialis drop', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (16, 'Apialis sirup', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (17, 'Aspilet chewable', 10, NULL, 1, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (18, 'Azitromisin Nulab', 10, NULL, 23, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (19, 'Batugin Elixir 300 ml', 10, NULL, 24, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (20, 'BDM sirup', 10, NULL, 53, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (21, 'Betadine sol 5 ml', 10, NULL, 29, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (22, 'Betason krim 5 gr', 10, NULL, 30, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (23, 'Betason N krim 5 gr ', 10, NULL, 31, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (24, 'Bioplacenton 15 gr', 10, NULL, 112, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (25, 'Bufacomb cream in ora base', 10, NULL, 125, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (26, 'Bufect forte sirup 200 mg', 10, NULL, 67, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (27, 'Bufect sirup 100 mg', 10, NULL, 67, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (28, 'Bye-bye fever anak ', 10, NULL, 120, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (29, 'Bye-bye fever bayi', 10, NULL, 120, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (30, 'Cardipin 10 mg', 10, NULL, 9, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (31, 'Carmed 10% krim 40 gr', 10, NULL, 126, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (32, 'Carmed 20% krim 40 gr', 10, NULL, 127, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (33, 'Caviplex', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (34, 'Cefadroxil generik', 10, NULL, 35, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (35, 'Cefat 500 mg', 10, NULL, 35, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (36, 'Cefco ', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (37, 'Cefixime 100 mg Hexa', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (38, 'Cefixime 100 mg KF', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (39, 'Cefixime 100 mg Nulab ', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (40, 'Cendoxitrol Tetes Mata', 10, NULL, 122, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (41, 'Cerini drop ', 10, NULL, 39, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (42, 'Cerini tablet', 10, NULL, 39, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (43, 'Cetirizine Hexa', 10, NULL, 39, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (44, 'Cetirizine Nulab', 10, NULL, 39, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (45, 'chilli plast plester coklat', 10, NULL, 113, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (46, 'Ciprofloxacin generik', 10, NULL, 43, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (47, 'Clinoma', 10, NULL, 44, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (48, 'Combantrin 125 mg tablet', 10, NULL, 109, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (49, 'Combantrin 250 mg tablet', 10, NULL, 109, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (50, 'Combantrin sirup', 10, NULL, 108, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (51, 'Confortin cream 20 gr tube', 10, NULL, 55, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (52, 'Cortidex', 10, NULL, 54, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (53, 'Damaben drop', 10, NULL, 87, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (54, 'Damaben sirup', 10, NULL, 87, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (55, 'Decolsin tablet', 10, NULL, 25, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (56, 'Dehidralit', 10, NULL, 103, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (57, 'Depakene sirup', 10, NULL, 19, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (58, 'Dermia cream 15 gr', 10, NULL, 21, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (59, 'Dextamine', 10, NULL, 53, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (60, 'Dextral tablet ', 10, NULL, 25, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (61, 'Dexyclav', 10, NULL, 48, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (62, 'Dexyclav sirup', 10, NULL, 49, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (63, 'Dhavit Sirup ', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (64, 'Dobrizol', 10, NULL, 77, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (65, 'Doksisiklin 100 mg', 10, NULL, 56, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (66, 'Dulcolactol sirup', 10, NULL, 76, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (67, 'Duphaston', 10, NULL, 58, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (68, 'Elkana sirup', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (69, 'Elox krim 5 gr', 10, NULL, 94, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (70, 'Enterostop', 10, NULL, 100, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (71, 'Epexol drop ', 10, NULL, 8, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (72, 'Epexol sirup', 10, NULL, 8, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (73, 'Epexol tablet', 10, NULL, 8, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (74, 'Eraphage', 10, NULL, 83, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (75, 'Erlamycetin salep mata', 10, NULL, 41, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (76, 'Erlamycetin tetes telinga ', 10, NULL, 41, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (77, 'Erymed krim 20 gr', 10, NULL, 61, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (78, 'Erysanbe 500 mg', 10, NULL, 59, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (79, 'Erysanbe sirup', 10, NULL, 60, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (80, 'Flucadex', 10, NULL, 25, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (81, 'Fluconazole 150 mg generik', 10, NULL, 62, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (82, 'Folamil Genio', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (83, 'Formyco krim 10 gr', 10, NULL, 70, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (84, 'Fungasol', 10, NULL, 69, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (85, 'Fungasol krim 10 gr', 10, NULL, 70, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (86, 'Fungasol SS 2%', 10, NULL, 71, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (87, 'Furosemide generik', 10, NULL, 63, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (88, 'Genalten cream', 10, NULL, 64, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (89, 'Gentalex Cream', 10, NULL, 64, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (90, 'Gramax 100 mg', 10, NULL, 119, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (91, 'Griseofulvin 500 mg ', 10, NULL, 66, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (92, 'H2 fair skin', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (93, 'Hansaplast', 10, NULL, 113, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (94, 'Hansaplast rol kain', 10, NULL, 113, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (95, 'Helixim 100 mg', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (96, 'Heptasan', 10, NULL, 51, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (97, 'Inbacef 200 mg ', 10, NULL, 37, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (98, 'Indanox 300 mg', 10, NULL, 45, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (99, 'Inerson krim 15 gr ', 10, NULL, 52, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (100, 'Inlacin 100 mg', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (101, 'Interhistin', 10, NULL, 81, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (102, 'Interlac drop', 10, NULL, 74, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (103, 'Kamolas Forte 250 mg sirup', 10, NULL, 105, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (104, 'Kassa steril Husada', 10, NULL, 68, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (105, 'Ketoconazole tab generik', 10, NULL, 69, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (106, 'Kloderma 10 gr krim', 10, NULL, 72, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (107, 'Kondom sutra', 10, NULL, 73, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (108, 'L-Bio', 10, NULL, 75, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (109, 'L-zinc sirup', 10, NULL, 137, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (110, 'Lagesil sirup', 10, NULL, 4, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (111, 'Lagesil sirup', 10, NULL, 15, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (112, 'Leomoxyl 500 mg', 10, NULL, 10, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (113, 'Lodia', 10, NULL, 78, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (114, 'Lokev', 10, NULL, 101, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (115, 'Loksin 10 gr', 10, NULL, 94, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (116, 'Loran', 10, NULL, 79, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (117, 'Loratadine generik', 10, NULL, 79, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (118, 'Mediklin gel 15 gr ', 10, NULL, 46, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (119, 'Medscab', 10, NULL, 107, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (120, 'Mefenamic Acid ', 10, NULL, 17, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (121, 'Meptin mini', 10, NULL, 114, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (122, 'Metformin generik', 10, NULL, 83, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (123, 'Metil Prednisolon 16 mg', 10, NULL, 84, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (124, 'Metil Prednisolon 4 mg', 10, NULL, 85, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (125, 'Metil Prednisolon 8 mg ', 10, NULL, 86, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (126, 'Metronidazole 500 mg KF', 10, NULL, 89, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (127, 'Metronidazole 500 mg Novapharin', 10, NULL, 89, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (128, 'Miconazole krim generik 5 gr', 10, NULL, 90, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (129, 'Microlax gel', 10, NULL, 91, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (130, 'Mini aspi tablet', 10, NULL, 2, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (131, 'Minyak kayu putih caplang 120 ml', 10, NULL, 93, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (132, 'Minyak kayu putih caplang 60 ml', 10, NULL, 93, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (133, 'Miradene 20 mg', 10, NULL, 111, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (134, 'Miravon', 10, NULL, 32, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (135, 'Mucohexin sirup', 10, NULL, 32, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (136, 'Multigyn active gel ', 10, NULL, 7, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (137, 'Muveron drop ', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (138, 'Muveron sirup', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (139, 'Mycoral ', 10, NULL, 69, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (140, 'Mycrogest 100 mg ', 10, NULL, 92, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (141, 'Mycrogest 200 mg ', 10, NULL, 92, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (142, 'Na Cl 0,9% 1 Liter', 10, NULL, 33, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (143, 'Natrium diklofenak 50 mg', 10, NULL, 97, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (144, 'Nobor ', 10, NULL, 6, NULL, 'administrator', '2020-10-19 12:16:04', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (145, 'Norestil 2', 10, NULL, 99, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (146, 'Novaxicam', 10, NULL, 111, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (147, 'Nuce ', 10, NULL, 128, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (148, 'Nufadol', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (149, 'Nulacta', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (150, 'Nupeson krim 10 gr ', 10, NULL, 52, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (151, 'Nymiko drop', 10, NULL, 98, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (152, 'Obdhamin', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (153, 'OBH combi dewasa jahe ', 10, NULL, 27, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (154, 'Omeprazole 20 mg', 10, NULL, 101, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (155, 'Ondansentron Generik', 10, NULL, 102, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (156, 'Pamol 125 mg supp', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (157, 'Pamol 250 mg supp', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (158, 'Paracetamol 500 mg generik', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (159, 'Paracetamol sirup 120 mg', 10, NULL, 105, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (160, 'Paratusin tablet', 10, NULL, 25, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (161, 'Pirotop 10 gr', 10, NULL, 96, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (162, 'Pirotop 5 gr ', 10, NULL, 96, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (163, 'Piroxicam 10 mg generik', 10, NULL, 110, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (164, 'Plasminex', 10, NULL, 18, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (165, 'Polofar plus', 10, NULL, 53, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (166, 'Pronicy', 10, NULL, 51, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (167, 'Prove D3 drop', 10, NULL, 135, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (168, 'Prove D3 tablet', 10, NULL, 135, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (169, 'Provula', 10, NULL, 47, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (170, 'Qcef 500 mg', 10, NULL, 35, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (171, 'Qcef sirup ', 10, NULL, 34, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (172, 'QV cream ', 10, NULL, 106, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (173, 'Rafacort tab', 10, NULL, 125, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (174, 'Ranitidine Hcl', 10, NULL, 115, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (175, 'Renalite', 10, NULL, 103, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (176, 'Rheu-trex 2,5 mg', 10, NULL, 88, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (177, 'Sagestam 10  gr salep kulit', 10, NULL, 64, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (178, 'Sagestam salep mata 3,5 gr', 10, NULL, 64, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (179, 'Sagestam tetes mata/telinga', 10, NULL, 65, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (180, 'Salbutamol 2 mg generik', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (181, 'Salbutamol 2 mg generik', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (182, 'Salbutamol 4 mg generik', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (183, 'Salbutamol 4 mg generik', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (184, 'San B Plex drop', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (185, 'Sanbe C 500 mg', 10, NULL, 134, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (186, 'Sanmol drop 60 mg', 10, NULL, 105, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (187, 'Sanmol sirup 120 mg', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (188, 'Sanmol tablet', 10, NULL, 104, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (189, 'Sanoskin Melladerm Plus', 10, NULL, 80, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (190, 'Sanprima', 10, NULL, 50, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (191, 'Sanprima sirup', 10, NULL, 50, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (192, 'Sanvita B sirup ', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (193, 'Scacid cream 10 gr', 10, NULL, 107, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (194, 'Skinbright Lightening CC cream Beige', 10, NULL, 28, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (195, 'Skinbright Lightening CC cream Normal', 10, NULL, 28, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (196, 'Spasminal', 10, NULL, 82, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (197, 'Sporetik 100 mg', 10, NULL, 36, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (198, 'Stenirol 16mg', 10, NULL, 84, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (199, 'tekasol oint ', 10, NULL, 38, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:02', NULL);
INSERT INTO `barang` VALUES (200, 'Teosal', 10, NULL, 118, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (201, 'Tes hamil Onemed', 10, NULL, 121, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (202, 'Tes hamil Quick & sure', 10, NULL, 121, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (203, 'Tes hamil Steril', 10, NULL, 121, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (204, 'Thiamycin 1000', 10, NULL, 123, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (205, 'Thiamycin 500', 10, NULL, 123, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (206, 'Topicare Cleanser', 10, NULL, 116, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (207, 'Velutine inhalation sol', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (208, 'Ventolin nebul', 10, NULL, 117, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (209, 'Vit B complex IPI', 10, NULL, 130, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (210, 'Vit C IPI ', 10, NULL, 131, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (211, 'Vitacid 0,1%', 10, NULL, 124, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (212, 'Vitamin C 250 mg ', 10, NULL, 132, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (213, 'Vitamin C 50 mg', 10, NULL, 133, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (214, 'Vometa drop', 10, NULL, 57, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (215, 'Vomil B6', 10, NULL, 129, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (216, 'Vosedon sirup', 10, NULL, 57, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (217, 'Xidane', 10, NULL, 20, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (218, 'Xidane gel', 10, NULL, 22, NULL, 'administrator', '2020-10-19 12:16:32', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (219, 'Zamel sirup', 10, NULL, 95, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (220, 'Zinc 20 mg Kimia farma', 10, NULL, 136, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);
INSERT INTO `barang` VALUES (221, 'Zinckid Sirup', 10, NULL, 137, NULL, 'administrator', '2020-10-19 12:16:33', '2020-10-27 08:12:03', NULL);

-- ----------------------------
-- Table structure for barang_masuk
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk`;
CREATE TABLE `barang_masuk`  (
  `barang_masuk_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `barang_masuk_tanggal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_masuk_faktur` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_masuk_sales` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_masuk_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `barang_masuk_jatuh_tempo` date NULL DEFAULT NULL,
  `barang_masuk_lunas` date NULL DEFAULT NULL,
  `supplier_id` bigint(20) NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`barang_masuk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang_masuk
-- ----------------------------
INSERT INTO `barang_masuk` VALUES (5, '2020-12-28', '4567', '4567', '4567', NULL, '2020-12-28', 1, 'administrator', '2020-12-28 10:17:30', '2020-12-28 11:19:32', NULL);
INSERT INTO `barang_masuk` VALUES (6, '2020-12-28', 'asdf', 'asdf', 'asdf', NULL, '2020-12-28', 10, 'administrator', '2020-12-28 10:31:39', '2020-12-28 10:50:07', NULL);

-- ----------------------------
-- Table structure for barang_masuk_detail
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk_detail`;
CREATE TABLE `barang_masuk_detail`  (
  `barang_masuk_id` bigint(20) NOT NULL,
  `barang_id` bigint(20) NULL DEFAULT NULL,
  `barang_masuk_nomor_batch` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barang_masuk_harga_barang` decimal(15, 0) NULL DEFAULT NULL,
  `barang_masuk_harga_ppn` decimal(15, 0) NULL DEFAULT NULL,
  `barang_masuk_diskon` decimal(15, 0) NULL DEFAULT NULL,
  `barang_masuk_qty` double NULL DEFAULT NULL,
  `barang_masuk_kadaluarsa` date NULL DEFAULT NULL,
  `barang_masuk_sub_total_ppn` double NULL DEFAULT NULL,
  `barang_masuk_sub_total` decimal(15, 2) NULL DEFAULT NULL,
  `check` tinyint(255) NULL DEFAULT 0,
  INDEX `barang_masuk_barang_id_foreign`(`barang_id`) USING BTREE,
  INDEX `barang_masuk_detail`(`barang_masuk_id`) USING BTREE,
  CONSTRAINT `barang_masuk_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `barang_masuk_detail` FOREIGN KEY (`barang_masuk_id`) REFERENCES `barang_masuk` (`barang_masuk_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang_masuk_detail
-- ----------------------------
INSERT INTO `barang_masuk_detail` VALUES (5, 2, '4567', 8000, 0, 0, 10, '2020-12-28', 0, 80000.00, 1);
INSERT INTO `barang_masuk_detail` VALUES (6, 2, NULL, 1000000, 0, 0, 5, '2020-12-28', 0, 105000000.00, 0);
INSERT INTO `barang_masuk_detail` VALUES (6, 21, NULL, 2000000, 0, 0, 50, '2020-12-28', 0, 105000000.00, 0);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jenis_barang
-- ----------------------------
DROP TABLE IF EXISTS `jenis_barang`;
CREATE TABLE `jenis_barang`  (
  `jenis_barang_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jenis_barang_uraian` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`jenis_barang_id`) USING BTREE,
  INDEX `jenis_barang_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  CONSTRAINT `jenis_barang_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_barang
-- ----------------------------
INSERT INTO `jenis_barang` VALUES (1, 'Acetylsalicilyc 100 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (2, 'Acetylsalicilyc 80 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (3, 'Acyclovir 400 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (4, 'Al hidroksida, simeticon', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (5, 'Alkohol 70%', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (6, 'Allylestrenol ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (7, 'Aloe vera ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (8, 'Ambroxol', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (9, 'Amlodipine 10 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (10, 'Amoxicilin 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (11, 'Amoxicillin 100 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (12, 'Amoxicillin 125 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (13, 'Amoxicillin 250 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (14, 'Antasida', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (15, 'Antasida sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (16, 'Asam folat 1 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (17, 'Asam mefenamat 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (18, 'Asam tranexamat', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (19, 'Asam valproat', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (20, 'Astaxanthin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (21, 'Astaxanthine', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (22, 'Astaxanthine gel', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (23, 'Azitromisin 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (24, 'Batugin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (25, 'Batuk pilek', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (27, 'Batuk pilek sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (28, 'Bedak', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (29, 'Betadine', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (30, 'Betametason', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (31, 'Betametason neomisin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (32, 'Bromhexine', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (33, 'Cairan infus', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (34, 'Cefadroxil 125 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (35, 'Cefadroxil 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (36, 'Cefixime 100 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (37, 'Cefixime 200 mg ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (38, 'Centella asiatica', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (39, 'Cetirizin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (40, 'Cetirizin sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (41, 'Chlorampenicol', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (42, 'Chlorpheniramine maleat', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (43, 'Ciprofloxacin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (44, 'Clindamisin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (45, 'Clindamisin 300 mg ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (46, 'Clindamisin krim', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (47, 'Clomifene citrate', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (48, 'Coamoxiclav', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (49, 'Coamoxiclav 125 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (50, 'Cotrimoxazole', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (51, 'Cyproheptadine', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (52, 'Desoksimetasone', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (53, 'Dexametasone + CTM', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (54, 'Dexametasone 0,5 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (55, 'Diaper krim ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (56, 'Doksisiklin 100 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (57, 'Domperidone', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (58, 'Dydrogesterone 10 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (59, 'Eritromisin ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (60, 'Eritromisin 200 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (61, 'Eritromisin krim', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (62, 'Fluconazole 150 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (63, 'Furosemide 40 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (64, 'Gentamisin cream', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (65, 'Gentamisin drop', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (66, 'Griseofulvin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (67, 'Ibuprofen sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (68, 'Kassa', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (69, 'Ketoconazole', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (70, 'Ketoconazole cream', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (71, 'Ketoconazole shampoo', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (72, 'Klobetasol propionat', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (73, 'Kondom', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (74, 'LactoB', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (75, 'Lactobacillus', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (76, 'Lactulose', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (77, 'Lanzoprasole', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (78, 'Loperamide', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (79, 'Loratadin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (80, 'Luka bakar', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (81, 'Mebhidrolin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (82, 'Metampiron belladona', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (83, 'Metformin 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (84, 'Metil Prednisolon 16 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (85, 'Metil Prednisolon 4 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (86, 'Metil Prednisolon 8 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (87, 'Metoclopramide', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (88, 'Metotreksat', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (89, 'Metronidazole 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (90, 'Miconazole', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (91, 'Microlax', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (92, 'Micronised Progesteron', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (93, 'Minyak kayu putih', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (94, 'Mometason furoate cream', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (95, 'Multivitamin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (96, 'Mupirocin cream', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (97, 'Natrium diklofenak', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (98, 'Nistatin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (99, 'Norethisterone ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (100, 'Obat diare', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (101, 'Omeprazole 20 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (102, 'Ondansentron', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (103, 'Oralit', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (104, 'Paracetamol', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (105, 'Paracetamol sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (106, 'Pelembab', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (107, 'Permethrin 5%', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (108, 'Pirantel pamoat sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (109, 'Pirantel pamoat tablet', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (110, 'Piroxicam 10 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (111, 'Piroxicam 20 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (112, 'Placenta ekstrak', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (113, 'Plester', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (114, 'Procaterol HCl', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (115, 'Ranitidine', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (116, 'Sabun cuci muka', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (117, 'Salbutamol', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (118, 'Salbutamol + teofilin', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (119, 'Sildenafil citrate', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (120, 'Tempel panas ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (121, 'Tes kehamilan', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (122, 'Tetes mata', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (123, 'Thiampenicol', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (124, 'Tretinoin acid 0,1%', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (125, 'Triamcinolone acetonide', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (126, 'Urea 10%', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (127, 'Urea 20%', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (128, 'Vit C 500 + Collagen ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (129, 'Vitamin B6 ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (130, 'Vitamin Bkompleks', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (131, 'Vitamin C', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (132, 'Vitamin C 250 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (133, 'Vitamin C 50 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (134, 'Vitamin C 500 mg', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (135, 'Vitamin D 1000 IU ', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (136, 'Zinc', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `jenis_barang` VALUES (137, 'Zinc sirup', 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`permission_id`, `model_type`, `pengguna_id`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_type`) USING BTREE,
  INDEX `izin_pengguna_fk`(`pengguna_id`) USING BTREE,
  CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `model_has_permissions_ibfk_2` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`role_id`, `model_type`, `pengguna_id`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_type`) USING BTREE,
  INDEX `level_pengguna_fk`(`pengguna_id`) USING BTREE,
  CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `model_has_roles_ibfk_2` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\Pengguna', 'administrator');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pelanggan
-- ----------------------------
DROP TABLE IF EXISTS `pelanggan`;
CREATE TABLE `pelanggan`  (
  `pelanggan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pelanggan_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pelanggan_alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pelanggan_kontak` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pelanggan_id`) USING BTREE,
  INDEX `supplier_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pelanggan
-- ----------------------------
INSERT INTO `pelanggan` VALUES (3, 'Darya Varia', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (4, 'Mersifarma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (5, 'Kimia Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (6, 'Lapi', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (7, 'Guardian', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (8, 'Infion', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (9, 'Sanbe', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (10, 'Hexpharm', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (11, 'Sampharindo Perdana', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (12, 'Ifars', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (13, 'Abbott', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (14, 'Interbat', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (15, 'Nulab OGB', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (16, 'Prafa', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (17, 'Medifarma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (18, 'Graha farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (19, 'Molex Ayus', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (20, 'GlaxoSmith Kline', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (21, 'Combiphar', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (22, 'SDM', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (23, 'Mundipharma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (24, 'Sanbe ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (25, 'Hexpharm/KF', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (26, 'Nulab ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (27, 'Saka Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (28, 'Erela', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (29, 'Mega Esa Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (30, 'Novapharin', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (31, 'Rama Emerald ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (32, 'Dexa Medica', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (33, 'Kalbe', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (34, 'Phapros', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (35, 'Solas', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (36, 'Molex', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (37, 'Husada', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (38, 'Boehringer', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (39, 'Caprifarmindo', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (40, 'Pharos', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (41, 'Cap Lang', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (42, 'Cap Lang ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (43, 'Novell', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (44, 'Fahrenheit', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (45, 'Mahakam Beta Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (46, 'Johnson Johnson', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (47, 'Otsuka', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (48, 'First medipharma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (49, 'GSK', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (50, 'Erlimpex', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (51, 'Onemed', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (52, 'Quick & sure', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (53, 'Steril', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (54, 'Cendo', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (55, 'Bufa ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (56, 'Nulab', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (57, 'IPI', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (58, 'Enseval', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (59, 'Indofarma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (60, 'Terumo', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `pelanggan` VALUES (61, 'Brataco', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna`  (
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengguna_sandi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pengguna_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pengguna_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES ('administrator', '$2y$10$8D1JqX6wwuCZuKMRYaIw3O2adcJyxEKxCsiA73cv3ASeyxxD2xbXa', 'Administrator', NULL, NULL, '2020-10-22 13:31:28', NULL);

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan`  (
  `penjualan_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `penjualan_tanggal` date NULL DEFAULT NULL,
  `penjualan_keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `penjualan_tagihan` decimal(15, 2) NULL DEFAULT NULL,
  `penjualan_bayar` decimal(15, 2) NULL DEFAULT NULL,
  `penjualan_sisa` decimal(15, 2) NULL DEFAULT NULL,
  `penjualan_jatuh_tempo` date NULL DEFAULT NULL,
  `penjualan_lunas` date NULL DEFAULT NULL,
  `pelanggan_id` bigint(20) NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`penjualan_id`) USING BTREE,
  INDEX `pelanggan_id`(`pelanggan_id`) USING BTREE,
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`pelanggan_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penjualan
-- ----------------------------
INSERT INTO `penjualan` VALUES ('20201228111203232878', '2020-12-28', 'Keterangan', 16000.00, 100000.00, 84000.00, NULL, '2020-12-28', 3, 'administrator', '2020-12-28 11:46:03', '2020-12-28 14:40:18', NULL);
INSERT INTO `penjualan` VALUES ('20201228111204556383', '2020-12-28', '23452', 344000.00, 400000.00, 56000.00, '2020-12-28', '2020-12-28', 4, 'administrator', '2020-12-28 11:47:04', '2020-12-28 14:41:01', NULL);
INSERT INTO `penjualan` VALUES ('20201228111212876839', '2020-12-28', 'Keterangan (Nama)', 300000.00, 300000.00, 0.00, '2020-12-30', '2020-12-28', 6, 'administrator', '2020-12-28 11:48:12', '2020-12-28 14:41:04', NULL);

-- ----------------------------
-- Table structure for penjualan_detail
-- ----------------------------
DROP TABLE IF EXISTS `penjualan_detail`;
CREATE TABLE `penjualan_detail`  (
  `penjualan_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `barang_id` bigint(20) NOT NULL,
  `satuan_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `satuan_harga` decimal(15, 2) NOT NULL,
  `satuan_rasio_dari_utama` double NOT NULL,
  `penjualan_detail_tambahan` decimal(15, 2) NULL DEFAULT NULL,
  `penjualan_detail_qty` double NOT NULL,
  `penjualan_detail_diskon` double NULL DEFAULT NULL,
  `penjualan_detail_total` decimal(15, 2) NULL DEFAULT NULL,
  `pbf_id` bigint(20) NULL DEFAULT NULL,
  INDEX `penjualan_detail_penjualan_id_foreign`(`penjualan_id`) USING BTREE,
  INDEX `penjualan_detail_pbf_id_foreign`(`pbf_id`) USING BTREE,
  CONSTRAINT `penjualan_detail_pbf_id_foreign` FOREIGN KEY (`pbf_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `penjualan_detail_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`penjualan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penjualan_detail
-- ----------------------------
INSERT INTO `penjualan_detail` VALUES ('20201228111203232878', 3, 'botol', 8000.00, 1, NULL, 2, 0, 16000.00, NULL);
INSERT INTO `penjualan_detail` VALUES ('20201228111204556383', 3, 'botol', 8000.00, 1, NULL, 43, 0, 344000.00, NULL);
INSERT INTO `penjualan_detail` VALUES ('20201228111212876839', 17, 'tablet', 1000.00, 1, NULL, 300, 0, 300000.00, NULL);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'dashboard', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (2, 'barangmasuk', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (3, 'datamaster', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (4, 'barang', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (5, 'jenisbarang', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (6, 'pelanggan', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (7, 'supplier', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (8, 'laporan', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (9, 'konsinyasi', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (10, 'laporankonsinyasiperhari', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (11, 'laporankonsinyasibulanan', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (12, 'penerimaan', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (13, 'laporanpenerimaanperhari', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (14, 'laporanpenerimaanbulanan', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (15, 'laporanstokbarang', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (16, 'penjualan', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');
INSERT INTO `permissions` VALUES (17, 'postingstok', 'web', '2020-12-28 11:29:48', '2020-12-28 11:29:48');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'super-admin', 'web', '2019-04-24 03:38:59', '2019-04-24 03:38:59');
INSERT INTO `roles` VALUES (2, 'user', 'web', '2019-04-24 03:38:59', '2019-04-24 03:38:59');
INSERT INTO `roles` VALUES (3, 'guest', 'web', '2019-04-24 03:38:59', '2019-04-24 03:38:59');

-- ----------------------------
-- Table structure for satuan
-- ----------------------------
DROP TABLE IF EXISTS `satuan`;
CREATE TABLE `satuan`  (
  `barang_id` bigint(20) NOT NULL,
  `satuan_id` int(11) NOT NULL,
  `satuan_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `satuan_harga` decimal(15, 2) NOT NULL,
  `satuan_rasio_dari_utama` double NOT NULL,
  `utama` tinyint(255) NOT NULL,
  INDEX `satuan_barang_id_foreign`(`barang_id`) USING BTREE,
  CONSTRAINT `satuan_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of satuan
-- ----------------------------
INSERT INTO `satuan` VALUES (17, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (110, 0, 'botol', 36000.00, 1, 1);
INSERT INTO `satuan` VALUES (5, 0, 'botol', 17500.00, 1, 1);
INSERT INTO `satuan` VALUES (144, 0, 'tablet', 6000.00, 1, 1);
INSERT INTO `satuan` VALUES (136, 0, 'botol', 267000.00, 1, 1);
INSERT INTO `satuan` VALUES (73, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (72, 0, 'botol', 26000.00, 1, 1);
INSERT INTO `satuan` VALUES (71, 0, 'botol', 56000.00, 1, 1);
INSERT INTO `satuan` VALUES (8, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (30, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (9, 0, 'kapsul', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (112, 0, 'kapsul', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (10, 0, 'botol', 34000.00, 1, 1);
INSERT INTO `satuan` VALUES (12, 0, 'botol', 34000.00, 1, 1);
INSERT INTO `satuan` VALUES (11, 0, 'botol', 48000.00, 1, 1);
INSERT INTO `satuan` VALUES (14, 0, 'tablet', 300.00, 1, 1);
INSERT INTO `satuan` VALUES (111, 0, 'botol', 37000.00, 1, 1);
INSERT INTO `satuan` VALUES (13, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (120, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (164, 0, 'tablet', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (57, 0, 'botol', 235000.00, 1, 1);
INSERT INTO `satuan` VALUES (217, 0, 'kapsul', 11500.00, 1, 1);
INSERT INTO `satuan` VALUES (58, 0, 'tube', 63000.00, 1, 1);
INSERT INTO `satuan` VALUES (218, 0, 'tube', 110000.00, 1, 1);
INSERT INTO `satuan` VALUES (18, 0, 'tablet', 15000.00, 1, 1);
INSERT INTO `satuan` VALUES (19, 0, 'botol', 52000.00, 1, 1);
INSERT INTO `satuan` VALUES (160, 0, 'strip', 15000.00, 1, 1);
INSERT INTO `satuan` VALUES (55, 0, 'strip', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (80, 0, 'kaplet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (60, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (153, 0, 'botol', 14000.00, 1, 1);
INSERT INTO `satuan` VALUES (194, 0, 'tube', 90000.00, 1, 1);
INSERT INTO `satuan` VALUES (195, 0, 'tube', 90000.00, 1, 1);
INSERT INTO `satuan` VALUES (21, 0, 'botol', 7000.00, 1, 1);
INSERT INTO `satuan` VALUES (22, 0, 'tube', 12000.00, 1, 1);
INSERT INTO `satuan` VALUES (23, 0, 'tube', 20000.00, 1, 1);
INSERT INTO `satuan` VALUES (135, 0, 'botol', 25000.00, 1, 1);
INSERT INTO `satuan` VALUES (134, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (142, 0, 'botol', 10000.00, 1, 1);
INSERT INTO `satuan` VALUES (171, 0, 'botol', 73000.00, 1, 1);
INSERT INTO `satuan` VALUES (34, 0, 'kapsul', 3000.00, 1, 1);
INSERT INTO `satuan` VALUES (170, 0, 'kapsul', 15000.00, 1, 1);
INSERT INTO `satuan` VALUES (35, 0, 'kapsul', 15000.00, 1, 1);
INSERT INTO `satuan` VALUES (37, 0, 'kapsul', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (38, 0, 'kapsul', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (39, 0, 'kapsul', 3200.00, 1, 1);
INSERT INTO `satuan` VALUES (95, 0, 'kaplet', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (197, 0, 'kapsul', 29000.00, 1, 1);
INSERT INTO `satuan` VALUES (97, 0, 'kaplet', 29000.00, 1, 1);
INSERT INTO `satuan` VALUES (199, 0, 'tube', 55000.00, 1, 1);
INSERT INTO `satuan` VALUES (43, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (44, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (42, 0, 'kapsul', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (41, 0, 'botol', 94000.00, 1, 1);
INSERT INTO `satuan` VALUES (3, 0, 'botol', 8000.00, 1, 1);
INSERT INTO `satuan` VALUES (75, 0, 'tube', 10000.00, 1, 1);
INSERT INTO `satuan` VALUES (76, 0, 'botol', 11000.00, 1, 1);
INSERT INTO `satuan` VALUES (6, 0, 'kapsul', 300.00, 1, 1);
INSERT INTO `satuan` VALUES (46, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (47, 0, 'Kapsul', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (98, 0, 'kapsul', 10000.00, 1, 1);
INSERT INTO `satuan` VALUES (118, 0, 'tube', 35000.00, 1, 1);
INSERT INTO `satuan` VALUES (169, 0, 'tablet', 23000.00, 1, 1);
INSERT INTO `satuan` VALUES (61, 0, 'kaplet', 18000.00, 1, 1);
INSERT INTO `satuan` VALUES (62, 0, 'botol', 82000.00, 1, 1);
INSERT INTO `satuan` VALUES (190, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (191, 0, 'botol', 38000.00, 1, 1);
INSERT INTO `satuan` VALUES (166, 0, 'kaplet', 400.00, 1, 1);
INSERT INTO `satuan` VALUES (99, 0, 'tube', 108000.00, 1, 1);
INSERT INTO `satuan` VALUES (150, 0, 'tube', 33000.00, 1, 1);
INSERT INTO `satuan` VALUES (59, 0, 'kaplet', 2500.00, 1, 1);
INSERT INTO `satuan` VALUES (165, 0, 'kaplet', 300.00, 1, 1);
INSERT INTO `satuan` VALUES (20, 0, 'botol', 40000.00, 1, 1);
INSERT INTO `satuan` VALUES (52, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (51, 0, 'tube', 40000.00, 1, 1);
INSERT INTO `satuan` VALUES (65, 0, 'kapsul', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (216, 0, 'botol', 40000.00, 1, 1);
INSERT INTO `satuan` VALUES (214, 0, 'botol', 56500.00, 1, 1);
INSERT INTO `satuan` VALUES (67, 0, 'tablet', 24000.00, 1, 1);
INSERT INTO `satuan` VALUES (78, 0, 'kaplet', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (79, 0, 'botol', 33000.00, 1, 1);
INSERT INTO `satuan` VALUES (77, 0, 'tube', 43000.00, 1, 1);
INSERT INTO `satuan` VALUES (81, 0, 'kapsul', 24000.00, 1, 1);
INSERT INTO `satuan` VALUES (87, 0, 'tablet', 250.00, 1, 1);
INSERT INTO `satuan` VALUES (177, 0, 'tube', 19000.00, 1, 1);
INSERT INTO `satuan` VALUES (89, 0, 'tube', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (88, 0, 'tube', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (179, 0, 'botol', 43000.00, 1, 1);
INSERT INTO `satuan` VALUES (91, 0, 'tablet', 2500.00, 1, 1);
INSERT INTO `satuan` VALUES (27, 0, 'botol', 22000.00, 1, 1);
INSERT INTO `satuan` VALUES (26, 0, 'botol', 31000.00, 1, 1);
INSERT INTO `satuan` VALUES (104, 0, 'box', 10000.00, 1, 1);
INSERT INTO `satuan` VALUES (105, 0, 'box', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (84, 0, 'tablet', 7500.00, 1, 1);
INSERT INTO `satuan` VALUES (139, 0, 'tablet', 6000.00, 1, 1);
INSERT INTO `satuan` VALUES (83, 0, 'tube', 28000.00, 1, 1);
INSERT INTO `satuan` VALUES (85, 0, 'tube', 40000.00, 1, 1);
INSERT INTO `satuan` VALUES (86, 0, 'botol', 115000.00, 1, 1);
INSERT INTO `satuan` VALUES (106, 0, 'tube', 47000.00, 1, 1);
INSERT INTO `satuan` VALUES (102, 0, 'botol', 350000.00, 1, 1);
INSERT INTO `satuan` VALUES (108, 0, 'sachet', 11000.00, 1, 1);
INSERT INTO `satuan` VALUES (66, 0, 'botol', 88000.00, 1, 1);
INSERT INTO `satuan` VALUES (64, 0, 'tablet', 3000.00, 1, 1);
INSERT INTO `satuan` VALUES (113, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (116, 0, 'tablet', 8000.00, 1, 1);
INSERT INTO `satuan` VALUES (117, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (7, 0, 'tablet', 7000.00, 1, 1);
INSERT INTO `satuan` VALUES (189, 0, 'botol', 258000.00, 1, 1);
INSERT INTO `satuan` VALUES (101, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (196, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (74, 0, 'tablet', 3000.00, 1, 1);
INSERT INTO `satuan` VALUES (122, 0, 'tablet', 300.00, 1, 1);
INSERT INTO `satuan` VALUES (198, 0, 'tablet', 11500.00, 1, 1);
INSERT INTO `satuan` VALUES (123, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (124, 0, 'tablet', 600.00, 1, 1);
INSERT INTO `satuan` VALUES (125, 0, 'tablet', 800.00, 1, 1);
INSERT INTO `satuan` VALUES (53, 0, 'botol', 21000.00, 1, 1);
INSERT INTO `satuan` VALUES (54, 0, 'botol', 15000.00, 1, 1);
INSERT INTO `satuan` VALUES (176, 0, 'tablet', 8500.00, 1, 1);
INSERT INTO `satuan` VALUES (126, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (127, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (128, 0, 'tube', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (129, 0, 'tube', 28000.00, 1, 1);
INSERT INTO `satuan` VALUES (141, 0, 'kapsul', 33000.00, 1, 1);
INSERT INTO `satuan` VALUES (140, 0, 'kapsul', 18000.00, 1, 1);
INSERT INTO `satuan` VALUES (132, 0, 'botol', 27000.00, 1, 1);
INSERT INTO `satuan` VALUES (131, 0, 'botol', 50000.00, 1, 1);
INSERT INTO `satuan` VALUES (115, 0, 'tube', 100000.00, 1, 1);
INSERT INTO `satuan` VALUES (69, 0, 'tube', 68000.00, 1, 1);
INSERT INTO `satuan` VALUES (92, 0, 'tablet', 9000.00, 1, 1);
INSERT INTO `satuan` VALUES (149, 0, 'kapsul', 7000.00, 1, 1);
INSERT INTO `satuan` VALUES (33, 0, 'tablet', 700.00, 1, 1);
INSERT INTO `satuan` VALUES (152, 0, 'tablet', 6500.00, 1, 1);
INSERT INTO `satuan` VALUES (82, 0, 'kapsul', 5500.00, 1, 1);
INSERT INTO `satuan` VALUES (100, 0, 'kapsul', 7500.00, 1, 1);
INSERT INTO `satuan` VALUES (192, 0, 'botol', 20000.00, 1, 1);
INSERT INTO `satuan` VALUES (137, 0, 'botol', 43000.00, 1, 1);
INSERT INTO `satuan` VALUES (16, 0, 'botol', 49000.00, 1, 1);
INSERT INTO `satuan` VALUES (15, 0, 'botol', 60000.00, 1, 1);
INSERT INTO `satuan` VALUES (138, 0, 'botol', 63000.00, 1, 1);
INSERT INTO `satuan` VALUES (184, 0, 'botol', 25000.00, 1, 1);
INSERT INTO `satuan` VALUES (219, 0, 'botol', 56000.00, 1, 1);
INSERT INTO `satuan` VALUES (63, 0, 'tablet', 48000.00, 1, 1);
INSERT INTO `satuan` VALUES (68, 0, 'botol', 35000.00, 1, 1);
INSERT INTO `satuan` VALUES (162, 0, 'tube', 57000.00, 1, 1);
INSERT INTO `satuan` VALUES (161, 0, 'tube', 89000.00, 1, 1);
INSERT INTO `satuan` VALUES (143, 0, 'tablet', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (151, 0, 'botol', 50000.00, 1, 1);
INSERT INTO `satuan` VALUES (145, 0, 'tablet', 6000.00, 1, 1);
INSERT INTO `satuan` VALUES (70, 0, 'strip ', 45000.00, 1, 1);
INSERT INTO `satuan` VALUES (114, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (154, 0, 'kapsul', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (155, 0, 'tablet', 2000.00, 1, 1);
INSERT INTO `satuan` VALUES (56, 0, 'botol', 23000.00, 1, 1);
INSERT INTO `satuan` VALUES (175, 0, 'botol', 23000.00, 1, 1);
INSERT INTO `satuan` VALUES (188, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (158, 0, 'tablet', 400.00, 1, 1);
INSERT INTO `satuan` VALUES (148, 0, 'kaplet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (156, 0, 'supp', 20000.00, 1, 1);
INSERT INTO `satuan` VALUES (157, 0, 'supp', 29000.00, 1, 1);
INSERT INTO `satuan` VALUES (187, 0, 'botol', 18000.00, 1, 1);
INSERT INTO `satuan` VALUES (186, 0, 'botol', 24000.00, 1, 1);
INSERT INTO `satuan` VALUES (103, 0, 'botol', 39000.00, 1, 1);
INSERT INTO `satuan` VALUES (159, 0, 'botol', 35000.00, 1, 1);
INSERT INTO `satuan` VALUES (172, 0, 'botol', 197000.00, 1, 1);
INSERT INTO `satuan` VALUES (119, 0, 'tube', 98000.00, 1, 1);
INSERT INTO `satuan` VALUES (193, 0, 'tube', 57000.00, 1, 1);
INSERT INTO `satuan` VALUES (50, 0, 'botol', 21000.00, 1, 1);
INSERT INTO `satuan` VALUES (48, 0, 'strip', 17000.00, 1, 1);
INSERT INTO `satuan` VALUES (133, 0, 'kapsul', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (24, 0, 'tube', 23000.00, 1, 1);
INSERT INTO `satuan` VALUES (93, 0, 'lembar', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (121, 0, 'tablet', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (174, 0, 'tablet', 300.00, 1, 1);
INSERT INTO `satuan` VALUES (206, 0, 'botol', 90000.00, 1, 1);
INSERT INTO `satuan` VALUES (181, 0, 'tablet', 150.00, 1, 1);
INSERT INTO `satuan` VALUES (208, 0, 'unit', 14000.00, 1, 1);
INSERT INTO `satuan` VALUES (200, 0, 'tablet', 400.00, 1, 1);
INSERT INTO `satuan` VALUES (90, 0, 'kapsul', 71000.00, 1, 1);
INSERT INTO `satuan` VALUES (28, 0, 'strip', 12000.00, 1, 1);
INSERT INTO `satuan` VALUES (29, 0, 'strip', 9000.00, 1, 1);
INSERT INTO `satuan` VALUES (201, 0, 'piece', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (40, 0, 'botol', 41000.00, 1, 1);
INSERT INTO `satuan` VALUES (204, 0, 'kaplet', 12000.00, 1, 1);
INSERT INTO `satuan` VALUES (205, 0, 'kaplet', 7000.00, 1, 1);
INSERT INTO `satuan` VALUES (211, 0, 'tube', 66000.00, 1, 1);
INSERT INTO `satuan` VALUES (173, 0, 'tablet', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (25, 0, 'tube', 25000.00, 1, 1);
INSERT INTO `satuan` VALUES (31, 0, 'tube', 44000.00, 1, 1);
INSERT INTO `satuan` VALUES (32, 0, 'tube', 56000.00, 1, 1);
INSERT INTO `satuan` VALUES (147, 0, 'kapsul', 5000.00, 1, 1);
INSERT INTO `satuan` VALUES (215, 0, 'tablet', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (209, 0, 'botol', 6000.00, 1, 1);
INSERT INTO `satuan` VALUES (210, 0, 'botol', 6000.00, 1, 1);
INSERT INTO `satuan` VALUES (212, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (213, 0, 'tablet', 500.00, 1, 1);
INSERT INTO `satuan` VALUES (185, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (168, 0, 'kaplet', 4000.00, 1, 1);
INSERT INTO `satuan` VALUES (167, 0, 'botol', 297000.00, 1, 1);
INSERT INTO `satuan` VALUES (220, 0, 'tablet', 1000.00, 1, 1);
INSERT INTO `satuan` VALUES (109, 0, 'botol', 50000.00, 1, 1);
INSERT INTO `satuan` VALUES (221, 0, 'botol', 41000.00, 1, 1);
INSERT INTO `satuan` VALUES (178, 0, 'tube', 55000.00, 1, 1);
INSERT INTO `satuan` VALUES (2, 0, 'tablet', 1500.00, 1, 1);
INSERT INTO `satuan` VALUES (1, 0, 'botol', 62000.00, 1, 1);

-- ----------------------------
-- Table structure for stok_awal
-- ----------------------------
DROP TABLE IF EXISTS `stok_awal`;
CREATE TABLE `stok_awal`  (
  `stok_awal_tanggal` date NOT NULL,
  `barang_id` bigint(20) NOT NULL,
  `barang_qty` double(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`stok_awal_tanggal`, `barang_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stok_awal
-- ----------------------------
INSERT INTO `stok_awal` VALUES ('2020-11-01', 1, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 2, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 3, 6);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 4, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 5, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 6, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 7, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 8, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 9, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 10, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 11, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 12, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 13, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 14, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 15, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 16, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 17, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 18, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 19, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 20, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 21, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 22, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 23, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 24, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 25, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 26, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 27, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 28, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 29, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 30, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 31, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 32, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 33, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 34, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 35, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 36, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 37, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 38, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 39, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 40, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 41, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 42, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 43, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 44, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 45, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 46, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 47, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 48, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 49, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 50, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 51, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 52, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 53, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 54, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 55, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 56, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 57, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 58, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 59, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 60, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 61, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 62, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 63, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 64, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 65, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 66, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 67, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 68, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 69, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 70, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 71, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 72, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 73, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 74, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 75, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 76, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 77, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 78, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 79, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 80, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 81, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 82, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 83, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 84, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 85, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 86, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 87, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 88, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 89, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 90, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 91, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 92, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 93, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 94, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 95, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 96, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 97, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 98, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 99, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 100, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 101, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 102, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 103, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 104, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 105, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 106, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 107, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 108, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 109, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 110, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 111, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 112, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 113, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 114, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 115, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 116, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 117, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 118, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 119, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 120, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 121, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 122, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 123, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 124, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 125, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 126, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 127, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 128, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 129, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 130, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 131, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 132, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 133, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 134, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 135, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 136, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 137, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 138, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 139, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 140, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 141, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 142, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 143, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 144, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 145, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 146, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 147, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 148, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 149, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 150, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 151, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 152, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 153, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 154, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 155, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 156, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 157, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 158, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 159, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 160, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 161, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 162, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 163, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 164, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 165, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 166, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 167, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 168, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 169, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 170, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 171, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 172, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 173, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 174, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 175, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 176, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 177, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 178, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 179, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 180, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 181, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 182, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 183, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 184, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 185, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 186, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 187, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 188, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 189, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 190, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 191, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 192, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 193, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 194, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 195, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 196, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 197, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 198, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 199, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 200, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 201, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 202, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 203, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 204, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 205, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 206, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 207, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 208, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 209, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 210, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 211, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 212, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 213, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 214, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 215, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 216, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 217, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 218, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 219, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 220, 0);
INSERT INTO `stok_awal` VALUES ('2020-11-01', 221, 0);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `supplier_alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `supplier_kontak` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pengguna_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE,
  INDEX `supplier_pengguna_id_foreign`(`pengguna_id`) USING BTREE,
  CONSTRAINT `supplier_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (3, 'Darya Varia', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (4, 'Mersifarma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (5, 'Kimia Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (6, 'Lapi', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (7, 'Guardian', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (8, 'Infion', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (9, 'Sanbe', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (10, 'Hexpharm', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (11, 'Sampharindo Perdana', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (12, 'Ifars', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (13, 'Abbott', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (14, 'Interbat', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (15, 'Nulab OGB', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (16, 'Prafa', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (17, 'Medifarma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (18, 'Graha farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (19, 'Molex Ayus', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (20, 'GlaxoSmith Kline', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (21, 'Combiphar', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (22, 'SDM', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (23, 'Mundipharma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (24, 'Sanbe ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (25, 'Hexpharm/KF', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (26, 'Nulab ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (27, 'Saka Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (28, 'Erela', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (29, 'Mega Esa Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (30, 'Novapharin', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (31, 'Rama Emerald ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (32, 'Dexa Medica', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (33, 'Kalbe', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (34, 'Phapros', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (35, 'Solas', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (36, 'Molex', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (37, 'Husada', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (38, 'Boehringer', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (39, 'Caprifarmindo', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (40, 'Pharos', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (41, 'Cap Lang', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (42, 'Cap Lang ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (43, 'Novell', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (44, 'Fahrenheit', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (45, 'Mahakam Beta Farma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (46, 'Johnson Johnson', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (47, 'Otsuka', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (48, 'First medipharma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (49, 'GSK', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (50, 'Erlimpex', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (51, 'Onemed', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (52, 'Quick & sure', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (53, 'Steril', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (54, 'Cendo', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (55, 'Bufa ', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (56, 'Nulab', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (57, 'IPI', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (58, 'Enseval', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (59, 'Indofarma', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (60, 'Terumo', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);
INSERT INTO `supplier` VALUES (61, 'Brataco', NULL, NULL, 'administrator', '2020-10-19 00:00:00', '2020-10-19 00:00:00', NULL);

SET FOREIGN_KEY_CHECKS = 1;
