/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-09-16 21:21:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu，button',
  `url` varchar(128) DEFAULT NULL COMMENT '访问URL地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` int(11) DEFAULT NULL COMMENT '父节点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父节点ID列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用，1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '权限', '', '', null, '0', '0/', '0', '1');
INSERT INTO `sys_permission` VALUES ('11', '商品管理', 'menu', '/item/queryItem.action', null, '1', '0/1/', '1.', '1');
INSERT INTO `sys_permission` VALUES ('12', '商品新增', 'permission', '/item/add.action', 'item:create', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('13', '商品修改', 'permission', '/item/editItem.action', 'item:update', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('14', '商品删除', 'permission', '', 'item:delete', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('15', '商品查询', 'permission', '/item/queryItem.action', 'item:query', '11', '0/1/15/', null, '1');
INSERT INTO `sys_permission` VALUES ('21', '用户管理', 'menu', '/user/query.action', 'user:query', '1', '0/1/', '2.', '1');
INSERT INTO `sys_permission` VALUES ('22', '用户新增', 'permission', '', 'user:create', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('23', '用户修改', 'permission', '', 'user:update', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('24', '用户删除', 'permission', '', 'user:delete', '21', '0/1/21/', '', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT '是否可用，1：可用，0：不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '商品管理员', '1');
INSERT INTO `sys_role` VALUES ('2', '用户管理员', '1');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_role_id` int(11) NOT NULL COMMENT '角色id',
  `sys_permission_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1', '11');
INSERT INTO `sys_role_permission` VALUES ('2', '1', '12');
INSERT INTO `sys_role_permission` VALUES ('3', '1', '13');
INSERT INTO `sys_role_permission` VALUES ('4', '1', '15');
INSERT INTO `sys_role_permission` VALUES ('5', '2', '21');
INSERT INTO `sys_role_permission` VALUES ('6', '2', '22');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `usercode` varchar(32) NOT NULL COMMENT '账号',
  `username` varchar(64) NOT NULL COMMENT '姓名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐',
  `locked` char(1) DEFAULT NULL COMMENT '账号是否锁定,1:锁定，0未锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'lisi', '李四', 'e10adc3949ba59abbe56e057f20f883e', 'uiwueylm', '0');
INSERT INTO `sys_user` VALUES ('2', 'zhangsan', '张三', 'e10adc3949ba59abbe56e057f20f883e', 'eteokues', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_user_id` int(11) NOT NULL COMMENT '用户id',
  `sys_role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2', '1');
INSERT INTO `sys_user_role` VALUES ('2', '1', '2');
