/*
 Navicat MySQL Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : xyyglxt

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 11/12/2023 17:24:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` int(0) NOT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (1, '张三', 0, '12345678910', '山东农业大学');
INSERT INTO `client` VALUES (2, '李林', 1, '15535636565', '山东农业大学');
INSERT INTO `client` VALUES (3, '王奕', 1, '18775456354', '山东农业大学');

-- ----------------------------
-- Table structure for cure_record
-- ----------------------------
DROP TABLE IF EXISTS `cure_record`;
CREATE TABLE `cure_record`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `register_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cure_record
-- ----------------------------
INSERT INTO `cure_record` VALUES (1, '2023年12月10日', 4, 1, '感冒发烧', 1);
INSERT INTO `cure_record` VALUES (2, '2023年12月11日', 5, 1, '感冒咳嗽', 1);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `allcount` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '急诊科', 50);
INSERT INTO `department` VALUES (2, '内科', 50);
INSERT INTO `department` VALUES (3, '外科', 50);

-- ----------------------------
-- Table structure for medicines
-- ----------------------------
DROP TABLE IF EXISTS `medicines`;
CREATE TABLE `medicines`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` float NOT NULL,
  `medicines_type_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicines
-- ----------------------------
INSERT INTO `medicines` VALUES (1, '阿司匹林肠溶片', 18.5, 1);
INSERT INTO `medicines` VALUES (2, '阿莫西林胶囊', 15.8, 2);
INSERT INTO `medicines` VALUES (3, '头孢克肟胶囊', 9.9, 2);
INSERT INTO `medicines` VALUES (4, '布洛芬缓释胶囊', 9.9, 1);
INSERT INTO `medicines` VALUES (5, '阿昔洛韦片', 9.9, 3);
INSERT INTO `medicines` VALUES (6, '盐酸伐昔洛韦片', 20, 3);
INSERT INTO `medicines` VALUES (7, '连花清瘟胶囊', 29, 4);
INSERT INTO `medicines` VALUES (8, '金银花颗粒', 16.8, 4);

-- ----------------------------
-- Table structure for medicines_details
-- ----------------------------
DROP TABLE IF EXISTS `medicines_details`;
CREATE TABLE `medicines_details`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `main_id` int(0) NOT NULL,
  `medicines_id` int(0) NOT NULL,
  `count` int(0) NOT NULL,
  `price` float NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicines_details
-- ----------------------------
INSERT INTO `medicines_details` VALUES (1, 1, 4, 1, 9.9, 9.9);
INSERT INTO `medicines_details` VALUES (2, 1, 2, 1, 15.8, 15.8);
INSERT INTO `medicines_details` VALUES (3, 1, 8, 1, 16.8, 16.8);
INSERT INTO `medicines_details` VALUES (4, 1, 7, 1, 29, 29);
INSERT INTO `medicines_details` VALUES (5, 2, 7, 1, 29, 29);
INSERT INTO `medicines_details` VALUES (6, 2, 8, 1, 16.8, 16.8);

-- ----------------------------
-- Table structure for medicines_main
-- ----------------------------
DROP TABLE IF EXISTS `medicines_main`;
CREATE TABLE `medicines_main`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `client_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `cure_id` int(0) NOT NULL,
  `exec_id` int(0) NOT NULL,
  `amount` float NOT NULL,
  `status` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicines_main
-- ----------------------------
INSERT INTO `medicines_main` VALUES (1, '2023年12月10日', 1, 1, 1, 0, 71.5, 2);
INSERT INTO `medicines_main` VALUES (2, '2023年12月11日', 2, 1, 2, 0, 45.8, 2);

-- ----------------------------
-- Table structure for medicines_type
-- ----------------------------
DROP TABLE IF EXISTS `medicines_type`;
CREATE TABLE `medicines_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicines_type
-- ----------------------------
INSERT INTO `medicines_type` VALUES (1, '非甾体抗炎类');
INSERT INTO `medicines_type` VALUES (2, '抗生素类');
INSERT INTO `medicines_type` VALUES (3, '抗病毒类');
INSERT INTO `medicines_type` VALUES (4, '中成药');

-- ----------------------------
-- Table structure for register_record
-- ----------------------------
DROP TABLE IF EXISTS `register_record`;
CREATE TABLE `register_record`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `client_id` int(0) NOT NULL,
  `department_id` int(0) NOT NULL,
  `index` int(0) NOT NULL,
  `srctype` int(0) NOT NULL,
  `amount` float NOT NULL,
  `status` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of register_record
-- ----------------------------
INSERT INTO `register_record` VALUES (4, '2023年12月10日', 1, 1, 1, 0, 25, 5, 1);
INSERT INTO `register_record` VALUES (5, '2023年12月11日', 2, 2, 1, 0, 25, 5, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `power` int(0) NOT NULL,
  `department_id` int(0) NOT NULL,
  `createdate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (0, 'admin', '123', 1, 0, '2023年12月10日');
INSERT INTO `user` VALUES (1, '张医生', '123', 0, 1, '2023年12月10日');
INSERT INTO `user` VALUES (2, '李医生', '123', 0, 2, '2023年12月10日');
INSERT INTO `user` VALUES (3, '王医生', '123', 0, 3, '2023年12月10日');

SET FOREIGN_KEY_CHECKS = 1;
