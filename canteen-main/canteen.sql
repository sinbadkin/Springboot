/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : canteen

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 27/06/2024 12:06:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员3333', 'http://localhost:9090/files/download/QQ截图20230330090659.png', 'ADMIN');
INSERT INTO `admin` VALUES (2, 'admin123', 'admin', '管理员123', 'http://localhost:9090/files/download/微信截图_20231114162404.png', 'ADMIN');
INSERT INTO `admin` VALUES (6, 'admin2', 'admin', '管理员2', 'http://localhost:9090/files/download/微信截图_20231018172251.png', 'ADMIN');

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '餐品简介',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES (1, '番茄土豆肥牛汤', '今天分享一道超超超开胃又好喝的番茄土豆肥牛汤，汤汁拌米饭太下饭太好吃了👏食材简单，做法也简单，零难度快来试试看～', 29.00, 'http://localhost:9090/files/download/微信截图_20240227101316.png');
INSERT INTO `foods` VALUES (6, '糖醋排骨', '糖醋排骨味道非常鲜美，欢迎大家品尝', 39.00, 'http://localhost:9090/files/download/微信截图_20240227101659.png');
INSERT INTO `foods` VALUES (7, '腊肠炒芹菜', '用心经营每一餐', 28.00, 'http://localhost:9090/files/download/微信截图_20240227101826.png');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单内容',
  `total` decimal(10, 0) NULL DEFAULT NULL COMMENT '总价',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '点餐人',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '点餐时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单状态',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (4, '腊肠炒芹菜x1, 糖醋排骨x1', 67, 1, '2024-06-27 11:29:55', '待出餐', '56a456d0773c4019a9f3a1b19cb57d69');
INSERT INTO `orders` VALUES (5, '腊肠炒芹菜x3，糖醋排骨x3', 201, 1, '2024-06-27 11:37:23', '待出餐', 'ee7c36e22b6345fb9799c593fcca3d35');
INSERT INTO `orders` VALUES (6, '腊肠炒芹菜x3，糖醋排骨x3', 201, 3, '2024-06-27 11:47:57', '已完成', '684833a767d94c318e63c9308b5706b0');
INSERT INTO `orders` VALUES (7, '腊肠炒芹菜x1，糖醋排骨x1', 67, 7, '2024-06-27 12:00:13', '已完成', '99b2d93ca12f428ea0e018f571dcbce7');

-- ----------------------------
-- Table structure for tables
-- ----------------------------
DROP TABLE IF EXISTS `tables`;
CREATE TABLE `tables`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '餐桌号',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '规格',
  `free` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否空闲',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '使用人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '餐桌信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tables
-- ----------------------------
INSERT INTO `tables` VALUES (1, 'A101', '4人', '是', NULL);
INSERT INTO `tables` VALUES (2, 'A102', '4人', '是', NULL);
INSERT INTO `tables` VALUES (3, 'A103', '4人', '是', NULL);
INSERT INTO `tables` VALUES (4, 'A104', '4人', '是', NULL);
INSERT INTO `tables` VALUES (5, 'A105', '4人', '是', NULL);
INSERT INTO `tables` VALUES (6, 'A106', '4人', '是', NULL);
INSERT INTO `tables` VALUES (7, 'A107', '4人', '是', NULL);
INSERT INTO `tables` VALUES (8, 'A108', '4人', '是', NULL);
INSERT INTO `tables` VALUES (10, 'B101', '8人', '是', NULL);
INSERT INTO `tables` VALUES (11, 'B102', '8人', '是', NULL);
INSERT INTO `tables` VALUES (12, 'B103', '8人', '是', NULL);
INSERT INTO `tables` VALUES (13, 'B104', '8人', '是', NULL);
INSERT INTO `tables` VALUES (14, 'B105', '8人', '是', NULL);
INSERT INTO `tables` VALUES (15, 'B106', '8人', '否', 3);
INSERT INTO `tables` VALUES (16, 'B107', '8人', '是', NULL);
INSERT INTO `tables` VALUES (17, 'B108', '8人', '否', 6);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `account` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '账户余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'aaa', '123', '小青哥哥', 'http://localhost:9090/files/download/微信截图_20240409161232.png', 'USER', '男', '13899887799', 0.00);
INSERT INTO `user` VALUES (3, 'ccc', '123', 'ccc', NULL, 'USER', NULL, NULL, 0.00);
INSERT INTO `user` VALUES (4, 'bbb', '123', 'bbb', 'http://localhost:9090/files/download/122121211_1708655721764.jpg', 'USER', '男', '13899887788', 0.00);
INSERT INTO `user` VALUES (5, 'sss', '123', 'sss', 'http://localhost:9090/files/download/QQ截图20230330085759_1708566053188.png', 'USER', '男', '13899887788', 0.00);
INSERT INTO `user` VALUES (6, 'ddd', '123', 'ddd', NULL, 'USER', NULL, NULL, 0.00);
INSERT INTO `user` VALUES (7, 'accc', '123', 'accc', NULL, 'USER', NULL, NULL, 0.00);

SET FOREIGN_KEY_CHECKS = 1;
