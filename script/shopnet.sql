/*
 Navicat MySQL Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : shopnet

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 12/05/2024 16:24:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人',
  `phone_num` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '市',
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区/县',
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '街道/乡镇',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `postcode` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮编',
  `label` enum('HOME','COMPANY','SCHOOL') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默认（0-普通，1-默认）',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除（0-正常，1-删除）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_address
-- ----------------------------

-- ----------------------------
-- Table structure for tb_apply
-- ----------------------------
DROP TABLE IF EXISTS `tb_apply`;
CREATE TABLE `tb_apply`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '申请（加好友，加群）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_apply
-- ----------------------------

-- ----------------------------
-- Table structure for tb_bag
-- ----------------------------
DROP TABLE IF EXISTS `tb_bag`;
CREATE TABLE `tb_bag`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '背包（头像框，改名卡等）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bag
-- ----------------------------

-- ----------------------------
-- Table structure for tb_brand
-- ----------------------------
DROP TABLE IF EXISTS `tb_brand`;
CREATE TABLE `tb_brand`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `brand_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商标',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司',
  `about_us` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint UNSIGNED NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` bigint UNSIGNED NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '品牌' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_brand
-- ----------------------------

-- ----------------------------
-- Table structure for tb_carousel
-- ----------------------------
DROP TABLE IF EXISTS `tb_carousel`;
CREATE TABLE `tb_carousel`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `spec_id` bigint UNSIGNED NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址（去除OSS域名前缀的URL）',
  `sort` tinyint UNSIGNED NOT NULL COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '上传时间',
  `create_by` bigint UNSIGNED NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `update_by` bigint UNSIGNED NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_carousel
-- ----------------------------

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '金额',
  `count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_cart
-- ----------------------------

-- ----------------------------
-- Table structure for tb_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart_item`;
CREATE TABLE `tb_cart_item`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` bigint UNSIGNED NOT NULL,
  `sku_id` bigint UNSIGNED NOT NULL,
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '价格（加入购物车时的单价）',
  `count` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '数量',
  `is_checked` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否选中（0-正常，1-选中）',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除（0-正常，1-删除）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_cart_item
-- ----------------------------

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint UNSIGNED NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `level` tinyint UNSIGNED NOT NULL COMMENT '层级？？？',
  `sort` tinyint UNSIGNED NOT NULL COMMENT '排序',
  `is_visible` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可见（0-否，1-是）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint UNSIGNED NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` bigint UNSIGNED NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_category
-- ----------------------------

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论（动态评论）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_contact
-- ----------------------------
DROP TABLE IF EXISTS `tb_contact`;
CREATE TABLE `tb_contact`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '联系人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_contact
-- ----------------------------

-- ----------------------------
-- Table structure for tb_coupon
-- ----------------------------
DROP TABLE IF EXISTS `tb_coupon`;
CREATE TABLE `tb_coupon`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for tb_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `tb_dynamic`;
CREATE TABLE `tb_dynamic`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '动态（穿搭分享）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for tb_follow
-- ----------------------------
DROP TABLE IF EXISTS `tb_follow`;
CREATE TABLE `tb_follow`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关注' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_follow
-- ----------------------------

-- ----------------------------
-- Table structure for tb_follower
-- ----------------------------
DROP TABLE IF EXISTS `tb_follower`;
CREATE TABLE `tb_follower`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '粉丝' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_follower
-- ----------------------------

-- ----------------------------
-- Table structure for tb_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_group`;
CREATE TABLE `tb_group`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '群组（多聊）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_group
-- ----------------------------

-- ----------------------------
-- Table structure for tb_group_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_group_user`;
CREATE TABLE `tb_group_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '群成员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_group_user
-- ----------------------------

-- ----------------------------
-- Table structure for tb_inbox
-- ----------------------------
DROP TABLE IF EXISTS `tb_inbox`;
CREATE TABLE `tb_inbox`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收信箱' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_inbox
-- ----------------------------

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_message
-- ----------------------------

-- ----------------------------
-- Table structure for tb_payment
-- ----------------------------
DROP TABLE IF EXISTS `tb_payment`;
CREATE TABLE `tb_payment`  (
  `id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_payment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_person
-- ----------------------------
DROP TABLE IF EXISTS `tb_person`;
CREATE TABLE `tb_person`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '私信（单聊）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_person
-- ----------------------------

-- ----------------------------
-- Table structure for tb_review
-- ----------------------------
DROP TABLE IF EXISTS `tb_review`;
CREATE TABLE `tb_review`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL COMMENT '商品Id',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评价（商品评价）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_review
-- ----------------------------

-- ----------------------------
-- Table structure for tb_room
-- ----------------------------
DROP TABLE IF EXISTS `tb_room`;
CREATE TABLE `tb_room`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房间（聊天会话）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_room
-- ----------------------------

-- ----------------------------
-- Table structure for tb_service
-- ----------------------------
DROP TABLE IF EXISTS `tb_service`;
CREATE TABLE `tb_service`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客服（人工客服，AI客服）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_service
-- ----------------------------

-- ----------------------------
-- Table structure for tb_sku
-- ----------------------------
DROP TABLE IF EXISTS `tb_sku`;
CREATE TABLE `tb_sku`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `spu_id` bigint UNSIGNED NOT NULL,
  `spec_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格组合（使用逗号分隔）',
  `main_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主图',
  `market_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '市场价',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '零售价',
  `stock_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存',
  `is_primary` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否主要（0-否，1-是）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint UNSIGNED NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `update_by` bigint UNSIGNED NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '最小库存单位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sku
-- ----------------------------

-- ----------------------------
-- Table structure for tb_spec
-- ----------------------------
DROP TABLE IF EXISTS `tb_spec`;
CREATE TABLE `tb_spec`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `spu_id` bigint UNSIGNED NOT NULL,
  `label_id` bigint UNSIGNED NOT NULL COMMENT '属性名',
  `value_id` bigint UNSIGNED NOT NULL COMMENT '属性值',
  `mode` tinyint UNSIGNED NOT NULL COMMENT '模式（1-文字，2-图片，3图文）',
  `is_primary` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '是否主要（0-否，1-是）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint UNSIGNED NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `update_by` bigint UNSIGNED NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规格（商品的规格名+规格值）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_spec
-- ----------------------------
INSERT INTO `tb_spec` VALUES (1, 10254, 1001, 2001, 0, NULL, '2024-04-12 19:28:33', 1, '2024-04-12 19:28:36', 1);
INSERT INTO `tb_spec` VALUES (2, 10254, 1001, 2002, 0, NULL, '2024-04-12 19:28:57', 1, '2024-04-12 19:29:02', 1);
INSERT INTO `tb_spec` VALUES (3, 10254, 1002, 2003, 0, NULL, '2024-04-12 19:29:33', 1, '2024-04-12 19:29:36', 1);
INSERT INTO `tb_spec` VALUES (4, 10254, 1002, 2004, 0, NULL, '2024-04-12 19:29:43', 1, '2024-04-12 19:29:47', 1);
INSERT INTO `tb_spec` VALUES (5, 10254, 1002, 2005, 0, NULL, '2024-04-12 19:30:09', 1, '2024-04-12 19:30:12', 1);

-- ----------------------------
-- Table structure for tb_spec_label
-- ----------------------------
DROP TABLE IF EXISTS `tb_spec_label`;
CREATE TABLE `tb_spec_label`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别（使用逗号分隔多个类别）',
  `label_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性名',
  `sort` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint UNSIGNED NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` bigint UNSIGNED NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规格名（如：颜色）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_spec_label
-- ----------------------------
INSERT INTO `tb_spec_label` VALUES (1001, '1', '颜色', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_label` VALUES (1002, '1', '尺码', 2, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);

-- ----------------------------
-- Table structure for tb_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `tb_spec_value`;
CREATE TABLE `tb_spec_value`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `label_id` bigint UNSIGNED NOT NULL,
  `value_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性值',
  `sort` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint UNSIGNED NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_by` bigint UNSIGNED NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规格值（如：白色）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_spec_value
-- ----------------------------
INSERT INTO `tb_spec_value` VALUES (1, 1001, '黑色', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (2, 1001, '白色', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (3, 1001, '灰色', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (4, 1001, '蓝色', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (5, 1001, '粉色', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (6, 1002, '紫色', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (7, 1002, '', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (8, 1002, 'L', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (9, 1002, 'XL', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (10, 1002, '2XL', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (11, 1002, '3XL', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);
INSERT INTO `tb_spec_value` VALUES (12, 1002, '4XL', 1, '2024-01-01 00:00:00', 1, '2024-01-01 00:00:00', 1);

-- ----------------------------
-- Table structure for tb_spu
-- ----------------------------
DROP TABLE IF EXISTS `tb_spu`;
CREATE TABLE `tb_spu`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED NOT NULL COMMENT '类别',
  `brand_id` bigint UNSIGNED NOT NULL COMMENT '品牌',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `rich_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情',
  `sale_volume` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '付款人数',
  `want_volume` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '想要人数',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否下架（0-正常，1-下架）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint UNSIGNED NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `update_by` bigint UNSIGNED NOT NULL COMMENT '修改人',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '？？？',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '？？？',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标准产品单元' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_spu
-- ----------------------------
INSERT INTO `tb_spu` VALUES (10001, 1, 1, 'Apple Watch Series 8 大陆国行 铝金属表壳 智能手表', NULL, NULL, 0, 0, 0, '2024-04-10 18:47:52', 1, '2024-04-10 18:48:01', 1, NULL, NULL);
INSERT INTO `tb_spu` VALUES (10002, 1, 1, 'Apple Watch Series 8 大陆国行 不锈钢表壳 智能手表', NULL, NULL, 0, 0, 0, '2024-04-10 18:51:00', 1, '2024-04-10 18:51:06', 1, NULL, NULL);

-- ----------------------------
-- Table structure for tb_suggest
-- ----------------------------
DROP TABLE IF EXISTS `tb_suggest`;
CREATE TABLE `tb_suggest`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型（0-商品，1-品牌，2-类别）',
  `target_id` bigint UNSIGNED NOT NULL COMMENT '商品Id，品牌Id，类别Id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提示文本',
  `search_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提示（商品搜索提示）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_suggest
-- ----------------------------

-- ----------------------------
-- Table structure for tb_trade
-- ----------------------------
DROP TABLE IF EXISTS `tb_trade`;
CREATE TABLE `tb_trade`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `trade_no` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '金额',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `extra_info` json NULL COMMENT '额外信息',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除（0-否，1-是）',
  `create_time` datetime NOT NULL COMMENT '下单时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_trade
-- ----------------------------

-- ----------------------------
-- Table structure for tb_trade_addr
-- ----------------------------
DROP TABLE IF EXISTS `tb_trade_addr`;
CREATE TABLE `tb_trade_addr`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人',
  `phone_num` int NOT NULL COMMENT '手机号',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '市',
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区',
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '街道/乡镇',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_trade_addr
-- ----------------------------

-- ----------------------------
-- Table structure for tb_trade_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_trade_item`;
CREATE TABLE `tb_trade_item`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `spu_id` bigint UNSIGNED NOT NULL,
  `sku_id` bigint UNSIGNED NOT NULL,
  `buy_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_trade_item
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `user_sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景',
  `gender` enum('SECRET','MALE','FEMALE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校',
  `ip_info` json NULL COMMENT 'IP信息',
  `is_locked` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否锁定（0-正常，1-锁定）',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否注销（0-正常，1-注销）',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `active_status` int NULL DEFAULT NULL COMMENT '？？？',
  `last_opt_time` datetime NULL DEFAULT NULL COMMENT '？？？',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
