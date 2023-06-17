/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.3.195_3306
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : 192.168.3.195:3306
 Source Schema         : jpetstore

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 17/06/2023 12:09:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_item_id` int NOT NULL AUTO_INCREMENT COMMENT '代理主键，无意义',
  `user_id` int NOT NULL COMMENT '用户名',
  `product_id` int NOT NULL COMMENT '大类id',
  `item_id` int NOT NULL COMMENT '宠物id',
  `quantity` int NOT NULL COMMENT '数量',
  PRIMARY KEY (`cart_item_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `cart_ibfk_2`(`item_id` ASC) USING BTREE,
  INDEX `cart_ibfk_3`(`user_id` ASC) USING BTREE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `pet_item` (`item_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL COMMENT '订单编号',
  `item_id` int NOT NULL COMMENT '宠物id',
  `product_id` int NOT NULL COMMENT '大类id',
  `item_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片url',
  `product_name_Chinese` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `item_specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格',
  `item_price` decimal(10, 2) NOT NULL COMMENT '单价',
  `item_quantity` int NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`order_item_id`) USING BTREE,
  INDEX `item_id`(`item_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `order_item_ibfk_4`(`order_id` ASC) USING BTREE,
  CONSTRAINT `order_item_ibfk_4` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for order_main
-- ----------------------------
DROP TABLE IF EXISTS `order_main`;
CREATE TABLE `order_main`  (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` int NOT NULL COMMENT '用户id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_cost` decimal(10, 2) NOT NULL COMMENT '总金额',
  `order_payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微信支付、支付宝',
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收件人真实姓名',
  `receiver_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收件人电话',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收件人地址',
  `supplier_id` int NOT NULL COMMENT '商家id',
  `status` int NOT NULL COMMENT '1:未发货、2:已发货、3:已接收、4:买家已删除、5:卖家已删除、6:都已删除',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `order_main_ibfk_1`(`user_id` ASC) USING BTREE,
  CONSTRAINT `order_main_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_main
-- ----------------------------

-- ----------------------------
-- Table structure for pet_item
-- ----------------------------
DROP TABLE IF EXISTS `pet_item`;
CREATE TABLE `pet_item`  (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL COMMENT '所属product',
  `item_specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '成年雄性、成年雌性、幼年雄性、幼年雌性',
  `item_price` decimal(10, 2) NOT NULL COMMENT 'item单价',
  `item_stock` int NOT NULL COMMENT 'item库存（0为售罄，-1为下架）',
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `pet_item_ibfk_1`(`product_id` ASC) USING BTREE,
  CONSTRAINT `pet_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `pet_product` (`product_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pet_item
-- ----------------------------
INSERT INTO `pet_item` VALUES (1, 1, '成年雄性', 8807.95, 547);
INSERT INTO `pet_item` VALUES (2, 1, '成年雌性', 9373.79, 624);
INSERT INTO `pet_item` VALUES (3, 1, '幼年雄性', 1201.45, 830);
INSERT INTO `pet_item` VALUES (4, 1, '幼年雌性', 3965.29, 773);
INSERT INTO `pet_item` VALUES (5, 2, '成年雄性', 2819.68, 860);
INSERT INTO `pet_item` VALUES (6, 2, '成年雌性', 5949.23, 794);
INSERT INTO `pet_item` VALUES (7, 2, '幼年雄性', 1857.41, 973);
INSERT INTO `pet_item` VALUES (8, 2, '幼年雌性', 762.98, 475);
INSERT INTO `pet_item` VALUES (9, 3, '成年雄性', 674.43, 450);
INSERT INTO `pet_item` VALUES (10, 3, '成年雌性', 4100.19, 783);
INSERT INTO `pet_item` VALUES (11, 3, '幼年雄性', 5234.38, 624);
INSERT INTO `pet_item` VALUES (12, 3, '幼年雌性', 5293.03, 714);
INSERT INTO `pet_item` VALUES (13, 4, '成年雄性', 5834.55, 832);
INSERT INTO `pet_item` VALUES (14, 4, '成年雌性', 3682.15, 320);
INSERT INTO `pet_item` VALUES (15, 4, '幼年雄性', 890.45, 906);
INSERT INTO `pet_item` VALUES (16, 4, '幼年雌性', 6253.76, 960);
INSERT INTO `pet_item` VALUES (17, 5, '成年雄性', 3089.92, 524);
INSERT INTO `pet_item` VALUES (18, 5, '成年雌性', 7138.74, 458);
INSERT INTO `pet_item` VALUES (19, 5, '幼年雄性', 961.15, 210);
INSERT INTO `pet_item` VALUES (20, 5, '幼年雌性', 2286.84, 526);
INSERT INTO `pet_item` VALUES (21, 6, '成年雄性', 9161.67, 708);
INSERT INTO `pet_item` VALUES (22, 6, '成年雌性', 7835.98, 565);
INSERT INTO `pet_item` VALUES (23, 6, '幼年雄性', 6551.72, 662);
INSERT INTO `pet_item` VALUES (24, 6, '幼年雌性', 2478.28, 700);
INSERT INTO `pet_item` VALUES (25, 7, '成年雄性', 7094.02, 177);
INSERT INTO `pet_item` VALUES (26, 7, '成年雌性', 808.45, 554);
INSERT INTO `pet_item` VALUES (27, 7, '幼年雄性', 7298.23, 566);
INSERT INTO `pet_item` VALUES (28, 7, '幼年雌性', 5535.81, 362);
INSERT INTO `pet_item` VALUES (29, 8, '成年雄性', 7836.61, 913);
INSERT INTO `pet_item` VALUES (30, 8, '成年雌性', 6758.52, 877);
INSERT INTO `pet_item` VALUES (31, 8, '幼年雄性', 1495.50, 134);
INSERT INTO `pet_item` VALUES (32, 8, '幼年雌性', 5758.10, 610);
INSERT INTO `pet_item` VALUES (33, 9, '成年雄性', 1436.67, 630);
INSERT INTO `pet_item` VALUES (34, 9, '成年雌性', 4391.58, 960);
INSERT INTO `pet_item` VALUES (35, 9, '幼年雄性', 7962.24, 202);
INSERT INTO `pet_item` VALUES (36, 9, '幼年雌性', 7412.19, 551);
INSERT INTO `pet_item` VALUES (37, 10, '成年雄性', 4466.00, 939);
INSERT INTO `pet_item` VALUES (38, 10, '成年雌性', 2440.28, 370);
INSERT INTO `pet_item` VALUES (39, 10, '幼年雄性', 1170.26, 962);
INSERT INTO `pet_item` VALUES (40, 10, '幼年雌性', 5316.28, 33);
INSERT INTO `pet_item` VALUES (41, 11, '成年雄性', 582.89, 817);
INSERT INTO `pet_item` VALUES (42, 11, '成年雌性', 1525.24, 326);
INSERT INTO `pet_item` VALUES (43, 11, '幼年雄性', 1487.61, 248);
INSERT INTO `pet_item` VALUES (44, 11, '幼年雌性', 7256.76, 397);
INSERT INTO `pet_item` VALUES (45, 12, '成年雄性', 6073.13, 902);
INSERT INTO `pet_item` VALUES (46, 12, '成年雌性', 9773.69, 55);
INSERT INTO `pet_item` VALUES (47, 12, '幼年雄性', 324.22, 704);
INSERT INTO `pet_item` VALUES (48, 12, '幼年雌性', 5519.98, 678);
INSERT INTO `pet_item` VALUES (49, 13, '成年雄性', 9389.48, 255);
INSERT INTO `pet_item` VALUES (50, 13, '成年雌性', 9758.42, 380);
INSERT INTO `pet_item` VALUES (51, 13, '幼年雄性', 7014.96, 26);
INSERT INTO `pet_item` VALUES (52, 13, '幼年雌性', 2647.46, 210);
INSERT INTO `pet_item` VALUES (53, 14, '成年雄性', 205.32, 118);
INSERT INTO `pet_item` VALUES (54, 14, '成年雌性', 392.90, 409);
INSERT INTO `pet_item` VALUES (55, 14, '幼年雄性', 37.13, 755);
INSERT INTO `pet_item` VALUES (56, 14, '幼年雌性', 4838.34, 636);
INSERT INTO `pet_item` VALUES (57, 15, '成年雄性', 9705.57, 428);
INSERT INTO `pet_item` VALUES (58, 15, '成年雌性', 6910.67, 415);
INSERT INTO `pet_item` VALUES (59, 15, '幼年雄性', 3977.79, 534);
INSERT INTO `pet_item` VALUES (60, 15, '幼年雌性', 6329.65, 393);
INSERT INTO `pet_item` VALUES (61, 16, '成年雄性', 362.50, 780);
INSERT INTO `pet_item` VALUES (62, 16, '成年雌性', 3391.19, 956);
INSERT INTO `pet_item` VALUES (63, 16, '幼年雄性', 1653.50, 90);
INSERT INTO `pet_item` VALUES (64, 16, '幼年雌性', 255.84, 467);
INSERT INTO `pet_item` VALUES (65, 17, '成年雄性', 2775.14, 274);
INSERT INTO `pet_item` VALUES (66, 17, '成年雌性', 2368.13, 712);
INSERT INTO `pet_item` VALUES (67, 17, '幼年雄性', 1695.39, 502);
INSERT INTO `pet_item` VALUES (68, 17, '幼年雌性', 5242.14, 132);
INSERT INTO `pet_item` VALUES (69, 18, '成年雄性', 7861.74, 27);
INSERT INTO `pet_item` VALUES (70, 18, '成年雌性', 6755.64, 268);
INSERT INTO `pet_item` VALUES (71, 18, '幼年雄性', 8567.37, 527);
INSERT INTO `pet_item` VALUES (72, 18, '幼年雌性', 629.63, 123);
INSERT INTO `pet_item` VALUES (73, 19, '成年雄性', 604.45, 407);
INSERT INTO `pet_item` VALUES (74, 19, '成年雌性', 8634.14, 859);
INSERT INTO `pet_item` VALUES (75, 19, '幼年雄性', 3891.81, 282);
INSERT INTO `pet_item` VALUES (76, 19, '幼年雌性', 1771.12, 486);
INSERT INTO `pet_item` VALUES (77, 20, '成年雄性', 5954.97, 531);
INSERT INTO `pet_item` VALUES (78, 20, '成年雌性', 3353.45, 564);
INSERT INTO `pet_item` VALUES (79, 20, '幼年雄性', 3718.23, 630);
INSERT INTO `pet_item` VALUES (80, 20, '幼年雌性', 9933.33, 860);
INSERT INTO `pet_item` VALUES (81, 21, '成年雄性', 2242.98, 670);
INSERT INTO `pet_item` VALUES (82, 21, '成年雌性', 2693.59, 562);
INSERT INTO `pet_item` VALUES (83, 21, '幼年雄性', 2145.45, 699);
INSERT INTO `pet_item` VALUES (84, 21, '幼年雌性', 2520.55, 734);
INSERT INTO `pet_item` VALUES (85, 22, '成年雄性', 8476.66, 754);
INSERT INTO `pet_item` VALUES (86, 22, '成年雌性', 7789.58, 587);
INSERT INTO `pet_item` VALUES (87, 22, '幼年雄性', 5952.01, 96);
INSERT INTO `pet_item` VALUES (88, 22, '幼年雌性', 2597.04, 173);
INSERT INTO `pet_item` VALUES (89, 23, '成年雄性', 8849.13, 74);
INSERT INTO `pet_item` VALUES (90, 23, '成年雌性', 6515.10, 68);
INSERT INTO `pet_item` VALUES (91, 23, '幼年雄性', 5954.30, 713);
INSERT INTO `pet_item` VALUES (92, 23, '幼年雌性', 9328.40, 135);
INSERT INTO `pet_item` VALUES (93, 24, '成年雄性', 6817.03, 878);
INSERT INTO `pet_item` VALUES (94, 24, '成年雌性', 266.14, 208);
INSERT INTO `pet_item` VALUES (95, 24, '幼年雄性', 4172.71, 41);
INSERT INTO `pet_item` VALUES (96, 24, '幼年雌性', 425.90, 220);
INSERT INTO `pet_item` VALUES (97, 25, '成年雄性', 6227.03, 149);
INSERT INTO `pet_item` VALUES (98, 25, '成年雌性', 8489.16, 718);
INSERT INTO `pet_item` VALUES (99, 25, '幼年雄性', 972.59, 372);
INSERT INTO `pet_item` VALUES (100, 25, '幼年雌性', 4664.05, 852);
INSERT INTO `pet_item` VALUES (101, 26, '成年雄性', 8397.27, 896);
INSERT INTO `pet_item` VALUES (102, 26, '成年雌性', 710.79, 126);
INSERT INTO `pet_item` VALUES (103, 26, '幼年雄性', 8572.65, 456);
INSERT INTO `pet_item` VALUES (104, 26, '幼年雌性', 9091.81, 651);
INSERT INTO `pet_item` VALUES (105, 27, '成年雄性', 5924.63, 115);
INSERT INTO `pet_item` VALUES (106, 27, '成年雌性', 6368.30, 365);
INSERT INTO `pet_item` VALUES (107, 27, '幼年雄性', 7312.72, 1);
INSERT INTO `pet_item` VALUES (108, 27, '幼年雌性', 6518.35, 917);
INSERT INTO `pet_item` VALUES (109, 28, '成年雄性', 8365.13, 893);
INSERT INTO `pet_item` VALUES (110, 28, '成年雌性', 2099.62, 705);
INSERT INTO `pet_item` VALUES (111, 28, '幼年雄性', 6993.06, 946);
INSERT INTO `pet_item` VALUES (112, 28, '幼年雌性', 1334.66, 936);
INSERT INTO `pet_item` VALUES (113, 29, '成年雄性', 4505.48, 977);
INSERT INTO `pet_item` VALUES (114, 29, '成年雌性', 3867.94, 403);
INSERT INTO `pet_item` VALUES (115, 29, '幼年雄性', 1301.61, 107);
INSERT INTO `pet_item` VALUES (116, 29, '幼年雌性', 7371.21, 163);
INSERT INTO `pet_item` VALUES (117, 30, '成年雄性', 3589.50, 505);
INSERT INTO `pet_item` VALUES (118, 30, '成年雌性', 6649.38, 931);
INSERT INTO `pet_item` VALUES (119, 30, '幼年雄性', 1763.09, 21);
INSERT INTO `pet_item` VALUES (120, 30, '幼年雌性', 8919.84, 474);
INSERT INTO `pet_item` VALUES (121, 31, '成年雄性', 3191.42, 736);
INSERT INTO `pet_item` VALUES (122, 31, '成年雌性', 3672.54, 337);
INSERT INTO `pet_item` VALUES (123, 31, '幼年雄性', 4453.43, 626);
INSERT INTO `pet_item` VALUES (124, 31, '幼年雌性', 8496.95, 422);
INSERT INTO `pet_item` VALUES (125, 32, '成年雄性', 7768.80, 979);
INSERT INTO `pet_item` VALUES (126, 32, '成年雌性', 5810.81, 54);
INSERT INTO `pet_item` VALUES (127, 32, '幼年雄性', 8739.70, 606);
INSERT INTO `pet_item` VALUES (128, 32, '幼年雌性', 9936.25, 756);
INSERT INTO `pet_item` VALUES (133, 34, '成年雄性', 6485.89, 326);
INSERT INTO `pet_item` VALUES (134, 34, '成年雌性', 9785.76, 501);
INSERT INTO `pet_item` VALUES (135, 34, '幼年雄性', 3630.70, 321);
INSERT INTO `pet_item` VALUES (136, 34, '幼年雌性', 3376.54, 271);
INSERT INTO `pet_item` VALUES (137, 35, '成年雄性', 4063.54, 508);
INSERT INTO `pet_item` VALUES (138, 35, '成年雌性', 7488.67, 280);
INSERT INTO `pet_item` VALUES (139, 35, '幼年雄性', 5055.63, 824);
INSERT INTO `pet_item` VALUES (140, 35, '幼年雌性', 8941.77, 736);
INSERT INTO `pet_item` VALUES (141, 36, '成年雄性', 4243.31, 520);
INSERT INTO `pet_item` VALUES (142, 36, '成年雌性', 3103.74, 123);
INSERT INTO `pet_item` VALUES (143, 36, '幼年雄性', 8783.39, 589);
INSERT INTO `pet_item` VALUES (144, 36, '幼年雌性', 3101.13, 241);
INSERT INTO `pet_item` VALUES (145, 37, '成年雄性', 98.00, 292);
INSERT INTO `pet_item` VALUES (146, 37, '成年雌性', 4484.54, 277);
INSERT INTO `pet_item` VALUES (147, 37, '幼年雄性', 2859.61, 441);
INSERT INTO `pet_item` VALUES (148, 37, '幼年雌性', 9338.29, 670);
INSERT INTO `pet_item` VALUES (149, 38, '成年雄性', 6296.22, 541);
INSERT INTO `pet_item` VALUES (150, 38, '成年雌性', 3305.11, 218);
INSERT INTO `pet_item` VALUES (151, 38, '幼年雄性', 9203.02, 396);
INSERT INTO `pet_item` VALUES (152, 38, '幼年雌性', 2236.10, 863);
INSERT INTO `pet_item` VALUES (153, 39, '成年雄性', 7178.44, 606);
INSERT INTO `pet_item` VALUES (154, 39, '成年雌性', 7776.90, 621);
INSERT INTO `pet_item` VALUES (155, 39, '幼年雄性', 7849.41, 305);
INSERT INTO `pet_item` VALUES (156, 39, '幼年雌性', 1514.95, 129);
INSERT INTO `pet_item` VALUES (157, 40, '成年雄性', 2599.95, 947);
INSERT INTO `pet_item` VALUES (158, 40, '成年雌性', 5485.47, 11);
INSERT INTO `pet_item` VALUES (159, 40, '幼年雄性', 7106.72, 254);
INSERT INTO `pet_item` VALUES (160, 40, '幼年雌性', 413.38, 44);
INSERT INTO `pet_item` VALUES (161, 41, '成年雄性', 3077.14, 969);
INSERT INTO `pet_item` VALUES (162, 41, '成年雌性', 8776.06, 978);
INSERT INTO `pet_item` VALUES (163, 41, '幼年雄性', 6556.38, 893);
INSERT INTO `pet_item` VALUES (164, 41, '幼年雌性', 583.71, 64);
INSERT INTO `pet_item` VALUES (165, 42, '成年雄性', 8760.28, 139);
INSERT INTO `pet_item` VALUES (166, 42, '成年雌性', 6654.85, 556);
INSERT INTO `pet_item` VALUES (167, 42, '幼年雄性', 5650.09, 105);
INSERT INTO `pet_item` VALUES (168, 42, '幼年雌性', 8274.37, 881);
INSERT INTO `pet_item` VALUES (169, 43, '成年雄性', 1018.92, 178);
INSERT INTO `pet_item` VALUES (170, 43, '成年雌性', 8484.68, 280);
INSERT INTO `pet_item` VALUES (171, 43, '幼年雄性', 8423.88, 882);
INSERT INTO `pet_item` VALUES (172, 43, '幼年雌性', 5936.32, 73);
INSERT INTO `pet_item` VALUES (173, 44, '成年雄性', 417.55, 305);
INSERT INTO `pet_item` VALUES (174, 44, '成年雌性', 7100.64, 297);
INSERT INTO `pet_item` VALUES (175, 44, '幼年雄性', 365.67, 600);
INSERT INTO `pet_item` VALUES (176, 44, '幼年雌性', 7225.83, 728);
INSERT INTO `pet_item` VALUES (177, 45, '成年雄性', 1624.84, 196);
INSERT INTO `pet_item` VALUES (178, 45, '成年雌性', 8253.52, 120);
INSERT INTO `pet_item` VALUES (179, 45, '幼年雄性', 9645.59, 117);
INSERT INTO `pet_item` VALUES (180, 45, '幼年雌性', 9570.70, 22);
INSERT INTO `pet_item` VALUES (181, 46, '成年雄性', 7095.18, 188);
INSERT INTO `pet_item` VALUES (182, 46, '成年雌性', 8839.70, 211);
INSERT INTO `pet_item` VALUES (183, 46, '幼年雄性', 3440.49, 683);
INSERT INTO `pet_item` VALUES (184, 46, '幼年雌性', 8257.80, 892);
INSERT INTO `pet_item` VALUES (185, 47, '成年雄性', 4348.26, 186);
INSERT INTO `pet_item` VALUES (186, 47, '成年雌性', 9337.52, 544);
INSERT INTO `pet_item` VALUES (187, 47, '幼年雄性', 9703.30, 123);
INSERT INTO `pet_item` VALUES (188, 47, '幼年雌性', 4127.72, 345);
INSERT INTO `pet_item` VALUES (189, 48, '成年雄性', 6562.80, 156);
INSERT INTO `pet_item` VALUES (190, 48, '成年雌性', 4319.73, 281);
INSERT INTO `pet_item` VALUES (191, 48, '幼年雄性', 4586.95, 701);
INSERT INTO `pet_item` VALUES (192, 48, '幼年雌性', 4079.57, 80);
INSERT INTO `pet_item` VALUES (193, 49, '成年雄性', 1395.26, 177);
INSERT INTO `pet_item` VALUES (194, 49, '成年雌性', 4175.60, 382);
INSERT INTO `pet_item` VALUES (195, 49, '幼年雄性', 9434.31, 754);
INSERT INTO `pet_item` VALUES (196, 49, '幼年雌性', 9935.78, 119);
INSERT INTO `pet_item` VALUES (197, 50, '成年雄性', 9657.91, 175);
INSERT INTO `pet_item` VALUES (198, 50, '成年雌性', 892.33, 125);
INSERT INTO `pet_item` VALUES (199, 50, '幼年雄性', 5494.13, 453);
INSERT INTO `pet_item` VALUES (200, 50, '幼年雌性', 794.79, 202);
INSERT INTO `pet_item` VALUES (201, 51, '成年雄性', 8954.01, 146);
INSERT INTO `pet_item` VALUES (202, 51, '成年雌性', 8616.39, 308);
INSERT INTO `pet_item` VALUES (203, 51, '幼年雄性', 6004.58, 55);
INSERT INTO `pet_item` VALUES (204, 51, '幼年雌性', 3349.37, 826);
INSERT INTO `pet_item` VALUES (205, 52, '成年雄性', 7440.61, 895);
INSERT INTO `pet_item` VALUES (206, 52, '成年雌性', 9717.18, 590);
INSERT INTO `pet_item` VALUES (207, 52, '幼年雄性', 415.49, 529);
INSERT INTO `pet_item` VALUES (208, 52, '幼年雌性', 8195.19, 676);
INSERT INTO `pet_item` VALUES (209, 53, '成年雄性', 5307.43, 619);
INSERT INTO `pet_item` VALUES (210, 53, '成年雌性', 4062.29, 110);
INSERT INTO `pet_item` VALUES (211, 53, '幼年雄性', 6214.04, 618);
INSERT INTO `pet_item` VALUES (212, 53, '幼年雌性', 7889.59, 268);
INSERT INTO `pet_item` VALUES (213, 54, '成年雄性', 6490.82, 796);
INSERT INTO `pet_item` VALUES (214, 54, '成年雌性', 7958.58, 322);
INSERT INTO `pet_item` VALUES (215, 54, '幼年雄性', 5625.88, 506);
INSERT INTO `pet_item` VALUES (216, 54, '幼年雌性', 1409.80, 971);
INSERT INTO `pet_item` VALUES (217, 55, '成年雄性', 2500.17, 516);
INSERT INTO `pet_item` VALUES (218, 55, '成年雌性', 456.35, 87);
INSERT INTO `pet_item` VALUES (219, 55, '幼年雄性', 729.91, 446);
INSERT INTO `pet_item` VALUES (220, 55, '幼年雌性', 780.64, 925);
INSERT INTO `pet_item` VALUES (221, 56, '成年雄性', 8337.08, 964);
INSERT INTO `pet_item` VALUES (222, 56, '成年雌性', 9638.65, 259);
INSERT INTO `pet_item` VALUES (223, 56, '幼年雄性', 9577.65, 333);
INSERT INTO `pet_item` VALUES (224, 56, '幼年雌性', 4429.19, 589);
INSERT INTO `pet_item` VALUES (225, 57, '成年雄性', 4380.73, 490);
INSERT INTO `pet_item` VALUES (226, 57, '成年雌性', 9194.45, 200);
INSERT INTO `pet_item` VALUES (227, 57, '幼年雄性', 4772.54, 820);
INSERT INTO `pet_item` VALUES (228, 57, '幼年雌性', 9521.83, 588);
INSERT INTO `pet_item` VALUES (229, 58, '成年雄性', 3458.19, 618);
INSERT INTO `pet_item` VALUES (230, 58, '成年雌性', 6075.07, 33);
INSERT INTO `pet_item` VALUES (231, 58, '幼年雄性', 5047.84, 530);
INSERT INTO `pet_item` VALUES (232, 58, '幼年雌性', 259.91, 769);
INSERT INTO `pet_item` VALUES (233, 59, '成年雄性', 2175.79, 277);
INSERT INTO `pet_item` VALUES (234, 59, '成年雌性', 4111.49, 76);
INSERT INTO `pet_item` VALUES (235, 59, '幼年雄性', 5445.50, 207);
INSERT INTO `pet_item` VALUES (236, 59, '幼年雌性', 863.31, 731);
INSERT INTO `pet_item` VALUES (237, 60, '成年雄性', 2385.46, 817);
INSERT INTO `pet_item` VALUES (238, 60, '成年雌性', 8397.39, 821);
INSERT INTO `pet_item` VALUES (239, 60, '幼年雄性', 6164.43, 814);
INSERT INTO `pet_item` VALUES (240, 60, '幼年雌性', 5934.63, 365);

-- ----------------------------
-- Table structure for pet_product
-- ----------------------------
DROP TABLE IF EXISTS `pet_product`;
CREATE TABLE `pet_product`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '狗狗、猫咪、小宠、水族、爬虫',
  `product_name_Chinese` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '中文名',
  `product_name_English` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '英文名',
  `product_character` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性格',
  `product_ancestry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '祖籍',
  `product_disease` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '容易患的疾病',
  `product_life` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '寿命范围',
  `product_introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简介',
  `product_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
  `supplier_id` int NOT NULL COMMENT '供应商user_id',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `product_supplier`(`supplier_id` ASC) USING BTREE,
  CONSTRAINT `pet_product_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pet_product
-- ----------------------------
INSERT INTO `pet_product` VALUES (1, '狗狗', '金毛', 'Golden Retriever', '活泼、忠诚、憨厚、友善', '苏格兰', '髋关节发育不良', '10-15年', '金毛巡回猎犬（Golden Retriever），原产于苏格兰，祖先有雪达犬血统，因有较强的游泳能力，并能把猎物从水中叼回给主人，故最初用作狩猎及巡回被枪猎射落的水鸟，AKC分类属于运动犬组。', '1.jpg', 1);
INSERT INTO `pet_product` VALUES (2, '狗狗', '哈士奇', 'Siberian Huskiy', '聪明机灵、极度热情、神经质', '俄罗斯', '肠胃疾病', '9-15年', '西伯利亚雪橇犬（Siberian Huskiy)又称为哈士奇，原产于西伯利亚地区，AKC分类属于工作犬组。西伯利亚雪橇犬是东西伯利亚游牧民族伊奴特乔克治族饲养的犬种，长期担任拉雪橇。引导驯鹿及守卫等工作。20世纪初，被毛皮商人带至美国，多年来，一直成为举世闻名的拉雪橇竞赛冠军犬。目前，西伯利亚雪橇犬多被用作伴侣犬。家庭玩赏犬。', '2.jpg', 1);
INSERT INTO `pet_product` VALUES (3, '狗狗', '罗威纳犬', 'Rottweiler', '聪明懂事，个性沉稳，对主人绝对忠诚', '德国', '肠胃疾病', '9-11年', '罗威纳犬（Rottweiler），又称为罗威拿犬，罗纳维德犬，原产于德国，AKC分类属于工作犬组。历史上该犬曾用于帮助人类拖拉物品、打斗、护卫等工作，属于多重用途的大型工作犬种。第一次世界大战时，该犬被作为军犬大量使用于战场，20世纪中期逐步被训练为警用犬。目前，该犬是世界各国最受欢迎的警用犬、军用犬之一，受训后可成为优良的家庭护卫犬。', '3.jpg', 1);
INSERT INTO `pet_product` VALUES (4, '狗狗', '博美犬', 'Pomeranian', '友善亲切、活泼好动、聪明可训、好管闲事', '德国', '气管塌陷、心脏病', '10-16年', '谈及小型玩赏犬及伴侣犬，令人们立刻联想起博美犬，由于博美犬的性格极其外向且活泼可爱，深受广大爱宠人士的喜爱。博美犬原产自德国，属于狐狸犬一种。早期的博美犬体型比较大，而且大多都是白色的毛发。在19世纪以来，经过选拔配种繁育而逐渐发展成为今天小型的犬种。现在的博美犬属于小型玩赏犬种。', '4.jpg', 1);
INSERT INTO `pet_product` VALUES (5, '狗狗', '比熊犬', 'Bichon Frise', '聪明伶俐、活泼好动 、温和友善', '法国', '眼病、耳病', '12-15岁', '比熊犬（Bichon Frisé）是一种小型常见的宠物狗，1500年，当法国入侵意大利时，法国人被比熊犬白绒绒可爱的样子迷住了，并把它作为战利品带回法国。比熊犬对居住环境的要求很高，经常需要有人陪伴，这点需要特别注意。', '5.jpg', 1);
INSERT INTO `pet_product` VALUES (6, '狗狗', '阿拉斯加雪橇犬', 'Alaskan Malamute', '非常聪明友好、喜欢吠叫', '美国', '肠胃疾病', '12-15年', '比熊犬性情温顺、敏感、顽皮又不乏可爱。整体外貌而言，比熊犬体型较小，但身体强壮，活泼可爱，长满蓬松毛发的小尾巴竖在背后，长着一双萌动而又好奇的黑眼睛，它的动作优雅，轻灵惹人欢喜。\"', '6.jpg', 1);
INSERT INTO `pet_product` VALUES (7, '狗狗', '拉布拉多猎犬', 'Labrador', '对人非常友善、脾气好', '加拿大', '髋关节坏死症', '12—15年', '阿拉斯加雪橇犬（Alaskan Malamute），又称阿拉斯加马拉穆，是最古老的雪橇犬之一，原产于美国，AKC分类属工作犬组。因它的四肢发达，体格健壮，培育它的目的是为了耐力而不是速度，因而它们的主要用途是拉雪橇。作为宠物，阿拉斯加雪橇犬一旦成熟后有着非常安静、高雅的气质，而且它们忠于主人。', '7.jpg', 1);
INSERT INTO `pet_product` VALUES (8, '狗狗', '贵宾', 'Poodle', '聪明、负责、易训练、安静、可靠', '法国', '多泪症、外耳炎', '13-19年', '拉布拉多犬和人一样，在成长的过程中难免会受伤害、生病、误食等等，对于初次养狗的人来说，遇到意外时，确实会有点手忙脚乱，许多人也都没想过狗狗会像人类一样会生病。遇到紧急情况的时候我们应找到病因或及时送医治疗。', '8.jpg', 1);
INSERT INTO `pet_product` VALUES (9, '狗狗', '边境牧羊犬', 'Border Collie', '顽强、温顺、敏锐、机警、聪明、容易训练', '英国', '肠胃病', '12-14年', '边境牧羊犬是一种中等体型的牧羊犬。被广泛认为是最聪明的犬种，它们是曾经遍布不列颠群岛的地方牧羊犬的后代，但在盎格鲁-苏格兰边境地区成为标准化犬种。它们现在主要用作工作犬来放牧牲畜，特别是绵羊。', '9.jpg', 1);
INSERT INTO `pet_product` VALUES (10, '狗狗', '柴犬', 'Shiba inu', '聪明独立、温顺忠实', '日本', '肠道疾病', '12年左右', '边境牧羊犬（Border Collie），又称边界牧羊犬，原产于英国和苏格兰边境，具有该地柯利工作犬的血统，1915年正式命名，AKC分类属于畜牧犬组。因其灵敏的反应和良好的耐力，1873年起该犬就逐渐被利用作牧羊犬，而且还被输出到全世界多个国家。因该犬极聪明，智商公认排名世界第一，相当于6-8岁小孩，目前多用作家庭玩赏犬。', '10.jpg', 1);
INSERT INTO `pet_product` VALUES (11, '狗狗', '法老王猎犬', 'Pharaoh Hound', '感情丰富且顽皮、警惕而活跃', '马耳他', '肥胖症', '12-14年', '柴犬（Shiba Inu），原产地日本，是日本本土中体型最小并且最古老的犬种，日文中意即“灌木丛狗”，柴犬最初是用来狩猎大型猎物的，但是现在他们用于狩猎较小的动物。在日本的城市、郊区和乡村都可看到柴犬。', '11.jpg', 1);
INSERT INTO `pet_product` VALUES (12, '狗狗', '巴哥犬', 'pug', '开朗活泼、热情憨厚', '中国', '肥胖症', '12-15年', '法老王猎犬（Pharaoh Hound），又称科博特菲勒犬，猎兔犬。原产地马耳他，起源于公元前1000年。它出色的捕猎技巧以及与人之间的默契关系，是我们如今了解和研究犬类历史不可多得的财富与瑰宝。警惕而活跃，非常忠实而敏锐的优秀猎犬，视觉和嗅觉都很好。', '12.jpg', 1);
INSERT INTO `pet_product` VALUES (13, '猫咪', '布偶猫', 'Ragdoll', '温顺好静、对人友善', '美国', 'HCM心肌肥大症', '12-15年', '布偶猫又叫布拉多尔猫、布娃娃猫、玩偶猫，拉丁学名为Ragdoll。虽然布偶猫的体型和体重在整个猫类中都是最大，但它们确是十足的温柔大块头。它们对人类非常友善，即便面对孩子们的打闹也能大度包容，因此布偶猫受到许多家庭的青睐。如果你喜欢粘人的猫咪，那么布偶猫绝对是一个不错的选择。', '13.jpg', 1);
INSERT INTO `pet_product` VALUES (14, '猫咪', '英国短毛猫', 'British Shorthair', '甜美可人，亲近人类', '英国', '肠胃疾病', '10-15年', '英国短毛猫有悠久的历史，但直到20世纪初才引起人们的宠爱。该猫体形圆胖，外型 由中型至大型。其骨架及肌肉很发达，短而肥的颈与及阔而平的肩膊相配合。头部圆而阔， 体粗短发达，被毛短而密，头大脸圆，大而圆的眼睛根据被毛不同而呈现各种颜色。最大的特征是支耳的距离很接近身。该猫温柔平静，对人友善，很容易饲养。', '14.jpg', 1);
INSERT INTO `pet_product` VALUES (15, '猫咪', '中国狸花猫', 'Dragon Li', '性格沉稳，感情丰富', '中国', '消化系统与眼部的疾病', '10-15年', '中国狸花猫以前被视为难登大雅之堂的土猫，但近年来，许多爱猫人士都致力于中国纯种狸花猫的培育，2010年2月8日经过CFA中国长城猫俱乐部六年的努力，CFA终于认可是狸花这一中国本土自然品种。中国长城猫俱乐部为尊重中国人习惯，公布了狸花猫在国际上的标准名字为：Chinese LiHua。', '15.jpg', 1);
INSERT INTO `pet_product` VALUES (16, '猫咪', '异国短毛猫', 'Exotic Shorthair', '性格好静，可爱，温纯，甜美', '美国', '猫鼻支', '10-15年', '大家喜欢叫它加菲猫，憨憨的样子极其可爱。加菲猫(Garfield)是由吉姆·戴维斯(Jim Davis)所创，第一次出现在美国报纸上是在1978年6月19日。它是一只爱说风凉话、好吃、爱睡觉，以及爱捉弄人的大肥猫。无论成人还是孩子都被它的魅力所倾倒。', '16.jpg', 1);
INSERT INTO `pet_product` VALUES (17, '猫咪', '波斯猫', 'Persian', '温文尔雅，反应灵敏，善解人意', '阿富汗', '泪腺重，易流眼泪', '12-15年', '大多数人都知道波斯猫是走贵族路线的，因此它们的一举一动都透露出贵气，比如它们不像有些猫咪一样好动，而是喜欢安静地待在一边看着主人；它们的叫声也永远那么地柔美，偶尔撒娇叫一叫，主人的心都化了；它们走路也不会出现从你身边“飞过”的情形，它们似乎要时刻保持自己的优雅风度。', '17.jpg', 1);
INSERT INTO `pet_product` VALUES (18, '猫咪', '暹罗猫', 'Siamese', '性格刚烈好动，机智灵活，好奇心强', '泰国', '后腿虚弱', '10-18年', '暹罗猫，又叫泰国猫、西母猫，其英文名为Siamese，起源于14世纪，祖先为非纯种亚洲猫。虽然科学家手中并没有握着暹罗猫来源的证据，但他们相信暹罗猫是从泰国而来。据记载，暹罗猫早在几百年前就生活在泰国的皇宫和寺庙中，之后它们被作为外交礼物而送给其他国家。', '18.jpg', 1);
INSERT INTO `pet_product` VALUES (19, '猫咪', '苏格兰折耳猫', 'Scottish Fold', '糖果般甜美的性格', '苏格兰', '遗传性骨骼疾病', '10-15年', '苏格兰折耳猫的耳朵竟是整齐地扣在头上，于是很自然地人们在头脑中把它们划到了精灵族的一边，猫猫中的折耳精灵族非它莫属。据说在1961年，苏格兰一户牧羊人家里的一只母猫产下了一窝小猫，其中有一只奇怪的小猫，它有着白色的被毛、紧扣着的耳朵和像猫头鹰一样的脸，因为原产地靠近苏格兰的库泊安格斯，从此便根据出生地及耳朵下折的现象，命名这个品种为“苏格兰折耳猫”。', '19.jpg', 1);
INSERT INTO `pet_product` VALUES (20, '猫咪', '加拿大无毛猫', 'Sphynx', '性情温顺，容易训练', '加拿大', '皮肤病', '12-15年', '加拿大无毛猫智商很高，它们的智商甚至超越了暹罗猫，所以除了基本生活技能的训练外，主人还可以教它们学习一些明星拓张技能，比如网络上很流行的装死等。需要注意的是，智商高的猫咪学习能力很强，它们有可能会通过观察你开门关门而学会自己开门关门，而有的时候你放在抽屉里的零食也可能会被它们发现，因此主人在养加拿大无毛猫的时候可要做好监护工作，不要让它们背着你做出一些“坏事”哦！', '20.jpg', 1);
INSERT INTO `pet_product` VALUES (21, '猫咪', '俄罗斯蓝猫', 'Russian Blue', '文静怕生', '俄罗斯', '消化系统与眼部的疾病', '10-15年', '俄罗斯蓝猫的祖先起源于西伯利亚，这也是它们被称为冬天的精灵的原因。一开始俄罗斯蓝猫的祖先从俄罗斯被带去英国，为了保证其种群数量，一些动物繁育者就用暹罗猫与它们杂交，因此俄罗斯蓝猫便跟暹罗猫一样带有了一些东方情调。此外，一些繁育者还培育出一些俄罗斯蓝猫过渡性猫种，但这些过渡性猫种并没有被认可为俄罗斯蓝猫。', '21.jpg', 1);
INSERT INTO `pet_product` VALUES (22, '猫咪', '西伯利亚森林猫', 'Siberian、SibirskayaKoshka', '对人类很友好，对主人非常依恋', '俄罗斯', '消化系统与眼部的疾病', '10-15年', '西伯利亚森林猫简称西伯利亚猫。与该猫有关的最早的文字记录出现于11世纪：它们是俄国市场和西伯利亚乡下非常普通常见的猫。西伯利亚猫由于生活在自然环境苛刻的国家，所以全身上下都被长长的被毛所覆盖，就连颈部周围都有一圈厚厚的毛领子。它们外层护毛质硬、光滑且呈油性，底层绒毛浓密厚实，这才得以抵抗西伯利亚地区的严寒。', '22.jpg', 1);
INSERT INTO `pet_product` VALUES (23, '猫咪', '喜马拉雅猫', 'Himalayan、Colourpoint Persians', '聪明，温文尔雅', '英国和美国', '肠胃疾病', '10-15年', '波斯是一个已被广泛认知和相当流行的品种，在其早期杂交培育的基础上出现了喜马拉雅猫。波斯猫的早期演变最有可能发生在高寒的波斯高原(即今天的伊朗和伊拉克)上。当这些有着丝质长毛的猫被腓尼基人和罗马人带到欧洲时，欧洲人为之倾心了。这些年来，波斯在繁殖时一直被刻意保留和强调其长毛的特征。', '23.jpg', 1);
INSERT INTO `pet_product` VALUES (24, '猫咪', '埃及猫', 'Egyptian Mau', '聪明，与主人亲近', '埃及', '肥胖、糖尿病', '12-15年', '埃及猫，拉丁学名为Felinae，在世界各地均有分布。虽然叫埃及猫，但现在人们却并不能证实埃及猫就是来源于埃及，不过由于在古埃及的壁画、墓碑或者纸卷上都有其图形和文字记载，所以人们认为埃及猫的祖先是非洲野猫。上个世纪50年代，埃及猫传入美国和英国，并在1968年获得正规比赛的奖项。', '24.jpg', 1);
INSERT INTO `pet_product` VALUES (25, '小宠', '狨猴', 'Marmoset', '活泼，可爱，温顺但脆弱', '巴西', '肠道疾病', '10-15年', '狨猴（Marmoset）因体型较小所以又叫拇指猴(详情介绍)，它们行动非常敏捷，尤其在树林间穿东奔西、窜跳自如时。它们是生活在南美洲亚马逊河流域的森林中的一种世界上最小的猴子。这种猴子喜欢捉虱子吃，且性格温和，因此饲养它们便成了当地印第安人的嗜好。', '25.jpg', 1);
INSERT INTO `pet_product` VALUES (26, '小宠', '垂耳兔', 'Luggage', '乖巧可爱', '欧洲', '兔球虫病', '5-7年', '垂耳兔是现今最受人们欢迎的宠物兔品种，不同于其他兔子，垂耳兔的耳朵是向下垂的，并且体型也并不会很大，性格温顺，能与人类生活的很融洽，缺点就是寿命很短暂，一般寿命在7~8岁。', '26.jpg', 1);
INSERT INTO `pet_product` VALUES (27, '小宠', '虎皮鹦鹉', 'Budgerigar', '个性独立、活泼好动', '澳大利亚', '呼吸器官、消化器官以及寄生虫疾病', '10-20年', '关注鹦鹉的人一定不会对虎皮鹦鹉陌生，它们是非常常见的一种鹦鹉，在很多养鸟的家庭中能看到它们。不少人在第一次见到虎皮鹦鹉时可能就会发现，虎皮鹦鹉的叫声并不动听，但这也不是它们的“卖点”，它们那身十分美丽的羽毛才是让人们产生好感的关键。', '27.jpg', 1);
INSERT INTO `pet_product` VALUES (28, '小宠', '八哥鸟', 'Acridotherescristatellus', '活泼，爱表现、爱凑热闹', '中国', '寄生虫、沙门氏、大肠杆菌', '22年左右', '八哥鸟为中国常见的观赏鸟之一，也是我国独有的观赏鸟之一。自古以来，八哥鸟就是王公贵族们的玩耍之物，有很多文学作品和历史文献中都有提到过八哥鸟。如今，八哥鸟因为非常有灵性，并且通体黑色的外观非常特殊，深受人们的喜爱，将八哥鸟当做宠物鸟来饲养的也越来越多。根据《中国大百科全书》介绍，雄性八哥一般寿命在8~10年左右，雌性八哥一般寿命在10~12年左右。野生八哥一般寿命比笼养的短1~2年！据史书记载，唐朝年间有一大户人家养的一雌性八哥生命力极强，寿命达二十二年。', '28.jpg', 1);
INSERT INTO `pet_product` VALUES (29, '小宠', '安哥拉兔', 'Angora', '温顺、呆萌', '土耳其', '球虫病、真菌类疾病', '5-7年', '安哥拉兔就是网络上很红的草泥兔，其实这是一个很普通的毛用兔品种，产毛量大且价格不昂贵，所以草泥兔并不像羊驼那样稀缺，相反，养殖安哥拉兔的饲养场在国内有很多。现在，人们越来越喜欢毛茸茸的宠物，所以安哥拉兔也走进了普通家庭，最为宠物饲养。', '29.jpg', 1);
INSERT INTO `pet_product` VALUES (30, '小宠', '小葵花凤头鹦鹉', 'Yellow-crested Cockatoo', '性格比较暴烈，攻击性太强', '澳大利亚、印尼', '呼吸器官、消化器官以及寄生虫疾病', '50年左右', '小葵花凤头鹦鹉极具特色的外表能让它们从众多鸟儿中脱颖而出，不过也因为相貌出众，它们遭到人们的肆意捕捉。一般在城市中，我们不太会见到有很多人饲养它们，但是如果你欣赏过马戏团的表演，你可能就会发现它们也可以成为一名优秀的演员。由于数量锐减，目前小葵花凤头鹦鹉已被列为极危物种。', '30.jpg', 1);
INSERT INTO `pet_product` VALUES (31, '小宠', '布丁仓鼠', 'Cricetidae', '温顺、胆小', '亚洲', '肠胃病', '1-3年', '布丁仓鼠，别称腮鼠、搬仓鼠、葵鼠，拉丁学名Cricetidae。布丁仓鼠在宠物市场上属于比较常见的品种，由于布丁仓鼠的体色为黄色，而且非常像布丁的那种黄色，所以称为布丁仓鼠，非常受鼠友们的喜爱。', '31.jpg', 1);
INSERT INTO `pet_product` VALUES (32, '小宠', '指猴', 'aye-aye', '性格温和', '马达加斯加', '肠胃疾病', '23年左右', '在大多数人的印象中，指猴体型非常小，它们的体长不会超过人类一根手指的长度，而由于实在太过迷你，它们甚至可以把人类的手指当成攀爬物紧抱，所以人们便将它们称呼为指猴。但指猴之所以被称为指猴，原因并不在此，指趾特长才是指猴名字由来的真正原因。', '32.jpg', 1);
INSERT INTO `pet_product` VALUES (34, '小宠', '三线仓鼠', 'Phodopus sungorus', '容易受惊吓，不太亲近人，活泼可爱', '叙利亚', '肠胃疾病', '2-3年', '三线仓鼠也称加卡利亚仓鼠，俗名很多，仓鼠应该属动物类比较好养的宠物之一了，而且三线仓鼠刚养的时候很乖，但会不会咬人，还得看他的个性，就像狗一样，并不是所有的泰迪、比熊性格都好、都不会咬人。', '34.jpg', 1);
INSERT INTO `pet_product` VALUES (35, '小宠', '奶茶仓鼠', 'Milk Tea Hamster', '生性较懒性格温顺', '加卡利亚', '湿尾症、皮肤病', '2-6年', '奶茶仓鼠（DwarfWinterWhiteRussianHamster）因它背部整体的颜色比较均匀与我们日常所饮的珍珠奶茶色非常相似，故以奶茶仓鼠来命名的。', '35.jpg', 1);
INSERT INTO `pet_product` VALUES (36, '小宠', '相思鸟', 'Leiothrix argentauris', '性格活泼、生性泼辣', '中国、印度、越南等地', '呼吸器官、消化器官疾病', '4-5年', '相思鸟名字的由来相比不少人都能猜得出来——它们总是成对出现，于是人们便给它们的这种行为做出“对爱情坚贞不二”的拟人化解释，进而给它们取名相思鸟。相思鸟是无危物种，在中国很常见，花鸟市场中也有很多商家会出售这种鸟。除了在中国出现外，相思鸟也见于印度、越南等地。', '36.jpg', 1);
INSERT INTO `pet_product` VALUES (37, '水族', '金龙鱼', 'Scleropagesformosus', '活跃、暴躁、害羞', '大洋洲、南美洲和亚洲', '鱼瘟、白云病、腐皮病、烂尾病等', '10-20年', '金龙鱼在2.9亿年前就已经开始存在了，是少数古生鱼类之一。现在金龙鱼主要分布在大洋洲、南美洲和亚洲等地。金龙鱼可以分为好几个品系，比较有名的品种有过背金龙(详情介绍)和红龙鱼。', '37.jpg', 1);
INSERT INTO `pet_product` VALUES (38, '水族', '鹦鹉鱼', 'Blood parrot', '比较活跃，喜欢玩耍', '中国台湾省', '白点病、黑斑病、头洞病、肠炎', '4-5年', '鹦鹉鱼是一种广为人知的观赏鱼，由于其色彩艳丽，嘴型又酷似鹦鹉而得名。另有一种由美洲慈鲷雄红魔鬼鱼和紫红火口杂交培育成的淡水赏观鱼，因体色鲜红，又称为血鹦鹉。', '38.jpg', 1);
INSERT INTO `pet_product` VALUES (39, '水族', '银龙鱼', 'Osteoglossum bicirrhosum', '易受惊', '亚马孙河和圭亚那', '锚虫病、水霉病、白点病', '10-20年', '银龙鱼由于其外形酷似古代的龙，并且全身鳞片为银色而命名。幼年的银龙鱼体色较蓝，在水中游动的时候反射出的光非常好看。银龙鱼成年体长可达90－100厘米，属于大型观赏鱼。', '39.jpg', 1);
INSERT INTO `pet_product` VALUES (40, '水族', '过背金龙', 'Malayan Golden Arawana', '易受惊', '马来西亚半岛西侧', '鱼瘟、白云病、腐皮病、烂尾病等', '6-7年', '过背金龙鱼最大的特点就是鳞杠的金色杠缘一直延伸到背部，过背金龙的这种形态是马来半岛产的亚洲龙鱼的独有特征，所以显得特别珍贵。', '40.jpg', 1);
INSERT INTO `pet_product` VALUES (41, '水族', '招财鱼', 'osphronemus goramy', '性情温和', '越南、泰国、马来西亚', '红斑病', '5-8年', '招财鱼，又名飞船、长丝鲈。招财鱼可以说是丝足鲈科中的巨人了，他们成年体长可达20－69厘米。招财鱼对水质的要求并不严格，属于比较容易饲养的观赏鱼，并且招财鱼的性情温和，可以和别的观赏鱼混养。', '41.jpg', 1);
INSERT INTO `pet_product` VALUES (42, '水族', '孔雀鱼', 'guppy', '性情温和', '委内瑞拉、圭亚那等', '白点病、烂尾症', '1-2年', '孔雀鱼和其名字一样，有着像孔雀开屏一样的尾巴，其独特的外形以及饲养难度不大深受鱼友们的欢迎。', '42.jpg', 1);
INSERT INTO `pet_product` VALUES (43, '水族', '印尼虎鱼', 'tigerfish', '比较沉稳', '印尼', '真菌感染、红斑病', '16年左右', '印尼虎鱼最大的特点就是他们是夜行鱼，白天休息，到了夜间才会开始觅食并且活动。也正因为印尼虎鱼是夜行动物，所以印尼虎鱼的欣赏性比较差，饲养的鱼友并不是非常多。印尼虎鱼的黑色条纹是不稳定的发黑，更有甚者还会发黑到找不到条纹。', '43.jpg', 1);
INSERT INTO `pet_product` VALUES (44, '水族', '金鱼', 'Carassius auratus', '性格非常温和', '中国', '鱼瘟、白云病、腐皮病、烂尾病等', '6-7年', '金鱼，别名金鲫鱼。拉丁学名为Carassius auratus,金鱼起源于中国，并且被中国人熟知，金鱼品种经过不断的优化已经培育出125个以上的品种了，也是世界观赏鱼史上最早的品种。', '44.jpg', 1);
INSERT INTO `pet_product` VALUES (45, '水族', '成吉思汗鱼', 'pangasius sanitwongsei', '混养会吃掉比自己小很多的鱼', '亚洲湄公河流域等', '白点病、烂尾症', '5-6年', '成吉思汗鱼体长超过一米，明显特征为高高的背鳍（背鳍第一棘条特别长）体型强悍，游速很快，嘴很宽大，需要大水体来饲养。混养需注意，体型悬殊的会被相互吞食。', '45.jpg', 1);
INSERT INTO `pet_product` VALUES (46, '水族', '地图鱼', 'Astronotus ocellatus', '略显凶猛，有时自相残杀', '圭亚那、委内瑞拉等', '锚虫病、水霉病、白点病', '4-5年', '地图鱼是一种比较常见的热带鱼，他们体型较大，行动迟缓，习性有点凶猛，食量大的惊人，有时会自相残杀，或者吃掉自己的小鱼。但是它如果跟其他种类的鱼待久了以后，它还会保护它。有经验的鱼友们也有训练地图鱼的情况，甚至还有能认出主人的地图鱼，还有一些训练有素的地图鱼甚至会从水族箱中跃起水面接受主人手中的饵料。', '46.jpg', 1);
INSERT INTO `pet_product` VALUES (47, '水族', '彩虹鲨', 'Labeo frenatus', '凶猛好斗，有很强的领地观念', '泰国、马来西亚等', '白点病、烂尾症', '3-4年', '彩虹鲨属于来自泰国的品种，在热带鱼中，彩虹鲨的体型属于中型偏大的，彩虹鲨的成年体长可以达到14厘米。彩虹鲨属于比较容易饲养的品种，他们对水质的要求非常低。彩虹鲨属于花盆卵生鱼类，有护卵的习性，一般不会自食其卵。', '47.jpg', 1);
INSERT INTO `pet_product` VALUES (48, '水族', '宝莲灯鱼', 'Cheirodco axclrodi', '随和活泼', '巴西、哥伦比亚等', '白点病', '3-4年', '宝莲灯鱼，又名日光灯鱼、新红莲灯鱼，体型娇小，由于身上半部有一条明亮的蓝绿色带下方后腹部有一块红色斑块，全身带有金属光泽，闪闪发光，所以也有人称他们为红绿灯。', '48.jpg', 1);
INSERT INTO `pet_product` VALUES (49, '爬虫', '金钱龟', 'Cuora trifasciata', '胆小怕惊', '广东、广西、福建', '腐皮', '50年左右', '金钱龟的外观很容易辨认，黄色的头部、棕红色的背部上有着三条黑色的条纹，分布不同的金钱龟外观有一定的区别，主要集中在体型与条纹的分布上，但是整体的外观不变。', '49.jpg', 1);
INSERT INTO `pet_product` VALUES (50, '爬虫', '大鳄龟\n', 'Macroclemystemminckii', '凶猛', '美国中南部', '腐皮', '50-80年', '大鳄龟又称真鳄龟，是比较凶悍的龟类品种，通常不会有人将其与其他种类的龟混养，并且鳄龟由于饲养方式简单、生长速度快、肉囤积速度快，所以很多人都将其称为肉龟，用来宰杀吃肉。', '50.jpg', 1);
INSERT INTO `pet_product` VALUES (51, '爬虫', '黄头侧颈龟\n', 'Yellow-spotted turtle', '胆小、害羞', '委内瑞拉、哥伦比亚', '暴毙', '40年左右', '黄头侧颈龟基本上是水栖的。尽管幼龟可以饲养在很小的空间里，但成龟那庞大的体型，使得室内饲养成为一桩难事。这种龟最适合居住在最南部的养龟爱好者们饲养，那儿可以提供常年饲养的户外设施。', '51.jpg', 1);
INSERT INTO `pet_product` VALUES (52, '爬虫', '中华草龟\n', 'Chinese pond turtle', '温润内敛且保持风骨', '中国，日本，菲律宾', '白眼病、肠胃病', '20-30年', '中华草龟是我国最常见的本土品种，可以入药也可以观赏，是比较具有经济效益的品种，一般购买的话也不贵，平时在一些水池里也有可能见到，公草龟又一定的几率可以变黑，所以又叫乌龟。', '52.jpg', 1);
INSERT INTO `pet_product` VALUES (53, '爬虫', '巴西红耳龟\n', 'Trachemys scripta elegans', '顽强、活泼', '美国中南部', '白眼、腐皮、肺炎', '25年左右', '巴西红耳龟就是我们常说的巴西龟，也叫密西西比红耳龟，虽然不是我国本土品种，但是却非常的常见。巴西龟价格便宜，因此往往被选作是放生的对象，也是因为这样，巴西龟一度被认定是外来入侵物种。放生到野外的巴西龟没有天敌、食量惊人且繁殖速度快，会对本土龟种甚至对本土自然生态造成影响，所以在很多国家，这种放生行为是被禁止的，甚至巴西龟的售卖也被认定是违法行为。', '53.jpg', 1);
INSERT INTO `pet_product` VALUES (54, '爬虫', '黄喉拟水龟', 'Asian Yellow Pond Turtle', '温顺', '南方地区', '腐甲', '50-80年', '黄喉拟水龟是深受大家喜欢的龟品种之一，在我国分布广泛，龟的价格浮动也比较大，苗的价格有时在几百元、有时却近千元，但无论怎样，也阻挡不了人们爱它的心。', '54.jpg', 1);
INSERT INTO `pet_product` VALUES (55, '爬虫', '蛋龟', 'Turtle', '温顺，互动性较好', '来自不同的地方', '呛水', '50年左右', '蛋龟是人们越来越钟爱的宠物龟品种，但是蛋龟准确来说，不是一个品种，而是很多品种的总称，在生物学分类中，蛋龟种下有四个属，而这四个属中又包含了很多种类的龟，每一种都有区别，比较不容易判断。', '55.jpg', 1);
INSERT INTO `pet_product` VALUES (56, '爬虫', '赤练蛇', 'Lycodon rufozonatus', '性情比较温和', '中国', '霉斑病', '20年左右', '赤练蛇又名赤链蛇，全身黑褐色与红色相间，外形比较特别，成年的赤练蛇体长约1米左右。赤练蛇由于其身上的红色窄横纹而得名，头部有一个“∧”形的红色斑。', '56.jpg', 1);
INSERT INTO `pet_product` VALUES (57, '爬虫', '黑颈乌龟', 'Red-necked pond turtle', '活泼', '中国广东、海南、广西', '腐皮', '80年左右', '黑颈乌龟是我国特有的品种，黑颈乌龟会发出一种奇怪的味道，所以当地人也称其为臭龟，长久以来这是一种无人饲养的龟种，但是近年来越来越多的人喜欢吃龟，所以黑颈乌龟的药用价格被搬上台面，导致其价格上涨，野生资源开始匮乏。', '57.jpg', 1);
INSERT INTO `pet_product` VALUES (58, '爬虫', '中华石龙子', 'Chinese skink', '性格活跃，适应性强', '中国、越南', '软骨症', '5-6年', '中华石龙子（Chinese skink），比较向往低海拔地区，平原耕作区，1000公尺以下山区及平地草丛。中国化石龙子主要分布在越南、台湾以及中国大陆等地。', '58.jpg', 1);
INSERT INTO `pet_product` VALUES (59, '爬虫', '火焰龟', 'Painted Turtle', '活泼', '北美大陆', '腐甲', '30年左右', '火焰龟，又叫红肚龟，其实是巴西龟的一个分支，但其美丽的花纹比巴西更胜一筹。价格不贵、形态可爱，同时长大后的成龟以素食为主，成本低廉，所以，火焰龟成为水族爱好者饲养宠物龟的首选。', '59.jpg', 1);
INSERT INTO `pet_product` VALUES (60, '爬虫', '加拉帕戈斯象龟', 'Galapagos Giant Tortoise', '高傲', '加拉帕戈斯群岛', '腐甲', '200年左右', '加拉帕戈斯象龟是现存最大的陆龟品种，一共有12个亚种，但是无论哪一个亚种，数量均很稀少，有两个亚种也已经确定灭绝，最让人感到可惜的就是2012年去世的“孤单的乔治”他的死亡受到了世界的关注，代表着该亚种最后一只龟的死亡。', '60.jpg', 1);

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth`  (
  `user_id` int NOT NULL COMMENT '外键',
  `login_type` int NOT NULL COMMENT '登录方式：1、密码登录；2、支付宝登录；3、微博登录',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户唯一标识，相当于账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户登录凭证，相当于密码',
  PRIMARY KEY (`login_type`, `account`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_auth_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_auth
-- ----------------------------
INSERT INTO `user_auth` VALUES (1, 1, '123', '202cb962ac59075b964b07152d234b70');
INSERT INTO `user_auth` VALUES (18, 1, 'A', '202cb962ac59075b964b07152d234b70');
INSERT INTO `user_auth` VALUES (22, 1, 'ABC', '202cb962ac59075b964b07152d234b70');
INSERT INTO `user_auth` VALUES (19, 1, 'B', '202cb962ac59075b964b07152d234b70');
INSERT INTO `user_auth` VALUES (17, 1, 'hhh', '202cb962ac59075b964b07152d234b70');
INSERT INTO `user_auth` VALUES (23, 2, '2088242523246181', NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称，不是账号',
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiver_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'pr', '张三1', '15852358372', '中南大学');
INSERT INTO `user_info` VALUES (17, '123', 'ZHANGSAN', '123', '123');
INSERT INTO `user_info` VALUES (18, 'HE', '一号', '123', '456');
INSERT INTO `user_info` VALUES (19, 'B', '', '', '');
INSERT INTO `user_info` VALUES (22, 'ABC', '', '', '');
INSERT INTO `user_info` VALUES (23, '2088242523246181', '', '', '');

SET FOREIGN_KEY_CHECKS = 1;
