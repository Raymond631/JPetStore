/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50739 (5.7.39-log)
 Source Host           : localhost:3306
 Source Schema         : jpetstore

 Target Server Type    : MySQL
 Target Server Version : 50739 (5.7.39-log)
 File Encoding         : 65001

 Date: 05/11/2022 21:55:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (11, '1', 'EST-10', 1);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `productID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `listPrice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`itemID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('FI-SW-01', 'EST-1', 'Large Angelfish', 9926, 16.50);
INSERT INTO `item` VALUES ('K9-DL-01', 'EST-10', 'Spotted Adult Female Dalmation', 9971, 18.50);
INSERT INTO `item` VALUES ('RP-SN-01', 'EST-11', 'Venomless Rattlesnake', 9670, 18.50);
INSERT INTO `item` VALUES ('RP-SN-01', 'EST-12', 'Rattleless Rattlesnake', 9989, 18.50);
INSERT INTO `item` VALUES ('RP-LI-02', 'EST-13', 'Green Adult Iguana', 9906, 18.50);
INSERT INTO `item` VALUES ('FL-DSH-01', 'EST-14', 'Tailless Manx', 8926, 58.50);
INSERT INTO `item` VALUES ('FL-DSH-01', 'EST-15', 'With tail Manx', 9972, 23.50);
INSERT INTO `item` VALUES ('FL-DLH-02', 'EST-16', 'Adult Female Persian', 9893, 93.50);
INSERT INTO `item` VALUES ('FL-DLH-02', 'EST-17', 'Adult Male Persian', 9918, 93.50);
INSERT INTO `item` VALUES ('AV-CB-01', 'EST-18', 'Adult Male Amazon Parrot', 7920, 193.50);
INSERT INTO `item` VALUES ('AV-SB-02', 'EST-19', 'Adult Male Finch', 9783, 15.50);
INSERT INTO `item` VALUES ('FI-SW-01', 'EST-2', 'Small Angelfish', 9924, 16.50);
INSERT INTO `item` VALUES ('FI-FW-02', 'EST-20', 'Adult Male Goldfish', 7726, 5.50);
INSERT INTO `item` VALUES ('FI-FW-02', 'EST-21', 'Adult Female Goldfish', 9848, 5.29);
INSERT INTO `item` VALUES ('K9-RT-02', 'EST-22', 'Adult Male Labrador Retriever', 9925, 135.50);
INSERT INTO `item` VALUES ('K9-RT-02', 'EST-23', 'Adult Female Labrador Retriever', 9979, 145.49);
INSERT INTO `item` VALUES ('K9-RT-02', 'EST-24', 'Adult Male Labrador Retriever', 9975, 255.50);
INSERT INTO `item` VALUES ('K9-RT-02', 'EST-25', 'Adult Female Labrador Retriever', 9976, 325.29);
INSERT INTO `item` VALUES ('K9-CW-01', 'EST-26', 'Adult Male Chihuahua', 9978, 125.50);
INSERT INTO `item` VALUES ('K9-CW-01', 'EST-27', 'Adult Female Chihuahua', 9983, 155.29);
INSERT INTO `item` VALUES ('K9-RT-01', 'EST-28', 'Adult Female Golden Retriever', 6290, 155.29);
INSERT INTO `item` VALUES ('FI-SW-02', 'EST-3', 'Toothless Tiger Shark', 9345, 18.50);
INSERT INTO `item` VALUES ('FI-FW-01', 'EST-4', 'Spotted Koi', 9720, 18.50);
INSERT INTO `item` VALUES ('FI-FW-01', 'EST-5', 'Spotless Koi', 9965, 18.50);
INSERT INTO `item` VALUES ('K9-BD-01', 'EST-6', 'Male Adult Bulldog', 8471, 18.50);
INSERT INTO `item` VALUES ('K9-BD-01', 'EST-7', 'Female Puppy Bulldog', 9920, 18.50);
INSERT INTO `item` VALUES ('K9-PO-02', 'EST-8', 'Male Puppy Poodle', 9648, 18.50);
INSERT INTO `item` VALUES ('K9-DL-01', 'EST-9', 'Spotless Male Puppy Dalmation', 9772, 18.50);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `productID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `listPrice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (7, '202211011524191003', 'EST-1', 'FI-SW-01', 'Large Angelfish', 9977, 1, 16.50);
INSERT INTO `orderitem` VALUES (8, '202211011524191003', 'EST-2', 'FI-SW-01', 'Small Angelfish', 9925, 1, 16.50);
INSERT INTO `orderitem` VALUES (9, '202211030918441000', 'EST-1', 'FI-SW-01', 'Large Angelfish', 9976, 10, 16.50);
INSERT INTO `orderitem` VALUES (10, '202211030919521000', 'EST-1', 'FI-SW-01', 'Large Angelfish', 9966, 10, 16.50);
INSERT INTO `orderitem` VALUES (16, '202211050934391000', 'EST-19', 'AV-SB-02', 'Adult Male Finch', 9793, 10, 15.50);
INSERT INTO `orderitem` VALUES (17, '202211052127061000', 'EST-8', 'K9-PO-02', 'Male Puppy Poodle', 9658, 10, 18.50);

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `orderID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注意: order是mysql关键字，不可用作表名',
  `orderTime` datetime NOT NULL,
  `payTime` datetime NOT NULL,
  `receiverName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detailedAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `totalPrice` decimal(10, 2) NOT NULL,
  `payMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`orderID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES ('j2ee', '202211011524191003', '2022-11-01 15:24:16', '2022-11-01 15:24:19', '李四', '15800000000', '中国', '湖南省', '长沙市', '天心区', '铁道学院', 33.00, 'Alipay');
INSERT INTO `orderlist` VALUES ('j2ee', '202211030918441000', '2022-11-03 09:18:38', '2022-11-03 09:18:44', '1', '1', '1', '1', '1', '1', '1', 165.00, 'Alipay');
INSERT INTO `orderlist` VALUES ('j2ee', '202211030919521000', '2022-11-03 09:19:49', '2022-11-03 09:19:52', '1', '1', '1', '1', '1', '1', '1', 165.00, 'Alipay');
INSERT INTO `orderlist` VALUES ('1', '202211050934391000', '2022-11-05 09:34:36', '2022-11-05 09:34:39', '张三', '15812341234', '中国', '湖南省', '长沙市', '天心区', '中南大学铁道学院', 155.00, 'Alipay');
INSERT INTO `orderlist` VALUES ('null', '202211052127061000', '2022-11-05 21:26:57', '2022-11-05 21:27:06', '1', '1', '1', '1', '1', '1', '1', 185.00, 'WeChatPay');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `productID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`productID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('Birds', 'AV-CB-01', 'Amazon Parrot', 'Great companion for up to 75 years');
INSERT INTO `product` VALUES ('Birds', 'AV-SB-02', 'Finch', 'Great stress reliever');
INSERT INTO `product` VALUES ('Fish', 'FI-FW-01', 'Koi', 'Fresh Water fish from Japan');
INSERT INTO `product` VALUES ('Fish', 'FI-FW-02', 'Goldfish', 'Fresh Water fish from China');
INSERT INTO `product` VALUES ('Fish', 'FI-SW-01', 'Angelfish', 'Salt Water fish from Australia');
INSERT INTO `product` VALUES ('Fish', 'FI-SW-02', 'Tiger Shark', 'Salt Water fish from Australia');
INSERT INTO `product` VALUES ('Cats', 'FL-DLH-02', 'Persian', 'Friendly house cat, doubles as a princess');
INSERT INTO `product` VALUES ('Cats', 'FL-DSH-01', 'Manx', 'Great for reducing mouse populations');
INSERT INTO `product` VALUES ('Dogs', 'K9-BD-01', 'Bulldog', 'Friendly dog from England');
INSERT INTO `product` VALUES ('Dogs', 'K9-CW-01', 'Chihuahua', 'Great companion dog');
INSERT INTO `product` VALUES ('Dogs', 'K9-DL-01', 'Dalmation', 'Great dog for a Fire Station');
INSERT INTO `product` VALUES ('Dogs', 'K9-PO-02', 'Poodle', 'Cute dog from France');
INSERT INTO `product` VALUES ('Dogs', 'K9-RT-01', 'Golden Retriever', 'Great family dog');
INSERT INTO `product` VALUES ('Dogs', 'K9-RT-02', 'Labrador Retriever', 'Great hunting dog');
INSERT INTO `product` VALUES ('Reptiles', 'RP-LI-02', 'Iguana', 'Friendly green friend');
INSERT INTO `product` VALUES ('Reptiles', 'RP-SN-01', 'Rattlesnake', '\r\nDoubles as a watch dog');

-- ----------------------------
-- Table structure for receiver
-- ----------------------------
DROP TABLE IF EXISTS `receiver`;
CREATE TABLE `receiver`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiverName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detailedAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receiver
-- ----------------------------
INSERT INTO `receiver` VALUES ('1', '张三', 'abc@123.com', '15812341234', '中国', '湖南省', '长沙市', '天心区', '中南大学铁道学院');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1');
INSERT INTO `user` VALUES ('123', '123');
INSERT INTO `user` VALUES ('hhh', '123');
INSERT INTO `user` VALUES ('raymond', '111');
INSERT INTO `user` VALUES ('root', '000');

-- ----------------------------
-- Table structure for userlogs
-- ----------------------------
DROP TABLE IF EXISTS `userlogs`;
CREATE TABLE `userlogs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` datetime NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sqlType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Create、Delete、Update、Read、Other',
  `operationContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'true，false',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userlogs
