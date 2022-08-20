/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : localhost:3306
 Source Schema         : fmmall2

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 12/05/2021 23:16:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 分类id主键',
  `category_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称 分类名称',
  `category_level` int(11) NOT NULL COMMENT '分类层级 分类得类型，\n1:一级大分类\n2:二级分类\n3:三级小分类',
  `parent_id` int(11) NOT NULL COMMENT '父层级id 父id 上一级依赖的id，1级分类则为0，二级三级分别依赖上一级',
  `category_icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标 logo',
  `category_slogan` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '口号',
  `category_pic` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图',
  `category_bg_color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景颜色',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '点心/蛋糕', 1, 0, 'cake.png', '每一道甜品都有一个故事', 'act1.png', 'black');
INSERT INTO `category` VALUES (2, '饼干/膨化', 1, 0, 'cookies.png', '健康饮食远离我', 'act2.png', 'black');
INSERT INTO `category` VALUES (3, '熟食/肉类', 1, 0, 'meat.png', 'nice！nice！nice！', 'act3.png', 'black');
INSERT INTO `category` VALUES (4, '素食/卤味', 1, 0, 'bamboo.png', NULL, 'act1.png', 'black');
INSERT INTO `category` VALUES (5, '坚果/炒货', 1, 0, 'nut.png', '酥酥脆脆，回味无穷', 'act2.png', 'black');
INSERT INTO `category` VALUES (6, '糖果/蜜饯', 1, 0, 'candy.png', NULL, 'act3.png', 'black');
INSERT INTO `category` VALUES (7, '巧克力', 1, 0, 'chocolate.png', NULL, 'act1.png', 'black');
INSERT INTO `category` VALUES (8, '海味/河鲜', 1, 0, 'fish.png', NULL, 'act2.png', 'black');
INSERT INTO `category` VALUES (9, '花茶/果茶', 1, 0, 'tea.png', '健康快乐每一天', 'act3.png', 'black');
INSERT INTO `category` VALUES (10, '品牌/礼包', 1, 0, 'package.png', '每日一个小惊喜', 'act1.png', 'black');
INSERT INTO `category` VALUES (11, '蛋糕', 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (12, '点心', 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (13, '饼干', 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (14, '薯片', 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (15, '虾条', 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (16, '猪肉脯', 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (17, '牛肉丝', 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (18, '小香肠', 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (19, '豆干', 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (20, '干笋', 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (21, '鸭脖', 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (22, '坚果', 2, 5, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (23, '锅巴', 2, 5, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (24, '糖果', 2, 6, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (25, '蜜饯', 2, 6, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (26, '巧克力', 2, 7, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (27, '果冻', 2, 7, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (28, '海带丝', 2, 8, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (29, '小鱼干', 2, 8, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (30, '鱿鱼丝', 2, 8, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (31, '花茶', 2, 9, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (32, '果茶', 2, 9, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (33, '品牌套餐', 2, 10, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (34, '活动礼包', 2, 10, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (35, '蒸蛋糕', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (36, '脱水蛋糕', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (37, '瑞士卷', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (38, '软面包', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (39, '马卡龙', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (40, '千层饼', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (41, '甜甜圈', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (42, '蒸三明治', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (43, '铜锣烧', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (44, '华夫饼', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (45, '老婆饼', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (46, '奥利奥', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (47, '粤利粤', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (49, '膨化虾条', 3, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (50, '油炸虾条', 3, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (51, '海鲜虾条', 3, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (52, '饮料', 1, 0, 'drinks.png', NULL, NULL, NULL);
INSERT INTO `category` VALUES (53, '方便面', 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (54, '调味品', 1, 0, 'condiment.png', NULL, NULL, NULL);
INSERT INTO `category` VALUES (55, '酱油', 2, 54, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (56, '矿泉水', 2, 52, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (57, '康师傅方便面', 3, 53, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (58, '海天酱油', 3, 55, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (59, '农夫山泉', 3, 56, NULL, NULL, NULL, NULL);


-- ----------------------------
-- Table structure for index_img
-- ----------------------------
DROP TABLE IF EXISTS `index_img`;
CREATE TABLE `index_img`  (
  `img_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片 图片地址',
  `img_bg_color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景色 背景颜色',
  `prod_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id 商品id',
  `category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类id 商品分类id',
  `index_type` int(11) NOT NULL COMMENT '轮播图类型 轮播图类型，用于判断，可以根据商品id或者分类进行页面跳转，1：商品 2：分类',
  `seq` int(11) NOT NULL COMMENT '轮播图展示顺序 轮播图展示顺序，从小到大',
  `status` int(11) NOT NULL COMMENT '是否展示:1表示正常显示，0表示下线 是否展示，1：展示    0：不展示',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间 创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间 更新',
  PRIMARY KEY (`img_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '轮播图 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of index_img
