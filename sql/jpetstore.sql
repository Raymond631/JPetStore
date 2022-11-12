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

 Date: 12/11/2022 13:34:27
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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

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
INSERT INTO `item` VALUES ('K9-DL-01', 'EST-10', 'Spotted Adult Female Dalmation', 9961, 18.50);
INSERT INTO `item` VALUES ('RP-SN-01', 'EST-11', 'Venomless Rattlesnake', 9670, 18.50);
INSERT INTO `item` VALUES ('RP-SN-01', 'EST-12', 'Rattleless Rattlesnake', 9989, 18.50);
INSERT INTO `item` VALUES ('RP-LI-02', 'EST-13', 'Green Adult Iguana', 9906, 18.50);
INSERT INTO `item` VALUES ('FL-DSH-01', 'EST-14', 'Tailless Manx', 8916, 58.50);
INSERT INTO `item` VALUES ('FL-DSH-01', 'EST-15', 'With tail Manx', 9972, 23.50);
INSERT INTO `item` VALUES ('FL-DLH-02', 'EST-16', 'Adult Female Persian', 9893, 93.50);
INSERT INTO `item` VALUES ('FL-DLH-02', 'EST-17', 'Adult Male Persian', 9918, 93.50);
INSERT INTO `item` VALUES ('AV-CB-01', 'EST-18', 'Adult Male Amazon Parrot', 7920, 193.50);
INSERT INTO `item` VALUES ('AV-SB-02', 'EST-19', 'Adult Male Finch', 9783, 15.50);
INSERT INTO `item` VALUES ('FI-SW-01', 'EST-2', 'Small Angelfish', 9924, 16.50);
INSERT INTO `item` VALUES ('FI-FW-02', 'EST-20', 'Adult Male Goldfish', 7726, 5.50);
INSERT INTO `item` VALUES ('FI-FW-02', 'EST-21', 'Adult Female Goldfish', 9846, 5.29);
INSERT INTO `item` VALUES ('K9-RT-02', 'EST-22', 'Adult Male Labrador Retriever', 9925, 135.50);
INSERT INTO `item` VALUES ('K9-RT-02', 'EST-23', 'Adult Female Labrador Retriever', 9979, 145.49);
INSERT INTO `item` VALUES ('K9-RT-02', 'EST-24', 'Adult Male Labrador Retriever', 9975, 255.50);
INSERT INTO `item` VALUES ('K9-RT-02', 'EST-25', 'Adult Female Labrador Retriever', 9966, 325.29);
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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (23, '202211121329411000', 'EST-14', 'FL-DSH-01', 'Tailless Manx', 8926, 10, 58.50);

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
INSERT INTO `orderlist` VALUES ('1', '202211121329411000', '2022-11-12 13:29:38', '2022-11-12 13:29:41', '李四', '15812341234', '中国', '湖南省', '长沙市', '天心区', '中南大学铁道学院', 585.00, 'Alipay');

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
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `languagePreference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `favouriteCategory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enableMyList` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'true or false',
  `enableMyBanner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'true or false',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'English', 'null', 'null', 'null');

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
INSERT INTO `receiver` VALUES ('1', '李四', 'abc@123.com', '15812341234', '中国', '湖南省', '长沙市', '天心区', '中南大学铁道学院');

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
INSERT INTO `user` VALUES ('1', '111');
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
) ENGINE = InnoDB AUTO_INCREMENT = 1095 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userlogs
-- ----------------------------
INSERT INTO `userlogs` VALUES (828, '游客', '2022-11-12 11:52:43', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (829, '游客', '2022-11-12 11:52:47', '127.0.0.1', '/JPetStore_war_exploded/User/showRegister', 'Other', '跳往注册界面', 'true');
INSERT INTO `userlogs` VALUES (830, '游客', '2022-11-12 11:54:18', '127.0.0.1', '/JPetStore_war_exploded/User/showRegister', 'Other', '跳往注册界面', 'true');
INSERT INTO `userlogs` VALUES (831, '游客', '2022-11-12 11:57:22', '127.0.0.1', '/JPetStore_war_exploded/User/showRegister', 'Other', '跳往注册界面', 'true');
INSERT INTO `userlogs` VALUES (832, '游客', '2022-11-12 11:59:19', '127.0.0.1', '/JPetStore_war_exploded/User/showRegister', 'Other', '跳往注册界面', 'true');
INSERT INTO `userlogs` VALUES (833, '游客', '2022-11-12 12:00:10', '127.0.0.1', '/JPetStore_war_exploded/User/showRegister', 'Other', '跳往注册界面', 'true');
INSERT INTO `userlogs` VALUES (834, '游客', '2022-11-12 12:01:00', '127.0.0.1', '/JPetStore_war_exploded/User/showRegister', 'Other', '跳往注册界面', 'true');
INSERT INTO `userlogs` VALUES (835, '游客', '2022-11-12 12:02:59', '127.0.0.1', '/JPetStore_war_exploded/User/showRegister', 'Other', '跳往注册界面', 'true');
INSERT INTO `userlogs` VALUES (836, '游客', '2022-11-12 12:03:16', '127.0.0.1', '/JPetStore_war_exploded/User/register', 'Create', '注册新用户,username=1', 'true');
INSERT INTO `userlogs` VALUES (837, '1', '2022-11-12 12:03:16', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (838, '1', '2022-11-12 12:03:18', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (839, '1', '2022-11-12 12:03:37', '127.0.0.1', '/JPetStore_war_exploded/User/updateProfile', 'Update', '修改个人信息', 'true');
INSERT INTO `userlogs` VALUES (840, '1', '2022-11-12 12:03:38', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (841, '1', '2022-11-12 12:03:43', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (842, '1', '2022-11-12 12:03:52', '127.0.0.1', '/JPetStore_war_exploded/User/updateProfile', 'Update', '修改个人信息', 'true');
INSERT INTO `userlogs` VALUES (843, '1', '2022-11-12 12:03:52', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (844, '1', '2022-11-12 12:04:21', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (845, '1', '2022-11-12 12:04:27', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (846, '1', '2022-11-12 12:04:29', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (847, '1', '2022-11-12 12:11:50', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (848, '1', '2022-11-12 12:12:06', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (849, '游客', '2022-11-12 12:12:21', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (850, '游客', '2022-11-12 12:12:32', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (851, '1', '2022-11-12 12:12:32', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (852, '1', '2022-11-12 12:12:35', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (853, '1', '2022-11-12 12:12:47', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (854, '1', '2022-11-12 12:14:27', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (855, '1', '2022-11-12 12:14:29', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (856, '1', '2022-11-12 12:14:36', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (857, '1', '2022-11-12 12:14:40', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (858, '1', '2022-11-12 12:14:52', '127.0.0.1', '/JPetStore_war_exploded/User/updateReceiver', 'Update', '修改收件人信息', 'true');
INSERT INTO `userlogs` VALUES (859, '1', '2022-11-12 12:14:52', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (860, '1', '2022-11-12 12:37:18', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (861, '1', '2022-11-12 12:37:23', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (862, '1', '2022-11-12 12:37:25', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (863, '1', '2022-11-12 12:39:25', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (864, '1', '2022-11-12 12:39:26', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (865, '1', '2022-11-12 12:39:27', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (866, '1', '2022-11-12 12:39:27', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (867, '游客', '2022-11-12 12:39:39', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (868, '游客', '2022-11-12 12:39:45', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (869, '1', '2022-11-12 12:39:45', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (870, '1', '2022-11-12 12:39:48', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (871, '1', '2022-11-12 12:40:06', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (872, '1', '2022-11-12 12:40:07', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (873, '1', '2022-11-12 12:40:08', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (874, '1', '2022-11-12 12:40:08', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (875, '1', '2022-11-12 12:40:09', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (876, '1', '2022-11-12 12:40:09', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (877, '游客', '2022-11-12 12:40:27', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (878, '游客', '2022-11-12 12:40:35', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (879, '1', '2022-11-12 12:40:35', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (880, '1', '2022-11-12 12:40:37', '127.0.0.1', '/JPetStore_war_exploded/Order/orderList', 'Read', '查看订单列表', 'true');
INSERT INTO `userlogs` VALUES (881, '1', '2022-11-12 12:40:38', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (882, '1', '2022-11-12 12:41:48', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (883, '1', '2022-11-12 12:42:47', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (884, '游客', '2022-11-12 12:43:03', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (885, '游客', '2022-11-12 12:43:11', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (886, '1', '2022-11-12 12:43:12', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (887, '1', '2022-11-12 12:43:14', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (888, '1', '2022-11-12 12:43:34', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (889, '1', '2022-11-12 12:44:48', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (890, '1', '2022-11-12 12:45:07', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (891, '游客', '2022-11-12 12:49:53', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (892, '游客', '2022-11-12 12:50:01', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (893, '1', '2022-11-12 12:50:01', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (894, '1', '2022-11-12 12:50:04', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (895, '游客', '2022-11-12 12:51:38', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (896, '游客', '2022-11-12 12:51:49', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (897, '1', '2022-11-12 12:51:49', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (898, '1', '2022-11-12 12:53:03', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (899, '1', '2022-11-12 12:53:04', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (900, '游客', '2022-11-12 12:53:24', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (901, '游客', '2022-11-12 12:53:35', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (902, '1', '2022-11-12 12:53:35', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (903, '1', '2022-11-12 12:53:40', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (904, '1', '2022-11-12 12:54:27', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (905, '1', '2022-11-12 12:54:50', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (906, '1', '2022-11-12 12:54:51', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (907, '1', '2022-11-12 12:54:57', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (908, '1', '2022-11-12 12:54:59', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (909, '1', '2022-11-12 12:55:02', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (910, '1', '2022-11-12 12:55:04', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (911, '1', '2022-11-12 12:55:05', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (912, '1', '2022-11-12 12:55:06', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (913, '1', '2022-11-12 12:55:06', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (914, '1', '2022-11-12 12:55:10', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (915, '1', '2022-11-12 12:55:15', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (916, '1', '2022-11-12 12:55:16', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (917, '1', '2022-11-12 12:55:18', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (918, '1', '2022-11-12 12:56:30', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (919, '1', '2022-11-12 12:56:38', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (920, '1', '2022-11-12 12:56:49', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (921, '1', '2022-11-12 12:56:49', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (922, '1', '2022-11-12 12:56:55', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (923, '1', '2022-11-12 12:58:49', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (924, '1', '2022-11-12 12:58:55', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (925, '1', '2022-11-12 12:58:55', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (926, '1', '2022-11-12 12:58:57', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (927, '1', '2022-11-12 12:59:06', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (928, '1', '2022-11-12 12:59:47', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (929, '1', '2022-11-12 12:59:59', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (930, '游客', '2022-11-12 13:01:05', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (931, '游客', '2022-11-12 13:01:14', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (932, '1', '2022-11-12 13:01:14', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (933, '1', '2022-11-12 13:01:16', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (934, '1', '2022-11-12 13:01:25', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (935, '1', '2022-11-12 13:01:26', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (936, '1', '2022-11-12 13:01:26', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (937, '1', '2022-11-12 13:01:26', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (938, '1', '2022-11-12 13:01:26', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (939, '1', '2022-11-12 13:01:27', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (940, '1', '2022-11-12 13:01:28', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (941, '1', '2022-11-12 13:01:28', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (942, '1', '2022-11-12 13:01:28', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (943, '1', '2022-11-12 13:01:28', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (944, '1', '2022-11-12 13:01:28', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (945, '1', '2022-11-12 13:01:28', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (946, '1', '2022-11-12 13:01:29', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (947, '1', '2022-11-12 13:01:29', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (948, '1', '2022-11-12 13:01:29', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (949, '1', '2022-11-12 13:01:29', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (950, '1', '2022-11-12 13:01:33', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (951, '游客', '2022-11-12 13:04:20', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (952, '游客', '2022-11-12 13:04:36', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (953, '1', '2022-11-12 13:04:36', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (954, '1', '2022-11-12 13:04:38', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (955, '1', '2022-11-12 13:05:36', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (956, '1', '2022-11-12 13:06:08', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (957, '1', '2022-11-12 13:07:47', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (958, '1', '2022-11-12 13:09:05', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (959, '1', '2022-11-12 13:10:02', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (960, '1', '2022-11-12 13:10:03', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (961, '1', '2022-11-12 13:14:07', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (962, '1', '2022-11-12 13:14:28', '127.0.0.1', '/JPetStore_war_exploded/User/updateReceiver', 'Update', '修改收件人信息', 'true');
INSERT INTO `userlogs` VALUES (963, '1', '2022-11-12 13:14:29', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (964, '1', '2022-11-12 13:14:32', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (965, '1', '2022-11-12 13:14:33', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (966, '1', '2022-11-12 13:14:33', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (967, '游客', '2022-11-12 13:14:58', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (968, '游客', '2022-11-12 13:15:09', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (969, '1', '2022-11-12 13:15:09', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (970, '1', '2022-11-12 13:15:12', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (971, '1', '2022-11-12 13:15:16', '127.0.0.1', '/JPetStore_war_exploded/User/updateReceiver', 'Update', '修改收件人信息', 'true');
INSERT INTO `userlogs` VALUES (972, '1', '2022-11-12 13:15:16', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (973, '1', '2022-11-12 13:17:10', '127.0.0.1', '/JPetStore_war_exploded/User/updateReceiver', 'Update', '修改收件人信息', 'true');
INSERT INTO `userlogs` VALUES (974, '1', '2022-11-12 13:17:10', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (975, '游客', '2022-11-12 13:17:23', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (976, '游客', '2022-11-12 13:17:32', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (977, '1', '2022-11-12 13:17:32', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (978, '1', '2022-11-12 13:17:34', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (979, '1', '2022-11-12 13:18:08', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (980, '1', '2022-11-12 13:18:12', '127.0.0.1', '/JPetStore_war_exploded/User/updateReceiver', 'Update', '修改收件人信息', 'true');
INSERT INTO `userlogs` VALUES (981, '1', '2022-11-12 13:18:12', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (982, '1', '2022-11-12 13:18:14', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (983, '游客', '2022-11-12 13:18:25', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (984, '游客', '2022-11-12 13:18:32', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (985, '1', '2022-11-12 13:18:33', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (986, '1', '2022-11-12 13:18:35', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (987, '1', '2022-11-12 13:18:39', '127.0.0.1', '/JPetStore_war_exploded/User/updateReceiver', 'Update', '修改收件人信息', 'true');
INSERT INTO `userlogs` VALUES (988, '1', '2022-11-12 13:18:39', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (989, '1', '2022-11-12 13:18:44', '127.0.0.1', '/JPetStore_war_exploded/User/updateReceiver', 'Update', '修改收件人信息', 'true');
INSERT INTO `userlogs` VALUES (990, '1', '2022-11-12 13:18:44', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (991, '1', '2022-11-12 13:18:49', '127.0.0.1', '/JPetStore_war_exploded/User/updateReceiver', 'Update', '修改收件人信息', 'true');
INSERT INTO `userlogs` VALUES (992, '1', '2022-11-12 13:18:49', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (993, '1', '2022-11-12 13:19:21', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (994, '1', '2022-11-12 13:19:22', '127.0.0.1', '/JPetStore_war_exploded/Pet/petList', 'Read', '查看宠物列表,category=fish', 'true');
INSERT INTO `userlogs` VALUES (995, '1', '2022-11-12 13:19:24', '127.0.0.1', '/JPetStore_war_exploded/Pet/petProduct', 'Read', '查看宠物详情,productID=FI-FW-02', 'true');
INSERT INTO `userlogs` VALUES (996, '1', '2022-11-12 13:19:45', '127.0.0.1', '/JPetStore_war_exploded/Cart/addCartItem', 'Create', '加入购物车,itemID=EST-21', 'true');
INSERT INTO `userlogs` VALUES (997, '1', '2022-11-12 13:19:45', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (998, '1', '2022-11-12 13:19:48', '127.0.0.1', '/JPetStore_war_exploded/Pet/petList', 'Read', '查看宠物列表,category=dogs', 'true');
INSERT INTO `userlogs` VALUES (999, '1', '2022-11-12 13:19:49', '127.0.0.1', '/JPetStore_war_exploded/Pet/petProduct', 'Read', '查看宠物详情,productID=K9-RT-02', 'true');
INSERT INTO `userlogs` VALUES (1000, '1', '2022-11-12 13:19:53', '127.0.0.1', '/JPetStore_war_exploded/Cart/addCartItem', 'Create', '加入购物车,itemID=EST-22', 'true');
INSERT INTO `userlogs` VALUES (1001, '1', '2022-11-12 13:19:53', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1002, '1', '2022-11-12 13:19:56', '127.0.0.1', '/JPetStore_war_exploded/Cart/updateCart', 'Update', '修改购物车商品数量', 'true');
INSERT INTO `userlogs` VALUES (1003, '1', '2022-11-12 13:19:57', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1004, '1', '2022-11-12 13:19:59', '127.0.0.1', '/JPetStore_war_exploded/Cart/removeCartItem', 'Delete', '移出购物车，itemID=EST-21', 'true');
INSERT INTO `userlogs` VALUES (1005, '1', '2022-11-12 13:19:59', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1006, '1', '2022-11-12 13:20:00', '127.0.0.1', '/JPetStore_war_exploded/Cart/removeCartItem', 'Delete', '清空购物车', 'true');
INSERT INTO `userlogs` VALUES (1007, '1', '2022-11-12 13:20:00', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1008, '1', '2022-11-12 13:20:01', '127.0.0.1', '/JPetStore_war_exploded/Pet/petList', 'Read', '查看宠物列表,category=reptiles', 'true');
INSERT INTO `userlogs` VALUES (1009, '1', '2022-11-12 13:20:02', '127.0.0.1', '/JPetStore_war_exploded/Pet/petProduct', 'Read', '查看宠物详情,productID=RP-LI-02', 'true');
INSERT INTO `userlogs` VALUES (1010, '1', '2022-11-12 13:20:03', '127.0.0.1', '/JPetStore_war_exploded/Cart/addCartItem', 'Create', '加入购物车,itemID=EST-13', 'true');
INSERT INTO `userlogs` VALUES (1011, '1', '2022-11-12 13:20:03', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1012, '1', '2022-11-12 13:20:05', '127.0.0.1', '/JPetStore_war_exploded/Order/orderSubmit', 'Read', '查询收件人信息，生成订单', 'true');
INSERT INTO `userlogs` VALUES (1013, '1', '2022-11-12 13:23:26', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1014, '1', '2022-11-12 13:23:32', '127.0.0.1', '/JPetStore_war_exploded/Pet//petProduct', 'Read', '查看宠物详情,productID=RP-LI-02', 'true');
INSERT INTO `userlogs` VALUES (1015, '1', '2022-11-12 13:24:16', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1016, '1', '2022-11-12 13:24:21', '127.0.0.1', '/JPetStore_war_exploded/Cart/updateCart', 'Update', '修改购物车商品数量', 'true');
INSERT INTO `userlogs` VALUES (1017, '1', '2022-11-12 13:24:21', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1018, '1', '2022-11-12 13:24:22', '127.0.0.1', '/JPetStore_war_exploded/Order/orderSubmit', 'Read', '查询收件人信息，生成订单', 'true');
INSERT INTO `userlogs` VALUES (1019, '1', '2022-11-12 13:24:35', '127.0.0.1', '/JPetStore_war_exploded/Order/orderPay', 'Other', '跳往支付页面', 'true');
INSERT INTO `userlogs` VALUES (1020, '1', '2022-11-12 13:24:47', '127.0.0.1', '/JPetStore_war_exploded/Order/orderPay', 'Other', '跳往支付页面', 'true');
INSERT INTO `userlogs` VALUES (1021, '1', '2022-11-12 13:26:28', '127.0.0.1', '/JPetStore_war_exploded/Order/orderPay', 'Other', '跳往支付页面', 'true');
INSERT INTO `userlogs` VALUES (1022, '1', '2022-11-12 13:26:30', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (1023, '1', '2022-11-12 13:26:32', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1024, '1', '2022-11-12 13:26:33', '127.0.0.1', '/JPetStore_war_exploded/Order/orderSubmit', 'Read', '查询收件人信息，生成订单', 'true');
INSERT INTO `userlogs` VALUES (1025, '1', '2022-11-12 13:26:41', '127.0.0.1', '/JPetStore_war_exploded/Order/orderPay', 'Other', '跳往支付页面', 'true');
INSERT INTO `userlogs` VALUES (1026, '游客', '2022-11-12 13:27:37', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (1027, '游客', '2022-11-12 13:27:45', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (1028, '1', '2022-11-12 13:27:46', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (1029, '1', '2022-11-12 13:27:49', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1030, '1', '2022-11-12 13:27:51', '127.0.0.1', '/JPetStore_war_exploded/Order/orderSubmit', 'Read', '查询收件人信息，生成订单', 'true');
INSERT INTO `userlogs` VALUES (1031, '1', '2022-11-12 13:27:52', '127.0.0.1', '/JPetStore_war_exploded/Order/orderPay', 'Other', '跳往支付页面', 'true');
INSERT INTO `userlogs` VALUES (1032, '1', '2022-11-12 13:27:54', '127.0.0.1', '/JPetStore_war_exploded/Order/orderSubmit', 'Read', '查询收件人信息，生成订单', 'true');
INSERT INTO `userlogs` VALUES (1033, '1', '2022-11-12 13:27:56', '127.0.0.1', '/JPetStore_war_exploded/Order/orderPay', 'Other', '跳往支付页面', 'true');
INSERT INTO `userlogs` VALUES (1034, '1', '2022-11-12 13:27:58', '127.0.0.1', '/JPetStore_war_exploded/Order/orderSubmit', 'Read', '查询收件人信息，生成订单', 'true');
INSERT INTO `userlogs` VALUES (1035, '1', '2022-11-12 13:28:00', '127.0.0.1', '/JPetStore_war_exploded/Order/orderPay', 'Other', '跳往支付页面', 'true');
INSERT INTO `userlogs` VALUES (1036, '游客', '2022-11-12 13:29:02', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (1037, '游客', '2022-11-12 13:29:10', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '登录,username=1', 'true');
INSERT INTO `userlogs` VALUES (1038, '1', '2022-11-12 13:29:10', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (1039, '1', '2022-11-12 13:29:13', '127.0.0.1', '/JPetStore_war_exploded/Pet/petList', 'Read', '查看宠物列表,category=dogs', 'true');
INSERT INTO `userlogs` VALUES (1040, '1', '2022-11-12 13:29:14', '127.0.0.1', '/JPetStore_war_exploded/Pet/petProduct', 'Read', '查看宠物详情,productID=K9-RT-01', 'true');
INSERT INTO `userlogs` VALUES (1041, '1', '2022-11-12 13:29:15', '127.0.0.1', '/JPetStore_war_exploded/Cart/addCartItem', 'Create', '加入购物车,itemID=EST-28', 'true');
INSERT INTO `userlogs` VALUES (1042, '1', '2022-11-12 13:29:15', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1043, '1', '2022-11-12 13:29:19', '127.0.0.1', '/JPetStore_war_exploded/Cart/removeCartItem', 'Delete', '移出购物车，itemID=EST-13', 'true');
INSERT INTO `userlogs` VALUES (1044, '1', '2022-11-12 13:29:19', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1045, '1', '2022-11-12 13:29:20', '127.0.0.1', '/JPetStore_war_exploded/Cart/removeCartItem', 'Delete', '清空购物车', 'true');
INSERT INTO `userlogs` VALUES (1046, '1', '2022-11-12 13:29:20', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1047, '1', '2022-11-12 13:29:22', '127.0.0.1', '/JPetStore_war_exploded/Pet/petList', 'Read', '查看宠物列表,category=cats', 'true');
INSERT INTO `userlogs` VALUES (1048, '1', '2022-11-12 13:29:22', '127.0.0.1', '/JPetStore_war_exploded/Pet/petProduct', 'Read', '查看宠物详情,productID=FL-DSH-01', 'true');
INSERT INTO `userlogs` VALUES (1049, '1', '2022-11-12 13:29:23', '127.0.0.1', '/JPetStore_war_exploded/Cart/addCartItem', 'Create', '加入购物车,itemID=EST-14', 'true');
INSERT INTO `userlogs` VALUES (1050, '1', '2022-11-12 13:29:23', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1051, '1', '2022-11-12 13:29:28', '127.0.0.1', '/JPetStore_war_exploded/Order/orderSubmit', 'Read', '查询收件人信息，生成订单', 'true');
INSERT INTO `userlogs` VALUES (1052, '1', '2022-11-12 13:29:31', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1053, '1', '2022-11-12 13:29:33', '127.0.0.1', '/JPetStore_war_exploded/Cart/updateCart', 'Update', '修改购物车商品数量', 'true');
INSERT INTO `userlogs` VALUES (1054, '1', '2022-11-12 13:29:34', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1055, '1', '2022-11-12 13:29:34', '127.0.0.1', '/JPetStore_war_exploded/Order/orderSubmit', 'Read', '查询收件人信息，生成订单', 'true');
INSERT INTO `userlogs` VALUES (1056, '1', '2022-11-12 13:29:38', '127.0.0.1', '/JPetStore_war_exploded/Order/orderPay', 'Other', '跳往支付页面', 'true');
INSERT INTO `userlogs` VALUES (1057, '1', '2022-11-12 13:29:41', '127.0.0.1', '/JPetStore_war_exploded/Order/newOrder', 'Create', '清空购物车,提交订单,orderID=202211121329411000', 'true');
INSERT INTO `userlogs` VALUES (1058, '1', '2022-11-12 13:29:41', '127.0.0.1', '/JPetStore_war_exploded/Order/orderItem', 'Read', '查看订单详情,orderID=202211121329411000', 'true');
INSERT INTO `userlogs` VALUES (1059, '1', '2022-11-12 13:29:56', '127.0.0.1', '/JPetStore_war_exploded/Order/orderList', 'Read', '查看订单列表', 'true');
INSERT INTO `userlogs` VALUES (1060, '1', '2022-11-12 13:29:57', '127.0.0.1', '/JPetStore_war_exploded/Order/orderItem', 'Read', '查看订单详情,orderID=202211121329411000', 'true');
INSERT INTO `userlogs` VALUES (1061, '1', '2022-11-12 13:30:00', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (1062, '1', '2022-11-12 13:30:06', '127.0.0.1', '/JPetStore_war_exploded/User/updateReceiver', 'Update', '修改收件人信息', 'true');
INSERT INTO `userlogs` VALUES (1063, '1', '2022-11-12 13:30:07', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (1064, '1', '2022-11-12 13:30:09', '127.0.0.1', '/JPetStore_war_exploded/User/updateReceiver', 'Update', '修改收件人信息', 'true');
INSERT INTO `userlogs` VALUES (1065, '1', '2022-11-12 13:30:10', '127.0.0.1', '/JPetStore_war_exploded/User/personalCenter', 'Read', '查看个人中心', 'true');
INSERT INTO `userlogs` VALUES (1066, '1', '2022-11-12 13:30:17', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=dogs', 'true');
INSERT INTO `userlogs` VALUES (1067, '1', '2022-11-12 13:30:18', '127.0.0.1', '/JPetStore_war_exploded/Pet/petProduct', 'Read', '查看宠物详情,productID=K9-PO-02', 'true');
INSERT INTO `userlogs` VALUES (1068, '1', '2022-11-12 13:30:20', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (1069, '1', '2022-11-12 13:30:26', '127.0.0.1', '/JPetStore_war_exploded/Pet/petList', 'Read', '查看宠物列表,category=birds', 'true');
INSERT INTO `userlogs` VALUES (1070, '1', '2022-11-12 13:30:27', '127.0.0.1', '/JPetStore_war_exploded/Pet/petProduct', 'Read', '查看宠物详情,productID=AV-CB-01', 'true');
INSERT INTO `userlogs` VALUES (1071, '1', '2022-11-12 13:30:33', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=EST-1', 'true');
INSERT INTO `userlogs` VALUES (1072, '1', '2022-11-12 13:30:37', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=EST-1', 'true');
INSERT INTO `userlogs` VALUES (1073, '1', '2022-11-12 13:30:46', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=EST-4', 'true');
INSERT INTO `userlogs` VALUES (1074, '1', '2022-11-12 13:30:54', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=EST-9', 'true');
INSERT INTO `userlogs` VALUES (1075, '1', '2022-11-12 13:31:01', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=EST-7', 'true');
INSERT INTO `userlogs` VALUES (1076, '1', '2022-11-12 13:31:07', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=EST-1', 'true');
INSERT INTO `userlogs` VALUES (1077, '1', '2022-11-12 13:31:10', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=EST-7', 'true');
INSERT INTO `userlogs` VALUES (1078, '1', '2022-11-12 13:31:17', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=EST-8', 'true');
INSERT INTO `userlogs` VALUES (1079, '1', '2022-11-12 13:31:26', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=EST-1', 'true');
INSERT INTO `userlogs` VALUES (1080, '1', '2022-11-12 13:31:37', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=dogs', 'true');
INSERT INTO `userlogs` VALUES (1081, '1', '2022-11-12 13:31:39', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=fish', 'true');
INSERT INTO `userlogs` VALUES (1082, '1', '2022-11-12 13:31:43', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=fish', 'true');
INSERT INTO `userlogs` VALUES (1083, '1', '2022-11-12 13:31:46', '127.0.0.1', '/JPetStore_war_exploded/Pet/searchPet', 'Read', '搜索宠物,keyword=EST-7', 'true');
INSERT INTO `userlogs` VALUES (1084, '1', '2022-11-12 13:31:48', '127.0.0.1', '/JPetStore_war_exploded/Pet/petList', 'Read', '查看宠物列表,category=fish', 'true');
INSERT INTO `userlogs` VALUES (1085, '1', '2022-11-12 13:31:49', '127.0.0.1', '/JPetStore_war_exploded/Pet/petProduct', 'Read', '查看宠物详情,productID=FI-FW-02', 'true');
INSERT INTO `userlogs` VALUES (1086, '1', '2022-11-12 13:31:51', '127.0.0.1', '/JPetStore_war_exploded/Cart/cartList', 'Read', '查看购物车', 'true');
INSERT INTO `userlogs` VALUES (1087, '1', '2022-11-12 13:31:53', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (1088, '1', '2022-11-12 13:31:59', '127.0.0.1', '/JPetStore_war_exploded/User/signOut', 'Other', '退出登录', 'true');
INSERT INTO `userlogs` VALUES (1089, '游客', '2022-11-12 13:31:59', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');
INSERT INTO `userlogs` VALUES (1090, '游客', '2022-11-12 13:32:01', '127.0.0.1', '/JPetStore_war_exploded/User/showRegister', 'Other', '跳往注册界面', 'true');
INSERT INTO `userlogs` VALUES (1091, '游客', '2022-11-12 13:32:04', '127.0.0.1', '/JPetStore_war_exploded/User/showLogin', 'Other', '跳往登录界面', 'true');
INSERT INTO `userlogs` VALUES (1092, '游客', '2022-11-12 13:32:12', '127.0.0.1', '/JPetStore_war_exploded/User/login', 'Read', '管理员查看用户日志root', 'true');
INSERT INTO `userlogs` VALUES (1093, 'root', '2022-11-12 13:32:27', '127.0.0.1', '/JPetStore_war_exploded/User/signOut', 'Other', '退出登录', 'true');
INSERT INTO `userlogs` VALUES (1094, '游客', '2022-11-12 13:32:27', '127.0.0.1', '/JPetStore_war_exploded/Pet/homePage', 'Other', '查看首页', 'true');

SET FOREIGN_KEY_CHECKS = 1;