-- ----------------------------
INSERT INTO `userlogs` VALUES (186, '游客', '2022-11-05 21:39:06', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (187, '游客', '2022-11-05 21:39:17', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (188, '1', '2022-11-05 21:39:17', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (189, '1', '2022-11-05 21:39:21', '127.0.0.1', '/JPetStore_war_exploded/User/signOut', 'Other', '退出登录', 'true');
INSERT INTO `userlogs` VALUES (190, '游客', '2022-11-05 21:39:21', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (191, '游客', '2022-11-05 21:39:22', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (192, '游客', '2022-11-05 21:39:31', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '管理员查看用户日志root', 'true');
INSERT INTO `userlogs` VALUES (193, '游客', '2022-11-05 21:45:00', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (194, '游客', '2022-11-05 21:45:16', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '管理员查看用户日志root', 'true');
INSERT INTO `userlogs` VALUES (195, '游客', '2022-11-05 21:45:32', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (196, '游客', '2022-11-05 21:46:32', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (197, '游客', '2022-11-05 21:46:43', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '管理员查看用户日志root', 'true');
INSERT INTO `userlogs` VALUES (198, '游客', '2022-11-05 21:47:57', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (199, '游客', '2022-11-05 21:48:17', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '管理员查看用户日志root', 'true');
INSERT INTO `userlogs` VALUES (200, '游客', '2022-11-05 21:50:08', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (201, '游客', '2022-11-05 21:50:24', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '管理员查看用户日志root', 'true');
INSERT INTO `userlogs` VALUES (202, '游客', '2022-11-05 21:50:40', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (203, '游客', '2022-11-05 21:50:51', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '管理员查看用户日志root', 'true');
INSERT INTO `userlogs` VALUES (204, '游客', '2022-11-05 21:51:19', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (205, '游客', '2022-11-05 21:51:31', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '管理员查看用户日志root', 'true');
INSERT INTO `userlogs` VALUES (206, '游客', '2022-11-05 21:52:35', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (207, '游客', '2022-11-05 21:52:45', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Other', '登录验证码错误', 'false');
INSERT INTO `userlogs` VALUES (208, '游客', '2022-11-05 21:52:55', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '管理员查看用户日志root', 'true');
INSERT INTO `userlogs` VALUES (209, '游客', '2022-11-05 21:53:15', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (210, '游客', '2022-11-05 21:53:24', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '管理员查看用户日志root', 'true');

SET FOREIGN_KEY_CHECKS = 1;