-- ----------------------------
INSERT INTO `index_img` VALUES ('1', 'ad1.jpg', 'green', '101', NULL, 1, 1, 1, '2021-04-14 17:21:13', '2021-04-14 17:21:18');
INSERT INTO `index_img` VALUES ('2', 'ad2.jpg', 'pink', NULL, '1', 2, 2, 1, '2021-04-14 17:21:49', '2021-04-14 17:21:52');
INSERT INTO `index_img` VALUES ('3', 'ad3.jpg', 'black', '103', NULL, 1, 3, 1, '2021-04-14 17:22:23', '2021-04-14 17:22:27');
INSERT INTO `index_img` VALUES ('4', 'ad4.jpg', 'orange', NULL, '2', 2, 4, 1, '2021-04-14 17:23:06', '2021-04-14 17:23:08');
INSERT INTO `index_img` VALUES ('5', 'ad5.jpg', 'yellow', '101', NULL, 1, 2, 0, '2021-04-24 09:34:01', '2021-04-25 09:34:05');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `item_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单项ID',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID',
  `product_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `product_img` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `sku_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'skuID',
  `sku_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku名称',
  `product_price` decimal(32, 8) NOT NULL COMMENT '商品价格',
  `buy_counts` int(11) NOT NULL COMMENT '购买数量',
  `total_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '商品总金额',
  `basket_date` datetime(0) NULL DEFAULT NULL COMMENT '加入购物车时间',
  `buy_time` datetime(0) NULL DEFAULT NULL COMMENT '购买时间',
  `is_comment` int(11) NULL DEFAULT NULL COMMENT '评论状态： 0 未评价  1 已评价',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单项/快照 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('162035224946053220', 'd1dd179a0d194351b7bfa658f3d86579', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 1, 8.00000000, '2021-05-07 09:50:49', '2021-05-07 09:50:49', 0);
INSERT INTO `order_item` VALUES ('162035224946331626', 'd1dd179a0d194351b7bfa658f3d86579', '3', '咪咪虾条', 'mmxt_1.png', '2', '咪咪虾条 6连包', 5.00000000, 1, 5.00000000, '2021-05-07 09:50:49', '2021-05-07 09:50:49', 0);
INSERT INTO `order_item` VALUES ('162035239193969518', 'f67b950e78ae45ee8bae922e8dab6ddc', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 1, 8.00000000, '2021-05-07 09:53:12', '2021-05-07 09:53:12', 0);
INSERT INTO `order_item` VALUES ('162035239194391040', 'f67b950e78ae45ee8bae922e8dab6ddc', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 09:53:12', '2021-05-07 09:53:12', 0);
INSERT INTO `order_item` VALUES ('162035244829784296', '1384c48a7ac846919dd8ca67209ff3eb', '3', '咪咪虾条', 'mmxt_1.png', '3', '咪咪虾条 整箱50包', 40.00000000, 1, 40.00000000, '2021-05-07 09:54:08', '2021-05-07 09:54:08', 0);
INSERT INTO `order_item` VALUES ('162035363560419828', '93b67b8122284b2fabd28c2e5d1c9914', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 2, 16.00000000, '2021-05-07 10:13:56', '2021-05-07 10:13:56', 0);
INSERT INTO `order_item` VALUES ('162035363560786072', '93b67b8122284b2fabd28c2e5d1c9914', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 2, 2.00000000, '2021-05-07 10:13:56', '2021-05-07 10:13:56', 0);
INSERT INTO `order_item` VALUES ('162035369543491781', '2edae7d9f94e42dd87841e3fb625976b', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 1, 8.00000000, '2021-05-07 10:14:55', '2021-05-07 10:14:55', 0);
INSERT INTO `order_item` VALUES ('162035393785519495', '71ac3b8e8d5e4b79a60cb5777b9a71b3', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 10:18:58', '2021-05-07 10:18:58', 0);
INSERT INTO `order_item` VALUES ('162035925277726911', 'f9743ec166de4e8f9bce8a2510b6cf54', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 11:47:33', '2021-05-07 11:47:33', 0);
INSERT INTO `order_item` VALUES ('162036003915252536', 'ca364a09c3b04cf881e0944ede34563b', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 1, 8.00000000, '2021-05-07 12:00:39', '2021-05-07 12:00:39', 0);
INSERT INTO `order_item` VALUES ('162036018493853367', '966b276ac926447295e66b077c607f27', '3', '咪咪虾条', 'mmxt_1.png', '2', '咪咪虾条 6连包', 5.00000000, 1, 5.00000000, '2021-05-07 12:03:05', '2021-05-07 12:03:05', 0);
INSERT INTO `order_item` VALUES ('162036062141658185', 'c2efcd6725174b7fa27829382fd89e6a', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 12:10:21', '2021-05-07 12:10:21', 0);
INSERT INTO `order_item` VALUES ('162036952987560822', '2133a588a8e0455ba063065cc5337610', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 14:38:50', '2021-05-07 14:38:50', 0);
INSERT INTO `order_item` VALUES ('162036975185215005', 'e7f3a0d3fccf40a88d05f7b1ca7e1700', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 1, 8.00000000, '2021-05-07 14:42:32', '2021-05-07 14:42:32', 0);
INSERT INTO `order_item` VALUES ('162037097271483830', 'e863aeb9da464367bf3b4c5f35d0a31a', '3', '咪咪虾条', 'mmxt_1.png', '2', '咪咪虾条 6连包', 5.00000000, 1, 5.00000000, '2021-05-07 15:02:53', '2021-05-07 15:02:53', 0);
INSERT INTO `order_item` VALUES ('162037120901316335', '5a718a72fe0945dda48a8d23cbf5ce0a', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 15:06:49', '2021-05-07 15:06:49', 0);
INSERT INTO `order_item` VALUES ('162037132177612607', '0ac64e4b59744e0a9576c9d18ef064bf', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 15:08:42', '2021-05-07 15:08:42', 0);
INSERT INTO `order_item` VALUES ('162037140215198256', '7fd895de83fa4de7a63f04c90b533bfa', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 1, 8.00000000, '2021-05-07 15:10:02', '2021-05-07 15:10:02', 0);
INSERT INTO `order_item` VALUES ('162037373127956965', '0b2dbc2ad85e4520974c9e42ce8472a5', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 15:48:51', '2021-05-07 15:48:51', 0);
INSERT INTO `order_item` VALUES ('162037376667659948', '952751f3426f4e47bf26a181a15548b2', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 15:49:27', '2021-05-07 15:49:27', 0);
INSERT INTO `order_item` VALUES ('162037384437627755', '3995d67937ba434aa2c0fc66bfd88cfe', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 15:50:44', '2021-05-07 15:50:44', 0);
INSERT INTO `order_item` VALUES ('162037389382996880', '35ec6155dd104a36bc621b31636b9184', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 1, 8.00000000, '2021-05-07 15:51:34', '2021-05-07 15:51:34', 0);
INSERT INTO `order_item` VALUES ('162037396115692154', 'a8a619e81d5042aaad1975da52ce6ee5', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 1, 8.00000000, '2021-05-07 15:52:41', '2021-05-07 15:52:41', 0);
INSERT INTO `order_item` VALUES ('162037456196979919', 'a5e54d2af3e347ddaa2efc0e31160ffa', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-07 16:02:42', '2021-05-07 16:02:42', 0);
INSERT INTO `order_item` VALUES ('162043632418153562', 'ea4e4918a7dc4ec3acfecaa7d5a2ae51', '3', '咪咪虾条', 'mmxt_1.png', '2', '咪咪虾条 6连包', 5.00000000, 2, 10.00000000, '2021-05-08 09:12:04', '2021-05-08 09:12:04', 0);
INSERT INTO `order_item` VALUES ('162044049434687767', 'fb6e252e26c94935b3ce8a7b7bb82ddd', '3', '咪咪虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-08 10:21:34', '2021-05-08 10:21:34', 0);
INSERT INTO `order_item` VALUES ('162045603664274927', 'f1d426615dc84e4abb37974ae25c1cd9', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 4, 32.00000000, '2021-05-08 14:40:37', '2021-05-08 14:40:37', 0);
INSERT INTO `order_item` VALUES ('162045622247254235', '456ab37f8ba04739b4cdf47afa4a2096', '1', '奥利奥小饼干', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 2, 16.00000000, '2021-05-08 14:43:42', '2021-05-08 14:43:42', 0);
INSERT INTO `order_item` VALUES ('162045622247324200', '456ab37f8ba04739b4cdf47afa4a2096', '3', '咪咪虾条', 'mmxt_1.png', '2', '咪咪虾条 6连包', 5.00000000, 2, 10.00000000, '2021-05-08 14:43:42', '2021-05-08 14:43:42', 0);
INSERT INTO `order_item` VALUES ('162046467128490816', '194591690fee43eda20b85f35d71a376', '3', '咪咪虾条', 'mmxt_1.png', '2', '咪咪虾条 6连包', 5.00000000, 2, 10.00000000, '2021-05-08 17:04:31', '2021-05-08 17:04:31', 0);
INSERT INTO `order_item` VALUES ('162046484862056903', 'dd4b131a6bcc46b1a7c266423ee04a29', '3', '咪咪虾条', 'mmxt_1.png', '2', '咪咪虾条 6连包', 5.00000000, 1, 5.00000000, '2021-05-08 17:07:29', '2021-05-08 17:07:29', 0);
INSERT INTO `order_item` VALUES ('162070057695451341', '0bdf74d7cb584011a205cb6255dc3810', '3', '咪咪小虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-11 10:36:17', '2021-05-11 10:36:17', 0);
INSERT INTO `order_item` VALUES ('162070062023433211', '1e6557bf82c04fd28032c1ca56a77a84', '1', '奥利奥小饼干666', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 2, 16.00000000, '2021-05-11 10:37:00', '2021-05-11 10:37:00', 0);
INSERT INTO `order_item` VALUES ('162070067082231040', 'b670af2c2779449cbe16ec5b021fdd25', '1', '奥利奥小饼干666', 'ala_1.png', '4', '奥利奥分享装', 8.00000000, 1, 8.00000000, '2021-05-11 10:37:51', '2021-05-11 10:37:51', 0);
INSERT INTO `order_item` VALUES ('162070067082334244', 'b670af2c2779449cbe16ec5b021fdd25', '3', '咪咪小虾条', 'mmxt_1.png', '1', '咪咪虾条 单包 50g', 1.00000000, 1, 1.00000000, '2021-05-11 10:37:51', '2021-05-11 10:37:51', 0);
-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID 同时也是订单编号',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `untitled` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称（多个产品用,隔开）',
  `receiver_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人快照',
  `receiver_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人手机号快照',
  `receiver_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址快照',
  `total_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '订单总价格',
  `actual_amount` int(11) NULL DEFAULT NULL COMMENT '实际支付总价格',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '支付方式 1:微信 2:支付宝',
  `order_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态 1:待付款 2:待发货 3:待收货 4:待评价 5:已完成 6:已关闭',
  `delivery_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送方式',
  `delivery_flow_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `order_freight` decimal(32, 8) NULL DEFAULT 0.00000000 COMMENT '订单运费 默认可以为零，代表包邮',
  `delete_status` int(11) NULL DEFAULT 0 COMMENT '逻辑删除状态 1: 删除 0:未删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间（成交时间）',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `flish_time` datetime(0) NULL DEFAULT NULL COMMENT '完成时间',
  `cancel_time` datetime(0) NULL DEFAULT NULL COMMENT '取消时间',
  `close_type` int(11) NULL DEFAULT NULL COMMENT '订单关闭类型1-超时未支付 2-退款关闭 4-买家取消 15-已通过货到付款交易',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0ac64e4b59744e0a9576c9d18ef064bf', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-07 15:08:42', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('0b2dbc2ad85e4520974c9e42ce8472a5', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-07 15:48:51', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('0bdf74d7cb584011a205cb6255dc3810', '6', '咪咪小虾条,', '韩梅梅', '13232323322', '湖南 长沙 岳麓区 淅沥淅沥', 1.00000000, 1, 1, '', '1', NULL, NULL, NULL, NULL, '2021-05-11 10:36:17', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('1384c48a7ac846919dd8ca67209ff3eb', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 40.00000000, 40, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-07 09:54:08', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('194591690fee43eda20b85f35d71a376', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 10.00000000, 10, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-08 17:04:31', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('1e6557bf82c04fd28032c1ca56a77a84', '6', '奥利奥小饼干666,', '韩梅梅', '13232323322', '湖南 长沙 岳麓区 淅沥淅沥', 16.00000000, 16, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-11 10:37:00', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('2133a588a8e0455ba063065cc5337610', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, NULL, '2021-05-07 14:38:50', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('2edae7d9f94e42dd87841e3fb625976b', '1', '奥利奥小饼干,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 8.00000000, 8, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-07 10:14:55', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('35ec6155dd104a36bc621b31636b9184', '1', '奥利奥小饼干,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 8.00000000, 8, 1, '', '4', NULL, NULL, NULL, NULL, '2021-05-07 15:51:34', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('3995d67937ba434aa2c0fc66bfd88cfe', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, NULL, '2021-05-07 15:50:44', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('456ab37f8ba04739b4cdf47afa4a2096', '1', '奥利奥小饼干,咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 26.00000000, 26, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-08 14:13:42', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('5a718a72fe0945dda48a8d23cbf5ce0a', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-07 15:06:49', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('71ac3b8e8d5e4b79a60cb5777b9a71b3', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, NULL, '2021-05-07 10:18:58', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('7fd895de83fa4de7a63f04c90b533bfa', '1', '奥利奥小饼干,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 8.00000000, 8, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-07 15:10:02', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('93b67b8122284b2fabd28c2e5d1c9914', '1', '奥利奥小饼干,咪咪虾条,', '小丽', '13131313311', '湖北 宜昌 夷陵区 巴拉巴拉', 18.00000000, 18, 1, '', '4', NULL, NULL, NULL, NULL, '2021-05-07 10:13:56', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('952751f3426f4e47bf26a181a15548b2', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-07 15:49:27', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('966b276ac926447295e66b077c607f27', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 5.00000000, 5, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-07 12:03:05', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('a5e54d2af3e347ddaa2efc0e31160ffa', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, NULL, '2021-05-07 16:02:42', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('a8a619e81d5042aaad1975da52ce6ee5', '1', '奥利奥小饼干,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 8.00000000, 8, 1, '', '4', NULL, NULL, NULL, NULL, '2021-05-07 15:52:41', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('b670af2c2779449cbe16ec5b021fdd25', '6', '奥利奥小饼干666,咪咪小虾条,', '韩梅梅', '13232323322', '湖南 长沙 岳麓区 淅沥淅沥', 9.00000000, 9, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-11 10:37:51', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('c2efcd6725174b7fa27829382fd89e6a', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-07 12:10:21', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('ca364a09c3b04cf881e0944ede34563b', '1', '奥利奥小饼干,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 8.00000000, 8, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-07 12:00:39', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('d1dd179a0d194351b7bfa658f3d86579', '1', '奥利奥小饼干,咪咪虾条,', '小丽', '13131313311', '湖北 宜昌 夷陵区 巴拉巴拉', 13.00000000, 13, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-07 09:50:49', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('dd4b131a6bcc46b1a7c266423ee04a29', '1', '咪咪虾条,', '小丽', '13131313311', '湖北 宜昌 夷陵区 巴拉巴拉', 5.00000000, 5, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-08 17:07:29', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('e7f3a0d3fccf40a88d05f7b1ca7e1700', '1', '奥利奥小饼干,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 8.00000000, 8, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-07 14:42:32', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('e863aeb9da464367bf3b4c5f35d0a31a', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 5.00000000, 5, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-07 15:02:53', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('ea4e4918a7dc4ec3acfecaa7d5a2ae51', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 10.00000000, 10, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-08 09:12:04', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('f1d426615dc84e4abb37974ae25c1cd9', '1', '奥利奥小饼干,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 32.00000000, 32, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-08 14:10:37', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('f67b950e78ae45ee8bae922e8dab6ddc', '1', '奥利奥小饼干,咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 9.00000000, 9, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-07 09:53:12', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('f9743ec166de4e8f9bce8a2510b6cf54', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '2', NULL, NULL, NULL, NULL, '2021-05-07 11:47:33', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('fb6e252e26c94935b3ce8a7b7bb82ddd', '1', '咪咪虾条,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, NULL, '2021-05-08 09:51:34', NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主键id',
  `product_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称 商品名称',
  `category_id` int(11) NOT NULL COMMENT '分类外键id 分类id',
  `root_category_id` int(11) NOT NULL COMMENT '一级分类外键id 一级分类id，用于优化查询',
  `sold_num` int(11) NOT NULL COMMENT '销量 累计销售',
  `product_status` int(11) NOT NULL COMMENT '默认是1，表示正常状态, -1表示删除, 0下架 默认是1，表示正常状态, -1表示删除, 0下架',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品内容 商品内容',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品 商品信息相关表：分类表，商品图片表，商品规格表，商品参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '奥利奥小饼干666', 46, 2, 196, 1, '<label style=\"color:red;font-size:18px\">1.全新包装</label><br/><img src=\"static/pimgs/ala_desc1.png\"/><br/><label style=\"color:green;font-size:18px\">2.全新口味</label><br/><img src=\"static/pimgs/ala_desc2.png\"/><label style=\"color:blue;font-size:18px\">3.全新体验</label><br/><img src=\"static/pimgs/ala_desc3.png\"/>', '2021-04-26 15:20:51', '2021-04-23 15:20:58');
INSERT INTO `product` VALUES ('10', '商品10', 10, 1, 127, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('11', '商品11', 10, 1, 128, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('12', '商品12', 46, 2, 122, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('13', '商品13', 46, 2, 123, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('14', '商品14', 46, 2, 124, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('15', '商品15', 46, 2, 125, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('16', '商品16', 46, 2, 126, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('17', '商品17', 46, 2, 127, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('18', '商品18', 46, 2, 128, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('19', '加力加小虾条1', 49, 2, 111, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('2', '旺旺华夫饼', 22, 1, 202, 1, '旺旺华夫饼商品内容', '2021-04-26 15:27:22', '2021-04-25 15:27:25');
INSERT INTO `product` VALUES ('20', '加力加虾条2', 49, 2, 199, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('21', '加力加虾条3', 49, 2, 168, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('22', '加力加虾条4', 49, 2, 168, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('23', '加力加虾条5', 49, 2, 168, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('24', '加力加虾条6', 49, 2, 168, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('25', '加力加虾条7', 49, 2, 168, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('26', '加力加虾条8', 49, 2, 168, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('27', '加力加虾条9', 49, 2, 168, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('28', '加力加虾条10', 49, 2, 168, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('29', '加力加虾条11', 49, 2, 168, 1, '加力加虾条说明', '2021-03-04 09:53:14', '2021-05-10 09:53:20');
INSERT INTO `product` VALUES ('3', '咪咪小虾条', 50, 2, 199, 1, '<img src=\"static/pimgs/mmxt_desc.jpg\"/>', '2021-04-26 15:58:09', '2021-04-25 15:58:11');
INSERT INTO `product` VALUES ('4', '旺旺雪饼', 46, 2, 201, 1, '旺旺雪饼商品内容', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('5', '商品5', 10, 1, 122, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('6', '商品6', 10, 1, 123, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('7', '商品7', 10, 1, 124, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('8', '商品8', 10, 1, 125, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('9', '商品9', 10, 1, 126, 1, '商品说明', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('30', '农夫山泉', 56, 52, 500, 1, '农夫山泉有点甜', '2022-08-18 21:32:08', '2022-08-18 21:32:20');
INSERT INTO `product` VALUES ('31', '康师傅红烧牛肉面', 57, 2, 501, 1, '嘎嘎香！', '2022-08-18 21:33:41', '2022-08-18 21:33:45');
INSERT INTO `product` VALUES ('32', '海天酱油', 58, 54, 499, 1, '老品牌值得信赖！', '2022-08-18 21:36:41', '2022-08-18 21:36:44');
-- ----------------------------
-- Table structure for product_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_comments`;
CREATE TABLE `product_comments`  (
  `comm_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `order_item_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单项(商品快照)ID 可为空',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户id 用户名须脱敏',
  `is_anonymous` int(11) NULL DEFAULT NULL COMMENT '是否匿名（1:是，0:否）',
  `comm_type` int(11) NULL DEFAULT NULL COMMENT '评价类型（1好评，0中评，-1差评）',
  `comm_level` int(11) NOT NULL COMMENT '评价等级 1：好评 2：中评 3：差评',
  `comm_content` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价内容',
  `comm_imgs` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价晒图(JSON {img1:url1,img2:url2}  )',
  `sepc_name` datetime(0) NULL DEFAULT NULL COMMENT '评价时间 可为空',
  `reply_status` int(11) NULL DEFAULT NULL COMMENT '是否回复（0:未回复，1:已回复）',
  `reply_content` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `reply_time` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  `is_show` int(11) NULL DEFAULT NULL COMMENT '是否显示（1:是，0:否）',
  PRIMARY KEY (`comm_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_comments
-- ----------------------------
INSERT INTO `product_comments` VALUES ('1', '3', '咪咪虾条', '10000001', '4', 1, 1, 1, '我买这不是来吃的，就是玩儿', '{}', '2021-04-27 14:51:10', 0, NULL, '2021-04-27 14:51:32', 1);
INSERT INTO `product_comments` VALUES ('2', '3', '咪咪虾条', '10000002', '5', 0, 1, 1, 'nice', '{img1:“mmxt2.png”}', '2021-04-27 14:53:20', 1, '你好我也好', '2021-04-27 14:53:37', 1);
INSERT INTO `product_comments` VALUES ('3', '3', '咪咪虾条', '10000003', '1', 1, 1, 1, '评价内容3', '{}', '2021-04-27 09:36:36', 0, NULL, NULL, 1);
INSERT INTO `product_comments` VALUES ('4', '3', '咪咪虾条', '10000004', '2', 1, 1, 1, '评价内容3', '{}', '2021-04-28 09:37:28', 0, NULL, NULL, 1);
INSERT INTO `product_comments` VALUES ('5', '3', '咪咪虾条', '10000005', '2', 1, 0, 1, '评价内容5', '{}', '2021-04-28 09:38:13', 0, NULL, NULL, 1);
INSERT INTO `product_comments` VALUES ('6', '3', '咪咪虾条', '10000006', '3', 1, 0, 1, '评价内容6', '{}', '2021-04-21 09:39:16', 0, NULL, NULL, 1);
INSERT INTO `product_comments` VALUES ('7', '3', '咪咪虾条', '10000007', '4', 0, -1, 1, '评价内容7', '{}', '2021-04-06 09:40:01', 0, NULL, NULL, 1);
INSERT INTO `product_comments` VALUES ('10', '32', '海天酱油', '10000010', '1', 1, 1, 1, '物美价廉', '1', '2022-08-18 22:47:57', 0, '谢谢惠顾', '2022-08-18 22:48:08', 1);
INSERT INTO `product_comments` VALUES ('11', '32', '海天酱油', '10000010', '1', 1, 1, 1, '物美价廉', '{}', '2022-08-18 22:51:36', 0, '谢谢惠顾', '2022-08-18 22:51:55', 1);
INSERT INTO `product_comments` VALUES ('8', '30', '农夫山泉', '10000008', '1', 1, 1, 1, '农夫山泉有点甜', '1', '2022-08-18 22:46:05', 0, '谢谢惠顾', '2022-08-18 22:46:25', 1);
INSERT INTO `product_comments` VALUES ('9', '31', '康师傅红烧牛肉面', '10000009', '1', 1, 1, 1, '先喝汤面更香', '1', '2022-08-18 22:47:05', 0, '谢谢惠顾', '2022-08-18 22:47:20', 1);

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片主键',
  `item_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品外键id 商品外键id',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址 图片地址',
  `sort` int(11) NOT NULL COMMENT '顺序 图片顺序，从小到大',
  `is_main` int(11) NOT NULL COMMENT '是否主图 是否主图，1：是，0：否',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES ('1', '1', 'ala_1.png', 1, 1, '2021-04-22 15:25:08', '2021-04-22 15:25:15');
INSERT INTO `product_img` VALUES ('10', '6', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('11', '7', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('12', '8', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('13', '9', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('14', '10', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('15', '11', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('16', '12', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('17', '13', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('18', '14', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('19', '15', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('2', '1', 'ala_2.png', 2, 0, '2021-04-22 15:25:39', '2021-04-22 15:25:44');
INSERT INTO `product_img` VALUES ('20', '16', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('21', '17', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('22', '18', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('23', '19', 'jlj_1.png', 1, 1, '2021-05-10 09:54:10', '2021-05-10 09:54:12');
INSERT INTO `product_img` VALUES ('3', '2', 'hfb_1.png', 1, 1, '2021-04-24 15:30:09', '2021-04-25 15:30:19');
INSERT INTO `product_img` VALUES ('4', '2', 'hfb_2.png', 2, 0, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('5', '3', 'mmxt_1.png', 1, 1, '2021-04-25 15:59:28', '2021-04-25 15:59:31');
INSERT INTO `product_img` VALUES ('6', '3', 'mmxt_2.png', 2, 0, '2021-04-25 15:59:51', '2021-04-25 15:59:54');
INSERT INTO `product_img` VALUES ('7', '4', 'wwxb_1.png', 1, 1, '2021-04-25 16:00:12', '2021-04-25 16:00:17');
INSERT INTO `product_img` VALUES ('8', '4', 'wwxb_2.png', 2, 0, '2021-04-25 16:00:36', '2021-04-25 16:00:39');
INSERT INTO `product_img` VALUES ('9', '5', 'wwxb_1.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('30', '30', 'water.jpg', 1, 1, '2022-08-18 21:42:33', '2022-08-18 21:42:35');
INSERT INTO `product_img` VALUES ('31', '31', 'mian.jpg', 1, 1, '2022-08-18 21:43:05', '2022-08-18 21:43:07');
INSERT INTO `product_img` VALUES ('32', '32', 'haitian.jpg', 1, 1, '2022-08-18 21:43:22', '2022-08-18 21:43:24');
-- ----------------------------
-- Table structure for product_params
-- ----------------------------
DROP TABLE IF EXISTS `product_params`;
CREATE TABLE `product_params`  (
  `param_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品参数id',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `product_place` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产地 产地，例：中国江苏',
  `foot_period` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保质期 保质期，例：180天',
  `brand` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名 品牌名，例：三只大灰狼',
  `factory_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产厂名 生产厂名，例：大灰狼工厂',
  `factory_address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产厂址 生产厂址，例：大灰狼生产基地',
  `packaging_method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包装方式 包装方式，例：袋装',
  `weight` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格重量 规格重量，例：35g',
  `storage_method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存储方法 存储方法，例：常温5~25°',
  `eat_method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '食用方式 食用方式，例：开袋即食',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`param_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品参数 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_params
-- ----------------------------
INSERT INTO `product_params` VALUES ('1', '3', '中国湖北武汉', '12个月', '咪咪', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '袋装', '50g', '常温保存', '开袋即食', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('2', '19', '中国湖北武汉', '12个月', '卫龙', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '袋装', '50g', '常温保存', '开袋即食', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('3', '20', '中国湖北武汉', '12个月', '威龙', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '袋装', '50g', '常温保存', '开袋即食', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('4', '21', '中国湖北武汉', '12个月', '卫龙', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '袋装', '50g', '常温保存', '开袋即食', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('5', '22', '中国湖北武汉', '12个月', '威龙', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '袋装', '50g', '常温保存', '开袋即食', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('6', '23', '中国湖北武汉', '12个月', '老干妈', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '袋装', '50g', '常温保存', '开袋即食', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('7', '24', '中国湖北武汉', '12个月', '卫龙', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '袋装', '50g', '常温保存', '开袋即食', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('8', '1', '中国湖北武汉', '12个月', '良品铺子', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '袋装', '50g', '常温保存', '开袋即食', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('9', '30', '中国湖北武汉', '12个月', '农夫山泉', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '瓶装', '500g', '常温保存', '开瓶即饮', '2022-08-18 22:40:12', '2022-08-18 22:40:14');
INSERT INTO `product_params` VALUES ('10', '31', '中国湖北武汉', '12个月', '康师傅', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '袋装', '250g', '常温保存', '开袋即食', '2022-08-18 22:41:44', '2022-08-18 22:41:48');
INSERT INTO `product_params` VALUES ('11', '32', '中国湖北武汉', '12个月', '海天', '贤磊咪咪虾条有限责任公司', '湖北武汉江夏区光谷大道77号', '瓶装', '500g', '常温保存', '开瓶即用', '2022-08-18 22:42:11', '2022-08-18 22:42:14');
-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `sku_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编号',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `sku_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku名称',
  `sku_img` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku图片',
  `untitled` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性组合（格式是p1:v1;p2:v2）',
  `original_price` int(11) NOT NULL COMMENT '原价',
  `sell_price` int(11) NOT NULL COMMENT '销售价格',
  `discounts` decimal(4, 2) NOT NULL COMMENT '折扣力度',
  `stock` int(11) NOT NULL COMMENT '库存',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `status` int(11) NULL DEFAULT NULL COMMENT 'sku状态(1启用，0禁用，-1删除)',
  PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格 每一件商品都有不同的规格，不同的规格又有不同的价格和优惠力度，规格表为此设计' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO `product_sku` VALUES ('1', '3', '咪咪虾条 单包 50g', 'mmxt_1.png', '{口味:[\"原味\",\"烧烤\",\"芥末\"],包装:[\"盒装\",\"袋装\"]}', 2, 1, 0.70, 316, '2021-04-26 15:58:00', '2021-04-25 15:58:00', 1);
INSERT INTO `product_sku` VALUES ('10', '24', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('11', '25', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('12', '26', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('13', '27', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('14', '28', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('15', '29', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('2', '3', '咪咪虾条 6连包', 'mmxt_1.png', '{口味:[\"原味\",\"烧烤\"],包装:[\"新包装\",\"老包装\"]}', 6, 5, 0.60, 171, '2021-04-26 14:48:21', '2021-04-26 14:48:25', 1);
INSERT INTO `product_sku` VALUES ('3', '3', '咪咪虾条 整箱50包', 'mmxt_1.png', '{口味:[\"原味\",\"烧烤\",\"孜然\"]}', 50, 40, 0.50, 37, '2021-04-26 14:49:20', '2021-04-26 14:49:23', 1);
INSERT INTO `product_sku` VALUES ('4', '1', '奥利奥分享装', 'ala_1.png', '{口味:[\"草莓\",\"巧克力\",\"牛奶\",\"原味\"]}', 10, 8, 0.80, 137, '2021-04-27 11:38:55', '2021-04-27 11:39:00', 1);
INSERT INTO `product_sku` VALUES ('5', '19', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('6', '20', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('7', '21', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('8', '22', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('9', '23', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('21', '30', '农夫山泉500ml', 'jlj_1.png', '无', 2, 2, 0.50, 10000, '2022-08-18 21:39:01', '2022-08-18 21:39:03', 1);
INSERT INTO `product_sku` VALUES ('22', '31', '康师傅红烧牛肉面150g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 2, 3, 0.50, 9999, '2022-08-18 21:40:49', '2022-08-18 21:40:52', 1);
INSERT INTO `product_sku` VALUES ('23', '32', '海天酱油500ml', 'jlj_1.png', '无', 10, 8, 0.80, 5000, '2022-08-18 21:41:50', '2022-08-18 21:41:52', 1);
-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID',
  `sku_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'skuID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `cart_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购物车商品数量',
  `cart_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加购物车时间',
  `product_price` decimal(32, 8) NULL DEFAULT NULL COMMENT '添加购物车时商品价格',
  `sku_props` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选择的套餐的属性',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (5, '3', '1', '6', '1', '2021-05-12 09:18:35', 1.00000000, '口味:原味;包装:盒装;');
INSERT INTO `shopping_cart` VALUES (6, '1', '4', '6', '1', '2021-05-12 09:18:47', 8.00000000, '口味:草莓;');
INSERT INTO `shopping_cart` VALUES (7, '3', '1', '1', '1', '2021-05-12 09:37:15', 1.00000000, '口味:原味;包装:盒装;');

-- ----------------------------
-- Table structure for user_addr
-- ----------------------------
DROP TABLE IF EXISTS `user_addr`;
CREATE TABLE `user_addr`  (
  `addr_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址主键id',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `receiver_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人姓名',
  `receiver_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人手机号',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市',
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区县',
  `addr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态,1正常，0无效',
  `common_addr` int(11) NULL DEFAULT NULL COMMENT '是否默认地址 1是 1:是  0:否',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`addr_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_addr
-- ----------------------------
INSERT INTO `user_addr` VALUES ('1', '1', '张三', '13030303300', '湖北', '武汉', '江夏区', '光谷大道77号', '421000', 1, 1, '2021-04-30 09:33:30', '2021-04-28 09:33:37');
INSERT INTO `user_addr` VALUES ('2', '1', '小丽', '13131313311', '湖北', '宜昌', '夷陵区', '巴拉巴拉', '410000', 1, 0, '2021-04-30 09:34:41', '2021-04-30 09:34:44');
INSERT INTO `user_addr` VALUES ('3', '6', '韩梅梅', '13232323322', '湖南', '长沙', '岳麓区', '淅沥淅沥', '430000', 1, 1, '2021-04-30 09:35:49', '2021-04-30 09:35:53');
INSERT INTO `user_addr` VALUES ('5', '9', '张三麻', '22222222222', '河南', '郑州', '二七区', '世纪大道', '453400', 1, 1, '2022-08-19 21:56:43', '2022-08-19 21:56:46');
INSERT INTO `user_addr` VALUES ('7', '9', '郑州', '18790683753', '河南', '郑州', '二七区', '啊啊啊', '453400', 0, 0, '2022-08-20 20:42:26', '2022-08-20 20:42:26');

-- ----------------------------
-- Table structure for user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `user_login_history`;
CREATE TABLE `user_login_history`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `AREA` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `COUNTRY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `USER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `IP` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP',
  `LOGIN_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录历史表 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(64) NOT NULL AUTO_INCREMENT COMMENT '主键id 用户id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名 用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码 密码',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称 昵称',
  `realname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名 真实姓名',
  `user_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像 头像',
  `user_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号 手机号',
  `user_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址 邮箱地址',
  `user_sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 M(男) or F(女)',
  `user_birth` date NULL DEFAULT NULL COMMENT '生日 生日',
  `user_regtime` datetime(0) NOT NULL COMMENT '注册时间 创建时间',
  `user_modtime` datetime(0) NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'zhangsan', 'f379eaf3c831b04de153469d1bec345e', NULL, NULL, 'img/default.png', NULL, NULL, NULL, NULL, '2021-04-15 16:10:53', '2021-04-15 16:10:53');
INSERT INTO `users` VALUES (2, 'aaaa', '1111', NULL, NULL, 'img/default.png', NULL, NULL, NULL, NULL, '2021-04-16 11:10:01', '2021-04-16 11:10:01');
INSERT INTO `users` VALUES (3, 'wahaha', '4297f44b13955235245b2497399d7a93', NULL, NULL, 'img/default.png', NULL, NULL, NULL, NULL, '2021-04-16 15:36:52', '2021-04-16 15:36:52');
INSERT INTO `users` VALUES (4, 'heihei', '4297f44b13955235245b2497399d7a93', '二狗', NULL, 'img/default.png', NULL, NULL, NULL, NULL, '2021-04-16 15:38:49', '2021-04-16 15:38:49');
INSERT INTO `users` VALUES (5, 'Tony', '4297f44b13955235245b2497399d7a93', '托尼', NULL, 'img/default.png', NULL, NULL, NULL, NULL, '2021-04-23 10:25:04', '2021-04-23 10:25:04');
INSERT INTO `users` VALUES (6, 'hanmeimei', 'f379eaf3c831b04de153469d1bec345e', NULL, NULL, 'img/default.png', NULL, NULL, NULL, NULL, '2021-04-23 10:30:52', '2021-04-23 10:30:52');
INSERT INTO `users` VALUES (7, 'lilei123', '4297f44b13955235245b2497399d7a93', NULL, NULL, 'img/default.png', NULL, NULL, NULL, NULL, '2021-04-23 10:33:03', '2021-04-23 10:33:03');
INSERT INTO `users` VALUES (8, 'tom123123', '4297f44b13955235245b2497399d7a93', NULL, NULL, 'img/default.png', NULL, NULL, NULL, NULL, '2021-04-23 10:34:49', '2021-04-23 10:34:49');
INSERT INTO `users` VALUES (9, '2997152047@qq.com', '25f9e794323b453885f5181f1b624d0b', NULL, NULL, 'img/default.png', NULL, NULL, NULL, NULL, '2022-08-14 15:54:18', '2022-08-14 15:54:18');
INSERT INTO `users` VALUES (10, 'zhaishangzhao', '1bbd886460827015e5d605ed44252251', NULL, NULL, 'img/default.png', NULL, NULL, NULL, NULL, '2022-08-18 23:13:52', '2022-08-18 23:13:52');

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `pid` int UNSIGNED NOT NULL,
                         `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                         `visible` tinyint UNSIGNED NOT NULL,
                         `displayorder` int UNSIGNED NOT NULL,
                         `level` tinyint UNSIGNED NOT NULL,
                         PRIMARY KEY (`id`) USING BTREE,
                         INDEX `parentId`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 990101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (110000, 0, '北京市', 2, 1, 1);
INSERT INTO `area` VALUES (110100, 110000, '北京市', 2, 0, 2);
INSERT INTO `area` VALUES (110101, 110100, '东城区', 2, 1, 3);
INSERT INTO `area` VALUES (110102, 110100, '西城区', 2, 0, 3);
INSERT INTO `area` VALUES (110103, 110100, '崇文区', 2, 0, 3);
INSERT INTO `area` VALUES (110104, 110100, '宣武区', 2, 0, 3);
INSERT INTO `area` VALUES (110105, 110100, '朝阳区', 2, 0, 3);
INSERT INTO `area` VALUES (110106, 110100, '丰台区', 2, 0, 3);
INSERT INTO `area` VALUES (110107, 110100, '石景山区', 2, 0, 3);
INSERT INTO `area` VALUES (110108, 110100, '海淀区', 2, 0, 3);
INSERT INTO `area` VALUES (110109, 110100, '门头沟区', 2, 0, 3);
INSERT INTO `area` VALUES (110111, 110100, '房山区', 2, 0, 3);
INSERT INTO `area` VALUES (110112, 110100, '通州区', 2, 0, 3);
INSERT INTO `area` VALUES (110113, 110100, '顺义区', 2, 0, 3);
INSERT INTO `area` VALUES (110114, 110100, '昌平区', 2, 0, 3);
INSERT INTO `area` VALUES (110115, 110100, '大兴区', 2, 0, 3);
INSERT INTO `area` VALUES (110116, 110100, '怀柔区', 2, 0, 3);
INSERT INTO `area` VALUES (110117, 110100, '平谷区', 2, 0, 3);
INSERT INTO `area` VALUES (110228, 110200, '密云县', 2, 0, 3);
INSERT INTO `area` VALUES (110229, 110200, '延庆县', 2, 0, 3);
INSERT INTO `area` VALUES (110230, 110100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (120000, 0, '天津市', 2, 0, 1);
INSERT INTO `area` VALUES (120100, 120000, '天津市', 2, 0, 2);
INSERT INTO `area` VALUES (120101, 120100, '和平区', 2, 0, 3);
INSERT INTO `area` VALUES (120102, 120100, '河东区', 2, 0, 3);
INSERT INTO `area` VALUES (120103, 120100, '河西区', 2, 0, 3);
INSERT INTO `area` VALUES (120104, 120100, '南开区', 2, 0, 3);
INSERT INTO `area` VALUES (120105, 120100, '河北区', 2, 0, 3);
INSERT INTO `area` VALUES (120106, 120100, '红桥区', 2, 0, 3);
INSERT INTO `area` VALUES (120107, 120100, '塘沽区', 2, 0, 3);
INSERT INTO `area` VALUES (120108, 120100, '汉沽区', 2, 0, 3);
INSERT INTO `area` VALUES (120109, 120100, '大港区', 2, 0, 3);
INSERT INTO `area` VALUES (120110, 120100, '东丽区', 2, 0, 3);
INSERT INTO `area` VALUES (120111, 120100, '西青区', 2, 0, 3);
INSERT INTO `area` VALUES (120112, 120100, '津南区', 2, 0, 3);
INSERT INTO `area` VALUES (120113, 120100, '北辰区', 2, 0, 3);
INSERT INTO `area` VALUES (120114, 120100, '武清区', 2, 0, 3);
INSERT INTO `area` VALUES (120115, 120100, '宝坻区', 2, 0, 3);
INSERT INTO `area` VALUES (120116, 120100, '滨海新区', 2, 0, 3);
INSERT INTO `area` VALUES (120221, 120200, '宁河县', 2, 0, 3);
INSERT INTO `area` VALUES (120223, 120200, '静海县', 2, 0, 3);
INSERT INTO `area` VALUES (120225, 120200, '蓟县', 2, 0, 3);
INSERT INTO `area` VALUES (120226, 120100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (130000, 0, '河北省', 2, 0, 1);
INSERT INTO `area` VALUES (130100, 130000, '石家庄市', 2, 0, 2);
INSERT INTO `area` VALUES (130102, 130100, '长安区', 2, 0, 3);
INSERT INTO `area` VALUES (130103, 130100, '桥东区', 2, 0, 3);
INSERT INTO `area` VALUES (130104, 130100, '桥西区', 2, 0, 3);
INSERT INTO `area` VALUES (130105, 130100, '新华区', 2, 0, 3);
INSERT INTO `area` VALUES (130107, 130100, '井陉矿区', 2, 0, 3);
INSERT INTO `area` VALUES (130108, 130100, '裕华区', 2, 0, 3);
INSERT INTO `area` VALUES (130109, 130100, '藁城区', 2, 0, 3);
INSERT INTO `area` VALUES (130110, 130100, '鹿泉区', 2, 0, 3);
INSERT INTO `area` VALUES (130111, 130100, '栾城区', 2, 0, 3);
INSERT INTO `area` VALUES (130121, 130100, '井陉县', 2, 0, 3);
INSERT INTO `area` VALUES (130123, 130100, '正定县', 2, 0, 3);
INSERT INTO `area` VALUES (130124, 130100, '栾城县', 2, 0, 3);
INSERT INTO `area` VALUES (130125, 130100, '行唐县', 2, 0, 3);
INSERT INTO `area` VALUES (130126, 130100, '灵寿县', 2, 0, 3);
INSERT INTO `area` VALUES (130127, 130100, '高邑县', 2, 0, 3);
INSERT INTO `area` VALUES (130128, 130100, '深泽县', 2, 0, 3);
INSERT INTO `area` VALUES (130129, 130100, '赞皇县', 2, 0, 3);
INSERT INTO `area` VALUES (130130, 130100, '无极县', 2, 0, 3);
INSERT INTO `area` VALUES (130131, 130100, '平山县', 2, 0, 3);
INSERT INTO `area` VALUES (130132, 130100, '元氏县', 2, 0, 3);
INSERT INTO `area` VALUES (130133, 130100, '赵县', 2, 0, 3);
INSERT INTO `area` VALUES (130181, 130100, '辛集市', 2, 0, 3);
INSERT INTO `area` VALUES (130182, 130100, '藁城市', 2, 0, 3);
INSERT INTO `area` VALUES (130183, 130100, '晋州市', 2, 0, 3);
INSERT INTO `area` VALUES (130184, 130100, '新乐市', 2, 0, 3);
INSERT INTO `area` VALUES (130185, 130100, '鹿泉市', 2, 0, 3);
INSERT INTO `area` VALUES (130186, 130100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (130200, 130000, '唐山市', 2, 0, 2);
INSERT INTO `area` VALUES (130202, 130200, '路南区', 2, 0, 3);
INSERT INTO `area` VALUES (130203, 130200, '路北区', 2, 0, 3);
INSERT INTO `area` VALUES (130204, 130200, '古冶区', 2, 0, 3);
INSERT INTO `area` VALUES (130205, 130200, '开平区', 2, 0, 3);
INSERT INTO `area` VALUES (130207, 130200, '丰南区', 2, 0, 3);
INSERT INTO `area` VALUES (130208, 130200, '丰润区', 2, 0, 3);
INSERT INTO `area` VALUES (130209, 130200, '曹妃甸区', 2, 0, 3);
INSERT INTO `area` VALUES (130223, 130200, '滦县', 2, 0, 3);
INSERT INTO `area` VALUES (130224, 130200, '滦南县', 2, 0, 3);
INSERT INTO `area` VALUES (130225, 130200, '乐亭县', 2, 0, 3);
INSERT INTO `area` VALUES (130227, 130200, '迁西县', 2, 0, 3);
INSERT INTO `area` VALUES (130229, 130200, '玉田县', 2, 0, 3);
INSERT INTO `area` VALUES (130230, 130200, '唐海县', 2, 0, 3);
INSERT INTO `area` VALUES (130281, 130200, '遵化市', 2, 0, 3);
INSERT INTO `area` VALUES (130283, 130200, '迁安市', 2, 0, 3);
INSERT INTO `area` VALUES (130284, 130200, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (130300, 130000, '秦皇岛市', 2, 0, 2);
INSERT INTO `area` VALUES (130302, 130300, '海港区', 2, 0, 3);
INSERT INTO `area` VALUES (130303, 130300, '山海关区', 2, 0, 3);
INSERT INTO `area` VALUES (130304, 130300, '北戴河区', 2, 0, 3);
INSERT INTO `area` VALUES (130321, 130300, '青龙满族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (130322, 130300, '昌黎县', 2, 0, 3);
INSERT INTO `area` VALUES (130323, 130300, '抚宁县', 2, 0, 3);
INSERT INTO `area` VALUES (130324, 130300, '卢龙县', 2, 0, 3);
INSERT INTO `area` VALUES (130398, 130300, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (130399, 130300, '经济技术开发区', 2, 0, 3);
INSERT INTO `area` VALUES (130400, 130000, '邯郸市', 2, 0, 2);
INSERT INTO `area` VALUES (130402, 130400, '邯山区', 2, 0, 3);
INSERT INTO `area` VALUES (130403, 130400, '丛台区', 2, 0, 3);
INSERT INTO `area` VALUES (130404, 130400, '复兴区', 2, 0, 3);
INSERT INTO `area` VALUES (130406, 130400, '峰峰矿区', 2, 0, 3);
INSERT INTO `area` VALUES (130421, 130400, '邯郸县', 2, 0, 3);
INSERT INTO `area` VALUES (130423, 130400, '临漳县', 2, 0, 3);
INSERT INTO `area` VALUES (130424, 130400, '成安县', 2, 0, 3);
INSERT INTO `area` VALUES (130425, 130400, '大名县', 2, 0, 3);
INSERT INTO `area` VALUES (130426, 130400, '涉县', 2, 0, 3);
INSERT INTO `area` VALUES (130427, 130400, '磁县', 2, 0, 3);
INSERT INTO `area` VALUES (130428, 130400, '肥乡县', 2, 0, 3);
INSERT INTO `area` VALUES (130429, 130400, '永年县', 2, 0, 3);
INSERT INTO `area` VALUES (130430, 130400, '邱县', 2, 0, 3);
INSERT INTO `area` VALUES (130431, 130400, '鸡泽县', 2, 0, 3);
INSERT INTO `area` VALUES (130432, 130400, '广平县', 2, 0, 3);
INSERT INTO `area` VALUES (130433, 130400, '馆陶县', 2, 0, 3);
INSERT INTO `area` VALUES (130434, 130400, '魏县', 2, 0, 3);
INSERT INTO `area` VALUES (130435, 130400, '曲周县', 2, 0, 3);
INSERT INTO `area` VALUES (130481, 130400, '武安市', 2, 0, 3);
INSERT INTO `area` VALUES (130482, 130400, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (130500, 130000, '邢台市', 2, 0, 2);
INSERT INTO `area` VALUES (130502, 130500, '桥东区', 2, 0, 3);
INSERT INTO `area` VALUES (130503, 130500, '桥西区', 2, 0, 3);
INSERT INTO `area` VALUES (130521, 130500, '邢台县', 2, 0, 3);
INSERT INTO `area` VALUES (130522, 130500, '临城县', 2, 0, 3);
INSERT INTO `area` VALUES (130523, 130500, '内丘县', 2, 0, 3);
INSERT INTO `area` VALUES (130524, 130500, '柏乡县', 2, 0, 3);
INSERT INTO `area` VALUES (130525, 130500, '隆尧县', 2, 0, 3);
INSERT INTO `area` VALUES (130526, 130500, '任县', 2, 0, 3);
INSERT INTO `area` VALUES (130527, 130500, '南和县', 2, 0, 3);
INSERT INTO `area` VALUES (130528, 130500, '宁晋县', 2, 0, 3);
INSERT INTO `area` VALUES (130529, 130500, '巨鹿县', 2, 0, 3);
INSERT INTO `area` VALUES (130530, 130500, '新河县', 2, 0, 3);
INSERT INTO `area` VALUES (130531, 130500, '广宗县', 2, 0, 3);
INSERT INTO `area` VALUES (130532, 130500, '平乡县', 2, 0, 3);
INSERT INTO `area` VALUES (130533, 130500, '威县', 2, 0, 3);
INSERT INTO `area` VALUES (130534, 130500, '清河县', 2, 0, 3);
INSERT INTO `area` VALUES (130535, 130500, '临西县', 2, 0, 3);
INSERT INTO `area` VALUES (130581, 130500, '南宫市', 2, 0, 3);
INSERT INTO `area` VALUES (130582, 130500, '沙河市', 2, 0, 3);
INSERT INTO `area` VALUES (130583, 130500, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (130600, 130000, '保定市', 2, 0, 2);
INSERT INTO `area` VALUES (130602, 130600, '新市区', 2, 0, 3);
INSERT INTO `area` VALUES (130603, 130600, '北市区', 2, 0, 3);
INSERT INTO `area` VALUES (130604, 130600, '南市区', 2, 0, 3);
INSERT INTO `area` VALUES (130621, 130600, '满城县', 2, 0, 3);
INSERT INTO `area` VALUES (130622, 130600, '清苑县', 2, 0, 3);
INSERT INTO `area` VALUES (130623, 130600, '涞水县', 2, 0, 3);
INSERT INTO `area` VALUES (130624, 130600, '阜平县', 2, 0, 3);
INSERT INTO `area` VALUES (130625, 130600, '徐水县', 2, 0, 3);
INSERT INTO `area` VALUES (130626, 130600, '定兴县', 2, 0, 3);
INSERT INTO `area` VALUES (130627, 130600, '唐县', 2, 0, 3);
INSERT INTO `area` VALUES (130628, 130600, '高阳县', 2, 0, 3);
INSERT INTO `area` VALUES (130629, 130600, '容城县', 2, 0, 3);
INSERT INTO `area` VALUES (130630, 130600, '涞源县', 2, 0, 3);
INSERT INTO `area` VALUES (130631, 130600, '望都县', 2, 0, 3);
INSERT INTO `area` VALUES (130632, 130600, '安新县', 2, 0, 3);
INSERT INTO `area` VALUES (130633, 130600, '易县', 2, 0, 3);
INSERT INTO `area` VALUES (130634, 130600, '曲阳县', 2, 0, 3);
INSERT INTO `area` VALUES (130635, 130600, '蠡县', 2, 0, 3);
INSERT INTO `area` VALUES (130636, 130600, '顺平县', 2, 0, 3);
INSERT INTO `area` VALUES (130637, 130600, '博野县', 2, 0, 3);
INSERT INTO `area` VALUES (130638, 130600, '雄县', 2, 0, 3);
INSERT INTO `area` VALUES (130681, 130600, '涿州市', 2, 0, 3);
INSERT INTO `area` VALUES (130682, 130600, '定州市', 2, 0, 3);
INSERT INTO `area` VALUES (130683, 130600, '安国市', 2, 0, 3);
INSERT INTO `area` VALUES (130684, 130600, '高碑店市', 2, 0, 3);
INSERT INTO `area` VALUES (130698, 130600, '高开区', 2, 0, 3);
INSERT INTO `area` VALUES (130699, 130600, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (130700, 130000, '张家口市', 2, 0, 2);
INSERT INTO `area` VALUES (130702, 130700, '桥东区', 2, 0, 3);
INSERT INTO `area` VALUES (130703, 130700, '桥西区', 2, 0, 3);
INSERT INTO `area` VALUES (130705, 130700, '宣化区', 2, 0, 3);
INSERT INTO `area` VALUES (130706, 130700, '下花园区', 2, 0, 3);
INSERT INTO `area` VALUES (130721, 130700, '宣化县', 2, 0, 3);
INSERT INTO `area` VALUES (130722, 130700, '张北县', 2, 0, 3);
INSERT INTO `area` VALUES (130723, 130700, '康保县', 2, 0, 3);
INSERT INTO `area` VALUES (130724, 130700, '沽源县', 2, 0, 3);
INSERT INTO `area` VALUES (130725, 130700, '尚义县', 2, 0, 3);
INSERT INTO `area` VALUES (130726, 130700, '蔚县', 2, 0, 3);
INSERT INTO `area` VALUES (130727, 130700, '阳原县', 2, 0, 3);
INSERT INTO `area` VALUES (130728, 130700, '怀安县', 2, 0, 3);
INSERT INTO `area` VALUES (130729, 130700, '万全县', 2, 0, 3);
INSERT INTO `area` VALUES (130730, 130700, '怀来县', 2, 0, 3);
INSERT INTO `area` VALUES (130731, 130700, '涿鹿县', 2, 0, 3);
INSERT INTO `area` VALUES (130732, 130700, '赤城县', 2, 0, 3);
INSERT INTO `area` VALUES (130733, 130700, '崇礼县', 2, 0, 3);
INSERT INTO `area` VALUES (130734, 130700, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (130800, 130000, '承德市', 2, 0, 2);
INSERT INTO `area` VALUES (130802, 130800, '双桥区', 2, 0, 3);
INSERT INTO `area` VALUES (130803, 130800, '双滦区', 2, 0, 3);
INSERT INTO `area` VALUES (130804, 130800, '鹰手营子矿区', 2, 0, 3);
INSERT INTO `area` VALUES (130821, 130800, '承德县', 2, 0, 3);
INSERT INTO `area` VALUES (130822, 130800, '兴隆县', 2, 0, 3);
INSERT INTO `area` VALUES (130823, 130800, '平泉县', 2, 0, 3);
INSERT INTO `area` VALUES (130824, 130800, '滦平县', 2, 0, 3);
INSERT INTO `area` VALUES (130825, 130800, '隆化县', 2, 0, 3);
INSERT INTO `area` VALUES (130826, 130800, '丰宁满族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (130827, 130800, '宽城满族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (130828, 130800, '围场满族蒙古族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (130829, 130800, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (130900, 130000, '沧州市', 2, 0, 2);
INSERT INTO `area` VALUES (130902, 130900, '新华区', 2, 0, 3);
INSERT INTO `area` VALUES (130903, 130900, '运河区', 2, 0, 3);
INSERT INTO `area` VALUES (130921, 130900, '沧县', 2, 0, 3);
INSERT INTO `area` VALUES (130922, 130900, '青县', 2, 0, 3);
INSERT INTO `area` VALUES (130923, 130900, '东光县', 2, 0, 3);
INSERT INTO `area` VALUES (130924, 130900, '海兴县', 2, 0, 3);
INSERT INTO `area` VALUES (130925, 130900, '盐山县', 2, 0, 3);
INSERT INTO `area` VALUES (130926, 130900, '肃宁县', 2, 0, 3);
INSERT INTO `area` VALUES (130927, 130900, '南皮县', 2, 0, 3);
INSERT INTO `area` VALUES (130928, 130900, '吴桥县', 2, 0, 3);
INSERT INTO `area` VALUES (130929, 130900, '献县', 2, 0, 3);
INSERT INTO `area` VALUES (130930, 130900, '孟村回族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (130981, 130900, '泊头市', 2, 0, 3);
INSERT INTO `area` VALUES (130982, 130900, '任丘市', 2, 0, 3);
INSERT INTO `area` VALUES (130983, 130900, '黄骅市', 2, 0, 3);
INSERT INTO `area` VALUES (130984, 130900, '河间市', 2, 0, 3);
INSERT INTO `area` VALUES (130985, 130900, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (131000, 130000, '廊坊市', 2, 0, 2);
INSERT INTO `area` VALUES (131002, 131000, '安次区', 2, 0, 3);
INSERT INTO `area` VALUES (131003, 131000, '广阳区', 2, 0, 3);
INSERT INTO `area` VALUES (131022, 131000, '固安县', 2, 0, 3);
INSERT INTO `area` VALUES (131023, 131000, '永清县', 2, 0, 3);
INSERT INTO `area` VALUES (131024, 131000, '香河县', 2, 0, 3);
INSERT INTO `area` VALUES (131025, 131000, '大城县', 2, 0, 3);
INSERT INTO `area` VALUES (131026, 131000, '文安县', 2, 0, 3);
INSERT INTO `area` VALUES (131028, 131000, '大厂回族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (131051, 131000, '开发区', 2, 0, 3);
INSERT INTO `area` VALUES (131052, 131000, '燕郊经济技术开发区', 2, 0, 3);
INSERT INTO `area` VALUES (131081, 131000, '霸州市', 2, 0, 3);
INSERT INTO `area` VALUES (131082, 131000, '三河市', 2, 0, 3);
INSERT INTO `area` VALUES (131083, 131000, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (131100, 130000, '衡水市', 2, 0, 2);
INSERT INTO `area` VALUES (131102, 131100, '桃城区', 2, 0, 3);
INSERT INTO `area` VALUES (131121, 131100, '枣强县', 2, 0, 3);
INSERT INTO `area` VALUES (131122, 131100, '武邑县', 2, 0, 3);
INSERT INTO `area` VALUES (131123, 131100, '武强县', 2, 0, 3);
INSERT INTO `area` VALUES (131124, 131100, '饶阳县', 2, 0, 3);
INSERT INTO `area` VALUES (131125, 131100, '安平县', 2, 0, 3);
INSERT INTO `area` VALUES (131126, 131100, '故城县', 2, 0, 3);
INSERT INTO `area` VALUES (131127, 131100, '景县', 2, 0, 3);
INSERT INTO `area` VALUES (131128, 131100, '阜城县', 2, 0, 3);
INSERT INTO `area` VALUES (131181, 131100, '冀州市', 2, 0, 3);
INSERT INTO `area` VALUES (131182, 131100, '深州市', 2, 0, 3);
INSERT INTO `area` VALUES (131183, 131100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (140000, 0, '山西省', 2, 0, 1);
INSERT INTO `area` VALUES (140100, 140000, '太原市', 2, 0, 2);
INSERT INTO `area` VALUES (140105, 140100, '小店区', 2, 0, 3);
INSERT INTO `area` VALUES (140106, 140100, '迎泽区', 2, 0, 3);
INSERT INTO `area` VALUES (140107, 140100, '杏花岭区', 2, 0, 3);
INSERT INTO `area` VALUES (140108, 140100, '尖草坪区', 2, 0, 3);
INSERT INTO `area` VALUES (140109, 140100, '万柏林区', 2, 0, 3);
INSERT INTO `area` VALUES (140110, 140100, '晋源区', 2, 0, 3);
INSERT INTO `area` VALUES (140121, 140100, '清徐县', 2, 0, 3);
INSERT INTO `area` VALUES (140122, 140100, '阳曲县', 2, 0, 3);
INSERT INTO `area` VALUES (140123, 140100, '娄烦县', 2, 0, 3);
INSERT INTO `area` VALUES (140181, 140100, '古交市', 2, 0, 3);
INSERT INTO `area` VALUES (140182, 140100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (140200, 140000, '大同市', 2, 0, 2);
INSERT INTO `area` VALUES (140202, 140200, '城区', 2, 0, 3);
INSERT INTO `area` VALUES (140203, 140200, '矿区', 2, 0, 3);
INSERT INTO `area` VALUES (140211, 140200, '南郊区', 2, 0, 3);
INSERT INTO `area` VALUES (140212, 140200, '新荣区', 2, 0, 3);
INSERT INTO `area` VALUES (140221, 140200, '阳高县', 2, 0, 3);
INSERT INTO `area` VALUES (140222, 140200, '天镇县', 2, 0, 3);
INSERT INTO `area` VALUES (140223, 140200, '广灵县', 2, 0, 3);
INSERT INTO `area` VALUES (140224, 140200, '灵丘县', 2, 0, 3);
INSERT INTO `area` VALUES (140225, 140200, '浑源县', 2, 0, 3);
INSERT INTO `area` VALUES (140226, 140200, '左云县', 2, 0, 3);
INSERT INTO `area` VALUES (140227, 140200, '大同县', 2, 0, 3);
INSERT INTO `area` VALUES (140228, 140200, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (140300, 140000, '阳泉市', 2, 0, 2);
INSERT INTO `area` VALUES (140302, 140300, '城区', 2, 0, 3);
INSERT INTO `area` VALUES (140303, 140300, '矿区', 2, 0, 3);
INSERT INTO `area` VALUES (140311, 140300, '郊区', 2, 0, 3);
INSERT INTO `area` VALUES (140321, 140300, '平定县', 2, 0, 3);
INSERT INTO `area` VALUES (140322, 140300, '盂县', 2, 0, 3);
INSERT INTO `area` VALUES (140323, 140300, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (140400, 140000, '长治市', 2, 0, 2);
INSERT INTO `area` VALUES (140402, 140400, '城区', 2, 0, 3);
INSERT INTO `area` VALUES (140411, 140400, '郊区', 2, 0, 3);
INSERT INTO `area` VALUES (140421, 140400, '长治县', 2, 0, 3);
INSERT INTO `area` VALUES (140423, 140400, '襄垣县', 2, 0, 3);
INSERT INTO `area` VALUES (140424, 140400, '屯留县', 2, 0, 3);
INSERT INTO `area` VALUES (140425, 140400, '平顺县', 2, 0, 3);
INSERT INTO `area` VALUES (140426, 140400, '黎城县', 2, 0, 3);
INSERT INTO `area` VALUES (140427, 140400, '壶关县', 2, 0, 3);
INSERT INTO `area` VALUES (140428, 140400, '长子县', 2, 0, 3);
INSERT INTO `area` VALUES (140429, 140400, '武乡县', 2, 0, 3);
INSERT INTO `area` VALUES (140430, 140400, '沁县', 2, 0, 3);
INSERT INTO `area` VALUES (140431, 140400, '沁源县', 2, 0, 3);
INSERT INTO `area` VALUES (140481, 140400, '潞城市', 2, 0, 3);
INSERT INTO `area` VALUES (140482, 140400, '城区', 2, 0, 3);
INSERT INTO `area` VALUES (140483, 140400, '郊区', 2, 0, 3);
INSERT INTO `area` VALUES (140484, 140400, '高新区', 2, 0, 3);
INSERT INTO `area` VALUES (140485, 140400, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (140500, 140000, '晋城市', 2, 0, 2);
INSERT INTO `area` VALUES (140502, 140500, '城区', 2, 0, 3);
INSERT INTO `area` VALUES (140521, 140500, '沁水县', 2, 0, 3);
INSERT INTO `area` VALUES (140522, 140500, '阳城县', 2, 0, 3);
INSERT INTO `area` VALUES (140524, 140500, '陵川县', 2, 0, 3);
INSERT INTO `area` VALUES (140525, 140500, '泽州县', 2, 0, 3);
INSERT INTO `area` VALUES (140581, 140500, '高平市', 2, 0, 3);
INSERT INTO `area` VALUES (140582, 140500, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (140600, 140000, '朔州市', 2, 0, 2);
INSERT INTO `area` VALUES (140602, 140600, '朔城区', 2, 0, 3);
INSERT INTO `area` VALUES (140603, 140600, '平鲁区', 2, 0, 3);
INSERT INTO `area` VALUES (140621, 140600, '山阴县', 2, 0, 3);
INSERT INTO `area` VALUES (140622, 140600, '应县', 2, 0, 3);
INSERT INTO `area` VALUES (140623, 140600, '右玉县', 2, 0, 3);
INSERT INTO `area` VALUES (140624, 140600, '怀仁县', 2, 0, 3);
INSERT INTO `area` VALUES (140625, 140600, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (140700, 140000, '晋中市', 2, 0, 2);
INSERT INTO `area` VALUES (140702, 140700, '榆次区', 2, 0, 3);
INSERT INTO `area` VALUES (140721, 140700, '榆社县', 2, 0, 3);
INSERT INTO `area` VALUES (140722, 140700, '左权县', 2, 0, 3);
INSERT INTO `area` VALUES (140723, 140700, '和顺县', 2, 0, 3);
INSERT INTO `area` VALUES (140724, 140700, '昔阳县', 2, 0, 3);
INSERT INTO `area` VALUES (140725, 140700, '寿阳县', 2, 0, 3);
INSERT INTO `area` VALUES (140726, 140700, '太谷县', 2, 0, 3);
INSERT INTO `area` VALUES (140727, 140700, '祁县', 2, 0, 3);
INSERT INTO `area` VALUES (140728, 140700, '平遥县', 2, 0, 3);
INSERT INTO `area` VALUES (140729, 140700, '灵石县', 2, 0, 3);
INSERT INTO `area` VALUES (140781, 140700, '介休市', 2, 0, 3);
INSERT INTO `area` VALUES (140782, 140700, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (140800, 140000, '运城市', 2, 0, 2);
INSERT INTO `area` VALUES (140802, 140800, '盐湖区', 2, 0, 3);
INSERT INTO `area` VALUES (140821, 140800, '临猗县', 2, 0, 3);
INSERT INTO `area` VALUES (140822, 140800, '万荣县', 2, 0, 3);
INSERT INTO `area` VALUES (140823, 140800, '闻喜县', 2, 0, 3);
INSERT INTO `area` VALUES (140824, 140800, '稷山县', 2, 0, 3);
INSERT INTO `area` VALUES (140825, 140800, '新绛县', 2, 0, 3);
INSERT INTO `area` VALUES (140826, 140800, '绛县', 2, 0, 3);
INSERT INTO `area` VALUES (140827, 140800, '垣曲县', 2, 0, 3);
INSERT INTO `area` VALUES (140828, 140800, '夏县', 2, 0, 3);
INSERT INTO `area` VALUES (140829, 140800, '平陆县', 2, 0, 3);
INSERT INTO `area` VALUES (140830, 140800, '芮城县', 2, 0, 3);
INSERT INTO `area` VALUES (140881, 140800, '永济市', 2, 0, 3);
INSERT INTO `area` VALUES (140882, 140800, '河津市', 2, 0, 3);
INSERT INTO `area` VALUES (140883, 140800, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (140900, 140000, '忻州市', 2, 0, 2);
INSERT INTO `area` VALUES (140902, 140900, '忻府区', 2, 0, 3);
INSERT INTO `area` VALUES (140921, 140900, '定襄县', 2, 0, 3);
INSERT INTO `area` VALUES (140922, 140900, '五台县', 2, 0, 3);
INSERT INTO `area` VALUES (140923, 140900, '代县', 2, 0, 3);
INSERT INTO `area` VALUES (140924, 140900, '繁峙县', 2, 0, 3);
INSERT INTO `area` VALUES (140925, 140900, '宁武县', 2, 0, 3);
INSERT INTO `area` VALUES (140926, 140900, '静乐县', 2, 0, 3);
INSERT INTO `area` VALUES (140927, 140900, '神池县', 2, 0, 3);
INSERT INTO `area` VALUES (140928, 140900, '五寨县', 2, 0, 3);
INSERT INTO `area` VALUES (140929, 140900, '岢岚县', 2, 0, 3);
INSERT INTO `area` VALUES (140930, 140900, '河曲县', 2, 0, 3);
INSERT INTO `area` VALUES (140931, 140900, '保德县', 2, 0, 3);
INSERT INTO `area` VALUES (140932, 140900, '偏关县', 2, 0, 3);
INSERT INTO `area` VALUES (140981, 140900, '原平市', 2, 0, 3);
INSERT INTO `area` VALUES (140982, 140900, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (141000, 140000, '临汾市', 2, 0, 2);
INSERT INTO `area` VALUES (141002, 141000, '尧都区', 2, 0, 3);
INSERT INTO `area` VALUES (141021, 141000, '曲沃县', 2, 0, 3);
INSERT INTO `area` VALUES (141022, 141000, '翼城县', 2, 0, 3);
INSERT INTO `area` VALUES (141023, 141000, '襄汾县', 2, 0, 3);
INSERT INTO `area` VALUES (141024, 141000, '洪洞县', 2, 0, 3);
INSERT INTO `area` VALUES (141025, 141000, '古县', 2, 0, 3);
INSERT INTO `area` VALUES (141026, 141000, '安泽县', 2, 0, 3);
INSERT INTO `area` VALUES (141027, 141000, '浮山县', 2, 0, 3);
INSERT INTO `area` VALUES (141028, 141000, '吉县', 2, 0, 3);
INSERT INTO `area` VALUES (141029, 141000, '乡宁县', 2, 0, 3);
INSERT INTO `area` VALUES (141030, 141000, '大宁县', 2, 0, 3);
INSERT INTO `area` VALUES (141031, 141000, '隰县', 2, 0, 3);
INSERT INTO `area` VALUES (141032, 141000, '永和县', 2, 0, 3);
INSERT INTO `area` VALUES (141033, 141000, '蒲县', 2, 0, 3);
INSERT INTO `area` VALUES (141034, 141000, '汾西县', 2, 0, 3);
INSERT INTO `area` VALUES (141081, 141000, '侯马市', 2, 0, 3);
INSERT INTO `area` VALUES (141082, 141000, '霍州市', 2, 0, 3);
INSERT INTO `area` VALUES (141083, 141000, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (141100, 140000, '吕梁市', 2, 0, 2);
INSERT INTO `area` VALUES (141102, 141100, '离石区', 2, 0, 3);
INSERT INTO `area` VALUES (141121, 141100, '文水县', 2, 0, 3);
INSERT INTO `area` VALUES (141122, 141100, '交城县', 2, 0, 3);
INSERT INTO `area` VALUES (141123, 141100, '兴县', 2, 0, 3);
INSERT INTO `area` VALUES (141124, 141100, '临县', 2, 0, 3);
INSERT INTO `area` VALUES (141125, 141100, '柳林县', 2, 0, 3);
INSERT INTO `area` VALUES (141126, 141100, '石楼县', 2, 0, 3);
INSERT INTO `area` VALUES (141127, 141100, '岚县', 2, 0, 3);
INSERT INTO `area` VALUES (141128, 141100, '方山县', 2, 0, 3);
INSERT INTO `area` VALUES (141129, 141100, '中阳县', 2, 0, 3);
INSERT INTO `area` VALUES (141130, 141100, '交口县', 2, 0, 3);
INSERT INTO `area` VALUES (141181, 141100, '孝义市', 2, 0, 3);
INSERT INTO `area` VALUES (141182, 141100, '汾阳市', 2, 0, 3);
INSERT INTO `area` VALUES (141183, 141100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (150000, 0, '内蒙古自治区', 2, 0, 1);
INSERT INTO `area` VALUES (150100, 150000, '呼和浩特市', 2, 0, 2);
INSERT INTO `area` VALUES (150102, 150100, '新城区', 2, 0, 3);
INSERT INTO `area` VALUES (150103, 150100, '回民区', 2, 0, 3);
INSERT INTO `area` VALUES (150104, 150100, '玉泉区', 2, 0, 3);
INSERT INTO `area` VALUES (150105, 150100, '赛罕区', 2, 0, 3);
INSERT INTO `area` VALUES (150121, 150100, '土默特左旗', 2, 0, 3);
INSERT INTO `area` VALUES (150122, 150100, '托克托县', 2, 0, 3);
INSERT INTO `area` VALUES (150123, 150100, '和林格尔县', 2, 0, 3);
INSERT INTO `area` VALUES (150124, 150100, '清水河县', 2, 0, 3);
INSERT INTO `area` VALUES (150125, 150100, '武川县', 2, 0, 3);
INSERT INTO `area` VALUES (150126, 150100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (150200, 150000, '包头市', 2, 0, 2);
INSERT INTO `area` VALUES (150202, 150200, '东河区', 2, 0, 3);
INSERT INTO `area` VALUES (150203, 150200, '昆都仑区', 2, 0, 3);
INSERT INTO `area` VALUES (150204, 150200, '青山区', 2, 0, 3);
INSERT INTO `area` VALUES (150205, 150200, '石拐区', 2, 0, 3);
INSERT INTO `area` VALUES (150206, 150200, '白云鄂博矿区', 2, 0, 3);
INSERT INTO `area` VALUES (150207, 150200, '九原区', 2, 0, 3);
INSERT INTO `area` VALUES (150221, 150200, '土默特右旗', 2, 0, 3);
INSERT INTO `area` VALUES (150222, 150200, '固阳县', 2, 0, 3);
INSERT INTO `area` VALUES (150223, 150200, '达尔罕茂明安联合旗', 2, 0, 3);
INSERT INTO `area` VALUES (150224, 150200, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (150300, 150000, '乌海市', 2, 0, 2);
INSERT INTO `area` VALUES (150302, 150300, '海勃湾区', 2, 0, 3);
INSERT INTO `area` VALUES (150303, 150300, '海南区', 2, 0, 3);
INSERT INTO `area` VALUES (150304, 150300, '乌达区', 2, 0, 3);
INSERT INTO `area` VALUES (150305, 150300, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (150400, 150000, '赤峰市', 2, 0, 2);
INSERT INTO `area` VALUES (150402, 150400, '红山区', 2, 0, 3);
INSERT INTO `area` VALUES (150403, 150400, '元宝山区', 2, 0, 3);
INSERT INTO `area` VALUES (150404, 150400, '松山区', 2, 0, 3);
INSERT INTO `area` VALUES (150421, 150400, '阿鲁科尔沁旗', 2, 0, 3);
INSERT INTO `area` VALUES (150422, 150400, '巴林左旗', 2, 0, 3);
INSERT INTO `area` VALUES (150423, 150400, '巴林右旗', 2, 0, 3);
INSERT INTO `area` VALUES (150424, 150400, '林西县', 2, 0, 3);
INSERT INTO `area` VALUES (150425, 150400, '克什克腾旗', 2, 0, 3);
INSERT INTO `area` VALUES (150426, 150400, '翁牛特旗', 2, 0, 3);
INSERT INTO `area` VALUES (150428, 150400, '喀喇沁旗', 2, 0, 3);
INSERT INTO `area` VALUES (150429, 150400, '宁城县', 2, 0, 3);
INSERT INTO `area` VALUES (150430, 150400, '敖汉旗', 2, 0, 3);
INSERT INTO `area` VALUES (150431, 150400, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (150500, 150000, '通辽市', 2, 0, 2);
INSERT INTO `area` VALUES (150502, 150500, '科尔沁区', 2, 0, 3);
INSERT INTO `area` VALUES (150521, 150500, '科尔沁左翼中旗', 2, 0, 3);
INSERT INTO `area` VALUES (150522, 150500, '科尔沁左翼后旗', 2, 0, 3);
INSERT INTO `area` VALUES (150523, 150500, '开鲁县', 2, 0, 3);
INSERT INTO `area` VALUES (150524, 150500, '库伦旗', 2, 0, 3);
INSERT INTO `area` VALUES (150525, 150500, '奈曼旗', 2, 0, 3);
INSERT INTO `area` VALUES (150526, 150500, '扎鲁特旗', 2, 0, 3);
INSERT INTO `area` VALUES (150581, 150500, '霍林郭勒市', 2, 0, 3);
INSERT INTO `area` VALUES (150582, 150500, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (150600, 150000, '鄂尔多斯市', 2, 0, 2);
INSERT INTO `area` VALUES (150602, 150600, '东胜区', 2, 0, 3);
INSERT INTO `area` VALUES (150621, 150600, '达拉特旗', 2, 0, 3);
INSERT INTO `area` VALUES (150622, 150600, '准格尔旗', 2, 0, 3);
INSERT INTO `area` VALUES (150623, 150600, '鄂托克前旗', 2, 0, 3);
INSERT INTO `area` VALUES (150624, 150600, '鄂托克旗', 2, 0, 3);
INSERT INTO `area` VALUES (150625, 150600, '杭锦旗', 2, 0, 3);
INSERT INTO `area` VALUES (150626, 150600, '乌审旗', 2, 0, 3);
INSERT INTO `area` VALUES (150627, 150600, '伊金霍洛旗', 2, 0, 3);
INSERT INTO `area` VALUES (150628, 150600, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (150700, 150000, '呼伦贝尔市', 2, 0, 2);
INSERT INTO `area` VALUES (150702, 150700, '海拉尔区', 2, 0, 3);
INSERT INTO `area` VALUES (150703, 150700, '扎赉诺尔区', 2, 0, 3);
INSERT INTO `area` VALUES (150721, 150700, '阿荣旗', 2, 0, 3);
INSERT INTO `area` VALUES (150722, 150700, '莫力达瓦达斡尔族自治旗', 2, 0, 3);
INSERT INTO `area` VALUES (150723, 150700, '鄂伦春自治旗', 2, 0, 3);
INSERT INTO `area` VALUES (150724, 150700, '鄂温克族自治旗', 2, 0, 3);
INSERT INTO `area` VALUES (150725, 150700, '陈巴尔虎旗', 2, 0, 3);
INSERT INTO `area` VALUES (150726, 150700, '新巴尔虎左旗', 2, 0, 3);
INSERT INTO `area` VALUES (150727, 150700, '新巴尔虎右旗', 2, 0, 3);
INSERT INTO `area` VALUES (150781, 150700, '满洲里市', 2, 0, 3);
INSERT INTO `area` VALUES (150782, 150700, '牙克石市', 2, 0, 3);
INSERT INTO `area` VALUES (150783, 150700, '扎兰屯市', 2, 0, 3);
INSERT INTO `area` VALUES (150784, 150700, '额尔古纳市', 2, 0, 3);
INSERT INTO `area` VALUES (150785, 150700, '根河市', 2, 0, 3);
INSERT INTO `area` VALUES (150786, 150700, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (150800, 150000, '巴彦淖尔市', 2, 0, 2);
INSERT INTO `area` VALUES (150802, 150800, '临河区', 2, 0, 3);
INSERT INTO `area` VALUES (150821, 150800, '五原县', 2, 0, 3);
INSERT INTO `area` VALUES (150822, 150800, '磴口县', 2, 0, 3);
INSERT INTO `area` VALUES (150823, 150800, '乌拉特前旗', 2, 0, 3);
INSERT INTO `area` VALUES (150824, 150800, '乌拉特中旗', 2, 0, 3);
INSERT INTO `area` VALUES (150825, 150800, '乌拉特后旗', 2, 0, 3);
INSERT INTO `area` VALUES (150826, 150800, '杭锦后旗', 2, 0, 3);
INSERT INTO `area` VALUES (150827, 150800, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (150900, 150000, '乌兰察布市', 2, 0, 2);
INSERT INTO `area` VALUES (150902, 150900, '集宁区', 2, 0, 3);
INSERT INTO `area` VALUES (150921, 150900, '卓资县', 2, 0, 3);
INSERT INTO `area` VALUES (150922, 150900, '化德县', 2, 0, 3);
INSERT INTO `area` VALUES (150923, 150900, '商都县', 2, 0, 3);
INSERT INTO `area` VALUES (150924, 150900, '兴和县', 2, 0, 3);
INSERT INTO `area` VALUES (150925, 150900, '凉城县', 2, 0, 3);
INSERT INTO `area` VALUES (150926, 150900, '察哈尔右翼前旗', 2, 0, 3);
INSERT INTO `area` VALUES (150927, 150900, '察哈尔右翼中旗', 2, 0, 3);
INSERT INTO `area` VALUES (150928, 150900, '察哈尔右翼后旗', 2, 0, 3);
INSERT INTO `area` VALUES (150929, 150900, '四子王旗', 2, 0, 3);
INSERT INTO `area` VALUES (150981, 150900, '丰镇市', 2, 0, 3);
INSERT INTO `area` VALUES (150982, 150900, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (152200, 150000, '兴安盟', 2, 0, 2);
INSERT INTO `area` VALUES (152201, 152200, '乌兰浩特市', 2, 0, 3);
INSERT INTO `area` VALUES (152202, 152200, '阿尔山市', 2, 0, 3);
INSERT INTO `area` VALUES (152221, 152200, '科尔沁右翼前旗', 2, 0, 3);
INSERT INTO `area` VALUES (152222, 152200, '科尔沁右翼中旗', 2, 0, 3);
INSERT INTO `area` VALUES (152223, 152200, '扎赉特旗', 2, 0, 3);
INSERT INTO `area` VALUES (152224, 152200, '突泉县', 2, 0, 3);
INSERT INTO `area` VALUES (152225, 152200, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (152500, 150000, '锡林郭勒盟', 2, 0, 2);
INSERT INTO `area` VALUES (152501, 152500, '二连浩特市', 2, 0, 3);
INSERT INTO `area` VALUES (152502, 152500, '锡林浩特市', 2, 0, 3);
INSERT INTO `area` VALUES (152522, 152500, '阿巴嘎旗', 2, 0, 3);
INSERT INTO `area` VALUES (152523, 152500, '苏尼特左旗', 2, 0, 3);
INSERT INTO `area` VALUES (152524, 152500, '苏尼特右旗', 2, 0, 3);
INSERT INTO `area` VALUES (152525, 152500, '东乌珠穆沁旗', 2, 0, 3);
INSERT INTO `area` VALUES (152526, 152500, '西乌珠穆沁旗', 2, 0, 3);
INSERT INTO `area` VALUES (152527, 152500, '太仆寺旗', 2, 0, 3);
INSERT INTO `area` VALUES (152528, 152500, '镶黄旗', 2, 0, 3);
INSERT INTO `area` VALUES (152529, 152500, '正镶白旗', 2, 0, 3);
INSERT INTO `area` VALUES (152530, 152500, '正蓝旗', 2, 0, 3);
INSERT INTO `area` VALUES (152531, 152500, '多伦县', 2, 0, 3);
INSERT INTO `area` VALUES (152532, 152500, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (152900, 150000, '阿拉善盟', 2, 0, 2);
INSERT INTO `area` VALUES (152921, 152900, '阿拉善左旗', 2, 0, 3);
INSERT INTO `area` VALUES (152922, 152900, '阿拉善右旗', 2, 0, 3);
INSERT INTO `area` VALUES (152923, 152900, '额济纳旗', 2, 0, 3);
INSERT INTO `area` VALUES (152924, 152900, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (210000, 0, '辽宁省', 2, 0, 1);
INSERT INTO `area` VALUES (210100, 210000, '沈阳市', 2, 0, 2);
INSERT INTO `area` VALUES (210102, 210100, '和平区', 2, 0, 3);
INSERT INTO `area` VALUES (210103, 210100, '沈河区', 2, 0, 3);
INSERT INTO `area` VALUES (210104, 210100, '大东区', 2, 0, 3);
INSERT INTO `area` VALUES (210105, 210100, '皇姑区', 2, 0, 3);
INSERT INTO `area` VALUES (210106, 210100, '铁西区', 2, 0, 3);
INSERT INTO `area` VALUES (210111, 210100, '苏家屯区', 2, 0, 3);
INSERT INTO `area` VALUES (210112, 210100, '浑南区', 2, 0, 3);
INSERT INTO `area` VALUES (210113, 210100, '沈北新区', 2, 0, 3);
INSERT INTO `area` VALUES (210114, 210100, '于洪区', 2, 0, 3);
INSERT INTO `area` VALUES (210122, 210100, '辽中县', 2, 0, 3);
INSERT INTO `area` VALUES (210123, 210100, '康平县', 2, 0, 3);
INSERT INTO `area` VALUES (210124, 210100, '法库县', 2, 0, 3);
INSERT INTO `area` VALUES (210181, 210100, '新民市', 2, 0, 3);
INSERT INTO `area` VALUES (210182, 210100, '浑南新区', 2, 0, 3);
INSERT INTO `area` VALUES (210183, 210100, '张士开发区', 2, 0, 3);
INSERT INTO `area` VALUES (210184, 210100, '沈北新区', 2, 0, 3);
INSERT INTO `area` VALUES (210185, 210100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (210200, 210000, '大连市', 2, 0, 2);
INSERT INTO `area` VALUES (210202, 210200, '中山区', 2, 0, 3);
INSERT INTO `area` VALUES (210203, 210200, '西岗区', 2, 0, 3);
INSERT INTO `area` VALUES (210204, 210200, '沙河口区', 2, 0, 3);
INSERT INTO `area` VALUES (210211, 210200, '甘井子区', 2, 0, 3);
INSERT INTO `area` VALUES (210212, 210200, '旅顺口区', 2, 0, 3);
INSERT INTO `area` VALUES (210213, 210200, '金州区', 2, 0, 3);
INSERT INTO `area` VALUES (210224, 210200, '长海县', 2, 0, 3);
INSERT INTO `area` VALUES (210251, 210200, '开发区', 2, 0, 3);
INSERT INTO `area` VALUES (210281, 210200, '瓦房店市', 2, 0, 3);
INSERT INTO `area` VALUES (210282, 210200, '普兰店市', 2, 0, 3);
INSERT INTO `area` VALUES (210283, 210200, '庄河市', 2, 0, 3);
INSERT INTO `area` VALUES (210297, 210200, '岭前区', 2, 0, 3);
INSERT INTO `area` VALUES (210298, 210200, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (210300, 210000, '鞍山市', 2, 0, 2);
INSERT INTO `area` VALUES (210302, 210300, '铁东区', 2, 0, 3);
INSERT INTO `area` VALUES (210303, 210300, '铁西区', 2, 0, 3);
INSERT INTO `area` VALUES (210304, 210300, '立山区', 2, 0, 3);
INSERT INTO `area` VALUES (210311, 210300, '千山区', 2, 0, 3);
INSERT INTO `area` VALUES (210321, 210300, '台安县', 2, 0, 3);
INSERT INTO `area` VALUES (210323, 210300, '岫岩满族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (210351, 210300, '高新区', 2, 0, 3);
INSERT INTO `area` VALUES (210381, 210300, '海城市', 2, 0, 3);
INSERT INTO `area` VALUES (210382, 210300, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (210400, 210000, '抚顺市', 2, 0, 2);
INSERT INTO `area` VALUES (210402, 210400, '新抚区', 2, 0, 3);
INSERT INTO `area` VALUES (210403, 210400, '东洲区', 2, 0, 3);
INSERT INTO `area` VALUES (210404, 210400, '望花区', 2, 0, 3);
INSERT INTO `area` VALUES (210411, 210400, '顺城区', 2, 0, 3);
INSERT INTO `area` VALUES (210421, 210400, '抚顺县', 2, 0, 3);
INSERT INTO `area` VALUES (210422, 210400, '新宾满族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (210423, 210400, '清原满族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (210424, 210400, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (210500, 210000, '本溪市', 2, 0, 2);
INSERT INTO `area` VALUES (210502, 210500, '平山区', 2, 0, 3);
INSERT INTO `area` VALUES (210503, 210500, '溪湖区', 2, 0, 3);
INSERT INTO `area` VALUES (210504, 210500, '明山区', 2, 0, 3);
INSERT INTO `area` VALUES (210505, 210500, '南芬区', 2, 0, 3);
INSERT INTO `area` VALUES (210521, 210500, '本溪满族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (210522, 210500, '桓仁满族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (210523, 210500, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (210600, 210000, '丹东市', 2, 0, 2);
INSERT INTO `area` VALUES (210602, 210600, '元宝区', 2, 0, 3);
INSERT INTO `area` VALUES (210603, 210600, '振兴区', 2, 0, 3);
INSERT INTO `area` VALUES (210604, 210600, '振安区', 2, 0, 3);
INSERT INTO `area` VALUES (210624, 210600, '宽甸满族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (210681, 210600, '东港市', 2, 0, 3);
INSERT INTO `area` VALUES (210682, 210600, '凤城市', 2, 0, 3);
INSERT INTO `area` VALUES (210683, 210600, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (210700, 210000, '锦州市', 2, 0, 2);
INSERT INTO `area` VALUES (210702, 210700, '古塔区', 2, 0, 3);
INSERT INTO `area` VALUES (210703, 210700, '凌河区', 2, 0, 3);
INSERT INTO `area` VALUES (210711, 210700, '太和区', 2, 0, 3);
INSERT INTO `area` VALUES (210726, 210700, '黑山县', 2, 0, 3);
INSERT INTO `area` VALUES (210727, 210700, '义县', 2, 0, 3);
INSERT INTO `area` VALUES (210781, 210700, '凌海市', 2, 0, 3);
INSERT INTO `area` VALUES (210782, 210700, '北镇市', 2, 0, 3);
INSERT INTO `area` VALUES (210783, 210700, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (210800, 210000, '营口市', 2, 0, 2);
INSERT INTO `area` VALUES (210802, 210800, '站前区', 2, 0, 3);
INSERT INTO `area` VALUES (210803, 210800, '西市区', 2, 0, 3);
INSERT INTO `area` VALUES (210804, 210800, '鲅鱼圈区', 2, 0, 3);
INSERT INTO `area` VALUES (210811, 210800, '老边区', 2, 0, 3);
INSERT INTO `area` VALUES (210881, 210800, '盖州市', 2, 0, 3);
INSERT INTO `area` VALUES (210882, 210800, '大石桥市', 2, 0, 3);
INSERT INTO `area` VALUES (210883, 210800, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (210900, 210000, '阜新市', 2, 0, 2);
INSERT INTO `area` VALUES (210902, 210900, '海州区', 2, 0, 3);
INSERT INTO `area` VALUES (210903, 210900, '新邱区', 2, 0, 3);
INSERT INTO `area` VALUES (210904, 210900, '太平区', 2, 0, 3);
INSERT INTO `area` VALUES (210905, 210900, '清河门区', 2, 0, 3);
INSERT INTO `area` VALUES (210911, 210900, '细河区', 2, 0, 3);
INSERT INTO `area` VALUES (210921, 210900, '阜新蒙古族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (210922, 210900, '彰武县', 2, 0, 3);
INSERT INTO `area` VALUES (210923, 210900, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (211000, 210000, '辽阳市', 2, 0, 2);
INSERT INTO `area` VALUES (211002, 211000, '白塔区', 2, 0, 3);
INSERT INTO `area` VALUES (211003, 211000, '文圣区', 2, 0, 3);
INSERT INTO `area` VALUES (211004, 211000, '宏伟区', 2, 0, 3);
INSERT INTO `area` VALUES (211005, 211000, '弓长岭区', 2, 0, 3);
INSERT INTO `area` VALUES (211011, 211000, '太子河区', 2, 0, 3);
INSERT INTO `area` VALUES (211021, 211000, '辽阳县', 2, 0, 3);
INSERT INTO `area` VALUES (211081, 211000, '灯塔市', 2, 0, 3);
INSERT INTO `area` VALUES (211082, 211000, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (211100, 210000, '盘锦市', 2, 0, 2);
INSERT INTO `area` VALUES (211102, 211100, '双台子区', 2, 0, 3);
INSERT INTO `area` VALUES (211103, 211100, '兴隆台区', 2, 0, 3);
INSERT INTO `area` VALUES (211121, 211100, '大洼县', 2, 0, 3);
INSERT INTO `area` VALUES (211122, 211100, '盘山县', 2, 0, 3);
INSERT INTO `area` VALUES (211123, 211100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (211200, 210000, '铁岭市', 2, 0, 2);
INSERT INTO `area` VALUES (211202, 211200, '银州区', 2, 0, 3);
INSERT INTO `area` VALUES (211204, 211200, '清河区', 2, 0, 3);
INSERT INTO `area` VALUES (211221, 211200, '铁岭县', 2, 0, 3);
INSERT INTO `area` VALUES (211223, 211200, '西丰县', 2, 0, 3);
INSERT INTO `area` VALUES (211224, 211200, '昌图县', 2, 0, 3);
INSERT INTO `area` VALUES (211281, 211200, '调兵山市', 2, 0, 3);
INSERT INTO `area` VALUES (211282, 211200, '开原市', 2, 0, 3);
INSERT INTO `area` VALUES (211283, 211200, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (211300, 210000, '朝阳市', 2, 0, 2);
INSERT INTO `area` VALUES (211302, 211300, '双塔区', 2, 0, 3);
INSERT INTO `area` VALUES (211303, 211300, '龙城区', 2, 0, 3);
INSERT INTO `area` VALUES (211321, 211300, '朝阳县', 2, 0, 3);
INSERT INTO `area` VALUES (211322, 211300, '建平县', 2, 0, 3);
INSERT INTO `area` VALUES (211324, 211300, '喀喇沁左翼蒙古族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (211381, 211300, '北票市', 2, 0, 3);
INSERT INTO `area` VALUES (211382, 211300, '凌源市', 2, 0, 3);
INSERT INTO `area` VALUES (211383, 211300, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (211400, 210000, '葫芦岛市', 2, 0, 2);
INSERT INTO `area` VALUES (211402, 211400, '连山区', 2, 0, 3);
INSERT INTO `area` VALUES (211403, 211400, '龙港区', 2, 0, 3);
INSERT INTO `area` VALUES (211404, 211400, '南票区', 2, 0, 3);
INSERT INTO `area` VALUES (211421, 211400, '绥中县', 2, 0, 3);
INSERT INTO `area` VALUES (211422, 211400, '建昌县', 2, 0, 3);
INSERT INTO `area` VALUES (211481, 211400, '兴城市', 2, 0, 3);
INSERT INTO `area` VALUES (211482, 211400, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (220000, 0, '吉林省', 2, 0, 1);
INSERT INTO `area` VALUES (220100, 220000, '长春市', 2, 0, 2);
INSERT INTO `area` VALUES (220102, 220100, '南关区', 2, 0, 3);
INSERT INTO `area` VALUES (220103, 220100, '宽城区', 2, 0, 3);
INSERT INTO `area` VALUES (220104, 220100, '朝阳区', 2, 0, 3);
INSERT INTO `area` VALUES (220105, 220100, '二道区', 2, 0, 3);
INSERT INTO `area` VALUES (220106, 220100, '绿园区', 2, 0, 3);
INSERT INTO `area` VALUES (220112, 220100, '双阳区', 2, 0, 3);
INSERT INTO `area` VALUES (220113, 220100, '九台区', 2, 0, 3);
INSERT INTO `area` VALUES (220122, 220100, '农安县', 2, 0, 3);
INSERT INTO `area` VALUES (220181, 220100, '九台市', 2, 0, 3);
INSERT INTO `area` VALUES (220182, 220100, '榆树市', 2, 0, 3);
INSERT INTO `area` VALUES (220183, 220100, '德惠市', 2, 0, 3);
INSERT INTO `area` VALUES (220184, 220100, '高新技术产业开发区', 2, 0, 3);
INSERT INTO `area` VALUES (220185, 220100, '汽车产业开发区', 2, 0, 3);
INSERT INTO `area` VALUES (220186, 220100, '经济技术开发区', 2, 0, 3);
INSERT INTO `area` VALUES (220187, 220100, '净月旅游开发区', 2, 0, 3);
INSERT INTO `area` VALUES (220188, 220100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (220200, 220000, '吉林市', 2, 0, 2);
INSERT INTO `area` VALUES (220202, 220200, '昌邑区', 2, 0, 3);
INSERT INTO `area` VALUES (220203, 220200, '龙潭区', 2, 0, 3);
INSERT INTO `area` VALUES (220204, 220200, '船营区', 2, 0, 3);
INSERT INTO `area` VALUES (220211, 220200, '丰满区', 2, 0, 3);
INSERT INTO `area` VALUES (220221, 220200, '永吉县', 2, 0, 3);
INSERT INTO `area` VALUES (220281, 220200, '蛟河市', 2, 0, 3);
INSERT INTO `area` VALUES (220282, 220200, '桦甸市', 2, 0, 3);
INSERT INTO `area` VALUES (220283, 220200, '舒兰市', 2, 0, 3);
INSERT INTO `area` VALUES (220284, 220200, '磐石市', 2, 0, 3);
INSERT INTO `area` VALUES (220285, 220200, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (220300, 220000, '四平市', 2, 0, 2);
INSERT INTO `area` VALUES (220302, 220300, '铁西区', 2, 0, 3);
INSERT INTO `area` VALUES (220303, 220300, '铁东区', 2, 0, 3);
INSERT INTO `area` VALUES (220322, 220300, '梨树县', 2, 0, 3);
INSERT INTO `area` VALUES (220323, 220300, '伊通满族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (220381, 220300, '公主岭市', 2, 0, 3);
INSERT INTO `area` VALUES (220382, 220300, '双辽市', 2, 0, 3);
INSERT INTO `area` VALUES (220383, 220300, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (220400, 220000, '辽源市', 2, 0, 2);
INSERT INTO `area` VALUES (220402, 220400, '龙山区', 2, 0, 3);
INSERT INTO `area` VALUES (220403, 220400, '西安区', 2, 0, 3);
INSERT INTO `area` VALUES (220421, 220400, '东丰县', 2, 0, 3);
INSERT INTO `area` VALUES (220422, 220400, '东辽县', 2, 0, 3);
INSERT INTO `area` VALUES (220423, 220400, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (220500, 220000, '通化市', 2, 0, 2);
INSERT INTO `area` VALUES (220502, 220500, '东昌区', 2, 0, 3);
INSERT INTO `area` VALUES (220503, 220500, '二道江区', 2, 0, 3);
INSERT INTO `area` VALUES (220521, 220500, '通化县', 2, 0, 3);
INSERT INTO `area` VALUES (220523, 220500, '辉南县', 2, 0, 3);
INSERT INTO `area` VALUES (220524, 220500, '柳河县', 2, 0, 3);
INSERT INTO `area` VALUES (220581, 220500, '梅河口市', 2, 0, 3);
INSERT INTO `area` VALUES (220582, 220500, '集安市', 2, 0, 3);
INSERT INTO `area` VALUES (220583, 220500, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (220600, 220000, '白山市', 2, 0, 2);
INSERT INTO `area` VALUES (220602, 220600, '浑江区', 2, 0, 3);
INSERT INTO `area` VALUES (220605, 220600, '江源区', 2, 0, 3);
INSERT INTO `area` VALUES (220621, 220600, '抚松县', 2, 0, 3);
INSERT INTO `area` VALUES (220622, 220600, '靖宇县', 2, 0, 3);
INSERT INTO `area` VALUES (220623, 220600, '长白朝鲜族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (220625, 220600, '江源县', 2, 0, 3);
INSERT INTO `area` VALUES (220681, 220600, '临江市', 2, 0, 3);
INSERT INTO `area` VALUES (220682, 220600, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (220700, 220000, '松原市', 2, 0, 2);
INSERT INTO `area` VALUES (220702, 220700, '宁江区', 2, 0, 3);
INSERT INTO `area` VALUES (220721, 220700, '前郭尔罗斯蒙古族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (220722, 220700, '长岭县', 2, 0, 3);
INSERT INTO `area` VALUES (220723, 220700, '乾安县', 2, 0, 3);
INSERT INTO `area` VALUES (220724, 220700, '扶余县', 2, 0, 3);
INSERT INTO `area` VALUES (220725, 220700, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (220781, 220700, '扶余市', 2, 0, 3);
INSERT INTO `area` VALUES (220800, 220000, '白城市', 2, 0, 2);
INSERT INTO `area` VALUES (220802, 220800, '洮北区', 2, 0, 3);
INSERT INTO `area` VALUES (220821, 220800, '镇赉县', 2, 0, 3);
INSERT INTO `area` VALUES (220822, 220800, '通榆县', 2, 0, 3);
INSERT INTO `area` VALUES (220881, 220800, '洮南市', 2, 0, 3);
INSERT INTO `area` VALUES (220882, 220800, '大安市', 2, 0, 3);
INSERT INTO `area` VALUES (220883, 220800, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (222400, 220000, '延边朝鲜族自治州', 2, 0, 2);
INSERT INTO `area` VALUES (222401, 222400, '延吉市', 2, 0, 3);
INSERT INTO `area` VALUES (222402, 222400, '图们市', 2, 0, 3);
INSERT INTO `area` VALUES (222403, 222400, '敦化市', 2, 0, 3);
INSERT INTO `area` VALUES (222404, 222400, '珲春市', 2, 0, 3);
INSERT INTO `area` VALUES (222405, 222400, '龙井市', 2, 0, 3);
INSERT INTO `area` VALUES (222406, 222400, '和龙市', 2, 0, 3);
INSERT INTO `area` VALUES (222424, 222400, '汪清县', 2, 0, 3);
INSERT INTO `area` VALUES (222426, 222400, '安图县', 2, 0, 3);
INSERT INTO `area` VALUES (222427, 222400, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (230000, 0, '黑龙江省', 2, 0, 1);
INSERT INTO `area` VALUES (230100, 230000, '哈尔滨市', 2, 0, 2);
INSERT INTO `area` VALUES (230102, 230100, '道里区', 2, 0, 3);
INSERT INTO `area` VALUES (230103, 230100, '南岗区', 2, 0, 3);
INSERT INTO `area` VALUES (230104, 230100, '道外区', 2, 0, 3);
INSERT INTO `area` VALUES (230106, 230100, '香坊区', 2, 0, 3);
INSERT INTO `area` VALUES (230107, 230100, '动力区', 2, 0, 3);
INSERT INTO `area` VALUES (230108, 230100, '平房区', 2, 0, 3);
INSERT INTO `area` VALUES (230109, 230100, '松北区', 2, 0, 3);
INSERT INTO `area` VALUES (230110, 230100, '香坊区', 2, 0, 3);
INSERT INTO `area` VALUES (230111, 230100, '呼兰区', 2, 0, 3);
INSERT INTO `area` VALUES (230112, 230100, '阿城区', 2, 0, 3);
INSERT INTO `area` VALUES (230113, 230100, '双城区', 2, 0, 3);
INSERT INTO `area` VALUES (230123, 230100, '依兰县', 2, 0, 3);
INSERT INTO `area` VALUES (230124, 230100, '方正县', 2, 0, 3);
INSERT INTO `area` VALUES (230125, 230100, '宾县', 2, 0, 3);
INSERT INTO `area` VALUES (230126, 230100, '巴彦县', 2, 0, 3);
INSERT INTO `area` VALUES (230127, 230100, '木兰县', 2, 0, 3);
INSERT INTO `area` VALUES (230128, 230100, '通河县', 2, 0, 3);
INSERT INTO `area` VALUES (230129, 230100, '延寿县', 2, 0, 3);
INSERT INTO `area` VALUES (230181, 230100, '阿城市', 2, 0, 3);
INSERT INTO `area` VALUES (230182, 230100, '双城市', 2, 0, 3);
INSERT INTO `area` VALUES (230183, 230100, '尚志市', 2, 0, 3);
INSERT INTO `area` VALUES (230184, 230100, '五常市', 2, 0, 3);
INSERT INTO `area` VALUES (230185, 230100, '阿城市', 2, 0, 3);
INSERT INTO `area` VALUES (230186, 230100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (230200, 230000, '齐齐哈尔市', 2, 0, 2);
INSERT INTO `area` VALUES (230202, 230200, '龙沙区', 2, 0, 3);
INSERT INTO `area` VALUES (230203, 230200, '建华区', 2, 0, 3);
INSERT INTO `area` VALUES (230204, 230200, '铁锋区', 2, 0, 3);
INSERT INTO `area` VALUES (230205, 230200, '昂昂溪区', 2, 0, 3);
INSERT INTO `area` VALUES (230206, 230200, '富拉尔基区', 2, 0, 3);
INSERT INTO `area` VALUES (230207, 230200, '碾子山区', 2, 0, 3);
INSERT INTO `area` VALUES (230208, 230200, '梅里斯达斡尔族区', 2, 0, 3);
INSERT INTO `area` VALUES (230221, 230200, '龙江县', 2, 0, 3);
INSERT INTO `area` VALUES (230223, 230200, '依安县', 2, 0, 3);
INSERT INTO `area` VALUES (230224, 230200, '泰来县', 2, 0, 3);
INSERT INTO `area` VALUES (230225, 230200, '甘南县', 2, 0, 3);
INSERT INTO `area` VALUES (230227, 230200, '富裕县', 2, 0, 3);
INSERT INTO `area` VALUES (230229, 230200, '克山县', 2, 0, 3);
INSERT INTO `area` VALUES (230230, 230200, '克东县', 2, 0, 3);
INSERT INTO `area` VALUES (230231, 230200, '拜泉县', 2, 0, 3);
INSERT INTO `area` VALUES (230281, 230200, '讷河市', 2, 0, 3);
INSERT INTO `area` VALUES (230282, 230200, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (230300, 230000, '鸡西市', 2, 0, 2);
INSERT INTO `area` VALUES (230302, 230300, '鸡冠区', 2, 0, 3);
INSERT INTO `area` VALUES (230303, 230300, '恒山区', 2, 0, 3);
INSERT INTO `area` VALUES (230304, 230300, '滴道区', 2, 0, 3);
INSERT INTO `area` VALUES (230305, 230300, '梨树区', 2, 0, 3);
INSERT INTO `area` VALUES (230306, 230300, '城子河区', 2, 0, 3);
INSERT INTO `area` VALUES (230307, 230300, '麻山区', 2, 0, 3);
INSERT INTO `area` VALUES (230321, 230300, '鸡东县', 2, 0, 3);
INSERT INTO `area` VALUES (230381, 230300, '虎林市', 2, 0, 3);
INSERT INTO `area` VALUES (230382, 230300, '密山市', 2, 0, 3);
INSERT INTO `area` VALUES (230383, 230300, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (230400, 230000, '鹤岗市', 2, 0, 2);
INSERT INTO `area` VALUES (230402, 230400, '向阳区', 2, 0, 3);
INSERT INTO `area` VALUES (230403, 230400, '工农区', 2, 0, 3);
INSERT INTO `area` VALUES (230404, 230400, '南山区', 2, 0, 3);
INSERT INTO `area` VALUES (230405, 230400, '兴安区', 2, 0, 3);
INSERT INTO `area` VALUES (230406, 230400, '东山区', 2, 0, 3);
INSERT INTO `area` VALUES (230407, 230400, '兴山区', 2, 0, 3);
INSERT INTO `area` VALUES (230421, 230400, '萝北县', 2, 0, 3);
INSERT INTO `area` VALUES (230422, 230400, '绥滨县', 2, 0, 3);
INSERT INTO `area` VALUES (230423, 230400, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (230500, 230000, '双鸭山市', 2, 0, 2);
INSERT INTO `area` VALUES (230502, 230500, '尖山区', 2, 0, 3);
INSERT INTO `area` VALUES (230503, 230500, '岭东区', 2, 0, 3);
INSERT INTO `area` VALUES (230505, 230500, '四方台区', 2, 0, 3);
INSERT INTO `area` VALUES (230506, 230500, '宝山区', 2, 0, 3);
INSERT INTO `area` VALUES (230521, 230500, '集贤县', 2, 0, 3);
INSERT INTO `area` VALUES (230522, 230500, '友谊县', 2, 0, 3);
INSERT INTO `area` VALUES (230523, 230500, '宝清县', 2, 0, 3);
INSERT INTO `area` VALUES (230524, 230500, '饶河县', 2, 0, 3);
INSERT INTO `area` VALUES (230525, 230500, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (230600, 230000, '大庆市', 2, 0, 2);
INSERT INTO `area` VALUES (230602, 230600, '萨尔图区', 2, 0, 3);
INSERT INTO `area` VALUES (230603, 230600, '龙凤区', 2, 0, 3);
INSERT INTO `area` VALUES (230604, 230600, '让胡路区', 2, 0, 3);
INSERT INTO `area` VALUES (230605, 230600, '红岗区', 2, 0, 3);
INSERT INTO `area` VALUES (230606, 230600, '大同区', 2, 0, 3);
INSERT INTO `area` VALUES (230621, 230600, '肇州县', 2, 0, 3);
INSERT INTO `area` VALUES (230622, 230600, '肇源县', 2, 0, 3);
INSERT INTO `area` VALUES (230623, 230600, '林甸县', 2, 0, 3);
INSERT INTO `area` VALUES (230624, 230600, '杜尔伯特蒙古族自治县', 2, 0, 3);
INSERT INTO `area` VALUES (230625, 230600, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (230700, 230000, '伊春市', 2, 0, 2);
INSERT INTO `area` VALUES (230702, 230700, '伊春区', 2, 0, 3);
INSERT INTO `area` VALUES (230703, 230700, '南岔区', 2, 0, 3);
INSERT INTO `area` VALUES (230704, 230700, '友好区', 2, 0, 3);
INSERT INTO `area` VALUES (230705, 230700, '西林区', 2, 0, 3);
INSERT INTO `area` VALUES (230706, 230700, '翠峦区', 2, 0, 3);
INSERT INTO `area` VALUES (230707, 230700, '新青区', 2, 0, 3);
INSERT INTO `area` VALUES (230708, 230700, '美溪区', 2, 0, 3);
INSERT INTO `area` VALUES (230709, 230700, '金山屯区', 2, 0, 3);
INSERT INTO `area` VALUES (230710, 230700, '五营区', 2, 0, 3);
INSERT INTO `area` VALUES (230711, 230700, '乌马河区', 2, 0, 3);
INSERT INTO `area` VALUES (230712, 230700, '汤旺河区', 2, 0, 3);
INSERT INTO `area` VALUES (230713, 230700, '带岭区', 2, 0, 3);
INSERT INTO `area` VALUES (230714, 230700, '乌伊岭区', 2, 0, 3);
INSERT INTO `area` VALUES (230715, 230700, '红星区', 2, 0, 3);
INSERT INTO `area` VALUES (230716, 230700, '上甘岭区', 2, 0, 3);
INSERT INTO `area` VALUES (230722, 230700, '嘉荫县', 2, 0, 3);
INSERT INTO `area` VALUES (230781, 230700, '铁力市', 2, 0, 3);
INSERT INTO `area` VALUES (230782, 230700, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (230800, 230000, '佳木斯市', 2, 0, 2);
INSERT INTO `area` VALUES (230802, 230800, '永红区', 2, 0, 3);
INSERT INTO `area` VALUES (230803, 230800, '向阳区', 2, 0, 3);
INSERT INTO `area` VALUES (230804, 230800, '前进区', 2, 0, 3);
INSERT INTO `area` VALUES (230805, 230800, '东风区', 2, 0, 3);
INSERT INTO `area` VALUES (230811, 230800, '郊区', 2, 0, 3);
INSERT INTO `area` VALUES (230822, 230800, '桦南县', 2, 0, 3);
INSERT INTO `area` VALUES (230826, 230800, '桦川县', 2, 0, 3);
INSERT INTO `area` VALUES (230828, 230800, '汤原县', 2, 0, 3);
INSERT INTO `area` VALUES (230833, 230800, '抚远县', 2, 0, 3);
INSERT INTO `area` VALUES (230881, 230800, '同江市', 2, 0, 3);
INSERT INTO `area` VALUES (230882, 230800, '富锦市', 2, 0, 3);
INSERT INTO `area` VALUES (230883, 230800, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (230900, 230000, '七台河市', 2, 0, 2);
INSERT INTO `area` VALUES (230902, 230900, '新兴区', 2, 0, 3);
INSERT INTO `area` VALUES (230903, 230900, '桃山区', 2, 0, 3);
INSERT INTO `area` VALUES (230904, 230900, '茄子河区', 2, 0, 3);
INSERT INTO `area` VALUES (230921, 230900, '勃利县', 2, 0, 3);
INSERT INTO `area` VALUES (230922, 230900, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (231000, 230000, '牡丹江市', 2, 0, 2);
INSERT INTO `area` VALUES (231002, 231000, '东安区', 2, 0, 3);
INSERT INTO `area` VALUES (231003, 231000, '阳明区', 2, 0, 3);
INSERT INTO `area` VALUES (231004, 231000, '爱民区', 2, 0, 3);
INSERT INTO `area` VALUES (231005, 231000, '西安区', 2, 0, 3);
INSERT INTO `area` VALUES (231024, 231000, '东宁县', 2, 0, 3);
INSERT INTO `area` VALUES (231025, 231000, '林口县', 2, 0, 3);
INSERT INTO `area` VALUES (231081, 231000, '绥芬河市', 2, 0, 3);
INSERT INTO `area` VALUES (231083, 231000, '海林市', 2, 0, 3);
INSERT INTO `area` VALUES (231084, 231000, '宁安市', 2, 0, 3);
INSERT INTO `area` VALUES (231085, 231000, '穆棱市', 2, 0, 3);
INSERT INTO `area` VALUES (231086, 231000, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (231100, 230000, '黑河市', 2, 0, 2);
INSERT INTO `area` VALUES (231102, 231100, '爱辉区', 2, 0, 3);
INSERT INTO `area` VALUES (231121, 231100, '嫩江县', 2, 0, 3);
INSERT INTO `area` VALUES (231123, 231100, '逊克县', 2, 0, 3);
INSERT INTO `area` VALUES (231124, 231100, '孙吴县', 2, 0, 3);
INSERT INTO `area` VALUES (231181, 231100, '北安市', 2, 0, 3);
INSERT INTO `area` VALUES (231182, 231100, '五大连池市', 2, 0, 3);
INSERT INTO `area` VALUES (231183, 231100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (231200, 230000, '绥化市', 2, 0, 2);
INSERT INTO `area` VALUES (231202, 231200, '北林区', 2, 0, 3);
INSERT INTO `area` VALUES (231221, 231200, '望奎县', 2, 0, 3);
INSERT INTO `area` VALUES (231222, 231200, '兰西县', 2, 0, 3);
INSERT INTO `area` VALUES (231223, 231200, '青冈县', 2, 0, 3);
INSERT INTO `area` VALUES (231224, 231200, '庆安县', 2, 0, 3);
INSERT INTO `area` VALUES (231225, 231200, '明水县', 2, 0, 3);
INSERT INTO `area` VALUES (231226, 231200, '绥棱县', 2, 0, 3);
INSERT INTO `area` VALUES (231281, 231200, '安达市', 2, 0, 3);
INSERT INTO `area` VALUES (231282, 231200, '肇东市', 2, 0, 3);
INSERT INTO `area` VALUES (231283, 231200, '海伦市', 2, 0, 3);
INSERT INTO `area` VALUES (231284, 231200, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (232700, 230000, '大兴安岭地区', 2, 0, 2);
INSERT INTO `area` VALUES (232721, 232700, '呼玛县', 2, 0, 3);
INSERT INTO `area` VALUES (232722, 232700, '塔河县', 2, 0, 3);
INSERT INTO `area` VALUES (232723, 232700, '漠河县', 2, 0, 3);
INSERT INTO `area` VALUES (232724, 232700, '加格达奇区', 2, 0, 3);
INSERT INTO `area` VALUES (232725, 232700, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (310000, 0, '上海市', 2, 0, 1);
INSERT INTO `area` VALUES (310100, 310000, '上海市', 2, 0, 2);
INSERT INTO `area` VALUES (310101, 310100, '黄浦区', 2, 0, 3);
INSERT INTO `area` VALUES (310103, 310100, '卢湾区', 2, 0, 3);
INSERT INTO `area` VALUES (310104, 310100, '徐汇区', 2, 0, 3);
INSERT INTO `area` VALUES (310105, 310100, '长宁区', 2, 0, 3);
INSERT INTO `area` VALUES (310106, 310100, '静安区', 2, 0, 3);
INSERT INTO `area` VALUES (310107, 310100, '普陀区', 2, 0, 3);
INSERT INTO `area` VALUES (310108, 310100, '闸北区', 2, 0, 3);
INSERT INTO `area` VALUES (310109, 310100, '虹口区', 2, 0, 3);
INSERT INTO `area` VALUES (310110, 310100, '杨浦区', 2, 0, 3);
INSERT INTO `area` VALUES (310112, 310100, '闵行区', 2, 0, 3);
INSERT INTO `area` VALUES (310113, 310100, '宝山区', 2, 0, 3);
INSERT INTO `area` VALUES (310114, 310100, '嘉定区', 2, 0, 3);
INSERT INTO `area` VALUES (310115, 310100, '浦东新区', 2, 0, 3);
INSERT INTO `area` VALUES (310116, 310100, '金山区', 2, 0, 3);
INSERT INTO `area` VALUES (310117, 310100, '松江区', 2, 0, 3);
INSERT INTO `area` VALUES (310118, 310100, '青浦区', 2, 0, 3);
INSERT INTO `area` VALUES (310119, 310100, '南汇区', 2, 0, 3);
INSERT INTO `area` VALUES (310120, 310100, '奉贤区', 2, 0, 3);
INSERT INTO `area` VALUES (310152, 310100, '川沙区', 2, 0, 3);
INSERT INTO `area` VALUES (310230, 310200, '崇明县', 2, 0, 3);
INSERT INTO `area` VALUES (310231, 310100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (320000, 0, '江苏省', 2, 0, 1);
INSERT INTO `area` VALUES (320100, 320000, '南京市', 2, 0, 2);
INSERT INTO `area` VALUES (320102, 320100, '玄武区', 2, 0, 3);
INSERT INTO `area` VALUES (320103, 320100, '白下区', 2, 0, 3);
INSERT INTO `area` VALUES (320104, 320100, '秦淮区', 2, 0, 3);
INSERT INTO `area` VALUES (320105, 320100, '建邺区', 2, 0, 3);
INSERT INTO `area` VALUES (320106, 320100, '鼓楼区', 2, 0, 3);
INSERT INTO `area` VALUES (320107, 320100, '下关区', 2, 0, 3);
INSERT INTO `area` VALUES (320111, 320100, '浦口区', 2, 0, 3);
INSERT INTO `area` VALUES (320113, 320100, '栖霞区', 2, 0, 3);
INSERT INTO `area` VALUES (320114, 320100, '雨花台区', 2, 0, 3);
INSERT INTO `area` VALUES (320115, 320100, '江宁区', 2, 0, 3);
INSERT INTO `area` VALUES (320116, 320100, '六合区', 2, 0, 3);
INSERT INTO `area` VALUES (320117, 320100, '溧水区', 2, 0, 3);
INSERT INTO `area` VALUES (320118, 320100, '高淳区', 2, 0, 3);
INSERT INTO `area` VALUES (320124, 320100, '溧水县', 2, 0, 3);
INSERT INTO `area` VALUES (320125, 320100, '高淳县', 2, 0, 3);
INSERT INTO `area` VALUES (320126, 320100, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (320200, 320000, '无锡市', 2, 0, 2);
INSERT INTO `area` VALUES (320202, 320200, '崇安区', 2, 0, 3);
INSERT INTO `area` VALUES (320203, 320200, '南长区', 2, 0, 3);
INSERT INTO `area` VALUES (320204, 320200, '北塘区', 2, 0, 3);
INSERT INTO `area` VALUES (320205, 320200, '锡山区', 2, 0, 3);
INSERT INTO `area` VALUES (320206, 320200, '惠山区', 2, 0, 3);
INSERT INTO `area` VALUES (320211, 320200, '滨湖区', 2, 0, 3);
INSERT INTO `area` VALUES (320281, 320200, '江阴市', 2, 0, 3);
INSERT INTO `area` VALUES (320282, 320200, '宜兴市', 2, 0, 3);
INSERT INTO `area` VALUES (320296, 320200, '新区', 2, 0, 3);
INSERT INTO `area` VALUES (320297, 320200, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (320300, 320000, '徐州市', 2, 0, 2);
INSERT INTO `area` VALUES (320302, 320300, '鼓楼区', 2, 0, 3);
INSERT INTO `area` VALUES (320303, 320300, '云龙区', 2, 0, 3);
INSERT INTO `area` VALUES (320304, 320300, '九里区', 2, 0, 3);
INSERT INTO `area` VALUES (320305, 320300, '贾汪区', 2, 0, 3);
INSERT INTO `area` VALUES (320311, 320300, '泉山区', 2, 0, 3);
INSERT INTO `area` VALUES (320312, 320300, '铜山区', 2, 0, 3);
INSERT INTO `area` VALUES (320321, 320300, '丰县', 2, 0, 3);
INSERT INTO `area` VALUES (320322, 320300, '沛县', 2, 0, 3);
INSERT INTO `area` VALUES (320323, 320300, '铜山县', 2, 0, 3);
INSERT INTO `area` VALUES (320324, 320300, '睢宁县', 2, 0, 3);
INSERT INTO `area` VALUES (320381, 320300, '新沂市', 2, 0, 3);
INSERT INTO `area` VALUES (320382, 320300, '邳州市', 2, 0, 3);
INSERT INTO `area` VALUES (320383, 320300, '其它区', 2, 0, 3);
INSERT INTO `area` VALUES (320400, 320000, '常州市', 2, 0, 2);
INSERT INTO `area` VALUES (320402, 320400, '天宁区', 2, 0, 3);

SET FOREIGN_KEY_CHECKS = 1;
