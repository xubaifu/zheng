/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : zhengbak

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-03-19 21:01:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for upms_organization
-- ----------------------------
DROP TABLE IF EXISTS `upms_organization`;
CREATE TABLE `upms_organization` (
  `organization_id` varchar(64) NOT NULL COMMENT '编号',
  `dept_id` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `pid` varchar(64) DEFAULT NULL COMMENT '所属上级',
  `pids` varchar(1000) DEFAULT NULL COMMENT '所有上级',
  `name` varchar(20) DEFAULT NULL COMMENT '组织名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '组织描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `organization_code` varchar(64) DEFAULT NULL COMMENT '部门编号',
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织';

-- ----------------------------
-- Records of upms_organization
-- ----------------------------
INSERT INTO `upms_organization` VALUES ('07f0f84e-4043-44f3-88a1-28ff62e8c93c', '01a92dfa-7880-4f8f-9235-3a1b7303d4b0', '15a', '0,14a,15a', '222', '2222', '1521463395716', '22');
INSERT INTO `upms_organization` VALUES ('14a', null, '0', '0', '组织机构', '组织机构', '1510103551818', '1000000');
INSERT INTO `upms_organization` VALUES ('15a', null, '14a', '0,14a', '北京总部', '北京总部1', '1521463375983', '10001');
INSERT INTO `upms_organization` VALUES ('16a', null, '14a', '0,14a', '天津总部', '天津总部0', '1521463489405', '10002');
INSERT INTO `upms_organization` VALUES ('19a', null, '14a', '0,14a', '上海总部', '上海总部', '1521463515280', '111111');
INSERT INTO `upms_organization` VALUES ('1afa884a-8f41-43db-9ae4-543da868be01', 'da93da9c-a7a7-4296-95e2-133ab8fcfb4b', '20a', '0,14a,15a,20a', 'ce测试', 'ce测试', '1521463769003', '1111');
INSERT INTO `upms_organization` VALUES ('20a', null, '15a', '0,14a,15a', '东城区', '东城区', '1521463609942', '8987687');
INSERT INTO `upms_organization` VALUES ('21a', null, '15a', '0,14a,15a', '西城区', '西城区1', '1521463622028', '9io087545');
INSERT INTO `upms_organization` VALUES ('22a', null, '19a', '0,14a,19a', '浦东区', '浦东区', '1521463531064', '12we4');
INSERT INTO `upms_organization` VALUES ('23a', null, '14a', '0,14a', '总部', '总部1', '1521463588004', '34567890-');
INSERT INTO `upms_organization` VALUES ('33a', '2874de7a-e008-4f03-be70-a3c6e923535e', '15a', '0,14a,15a', '朝阳区', '朝阳区', '1521463692961', '35345566');
INSERT INTO `upms_organization` VALUES ('a964550f-5201-44b6-8196-0e38639929b8', 'a1657ded-fd26-4a9d-be16-9adba283f5d4', '23a', '0,14a,23a', '分部一', '分部', '1521464289406', '123554643');
INSERT INTO `upms_organization` VALUES ('ab78696a-f6be-4e16-ba14-ec9688ffa2ed', 'da6dd564-0341-417f-89e7-b0847126c5d3', '15a', '0,14a,15a', '333', '333', '1521463468928', '3333');
INSERT INTO `upms_organization` VALUES ('f446e94f-756b-4029-957c-17fd97f64ae2', 'baf4fde6-d3d3-4020-a6dd-65d83482e1e8', '14a', '0,14a', '1111', '11111', '1521463434453', '111111');
