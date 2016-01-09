/*
Navicat MySQL Data Transfer

Source Server         : jxufe
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : pdca

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2015-06-16 08:14:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_bulletin`
-- ----------------------------
DROP TABLE IF EXISTS `t_bulletin`;
CREATE TABLE `t_bulletin` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `content` varchar(1000) default NULL,
  `publishTime` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Reference_6` (`user_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bulletin
-- ----------------------------

-- ----------------------------
-- Table structure for `t_deliver`
-- ----------------------------
DROP TABLE IF EXISTS `t_deliver`;
CREATE TABLE `t_deliver` (
  `id` int(11) NOT NULL auto_increment,
  `dispatcher` varchar(20) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `content` varchar(50) NOT NULL,
  `dispatcher_time` datetime NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_deliver
-- ----------------------------

-- ----------------------------
-- Table structure for `t_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `depId` int(11) NOT NULL auto_increment,
  `depName` varchar(255) NOT NULL,
  `depDesc` varchar(255) default NULL,
  PRIMARY KEY  (`depId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('9', '实验中心', '实验操作，测试');
INSERT INTO `t_department` VALUES ('10', '软件工程', '软通学院的一个主要枝干，是一个软件代码大神的集中地，是一个牛人的密集地，在这里技术与合作并存，是一个真正意义上的爱心与奉献同在的大家庭');
INSERT INTO `t_department` VALUES ('11', '网络工程', '软通学院的一个重要组成部分，主要学习网络与技术');
INSERT INTO `t_department` VALUES ('12', '通信工程', '软通学院的一个重要组成部分，主要学习通信及其应用方面的知识');
INSERT INTO `t_department` VALUES ('13', '电子工程', '软通学院的一个重要组成部分，主要学习电子技术及其应用，其中囊括了微电子等多方面的学习');
INSERT INTO `t_department` VALUES ('14', '产业化研究', '把技术实际化产业化的一个重要部门');
INSERT INTO `t_department` VALUES ('15', '院办公室', '院级领导，主要执行领导管理的部门');

-- ----------------------------
-- Table structure for `t_doc`
-- ----------------------------
DROP TABLE IF EXISTS `t_doc`;
CREATE TABLE `t_doc` (
  `id` int(11) NOT NULL auto_increment,
  `docName` varchar(1000) default NULL,
  `docType` varchar(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_doc
-- ----------------------------
INSERT INTO `t_doc` VALUES ('1', '软通学院教工联系方式一览表.xls', 'P');
INSERT INTO `t_doc` VALUES ('2', 'firefox.exe', 'P');
INSERT INTO `t_doc` VALUES ('3', 'firefox.exe', 'C');
INSERT INTO `t_doc` VALUES ('4', '学生科研申请表.doc', 'P');
INSERT INTO `t_doc` VALUES ('5', 'pdca.sql', 'P');

-- ----------------------------
-- Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(11) NOT NULL auto_increment,
  `projectname` varchar(500) default NULL,
  `description` varchar(3000) default NULL,
  `startTime` datetime default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Reference_2` (`user_id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('1', 'abcd', 'abcdefg', '2015-06-09 00:00:00', '82');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL auto_increment,
  `rolename` varchar(30) default NULL,
  `grade` int(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('4', '管理员', '0');
INSERT INTO `t_role` VALUES ('14', '院长', '1');
INSERT INTO `t_role` VALUES ('15', '党总支书记', '2');
INSERT INTO `t_role` VALUES ('16', '党总支副书记', '3');
INSERT INTO `t_role` VALUES ('17', '副院长', '4');
INSERT INTO `t_role` VALUES ('21', '院长助理', '4');
INSERT INTO `t_role` VALUES ('22', '分团委书记', '5');
INSERT INTO `t_role` VALUES ('25', '秘书', '5');
INSERT INTO `t_role` VALUES ('26', '教师', '6');
INSERT INTO `t_role` VALUES ('28', '系主任', '4');
INSERT INTO `t_role` VALUES ('29', '系副主任', '5');
INSERT INTO `t_role` VALUES ('30', '院办公室主任', '4');
INSERT INTO `t_role` VALUES ('31', '实验中心主任', '4');

-- ----------------------------
-- Table structure for `t_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) default NULL,
  `user_upper_id` int(11) default NULL,
  `user_lower_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Reference_3` (`project_id`),
  KEY `FK_Reference_4` (`user_upper_id`),
  KEY `FK_Reference_5` (`user_lower_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`user_upper_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`user_lower_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES ('1', '1', '82', '82');
INSERT INTO `t_task` VALUES ('2', '1', '82', '94');
INSERT INTO `t_task` VALUES ('3', '1', '82', '86');
INSERT INTO `t_task` VALUES ('4', '1', '82', '85');

-- ----------------------------
-- Table structure for `t_url`
-- ----------------------------
DROP TABLE IF EXISTS `t_url`;
CREATE TABLE `t_url` (
  `id` int(11) NOT NULL auto_increment,
  `urlType` varchar(20) default NULL,
  `docUrl` varchar(100) default NULL,
  `states` varchar(20) default '未完成',
  `checkstates` varchar(1000) default NULL,
  `advance` varchar(1000) default NULL,
  `num` int(11) default '1',
  `subtime` datetime default NULL,
  `endtime` datetime default NULL,
  `task_id` int(11) default NULL,
  `url_id` int(11) default NULL,
  `urlstates` varchar(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_taskURL` (`task_id`),
  KEY `FK_url` (`url_id`),
  CONSTRAINT `FK_taskURL` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_url` FOREIGN KEY (`url_id`) REFERENCES `t_url` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_url
-- ----------------------------
INSERT INTO `t_url` VALUES ('1', 'PDCA', 'firefox.exe', null, null, null, '1', null, '2015-06-04 00:00:00', '1', null, '已发布');
INSERT INTO `t_url` VALUES ('2', 'P', null, null, null, null, '1', null, '2015-06-04 00:00:00', '1', '1', null);
INSERT INTO `t_url` VALUES ('3', 'PDCA', 'firefox.exe', null, null, null, '1', null, '2015-06-24 00:00:00', '2', null, null);
INSERT INTO `t_url` VALUES ('4', 'C', null, null, null, null, '1', null, '2015-06-24 00:00:00', '2', '3', null);
INSERT INTO `t_url` VALUES ('5', 'PDCA', '学生科研申请表.doc', null, null, null, '1', null, '2015-06-02 00:00:00', '3', null, '已发布');
INSERT INTO `t_url` VALUES ('6', 'P', null, null, null, null, '1', null, '2015-06-02 00:00:00', '3', '5', null);
INSERT INTO `t_url` VALUES ('7', 'PDCA', 'pdca.sql', null, null, null, '1', null, '2015-06-10 00:00:00', '4', null, '已发布');
INSERT INTO `t_url` VALUES ('8', 'P', null, null, null, null, '1', null, '2015-06-10 00:00:00', '4', '7', null);

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(15) default NULL,
  `password` varchar(30) default NULL,
  `realname` varchar(15) default NULL,
  `sex` varchar(10) default NULL,
  `role_id` int(11) default NULL,
  `dep_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Reference_1` (`role_id`),
  KEY `FK_depId` (`dep_id`),
  CONSTRAINT `FK_depId` FOREIGN KEY (`dep_id`) REFERENCES `t_department` (`depId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('4', 'admin', 'admin', '系统管理员', null, '4', null);
INSERT INTO `t_user` VALUES ('82', 'gah', 'gah', '关爱浩', '1', '14', '15');
INSERT INTO `t_user` VALUES ('83', 'lxh', 'lxh', '李新海', '1', '15', '15');
INSERT INTO `t_user` VALUES ('84', 'px', 'px', '彭敏', '1', '16', '15');
INSERT INTO `t_user` VALUES ('85', 'hmj', 'hmj', '黄茂军', '1', '17', '15');
INSERT INTO `t_user` VALUES ('86', 'byh', 'byh', '白耀辉', '1', '17', '15');
INSERT INTO `t_user` VALUES ('87', 'dqs', 'dqs', '邓庆山', '1', '17', '15');
INSERT INTO `t_user` VALUES ('88', 'yrs', 'yrs', '易润水', '2', '17', '15');
INSERT INTO `t_user` VALUES ('89', 'lxf', 'lxf', '刘细发', '1', '21', '15');
INSERT INTO `t_user` VALUES ('90', 'll', 'll', '李  蕾', '2', '30', '15');
INSERT INTO `t_user` VALUES ('91', 'llf', 'llf', '刘丽芳', '2', '26', '15');
INSERT INTO `t_user` VALUES ('92', 'zhy', 'zhy', '周海燕', '2', '22', '15');
INSERT INTO `t_user` VALUES ('93', 'zxe', 'zxe', '张雪娥', '2', '25', '15');
INSERT INTO `t_user` VALUES ('94', 'zjj', 'zjj', '朱晶佳', '2', '25', '15');
INSERT INTO `t_user` VALUES ('95', 'oylh', 'oylh', '欧阳丽花', '2', '25', '15');
INSERT INTO `t_user` VALUES ('96', 'oyjy', 'oyjy', '欧阳建勇', '1', '26', '15');
INSERT INTO `t_user` VALUES ('97', 'wjp', 'wjp', '吴江平', '1', '31', '9');
INSERT INTO `t_user` VALUES ('98', 'xxb', 'xxb', '熊小兵', '1', '26', '9');
INSERT INTO `t_user` VALUES ('99', 'ch', 'ch', '陈  辉', '1', '28', '10');
INSERT INTO `t_user` VALUES ('100', 'wj', 'wj', '汪  靖', '1', '29', '10');
INSERT INTO `t_user` VALUES ('101', 'wcy', 'wcy', '毛澄映', '1', '26', '10');
INSERT INTO `t_user` VALUES ('102', 'yah', 'yah', '尹爱华', '2', '26', '10');
INSERT INTO `t_user` VALUES ('103', 'zc', 'zc', '张  驰', '1', '26', '10');
INSERT INTO `t_user` VALUES ('104', 'zxp', 'zxp', '赵晓平', '1', '26', '10');
INSERT INTO `t_user` VALUES ('105', 'tbd', 'tbd', '涂保东', '1', '26', '10');
INSERT INTO `t_user` VALUES ('106', 'lhc', 'lhc', '廖汗成', '1', '26', '10');
INSERT INTO `t_user` VALUES ('107', 'wwh', 'wwh', '吴文华', '1', '26', '10');
INSERT INTO `t_user` VALUES ('108', 'hdp', 'hdp', '胡冬萍', '2', '26', '10');
INSERT INTO `t_user` VALUES ('109', 'bhr', 'bhr', '边海容', '2', '26', '10');
INSERT INTO `t_user` VALUES ('110', 'cag', 'cag', '陈爱国', '1', '26', '10');
INSERT INTO `t_user` VALUES ('111', 'hx', 'hx', '黄轩', '1', '26', '10');
INSERT INTO `t_user` VALUES ('112', 'ds', 'ds', '邓松', '1', '26', '10');
INSERT INTO `t_user` VALUES ('113', 'yjy', 'yjy', '严军勇', '1', '28', '11');
INSERT INTO `t_user` VALUES ('114', 'wy', 'wy', '王  颖', '1', '29', '11');
INSERT INTO `t_user` VALUES ('115', 'zys', 'zys', '钟元生', '1', '26', '11');
INSERT INTO `t_user` VALUES ('116', 'zzb', 'zzb', '张志兵', '1', '26', '11');
INSERT INTO `t_user` VALUES ('117', 'xbz', 'xbz', '熊碧舟', '2', '26', '11');
INSERT INTO `t_user` VALUES ('118', 'lpc', 'lpc', '李普聪', '1', '26', '11');
INSERT INTO `t_user` VALUES ('119', 'xf', 'xf', '邢  芳', '2', '26', '11');
INSERT INTO `t_user` VALUES ('120', 'czh', 'czh', '曹重华', '1', '26', '11');
INSERT INTO `t_user` VALUES ('121', 'tyj', 'tyj', '唐颖军', '2', '26', '11');
INSERT INTO `t_user` VALUES ('122', 'lhy', 'lhy', '李华旸', '1', '26', '11');
INSERT INTO `t_user` VALUES ('123', 'wcx', 'wcx', '汪彩霞', '2', '26', '11');
INSERT INTO `t_user` VALUES ('124', 'zwq', 'zwq', '朱文强', '1', '26', '11');
INSERT INTO `t_user` VALUES ('125', 'ywy', 'ywy', '尧文元', '1', '28', '12');
INSERT INTO `t_user` VALUES ('126', 'lg', 'lg', '李  刚', '1', '29', '12');
INSERT INTO `t_user` VALUES ('127', 'sjc', 'sjc', '孙建成', '1', '26', '12');
INSERT INTO `t_user` VALUES ('128', 'lhc', 'lhc', '廖汉程', '1', '26', '12');
INSERT INTO `t_user` VALUES ('129', 'ljg', 'ljg', '罗建国', '1', '26', '12');
INSERT INTO `t_user` VALUES ('130', 'dly', 'dly', '戴利云', '2', '26', '12');
INSERT INTO `t_user` VALUES ('131', 'dsy', 'dsy', '黄淑英', '2', '26', '12');
INSERT INTO `t_user` VALUES ('132', 'dx', 'dx', '丁  雄', '1', '26', '12');
INSERT INTO `t_user` VALUES ('133', 'jn', 'jn', '蒋  娜', '2', '26', '12');
INSERT INTO `t_user` VALUES ('134', 'tlq', 'tlq', '涂丽琴', '2', '26', '12');
INSERT INTO `t_user` VALUES ('135', 'hxy', 'hxy', '黄新阳', '2', '26', '12');
INSERT INTO `t_user` VALUES ('136', 'lxx', 'lxx', '李小侠', '2', '26', '12');
INSERT INTO `t_user` VALUES ('137', 'yqm', 'yqm', '余泉茂', '1', '26', '12');
INSERT INTO `t_user` VALUES ('138', 'yxm', 'yxm', '杨小毛', '1', '26', '12');
INSERT INTO `t_user` VALUES ('139', 'cp', 'cp', '蔡  鹏', '1', '28', '13');
INSERT INTO `t_user` VALUES ('140', 'cb', 'cb', '陈  滨', '1', '29', '13');
INSERT INTO `t_user` VALUES ('141', 'zhg', 'zhg', '朱华贵', '1', '26', '13');
INSERT INTO `t_user` VALUES ('142', 'zy', 'zy', '张  勇', '1', '26', '13');
INSERT INTO `t_user` VALUES ('143', 'pxd', 'pxd', '彭向东', '1', '26', '13');
INSERT INTO `t_user` VALUES ('144', 'xdx', 'xdx', '肖大雪', '1', '26', '13');
INSERT INTO `t_user` VALUES ('145', 'djw', 'djw', '党建武', '1', '26', '13');
INSERT INTO `t_user` VALUES ('146', 'xl', 'xl', '谢  亮', '1', '26', '13');
INSERT INTO `t_user` VALUES ('147', 'hj', 'hj', '黄  坚', '1', '26', '13');
INSERT INTO `t_user` VALUES ('148', 'dmg', 'dmg', '邓梅根', '2', '26', '14');
INSERT INTO `t_user` VALUES ('149', 'wrq', 'wrq', '王仁清', '1', '26', '14');
INSERT INTO `t_user` VALUES ('150', 'hgh', 'hgh', '胡光辉', '1', '26', '14');
