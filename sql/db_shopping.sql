/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : db_shopping

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 04/07/2020 13:26:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '收货地址描述',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `level` int(11) NULL DEFAULT NULL COMMENT '默认收货地址, 1-默认收货地址,0-其他收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_address_id`(`uid`) USING BTREE,
  CONSTRAINT `fk_address_id` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_address
-- ----------------------------
INSERT INTO `tb_address` VALUES (2, '北京市:北京市市辖区:东城区:宝盛北里西区天丰利商城四层 千锋教育', '李爽', '1567890890822', 4, 1);
INSERT INTO `tb_address` VALUES (3, '北京市海淀区3', '李爽1', '136110803022', 6, 0);
INSERT INTO `tb_address` VALUES (4, '22223', '张', '112', 6, 0);
INSERT INTO `tb_address` VALUES (6, '辽宁省朝阳市凌源', '张', '15678908908', 4, 0);
INSERT INTO `tb_address` VALUES (11, '上海市', 'Ziph', '15677778888', 8, 1);

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart`  (
  `id` int(11) NOT NULL COMMENT '关联用户id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '关联商品id',
  `num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `money` decimal(13, 2) NULL DEFAULT NULL COMMENT '商品总价',
  PRIMARY KEY (`id`, `pid`) USING BTREE,
  INDEX `fk_cart_pid`(`pid`) USING BTREE,
  CONSTRAINT `fk_cart_id` FOREIGN KEY (`id`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_pid` FOREIGN KEY (`pid`) REFERENCES `tb_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_cart
-- ----------------------------
INSERT INTO `tb_cart` VALUES (7, 2, 0, NULL);
INSERT INTO `tb_cart` VALUES (7, 6, 0, NULL);
INSERT INTO `tb_cart` VALUES (8, 1, 0, NULL);
INSERT INTO `tb_cart` VALUES (8, 2, 0, NULL);
INSERT INTO `tb_cart` VALUES (8, 3, 0, NULL);
INSERT INTO `tb_cart` VALUES (8, 4, 0, NULL);
INSERT INTO `tb_cart` VALUES (8, 5, 0, NULL);
INSERT INTO `tb_cart` VALUES (8, 6, 0, NULL);
INSERT INTO `tb_cart` VALUES (10, 5, 3, NULL);

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `pubdate` date NULL DEFAULT NULL COMMENT '上架时间',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `price` int(11) NOT NULL COMMENT '商品单价',
  `star` tinyint(4) NOT NULL DEFAULT 0 COMMENT '热销指数',
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品简介',
  `typeid` int(11) NOT NULL COMMENT '商品分类id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_typeid`(`typeid`) USING BTREE,
  CONSTRAINT `fk_typeid` FOREIGN KEY (`typeid`) REFERENCES `tb_goods_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES (1, 'java模式', '2017-09-12', 'https://ss1.bdstatic.com/6OF1bjeh1BF3odCf/it/u=1894693812,525327586&fm=74&app=80&f=JPEG&size=f121,140?sec=1880279984&t=a334b8b14a84a0e1e488279e62b9141b', 1, 5, '第一', 1);
INSERT INTO `tb_goods` VALUES (2, 'java编程思想', '2017-09-14', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3349577865,3657618890&fm=58&bpow=2160&bpoh=3047', 23, 5, '第二本', 1);
INSERT INTO `tb_goods` VALUES (3, 'html5', '2017-09-07', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1302131682,4226401052&fm=58&bpow=492&bpoh=408', 78, 4, '第一本html\r\n实例二\r\n\r\n     这次要介绍的就没那么简单了，这个悬停弹出框的效果比第一个实例要复杂很多。弹出框弹出的效果是一样的，不一样的是弹出框的内容，这次的弹出框中不仅要有提示，还要有相应的信息，链接等。小编所做的效果是在弹出框中添加了图片，然后有相应的链接，在点击之后可以跳转到不同的页面。', 1);
INSERT INTO `tb_goods` VALUES (4, '安卓', '2017-09-02', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=396968936,3994336790&fm=179&app=42&f=JPEG?w=121&h=140', 89, 3, '安卓第一本书是从这里开始的', 1);
INSERT INTO `tb_goods` VALUES (5, '小米6', '2018-01-24', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2484098039,3214299800&fm=26&gp=0.jpg', 2499, 3, '变焦双摄，4 轴防抖 / 骁龙835 旗舰处理器，6GB 大内存，最大可选128GB 闪存 / 5.15\" 护眼屏 / 四曲面玻璃/陶瓷机身', 2);
INSERT INTO `tb_goods` VALUES (6, '小米7mini', '2018-01-10', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=4208711759,4204409407&fm=85', 1, 2, '', 2);
INSERT INTO `tb_goods` VALUES (8, '小米MIX2', '2018-01-24', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1857968245,2050830379&fm=179&app=42&f=PNG?w=121&h=140', 1588, 3, '5.99\" 超大屏幕\r\n机身却比 5.5\" 传统手机还小\r\n\r\n5.99\"，你很难找到比它屏幕大，但是尺寸却比它小的手机。\r\n这源于不断进化的全面屏科技，带来更窄的底边、更小的相机、隐藏的距离传感器……\r\n最终将 5.99\" 大屏装进了比 5.5\" 传统手机还小的机身内，握感绝佳。', 2);

-- ----------------------------
-- Table structure for tb_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_type`;
CREATE TABLE `tb_goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `level` int(11) NULL DEFAULT NULL COMMENT '分类等级',
  `parent` int(11) NULL DEFAULT NULL COMMENT '分类对应的父id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_goods_type
-- ----------------------------
INSERT INTO `tb_goods_type` VALUES (1, '计算机', 1, 0);
INSERT INTO `tb_goods_type` VALUES (2, '小米手机', 1, 0);
INSERT INTO `tb_goods_type` VALUES (3, '笔记本', 1, 0);
INSERT INTO `tb_goods_type` VALUES (4, '电视盒子', 1, 0);
INSERT INTO `tb_goods_type` VALUES (5, '智能家电', 1, 0);
INSERT INTO `tb_goods_type` VALUES (6, '其他', 1, 0);
INSERT INTO `tb_goods_type` VALUES (7, '平衡车', 2, 6);

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `money` decimal(13, 2) NULL DEFAULT NULL COMMENT '订单总价',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态: 1-未支付 , 2-已支付,待发货, 3-已发货,待收货, 4-订单完成',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `aid` int(11) NULL DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_uid`(`uid`) USING BTREE,
  INDEX `fk_order_aid`(`aid`) USING BTREE,
  CONSTRAINT `fk_order_aid` FOREIGN KEY (`aid`) REFERENCES `tb_address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_uid` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('06af1dfc825742dfa6a07f353a9ae9d0', 8, 25.00, '1', '2020-07-03 21:22:38', 11);
INSERT INTO `tb_order` VALUES ('0a56b6bb0bb04af6b5a887d75d1182a1', 8, 1.00, '1', '2020-07-04 08:53:57', 11);
INSERT INTO `tb_order` VALUES ('3e8b8be2b6dd434c9c9de5e1d854b39a', 8, 158.00, '1', '2020-07-04 12:20:19', 11);
INSERT INTO `tb_order` VALUES ('c655a6a90ce34bff90ffb2181a0cbfb8', 8, 1.00, '1', '2020-07-04 12:24:19', 11);

-- ----------------------------
-- Table structure for tb_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderdetail`;
CREATE TABLE `tb_orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `pid` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `money` decimal(13, 2) NULL DEFAULT NULL COMMENT '商品总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_pid`(`pid`) USING BTREE,
  INDEX `fk_order_id`(`oid`) USING BTREE,
  CONSTRAINT `fk_order_id` FOREIGN KEY (`oid`) REFERENCES `tb_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_pid` FOREIGN KEY (`pid`) REFERENCES `tb_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_orderdetail
-- ----------------------------
INSERT INTO `tb_orderdetail` VALUES (22, '06af1dfc825742dfa6a07f353a9ae9d0', 2, 1, 23.00);
INSERT INTO `tb_orderdetail` VALUES (23, '06af1dfc825742dfa6a07f353a9ae9d0', 6, 2, 2.00);
INSERT INTO `tb_orderdetail` VALUES (24, '0a56b6bb0bb04af6b5a887d75d1182a1', 1, 1, 1.00);
INSERT INTO `tb_orderdetail` VALUES (25, '3e8b8be2b6dd434c9c9de5e1d854b39a', 3, 2, 156.00);
INSERT INTO `tb_orderdetail` VALUES (26, '3e8b8be2b6dd434c9c9de5e1d854b39a', 6, 2, 2.00);
INSERT INTO `tb_orderdetail` VALUES (27, 'c655a6a90ce34bff90ffb2181a0cbfb8', 6, 1, 1.00);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `gender` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `flag` int(11) NULL DEFAULT NULL COMMENT '激活信息:0-未激活,1-已激活',
  `role` int(11) NULL DEFAULT NULL COMMENT '角色信息:1-普通用户,2-管理员',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (3, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2407359193@qq.com', '女', 1, 0, '20170912202221249354');
INSERT INTO `tb_user` VALUES (4, 'lee', 'e10adc3949ba59abbe56e057f20f883e', '2407359193@qq.com', '男', 1, 1, '2017091221312740330d');
INSERT INTO `tb_user` VALUES (5, 'andy', '81dc9bdb52d04dc20036dbd8313ed055', '2407359193@qq.com', '女', 1, 1, '201709122331221743af');
INSERT INTO `tb_user` VALUES (6, 'amin', 'e10adc3949ba59abbe56e057f20f883e', '2407359193@qq.com', '女', 1, 1, '2018012218370268135d');
INSERT INTO `tb_user` VALUES (7, '中国', '4297f44b13955235245b2497399d7a93', '402424668@qq.com', '男', 1, 1, '201909142319583381bb9d');
INSERT INTO `tb_user` VALUES (8, 'Ziph', '123456', 'mylifes1110@163.com', '男', 1, 1, '2018012218370268135c');
INSERT INTO `tb_user` VALUES (9, 'Lazy', '123456', 'mylifes1110@163.com', '男', 1, 1, '2018012218370268135d');
INSERT INTO `tb_user` VALUES (10, 'Marry', '123456', 'mylifes1110@163.com', '女', 1, 0, '3141d5fb-b30f-4159-b89c-efac1622ed15');
INSERT INTO `tb_user` VALUES (11, 'Marry1', '111111111111', 'mylifes1110@163.com', '女', 0, 0, '88b162a7-0681-4944-885f-ce81f5108e98');

SET FOREIGN_KEY_CHECKS = 1;
