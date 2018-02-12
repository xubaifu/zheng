/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : zhengbak

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-02-12 20:09:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for 20171127cs1
-- ----------------------------
DROP TABLE IF EXISTS `20171127cs1`;
CREATE TABLE `20171127cs1` (
  `id` varchar(64) NOT NULL,
  `sub_id` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatername` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 20171127cs1
-- ----------------------------
INSERT INTO `20171127cs1` VALUES ('2e490cdf-8f86-4413-9fad-e0c3f2b1d8a0', '1f046d34-f608-4d1c-a307-3980a664c9f2', 'type', '人员管理', null, '2017-12-06 14:01 51', null, '0', null, null);
INSERT INTO `20171127cs1` VALUES ('68853dd4-39e0-4ed5-a288-3b3b9c1b8ab5', '1f046d34-f608-4d1c-a307-3980a664c9f2', 'time', '09:00-18:00', null, '2017-12-06 14:01 51', null, '0', null, null);
INSERT INTO `20171127cs1` VALUES ('69833b67-f9ea-4246-9b3a-4b0e7cd84a55', '1f046d34-f608-4d1c-a307-3980a664c9f2', 'bak', '人员管理', null, '2017-12-06 14:01 51', null, '0', null, null);
INSERT INTO `20171127cs1` VALUES ('c086f832-990e-4ad8-b92c-145cad897d6b', '99f1cd82-464d-4f43-a85c-8be2aa8a4d1b', 'type', '后勤保障', null, '2017-12-06 14:02 33', null, '0', null, null);
INSERT INTO `20171127cs1` VALUES ('d71dd4d7-4b60-43ee-b2f7-ef25d2803ac9', '99f1cd82-464d-4f43-a85c-8be2aa8a4d1b', 'time', '09:00-18:00', null, '2017-12-06 14:02 33', null, '0', null, null);
INSERT INTO `20171127cs1` VALUES ('f180b497-bf27-42a2-82b8-a430db36967a', '99f1cd82-464d-4f43-a85c-8be2aa8a4d1b', 'bak', '后勤保障', null, '2017-12-06 14:02 33', null, '0', null, null);

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `topic_id` int(11) DEFAULT NULL COMMENT '所属专题',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `author` varchar(50) DEFAULT NULL COMMENT '文章原作者',
  `fromurl` varchar(300) DEFAULT NULL COMMENT '转载来源网址',
  `image` varchar(300) DEFAULT NULL COMMENT '封面图',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型(1:普通,2:热门...)',
  `allowcomments` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许评论(0:不允许,1:允许)',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(-1:不通过,0未审核,1:通过)',
  `content` mediumtext COMMENT '内容',
  `user_id` int(10) unsigned NOT NULL COMMENT '发布人id',
  `readnumber` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数量',
  `top` int(11) NOT NULL DEFAULT '0' COMMENT '置顶等级',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `orders` bigint(20) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`article_id`),
  KEY `cms_article_orders` (`orders`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('3', '0', '中国经济标题1', '1', '1', '1', '1', '1', '1', '1', '0', '资讯内容', '1', '0', '0', '1', '1489827019528', '1489827019528');
INSERT INTO `cms_article` VALUES ('4', '0', '中国经济标题2', '2', '2', '2', '2', '2', '1', '1', '-1', '资讯内容', '1', '0', '0', '1', '1489827340870', '1489827340870');
INSERT INTO `cms_article` VALUES ('5', '0', '中国经济标题3', '3', '3', '3', '3', '3', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1489827581414', '1489827581414');
INSERT INTO `cms_article` VALUES ('8', '1', '日本从地球消失，我们倍(喜)感(大)心(普)痛(奔)', 'shuzheng', '网络', '', '日本消失,日本地震', '日本从地震中消失', '1', '1', '1', '好悲(gao)伤(xing)啊', '1', '12', '0', '1', '1489845594355', '1489845594355');
INSERT INTO `cms_article` VALUES ('9', '0', '中国经济标题4', '4', '4', '4', '4', '4', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460546198', '1490460546198');
INSERT INTO `cms_article` VALUES ('10', '0', '中国经济标题5', '5', '5', '5', '5', '5', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460567137', '1490460567137');
INSERT INTO `cms_article` VALUES ('11', '0', '中国经济标题6', '6', '6', '6', '6', '6', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460575304', '1490460575304');
INSERT INTO `cms_article` VALUES ('12', '0', '中国经济标题7', '7', '7', '7', '7', '7', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460582004', '1490460582004');
INSERT INTO `cms_article` VALUES ('13', '0', '中国经济标题8', '8', '8', '8', '8', '8', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460588840', '1490460588840');
INSERT INTO `cms_article` VALUES ('14', '0', '中国经济标题9', '9', '9', '9', '9', '9', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460596394', '1490460596394');
INSERT INTO `cms_article` VALUES ('15', '0', '中国经济标题10', '10', '10', '10', '10', '10', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460612370', '1490460612370');
INSERT INTO `cms_article` VALUES ('16', '0', '中国经济标题111', '11', '11', '11', '11', '11', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460782767', '1490460782767');
INSERT INTO `cms_article` VALUES ('17', '0', '中国经济标题12', '12', '12', '12', '12', '12', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460792501', '1490460792501');
INSERT INTO `cms_article` VALUES ('18', '0', '中国经济标题13', '13', '13', '13', '13', '13', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460800634', '1490460800634');
INSERT INTO `cms_article` VALUES ('19', '0', '人为什么谈恋爱？', 'test', 'test', 'test', 'test', 'test', '1', '1', '1', '人为什么谈恋爱？', '1', '0', '0', '2', '1490460800635', '1490460800635');
INSERT INTO `cms_article` VALUES ('20', '0', 'java开发笔记', 'test', 'test', 'test', 'test', 'test', '1', '1', '1', '好记性不如烂笔头', '1', '0', '0', '3', '1490460800636', '1490460800636');

-- ----------------------------
-- Table structure for cms_article_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_category`;
CREATE TABLE `cms_article_category` (
  `article_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `category_id` int(10) unsigned NOT NULL COMMENT '类目编号',
  PRIMARY KEY (`article_category_id`),
  KEY `cms_article_category_article_id` (`article_id`),
  KEY `cms_article_category_category_id` (`category_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='文章类目关联表';

-- ----------------------------
-- Records of cms_article_category
-- ----------------------------
INSERT INTO `cms_article_category` VALUES ('1', '3', '6');
INSERT INTO `cms_article_category` VALUES ('2', '4', '6');
INSERT INTO `cms_article_category` VALUES ('3', '5', '6');
INSERT INTO `cms_article_category` VALUES ('4', '9', '6');
INSERT INTO `cms_article_category` VALUES ('5', '10', '6');
INSERT INTO `cms_article_category` VALUES ('6', '11', '6');
INSERT INTO `cms_article_category` VALUES ('7', '12', '6');
INSERT INTO `cms_article_category` VALUES ('8', '12', '6');
INSERT INTO `cms_article_category` VALUES ('9', '13', '6');
INSERT INTO `cms_article_category` VALUES ('10', '14', '6');
INSERT INTO `cms_article_category` VALUES ('11', '15', '6');
INSERT INTO `cms_article_category` VALUES ('12', '16', '6');
INSERT INTO `cms_article_category` VALUES ('13', '17', '6');
INSERT INTO `cms_article_category` VALUES ('14', '18', '6');
INSERT INTO `cms_article_category` VALUES ('15', '8', '7');
INSERT INTO `cms_article_category` VALUES ('16', '19', '8');
INSERT INTO `cms_article_category` VALUES ('17', '20', '9');

-- ----------------------------
-- Table structure for cms_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_tag`;
CREATE TABLE `cms_article_tag` (
  `article_tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `tag_id` int(10) unsigned NOT NULL COMMENT '标签编号',
  PRIMARY KEY (`article_tag_id`),
  KEY `cms_article_tag_article_id` (`article_id`),
  KEY `cms_article_tag_tag_id` (`tag_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`tag_id`) REFERENCES `cms_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='文章标签关联表';

-- ----------------------------
-- Records of cms_article_tag
-- ----------------------------
INSERT INTO `cms_article_tag` VALUES ('1', '19', '4');
INSERT INTO `cms_article_tag` VALUES ('2', '20', '5');

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类目编号',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '上级编号',
  `level` tinyint(4) NOT NULL COMMENT '层级',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '类型(1:普通,2:热门...)',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `orders` bigint(255) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`category_id`),
  KEY `cms_category_orders` (`orders`),
  KEY `cms_category_pid` (`pid`),
  KEY `cms_category_alias` (`alias`),
  KEY `cms_category_level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='类目表';

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('5', null, '1', '经济', '经济类目', '', '1', 'economic', '1', '1489590733919', '1489590733919');
INSERT INTO `cms_category` VALUES ('6', '5', '2', '中国经济', '中国经济类目', '', '1', 'chinaeconomic', '1', '1489590768989', '1489590768989');
INSERT INTO `cms_category` VALUES ('7', '5', '2', '日本经济', '日本经济类目', '', '1', 'japaneconomic', '1', '1491636586316', '1491636586316');
INSERT INTO `cms_category` VALUES ('8', null, '1', '人类', '人类问题', '', '1', 'people', '2', '1491636586317', '1491636586317');
INSERT INTO `cms_category` VALUES ('9', null, '1', '技术', '技术博文', null, '1', 'technic', '3', '1491636586318', '1491636586318');

-- ----------------------------
-- Table structure for cms_category_tag
-- ----------------------------
DROP TABLE IF EXISTS `cms_category_tag`;
CREATE TABLE `cms_category_tag` (
  `category_tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `category_id` int(10) unsigned NOT NULL COMMENT '类目编号',
  `tag_id` int(10) unsigned NOT NULL COMMENT '标签编号',
  PRIMARY KEY (`category_tag_id`),
  KEY `cms_category_tag_tag_id` (`tag_id`),
  KEY `cms_category_tag_category_id` (`category_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`tag_id`) REFERENCES `cms_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='类目标签关联表';

-- ----------------------------
-- Records of cms_category_tag
-- ----------------------------

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '回复楼中楼编号回复楼中楼编号',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `content` text NOT NULL COMMENT '评论内容',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(-1:不通过,0:未审核,1:通过)',
  `ip` varchar(30) DEFAULT NULL COMMENT '评论人ip地址',
  `agent` varchar(200) DEFAULT NULL COMMENT '评论人终端信息',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`comment_id`),
  KEY `cms_comment_article_id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='评论表';

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` VALUES ('1', null, '8', '1', '1', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490535749413');
INSERT INTO `cms_comment` VALUES ('2', null, '8', '1', '2', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536186447');
INSERT INTO `cms_comment` VALUES ('3', null, '8', '1', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536192205');
INSERT INTO `cms_comment` VALUES ('4', null, '8', '1', '4', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536460544');
INSERT INTO `cms_comment` VALUES ('5', null, '8', '1', '5', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536462182');
INSERT INTO `cms_comment` VALUES ('6', null, '8', '1', '6', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536463614');
INSERT INTO `cms_comment` VALUES ('7', null, '8', '1', '7', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536464870');
INSERT INTO `cms_comment` VALUES ('8', null, '8', '1', '8', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536465926');
INSERT INTO `cms_comment` VALUES ('9', null, '8', '1', '9', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536466853');
INSERT INTO `cms_comment` VALUES ('10', null, '8', '1', '10', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536467821');
INSERT INTO `cms_comment` VALUES ('11', null, '19', '1', '1', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737900448');
INSERT INTO `cms_comment` VALUES ('12', null, '19', '1', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737902517');
INSERT INTO `cms_comment` VALUES ('13', null, '19', '1', '4', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737903420');
INSERT INTO `cms_comment` VALUES ('14', null, '19', '1', '5', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737904428');
INSERT INTO `cms_comment` VALUES ('15', null, '19', '1', '6', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737905236');
INSERT INTO `cms_comment` VALUES ('16', null, '19', '1', '7', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737905980');

-- ----------------------------
-- Table structure for cms_menu
-- ----------------------------
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE `cms_menu` (
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='菜单';

-- ----------------------------
-- Records of cms_menu
-- ----------------------------
INSERT INTO `cms_menu` VALUES ('1', null, '首页', '/', '_self', '1489847080380');
INSERT INTO `cms_menu` VALUES ('2', null, '问答', '/qa', '_self', '1489847186644');
INSERT INTO `cms_menu` VALUES ('3', null, '博客', '/blog', '_self', '1489847186645');
INSERT INTO `cms_menu` VALUES ('4', null, '资讯', '/news', '_self', '1489847080381');
INSERT INTO `cms_menu` VALUES ('5', null, '专题', '/topic/list', '_self', '1489847186646');
INSERT INTO `cms_menu` VALUES ('6', null, '关于', '/page/about', '_self', '1489847186647');

-- ----------------------------
-- Table structure for cms_page
-- ----------------------------
DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE `cms_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `pid` int(10) DEFAULT NULL COMMENT '父页面',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `content` mediumtext COMMENT '页面内容',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='页面';

-- ----------------------------
-- Records of cms_page
-- ----------------------------
INSERT INTO `cms_page` VALUES ('1', null, '关于', 'about', '作者：张恕征', '单页关键字', '单页描述', '1489839705049', '1489839705049');

-- ----------------------------
-- Table structure for cms_setting
-- ----------------------------
DROP TABLE IF EXISTS `cms_setting`;
CREATE TABLE `cms_setting` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(10) DEFAULT NULL,
  `setting_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='网站配置';

-- ----------------------------
-- Records of cms_setting
-- ----------------------------
INSERT INTO `cms_setting` VALUES ('1', 'copyright', '© 2017 Zhang Shuzheng');

-- ----------------------------
-- Table structure for cms_system
-- ----------------------------
DROP TABLE IF EXISTS `cms_system`;
CREATE TABLE `cms_system` (
  `system_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) NOT NULL COMMENT '系统名称',
  `code` varchar(20) DEFAULT NULL COMMENT '别名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='系统管理';

-- ----------------------------
-- Records of cms_system
-- ----------------------------
INSERT INTO `cms_system` VALUES ('1', '资讯', 'news', '资讯', '1', '1');
INSERT INTO `cms_system` VALUES ('2', '问答', 'qa', '问答', '2', '2');
INSERT INTO `cms_system` VALUES ('3', '博客', 'blog', '博客', '3', '3');

-- ----------------------------
-- Table structure for cms_tag
-- ----------------------------
DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE `cms_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型(1:普通,2:热门...)',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `orders` bigint(20) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`tag_id`),
  KEY `cms_tag_orders` (`orders`),
  KEY `cms_tag_alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

-- ----------------------------
-- Records of cms_tag
-- ----------------------------
INSERT INTO `cms_tag` VALUES ('1', 'JAVA', 'java标签', '', '1', 'java', '1', '1489585694864', '1489585694864');
INSERT INTO `cms_tag` VALUES ('2', 'Android', 'android标签', '', '1', 'android', '1', '1489585720382', '1489585720382');
INSERT INTO `cms_tag` VALUES ('3', 'zheng', 'zheng标签', '', '2', 'zheng', '1', '1489585815042', '1489585815042');
INSERT INTO `cms_tag` VALUES ('4', '谈恋爱', '谈恋爱标签', '', '1', 'love', '2', '1489585815043', '1489585815043');
INSERT INTO `cms_tag` VALUES ('5', 'java', 'java标签', '', '1', 'java', '3', '1489585815044', '1489585815044');

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='专题';

-- ----------------------------
-- Records of cms_topic
-- ----------------------------
INSERT INTO `cms_topic` VALUES ('1', '日本地震专题', '日本经历灭国性地震，彻底沉入海底', '/topic/1', '1489843484448');

-- ----------------------------
-- Table structure for pay_in_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_in_order`;
CREATE TABLE `pay_in_order` (
  `pay_in_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_vendor_id` int(10) DEFAULT NULL,
  `pay_mch_id` int(10) DEFAULT NULL,
  `amount` decimal(10,0) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `ctime` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`pay_in_order_id`),
  KEY `FK_Reference_32` (`pay_vendor_id`),
  KEY `FK_Reference_38` (`pay_mch_id`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`pay_vendor_id`) REFERENCES `pay_vendor` (`pay_vendor_id`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`pay_mch_id`) REFERENCES `pay_mch` (`pay_mch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收入订单表';

-- ----------------------------
-- Records of pay_in_order
-- ----------------------------

-- ----------------------------
-- Table structure for pay_in_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `pay_in_order_detail`;
CREATE TABLE `pay_in_order_detail` (
  `pay_in_order_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_in_order_id` int(10) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` decimal(10,0) DEFAULT NULL,
  `product_count` int(10) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`pay_in_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收入订单明细表';

-- ----------------------------
-- Records of pay_in_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for pay_mch
-- ----------------------------
DROP TABLE IF EXISTS `pay_mch`;
CREATE TABLE `pay_mch` (
  `pay_mch_id` int(10) NOT NULL AUTO_INCREMENT,
  `mch_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `reqKey` varchar(50) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pay_mch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付中心商户管理表';

-- ----------------------------
-- Records of pay_mch
-- ----------------------------

-- ----------------------------
-- Table structure for pay_out_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_out_order`;
CREATE TABLE `pay_out_order` (
  `pay_out_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_mch_id` int(10) DEFAULT NULL,
  `pay_vendor_id` int(10) DEFAULT NULL,
  `amount` decimal(10,0) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `ctime` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`pay_out_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支出订单表';

-- ----------------------------
-- Records of pay_out_order
-- ----------------------------

-- ----------------------------
-- Table structure for pay_out_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `pay_out_order_detail`;
CREATE TABLE `pay_out_order_detail` (
  `pay_out_order_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_out_order_id` int(10) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`pay_out_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支出订单明细表';

-- ----------------------------
-- Records of pay_out_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for pay_pay
-- ----------------------------
DROP TABLE IF EXISTS `pay_pay`;
CREATE TABLE `pay_pay` (
  `pay_pay_id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_type_id` int(10) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pay_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付参数配置表';

-- ----------------------------
-- Records of pay_pay
-- ----------------------------

-- ----------------------------
-- Table structure for pay_type
-- ----------------------------
DROP TABLE IF EXISTS `pay_type`;
CREATE TABLE `pay_type` (
  `pay_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_vendor_id` int(10) DEFAULT NULL,
  `pay_mch_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`pay_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商户支持支付类型表';

-- ----------------------------
-- Records of pay_type
-- ----------------------------

-- ----------------------------
-- Table structure for pay_vendor
-- ----------------------------
DROP TABLE IF EXISTS `pay_vendor`;
CREATE TABLE `pay_vendor` (
  `pay_vendor_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `appsecret` varchar(150) DEFAULT NULL,
  `config` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pay_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方支付标识表';

-- ----------------------------
-- Records of pay_vendor
-- ----------------------------

-- ----------------------------
-- Table structure for pay_vest
-- ----------------------------
DROP TABLE IF EXISTS `pay_vest`;
CREATE TABLE `pay_vest` (
  `pay_vest_id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_type_id` int(10) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pay_vest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='马甲支付参数配置表';

-- ----------------------------
-- Records of pay_vest
-- ----------------------------

-- ----------------------------
-- Table structure for sys_column_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_column_info`;
CREATE TABLE `sys_column_info` (
  `id` varchar(64) NOT NULL,
  `cn_col_name` varchar(200) DEFAULT NULL,
  `en_col_name` varchar(100) DEFAULT NULL,
  `attribute` varchar(64) DEFAULT NULL,
  `length` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_column_info
-- ----------------------------
INSERT INTO `sys_column_info` VALUES ('07bdedc0-695e-4310-8c09-576ffc170507', '标题', 'title', 'varchar', '200', '1', '公告标题', '2017-12-04 16:17:52', null, '0', 't_fnfl9f2o2s5');
INSERT INTO `sys_column_info` VALUES ('1387efca-655a-4434-b3f0-888a2ad83b74', '工作内容', 'content', 'varchar', '200', '2', '工作内容', '2017-12-13 18:50:46', null, '0', 't_position_duty_test');
INSERT INTO `sys_column_info` VALUES ('2227cd47-e94d-42e1-a6c5-a15f37363abc', '备注', 'bak', 'varchar', '100', '1', '描述', '2017-12-03 18:42:44', null, '0', '20171127CS1');
INSERT INTO `sys_column_info` VALUES ('33aa25ef-9bd4-4e2d-8438-b818dda1e6d2', '姓名', 'name', 'varchar', '20', '1', '姓名', '2017-11-29 14:38:37', null, '0', 'T_FNFL9F2O2S4');
INSERT INTO `sys_column_info` VALUES ('37431c10-919e-40e8-9184-729578621435', '备注', 'bak', 'varchar', '200', '1', '备注', '2017-11-30 19:36:49', null, '0', 'T_FNFL9F2O2S3');
INSERT INTO `sys_column_info` VALUES ('3e315d7e-92ed-48f6-96e0-46e895098657', '电话', 'phone', 'varchar', '20', '1', '电话', '2017-11-29 14:32:49', null, '0', 'T_FNFL9F2O2S3');
INSERT INTO `sys_column_info` VALUES ('4c2d8227-acf9-496c-8325-914b82084ded', '职责名称', 'name', 'varchar', '100', '2', '职责名称', '2017-12-13 18:48:18', null, '0', 't_position_duty_test');
INSERT INTO `sys_column_info` VALUES ('4eb56a34-0467-4a8d-a4b3-815643354cb8', '联系电话', 'phone', 'varchar', '20', '1', '电话', '2017-11-29 14:36:08', null, '0', 'T_FNFL9F2O2S4');
INSERT INTO `sys_column_info` VALUES ('5b1b4b58-c56d-454d-893f-c7f6e5aaf1f5', '通讯地址', 'address', 'varchar', '200', '1', '通讯地址', '2017-11-29 14:31:58', null, '0', 'T_FNFL9F2O2S3');
INSERT INTO `sys_column_info` VALUES ('6c1f6b47-49a8-4522-8609-d9fffcc04bd4', '传真', 'fax', 'varchar', '20', '1', '传真', '2017-11-29 14:33:44', null, '0', 'T_FNFL9F2O2S3');
INSERT INTO `sys_column_info` VALUES ('6c78a471-efef-4f4d-a38c-5810e04158e9', '测试1', 'test', 'varchar', '20', '2', '测试', '2017-12-14 16:54:03', null, '0', 't_position_duty_test');
INSERT INTO `sys_column_info` VALUES ('a3d0edfa-4933-4dd0-986d-be02ff22757b', '邮箱', 'email', 'varchar', '100', '1', '邮箱', '2017-11-30 19:57:02', null, '0', 'T_FNFL9F2O2S3');
INSERT INTO `sys_column_info` VALUES ('af98751e-6330-49e6-83f0-0746692e4d56', '公告内容', 'content', 'varchar', '2000', '1', '公告内容', '2017-12-04 16:18:26', null, '0', 't_fnfl9f2o2s5');
INSERT INTO `sys_column_info` VALUES ('b05c8c4e-efd7-47ec-8b52-136f1882b384', '工作时间', 'time', 'varchar', '200', '1', '工作时间', '2017-11-29 14:40:45', null, '0', '20171127CS1');
INSERT INTO `sys_column_info` VALUES ('b574d79e-cb2d-452b-9f5c-e476e0b49e4f', '工作性质', 'type', 'varchar', '100', '1', '工作性质', '2017-11-29 14:40:03', null, '0', '20171127CS1');
INSERT INTO `sys_column_info` VALUES ('c868a565-9ef3-40eb-9b39-f7d6a25ac18c', '办公室', 'office', 'varchar', '200', '1', 'office', '2017-11-29 14:36:45', null, '0', 'T_FNFL9F2O2S4');
INSERT INTO `sys_column_info` VALUES ('d99a8653-29c5-4ef6-a5f2-57376bb75e7b', '岗位级别', 'level', 'varchar', '20', '2', '岗位级别', '2017-12-16 13:29:18', null, '0', 't_position_level');
INSERT INTO `sys_column_info` VALUES ('ef0fd9dc-6825-485e-9050-b7385b45fba7', '级别说明', 'level_mark', 'varchar', '200', '2', '级别说明', '2017-12-16 13:30:02', null, '0', 't_position_level');

-- ----------------------------
-- Table structure for sys_dept_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_position`;
CREATE TABLE `sys_dept_position` (
  `dr_id` varchar(64) NOT NULL,
  `position_id` varchar(64) DEFAULT NULL,
  `dept_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`dr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表（子集）表明记录';

-- ----------------------------
-- Records of sys_dept_position
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tableinfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_tableinfo`;
CREATE TABLE `sys_tableinfo` (
  `id` varchar(64) NOT NULL,
  `cn_table_name` varchar(200) DEFAULT NULL,
  `en_table_name` varchar(100) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatename` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表（子集）表明记录';

-- ----------------------------
-- Records of sys_tableinfo
-- ----------------------------
INSERT INTO `sys_tableinfo` VALUES ('1', '部门通讯信息', 'T_FNFL9F2O2S3', '1', '部门通讯信息', null, null, '0', null, '');
INSERT INTO `sys_tableinfo` VALUES ('2', '部门领导信息', 'T_FNFL9F2O2S4', '1', '部门领导信息', '', '', '0', '', '');
INSERT INTO `sys_tableinfo` VALUES ('567007c5-f149-42ae-a493-57b6133f579a', '部门职能信息', '20171127CS1', '1', '部门职能信息', '2017-11-27 14:19:56', null, '0', null, null);
INSERT INTO `sys_tableinfo` VALUES ('63621240-95fc-4404-8a6c-7d9d4cdf7b6b', '岗位职责信息', 't_position_duty_test', '2', '岗位职责信息', '2017-12-13 18:34:33', null, '0', null, null);
INSERT INTO `sys_tableinfo` VALUES ('6a20f289-7a92-49bb-9602-be8333ecd871', '岗位级别信息', 't_position_level', '2', '岗位级别信息', '2017-12-16 13:28:48', null, '0', null, null);
INSERT INTO `sys_tableinfo` VALUES ('f477ee8c-7afa-4e14-9e0b-32b0eee83e35', '部门公告信息', 't_fnfl9f2o2s5', '1', '部门公告信息', '2017-12-04 16:16:42', null, '0', null, null);

-- ----------------------------
-- Table structure for sys_template_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_template_table`;
CREATE TABLE `sys_template_table` (
  `id` varchar(64) DEFAULT NULL,
  `sub_id` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatername` varchar(32) DEFAULT NULL,
  `tablename` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门信息子集模板表';

-- ----------------------------
-- Records of sys_template_table
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_dept_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept_position`;
CREATE TABLE `sys_user_dept_position` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `dr_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表（子集）表明记录';

-- ----------------------------
-- Records of sys_user_dept_position
-- ----------------------------

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `id` varchar(64) NOT NULL,
  `dept_id` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatername` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表（子集）表明记录';

-- ----------------------------
-- Records of t_dept
-- ----------------------------

-- ----------------------------
-- Table structure for t_dept_uuid
-- ----------------------------
DROP TABLE IF EXISTS `t_dept_uuid`;
CREATE TABLE `t_dept_uuid` (
  `id` int(11) NOT NULL,
  `dept_id` varchar(64) DEFAULT NULL,
  `sub_id` varchar(64) DEFAULT NULL,
  `en_table_name` varchar(100) DEFAULT NULL COMMENT '系统表名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表（子集）表明记录';

-- ----------------------------
-- Records of t_dept_uuid
-- ----------------------------
INSERT INTO `t_dept_uuid` VALUES ('0', '0', '0', null);
INSERT INTO `t_dept_uuid` VALUES ('1', '15a', 'b9c58084-5467-4e26-9607-1c2f742942c0', null);
INSERT INTO `t_dept_uuid` VALUES ('2', '15a', 'ed3a5543-bc18-4d45-abba-a0529a1aa46d', null);
INSERT INTO `t_dept_uuid` VALUES ('4', '15a', 'bf797dfc-487f-44de-81b4-186c04908a4d', null);
INSERT INTO `t_dept_uuid` VALUES ('5', '15a', '0a749e47-77da-4e38-aa36-f0e1a2b6278f', null);
INSERT INTO `t_dept_uuid` VALUES ('6', '15a', '7b8062ad-35e3-43b9-bb71-4d3aaa103544', null);
INSERT INTO `t_dept_uuid` VALUES ('7', '15a', '7c3ab851-3afa-4b4d-b7bc-834977e863d9', null);
INSERT INTO `t_dept_uuid` VALUES ('8', '16a', 'ab0033c9-acda-4f6b-90e3-beb9f638cd60', null);
INSERT INTO `t_dept_uuid` VALUES ('9', '16a', 'ce9e8a97-4c8b-48b4-95b2-7afc36526009', null);
INSERT INTO `t_dept_uuid` VALUES ('10', '16a', 'deafead0-f4dd-4423-b83e-b48579814702', null);
INSERT INTO `t_dept_uuid` VALUES ('11', '21a', '0c2ca030-02bd-44d5-a17a-c1f6bfac9c88', null);
INSERT INTO `t_dept_uuid` VALUES ('12', '15a', '0ad4cb60-6ce7-4446-96e5-80ef706f40a3', null);
INSERT INTO `t_dept_uuid` VALUES ('19', '15a', '92061d77-b877-4cdd-9e86-404784051c95', null);
INSERT INTO `t_dept_uuid` VALUES ('20', '15a', 'd25046ac-ea9f-4b9a-8937-59eeea3ac242', null);
INSERT INTO `t_dept_uuid` VALUES ('21', '15a', '65737159-a60b-4416-abbb-6d1b68402378', null);
INSERT INTO `t_dept_uuid` VALUES ('22', '16a', '02a27c26-5ceb-48ff-87a0-5f74c8e3f3f0', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('25', '15a', '744fb9ab-fcf9-4c4e-b532-4757c582e5e1', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('26', '15a', '1f046d34-f608-4d1c-a307-3980a664c9f2', '20171127CS1');
INSERT INTO `t_dept_uuid` VALUES ('28', '15a', '99f1cd82-464d-4f43-a85c-8be2aa8a4d1b', '20171127CS1');
INSERT INTO `t_dept_uuid` VALUES ('29', '15a', 'a8871b77-aade-4ce5-be0c-9404457a2554', 't_fnfl9f2o2s5');
INSERT INTO `t_dept_uuid` VALUES ('39', '15a', '2c7840bd-6bea-457c-a5be-b62d8047e5e9', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('40', '15a', '5f4e44c7-5f69-41d4-a3b7-98b87712411b', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('41', '15a', '014e6085-be75-4ca4-a4ce-ce34980bb932', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('42', '15a', '110e7a32-ef21-4fb5-b136-857934319949', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('43', '15a', 'ac709395-23ed-437d-903a-54edc78e0a3c', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('44', '15a', '752529a5-02c1-4eb2-a944-c0e15a7ce021', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('45', '15a', '5df24734-1dd0-4fc5-85f4-95cf0c06e565', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('46', '15a', 'fd6d6af4-d3fd-4ba7-b2dc-e2da30bb4ba7', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('47', '15a', '84c8d041-5cfd-4a00-9780-730e46910915', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('48', '15a', '3ea2c1f9-c89d-4ea3-9541-f810c450b3d2', 'T_FNFL9F2O2S4');
INSERT INTO `t_dept_uuid` VALUES ('49', '15a', 'ca1e45b5-4048-4708-bf0e-ebf78515e11a', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('50', '15a', '8e244f94-a46c-49bd-a878-8bef04d68c78', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('51', '15a', '20a973f1-7976-4c24-bbe3-c6b81e6de27d', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('52', '15a', '88b34556-35f9-45c5-9144-7fbd57e80fde', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('54', '15a', 'aebde574-0902-408b-8b8a-f8147350f485', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('56', '15a', 'e3b5cda8-e58c-47c1-8deb-67fd0b794316', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('57', '15a', 'ba33f7c9-b0b0-4373-82f0-cbc54dff0531', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('58', '15a', '97222039-df6c-4ecf-b02a-6bbe20d64d92', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('59', '15a', '6b47f168-e195-425f-a5d0-215733408dbc', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('60', '15a', '3ee3484b-772e-445c-bf23-2a9aa991e851', 'T_FNFL9F2O2S3');
INSERT INTO `t_dept_uuid` VALUES ('61', '15a', '4a7ed7b5-1ab7-483d-9a56-4391b36c5755', 'T_FNFL9F2O2S3');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatername` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表（子集）表明记录';

-- ----------------------------
-- Records of t_employee
-- ----------------------------

-- ----------------------------
-- Table structure for t_employee_uuid
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_uuid`;
CREATE TABLE `t_employee_uuid` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表（子集）表明记录';

-- ----------------------------
-- Records of t_employee_uuid
-- ----------------------------

-- ----------------------------
-- Table structure for t_fnfl9f2o2s3
-- ----------------------------
DROP TABLE IF EXISTS `t_fnfl9f2o2s3`;
CREATE TABLE `t_fnfl9f2o2s3` (
  `id` varchar(64) NOT NULL,
  `sub_id` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatername` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fnfl9f2o2s3
-- ----------------------------
INSERT INTO `t_fnfl9f2o2s3` VALUES ('0332bef0-15db-479c-921c-f93f1fc5ba2d', 'ad421861-f0d5-41ac-bd8c-98cb80e73acd', 'fax', '6', null, '2017-12-06 14:45 22', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('063c2c65-9de0-4a01-b835-796ecd32a844', 'd1502129-c532-4d7c-8b61-4d855bc0ba7f', 'fax', '1', null, '2017-12-06 14:43 44', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('06cf1850-54c9-4641-99ae-26f1b1563edd', '097b9ad8-57ef-486a-8edd-d357ec033469', 'bak', '3', null, '2017-12-06 14:44 58', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('06d9e931-8af2-4534-8d31-85e4972e6e26', '98e65002-e02b-43c7-8e03-07a3b162bf1b', 'bak', '22', null, '2017-12-06 15:19 26', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('08b51ea5-abd6-414b-ae3a-65f2199b4bdf', '22dbed5a-07e6-4ca7-a022-afbda025e015', 'address', '4', null, '2017-12-06 14:45 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('0a4b44af-63bd-43ff-882c-8306b2df02dc', '20a973f1-7976-4c24-bbe3-c6b81e6de27d', 'phone', '010-88888888', null, '2017-12-08 17:11 18', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('10585461-d223-443a-8a35-9e0394b82508', '18f295e7-d1e8-4a1e-81fd-253e2889bacb', 'bak', '1', null, '2017-12-06 14:43 14', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('1100bb28-e8c5-49c0-a6c4-0ffee17aef6f', '4a6c0802-d4eb-42cb-aabd-4dc5fedaa7ee', 'bak', '', null, '2017-12-06 14:02 16', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('11b7cc75-2bae-4f66-8c70-d7c9a6400e4a', '3ee3484b-772e-445c-bf23-2a9aa991e851', 'phone', '70', null, '2017-12-08 17:14 15', '2017-12-14 16:52 40', '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('1b0aa157-3349-4062-acac-2c1685adb1b4', 'ca1e45b5-4048-4708-bf0e-ebf78515e11a', 'address', '北京市朝阳区', null, '2017-12-08 17:10 43', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('1f993f8b-e989-4332-a953-11388eace06b', '88b34556-35f9-45c5-9144-7fbd57e80fde', 'phone', '1388888889', null, '2017-12-08 17:11 36', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('24b97a32-1c91-4b50-9199-5e31a354f469', '4a6c0802-d4eb-42cb-aabd-4dc5fedaa7ee', 'address', '北京市西城区', null, '2017-12-06 14:02 16', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('25e8567d-7347-438e-914e-1d6cddece4c5', '37f01c3f-2a26-4e78-adec-a2063c43badf', 'address', '北京市东城区', null, '2017-12-06 14:00 05', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('273ffb76-dc24-4d80-a0e0-b664f08dd8f4', '4a7ed7b5-1ab7-483d-9a56-4391b36c5755', 'phone', '8', null, '2017-12-08 17:14 23', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('28aa2807-e1ca-43ce-8010-cb315ed328d9', '4a7ed7b5-1ab7-483d-9a56-4391b36c5755', 'address', '8', null, '2017-12-08 17:14 23', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('28eefd3b-a0e6-49c3-9751-3a8741b013b5', '4a7ed7b5-1ab7-483d-9a56-4391b36c5755', 'email', '', null, '2017-12-08 17:14 23', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('2af3dd8d-3930-48c4-b354-bed4a8f1909d', '22dbed5a-07e6-4ca7-a022-afbda025e015', 'phone', '4', null, '2017-12-06 14:45 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('2b4dabc7-e67e-4af7-81e1-01757f4a7174', '18f295e7-d1e8-4a1e-81fd-253e2889bacb', 'phone', '1388888889', null, '2017-12-06 14:43 14', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('2e41c085-1f86-4bbb-ad00-f0e5a072423c', 'aebde574-0902-408b-8b8a-f8147350f485', 'address', '1', null, '2017-12-08 17:13 06', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('2fb884c3-ce52-4bdc-a70e-4891a11fd8ba', '6b47f168-e195-425f-a5d0-215733408dbc', 'email', '', null, '2017-12-08 17:14 10', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('3413c14d-6393-4d2e-a7a6-4f4364f798cd', '6b47f168-e195-425f-a5d0-215733408dbc', 'fax', '6', null, '2017-12-08 17:14 10', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('36caca5c-02a2-41a2-956e-29e0d5152132', '98e65002-e02b-43c7-8e03-07a3b162bf1b', 'address', '22', null, '2017-12-06 15:19 26', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('3700b61f-e806-455b-9c22-e4b83691693b', '18f295e7-d1e8-4a1e-81fd-253e2889bacb', 'email', '1', null, '2017-12-06 14:43 14', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('393a2e1b-bb06-4b90-942d-8a6d43a58da4', 'ad421861-f0d5-41ac-bd8c-98cb80e73acd', 'phone', '6', null, '2017-12-06 14:45 22', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('3a28cf92-89a3-4a1b-9560-f304e313c11a', '22dbed5a-07e6-4ca7-a022-afbda025e015', 'bak', '4', null, '2017-12-06 14:45 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('3a7d4aa3-e8d3-4095-8bad-48ac3bb614c0', '3ee3484b-772e-445c-bf23-2a9aa991e851', 'bak', '00', null, '2017-12-08 17:14 15', '2017-12-14 16:52 40', '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('3b6e9532-5668-4418-aae8-4d1bf3a9bb20', '588ec9f5-0cb3-41e4-b70c-4ca2734351c6', 'fax', '2', null, '2017-12-06 14:44 51', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('3cc166e6-c8ba-4eee-8828-1397c87b7282', 'b46dc954-6e71-4876-b08a-24532b9fc13a', 'fax', '7', null, '2017-12-06 14:45 33', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('3ee65a64-a757-45f8-9a93-c6b373520442', '88b34556-35f9-45c5-9144-7fbd57e80fde', 'email', '', null, '2017-12-08 17:11 36', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('4006aca1-6a1a-42aa-a84e-0361afaf926f', '6b47f168-e195-425f-a5d0-215733408dbc', 'phone', '6', null, '2017-12-08 17:14 10', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('456e9e17-0254-488e-9964-b46ef915eb2f', '98e65002-e02b-43c7-8e03-07a3b162bf1b', 'fax', '22', null, '2017-12-06 15:19 26', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('465a9752-2f89-41cd-8fa1-09e515c9c2a6', '734f1d6c-6975-4d58-ad9a-adf7ca8804a1', 'phone', '55', null, '2017-12-06 14:45 10', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('4872166e-4b7b-484a-9234-fe35057ecc60', '97222039-df6c-4ecf-b02a-6bbe20d64d92', 'email', '5', null, '2017-12-08 17:14 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('4c001eb6-1c9b-4329-9ee8-8079705f7ec0', '22dbed5a-07e6-4ca7-a022-afbda025e015', 'email', '4', null, '2017-12-06 14:45 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('4ca534d7-76b2-4578-8f88-10ffb5708351', 'b46dc954-6e71-4876-b08a-24532b9fc13a', 'address', '7', null, '2017-12-06 14:45 33', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('4d04abb5-4135-4cdd-baae-5121545127ff', '734f1d6c-6975-4d58-ad9a-adf7ca8804a1', 'address', '5', null, '2017-12-06 14:45 10', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('4ee7129b-b545-4c4c-9302-35f1f8f05814', '097b9ad8-57ef-486a-8edd-d357ec033469', 'phone', '3', null, '2017-12-06 14:44 58', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('51e194c8-a054-4e1c-a764-003e88d0c9d1', '97222039-df6c-4ecf-b02a-6bbe20d64d92', 'bak', '', null, '2017-12-08 17:14 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('52865130-01ab-4233-92db-7794777d1471', '8e244f94-a46c-49bd-a878-8bef04d68c78', 'bak', '通讯地址', null, '2017-12-08 17:11 01', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('54d69a69-28a1-4dba-bd69-fd5340f7b86b', '8e244f94-a46c-49bd-a878-8bef04d68c78', 'fax', '010-66666666', null, '2017-12-08 17:11 01', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('55cf3157-cdf1-4b3f-a6f6-d9c030c3bc56', 'aebde574-0902-408b-8b8a-f8147350f485', 'phone', '1', null, '2017-12-08 17:13 06', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('56381fd6-c909-4a43-a3e8-3e45f8f6eb5d', 'ba33f7c9-b0b0-4373-82f0-cbc54dff0531', 'fax', '', null, '2017-12-08 17:13 59', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('58aff37b-059e-471c-b364-51566ff5a5d6', 'ad421861-f0d5-41ac-bd8c-98cb80e73acd', 'address', '6', null, '2017-12-06 14:45 22', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('5b6cc8ac-fbf8-47c0-a5f4-5bbf5c17d1b7', 'ca1e45b5-4048-4708-bf0e-ebf78515e11a', 'phone', '010-88888866', null, '2017-12-08 17:10 43', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('5bb617d8-75a3-4a60-bdc6-5228f0e25195', '6b47f168-e195-425f-a5d0-215733408dbc', 'bak', '6', null, '2017-12-08 17:14 10', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('5bc70592-f6aa-4bbe-a438-938845f4ad9a', 'e3b5cda8-e58c-47c1-8deb-67fd0b794316', 'fax', '', null, '2017-12-08 17:13 55', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('5bddd709-d693-44ba-8b22-9899a3a718ab', '22dbed5a-07e6-4ca7-a022-afbda025e015', 'fax', '4', null, '2017-12-06 14:45 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('610ff110-97ad-47f2-bc27-c7d8e9664f32', '588ec9f5-0cb3-41e4-b70c-4ca2734351c6', 'email', '2', null, '2017-12-06 14:44 51', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('61abeea9-f2bc-43d0-83e9-af7d328389dd', '8e244f94-a46c-49bd-a878-8bef04d68c78', 'email', 'xu.bf@neusoft.com', null, '2017-12-08 17:11 01', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('629439d1-ae73-472d-9705-87979a7eadb2', 'aebde574-0902-408b-8b8a-f8147350f485', 'fax', '1', null, '2017-12-08 17:13 06', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('662d50ad-f55a-45a5-91db-5cb39dfd30eb', 'ca1e45b5-4048-4708-bf0e-ebf78515e11a', 'fax', '010-66666666', null, '2017-12-08 17:10 43', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('66347c02-b2a0-4e9e-bde6-3e7cce361e21', '18f295e7-d1e8-4a1e-81fd-253e2889bacb', 'address', '1', null, '2017-12-06 14:43 14', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('66c8fcdb-f661-4cd0-9a10-3f12dfb34bb1', '734f1d6c-6975-4d58-ad9a-adf7ca8804a1', 'bak', '5', null, '2017-12-06 14:45 10', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('68625933-d93b-4571-ba72-824709ca8448', '4a7ed7b5-1ab7-483d-9a56-4391b36c5755', 'bak', '8', null, '2017-12-08 17:14 23', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('69770e33-6bd4-45d1-8781-d4b829b0a924', '88b34556-35f9-45c5-9144-7fbd57e80fde', 'bak', '', null, '2017-12-08 17:11 36', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('6d0d4502-af6e-4e20-8148-e7d49546dd0b', 'e3b5cda8-e58c-47c1-8deb-67fd0b794316', 'bak', '', null, '2017-12-08 17:13 55', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('6e4d5ed7-3092-409b-b0a8-c46f9684af18', '06f28625-4e4a-46d5-ae87-cbe5326c46b6', 'bak', '12', null, '2017-12-07 11:58 25', '2017-12-07 13:48 41', '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('7245f554-b642-4e10-9218-cfce239d5b0a', '734f1d6c-6975-4d58-ad9a-adf7ca8804a1', 'fax', '5', null, '2017-12-06 14:45 10', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('745ed31d-5d66-4d34-ab63-8c263b7e0df7', '06f28625-4e4a-46d5-ae87-cbe5326c46b6', 'email', '', null, '2017-12-07 11:58 25', '2017-12-07 13:48 41', '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('7769e9ce-326c-448b-9c0e-3a14062835a5', '588ec9f5-0cb3-41e4-b70c-4ca2734351c6', 'bak', '12', null, '2017-12-06 14:44 51', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('77d2e922-978b-4e46-86e9-442ea0bfd45e', '097b9ad8-57ef-486a-8edd-d357ec033469', 'fax', '33', null, '2017-12-06 14:44 58', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('7889c5d9-8ffb-40f5-861f-472513522876', '37f01c3f-2a26-4e78-adec-a2063c43badf', 'fax', '010-88888888', null, '2017-12-06 14:00 05', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('7ba0b4a7-77bc-4fd9-a823-68e45f3c1ed3', '3ee3484b-772e-445c-bf23-2a9aa991e851', 'email', '7', null, '2017-12-08 17:14 15', '2017-12-14 16:52 40', '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('7bf41381-267c-45c9-9b55-c5a6928e5ff0', '097b9ad8-57ef-486a-8edd-d357ec033469', 'address', '3', null, '2017-12-06 14:44 58', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('7cf5e1c1-0f4c-48f0-8403-6dc540b6b3a1', '97222039-df6c-4ecf-b02a-6bbe20d64d92', 'phone', '5', null, '2017-12-08 17:14 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('8a90cc86-fd8f-496f-9c62-d409c65c1afd', 'e3b5cda8-e58c-47c1-8deb-67fd0b794316', 'email', '', null, '2017-12-08 17:13 55', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('8c233738-10c8-49be-acb7-4779dddc7552', '4a6c0802-d4eb-42cb-aabd-4dc5fedaa7ee', 'email', 'xu.bf@neusoft.com', null, '2017-12-06 14:02 16', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('8f6653ce-f277-4d86-9a49-5f8021f1c169', '98e65002-e02b-43c7-8e03-07a3b162bf1b', 'phone', '22', null, '2017-12-06 15:19 26', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('915e3829-56af-4348-9706-8e00b0427a7b', 'ba33f7c9-b0b0-4373-82f0-cbc54dff0531', 'address', '4', null, '2017-12-08 17:13 59', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('94ac5bfa-4282-4913-9690-1e1f8683a671', '588ec9f5-0cb3-41e4-b70c-4ca2734351c6', 'address', '2', null, '2017-12-06 14:44 51', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('94d91df6-2f3f-4f8f-9bc0-25551c59fcb5', '4a7ed7b5-1ab7-483d-9a56-4391b36c5755', 'fax', '', null, '2017-12-08 17:14 23', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('98245e01-34dc-46c3-8edf-079e0605aa85', 'ad421861-f0d5-41ac-bd8c-98cb80e73acd', 'bak', '6', null, '2017-12-06 14:45 22', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('989f1dd4-4ec6-424a-ba01-44e55f0d92f9', '06f28625-4e4a-46d5-ae87-cbe5326c46b6', 'address', '12', null, '2017-12-07 11:58 25', '2017-12-07 13:48 41', '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('9d5cede4-0771-47b2-85a1-187c10b124ac', 'e3b5cda8-e58c-47c1-8deb-67fd0b794316', 'address', '3', null, '2017-12-08 17:13 55', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('a335a7b1-1e6a-4ac8-9562-13e63499e432', 'ca1e45b5-4048-4708-bf0e-ebf78515e11a', 'bak', 'wertyui', null, '2017-12-08 17:10 43', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('a4dc6caa-6bbb-40c0-8555-8639f4600790', '097b9ad8-57ef-486a-8edd-d357ec033469', 'email', '3', null, '2017-12-06 14:44 58', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('a5f5f0a1-d954-4c89-b563-9b2447411e18', '97222039-df6c-4ecf-b02a-6bbe20d64d92', 'fax', '5', null, '2017-12-08 17:14 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('a80337a1-c42b-43f7-b6c6-08347413fbf7', '4a6c0802-d4eb-42cb-aabd-4dc5fedaa7ee', 'fax', '010-66666666', null, '2017-12-06 14:02 16', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('a87cf41d-74c3-4480-b972-eaaa97bcc2eb', '4a6c0802-d4eb-42cb-aabd-4dc5fedaa7ee', 'phone', '18800000000', null, '2017-12-06 14:02 16', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('b1c00160-d8ad-4f08-80a0-0744573ffb38', 'b555be7e-9f1d-4348-9b8d-43bee5c854c1', 'email', '8', null, '2017-12-06 14:45 48', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('b5dcc206-cd66-41cb-a8bf-1df469958c02', '588ec9f5-0cb3-41e4-b70c-4ca2734351c6', 'phone', '1', null, '2017-12-06 14:44 51', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('b8f3694d-4bef-4923-8366-d0ff8acafe85', 'b46dc954-6e71-4876-b08a-24532b9fc13a', 'email', '7', null, '2017-12-06 14:45 33', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('b999e733-971c-4766-828a-5b7ddb5f1972', '88b34556-35f9-45c5-9144-7fbd57e80fde', 'fax', '010-66666666', null, '2017-12-08 17:11 36', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('ba10317a-e107-48e5-94ad-df231bc4b360', '88b34556-35f9-45c5-9144-7fbd57e80fde', 'address', '天津市', null, '2017-12-08 17:11 36', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('bb907fc2-a3d8-45e3-8bd6-7acd667beb9d', '3ee3484b-772e-445c-bf23-2a9aa991e851', 'address', '70', null, '2017-12-08 17:14 15', '2017-12-14 16:52 40', '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('bd8a25ad-5159-4620-9889-94f9dff86116', 'd1502129-c532-4d7c-8b61-4d855bc0ba7f', 'phone', '18800000000', null, '2017-12-06 14:43 44', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('c0c14e37-2bd3-47fc-8313-0eb786b2a1e1', '98e65002-e02b-43c7-8e03-07a3b162bf1b', 'email', '22', null, '2017-12-06 15:19 26', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('c3d1d06b-1064-4078-9421-0cfc74ce0438', 'b46dc954-6e71-4876-b08a-24532b9fc13a', 'phone', '7', null, '2017-12-06 14:45 33', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('c5636bb5-1b3b-4c2c-bf5c-a7cd174672d4', '20a973f1-7976-4c24-bbe3-c6b81e6de27d', 'fax', '010-66666666', null, '2017-12-08 17:11 18', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('cda1c110-e16d-4ac5-b56e-8dfc4e38855f', 'ba33f7c9-b0b0-4373-82f0-cbc54dff0531', 'bak', '4', null, '2017-12-08 17:13 59', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d01de5a8-746e-477f-892c-da22b22a1dd0', '3ee3484b-772e-445c-bf23-2a9aa991e851', 'fax', '', null, '2017-12-08 17:14 15', '2017-12-14 16:52 40', '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d0250b28-cf17-4065-811f-0892b43fa5b5', '734f1d6c-6975-4d58-ad9a-adf7ca8804a1', 'email', '5', null, '2017-12-06 14:45 10', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d07cbd39-0118-463e-9299-369e1c133234', '20a973f1-7976-4c24-bbe3-c6b81e6de27d', 'email', '', null, '2017-12-08 17:11 18', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d13ff100-7f43-44b0-a8d1-19f3374efd96', 'b555be7e-9f1d-4348-9b8d-43bee5c854c1', 'address', '8', null, '2017-12-06 14:45 48', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d3789148-50e1-4538-a39e-8335cef16f74', 'aebde574-0902-408b-8b8a-f8147350f485', 'bak', '1', null, '2017-12-08 17:13 06', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d5c52f95-5f82-4daa-9566-6071e4f39cbe', 'e3b5cda8-e58c-47c1-8deb-67fd0b794316', 'phone', '3', null, '2017-12-08 17:13 55', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d821a3e6-bc90-47ae-a0b2-134e939fc846', 'ca1e45b5-4048-4708-bf0e-ebf78515e11a', 'email', 'xu.bf@neusoft.com', null, '2017-12-08 17:10 43', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d8363a8b-8559-46a7-ac3d-aee742eabd1c', 'ba33f7c9-b0b0-4373-82f0-cbc54dff0531', 'phone', '', null, '2017-12-08 17:13 59', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d930dc79-bf75-4986-9656-018eb3ed2a0e', 'd1502129-c532-4d7c-8b61-4d855bc0ba7f', 'address', '1', null, '2017-12-06 14:43 44', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d98321fb-dd10-42fc-9989-2636f7d5393a', 'b555be7e-9f1d-4348-9b8d-43bee5c854c1', 'phone', '8', null, '2017-12-06 14:45 48', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('d9d40d57-e065-4a20-8b53-e0c11a649b12', 'b555be7e-9f1d-4348-9b8d-43bee5c854c1', 'fax', '8', null, '2017-12-06 14:45 48', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('da5d6d06-4e30-42c9-a43e-41dd35eb37ed', '8e244f94-a46c-49bd-a878-8bef04d68c78', 'address', '北京市东城区', null, '2017-12-08 17:11 01', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('dca9c53e-64f2-4cd8-b938-a70a78a5dac1', 'b46dc954-6e71-4876-b08a-24532b9fc13a', 'bak', '7', null, '2017-12-06 14:45 33', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('e075dec9-a3a5-4dc2-84d4-651c2e37acca', '20a973f1-7976-4c24-bbe3-c6b81e6de27d', 'address', '北京市朝阳区', null, '2017-12-08 17:11 18', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('e17dc1d7-454d-4b19-8448-7365aa5920db', 'ad421861-f0d5-41ac-bd8c-98cb80e73acd', 'email', '6', null, '2017-12-06 14:45 22', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('e388f66d-d3fe-448b-906e-3b9f663d13c8', '06f28625-4e4a-46d5-ae87-cbe5326c46b6', 'phone', '12', null, '2017-12-07 11:58 25', '2017-12-07 13:48 41', '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('e6d51d47-e70a-4a7f-a90d-67ae59235409', '20a973f1-7976-4c24-bbe3-c6b81e6de27d', 'bak', '', null, '2017-12-08 17:11 18', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('ec7c0d8f-3f8a-4f9b-b4fa-834b146daa51', '37f01c3f-2a26-4e78-adec-a2063c43badf', 'bak', '测试列3', null, '2017-12-06 14:00 05', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('ece8f38d-8e63-4197-b7da-a7c243972a5a', 'ba33f7c9-b0b0-4373-82f0-cbc54dff0531', 'email', '', null, '2017-12-08 17:13 59', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('ed27753d-1caf-44a3-86b7-12edad7535e8', 'd1502129-c532-4d7c-8b61-4d855bc0ba7f', 'email', '1', null, '2017-12-06 14:43 44', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('f227f1b2-c2db-4b09-bdc9-9ee3487320fc', 'aebde574-0902-408b-8b8a-f8147350f485', 'email', '1', null, '2017-12-08 17:13 06', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('f299dfe6-4d4b-492a-b33d-a0c09ff1203c', '06f28625-4e4a-46d5-ae87-cbe5326c46b6', 'fax', '', null, '2017-12-07 11:58 25', '2017-12-07 13:48 41', '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('f3546bc8-7b72-4749-8ee9-26d00cf806d0', '37f01c3f-2a26-4e78-adec-a2063c43badf', 'phone', '010-88888866', null, '2017-12-06 14:00 05', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('f64a15ec-7721-4130-9ccb-a2d202e505e4', '8e244f94-a46c-49bd-a878-8bef04d68c78', 'phone', '18800000000', null, '2017-12-08 17:11 01', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('f6ba20d0-fdc1-4bfe-8f6e-4dfdd24a588d', 'b555be7e-9f1d-4348-9b8d-43bee5c854c1', 'bak', '8', null, '2017-12-06 14:45 48', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('f8ce78a9-61ff-4753-9bc6-997d52773312', 'd1502129-c532-4d7c-8b61-4d855bc0ba7f', 'bak', '1', null, '2017-12-06 14:43 44', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('fc6c5795-84cd-4e43-a386-58bac46e065d', '18f295e7-d1e8-4a1e-81fd-253e2889bacb', 'fax', '1', null, '2017-12-06 14:43 14', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('fd9a487c-42f7-4356-aa61-92dcdc88999f', '37f01c3f-2a26-4e78-adec-a2063c43badf', 'email', 'bf@qq.com', null, '2017-12-06 14:00 05', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('fe4f5976-bbf0-4f68-a07f-25807c7a3e3f', '97222039-df6c-4ecf-b02a-6bbe20d64d92', 'address', '', null, '2017-12-08 17:14 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s3` VALUES ('ff316571-427a-4dae-8211-3f2e34e14485', '6b47f168-e195-425f-a5d0-215733408dbc', 'address', '', null, '2017-12-08 17:14 10', null, '0', null, null);

-- ----------------------------
-- Table structure for t_fnfl9f2o2s4
-- ----------------------------
DROP TABLE IF EXISTS `t_fnfl9f2o2s4`;
CREATE TABLE `t_fnfl9f2o2s4` (
  `id` varchar(64) NOT NULL,
  `sub_id` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatername` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fnfl9f2o2s4
-- ----------------------------
INSERT INTO `t_fnfl9f2o2s4` VALUES ('022dd77c-34c1-477a-963f-94b67711c951', '014e6085-be75-4ca4-a4ce-ce34980bb932', 'phone', '3', null, '2017-12-06 14:58 00', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('060e8258-eec1-474b-afaf-80e93ae2113b', '84c8d041-5cfd-4a00-9780-730e46910915', 'name', '8', null, '2017-12-06 14:58 31', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('0ef09062-0a07-4d55-aece-81d6a3e7cd27', '744fb9ab-fcf9-4c4e-b532-4757c582e5e1', 'phone', '010-88888866', null, '2017-12-06 14:01 31', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('0f8e855f-7a6b-4a50-a770-58d90c325c42', '014e6085-be75-4ca4-a4ce-ce34980bb932', 'office', '3', null, '2017-12-06 14:58 00', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('1a24e982-37ef-4ff1-be65-0ac3231f3671', '110e7a32-ef21-4fb5-b136-857934319949', 'name', '4', null, '2017-12-06 14:58 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('242b1d1c-041e-4659-8274-419781dc5f15', '752529a5-02c1-4eb2-a944-c0e15a7ce021', 'phone', '6', null, '2017-12-06 14:58 14', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('2f06ed3e-36d7-48d8-bd01-a45d7df50691', '5df24734-1dd0-4fc5-85f4-95cf0c06e565', 'name', '6', null, '2017-12-06 14:58 19', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('3116665c-f659-4ba1-b50e-b387c7b0a4b2', 'fd6d6af4-d3fd-4ba7-b2dc-e2da30bb4ba7', 'name', '7', null, '2017-12-06 14:58 27', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('32a339a2-b25c-4094-bf1d-3ebd35a610be', '110e7a32-ef21-4fb5-b136-857934319949', 'phone', '4', null, '2017-12-06 14:58 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('3ac56ad7-039f-4bcf-86e7-f68eb75340a8', '5f4e44c7-5f69-41d4-a3b7-98b87712411b', 'name', '2', null, '2017-12-06 14:57 55', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('48f3507c-0a74-46bb-b886-71cda40864cd', '752529a5-02c1-4eb2-a944-c0e15a7ce021', 'name', '6', null, '2017-12-06 14:58 14', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('4bcc89c7-0f50-4aa3-869c-174de0da2a20', 'ac709395-23ed-437d-903a-54edc78e0a3c', 'office', '5', null, '2017-12-06 14:58 09', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('4bdcacc6-acce-441c-bed2-2f0bdbaf9771', '3ea2c1f9-c89d-4ea3-9541-f810c450b3d2', 'name', '8', null, '2017-12-06 14:58 36', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('50bc4d78-de9b-4548-a510-8d6fd42b67b3', '5f4e44c7-5f69-41d4-a3b7-98b87712411b', 'phone', '2', null, '2017-12-06 14:57 55', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('51b10936-bb66-4598-9991-bddb09e08c24', '752529a5-02c1-4eb2-a944-c0e15a7ce021', 'office', '6', null, '2017-12-06 14:58 14', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('55d2029a-ec6f-4525-834e-2a128fb7351b', 'ac709395-23ed-437d-903a-54edc78e0a3c', 'phone', '55', null, '2017-12-06 14:58 09', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('67697465-be38-4a39-bb28-381d8d23e7bd', '014e6085-be75-4ca4-a4ce-ce34980bb932', 'name', '3', null, '2017-12-06 14:58 00', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('79ae3831-4a1b-48d9-abfc-ea1538680f6b', '744fb9ab-fcf9-4c4e-b532-4757c582e5e1', 'name', '张三', null, '2017-12-06 14:01 31', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('8fbc1f40-986c-4bd1-b435-5fe252b4a38f', '2c7840bd-6bea-457c-a5be-b62d8047e5e9', 'office', '1', null, '2017-12-06 14:57 48', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('91cd3f41-d5f4-4c98-8f61-ebab2f91aa92', '744fb9ab-fcf9-4c4e-b532-4757c582e5e1', 'office', 'C区408', null, '2017-12-06 14:01 31', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('9c05c68f-623d-4c59-a4ad-7abeb71a5a87', 'ac709395-23ed-437d-903a-54edc78e0a3c', 'name', '5', null, '2017-12-06 14:58 09', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('9fdbe72a-640f-421c-b37e-a59792c6f882', '5df24734-1dd0-4fc5-85f4-95cf0c06e565', 'office', '6', null, '2017-12-06 14:58 19', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('a43e00df-136e-4f0b-a8d1-7905437ec053', '3ea2c1f9-c89d-4ea3-9541-f810c450b3d2', 'phone', '8', null, '2017-12-06 14:58 36', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('b306413f-42b4-4915-8377-bbfea40b0365', '110e7a32-ef21-4fb5-b136-857934319949', 'office', '4', null, '2017-12-06 14:58 04', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('b6b38248-45fa-49a7-89e9-e8bb45d10df0', 'fd6d6af4-d3fd-4ba7-b2dc-e2da30bb4ba7', 'office', '7', null, '2017-12-06 14:58 27', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('bb80a0f2-dea2-4a3d-bb7a-1f9dadfe9933', '3ea2c1f9-c89d-4ea3-9541-f810c450b3d2', 'office', '8', null, '2017-12-06 14:58 36', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('c148f612-8064-467f-bd41-09da80036639', '2c7840bd-6bea-457c-a5be-b62d8047e5e9', 'name', '1', null, '2017-12-06 14:57 48', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('c47ed8f4-119e-4b28-91b5-796d15a7d70b', '84c8d041-5cfd-4a00-9780-730e46910915', 'office', '8', null, '2017-12-06 14:58 31', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('c7a8de61-5195-427e-84dc-24723e78b5cc', '5f4e44c7-5f69-41d4-a3b7-98b87712411b', 'office', '2', null, '2017-12-06 14:57 55', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('d0628ced-caf0-484d-9a7e-22ea362571c7', '5df24734-1dd0-4fc5-85f4-95cf0c06e565', 'phone', '6', null, '2017-12-06 14:58 19', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('e27366fc-edfa-49ab-b2a8-24d6d8c78233', 'fd6d6af4-d3fd-4ba7-b2dc-e2da30bb4ba7', 'phone', '7ww7', null, '2017-12-06 14:58 27', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('e84b8a40-e57c-4a50-aea3-ede56e6fc849', '84c8d041-5cfd-4a00-9780-730e46910915', 'phone', '8', null, '2017-12-06 14:58 31', null, '0', null, null);
INSERT INTO `t_fnfl9f2o2s4` VALUES ('fe4dc4b1-49c7-4003-85a3-0edfa78c7846', '2c7840bd-6bea-457c-a5be-b62d8047e5e9', 'phone', '1', null, '2017-12-06 14:57 48', null, '0', null, null);

-- ----------------------------
-- Table structure for t_fnfl9f2o2s5
-- ----------------------------
DROP TABLE IF EXISTS `t_fnfl9f2o2s5`;
CREATE TABLE `t_fnfl9f2o2s5` (
  `id` varchar(64) NOT NULL,
  `sub_id` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatername` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fnfl9f2o2s5
-- ----------------------------
INSERT INTO `t_fnfl9f2o2s5` VALUES ('1f47c26e-757e-43bb-88e9-1d27833e4841', 'a8871b77-aade-4ce5-be0c-9404457a2554', 'content', '中国经济标题闪电发货空间打开；了', null, '2017-12-06 14:02 42', '2017-12-08 17:08 34', '0', null, null);
INSERT INTO `t_fnfl9f2o2s5` VALUES ('8a241e21-7882-4fc2-9b54-ddb24533eea2', 'a8871b77-aade-4ce5-be0c-9404457a2554', 'title', '中国经济标题', null, '2017-12-06 14:02 42', '2017-12-08 17:08 34', '0', null, null);

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `id` varchar(64) NOT NULL,
  `r_id` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatername` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表（子集）表明记录';

-- ----------------------------
-- Records of t_position
-- ----------------------------

-- ----------------------------
-- Table structure for t_position_duty_test
-- ----------------------------
DROP TABLE IF EXISTS `t_position_duty_test`;
CREATE TABLE `t_position_duty_test` (
  `id` varchar(64) NOT NULL,
  `sub_id` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatername` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position_duty_test
-- ----------------------------
INSERT INTO `t_position_duty_test` VALUES ('021f5129-3ceb-418a-868f-59180bd3d5fb', 'fb1a889a-a34e-427b-a3c5-4add618a99ba', 'content', '你猜', null, '2017-12-14 16:54 29', '2017-12-14 16:54 44', '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('05565924-5bf7-43b1-b0f7-227c8d34f052', 'fb1a889a-a34e-427b-a3c5-4add618a99ba', 'name', '你猜', null, '2017-12-14 16:54 29', '2017-12-14 16:54 44', '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('121d0ef7-30eb-4b20-88fd-4b1f207b61ce', '6d6a4157-694e-4429-b21e-80968ceef08b', 'content', '2', null, '2017-12-14 16:57 44', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('13e1b065-7ed9-4136-a3ee-f247f8b477b9', 'a1351d27-9a16-4738-8873-1d510a3d2b79', 'content', '5', null, '2017-12-14 16:58 01', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('1f09e8de-69be-4a22-9264-866c853fff73', '8466cde0-d37c-4c96-ae16-9dd8842fd7fd', 'test', '7', null, '2017-12-14 16:58 12', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('205d8b5b-5eec-48b0-8c9d-792f0598289e', 'd01076d6-af26-494b-b1c7-5a357e0af420', 'name', '检控通过', null, '2017-12-13 19:10 58', '2017-12-14 16:53 17', '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('21cf6706-40b7-41ec-ac26-400304b5b1bf', '8466cde0-d37c-4c96-ae16-9dd8842fd7fd', 'name', '7', null, '2017-12-14 16:58 12', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('239b5775-978d-4bc7-b162-7451775e9652', 'f0536217-216e-4c59-92d2-6471663b23df', 'content', '后勤管理', null, '2017-12-14 16:56 42', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('2559abf3-29ff-4c28-9458-89990253b97e', 'a1f36d95-0df8-4fd5-b202-a0d62e45000b', 'name', '222', null, '2017-12-16 14:47 29', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('26641515-bc0d-4e99-af99-dec6c63f7617', 'fb1a889a-a34e-427b-a3c5-4add618a99ba', 'test', '1', null, '2017-12-14 16:54 29', '2017-12-14 16:54 44', '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('26962e60-8d17-4ee2-8a5a-f6f647319ad2', 'f8583098-aa3b-4b22-a1c0-9db57315f6e8', 'test', '5c', null, '2017-12-16 14:48 05', '2017-12-16 15:08 52', '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('273c235e-e53d-47fe-b6df-da9a4fa22ae9', '2657ed68-8294-4616-8c14-3c59b186e316', 'name', '11', null, '2017-12-16 14:48 49', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('3276e02b-ac46-4860-9d3b-e54e01d4d482', 'a1f36d95-0df8-4fd5-b202-a0d62e45000b', 'content', '2', null, '2017-12-16 14:47 29', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('36640ddf-1262-4865-98e6-b474eadaad2d', 'c80d0794-c673-4c26-9957-4c7b59331619', 'content', '8', null, '2017-12-14 16:58 17', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('39cfa70d-2bbe-4683-a67e-c0a1f0cca57d', '9d776ef0-460a-4157-bee7-0d523ab64dea', 'test', '11', null, '2017-12-14 16:58 28', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('39d11d64-c16d-4c5b-b080-1c66d476c7cd', '037167cb-0bac-49d8-a084-e1c60a55428c', 'test', '9', null, '2017-12-14 16:58 22', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('3c505fb9-6e50-4bbe-8a1b-37c93796c59e', 'a1f36d95-0df8-4fd5-b202-a0d62e45000b', 'test', '2', null, '2017-12-16 14:47 29', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('3f715934-cd29-407f-a98e-a77b41cf6289', '546ac26d-02f8-4d09-baf3-bfa4644f3710', 'name', '1', null, '2017-12-16 14:47 23', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('433cc07d-e156-42a0-a964-86a098fa1bd9', 'cb44b7f8-6f95-4e24-920e-a650be6869e6', 'content', '7', null, '2017-12-16 14:48 33', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('444d5770-1655-44b1-ab59-46f250086f9d', '8466cde0-d37c-4c96-ae16-9dd8842fd7fd', 'content', '7', null, '2017-12-14 16:58 12', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('4cec7d23-05c1-457b-bbf7-c1296bdeec77', '546ac26d-02f8-4d09-baf3-bfa4644f3710', 'test', '1', null, '2017-12-16 14:47 23', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('53952349-11c8-4915-9db5-5debebb7a3c6', '2657ed68-8294-4616-8c14-3c59b186e316', 'test', '11', null, '2017-12-16 14:48 49', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('5711707c-30d8-4ee0-a670-4b0ae017c9c0', '785444d2-73d5-471e-aedf-b1623f2fa8b9', 'content', '3', null, '2017-12-14 16:57 49', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('57c50981-daf1-4867-9891-214d17a14eaa', 'f8583098-aa3b-4b22-a1c0-9db57315f6e8', 'content', '5c', null, '2017-12-16 14:48 05', '2017-12-16 15:08 52', '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('59d0e6a7-e07c-4fab-9a10-212c7d765a7b', '037167cb-0bac-49d8-a084-e1c60a55428c', 'content', '9', null, '2017-12-14 16:58 22', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('5e82a730-97db-4247-94eb-334eced00026', '51976865-e5ba-4fef-93c3-71c449803c41', 'test', '6', null, '2017-12-14 16:58 07', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('5efb6de2-1d93-4e02-8f46-83852594c3c3', '6d6a4157-694e-4429-b21e-80968ceef08b', 'name', '2', null, '2017-12-14 16:57 44', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('5f77e339-07ab-4c7e-9833-4c6498c1a2cf', '9f8d5462-76a5-4352-9dbf-ed20bcdb5ada', 'content', '4', null, '2017-12-16 14:48 00', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('62269fa3-6a10-4190-b930-bc1e533a85b0', '2622949b-297b-4740-bd8d-57e1c573b7b7', 'content', '8', null, '2017-12-16 14:48 38', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('6432cc1c-173d-48d3-930c-0cff4b7ea969', 'cb44b7f8-6f95-4e24-920e-a650be6869e6', 'test', '7', null, '2017-12-16 14:48 33', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('649d8dfb-625e-464c-b7a2-869970dfaa2c', 'f0536217-216e-4c59-92d2-6471663b23df', 'name', '后勤', null, '2017-12-14 16:56 42', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('64cf93d8-4b8f-4bdb-ab06-b193da562804', 'f0536217-216e-4c59-92d2-6471663b23df', 'test', '', null, '2017-12-14 16:56 42', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('662766d1-2dca-4160-bcbb-28fa369baa8b', '64d2ea22-f2c6-4105-88d9-a32c39d14667', 'content', '12', null, '2017-12-16 14:49 00', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('707dbf6c-6747-4f79-8b38-0511770fc4aa', 'a1351d27-9a16-4738-8873-1d510a3d2b79', 'name', '5', null, '2017-12-14 16:58 01', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('7497bf55-7d5e-431f-894b-f557d53a69e3', '87a8b49a-5bd9-4317-9397-96ade606761d', 'content', '6', null, '2017-12-16 14:48 28', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('74ec02f5-1b8f-456a-8996-d69c1598aa67', '39b24105-46c4-4ba5-b6b9-4ddb0bb7c91a', 'content', '4', null, '2017-12-14 16:57 55', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('7b4cc046-7014-4a6e-a522-72986e7d037c', '87a8b49a-5bd9-4317-9397-96ade606761d', 'name', '6', null, '2017-12-16 14:48 28', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('7e29217f-80b5-435e-8d6a-0d4843fa80d4', '3ca96d33-e300-4e41-b445-36c60a4c9a34', 'test', '9', null, '2017-12-16 14:48 43', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('81a5813c-2d6c-42fb-8eec-a8333c70b1f4', '51976865-e5ba-4fef-93c3-71c449803c41', 'content', '6', null, '2017-12-14 16:58 07', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('86b4f740-eee1-4cee-8c20-1938b5b99b5e', '6d6a4157-694e-4429-b21e-80968ceef08b', 'test', '2', null, '2017-12-14 16:57 44', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('88bd8367-c998-4afd-887c-729f299b6569', '39b24105-46c4-4ba5-b6b9-4ddb0bb7c91a', 'name', '4', null, '2017-12-14 16:57 55', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('88e61dbf-0bf5-42e1-a778-12504934aee0', '64d2ea22-f2c6-4105-88d9-a32c39d14667', 'test', '12', null, '2017-12-16 14:49 00', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('88e8260b-3a49-4511-9a72-aba1e060b9e6', '14123bfb-230f-4a1c-8827-316dab5b8926', 'name', '3', null, '2017-12-16 14:47 53', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('892f633a-9a34-4caa-aa8a-88735e03346f', 'c80d0794-c673-4c26-9957-4c7b59331619', 'name', '8', null, '2017-12-14 16:58 17', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('91152c14-e4b4-433f-a5cd-32b26cfd8f6d', 'f8583098-aa3b-4b22-a1c0-9db57315f6e8', 'name', '5c', null, '2017-12-16 14:48 05', '2017-12-16 15:08 52', '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('94cab8bc-7b19-42fa-b358-4cda7635d6eb', '14123bfb-230f-4a1c-8827-316dab5b8926', 'test', '3', null, '2017-12-16 14:47 53', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('959d165e-328d-4881-a769-e1047019a806', '2622949b-297b-4740-bd8d-57e1c573b7b7', 'test', '8', null, '2017-12-16 14:48 38', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('9a242081-07e0-44f3-8946-c24fea9d5862', '3ca96d33-e300-4e41-b445-36c60a4c9a34', 'content', '9', null, '2017-12-16 14:48 43', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('9a78ba24-f9e5-4f74-a0ae-5d057bb1919c', '2622949b-297b-4740-bd8d-57e1c573b7b7', 'name', '8', null, '2017-12-16 14:48 38', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('9b3ed4e2-d22b-4b83-8f79-5efba278dbe8', '87a8b49a-5bd9-4317-9397-96ade606761d', 'test', '6', null, '2017-12-16 14:48 28', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('9e01243d-3f51-40d7-9133-13caadba5522', '785444d2-73d5-471e-aedf-b1623f2fa8b9', 'name', '3', null, '2017-12-14 16:57 49', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('a69b854a-41e3-4fde-8910-6cc179b221c9', 'a1351d27-9a16-4738-8873-1d510a3d2b79', 'test', '5', null, '2017-12-14 16:58 01', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('a6c28943-bdf1-47f8-9440-bfb1e92eb1d8', '2657ed68-8294-4616-8c14-3c59b186e316', 'content', '11', null, '2017-12-16 14:48 49', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('a908224f-a99e-4202-8f3b-3accf4855974', '707706f2-53f4-473d-897f-6e245728b277', 'name', '1', null, '2017-12-14 16:57 37', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('b00d4275-4828-484a-abb3-04e8102dd1d0', '51976865-e5ba-4fef-93c3-71c449803c41', 'name', '6', null, '2017-12-14 16:58 07', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('b5c125e5-7151-4860-b67f-877fe69a2182', '785444d2-73d5-471e-aedf-b1623f2fa8b9', 'test', '3', null, '2017-12-14 16:57 49', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('b90698bb-2b88-4a2b-a29e-45b3f16447fb', '9d776ef0-460a-4157-bee7-0d523ab64dea', 'content', '11', null, '2017-12-14 16:58 28', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('bfa5d946-68f3-4ec4-9eb5-27a61369e7ce', 'cb44b7f8-6f95-4e24-920e-a650be6869e6', 'name', '7', null, '2017-12-16 14:48 33', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('c1a8f2ac-a058-43ab-bb80-bbc993ede574', '9d776ef0-460a-4157-bee7-0d523ab64dea', 'name', '11', null, '2017-12-14 16:58 28', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('c8c38d6f-069c-4a1e-a774-1d21695013aa', '9f8d5462-76a5-4352-9dbf-ed20bcdb5ada', 'name', '4', null, '2017-12-16 14:48 00', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('c8ebfeb2-fb03-4757-9b68-8749e877c7cf', '39b24105-46c4-4ba5-b6b9-4ddb0bb7c91a', 'test', '4', null, '2017-12-14 16:57 55', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('d98d172e-5cc9-4b1c-a50e-15d51698ecc3', '9f8d5462-76a5-4352-9dbf-ed20bcdb5ada', 'test', '4', null, '2017-12-16 14:48 00', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('db0c796c-069d-4c9b-a06b-a30c0c4f51cf', '707706f2-53f4-473d-897f-6e245728b277', 'test', '1', null, '2017-12-14 16:57 37', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('dbbb6244-1f5e-45a4-ace1-d34a2a68f3d2', '707706f2-53f4-473d-897f-6e245728b277', 'content', '1', null, '2017-12-14 16:57 37', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('df5c0b5b-2cff-4498-b0c8-4d1752299f47', '14123bfb-230f-4a1c-8827-316dab5b8926', 'content', '3', null, '2017-12-16 14:47 53', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('e47807c3-b464-43a9-94fb-876221a5c483', 'c80d0794-c673-4c26-9957-4c7b59331619', 'test', '8', null, '2017-12-14 16:58 17', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('e5ea41d1-3ca0-4abe-af9e-da331e237309', '546ac26d-02f8-4d09-baf3-bfa4644f3710', 'content', '1', null, '2017-12-16 14:47 23', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('e89b46c8-169a-46af-b8ad-94165301c380', '3ca96d33-e300-4e41-b445-36c60a4c9a34', 'name', '9', null, '2017-12-16 14:48 43', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('ec02c533-1e25-4841-a8f4-c7386920150d', 'd01076d6-af26-494b-b1c7-5a357e0af420', 'content', '中国经济标题', null, '2017-12-13 19:10 58', '2017-12-14 16:53 17', '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('f01046cd-e7c0-4539-8f99-289ecffaabb4', '037167cb-0bac-49d8-a084-e1c60a55428c', 'name', '9', null, '2017-12-14 16:58 22', null, '0', null, null);
INSERT INTO `t_position_duty_test` VALUES ('f88dd2ff-e427-41f2-b13f-5f74d1ba4c07', '64d2ea22-f2c6-4105-88d9-a32c39d14667', 'name', '21', null, '2017-12-16 14:49 00', null, '0', null, null);

-- ----------------------------
-- Table structure for t_position_level
-- ----------------------------
DROP TABLE IF EXISTS `t_position_level`;
CREATE TABLE `t_position_level` (
  `id` varchar(64) NOT NULL,
  `sub_id` varchar(64) DEFAULT NULL,
  `property` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `bak` varchar(1000) DEFAULT NULL,
  `createtime` varchar(64) DEFAULT NULL,
  `updatetime` varchar(64) DEFAULT NULL,
  `available` varchar(2) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `updatername` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position_level
-- ----------------------------
INSERT INTO `t_position_level` VALUES ('10590685-56a6-4e73-8312-facd699f430b', 'ac50937b-2a95-4c27-b718-5c5741ae0d96', 'level_mark', '高级岗位', null, '2017-12-16 13:32 39', null, '0', null, null);
INSERT INTO `t_position_level` VALUES ('693b7be0-f5b8-4cc5-944e-795cfdad51e2', '75a69705-6a81-4ece-b049-4108e4330f83', 'level', '初级', null, '2017-12-16 13:30 35', '2017-12-16 13:32 19', '0', null, null);
INSERT INTO `t_position_level` VALUES ('82a5e553-08f6-41af-aee6-f5a07b65b127', '75a69705-6a81-4ece-b049-4108e4330f83', 'level_mark', '初级岗位', null, '2017-12-16 13:30 35', '2017-12-16 13:32 19', '0', null, null);
INSERT INTO `t_position_level` VALUES ('974b0b62-c401-4463-965d-86db53bf8767', 'ac50937b-2a95-4c27-b718-5c5741ae0d96', 'level', '高级', null, '2017-12-16 13:32 39', null, '0', null, null);

-- ----------------------------
-- Table structure for t_position_organization
-- ----------------------------
DROP TABLE IF EXISTS `t_position_organization`;
CREATE TABLE `t_position_organization` (
  `sequence` int(11) NOT NULL,
  `position_id` varchar(64) NOT NULL,
  `organization_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `update_time` date DEFAULT NULL,
  PRIMARY KEY (`position_id`,`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存放部门和岗位之间的关联信息';

-- ----------------------------
-- Records of t_position_organization
-- ----------------------------
INSERT INTO `t_position_organization` VALUES ('0', '0', '0', '2017-12-29');
INSERT INTO `t_position_organization` VALUES ('1', '9d0fb533-6531-4892-a774-7f3c94be4cd7', '15a', '2018-02-08');
INSERT INTO `t_position_organization` VALUES ('2', '9d0fb533-6531-4892-a774-7f3c94be4cd7', '20a', '2018-02-08');
INSERT INTO `t_position_organization` VALUES ('3', '9d0fb533-6531-4892-a774-7f3c94be4cd7', '21a', '2018-02-08');
INSERT INTO `t_position_organization` VALUES ('4', '9d0fb533-6531-4892-a774-7f3c94be4cd7', '33a', '2018-02-08');

-- ----------------------------
-- Table structure for t_position_organization_his
-- ----------------------------
DROP TABLE IF EXISTS `t_position_organization_his`;
CREATE TABLE `t_position_organization_his` (
  `sequence` int(11) NOT NULL,
  `position_id` varchar(64) NOT NULL,
  `organization_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `update_time` date DEFAULT NULL,
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`position_id`,`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存放部门和岗位之间的关联信息（历史信息）';

-- ----------------------------
-- Records of t_position_organization_his
-- ----------------------------

-- ----------------------------
-- Table structure for t_position_organization_user
-- ----------------------------
DROP TABLE IF EXISTS `t_position_organization_user`;
CREATE TABLE `t_position_organization_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='部门岗位人员关联信息';

-- ----------------------------
-- Records of t_position_organization_user
-- ----------------------------
INSERT INTO `t_position_organization_user` VALUES ('1', '15a', 'ac5ae4c0-d782-4645-8e9f-dd32672a5ddb', '1', '2018-02-08 16:17:28');
INSERT INTO `t_position_organization_user` VALUES ('2', '16a', 'ac5ae4c0-d782-4645-8e9f-dd32672a5ddb', '0', '2018-02-08 16:17:28');

-- ----------------------------
-- Table structure for t_position_organization_user_his
-- ----------------------------
DROP TABLE IF EXISTS `t_position_organization_user_his`;
CREATE TABLE `t_position_organization_user_his` (
  `id` varchar(64) NOT NULL,
  `sequence` int(11) NOT NULL,
  `position_id` varchar(64) NOT NULL,
  `organization_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `update_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门岗位人员关联信息（历史信息）';

-- ----------------------------
-- Records of t_position_organization_user_his
-- ----------------------------

-- ----------------------------
-- Table structure for t_position_uuid
-- ----------------------------
DROP TABLE IF EXISTS `t_position_uuid`;
CREATE TABLE `t_position_uuid` (
  `id` int(11) NOT NULL,
  `sub_id` varchar(64) DEFAULT NULL,
  `position_id` varchar(64) DEFAULT NULL,
  `en_table_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表（子集）表明记录';

-- ----------------------------
-- Records of t_position_uuid
-- ----------------------------
INSERT INTO `t_position_uuid` VALUES ('0', '0', '0', '');
INSERT INTO `t_position_uuid` VALUES ('1', 'd01076d6-af26-494b-b1c7-5a357e0af420', '0e5102e4-cbc3-4b61-aa02-0fbdb8359e35', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('2', 'bbeb4743-3783-4b86-a567-43af99ca2693', '0e5102e4-cbc3-4b61-aa02-0fbdb8359e35', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('3', 'fb1a889a-a34e-427b-a3c5-4add618a99ba', '9d0fb533-6531-4892-a774-7f3c94be4cd7', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('4', 'f0536217-216e-4c59-92d2-6471663b23df', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('5', '707706f2-53f4-473d-897f-6e245728b277', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('6', '6d6a4157-694e-4429-b21e-80968ceef08b', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('7', '785444d2-73d5-471e-aedf-b1623f2fa8b9', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('8', '39b24105-46c4-4ba5-b6b9-4ddb0bb7c91a', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('9', 'a1351d27-9a16-4738-8873-1d510a3d2b79', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('10', '51976865-e5ba-4fef-93c3-71c449803c41', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('11', '8466cde0-d37c-4c96-ae16-9dd8842fd7fd', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('12', 'c80d0794-c673-4c26-9957-4c7b59331619', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('13', '037167cb-0bac-49d8-a084-e1c60a55428c', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('14', '9d776ef0-460a-4157-bee7-0d523ab64dea', '649ae315-fcf6-4e30-9666-a9a26e2afc58', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('15', '75a69705-6a81-4ece-b049-4108e4330f83', '4e9dd7d9-74fa-4a8b-8a4a-0dc426dcf7df', 't_position_level');
INSERT INTO `t_position_uuid` VALUES ('16', 'ac50937b-2a95-4c27-b718-5c5741ae0d96', '5a3697b8-2ff9-49cd-9f94-7935fec3a3e7', 't_position_level');
INSERT INTO `t_position_uuid` VALUES ('17', '546ac26d-02f8-4d09-baf3-bfa4644f3710', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('18', 'a1f36d95-0df8-4fd5-b202-a0d62e45000b', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('19', '14123bfb-230f-4a1c-8827-316dab5b8926', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('20', '9f8d5462-76a5-4352-9dbf-ed20bcdb5ada', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('21', 'f8583098-aa3b-4b22-a1c0-9db57315f6e8', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('22', '87a8b49a-5bd9-4317-9397-96ade606761d', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('23', 'cb44b7f8-6f95-4e24-920e-a650be6869e6', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('24', '2622949b-297b-4740-bd8d-57e1c573b7b7', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('25', '3ca96d33-e300-4e41-b445-36c60a4c9a34', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('26', '2657ed68-8294-4616-8c14-3c59b186e316', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');
INSERT INTO `t_position_uuid` VALUES ('27', '64d2ea22-f2c6-4105-88d9-a32c39d14667', '7aacad90-2e13-4439-80da-95c89fc86705', 't_position_duty_test');

-- ----------------------------
-- Table structure for ucenter_oauth
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_oauth`;
CREATE TABLE `ucenter_oauth` (
  `oauth_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '认证方式名称',
  PRIMARY KEY (`oauth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='认证方式表';

-- ----------------------------
-- Records of ucenter_oauth
-- ----------------------------
INSERT INTO `ucenter_oauth` VALUES ('1', '手机');
INSERT INTO `ucenter_oauth` VALUES ('2', '微信');
INSERT INTO `ucenter_oauth` VALUES ('3', 'QQ');
INSERT INTO `ucenter_oauth` VALUES ('4', '微博');

-- ----------------------------
-- Table structure for ucenter_user
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_user`;
CREATE TABLE `ucenter_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码(MD5(密码+盐))',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(4) DEFAULT '0' COMMENT '性别(0:未知,1:男,2:女)',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `create_ip` varchar(50) DEFAULT NULL COMMENT '注册IP地址',
  `last_login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '最后登录IP地址',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of ucenter_user
-- ----------------------------

-- ----------------------------
-- Table structure for ucenter_user_details
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_user_details`;
CREATE TABLE `ucenter_user_details` (
  `user_id` int(10) unsigned NOT NULL COMMENT '编号',
  `signature` varchar(300) DEFAULT NULL COMMENT '个性签名',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '出生日期',
  `question` varchar(100) DEFAULT NULL COMMENT '帐号安全问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '帐号安全答案',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_Reference_41` FOREIGN KEY (`user_id`) REFERENCES `ucenter_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户详情表';

-- ----------------------------
-- Records of ucenter_user_details
-- ----------------------------

-- ----------------------------
-- Table structure for ucenter_user_log
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_user_log`;
CREATE TABLE `ucenter_user_log` (
  `user_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户编号',
  `content` varbinary(100) DEFAULT NULL COMMENT '内容',
  `ip` varchar(20) DEFAULT NULL COMMENT '操作IP地址',
  `agent` varbinary(200) DEFAULT NULL COMMENT '操作环境',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`user_log_id`),
  KEY `FK_Reference_44` (`user_id`),
  CONSTRAINT `FK_Reference_44` FOREIGN KEY (`user_id`) REFERENCES `ucenter_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作日志表';

-- ----------------------------
-- Records of ucenter_user_log
-- ----------------------------

-- ----------------------------
-- Table structure for ucenter_user_oauth
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_user_oauth`;
CREATE TABLE `ucenter_user_oauth` (
  `user_oauth_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '帐号编号',
  `oauth_id` int(10) unsigned NOT NULL COMMENT '认证方式编号',
  `open_id` varbinary(50) NOT NULL COMMENT '第三方ID',
  `status` tinyint(4) unsigned DEFAULT NULL COMMENT '绑定状态(0:解绑,1:绑定)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_oauth_id`),
  KEY `FK_Reference_42` (`user_id`),
  KEY `FK_Reference_43` (`oauth_id`),
  CONSTRAINT `FK_Reference_42` FOREIGN KEY (`user_id`) REFERENCES `ucenter_user` (`user_id`),
  CONSTRAINT `FK_Reference_43` FOREIGN KEY (`oauth_id`) REFERENCES `ucenter_oauth` (`oauth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户认证方式表';

-- ----------------------------
-- Records of ucenter_user_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for upms_dict
-- ----------------------------
DROP TABLE IF EXISTS `upms_dict`;
CREATE TABLE `upms_dict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `upms_dict_value` (`value`),
  KEY `upms_dict_label` (`label`),
  KEY `upms_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of upms_dict
-- ----------------------------
INSERT INTO `upms_dict` VALUES ('441b58d1-5aa4-4022-86e1-0c7567654270', '2', '测试22', 'test', '测试2', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('4f0840f7-9ef1-4a5a-96fe-97aa208943dc', '0', '未读', 'is_read', '是否阅读', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('65547e43-7355-410e-8376-a267895eb028', '0', '女', 'sex', '性别', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('6f5563fd-6a6f-450f-bc30-f76350d2d37c', '1', '男', 'sex', '性别', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('90def06e-9872-458d-a985-b1d730338d3e', '4', '探亲假', 'furlough_type', '休假类型', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('a3a3419e-5a5a-40b4-b958-ab842b1ed920', '1', 'true', 'true_false', 'true_false', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('aff25e4d-0b41-4e7e-bf7e-6323f137e0c8', '2', '病假', 'furlough_type', '休假类型', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('b37eae60-2369-4d34-9520-c1694b0bc929', '3', '婚假', 'furlough_type', '休假类型', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('bcbe3882-d948-43f9-8fb2-03d3669f1f38', '1', '已读', 'is_read', '是否阅读', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('c086fad6-6166-4414-9777-f3c87af67c1a', '0', 'false', 'true_false', 'true_false', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('c653ddc1-b42e-4a09-9967-71363325da99', '1', '测试1', 'test', '测试', null, null, null, null, null, null, '0');
INSERT INTO `upms_dict` VALUES ('f84956f5-177e-4691-b137-71edcdd0fcad', '1', '事假', 'furlough_type', '休假类型', null, null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for upms_log
-- ----------------------------
DROP TABLE IF EXISTS `upms_log`;
CREATE TABLE `upms_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `description` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `start_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `spend_time` int(11) DEFAULT NULL COMMENT '消耗时间',
  `base_path` varchar(500) DEFAULT NULL COMMENT '根路径',
  `uri` varchar(500) DEFAULT NULL COMMENT 'URI',
  `url` varchar(500) DEFAULT NULL COMMENT 'URL',
  `method` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `parameter` mediumtext,
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户标识',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `result` mediumtext,
  `permissions` varchar(100) DEFAULT NULL COMMENT '权限值',
  PRIMARY KEY (`log_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19253 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

-- ----------------------------
-- Records of upms_log
-- ----------------------------

-- ----------------------------
-- Table structure for upms_organization
-- ----------------------------
DROP TABLE IF EXISTS `upms_organization`;
CREATE TABLE `upms_organization` (
  `organization_id` varchar(64) NOT NULL COMMENT '编号',
  `dept_id` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `pid` varchar(64) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '组织名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '组织描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `organization_code` varchar(64) DEFAULT NULL COMMENT '部门编号',
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织';

-- ----------------------------
-- Records of upms_organization
-- ----------------------------
INSERT INTO `upms_organization` VALUES ('14a', null, '0', '组织机构', '组织机构', '1510103551818', '1000000');
INSERT INTO `upms_organization` VALUES ('15a', null, '14a', '北京总部', '北京总部1', '1512723785991', '10001');
INSERT INTO `upms_organization` VALUES ('16a', null, '14a', '天津总部', '天津总部0', '1514601747984', '10002');
INSERT INTO `upms_organization` VALUES ('19a', null, '14a', '上海总部', '上海总部', '1510103687350', null);
INSERT INTO `upms_organization` VALUES ('1afa884a-8f41-43db-9ae4-543da868be01', 'da93da9c-a7a7-4296-95e2-133ab8fcfb4b', '14a', 'ce测试', 'ce测试', '1513071262186', '1111');
INSERT INTO `upms_organization` VALUES ('1c1df1ea-8d44-4769-abe8-71de70f24fb4', '27b441ab-0a43-4a89-acb8-a8676e190825', '23a', '测试', '测试', '1512298143654', null);
INSERT INTO `upms_organization` VALUES ('20a', null, '15a', '东城区', '东城区', '1510103712960', null);
INSERT INTO `upms_organization` VALUES ('21a', null, '15a', '西城区', '西城区1', '1510103794165', null);
INSERT INTO `upms_organization` VALUES ('22a', null, '19a', '浦东区', '浦东区', '1510103825069', null);
INSERT INTO `upms_organization` VALUES ('23a', null, '14a', '总部', '总部1', '1510106195022', null);
INSERT INTO `upms_organization` VALUES ('26a', null, '23a', '分部1', '分部1', '1510106281933', null);
INSERT INTO `upms_organization` VALUES ('33a', '2874de7a-e008-4f03-be70-a3c6e923535e', '15a', '朝阳区', '朝阳区', '1510559794134', null);
INSERT INTO `upms_organization` VALUES ('34a', 'eea8bdc8-5422-41dc-b7f7-0268c7bd951a', '23a', '分部2', '分部2', '1510560183969', null);
INSERT INTO `upms_organization` VALUES ('8dbe5e03-74cb-4b7a-b5ab-88e2d019e270', '6373a135-95ab-4ce0-8054-e7ce63ba73cb', '23a', '分部3', '分部3', '1512723848738', '10003-3');

-- ----------------------------
-- Table structure for upms_organization_his
-- ----------------------------
DROP TABLE IF EXISTS `upms_organization_his`;
CREATE TABLE `upms_organization_his` (
  `id` varchar(64) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `organization_id` varchar(64) DEFAULT NULL,
  `dept_id` varchar(64) DEFAULT NULL,
  `pid` varchar(64) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `ctime` bigint(20) DEFAULT NULL,
  `organization_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upms_organization_his
-- ----------------------------
INSERT INTO `upms_organization_his` VALUES ('2bbac65b-db1f-48aa-a00b-e22ce635552f', '北京总部', '15a', null, '14a', '北京总部', '1512723785991', '10001');
INSERT INTO `upms_organization_his` VALUES ('5c18e867-9a25-4851-a093-821fdedce1bb', '分部3', '8dbe5e03-74cb-4b7a-b5ab-88e2d019e270', '6373a135-95ab-4ce0-8054-e7ce63ba73cb', '14a', '分部3', '1512723848738', null);
INSERT INTO `upms_organization_his` VALUES ('63cc52e1-350b-421c-ae34-247aab912f9e', '天津总部', '16a', null, '14a', '天津总部0', '1514601747984', '10002');

-- ----------------------------
-- Table structure for upms_permission
-- ----------------------------
DROP TABLE IF EXISTS `upms_permission`;
CREATE TABLE `upms_permission` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `system_id` int(10) unsigned NOT NULL COMMENT '所属系统',
  `pid` int(10) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(1:目录,2:菜单,3:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `uri` varchar(100) DEFAULT NULL COMMENT '路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COMMENT='权限';

-- ----------------------------
-- Records of upms_permission
-- ----------------------------
INSERT INTO `upms_permission` VALUES ('1', '1', '0', '系统组织管理', '1', '', '', 'zmdi zmdi-accounts-list', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('2', '1', '1', '系统管理', '2', 'upms:system:read', '/manage/system/index', '', '1', '2', '2');
INSERT INTO `upms_permission` VALUES ('3', '1', '1', '组织管理', '2', 'upms:organization:read', '/manage/organization/index', '', '1', '3', '3');
INSERT INTO `upms_permission` VALUES ('4', '1', '0', '角色用户管理', '1', '', '', 'zmdi zmdi-accounts', '1', '4', '4');
INSERT INTO `upms_permission` VALUES ('5', '1', '4', '角色管理', '2', 'upms:role:read', '/manage/role/index', '', '1', '6', '6');
INSERT INTO `upms_permission` VALUES ('6', '1', '4', '用户管理', '2', 'upms:user:read', '/manage/user/index', '', '1', '5', '5');
INSERT INTO `upms_permission` VALUES ('7', '1', '0', '权限资源管理', '1', '', '', 'zmdi zmdi-lock-outline', '1', '7', '7');
INSERT INTO `upms_permission` VALUES ('12', '1', '0', '其他数据管理', '1', '', '', 'zmdi zmdi-more', '1', '12', '12');
INSERT INTO `upms_permission` VALUES ('14', '1', '12', '会话管理', '2', 'upms:session:read', '/manage/session/index', '', '1', '14', '14');
INSERT INTO `upms_permission` VALUES ('15', '1', '12', '日志记录', '2', 'upms:log:read', '/manage/log/index', '', '1', '15', '15');
INSERT INTO `upms_permission` VALUES ('17', '2', '0', '标签类目管理', '1', null, null, 'zmdi zmdi-menu', '1', '17', '17');
INSERT INTO `upms_permission` VALUES ('18', '2', '17', '标签管理', '2', 'cms:tag:read', '/manage/tag/index', null, '1', '18', '18');
INSERT INTO `upms_permission` VALUES ('19', '2', '17', '类目管理', '2', 'cms:category:read', '/manage/category/index', null, '1', '19', '19');
INSERT INTO `upms_permission` VALUES ('20', '2', '0', '文章评论管理', '1', null, null, 'zmdi zmdi-collection-text', '1', '20', '20');
INSERT INTO `upms_permission` VALUES ('21', '2', '20', '文章管理', '2', 'cms:article:read', '/manage/article/index', null, '1', '21', '21');
INSERT INTO `upms_permission` VALUES ('22', '2', '20', '回收管理', '2', 'cms:article:read', '/manage/article/recycle', null, '1', '22', '22');
INSERT INTO `upms_permission` VALUES ('24', '1', '2', '新增系统', '3', 'upms:system:create', '/manage/system/create', 'zmdi zmdi-plus', '1', '24', '24');
INSERT INTO `upms_permission` VALUES ('25', '1', '2', '编辑系统', '3', 'upms:system:update', '/manage/system/update', 'zmdi zmdi-edit', '1', '25', '25');
INSERT INTO `upms_permission` VALUES ('26', '1', '2', '删除系统', '3', 'upms:system:delete', '/manage/system/delete', 'zmdi zmdi-close', '1', '26', '26');
INSERT INTO `upms_permission` VALUES ('27', '1', '3', '新增组织', '3', 'upms:organization:create', '/manage/organization/create', 'zmdi zmdi-plus', '1', '27', '27');
INSERT INTO `upms_permission` VALUES ('28', '1', '3', '编辑组织', '3', 'upms:organization:update', '/manage/organization/update', 'zmdi zmdi-edit', '1', '28', '28');
INSERT INTO `upms_permission` VALUES ('29', '1', '3', '删除组织', '3', 'upms:organization:delete', '/manage/organization/delete', 'zmdi zmdi-close', '1', '29', '29');
INSERT INTO `upms_permission` VALUES ('30', '1', '6', '新增用户', '3', 'upms:user:create', '/manage/user/create', 'zmdi zmdi-plus', '1', '30', '30');
INSERT INTO `upms_permission` VALUES ('31', '1', '6', '编辑用户', '3', 'upms:user:update', '/manage/user/update', 'zmdi zmdi-edit', '1', '31', '31');
INSERT INTO `upms_permission` VALUES ('32', '1', '6', '删除用户', '3', 'upms:user:delete', '/manage/user/delete', 'zmdi zmdi-close', '1', '32', '32');
INSERT INTO `upms_permission` VALUES ('33', '1', '5', '新增角色', '3', 'upms:role:create', '/manage/role/create', 'zmdi zmdi-plus', '1', '33', '33');
INSERT INTO `upms_permission` VALUES ('34', '1', '5', '编辑角色', '3', 'upms:role:update', '/manage/role/update', 'zmdi zmdi-edit', '1', '34', '34');
INSERT INTO `upms_permission` VALUES ('35', '1', '5', '删除角色', '3', 'upms:role:delete', '/manage/role/delete', 'zmdi zmdi-close', '1', '35', '35');
INSERT INTO `upms_permission` VALUES ('36', '1', '39', '新增权限', '3', 'upms:permission:create', '/manage/permission/create', 'zmdi zmdi-plus', '1', '36', '36');
INSERT INTO `upms_permission` VALUES ('37', '1', '39', '编辑权限', '3', 'upms:permission:update', '/manage/permission/update', 'zmdi zmdi-edit', '1', '37', '37');
INSERT INTO `upms_permission` VALUES ('38', '1', '39', '删除权限', '3', 'upms:permission:delete', '/manage/permission/delete', 'zmdi zmdi-close', '1', '38', '38');
INSERT INTO `upms_permission` VALUES ('39', '1', '7', '权限管理', '2', 'upms:permission:read', '/manage/permission/index', null, '1', '39', '39');
INSERT INTO `upms_permission` VALUES ('46', '1', '5', '角色权限', '3', 'upms:role:permission', '/manage/role/permission', 'zmdi zmdi-key', '1', '1488091928257', '1488091928257');
INSERT INTO `upms_permission` VALUES ('48', '1', '6', '用户组织', '3', 'upms:user:organization', '/manage/user/organization', 'zmdi zmdi-accounts-list', '1', '1488120011165', '1488120011165');
INSERT INTO `upms_permission` VALUES ('50', '1', '6', '用户角色', '3', 'upms:user:role', '/manage/user/role', 'zmdi zmdi-accounts', '1', '1488120554175', '1488120554175');
INSERT INTO `upms_permission` VALUES ('51', '1', '6', '用户权限', '3', 'upms:user:permission', '/manage/user/permission', 'zmdi zmdi-key', '1', '1488092013302', '1488092013302');
INSERT INTO `upms_permission` VALUES ('53', '1', '14', '强制退出', '3', 'upms:session:forceout', '/manage/session/forceout', 'zmdi zmdi-run', '1', '1488379514715', '1488379514715');
INSERT INTO `upms_permission` VALUES ('54', '2', '18', '新增标签', '3', 'cms:tag:create', '/manage/tag/create', 'zmdi zmdi-plus', '1', '1489417315159', '1489417315159');
INSERT INTO `upms_permission` VALUES ('55', '2', '18', '编辑标签', '3', 'cms:tag:update', 'zmdi zmdi-edit', 'zmdi zmdi-widgets', '1', '1489417344931', '1489417344931');
INSERT INTO `upms_permission` VALUES ('56', '2', '18', '删除标签', '3', 'cms:tag:delete', '/manage/tag/delete', 'zmdi zmdi-close', '1', '1489417372114', '1489417372114');
INSERT INTO `upms_permission` VALUES ('57', '1', '15', '删除权限', '3', 'upms:log:delete', '/manage/log/delete', 'zmdi zmdi-close', '1', '1489503867909', '1489503867909');
INSERT INTO `upms_permission` VALUES ('58', '2', '19', '编辑类目', '3', 'cms:category:update', '/manage/category/update', 'zmdi zmdi-edit', '1', '1489586600462', '1489586600462');
INSERT INTO `upms_permission` VALUES ('59', '2', '19', '删除类目', '3', 'cms:category:delete', '/manage/category/delete', 'zmdi zmdi-close', '1', '1489586633059', '1489586633059');
INSERT INTO `upms_permission` VALUES ('60', '2', '19', '新增类目', '3', 'cms:category:create', '/manage/category/create', 'zmdi zmdi-plus', '1', '1489590342089', '1489590342089');
INSERT INTO `upms_permission` VALUES ('61', '2', '0', '其他数据管理', '1', '', '', 'zmdi zmdi-more', '1', '1489835455359', '1489835455359');
INSERT INTO `upms_permission` VALUES ('62', '2', '20', '评论管理', '2', 'cms:comment:read', '/manage/comment/index', '', '1', '1489591408224', '1489591408224');
INSERT INTO `upms_permission` VALUES ('63', '2', '62', '删除评论', '3', 'cms:comment:delete', '/manage/comment/delete', 'zmdi zmdi-close', '1', '1489591449614', '1489591449614');
INSERT INTO `upms_permission` VALUES ('64', '2', '79', '单页管理', '2', 'cms:page:read', '/manage/page/index', '', '1', '1489591332779', '1489591332779');
INSERT INTO `upms_permission` VALUES ('65', '2', '64', '新增单页', '3', 'cms:page:create', '/manage/page/create', 'zmdi zmdi-plus', '1', '1489591614473', '1489591614473');
INSERT INTO `upms_permission` VALUES ('66', '2', '64', '编辑单页', '3', 'cms:page:update', '/manage/page/update', 'zmdi zmdi-edit', '1', '1489591653000', '1489591653000');
INSERT INTO `upms_permission` VALUES ('67', '2', '64', '删除单页', '3', 'cms:page:delete', '/manage/page/delete', 'zmdi zmdi-close', '1', '1489591683552', '1489591683552');
INSERT INTO `upms_permission` VALUES ('68', '2', '61', '菜单管理', '2', 'cms:menu:read', '/manage/menu/index', 'zmdi zmdi-widgets', '1', '1489591746846', '1489591746846');
INSERT INTO `upms_permission` VALUES ('69', '2', '68', '新增菜单', '3', 'cms:menu:create', '/manage/menu/create', 'zmdi zmdi-plus', '1', '1489591791747', '1489591791747');
INSERT INTO `upms_permission` VALUES ('70', '2', '68', '编辑菜单', '3', 'cms:menu:update', '/manage/menu/update', 'zmdi zmdi-edit', '1', '1489591831878', '1489591831878');
INSERT INTO `upms_permission` VALUES ('71', '2', '68', '删除菜单', '3', 'cms:menu:delete', '/manage/menu/delete', 'zmdi zmdi-close', '1', '1489591865454', '1489591865454');
INSERT INTO `upms_permission` VALUES ('72', '2', '61', '系统设置', '2', 'cms:setting:read', '/manage/setting/index', 'zmdi zmdi-widgets', '1', '1489591981165', '1489591981165');
INSERT INTO `upms_permission` VALUES ('73', '2', '72', '新增设置', '3', 'cms:setting:create', '/manage/setting/create', 'zmdi zmdi-plus', '1', '1489592024762', '1489592024762');
INSERT INTO `upms_permission` VALUES ('74', '2', '72', '编辑设置', '3', 'cms:setting:update', '/manage/setting/update', 'zmdi zmdi-edit', '1', '1489592052582', '1489592052582');
INSERT INTO `upms_permission` VALUES ('75', '2', '72', '删除设置', '3', 'cms:setting:delete', '/manage/setting/delete', 'zmdi zmdi-close', '1', '1489592081426', '1489592081426');
INSERT INTO `upms_permission` VALUES ('76', '2', '21', '新增文章', '3', 'cms:article:create', '/manage/article/create', 'zmdi zmdi-plus', '1', '1489820150404', '1489820150404');
INSERT INTO `upms_permission` VALUES ('77', '2', '21', '编辑文章', '3', 'cms:article:update', '/manage/article/update', 'zmdi zmdi-edit', '1', '1489820178269', '1489820178269');
INSERT INTO `upms_permission` VALUES ('78', '2', '21', '删除文章', '3', 'cms:article:delete', '/manage/article/delete', 'zmdi zmdi-close', '1', '1489820207607', '1489820207607');
INSERT INTO `upms_permission` VALUES ('79', '2', '0', '单页专题管理', '1', '', '', 'zmdi zmdi-view-web', '1', '1489835320327', '1489835320327');
INSERT INTO `upms_permission` VALUES ('80', '2', '79', '专题管理', '2', 'cms:topic:read', '/manage/topic/index', 'zmdi zmdi-widgets', '1', '1489591507566', '1489591507566');
INSERT INTO `upms_permission` VALUES ('81', '2', '80', '新增专题', '3', 'cms:topic:create', '/manage/topic/create', 'zmdi zmdi-plus', '1', '1489843327028', '1489843327028');
INSERT INTO `upms_permission` VALUES ('82', '2', '80', '编辑专题', '3', 'cms:topic:update', '/manage/topic/update', 'zmdi zmdi-edit', '1', '1489843351513', '1489843351513');
INSERT INTO `upms_permission` VALUES ('83', '2', '80', '删除专题', '3', 'cms:topic:delete', '/manage/topic/delete', 'zmdi zmdi-close', '1', '1489843379953', '1489843379953');
INSERT INTO `upms_permission` VALUES ('84', '2', '68', '上移菜单', '3', 'cms:menu:up', '/manage/menu/up', 'zmdi zmdi-long-arrow-up', '1', '1489846486548', '1489846486548');
INSERT INTO `upms_permission` VALUES ('85', '2', '68', '下移菜单', '3', 'cms:menu:down', '/manage/menu/down', 'zmdi zmdi-long-arrow-down', '1', '1489846578051', '1489846578051');
INSERT INTO `upms_permission` VALUES ('86', '1', '3', '新增子集数据', '3', 'upms:organization:createSubset', '/manage/organization/createSubset', 'zmdi zmdi-plus', '1', '1511438441867', '1511438441867');
INSERT INTO `upms_permission` VALUES ('87', '1', '1', '岗位管理', '2', 'upms:position:read', '/manage/position/index', 'zmdi zmdi-widgets', '1', '1513067381894', '1513067381894');
INSERT INTO `upms_permission` VALUES ('88', '1', '87', '新增岗位', '3', 'upms:position:create', '/manage/position/create', 'zmdi zmdi-plus', '1', '1513070579812', '1513070579812');
INSERT INTO `upms_permission` VALUES ('89', '1', '87', '编辑岗位', '3', 'upms:position:update', '/manage/position/update', 'zmdi zmdi-edit', '1', '1513070777450', '1513070777450');
INSERT INTO `upms_permission` VALUES ('90', '1', '87', '删除岗位', '3', 'upms:position:delete', '/manage/position/delete', 'zmdi zmdi-close', '1', '1513070881684', '1513070881684');
INSERT INTO `upms_permission` VALUES ('91', '1', '87', '新增子集', '3', 'upms:position:createSubset', '/manage/position/createSubset', 'zmdi zmdi-plus', '1', '1513070942981', '1513070942981');
INSERT INTO `upms_permission` VALUES ('92', '1', '1', '岗位统计', '2', 'upms:position:read', '/manage/positionStatistics/statisticsView', 'zmdi zmdi-widgets', '1', '1513757483756', '1513757483756');
INSERT INTO `upms_permission` VALUES ('93', '1', '92', '添加岗位', '3', 'upms:position:addPosition', '/manage/position/addPosition', 'zmdi zmdi-plus', '1', '1514516111388', '1514516111388');
INSERT INTO `upms_permission` VALUES ('94', '1', '92', '添加组织', '3', 'upms:position:addOrg', '/manage/position/addOrg', 'zmdi zmdi-plus', '1', '1514516246936', '1514516246936');
INSERT INTO `upms_permission` VALUES ('95', '1', '92', '添加人员', '3', 'upms:position:addUser', '/manage/position/addUser', 'zmdi zmdi-plus', '1', '1514516285865', '1514516285865');
INSERT INTO `upms_permission` VALUES ('96', '1', '0', 'DEMO', '1', '', '', 'zmdi zmdi-widgets', '1', '1517276761685', '1517276761685');
INSERT INTO `upms_permission` VALUES ('97', '1', '0', '字典管理', '1', '', '', 'zmdi zmdi-widgets', '1', '1517276781615', '1517276781615');
INSERT INTO `upms_permission` VALUES ('98', '1', '97', '字典管理', '2', 'upms:dict:read', '/manage/dict/index', 'zmdi zmdi-widgets', '1', '1517276837569', '1517276837569');
INSERT INTO `upms_permission` VALUES ('99', '1', '98', '新增字典数据', '3', 'upms:dict:create', '/manage/dict/create', 'zmdi zmdi-plus', '1', '1517277007277', '1517277007277');
INSERT INTO `upms_permission` VALUES ('100', '1', '98', '修改字典数据', '3', 'upms:dict:update', '/manage/dict/update', 'zmdi zmdi-edit', '1', '1517277055643', '1517277055643');
INSERT INTO `upms_permission` VALUES ('101', '1', '98', '删除字典数据', '3', 'upms:dict:delete', '/manage/dict/delete', 'zmdi zmdi-close', '1', '1517277107812', '1517277107812');
INSERT INTO `upms_permission` VALUES ('102', '1', '96', '表格编辑', '2', 'demo', '/demo/index', 'zmdi zmdi-widgets', '1', '1517277806276', '1517277806276');
INSERT INTO `upms_permission` VALUES ('103', '1', '96', 'ueditor', '2', 'demo', '/demo/ueditor', 'zmdi zmdi-widgets', '1', '1517277851222', '1517277851222');
INSERT INTO `upms_permission` VALUES ('104', '1', '0', '薪酬管理', '1', '', '', 'zmdi zmdi-widgets', '1', '1517381280062', '1517381280062');
INSERT INTO `upms_permission` VALUES ('105', '1', '104', '薪酬标准管理', '2', 'upms:salary:read', '/manage/salary/salaryStandard', 'zmdi zmdi-widgets', '1', '1517381328597', '1517381328597');

-- ----------------------------
-- Table structure for upms_position
-- ----------------------------
DROP TABLE IF EXISTS `upms_position`;
CREATE TABLE `upms_position` (
  `position_id` varchar(64) NOT NULL COMMENT '编号',
  `dept_id` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `pid` varchar(64) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '岗位名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '岗位描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `position_code` varchar(64) DEFAULT NULL COMMENT '岗位编号',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位';

-- ----------------------------
-- Records of upms_position
-- ----------------------------
INSERT INTO `upms_position` VALUES ('08dedd5f-cc47-4613-8254-c5a1246da6c4', null, '649ae315-fcf6-4e30-9666-a9a26e2afc58', '后勤保障', '后勤保障', '1513401806294', '100005');
INSERT INTO `upms_position` VALUES ('0e5102e4-cbc3-4b61-aa02-0fbdb8359e35', 'cdde2d56-1387-405f-a010-e90fbbe04579', '1', '测试', '测试', '1513237748214', '100001');
INSERT INTO `upms_position` VALUES ('1', '1', '0', '岗位信息', '岗位信息', '1513401739492', '100001');
INSERT INTO `upms_position` VALUES ('18d647b5-70e6-44d6-b69e-39caa69b4a4a', null, '1', '技术岗位', '技术岗位', '1513400827707', '100003');
INSERT INTO `upms_position` VALUES ('249816c8-ef23-4a3c-b9fc-fc8580279e33', null, '606a55a5-4261-45dd-bf1b-f1d71e025211', '售前咨询', '售前咨询', '1513401776347', '100004');
INSERT INTO `upms_position` VALUES ('4e9dd7d9-74fa-4a8b-8a4a-0dc426dcf7df', null, '18d647b5-70e6-44d6-b69e-39caa69b4a4a', '初级技工', '初级技工', '1513400950972', '100001-2');
INSERT INTO `upms_position` VALUES ('5a3697b8-2ff9-49cd-9f94-7935fec3a3e7', null, '18d647b5-70e6-44d6-b69e-39caa69b4a4a', '高级技工', '高级技工', '1513400916760', '100001-1');
INSERT INTO `upms_position` VALUES ('606a55a5-4261-45dd-bf1b-f1d71e025211', null, '1', '销售岗位', '销售岗位', '1513400847584', '100004');
INSERT INTO `upms_position` VALUES ('649ae315-fcf6-4e30-9666-a9a26e2afc58', null, '1', '后勤岗位', '后勤岗', '1513400793719', '100003');
INSERT INTO `upms_position` VALUES ('78239b1e-37e3-48b5-8a12-2a6b1d2f8cc6', null, '7aacad90-2e13-4439-80da-95c89fc86705', '总经理', '总经理', '1513400993940', '100002-1');
INSERT INTO `upms_position` VALUES ('7aacad90-2e13-4439-80da-95c89fc86705', null, '1', '管理岗位', '管理岗', '1513400803171', '100002');
INSERT INTO `upms_position` VALUES ('9d0fb533-6531-4892-a774-7f3c94be4cd7', '6ded940b-4128-4e0e-934e-d422341c61cb', '0e5102e4-cbc3-4b61-aa02-0fbdb8359e35', 'test', '分部3', '1513073084056', '2fdffff');
INSERT INTO `upms_position` VALUES ('bc7b54c3-0779-478e-9e9f-1558f3f3f840', null, '1', '临时岗位', '临时岗位', '1513401834957', '100006');
INSERT INTO `upms_position` VALUES ('e30eadf2-f7a7-4a83-a40b-b6863632307b', null, '7aacad90-2e13-4439-80da-95c89fc86705', '董事会', '董事会', '1513401023039', '100002-2');

-- ----------------------------
-- Table structure for upms_position_his
-- ----------------------------
DROP TABLE IF EXISTS `upms_position_his`;
CREATE TABLE `upms_position_his` (
  `id` varchar(64) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `position_id` varchar(64) DEFAULT NULL,
  `dept_id` varchar(64) DEFAULT NULL,
  `pid` varchar(64) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `ctime` bigint(20) DEFAULT NULL,
  `position_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upms_position_his
-- ----------------------------
INSERT INTO `upms_position_his` VALUES ('1cf32b68-4be6-4441-a652-a80f6cf3d61b', '测试', '0e5102e4-cbc3-4b61-aa02-0fbdb8359e35', null, '1', '测试11', '1513237748214', '100001');
INSERT INTO `upms_position_his` VALUES ('2200d502-48e9-4068-91dd-8646d863a232', '测试', '0e5102e4-cbc3-4b61-aa02-0fbdb8359e35', null, '1', '测试', '1513237735976', '100001');
INSERT INTO `upms_position_his` VALUES ('41a864ec-06b7-4f7e-a1f5-2a7f546f7b26', '后勤岗', '649ae315-fcf6-4e30-9666-a9a26e2afc58', null, '1', '后勤岗', '1513400793719', '100003');
INSERT INTO `upms_position_his` VALUES ('58711c95-2fd2-4a66-96aa-f001d2e14789', '222', '05c76403-44ae-4d8c-9724-81fef42c34a6', 'b3743475-178c-438f-9e59-8b6cfabc1bdd', '1', '2', '1513072917152', '2');
INSERT INTO `upms_position_his` VALUES ('8aa15eb1-00f9-4b40-b9e7-fa77de0e0fd4', '岗位结构', '1', null, '0', '岗位结构', '1513401739492', '100001');
INSERT INTO `upms_position_his` VALUES ('9fb3f884-768a-4d98-939f-88e4f5bb9245', '管理岗', '7aacad90-2e13-4439-80da-95c89fc86705', null, '1', '管理岗', '1513400803171', '100002');
INSERT INTO `upms_position_his` VALUES ('f2f7ea9d-0023-465b-aa35-ace434e0e8b6', '1', '1', '1', '0', '1', '1513073039963', '1');

-- ----------------------------
-- Table structure for upms_role
-- ----------------------------
DROP TABLE IF EXISTS `upms_role`;
CREATE TABLE `upms_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `title` varchar(20) DEFAULT NULL COMMENT '角色标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '角色描述',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  `orders` bigint(20) NOT NULL COMMENT '排序',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of upms_role
-- ----------------------------
INSERT INTO `upms_role` VALUES ('1', 'super', '超级管理员', '拥有所有权限', '1', '1');
INSERT INTO `upms_role` VALUES ('2', 'admin', '管理员', '拥有除权限管理系统外的所有权限', '1487471013117', '1487471013117');

-- ----------------------------
-- Table structure for upms_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `upms_role_permission`;
CREATE TABLE `upms_role_permission` (
  `role_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色编号',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号',
  PRIMARY KEY (`role_permission_id`),
  KEY `FK_Reference_23` (`role_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`role_id`) REFERENCES `upms_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关联表';

-- ----------------------------
-- Records of upms_role_permission
-- ----------------------------
INSERT INTO `upms_role_permission` VALUES ('1', '1', '1');
INSERT INTO `upms_role_permission` VALUES ('2', '1', '2');
INSERT INTO `upms_role_permission` VALUES ('3', '1', '3');
INSERT INTO `upms_role_permission` VALUES ('4', '1', '4');
INSERT INTO `upms_role_permission` VALUES ('5', '1', '5');
INSERT INTO `upms_role_permission` VALUES ('6', '1', '6');
INSERT INTO `upms_role_permission` VALUES ('7', '1', '7');
INSERT INTO `upms_role_permission` VALUES ('8', '1', '39');
INSERT INTO `upms_role_permission` VALUES ('12', '1', '12');
INSERT INTO `upms_role_permission` VALUES ('14', '1', '14');
INSERT INTO `upms_role_permission` VALUES ('15', '1', '15');
INSERT INTO `upms_role_permission` VALUES ('17', '1', '17');
INSERT INTO `upms_role_permission` VALUES ('19', '1', '19');
INSERT INTO `upms_role_permission` VALUES ('20', '1', '20');
INSERT INTO `upms_role_permission` VALUES ('21', '1', '21');
INSERT INTO `upms_role_permission` VALUES ('24', '1', '24');
INSERT INTO `upms_role_permission` VALUES ('27', '1', '27');
INSERT INTO `upms_role_permission` VALUES ('28', '1', '28');
INSERT INTO `upms_role_permission` VALUES ('29', '1', '29');
INSERT INTO `upms_role_permission` VALUES ('30', '1', '30');
INSERT INTO `upms_role_permission` VALUES ('31', '1', '31');
INSERT INTO `upms_role_permission` VALUES ('32', '1', '32');
INSERT INTO `upms_role_permission` VALUES ('33', '1', '33');
INSERT INTO `upms_role_permission` VALUES ('34', '1', '34');
INSERT INTO `upms_role_permission` VALUES ('35', '1', '35');
INSERT INTO `upms_role_permission` VALUES ('36', '1', '36');
INSERT INTO `upms_role_permission` VALUES ('37', '1', '37');
INSERT INTO `upms_role_permission` VALUES ('38', '1', '38');
INSERT INTO `upms_role_permission` VALUES ('39', '1', '46');
INSERT INTO `upms_role_permission` VALUES ('40', '1', '51');
INSERT INTO `upms_role_permission` VALUES ('44', '1', '48');
INSERT INTO `upms_role_permission` VALUES ('45', '1', '50');
INSERT INTO `upms_role_permission` VALUES ('47', '1', '53');
INSERT INTO `upms_role_permission` VALUES ('48', '1', '18');
INSERT INTO `upms_role_permission` VALUES ('49', '1', '54');
INSERT INTO `upms_role_permission` VALUES ('50', '1', '54');
INSERT INTO `upms_role_permission` VALUES ('51', '1', '55');
INSERT INTO `upms_role_permission` VALUES ('52', '1', '54');
INSERT INTO `upms_role_permission` VALUES ('53', '1', '55');
INSERT INTO `upms_role_permission` VALUES ('54', '1', '56');
INSERT INTO `upms_role_permission` VALUES ('55', '1', '57');
INSERT INTO `upms_role_permission` VALUES ('56', '1', '58');
INSERT INTO `upms_role_permission` VALUES ('57', '1', '58');
INSERT INTO `upms_role_permission` VALUES ('58', '1', '59');
INSERT INTO `upms_role_permission` VALUES ('59', '1', '60');
INSERT INTO `upms_role_permission` VALUES ('60', '1', '61');
INSERT INTO `upms_role_permission` VALUES ('61', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('62', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('63', '1', '63');
INSERT INTO `upms_role_permission` VALUES ('64', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('65', '1', '63');
INSERT INTO `upms_role_permission` VALUES ('66', '1', '64');
INSERT INTO `upms_role_permission` VALUES ('67', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('68', '1', '63');
INSERT INTO `upms_role_permission` VALUES ('69', '1', '64');
INSERT INTO `upms_role_permission` VALUES ('70', '1', '65');
INSERT INTO `upms_role_permission` VALUES ('71', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('72', '1', '63');
INSERT INTO `upms_role_permission` VALUES ('73', '1', '64');
INSERT INTO `upms_role_permission` VALUES ('74', '1', '65');
INSERT INTO `upms_role_permission` VALUES ('75', '1', '66');
INSERT INTO `upms_role_permission` VALUES ('76', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('77', '1', '63');
INSERT INTO `upms_role_permission` VALUES ('78', '1', '64');
INSERT INTO `upms_role_permission` VALUES ('79', '1', '65');
INSERT INTO `upms_role_permission` VALUES ('80', '1', '66');
INSERT INTO `upms_role_permission` VALUES ('81', '1', '67');
INSERT INTO `upms_role_permission` VALUES ('82', '1', '68');
INSERT INTO `upms_role_permission` VALUES ('83', '1', '69');
INSERT INTO `upms_role_permission` VALUES ('84', '1', '69');
INSERT INTO `upms_role_permission` VALUES ('85', '1', '70');
INSERT INTO `upms_role_permission` VALUES ('86', '1', '69');
INSERT INTO `upms_role_permission` VALUES ('87', '1', '70');
INSERT INTO `upms_role_permission` VALUES ('88', '1', '71');
INSERT INTO `upms_role_permission` VALUES ('89', '1', '72');
INSERT INTO `upms_role_permission` VALUES ('90', '1', '72');
INSERT INTO `upms_role_permission` VALUES ('91', '1', '73');
INSERT INTO `upms_role_permission` VALUES ('92', '1', '72');
INSERT INTO `upms_role_permission` VALUES ('93', '1', '73');
INSERT INTO `upms_role_permission` VALUES ('94', '1', '74');
INSERT INTO `upms_role_permission` VALUES ('95', '1', '72');
INSERT INTO `upms_role_permission` VALUES ('96', '1', '73');
INSERT INTO `upms_role_permission` VALUES ('97', '1', '74');
INSERT INTO `upms_role_permission` VALUES ('98', '1', '75');
INSERT INTO `upms_role_permission` VALUES ('99', '1', '76');
INSERT INTO `upms_role_permission` VALUES ('100', '1', '76');
INSERT INTO `upms_role_permission` VALUES ('101', '1', '77');
INSERT INTO `upms_role_permission` VALUES ('102', '1', '76');
INSERT INTO `upms_role_permission` VALUES ('103', '1', '77');
INSERT INTO `upms_role_permission` VALUES ('105', '1', '79');
INSERT INTO `upms_role_permission` VALUES ('106', '1', '80');
INSERT INTO `upms_role_permission` VALUES ('107', '1', '81');
INSERT INTO `upms_role_permission` VALUES ('108', '1', '81');
INSERT INTO `upms_role_permission` VALUES ('109', '1', '82');
INSERT INTO `upms_role_permission` VALUES ('110', '1', '81');
INSERT INTO `upms_role_permission` VALUES ('111', '1', '82');
INSERT INTO `upms_role_permission` VALUES ('112', '1', '83');
INSERT INTO `upms_role_permission` VALUES ('113', '1', '84');
INSERT INTO `upms_role_permission` VALUES ('114', '1', '84');
INSERT INTO `upms_role_permission` VALUES ('115', '1', '85');
INSERT INTO `upms_role_permission` VALUES ('121', '1', '78');
INSERT INTO `upms_role_permission` VALUES ('122', '1', '78');
INSERT INTO `upms_role_permission` VALUES ('124', '1', '25');
INSERT INTO `upms_role_permission` VALUES ('125', '1', '26');
INSERT INTO `upms_role_permission` VALUES ('126', '2', '1');
INSERT INTO `upms_role_permission` VALUES ('127', '2', '2');
INSERT INTO `upms_role_permission` VALUES ('128', '2', '24');
INSERT INTO `upms_role_permission` VALUES ('129', '2', '25');
INSERT INTO `upms_role_permission` VALUES ('130', '2', '26');
INSERT INTO `upms_role_permission` VALUES ('131', '2', '3');
INSERT INTO `upms_role_permission` VALUES ('132', '2', '27');
INSERT INTO `upms_role_permission` VALUES ('133', '2', '28');
INSERT INTO `upms_role_permission` VALUES ('134', '2', '29');
INSERT INTO `upms_role_permission` VALUES ('135', '2', '4');
INSERT INTO `upms_role_permission` VALUES ('136', '2', '6');
INSERT INTO `upms_role_permission` VALUES ('137', '2', '30');
INSERT INTO `upms_role_permission` VALUES ('138', '2', '31');
INSERT INTO `upms_role_permission` VALUES ('139', '2', '32');
INSERT INTO `upms_role_permission` VALUES ('140', '2', '51');
INSERT INTO `upms_role_permission` VALUES ('141', '2', '48');
INSERT INTO `upms_role_permission` VALUES ('142', '2', '50');
INSERT INTO `upms_role_permission` VALUES ('143', '2', '7');
INSERT INTO `upms_role_permission` VALUES ('144', '2', '39');
INSERT INTO `upms_role_permission` VALUES ('145', '2', '36');
INSERT INTO `upms_role_permission` VALUES ('146', '2', '37');
INSERT INTO `upms_role_permission` VALUES ('147', '2', '38');
INSERT INTO `upms_role_permission` VALUES ('148', '2', '12');
INSERT INTO `upms_role_permission` VALUES ('149', '2', '14');
INSERT INTO `upms_role_permission` VALUES ('150', '2', '53');
INSERT INTO `upms_role_permission` VALUES ('151', '2', '15');
INSERT INTO `upms_role_permission` VALUES ('152', '2', '57');
INSERT INTO `upms_role_permission` VALUES ('153', '1', '86');
INSERT INTO `upms_role_permission` VALUES ('154', '1', '87');
INSERT INTO `upms_role_permission` VALUES ('155', '1', '88');
INSERT INTO `upms_role_permission` VALUES ('156', '1', '89');
INSERT INTO `upms_role_permission` VALUES ('157', '1', '90');
INSERT INTO `upms_role_permission` VALUES ('158', '1', '91');
INSERT INTO `upms_role_permission` VALUES ('159', '1', '92');
INSERT INTO `upms_role_permission` VALUES ('160', '1', '93');
INSERT INTO `upms_role_permission` VALUES ('161', '1', '94');
INSERT INTO `upms_role_permission` VALUES ('162', '1', '95');
INSERT INTO `upms_role_permission` VALUES ('163', '1', '96');
INSERT INTO `upms_role_permission` VALUES ('164', '1', '97');
INSERT INTO `upms_role_permission` VALUES ('165', '1', '98');
INSERT INTO `upms_role_permission` VALUES ('166', '1', '99');
INSERT INTO `upms_role_permission` VALUES ('167', '1', '100');
INSERT INTO `upms_role_permission` VALUES ('168', '1', '101');
INSERT INTO `upms_role_permission` VALUES ('169', '1', '102');
INSERT INTO `upms_role_permission` VALUES ('170', '1', '103');
INSERT INTO `upms_role_permission` VALUES ('171', '1', '104');
INSERT INTO `upms_role_permission` VALUES ('172', '1', '105');

-- ----------------------------
-- Table structure for upms_system
-- ----------------------------
DROP TABLE IF EXISTS `upms_system`;
CREATE TABLE `upms_system` (
  `system_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `banner` varchar(150) DEFAULT NULL COMMENT '背景',
  `theme` varchar(50) DEFAULT NULL COMMENT '主题',
  `basepath` varchar(100) DEFAULT NULL COMMENT '根目录',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(-1:黑名单,1:正常)',
  `name` varchar(20) DEFAULT NULL COMMENT '系统名称',
  `title` varchar(20) DEFAULT NULL COMMENT '系统标题',
  `description` varchar(300) DEFAULT NULL COMMENT '系统描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='系统';

-- ----------------------------
-- Records of upms_system
-- ----------------------------
INSERT INTO `upms_system` VALUES ('1', 'zmdi zmdi-shield-security', '/resources/zheng-admin/images/zheng-upms.png', '#29a176', 'http://upms.zhangshuzheng.cn:1111', '1', 'zheng-upms-server', '权限管理系统', '用户权限管理系统（RBAC细粒度用户权限、统一后台、单点登录、会话管理）', '1', '1');
INSERT INTO `upms_system` VALUES ('2', 'zmdi zmdi-wikipedia', '/resources/zheng-admin/images/zheng-cms.png', '#455EC5', 'http://cms.zhangshuzheng.cn:2222', '1', 'zheng-cms-admin', '内容管理系统', '内容管理系统（门户、博客、论坛、问答等）', '2', '2');
INSERT INTO `upms_system` VALUES ('3', 'zmdi zmdi-paypal-alt', '/resources/zheng-admin/images/zheng-pay.png', '#F06292', 'http://pay.zhangshuzheng.cn:3331', '1', 'zheng-pay-admin', '支付管理系统', '支付管理系统', '3', '3');
INSERT INTO `upms_system` VALUES ('4', 'zmdi zmdi-account', '/resources/zheng-admin/images/zheng-ucenter.png', '#6539B4', 'http://ucenter.zhangshuzheng.cn:4441', '1', 'zheng-ucenter-home', '用户管理系统', '用户管理系统', '4', '4');
INSERT INTO `upms_system` VALUES ('5', 'zmdi zmdi-cloud', '/resources/zheng-admin/images/zheng-oss.png', '#0B8DE5', 'http://oss.zhangshuzheng.cn:7771', '1', 'zheng-oss-web', '存储管理系统', '存储管理系统', '5', '5');

-- ----------------------------
-- Table structure for upms_user
-- ----------------------------
DROP TABLE IF EXISTS `upms_user`;
CREATE TABLE `upms_user` (
  `user_id` varchar(64) NOT NULL COMMENT '编号',
  `username` varchar(20) NOT NULL COMMENT '帐号',
  `password` varchar(32) NOT NULL COMMENT '密码MD5(密码+盐)',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `realname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(150) DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `locked` tinyint(4) DEFAULT NULL COMMENT '状态(0:正常,1:锁定)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `position_id` varchar(64) DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of upms_user
-- ----------------------------
INSERT INTO `upms_user` VALUES ('1', 'admin', '3038D9CB63B3152A79B8153FB06C02F7', '66f1b370c660445a8657bf8bf1794486', '管理员', '/resources/zheng-admin/images/avatar.jpg', '', '469741414@qq.com', '1', '0', '1', null);
INSERT INTO `upms_user` VALUES ('2', 'test', '285C9762F5F9046F5893F752DFAF3476', 'd2d0d03310444ad388a8b290b0fe8564', '张恕征1', '/resources/zheng-admin/images/avatar.jpg', '1425636985', '469741414@qq.com', '1', '0', '1493394720495', null);
INSERT INTO `upms_user` VALUES ('84cc6ec5-6bf3-4993-82c2-842289ef21ec', 'baifu', '7AF76FC023F4F6216E40B582D5BBDE89', 'f369b409ff744fa39fbfe1309873911f', '百富', '', '18800000000', 'bf@qq.com', '1', '0', '1511165375171', null);
INSERT INTO `upms_user` VALUES ('ac5ae4c0-d782-4645-8e9f-dd32672a5ddb', 'xbf', '2DDFD67CFE35A452D3209D4912B8439E', '8963e0e8b7374ba79e7655bafe962d78', '百富', '', '1888888888', '', '1', '0', '1518077847472', '5a3697b8-2ff9-49cd-9f94-7935fec3a3e7');

-- ----------------------------
-- Table structure for upms_user_organization
-- ----------------------------
DROP TABLE IF EXISTS `upms_user_organization`;
CREATE TABLE `upms_user_organization` (
  `user_organization_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `organization_id` varchar(64) NOT NULL COMMENT '组织编号',
  PRIMARY KEY (`user_organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='用户组织关联表';

-- ----------------------------
-- Records of upms_user_organization
-- ----------------------------
INSERT INTO `upms_user_organization` VALUES ('24', '1', '15');
INSERT INTO `upms_user_organization` VALUES ('25', '1', '16');
INSERT INTO `upms_user_organization` VALUES ('26', '2', '19');
INSERT INTO `upms_user_organization` VALUES ('27', '84cc6ec5-6bf3-4993-82c2-842289ef21ec', '15a');

-- ----------------------------
-- Table structure for upms_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `upms_user_permission`;
CREATE TABLE `upms_user_permission` (
  `user_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号',
  `type` tinyint(4) NOT NULL COMMENT '权限类型(-1:减权限,1:增权限)',
  PRIMARY KEY (`user_permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限关联表';

-- ----------------------------
-- Records of upms_user_permission
-- ----------------------------
INSERT INTO `upms_user_permission` VALUES ('3', '1', '22', '-1');
INSERT INTO `upms_user_permission` VALUES ('4', '1', '22', '1');
INSERT INTO `upms_user_permission` VALUES ('6', '2', '26', '-1');
INSERT INTO `upms_user_permission` VALUES ('7', '2', '27', '-1');
INSERT INTO `upms_user_permission` VALUES ('8', '2', '29', '-1');
INSERT INTO `upms_user_permission` VALUES ('9', '2', '32', '-1');
INSERT INTO `upms_user_permission` VALUES ('10', '2', '51', '-1');
INSERT INTO `upms_user_permission` VALUES ('11', '2', '48', '-1');
INSERT INTO `upms_user_permission` VALUES ('12', '2', '50', '-1');
INSERT INTO `upms_user_permission` VALUES ('13', '2', '35', '-1');
INSERT INTO `upms_user_permission` VALUES ('14', '2', '46', '-1');
INSERT INTO `upms_user_permission` VALUES ('15', '2', '37', '-1');
INSERT INTO `upms_user_permission` VALUES ('16', '2', '38', '-1');
INSERT INTO `upms_user_permission` VALUES ('17', '2', '57', '-1');
INSERT INTO `upms_user_permission` VALUES ('18', '2', '56', '-1');
INSERT INTO `upms_user_permission` VALUES ('19', '2', '59', '-1');
INSERT INTO `upms_user_permission` VALUES ('20', '2', '78', '-1');
INSERT INTO `upms_user_permission` VALUES ('21', '2', '67', '-1');
INSERT INTO `upms_user_permission` VALUES ('22', '2', '83', '-1');
INSERT INTO `upms_user_permission` VALUES ('23', '2', '71', '-1');
INSERT INTO `upms_user_permission` VALUES ('24', '2', '75', '-1');
INSERT INTO `upms_user_permission` VALUES ('27', '84cc6ec5-6bf3-4993-82c2-842289ef21ec', '24', '-1');
INSERT INTO `upms_user_permission` VALUES ('28', '84cc6ec5-6bf3-4993-82c2-842289ef21ec', '25', '-1');
INSERT INTO `upms_user_permission` VALUES ('29', '84cc6ec5-6bf3-4993-82c2-842289ef21ec', '26', '-1');

-- ----------------------------
-- Table structure for upms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `upms_user_role`;
CREATE TABLE `upms_user_role` (
  `user_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` int(10) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of upms_user_role
-- ----------------------------
INSERT INTO `upms_user_role` VALUES ('4', '1', '1');
INSERT INTO `upms_user_role` VALUES ('5', '1', '2');
INSERT INTO `upms_user_role` VALUES ('6', '2', '1');
INSERT INTO `upms_user_role` VALUES ('7', '2', '2');
INSERT INTO `upms_user_role` VALUES ('9', '84cc6ec5-6bf3-4993-82c2-842289ef21ec', '2');
INSERT INTO `upms_user_role` VALUES ('10', 'ac5ae4c0-d782-4645-8e9f-dd32672a5ddb', '1');
