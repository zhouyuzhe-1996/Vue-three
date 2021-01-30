/*
Navicat MySQL Data Transfer

Source Server         : yukuan
Source Server Version : 80020
Source Host           : localhost:3306
Source Database       : material

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2021-01-28 21:22:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admission
-- ----------------------------
DROP TABLE IF EXISTS `admission`;
CREATE TABLE `admission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vno` varchar(255) DEFAULT NULL,
  `verMan` varchar(255) DEFAULT NULL,
  `prold` varchar(255) DEFAULT NULL,
  `mConld` varchar(255) DEFAULT NULL,
  `aprlistld` varchar(255) DEFAULT NULL,
  `ifacpt` varchar(255) DEFAULT NULL,
  `mmid` varchar(255) DEFAULT NULL,
  `mnum` varchar(255) DEFAULT NULL,
  `ifsave` varchar(255) DEFAULT NULL,
  `repold` varchar(255) DEFAULT NULL,
  `rmanver` varchar(255) DEFAULT NULL,
  `filepathsmlist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admission
-- ----------------------------
INSERT INTO `admission` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for basicmaterials
-- ----------------------------
DROP TABLE IF EXISTS `basicmaterials`;
CREATE TABLE `basicmaterials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mcode` varchar(255) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `mtype` varchar(255) DEFAULT NULL,
  `munit` varchar(255) DEFAULT NULL,
  `filepaths` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basicmaterials
-- ----------------------------
INSERT INTO `basicmaterials` VALUES ('1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mmidName` varchar(255) DEFAULT NULL,
  `mnum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', '1', '2');

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repcloc` varchar(255) DEFAULT NULL,
  `repclocName` varchar(255) DEFAULT NULL,
  `repclocMan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inputid` varchar(255) DEFAULT NULL,
  `teamid` varchar(255) DEFAULT NULL,
  `iptDate` varchar(255) DEFAULT NULL,
  `filepaths` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of delivery
-- ----------------------------
INSERT INTO `delivery` VALUES ('1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for pact
-- ----------------------------
DROP TABLE IF EXISTS `pact`;
CREATE TABLE `pact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '申请人id',
  `ct_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '合同名称',
  `ct_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '合同类型',
  `pr_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '供应商',
  `ct_sum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '合同金额',
  `pay_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '付款方式paymode(按合同付款和按进度付款）',
  `ct_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '结算ctdState（-1未结算，0结算未付款，1结算）',
  `ct_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '签订日期',
  `prj_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目id',
  `pre_pay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预付款prePay（按合同付款和安进度付款）',
  `deposit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '保证金',
  `ctext_man` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '合同执行人',
  `leader_next` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '审批人',
  `m_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '材料id',
  `ctd_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '采购数量',
  `ctd_money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '采购单价',
  `ctd_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '结算ctdState（未结算，结算未付款，结算）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pact
-- ----------------------------
INSERT INTO `pact` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prjid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目id',
  `planname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '计划名称',
  `cmtld` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '提交人id',
  `leaderNext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '审批人',
  `cdate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '提交时间',
  `mname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '材料名称',
  `userloc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '使用位置',
  `mnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '使用量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('2', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `project` VALUES ('3', '2', '2', '2', '2', '2', '2', '2', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `head_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'yukuan', 'f81bbe96b72c6787e8a997439f744a47', '123456789', '123456@qq.com', 'http://localhost:3000/uploads/20210122/1611324888279.jpg');

-- ----------------------------
-- Table structure for vendor
-- ----------------------------
DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `parea` varchar(255) DEFAULT NULL,
  `pcotype` varchar(255) DEFAULT NULL,
  `ptype` varchar(255) DEFAULT NULL,
  `pprof` varchar(255) DEFAULT NULL,
  `paddr` varchar(255) DEFAULT NULL,
  `leader` varchar(255) DEFAULT NULL,
  `personid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vendor
-- ----------------------------
INSERT INTO `vendor` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeMan` varchar(255) DEFAULT NULL,
  `storeName` varchar(255) DEFAULT NULL,
  `storeLoc` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for xyproject
-- ----------------------------
DROP TABLE IF EXISTS `xyproject`;
CREATE TABLE `xyproject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prjid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目id',
  `mr_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '需求计划名称',
  `cmt_man` varchar(255) DEFAULT NULL COMMENT '提交人',
  `cmt_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '提交时间',
  `come_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '到场时间',
  `userLoc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '使用位置',
  `mnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '使用量',
  `mprice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参考价格',
  `ifover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否超标',
  `prov_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '供应商确认状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `exec_man` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '计划执行人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xyproject
-- ----------------------------
INSERT INTO `xyproject` VALUES ('6', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', null, null);
