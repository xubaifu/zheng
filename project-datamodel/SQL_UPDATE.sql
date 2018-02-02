DROP TABLE IF EXISTS `t_position_organization_user`;
CREATE TABLE `t_position_organization_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `is_primary` boolean NULL DEFAULT FALSE,
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门岗位人员关联信息';

alter table `upms_user` add column `position_id` varchar(64) DEFAULT NULL COMMENT '部门';