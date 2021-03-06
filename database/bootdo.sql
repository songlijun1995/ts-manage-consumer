/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : bootdo

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2018-05-21 01:08:08
*/

create database bootdo;

use bootdo;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('6', '0', '销售部', '1', '1');
INSERT INTO `sys_dept` VALUES ('7', '6', '销售二部', '2', '1');
INSERT INTO `sys_dept` VALUES ('8', '6', '销售一部', '2', '1');
INSERT INTO `sys_dept` VALUES ('9', '0', '人事部', '2', '1');
INSERT INTO `sys_dept` VALUES ('10', '9', '人事部', '1', '1');
INSERT INTO `sys_dept` VALUES ('11', '0', '技术部', '3', '1');
INSERT INTO `sys_dept` VALUES ('12', '11', '后台开发员工', '1', '1');
INSERT INTO `sys_dept` VALUES ('13', '0', '管理部', '5', '1');
INSERT INTO `sys_dept` VALUES ('16', '11', '前端开发员工', null, '1');
INSERT INTO `sys_dept` VALUES ('17', '13', '总经理', '4', '1');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` int(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('21', '公司', '1', 'sys_office_type', '机构类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('22', '部门', '2', 'sys_office_type', '机构类型', '70', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('23', '小组', '3', 'sys_office_type', '机构类型', '80', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('24', '其它', '4', 'sys_office_type', '机构类型', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('25', '综合部', '1', 'sys_office_common', '快捷通用部门', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('26', '开发部', '2', 'sys_office_common', '快捷通用部门', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('27', '人力部', '3', 'sys_office_common', '快捷通用部门', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('28', '一级', '1', 'sys_office_grade', '机构等级', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('29', '二级', '2', 'sys_office_grade', '机构等级', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('30', '三级', '3', 'sys_office_grade', '机构等级', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('31', '四级', '4', 'sys_office_grade', '机构等级', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('32', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('33', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('34', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('35', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('36', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('37', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('38', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('39', '系统管理', '1', 'sys_user_type', '用户类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('40', '部门经理', '2', 'sys_user_type', '用户类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('41', '普通用户', '3', 'sys_user_type', '用户类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('42', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('43', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('44', '红色主题', 'red', 'cms_theme', '站点主题', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('45', '文章模型', 'article', 'cms_module', '栏目模型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('46', '图片模型', 'picture', 'cms_module', '栏目模型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('47', '下载模型', 'download', 'cms_module', '栏目模型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('48', '链接模型', 'link', 'cms_module', '栏目模型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('49', '专题模型', 'special', 'cms_module', '栏目模型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('50', '默认展现方式', '0', 'cms_show_modes', '展现方式', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('51', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('52', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('53', '发布', '0', 'cms_del_flag', '内容状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('54', '删除', '1', 'cms_del_flag', '内容状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('55', '审核', '2', 'cms_del_flag', '内容状态', '15', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('56', '首页焦点图', '1', 'cms_posid', '推荐位', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('57', '栏目页文章推荐', '2', 'cms_posid', '推荐位', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('58', '咨询', '1', 'cms_guestbook', '留言板分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('59', '建议', '2', 'cms_guestbook', '留言板分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('60', '投诉', '3', 'cms_guestbook', '留言板分类', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('61', '其它', '4', 'cms_guestbook', '留言板分类', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('62', '公休', '1', 'oa_leave_type', '请假类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('63', '病假', '2', 'oa_leave_type', '请假类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('64', '事假', '3', 'oa_leave_type', '请假类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('65', '调休', '4', 'oa_leave_type', '请假类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('66', '婚假', '5', 'oa_leave_type', '请假类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('67', '接入日志', '1', 'sys_log_type', '日志类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('68', '异常日志', '2', 'sys_log_type', '日志类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('69', '请假流程', 'leave', 'act_type', '流程类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('70', '审批测试流程', 'test_audit', 'act_type', '流程类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('71', '分类1', '1', 'act_category', '流程分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('72', '分类2', '2', 'act_category', '流程分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('73', '增删改查', 'crud', 'gen_category', '代码生成分类', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('74', '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('75', '树结构', 'tree', 'gen_category', '代码生成分类', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('80', 'Between', 'between', 'gen_query_type', '查询方式', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'Like', 'like', 'gen_query_type', '查询方式', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'Left Like', 'left_like', 'gen_query_type', '查询方式', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'Right Like', 'right_like', 'gen_query_type', '查询方式', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('84', '文本框', 'input', 'gen_show_type', '字段生成方案', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('85', '文本域', 'textarea', 'gen_show_type', '字段生成方案', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('86', '下拉框', 'select', 'gen_show_type', '字段生成方案', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('87', '复选框', 'checkbox', 'gen_show_type', '字段生成方案', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('88', '单选框', 'radiobox', 'gen_show_type', '字段生成方案', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('89', '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('90', '人员选择', 'userselect', 'gen_show_type', '字段生成方案', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('91', '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('92', '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('95', '仅持久层', 'dao', 'gen_category', '代码生成分类', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('96', '男', '1', 'sex', '性别', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('97', '女', '2', 'sex', '性别', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('100', 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('105', '会议通告', '1', 'oa_notify_type', '通知通告类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('106', '奖惩通告', '2', 'oa_notify_type', '通知通告类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('107', '活动通告', '3', 'oa_notify_type', '通知通告类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('108', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('109', '发布', '1', 'oa_notify_status', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('110', '未读', '0', 'oa_notify_read', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('111', '已读', '1', 'oa_notify_read', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('112', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, '', '0');
INSERT INTO `sys_dict` VALUES ('113', '删除', '0', 'del_flag', '删除标记', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('118', '关于', 'about', 'blog_type', '博客类型', null, null, null, null, null, null, '全url是:/blog/open/page/about', '');
INSERT INTO `sys_dict` VALUES ('119', '交流', 'communication', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('120', '文章', 'article', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('121', '编程', 'code', 'hobby', '爱好', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('122', '绘画', 'painting', 'hobby', '爱好', null, null, null, null, null, null, '', '');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('141', '0', '/files/8f3b2034-5c6d-488e-893b-bcdb77e67c47.png', '2018-05-21 00:37:15');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=776 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '2', 'test', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 11:33:58');
INSERT INTO `sys_log` VALUES ('2', '2', 'test', '请求访问主页', '286', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 11:33:59');
INSERT INTO `sys_log` VALUES ('3', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 11:55:59');
INSERT INTO `sys_log` VALUES ('4', '1', 'admin', '请求访问主页', '32', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 11:55:59');
INSERT INTO `sys_log` VALUES ('5', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 11:56:56');
INSERT INTO `sys_log` VALUES ('6', '2', 'test', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 12:00:43');
INSERT INTO `sys_log` VALUES ('7', '2', 'test', '请求访问主页', '79', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:00:43');
INSERT INTO `sys_log` VALUES ('8', '2', 'test', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:00:52');
INSERT INTO `sys_log` VALUES ('9', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 12:01:03');
INSERT INTO `sys_log` VALUES ('10', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:01:03');
INSERT INTO `sys_log` VALUES ('11', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:01:22');
INSERT INTO `sys_log` VALUES ('12', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:16:26');
INSERT INTO `sys_log` VALUES ('13', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 12:23:19');
INSERT INTO `sys_log` VALUES ('14', '1', 'admin', '请求访问主页', '32', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:23:20');
INSERT INTO `sys_log` VALUES ('15', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 12:34:03');
INSERT INTO `sys_log` VALUES ('16', '1', 'admin', '请求访问主页', '81', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:34:04');
INSERT INTO `sys_log` VALUES ('17', '-1', '获取用户信息为空', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 20:26:22');
INSERT INTO `sys_log` VALUES ('18', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 20:26:28');
INSERT INTO `sys_log` VALUES ('19', '1', 'admin', '请求访问主页', '52', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 20:26:29');
INSERT INTO `sys_log` VALUES ('20', '1', 'admin', '登录', '47', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 15:33:29');
INSERT INTO `sys_log` VALUES ('21', '1', 'admin', '请求访问主页', '86', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 15:33:30');
INSERT INTO `sys_log` VALUES ('22', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 15:35:01');
INSERT INTO `sys_log` VALUES ('23', '1', 'admin', '请求访问主页', '282', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 15:35:01');
INSERT INTO `sys_log` VALUES ('24', '2', 'test', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 16:54:20');
INSERT INTO `sys_log` VALUES ('25', '2', 'test', '请求访问主页', '53', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 16:54:21');
INSERT INTO `sys_log` VALUES ('26', '2', 'test', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:11:16');
INSERT INTO `sys_log` VALUES ('27', '2', 'test', '请求访问主页', '30', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:11:17');
INSERT INTO `sys_log` VALUES ('28', '2', 'test', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:13:38');
INSERT INTO `sys_log` VALUES ('29', '2', 'test', '请求访问主页', '33', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:13:38');
INSERT INTO `sys_log` VALUES ('30', '2', 'test', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:14:54');
INSERT INTO `sys_log` VALUES ('31', '2', 'test', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:14:54');
INSERT INTO `sys_log` VALUES ('32', '2', 'test', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:17:54');
INSERT INTO `sys_log` VALUES ('33', '2', 'test', '请求访问主页', '40', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:17:55');
INSERT INTO `sys_log` VALUES ('34', '2', 'test', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:22:06');
INSERT INTO `sys_log` VALUES ('35', '2', 'test', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:23:57');
INSERT INTO `sys_log` VALUES ('36', '2', 'test', '请求访问主页', '30', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:23:57');
INSERT INTO `sys_log` VALUES ('37', '2', 'test', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:26:31');
INSERT INTO `sys_log` VALUES ('38', '2', 'test', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:27:11');
INSERT INTO `sys_log` VALUES ('39', '2', 'test', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:29:24');
INSERT INTO `sys_log` VALUES ('40', '2', 'test', '请求访问主页', '307', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:29:25');
INSERT INTO `sys_log` VALUES ('41', '2', 'test', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:31:18');
INSERT INTO `sys_log` VALUES ('42', '2', 'test', '请求访问主页', '40', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:31:18');
INSERT INTO `sys_log` VALUES ('43', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:31:57');
INSERT INTO `sys_log` VALUES ('44', '1', 'admin', '请求访问主页', '22', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:31:57');
INSERT INTO `sys_log` VALUES ('45', '2', 'test', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:32:08');
INSERT INTO `sys_log` VALUES ('46', '2', 'test', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:32:09');
INSERT INTO `sys_log` VALUES ('47', '2', 'test', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:33:14');
INSERT INTO `sys_log` VALUES ('48', '2', 'test', '请求访问主页', '331', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:33:14');
INSERT INTO `sys_log` VALUES ('49', '2', 'test', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:41:30');
INSERT INTO `sys_log` VALUES ('50', '2', 'test', '请求访问主页', '33', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:41:31');
INSERT INTO `sys_log` VALUES ('51', '2', 'test', '登录', '11', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-29 17:42:26');
INSERT INTO `sys_log` VALUES ('52', '2', 'test', '请求访问主页', '37', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-29 17:42:26');
INSERT INTO `sys_log` VALUES ('53', '2', 'test', '登录', '31', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 11:04:28');
INSERT INTO `sys_log` VALUES ('54', '2', 'test', '请求访问主页', '288', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 11:04:28');
INSERT INTO `sys_log` VALUES ('55', '2', 'test', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 11:32:25');
INSERT INTO `sys_log` VALUES ('56', '2', 'test', '请求访问主页', '79', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 11:32:26');
INSERT INTO `sys_log` VALUES ('57', '2', 'test', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 11:42:41');
INSERT INTO `sys_log` VALUES ('58', '2', 'test', '请求访问主页', '35', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 11:42:41');
INSERT INTO `sys_log` VALUES ('59', '2', 'test', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 11:46:15');
INSERT INTO `sys_log` VALUES ('60', '2', 'test', '请求访问主页', '32', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 11:46:16');
INSERT INTO `sys_log` VALUES ('61', '2', 'test', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 11:47:04');
INSERT INTO `sys_log` VALUES ('62', '2', 'test', '请求访问主页', '38', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 11:47:04');
INSERT INTO `sys_log` VALUES ('63', '2', 'test', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 12:09:16');
INSERT INTO `sys_log` VALUES ('64', '2', 'test', '请求访问主页', '37', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 12:09:17');
INSERT INTO `sys_log` VALUES ('65', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 12:09:26');
INSERT INTO `sys_log` VALUES ('66', '1', 'admin', '请求访问主页', '46', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 12:09:27');
INSERT INTO `sys_log` VALUES ('67', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 12:17:40');
INSERT INTO `sys_log` VALUES ('68', '1', 'admin', '请求访问主页', '26', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 12:17:40');
INSERT INTO `sys_log` VALUES ('69', '2', 'test', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 12:21:06');
INSERT INTO `sys_log` VALUES ('70', '2', 'test', '请求访问主页', '36', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 12:21:06');
INSERT INTO `sys_log` VALUES ('71', '1', 'admin', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 12:21:17');
INSERT INTO `sys_log` VALUES ('72', '1', 'admin', '请求访问主页', '29', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 12:21:17');
INSERT INTO `sys_log` VALUES ('73', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 12:28:04');
INSERT INTO `sys_log` VALUES ('74', '1', 'admin', '请求访问主页', '40', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 12:28:05');
INSERT INTO `sys_log` VALUES ('75', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 12:36:22');
INSERT INTO `sys_log` VALUES ('76', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 12:36:27');
INSERT INTO `sys_log` VALUES ('77', '2', 'test', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 12:43:18');
INSERT INTO `sys_log` VALUES ('78', '2', 'test', '请求访问主页', '29', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 12:43:18');
INSERT INTO `sys_log` VALUES ('79', '2', 'test', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 16:24:41');
INSERT INTO `sys_log` VALUES ('80', '2', 'test', '请求访问主页', '32', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 16:24:41');
INSERT INTO `sys_log` VALUES ('81', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 16:24:52');
INSERT INTO `sys_log` VALUES ('82', '1', 'admin', '请求访问主页', '22', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 16:24:52');
INSERT INTO `sys_log` VALUES ('83', '1', 'admin', '登录', '49', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 19:34:39');
INSERT INTO `sys_log` VALUES ('84', '1', 'admin', '请求访问主页', '181', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 19:34:40');
INSERT INTO `sys_log` VALUES ('85', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 19:36:22');
INSERT INTO `sys_log` VALUES ('86', '1', 'admin', '请求访问主页', '18', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 19:39:39');
INSERT INTO `sys_log` VALUES ('87', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 19:48:54');
INSERT INTO `sys_log` VALUES ('88', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 19:48:54');
INSERT INTO `sys_log` VALUES ('89', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 19:49:43');
INSERT INTO `sys_log` VALUES ('90', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-30 21:05:22');
INSERT INTO `sys_log` VALUES ('91', '1', 'admin', '请求访问主页', '16', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 21:05:22');
INSERT INTO `sys_log` VALUES ('92', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-30 21:05:39');
INSERT INTO `sys_log` VALUES ('93', '2', 'test', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-31 14:56:37');
INSERT INTO `sys_log` VALUES ('94', '2', 'test', '请求访问主页', '44', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-31 14:56:38');
INSERT INTO `sys_log` VALUES ('95', '1', 'admin', '登录', '1', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-31 14:58:39');
INSERT INTO `sys_log` VALUES ('96', '1', 'admin', '请求访问主页', '4', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-31 14:58:40');
INSERT INTO `sys_log` VALUES ('97', '1', 'admin', '请求访问主页', '5', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-31 14:59:26');
INSERT INTO `sys_log` VALUES ('98', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-31 15:03:53');
INSERT INTO `sys_log` VALUES ('99', '1', 'admin', '请求访问主页', '41', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-31 15:03:53');
INSERT INTO `sys_log` VALUES ('100', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 08:57:50');
INSERT INTO `sys_log` VALUES ('101', '1', 'admin', '请求访问主页', '71', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 08:57:50');
INSERT INTO `sys_log` VALUES ('102', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 09:45:46');
INSERT INTO `sys_log` VALUES ('103', '1', 'admin', '请求访问主页', '42', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 09:45:46');
INSERT INTO `sys_log` VALUES ('104', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 15:42:15');
INSERT INTO `sys_log` VALUES ('105', '1', 'admin', '请求访问主页', '140', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 15:42:15');
INSERT INTO `sys_log` VALUES ('106', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 15:53:54');
INSERT INTO `sys_log` VALUES ('107', '1', 'admin', '请求访问主页', '23', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 15:53:54');
INSERT INTO `sys_log` VALUES ('108', '1', 'admin', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 16:14:20');
INSERT INTO `sys_log` VALUES ('109', '1', 'admin', '登录', '13', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 16:29:03');
INSERT INTO `sys_log` VALUES ('110', '1', 'admin', '请求访问主页', '44', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 16:29:04');
INSERT INTO `sys_log` VALUES ('111', '1', 'admin', '请求访问主页', '27', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 16:30:30');
INSERT INTO `sys_log` VALUES ('112', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 17:09:49');
INSERT INTO `sys_log` VALUES ('113', '1', 'admin', '请求访问主页', '44', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 17:09:49');
INSERT INTO `sys_log` VALUES ('114', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 17:11:05');
INSERT INTO `sys_log` VALUES ('115', '1', 'admin', '请求访问主页', '45', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 17:11:05');
INSERT INTO `sys_log` VALUES ('116', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 17:15:11');
INSERT INTO `sys_log` VALUES ('117', '1', 'admin', '请求访问主页', '36', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 17:15:11');
INSERT INTO `sys_log` VALUES ('118', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 17:25:34');
INSERT INTO `sys_log` VALUES ('119', '1', 'admin', '请求访问主页', '33', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 17:25:35');
INSERT INTO `sys_log` VALUES ('120', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 17:28:02');
INSERT INTO `sys_log` VALUES ('121', '1', 'admin', '请求访问主页', '41', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 17:28:02');
INSERT INTO `sys_log` VALUES ('122', '1', 'admin', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 17:46:12');
INSERT INTO `sys_log` VALUES ('123', '1', 'admin', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 17:46:12');
INSERT INTO `sys_log` VALUES ('124', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 17:56:30');
INSERT INTO `sys_log` VALUES ('125', '1', 'admin', '登录', '62', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 18:00:55');
INSERT INTO `sys_log` VALUES ('126', '1', 'admin', '请求访问主页', '155', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 18:00:55');
INSERT INTO `sys_log` VALUES ('127', '1', 'admin', '登录', '64', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 19:15:24');
INSERT INTO `sys_log` VALUES ('128', '1', 'admin', '请求访问主页', '193', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 19:15:24');
INSERT INTO `sys_log` VALUES ('129', '1', 'admin', '登录', '29', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 19:25:39');
INSERT INTO `sys_log` VALUES ('130', '1', 'admin', '请求访问主页', '177', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 19:25:40');
INSERT INTO `sys_log` VALUES ('131', '1', 'admin', '请求访问主页', '24', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 19:33:21');
INSERT INTO `sys_log` VALUES ('132', '1', 'admin', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-02 19:43:32');
INSERT INTO `sys_log` VALUES ('133', '1', 'admin', '请求访问主页', '44', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-02 19:43:33');
INSERT INTO `sys_log` VALUES ('134', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 08:55:21');
INSERT INTO `sys_log` VALUES ('135', '1', 'admin', '请求访问主页', '42', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 08:55:21');
INSERT INTO `sys_log` VALUES ('136', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 09:22:30');
INSERT INTO `sys_log` VALUES ('137', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 09:22:30');
INSERT INTO `sys_log` VALUES ('138', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 09:34:05');
INSERT INTO `sys_log` VALUES ('139', '1', 'admin', '请求访问主页', '36', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 09:34:06');
INSERT INTO `sys_log` VALUES ('140', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 10:20:52');
INSERT INTO `sys_log` VALUES ('141', '1', 'admin', '请求访问主页', '38', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 10:20:52');
INSERT INTO `sys_log` VALUES ('142', '1', 'admin', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 10:25:21');
INSERT INTO `sys_log` VALUES ('143', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 10:35:33');
INSERT INTO `sys_log` VALUES ('144', '1', 'admin', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 10:39:20');
INSERT INTO `sys_log` VALUES ('145', '1', 'admin', '请求访问主页', '21', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 10:39:20');
INSERT INTO `sys_log` VALUES ('146', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 10:41:47');
INSERT INTO `sys_log` VALUES ('147', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 10:46:26');
INSERT INTO `sys_log` VALUES ('148', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 11:07:24');
INSERT INTO `sys_log` VALUES ('149', '1', 'admin', '请求访问主页', '39', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 11:07:25');
INSERT INTO `sys_log` VALUES ('153', '1', 'admin', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 13:05:49');
INSERT INTO `sys_log` VALUES ('154', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 14:07:26');
INSERT INTO `sys_log` VALUES ('155', '1', 'admin', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 14:07:26');
INSERT INTO `sys_log` VALUES ('156', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 14:36:07');
INSERT INTO `sys_log` VALUES ('157', '1', 'admin', '请求访问主页', '39', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 14:36:07');
INSERT INTO `sys_log` VALUES ('158', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 14:37:38');
INSERT INTO `sys_log` VALUES ('159', '1', 'admin', '请求访问主页', '303', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 14:37:39');
INSERT INTO `sys_log` VALUES ('160', '-1', '获取用户信息为空', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 17:02:50');
INSERT INTO `sys_log` VALUES ('161', '-1', '获取用户信息为空', '登录', '2', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 17:03:16');
INSERT INTO `sys_log` VALUES ('162', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 17:58:43');
INSERT INTO `sys_log` VALUES ('163', '1', 'admin', '请求访问主页', '43', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 17:58:43');
INSERT INTO `sys_log` VALUES ('164', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 18:06:50');
INSERT INTO `sys_log` VALUES ('165', '1', 'admin', '请求访问主页', '62', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 18:06:50');
INSERT INTO `sys_log` VALUES ('166', '1', 'admin', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 18:08:49');
INSERT INTO `sys_log` VALUES ('167', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 18:10:41');
INSERT INTO `sys_log` VALUES ('168', '1', 'admin', '请求访问主页', '29', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 18:10:41');
INSERT INTO `sys_log` VALUES ('169', '1', 'admin', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 18:10:47');
INSERT INTO `sys_log` VALUES ('170', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 19:18:39');
INSERT INTO `sys_log` VALUES ('171', '1', 'admin', '请求访问主页', '176', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 19:18:40');
INSERT INTO `sys_log` VALUES ('172', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 19:18:49');
INSERT INTO `sys_log` VALUES ('173', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 19:44:49');
INSERT INTO `sys_log` VALUES ('174', '1', 'admin', '登录', '24', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 19:50:12');
INSERT INTO `sys_log` VALUES ('175', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 19:51:38');
INSERT INTO `sys_log` VALUES ('176', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 19:53:33');
INSERT INTO `sys_log` VALUES ('177', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 19:55:04');
INSERT INTO `sys_log` VALUES ('178', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 19:58:54');
INSERT INTO `sys_log` VALUES ('179', '1', 'admin', '登录', '47', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 20:54:38');
INSERT INTO `sys_log` VALUES ('180', '1', 'admin', '请求访问主页', '28', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 20:54:39');
INSERT INTO `sys_log` VALUES ('181', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 21:36:56');
INSERT INTO `sys_log` VALUES ('182', '1', 'admin', '请求访问主页', '24', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 21:36:56');
INSERT INTO `sys_log` VALUES ('183', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 21:37:15');
INSERT INTO `sys_log` VALUES ('184', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 21:39:07');
INSERT INTO `sys_log` VALUES ('185', '1', 'admin', '请求访问主页', '16', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 21:39:07');
INSERT INTO `sys_log` VALUES ('186', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 21:46:18');
INSERT INTO `sys_log` VALUES ('187', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:00:38');
INSERT INTO `sys_log` VALUES ('188', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:01:53');
INSERT INTO `sys_log` VALUES ('189', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:04:27');
INSERT INTO `sys_log` VALUES ('190', '1', 'admin', '登录', '13', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:10:23');
INSERT INTO `sys_log` VALUES ('191', '1', 'admin', '登录', '13', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:13:25');
INSERT INTO `sys_log` VALUES ('192', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:16:08');
INSERT INTO `sys_log` VALUES ('193', '1', 'admin', '登录', '31', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:16:10');
INSERT INTO `sys_log` VALUES ('194', '1', 'admin', '登录', '13', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:23:23');
INSERT INTO `sys_log` VALUES ('195', '1', 'admin', '请求访问主页', '1951', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 22:23:27');
INSERT INTO `sys_log` VALUES ('196', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:36:21');
INSERT INTO `sys_log` VALUES ('197', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:36:21');
INSERT INTO `sys_log` VALUES ('198', '1', 'admin', '登录', '28', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-03 22:36:21');
INSERT INTO `sys_log` VALUES ('199', '1', 'admin', '请求访问主页', '60', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 22:36:21');
INSERT INTO `sys_log` VALUES ('200', '1', 'admin', '请求访问主页', '56', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 22:36:21');
INSERT INTO `sys_log` VALUES ('201', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-03 22:38:04');
INSERT INTO `sys_log` VALUES ('202', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 08:46:15');
INSERT INTO `sys_log` VALUES ('203', '1', 'admin', '请求访问主页', '36', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 08:46:15');
INSERT INTO `sys_log` VALUES ('204', '1', 'admin', '登录', '18', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 08:48:50');
INSERT INTO `sys_log` VALUES ('205', '1', 'admin', '请求访问主页', '43', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 08:48:50');
INSERT INTO `sys_log` VALUES ('206', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 08:50:17');
INSERT INTO `sys_log` VALUES ('207', '1', 'admin', '请求访问主页', '42', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 08:50:17');
INSERT INTO `sys_log` VALUES ('208', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 08:51:11');
INSERT INTO `sys_log` VALUES ('209', '1', 'admin', '请求访问主页', '33', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 08:51:11');
INSERT INTO `sys_log` VALUES ('210', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 08:53:49');
INSERT INTO `sys_log` VALUES ('211', '1', 'admin', '请求访问主页', '96', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 08:53:49');
INSERT INTO `sys_log` VALUES ('212', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 08:59:24');
INSERT INTO `sys_log` VALUES ('213', '1', 'admin', '请求访问主页', '35', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 08:59:24');
INSERT INTO `sys_log` VALUES ('214', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:04:28');
INSERT INTO `sys_log` VALUES ('215', '1', 'admin', '请求访问主页', '23', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:04:28');
INSERT INTO `sys_log` VALUES ('216', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:06:22');
INSERT INTO `sys_log` VALUES ('217', '1', 'admin', '请求访问主页', '20', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:06:22');
INSERT INTO `sys_log` VALUES ('218', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:07:43');
INSERT INTO `sys_log` VALUES ('219', '1', 'admin', '请求访问主页', '29', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:07:44');
INSERT INTO `sys_log` VALUES ('220', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:09:31');
INSERT INTO `sys_log` VALUES ('221', '1', 'admin', '请求访问主页', '38', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:09:31');
INSERT INTO `sys_log` VALUES ('222', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:17:12');
INSERT INTO `sys_log` VALUES ('223', '1', 'admin', '请求访问主页', '34', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:17:12');
INSERT INTO `sys_log` VALUES ('224', '1', 'admin', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:17:48');
INSERT INTO `sys_log` VALUES ('225', '1', 'admin', '请求访问主页', '45', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:17:48');
INSERT INTO `sys_log` VALUES ('226', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:19:20');
INSERT INTO `sys_log` VALUES ('227', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:19:22');
INSERT INTO `sys_log` VALUES ('228', '1', 'admin', '登录', '25', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:20:33');
INSERT INTO `sys_log` VALUES ('229', '1', 'admin', '登录', '17', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:23:46');
INSERT INTO `sys_log` VALUES ('230', '1', 'admin', '登录', '11', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:24:47');
INSERT INTO `sys_log` VALUES ('231', '1', 'admin', '请求访问主页', '30', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:24:47');
INSERT INTO `sys_log` VALUES ('232', '1', 'admin', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:30:08');
INSERT INTO `sys_log` VALUES ('233', '1', 'admin', '请求访问主页', '41', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:30:08');
INSERT INTO `sys_log` VALUES ('234', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:34:03');
INSERT INTO `sys_log` VALUES ('235', '1', 'admin', '请求访问主页', '24', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:34:04');
INSERT INTO `sys_log` VALUES ('236', '1', 'admin', '登录', '19', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 09:35:51');
INSERT INTO `sys_log` VALUES ('237', '1', 'admin', '请求访问主页', '40', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 09:35:52');
INSERT INTO `sys_log` VALUES ('238', '1', 'admin', '登录', '34', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:32:20');
INSERT INTO `sys_log` VALUES ('239', '1', 'admin', '请求访问主页', '75', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:32:20');
INSERT INTO `sys_log` VALUES ('240', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:32:23');
INSERT INTO `sys_log` VALUES ('241', '1', 'admin', '请求访问主页', '63', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:32:24');
INSERT INTO `sys_log` VALUES ('242', '1', 'admin', '登录', '14', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:32:27');
INSERT INTO `sys_log` VALUES ('243', '1', 'admin', '请求访问主页', '26', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:32:27');
INSERT INTO `sys_log` VALUES ('244', '1', 'admin', '登录', '11', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:32:28');
INSERT INTO `sys_log` VALUES ('245', '1', 'admin', '请求访问主页', '22', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:32:28');
INSERT INTO `sys_log` VALUES ('246', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:32:31');
INSERT INTO `sys_log` VALUES ('247', '1', 'admin', '请求访问主页', '25', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:32:32');
INSERT INTO `sys_log` VALUES ('248', '1', 'admin', '登录', '13', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:32:35');
INSERT INTO `sys_log` VALUES ('249', '1', 'admin', '请求访问主页', '21', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:32:35');
INSERT INTO `sys_log` VALUES ('250', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:32:39');
INSERT INTO `sys_log` VALUES ('251', '1', 'admin', '请求访问主页', '23', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:32:39');
INSERT INTO `sys_log` VALUES ('252', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:32:52');
INSERT INTO `sys_log` VALUES ('253', '1', 'admin', '请求访问主页', '32', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:32:52');
INSERT INTO `sys_log` VALUES ('254', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:33:08');
INSERT INTO `sys_log` VALUES ('255', '1', 'admin', '请求访问主页', '21', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:33:08');
INSERT INTO `sys_log` VALUES ('256', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:34:30');
INSERT INTO `sys_log` VALUES ('257', '1', 'admin', '请求访问主页', '23', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:34:30');
INSERT INTO `sys_log` VALUES ('258', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:34:31');
INSERT INTO `sys_log` VALUES ('259', '1', 'admin', '请求访问主页', '40', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:34:32');
INSERT INTO `sys_log` VALUES ('260', '1', 'admin', '登录', '14', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:34:35');
INSERT INTO `sys_log` VALUES ('261', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:34:35');
INSERT INTO `sys_log` VALUES ('262', '1', 'admin', '登录', '30', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:34:35');
INSERT INTO `sys_log` VALUES ('263', '1', 'admin', '请求访问主页', '47', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:34:35');
INSERT INTO `sys_log` VALUES ('264', '1', 'admin', '请求访问主页', '25', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:34:35');
INSERT INTO `sys_log` VALUES ('265', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:35:46');
INSERT INTO `sys_log` VALUES ('266', '1', 'admin', '请求访问主页', '36', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:35:46');
INSERT INTO `sys_log` VALUES ('267', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:35:51');
INSERT INTO `sys_log` VALUES ('268', '1', 'admin', '请求访问主页', '26', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:35:51');
INSERT INTO `sys_log` VALUES ('269', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:36:11');
INSERT INTO `sys_log` VALUES ('270', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:36:11');
INSERT INTO `sys_log` VALUES ('271', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:36:14');
INSERT INTO `sys_log` VALUES ('272', '1', 'admin', '请求访问主页', '23', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:36:14');
INSERT INTO `sys_log` VALUES ('273', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:36:17');
INSERT INTO `sys_log` VALUES ('274', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:36:17');
INSERT INTO `sys_log` VALUES ('275', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:36:19');
INSERT INTO `sys_log` VALUES ('276', '1', 'admin', '请求访问主页', '28', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:36:20');
INSERT INTO `sys_log` VALUES ('277', '1', 'admin', '登录', '14', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:36:21');
INSERT INTO `sys_log` VALUES ('278', '1', 'admin', '请求访问主页', '19', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:36:21');
INSERT INTO `sys_log` VALUES ('279', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:38:21');
INSERT INTO `sys_log` VALUES ('280', '1', 'admin', '请求访问主页', '32', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:38:22');
INSERT INTO `sys_log` VALUES ('281', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:38:23');
INSERT INTO `sys_log` VALUES ('282', '1', 'admin', '请求访问主页', '27', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:38:23');
INSERT INTO `sys_log` VALUES ('283', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:38:27');
INSERT INTO `sys_log` VALUES ('284', '1', 'admin', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:38:27');
INSERT INTO `sys_log` VALUES ('285', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:38:32');
INSERT INTO `sys_log` VALUES ('286', '1', 'admin', '请求访问主页', '20', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:38:32');
INSERT INTO `sys_log` VALUES ('287', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:38:37');
INSERT INTO `sys_log` VALUES ('288', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:38:37');
INSERT INTO `sys_log` VALUES ('289', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:38:42');
INSERT INTO `sys_log` VALUES ('290', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:38:42');
INSERT INTO `sys_log` VALUES ('291', '1', 'admin', '登录', '19', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:39:24');
INSERT INTO `sys_log` VALUES ('292', '1', 'admin', '请求访问主页', '29', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:39:24');
INSERT INTO `sys_log` VALUES ('293', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:39:27');
INSERT INTO `sys_log` VALUES ('294', '1', 'admin', '请求访问主页', '20', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:39:27');
INSERT INTO `sys_log` VALUES ('295', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:39:32');
INSERT INTO `sys_log` VALUES ('296', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:39:34');
INSERT INTO `sys_log` VALUES ('297', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:39:34');
INSERT INTO `sys_log` VALUES ('298', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:39:37');
INSERT INTO `sys_log` VALUES ('299', '1', 'admin', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:39:37');
INSERT INTO `sys_log` VALUES ('300', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:39:38');
INSERT INTO `sys_log` VALUES ('301', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:39:38');
INSERT INTO `sys_log` VALUES ('302', '1', 'admin', '登录', '19', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:40:07');
INSERT INTO `sys_log` VALUES ('303', '1', 'admin', '请求访问主页', '31', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:40:07');
INSERT INTO `sys_log` VALUES ('304', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:40:11');
INSERT INTO `sys_log` VALUES ('305', '1', 'admin', '请求访问主页', '14', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:40:12');
INSERT INTO `sys_log` VALUES ('306', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:40:13');
INSERT INTO `sys_log` VALUES ('307', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:40:14');
INSERT INTO `sys_log` VALUES ('308', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:40:16');
INSERT INTO `sys_log` VALUES ('309', '1', 'admin', '请求访问主页', '18', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:40:17');
INSERT INTO `sys_log` VALUES ('310', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:40:19');
INSERT INTO `sys_log` VALUES ('311', '1', 'admin', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:40:20');
INSERT INTO `sys_log` VALUES ('312', '1', 'admin', '登录', '11', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:41:35');
INSERT INTO `sys_log` VALUES ('313', '1', 'admin', '请求访问主页', '16', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:41:35');
INSERT INTO `sys_log` VALUES ('314', '1', 'admin', '登录', '15', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:48:25');
INSERT INTO `sys_log` VALUES ('315', '1', 'admin', '请求访问主页', '26', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:48:25');
INSERT INTO `sys_log` VALUES ('316', '1', 'admin', '登录', '17', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 10:49:37');
INSERT INTO `sys_log` VALUES ('317', '1', 'admin', '请求访问主页', '34', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 10:49:38');
INSERT INTO `sys_log` VALUES ('318', '1', 'admin', '登录', '107', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 11:39:55');
INSERT INTO `sys_log` VALUES ('319', '1', 'admin', '请求访问主页', '52', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 11:39:55');
INSERT INTO `sys_log` VALUES ('320', '1', 'admin', '登录', '45', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 11:44:27');
INSERT INTO `sys_log` VALUES ('321', '1', 'admin', '请求访问主页', '77', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 11:44:27');
INSERT INTO `sys_log` VALUES ('322', '1', 'admin', '登录', '11', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 11:51:26');
INSERT INTO `sys_log` VALUES ('323', '1', 'admin', '请求访问主页', '39', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 11:51:26');
INSERT INTO `sys_log` VALUES ('324', '1', 'admin', '更新用户', '266', 'com.bootdo.system.controller.UserController.updatePeronal()', null, '127.0.0.1', '2018-01-04 11:52:15');
INSERT INTO `sys_log` VALUES ('325', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 11:54:09');
INSERT INTO `sys_log` VALUES ('326', '1', 'admin', '请求访问主页', '65', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 11:54:09');
INSERT INTO `sys_log` VALUES ('327', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 11:58:28');
INSERT INTO `sys_log` VALUES ('328', '1', 'admin', '请求访问主页', '24', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 11:58:28');
INSERT INTO `sys_log` VALUES ('329', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 12:37:42');
INSERT INTO `sys_log` VALUES ('330', '1', 'admin', '请求访问主页', '34', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 12:37:42');
INSERT INTO `sys_log` VALUES ('331', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 12:38:46');
INSERT INTO `sys_log` VALUES ('332', '1', 'admin', '请求访问主页', '14', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 12:41:28');
INSERT INTO `sys_log` VALUES ('333', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 12:48:37');
INSERT INTO `sys_log` VALUES ('334', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 12:48:37');
INSERT INTO `sys_log` VALUES ('335', '1', 'admin', '登录', '17', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:09:47');
INSERT INTO `sys_log` VALUES ('336', '1', 'admin', '请求访问主页', '67', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:09:47');
INSERT INTO `sys_log` VALUES ('337', '2', 'test', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:16:42');
INSERT INTO `sys_log` VALUES ('338', '2', 'test', '请求访问主页', '65', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:16:42');
INSERT INTO `sys_log` VALUES ('339', '2', 'test', '请求访问主页', '20', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:16:56');
INSERT INTO `sys_log` VALUES ('340', '2', 'test', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:20:53');
INSERT INTO `sys_log` VALUES ('341', '2', 'test', '请求访问主页', '42', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:20:53');
INSERT INTO `sys_log` VALUES ('342', '2', 'test', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:23:23');
INSERT INTO `sys_log` VALUES ('343', '2', 'test', '请求访问主页', '77', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:23:24');
INSERT INTO `sys_log` VALUES ('344', '2', 'test', '登录', '19', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:29:52');
INSERT INTO `sys_log` VALUES ('345', '2', 'test', '请求访问主页', '66', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:29:53');
INSERT INTO `sys_log` VALUES ('346', '-1', '获取用户信息为空', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:37:51');
INSERT INTO `sys_log` VALUES ('347', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:37:55');
INSERT INTO `sys_log` VALUES ('348', '1', 'admin', '请求访问主页', '24', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:37:55');
INSERT INTO `sys_log` VALUES ('349', '1', 'admin', '批量删除角色', '144', 'com.bootdo.system.controller.RoleController.batchRemove()', null, '127.0.0.1', '2018-01-04 13:38:20');
INSERT INTO `sys_log` VALUES ('350', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:48:13');
INSERT INTO `sys_log` VALUES ('351', '1', 'admin', '请求访问主页', '24', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:48:13');
INSERT INTO `sys_log` VALUES ('352', '1', 'admin', '添加角色', '0', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-01-04 13:48:18');
INSERT INTO `sys_log` VALUES ('353', '1', 'admin', '保存角色', '155', 'com.bootdo.system.controller.RoleController.save()', null, '127.0.0.1', '2018-01-04 13:48:24');
INSERT INTO `sys_log` VALUES ('354', '1', 'admin', '添加角色', '0', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-01-04 13:48:25');
INSERT INTO `sys_log` VALUES ('355', '1', 'admin', '保存角色', '160', 'com.bootdo.system.controller.RoleController.save()', null, '127.0.0.1', '2018-01-04 13:48:29');
INSERT INTO `sys_log` VALUES ('356', '1', 'admin', '批量删除角色', '127', 'com.bootdo.system.controller.RoleController.batchRemove()', null, '127.0.0.1', '2018-01-04 13:48:35');
INSERT INTO `sys_log` VALUES ('357', '1', 'admin', '提交更改用户密码', '3', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-01-04 13:51:24');
INSERT INTO `sys_log` VALUES ('358', '1', 'admin', '提交更改用户密码', '4', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-01-04 13:51:30');
INSERT INTO `sys_log` VALUES ('359', '1', 'admin', '提交更改用户密码', '4', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-01-04 13:51:46');
INSERT INTO `sys_log` VALUES ('360', '1', 'admin', '提交更改用户密码', '3', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-01-04 13:52:19');
INSERT INTO `sys_log` VALUES ('361', '1', 'admin', '请求更改用户密码', '0', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-01-04 13:54:39');
INSERT INTO `sys_log` VALUES ('362', '1', 'admin', 'admin提交更改用户密码', '7', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-01-04 13:54:47');
INSERT INTO `sys_log` VALUES ('363', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:55:32');
INSERT INTO `sys_log` VALUES ('364', '1', 'admin', '请求访问主页', '31', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:55:32');
INSERT INTO `sys_log` VALUES ('365', '1', 'admin', '提交更改用户密码', '23782', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-01-04 13:56:09');
INSERT INTO `sys_log` VALUES ('366', '-1', '获取用户信息为空', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:57:18');
INSERT INTO `sys_log` VALUES ('367', '1', 'admin', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-01-04 13:57:22');
INSERT INTO `sys_log` VALUES ('368', '1', 'admin', '请求访问主页', '29', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:57:22');
INSERT INTO `sys_log` VALUES ('369', '1', 'admin', '提交更改用户密码', '147', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-01-04 13:57:35');
INSERT INTO `sys_log` VALUES ('370', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:57:39');
INSERT INTO `sys_log` VALUES ('371', '1', 'admin', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-01-04 13:57:40');
INSERT INTO `sys_log` VALUES ('372', '-1', '获取用户信息为空', '登录', '59', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-16 17:56:35');
INSERT INTO `sys_log` VALUES ('373', '-1', '获取用户信息为空', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-16 17:56:39');
INSERT INTO `sys_log` VALUES ('374', '-1', '获取用户信息为空', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-16 17:56:43');
INSERT INTO `sys_log` VALUES ('375', '-1', '获取用户信息为空', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-16 17:57:24');
INSERT INTO `sys_log` VALUES ('376', '1', 'admin', '登录', '57', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-16 17:58:43');
INSERT INTO `sys_log` VALUES ('377', '1', 'admin', '请求访问主页', '269', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-16 17:58:44');
INSERT INTO `sys_log` VALUES ('378', '1', 'admin', 'error', null, 'http://localhost/activiti/task/todoList', 'org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bootdo.act_ru_task\' doesn\'t exist\r\n### The error may exist in org/activiti/db/mapping/entity/Task.xml\r\n### The error may involve org.activiti.engine.impl.persistence.entity.TaskEntity.selectTaskByQueryCriteria-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct RES.*              from ACT_RU_TASK RES                                                     WHERE  RES.ASSIGNEE_ = ?                order by RES.ID_ asc      LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bootdo.act_ru_task\' doesn\'t exist', null, '2018-05-16 17:58:53');
INSERT INTO `sys_log` VALUES ('379', '1', 'admin', 'error', null, 'http://localhost/activiti/task/gotoList', 'org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bootdo.act_re_procdef\' doesn\'t exist\r\n### The error may exist in org/activiti/db/mapping/entity/ProcessDefinition.xml\r\n### The error may involve org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity.selectProcessDefinitionsByQueryCriteria_mysql-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct RES.*              from ACT_RE_PROCDEF RES                       order by RES.ID_ asc      LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bootdo.act_re_procdef\' doesn\'t exist', null, '2018-05-16 17:58:53');
INSERT INTO `sys_log` VALUES ('380', '1', 'admin', '添加角色', '2', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-16 17:59:49');
INSERT INTO `sys_log` VALUES ('381', '1', 'admin', 'error', null, 'http://localhost/activiti/model/list', 'org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bootdo.act_re_model\' doesn\'t exist\r\n### The error may exist in org/activiti/db/mapping/entity/Model.xml\r\n### The error may involve org.activiti.engine.impl.persistence.entity.ModelEntity.selectModelsByQueryCriteria-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct RES.*              from ACT_RE_MODEL RES                 order by RES.ID_ asc      LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bootdo.act_re_model\' doesn\'t exist', null, '2018-05-16 18:01:15');
INSERT INTO `sys_log` VALUES ('382', '1', 'admin', '登录', '45', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-16 23:54:58');
INSERT INTO `sys_log` VALUES ('383', '1', 'admin', '请求访问主页', '209', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-16 23:54:59');
INSERT INTO `sys_log` VALUES ('384', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-16 23:55:08');
INSERT INTO `sys_log` VALUES ('385', '1', 'admin', '请求访问主页', '51', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-16 23:55:09');
INSERT INTO `sys_log` VALUES ('386', '1', 'admin', '编辑角色', '9', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-16 23:59:43');
INSERT INTO `sys_log` VALUES ('387', '1', 'admin', '编辑菜单', '20', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-17 00:00:56');
INSERT INTO `sys_log` VALUES ('388', '1', 'admin', '登录', '188', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 05:43:46');
INSERT INTO `sys_log` VALUES ('389', '1', 'admin', '请求访问主页', '1574', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 05:43:48');
INSERT INTO `sys_log` VALUES ('390', '1', 'admin', '添加用户', '65', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-17 05:44:13');
INSERT INTO `sys_log` VALUES ('391', '1', 'admin', '请求访问主页', '99', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 05:50:07');
INSERT INTO `sys_log` VALUES ('392', '1', 'admin', '请求访问主页', '28', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 05:53:07');
INSERT INTO `sys_log` VALUES ('393', '1', 'admin', '登录', '212', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 07:24:17');
INSERT INTO `sys_log` VALUES ('394', '1', 'admin', '请求访问主页', '135', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 07:24:18');
INSERT INTO `sys_log` VALUES ('395', '1', 'admin', '登录', '53', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 07:24:25');
INSERT INTO `sys_log` VALUES ('396', '1', 'admin', '请求访问主页', '35', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 07:24:25');
INSERT INTO `sys_log` VALUES ('397', '1', 'admin', '登录', '54', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 11:37:13');
INSERT INTO `sys_log` VALUES ('398', '1', 'admin', '请求访问主页', '337', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 11:37:13');
INSERT INTO `sys_log` VALUES ('399', '1', 'admin', '添加角色', '1', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-17 11:38:43');
INSERT INTO `sys_log` VALUES ('400', '1', 'admin', 'error', null, 'http://localhost:8088/endpointChat/065/7025u_19/xhr_streaming', 'org.apache.catalina.connector.ClientAbortException: java.io.IOException: 您的主机中的软件中止了一个已建立的连接。', null, '2018-05-17 11:45:11');
INSERT INTO `sys_log` VALUES ('401', '1', 'admin', 'error', null, 'http://localhost:8088/endpointChat/065/7025u_19/xhr_streaming', 'org.apache.catalina.connector.ClientAbortException: java.io.IOException: 您的主机中的软件中止了一个已建立的连接。', null, '2018-05-17 11:45:11');
INSERT INTO `sys_log` VALUES ('402', '1', 'admin', '登录', '26', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 11:46:37');
INSERT INTO `sys_log` VALUES ('403', '1', 'admin', '请求访问主页', '91', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 11:46:37');
INSERT INTO `sys_log` VALUES ('404', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 12:06:22');
INSERT INTO `sys_log` VALUES ('405', '1', 'admin', '请求访问主页', '123', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 12:06:22');
INSERT INTO `sys_log` VALUES ('406', '1', 'admin', '登录', '46', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 13:27:19');
INSERT INTO `sys_log` VALUES ('407', '1', 'admin', '请求访问主页', '116', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 13:27:19');
INSERT INTO `sys_log` VALUES ('408', '1', 'admin', '添加角色', '10', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-17 13:31:14');
INSERT INTO `sys_log` VALUES ('409', '1', 'admin', '添加角色', '1', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-17 13:32:10');
INSERT INTO `sys_log` VALUES ('410', '1', 'admin', '添加角色', '0', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-17 13:32:19');
INSERT INTO `sys_log` VALUES ('411', '1', 'admin', '保存角色', '354', 'com.bootdo.system.controller.RoleController.save()', null, '127.0.0.1', '2018-05-17 13:32:39');
INSERT INTO `sys_log` VALUES ('412', '1', 'admin', '编辑角色', '8', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-17 13:32:44');
INSERT INTO `sys_log` VALUES ('413', '1', 'admin', '添加角色', '1', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-17 13:42:32');
INSERT INTO `sys_log` VALUES ('414', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 14:46:46');
INSERT INTO `sys_log` VALUES ('415', '1', 'admin', '请求访问主页', '56', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 14:46:46');
INSERT INTO `sys_log` VALUES ('416', '1', 'admin', '编辑用户', '74', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-17 14:57:26');
INSERT INTO `sys_log` VALUES ('417', '-1', '获取用户信息为空', '登录', '25', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 16:34:47');
INSERT INTO `sys_log` VALUES ('418', '1', 'admin', '登录', '40', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 16:34:51');
INSERT INTO `sys_log` VALUES ('419', '1', 'admin', '请求访问主页', '54', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 16:34:52');
INSERT INTO `sys_log` VALUES ('420', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 17:17:28');
INSERT INTO `sys_log` VALUES ('421', '1', 'admin', '请求访问主页', '37', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 17:17:28');
INSERT INTO `sys_log` VALUES ('422', '1', 'admin', '编辑用户', '40', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-17 17:17:42');
INSERT INTO `sys_log` VALUES ('423', '1', 'admin', '更新用户', '74', 'com.bootdo.system.controller.UserController.update()', null, '127.0.0.1', '2018-05-17 17:17:46');
INSERT INTO `sys_log` VALUES ('424', '1', 'admin', '请求访问主页', '74', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 17:40:36');
INSERT INTO `sys_log` VALUES ('425', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 18:22:02');
INSERT INTO `sys_log` VALUES ('426', '1', 'admin', '请求访问主页', '21', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 18:22:02');
INSERT INTO `sys_log` VALUES ('427', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 22:36:08');
INSERT INTO `sys_log` VALUES ('428', '1', 'admin', '请求访问主页', '113', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 22:36:08');
INSERT INTO `sys_log` VALUES ('429', '1', 'admin', '登录', '14', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-17 22:53:51');
INSERT INTO `sys_log` VALUES ('430', '1', 'admin', '请求访问主页', '51', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-17 22:53:51');
INSERT INTO `sys_log` VALUES ('431', '1', 'admin', '登录', '53', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-18 00:49:07');
INSERT INTO `sys_log` VALUES ('432', '1', 'admin', '请求访问主页', '126', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 00:49:08');
INSERT INTO `sys_log` VALUES ('433', '1', 'admin', '登录', '727', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-18 05:13:57');
INSERT INTO `sys_log` VALUES ('434', '1', 'admin', '请求访问主页', '732', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:13:58');
INSERT INTO `sys_log` VALUES ('435', '1', 'admin', '请求访问主页', '151', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:15:55');
INSERT INTO `sys_log` VALUES ('436', '1', 'admin', '请求访问主页', '38', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:19:00');
INSERT INTO `sys_log` VALUES ('437', '1', 'admin', '添加角色', '4', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-18 05:20:35');
INSERT INTO `sys_log` VALUES ('438', '1', 'admin', '删除角色', '340', 'com.bootdo.system.controller.RoleController.save()', null, '127.0.0.1', '2018-05-18 05:24:20');
INSERT INTO `sys_log` VALUES ('439', '1', 'admin', '添加角色', '3', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-18 05:24:24');
INSERT INTO `sys_log` VALUES ('440', '1', 'admin', '添加角色', '2', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-18 05:26:17');
INSERT INTO `sys_log` VALUES ('441', '1', 'admin', '保存角色', '621', 'com.bootdo.system.controller.RoleController.save()', null, '127.0.0.1', '2018-05-18 05:27:12');
INSERT INTO `sys_log` VALUES ('442', '1', 'admin', '编辑角色', '7', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-18 05:27:14');
INSERT INTO `sys_log` VALUES ('443', '1', 'admin', '更新角色', '245', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-18 05:27:48');
INSERT INTO `sys_log` VALUES ('444', '1', 'admin', '编辑角色', '5', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-18 05:27:53');
INSERT INTO `sys_log` VALUES ('445', '1', 'admin', '请求访问主页', '38', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:28:26');
INSERT INTO `sys_log` VALUES ('446', '1', 'admin', '添加用户', '26', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-18 05:28:42');
INSERT INTO `sys_log` VALUES ('447', '1', 'admin', '请求访问主页', '81', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:28:55');
INSERT INTO `sys_log` VALUES ('448', '1', 'admin', '添加用户', '22', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-18 05:30:46');
INSERT INTO `sys_log` VALUES ('449', '1', 'admin', '添加用户', '6', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-18 05:31:43');
INSERT INTO `sys_log` VALUES ('450', '1', 'admin', '请求访问主页', '18', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:34:48');
INSERT INTO `sys_log` VALUES ('451', '1', 'admin', '编辑用户', '131', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 05:35:06');
INSERT INTO `sys_log` VALUES ('452', '1', 'admin', '添加用户', '16', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-18 05:35:15');
INSERT INTO `sys_log` VALUES ('453', '1', 'admin', '保存用户', '103', 'com.bootdo.system.controller.UserController.save()', null, '127.0.0.1', '2018-05-18 05:36:24');
INSERT INTO `sys_log` VALUES ('454', '1', 'admin', '添加用户', '9', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-18 05:36:34');
INSERT INTO `sys_log` VALUES ('455', '1', 'admin', '请求访问主页', '41', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:37:56');
INSERT INTO `sys_log` VALUES ('456', '1', 'admin', '请求访问主页', '200', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:38:14');
INSERT INTO `sys_log` VALUES ('457', '1', 'admin', '编辑用户', '61', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 05:38:59');
INSERT INTO `sys_log` VALUES ('458', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:39:22');
INSERT INTO `sys_log` VALUES ('459', '1', 'admin', '编辑用户', '46', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 05:39:50');
INSERT INTO `sys_log` VALUES ('460', '1', 'admin', '更新用户', '41', 'com.bootdo.system.controller.UserController.update()', null, '127.0.0.1', '2018-05-18 05:39:59');
INSERT INTO `sys_log` VALUES ('461', '1', 'admin', '编辑用户', '29', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 05:40:05');
INSERT INTO `sys_log` VALUES ('462', '1', 'admin', '请求访问主页', '34', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:40:10');
INSERT INTO `sys_log` VALUES ('463', '1', 'admin', '编辑用户', '61', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 05:40:34');
INSERT INTO `sys_log` VALUES ('464', '1', 'admin', '编辑用户', '90', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 05:40:52');
INSERT INTO `sys_log` VALUES ('465', '1', 'admin', '编辑用户', '41', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 05:41:28');
INSERT INTO `sys_log` VALUES ('466', '1', 'admin', '添加用户', '4', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-18 05:41:39');
INSERT INTO `sys_log` VALUES ('467', '1', 'admin', '保存用户', '16', 'com.bootdo.system.controller.UserController.save()', null, '127.0.0.1', '2018-05-18 05:42:11');
INSERT INTO `sys_log` VALUES ('468', '1', 'admin', '添加角色', '1', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-18 05:42:18');
INSERT INTO `sys_log` VALUES ('469', '1', 'admin', '删除角色', '17', 'com.bootdo.system.controller.RoleController.save()', null, '127.0.0.1', '2018-05-18 05:42:36');
INSERT INTO `sys_log` VALUES ('470', '1', 'admin', '添加角色', '15', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-18 05:42:37');
INSERT INTO `sys_log` VALUES ('471', '1', 'admin', '添加角色', '1', 'com.bootdo.system.controller.RoleController.add()', null, '127.0.0.1', '2018-05-18 05:43:04');
INSERT INTO `sys_log` VALUES ('472', '1', 'admin', '保存角色', '91', 'com.bootdo.system.controller.RoleController.save()', null, '127.0.0.1', '2018-05-18 05:43:32');
INSERT INTO `sys_log` VALUES ('473', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 05:43:43');
INSERT INTO `sys_log` VALUES ('474', '1', 'admin', '编辑用户', '64', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 05:43:57');
INSERT INTO `sys_log` VALUES ('475', '1', 'admin', '编辑用户', '11', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 05:45:22');
INSERT INTO `sys_log` VALUES ('476', '1', 'admin', '编辑用户', '10', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 05:45:28');
INSERT INTO `sys_log` VALUES ('477', '1', 'admin', '删除用户', '6', 'com.bootdo.system.controller.UserController.remove()', null, '127.0.0.1', '2018-05-18 05:45:43');
INSERT INTO `sys_log` VALUES ('478', '1', 'admin', '添加用户', '19', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-18 05:45:44');
INSERT INTO `sys_log` VALUES ('479', '1', 'admin', '删除用户', '42', 'com.bootdo.system.controller.UserController.remove()', null, '127.0.0.1', '2018-05-18 05:47:13');
INSERT INTO `sys_log` VALUES ('480', '1', 'admin', '添加用户', '48', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-18 05:47:14');
INSERT INTO `sys_log` VALUES ('481', '1', 'admin', '保存用户', '20', 'com.bootdo.system.controller.UserController.save()', null, '127.0.0.1', '2018-05-18 05:47:51');
INSERT INTO `sys_log` VALUES ('482', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-18 05:47:57');
INSERT INTO `sys_log` VALUES ('483', '1', 'admin', 'error', null, 'http://localhost:8088/system/sysDept/update', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'deptDO\' on field \'delFlag\': rejected value [禁止]; codes [typeMismatch.deptDO.delFlag,typeMismatch.delFlag,typeMismatch.java.lang.Integer,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [deptDO.delFlag,delFlag]; arguments []; default message [delFlag]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.lang.Integer\' for property \'delFlag\'; nested exception is java.lang.NumberFormatException: For input string: \"禁止\"]', null, '2018-05-18 05:50:03');
INSERT INTO `sys_log` VALUES ('484', '1', 'admin', '编辑角色', '13', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-18 05:56:27');
INSERT INTO `sys_log` VALUES ('485', '-1', '获取用户信息为空', '登录', '13', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-18 07:58:39');
INSERT INTO `sys_log` VALUES ('486', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-18 07:58:49');
INSERT INTO `sys_log` VALUES ('487', '1', 'admin', '请求访问主页', '92', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 07:58:49');
INSERT INTO `sys_log` VALUES ('488', '1', 'admin', '编辑用户', '54', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-18 07:59:17');
INSERT INTO `sys_log` VALUES ('489', '1', 'admin', '更新用户', '109', 'com.bootdo.system.controller.UserController.update()', null, '127.0.0.1', '2018-05-18 07:59:32');
INSERT INTO `sys_log` VALUES ('490', '1', 'admin', '请求访问主页', '0', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 08:02:55');
INSERT INTO `sys_log` VALUES ('491', '1', 'admin', '添加用户', '16', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-18 08:04:40');
INSERT INTO `sys_log` VALUES ('492', '140', 'songlijun', '登录', '19', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-18 09:30:26');
INSERT INTO `sys_log` VALUES ('493', '140', 'songlijun', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 09:30:27');
INSERT INTO `sys_log` VALUES ('494', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-18 09:31:00');
INSERT INTO `sys_log` VALUES ('495', '1', 'admin', '请求访问主页', '18', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-18 09:31:00');
INSERT INTO `sys_log` VALUES ('496', '1', 'admin', '登录', '42', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 21:37:11');
INSERT INTO `sys_log` VALUES ('497', '1', 'admin', '请求访问主页', '389', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 21:37:12');
INSERT INTO `sys_log` VALUES ('498', '1', 'admin', '登录', '27', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 21:52:33');
INSERT INTO `sys_log` VALUES ('499', '1', 'admin', '请求访问主页', '102', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 21:52:33');
INSERT INTO `sys_log` VALUES ('500', '1', 'admin', '请求访问主页', '20', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 21:55:08');
INSERT INTO `sys_log` VALUES ('501', '1', 'admin', '登录', '17', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:24');
INSERT INTO `sys_log` VALUES ('502', '1', 'admin', '请求访问主页', '78', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:24');
INSERT INTO `sys_log` VALUES ('503', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:27');
INSERT INTO `sys_log` VALUES ('504', '1', 'admin', '请求访问主页', '64', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:27');
INSERT INTO `sys_log` VALUES ('505', '1', 'admin', '登录', '11', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:28');
INSERT INTO `sys_log` VALUES ('506', '1', 'admin', '请求访问主页', '24', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:28');
INSERT INTO `sys_log` VALUES ('507', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:28');
INSERT INTO `sys_log` VALUES ('508', '1', 'admin', '请求访问主页', '34', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:28');
INSERT INTO `sys_log` VALUES ('509', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:29');
INSERT INTO `sys_log` VALUES ('510', '1', 'admin', '请求访问主页', '24', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:29');
INSERT INTO `sys_log` VALUES ('511', '1', 'admin', '登录', '12', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:29');
INSERT INTO `sys_log` VALUES ('512', '1', 'admin', '请求访问主页', '20', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:29');
INSERT INTO `sys_log` VALUES ('513', '1', 'admin', '登录', '14', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:30');
INSERT INTO `sys_log` VALUES ('514', '1', 'admin', '请求访问主页', '21', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:30');
INSERT INTO `sys_log` VALUES ('515', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:30');
INSERT INTO `sys_log` VALUES ('516', '1', 'admin', '请求访问主页', '18', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:30');
INSERT INTO `sys_log` VALUES ('517', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:31');
INSERT INTO `sys_log` VALUES ('518', '1', 'admin', '请求访问主页', '28', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:31');
INSERT INTO `sys_log` VALUES ('519', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:31');
INSERT INTO `sys_log` VALUES ('520', '1', 'admin', '请求访问主页', '20', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:31');
INSERT INTO `sys_log` VALUES ('521', '1', 'admin', '登录', '9', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:45');
INSERT INTO `sys_log` VALUES ('522', '1', 'admin', '请求访问主页', '27', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:45');
INSERT INTO `sys_log` VALUES ('523', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:09:53');
INSERT INTO `sys_log` VALUES ('524', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:09:53');
INSERT INTO `sys_log` VALUES ('525', '1', 'admin', '登录', '19', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:20:40');
INSERT INTO `sys_log` VALUES ('526', '1', 'admin', '请求访问主页', '93', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:20:41');
INSERT INTO `sys_log` VALUES ('527', '1', 'admin', '编辑菜单', '48', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 22:21:31');
INSERT INTO `sys_log` VALUES ('528', '1', 'admin', '登录', '20', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 22:39:18');
INSERT INTO `sys_log` VALUES ('529', '1', 'admin', '请求访问主页', '100', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:39:18');
INSERT INTO `sys_log` VALUES ('530', '1', 'admin', '编辑用户', '43', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-20 22:55:31');
INSERT INTO `sys_log` VALUES ('531', '1', 'admin', '删除菜单', '93', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:57:18');
INSERT INTO `sys_log` VALUES ('532', '1', 'admin', '删除菜单', '14', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:57:22');
INSERT INTO `sys_log` VALUES ('533', '1', 'admin', '删除菜单', '8', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:57:29');
INSERT INTO `sys_log` VALUES ('534', '1', 'admin', '删除菜单', '9', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:57:34');
INSERT INTO `sys_log` VALUES ('535', '1', 'admin', '删除菜单', '18', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:57:40');
INSERT INTO `sys_log` VALUES ('536', '1', 'admin', '删除菜单', '9', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:57:44');
INSERT INTO `sys_log` VALUES ('537', '1', 'admin', '删除菜单', '9', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:57:47');
INSERT INTO `sys_log` VALUES ('538', '1', 'admin', '删除菜单', '19', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:57:52');
INSERT INTO `sys_log` VALUES ('539', '1', 'admin', '删除菜单', '9', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:57:55');
INSERT INTO `sys_log` VALUES ('540', '1', 'admin', '删除菜单', '6', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:57:58');
INSERT INTO `sys_log` VALUES ('541', '1', 'admin', '删除菜单', '17', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:58:01');
INSERT INTO `sys_log` VALUES ('542', '1', 'admin', '删除菜单', '8', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:58:04');
INSERT INTO `sys_log` VALUES ('543', '1', 'admin', '删除菜单', '12', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:58:08');
INSERT INTO `sys_log` VALUES ('544', '1', 'admin', '删除菜单', '29', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:58:11');
INSERT INTO `sys_log` VALUES ('545', '1', 'admin', '删除菜单', '6', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:58:14');
INSERT INTO `sys_log` VALUES ('546', '1', 'admin', '删除菜单', '9', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:58:17');
INSERT INTO `sys_log` VALUES ('547', '1', 'admin', '删除菜单', '10', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:58:19');
INSERT INTO `sys_log` VALUES ('548', '1', 'admin', '删除菜单', '20', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:58:22');
INSERT INTO `sys_log` VALUES ('549', '1', 'admin', '删除菜单', '9', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:58:25');
INSERT INTO `sys_log` VALUES ('550', '1', 'admin', '删除菜单', '8', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 22:58:29');
INSERT INTO `sys_log` VALUES ('551', '1', 'admin', '编辑菜单', '26', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 22:58:39');
INSERT INTO `sys_log` VALUES ('552', '1', 'admin', '更新菜单', '56', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2018-05-20 22:58:49');
INSERT INTO `sys_log` VALUES ('553', '1', 'admin', '添加菜单', '6', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2018-05-20 22:59:23');
INSERT INTO `sys_log` VALUES ('554', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:59:31');
INSERT INTO `sys_log` VALUES ('555', '1', 'admin', '编辑菜单', '12', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 22:59:46');
INSERT INTO `sys_log` VALUES ('556', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 22:59:59');
INSERT INTO `sys_log` VALUES ('557', '1', 'admin', '添加菜单', '5', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2018-05-20 23:00:18');
INSERT INTO `sys_log` VALUES ('558', '1', 'admin', '保存菜单', '11', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2018-05-20 23:00:41');
INSERT INTO `sys_log` VALUES ('559', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:00:44');
INSERT INTO `sys_log` VALUES ('560', '1', 'admin', '编辑角色', '18', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-20 23:00:50');
INSERT INTO `sys_log` VALUES ('561', '1', 'admin', '更新角色', '71', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-20 23:00:54');
INSERT INTO `sys_log` VALUES ('562', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:00:57');
INSERT INTO `sys_log` VALUES ('563', '1', 'admin', '删除菜单', '13', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 23:01:48');
INSERT INTO `sys_log` VALUES ('564', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:02:08');
INSERT INTO `sys_log` VALUES ('565', '1', 'admin', 'error', null, 'http://localhost:8088/sys/menu/edit/79', 'java.lang.NullPointerException', null, '2018-05-20 23:02:35');
INSERT INTO `sys_log` VALUES ('566', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:03:04');
INSERT INTO `sys_log` VALUES ('567', '1', 'admin', 'error', null, 'http://localhost:8088/sys/menu/edit/79', 'java.lang.NullPointerException', null, '2018-05-20 23:03:14');
INSERT INTO `sys_log` VALUES ('568', '1', 'admin', '编辑菜单', '8', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 23:03:39');
INSERT INTO `sys_log` VALUES ('569', '1', 'admin', 'error', null, 'http://localhost:8088/sys/menu/edit/79', 'java.lang.NullPointerException', null, '2018-05-20 23:03:59');
INSERT INTO `sys_log` VALUES ('570', '1', 'admin', '添加菜单', '4', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2018-05-20 23:04:05');
INSERT INTO `sys_log` VALUES ('571', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:05:54');
INSERT INTO `sys_log` VALUES ('572', '1', 'admin', '添加菜单', '8', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2018-05-20 23:06:06');
INSERT INTO `sys_log` VALUES ('573', '1', 'admin', 'error', null, 'http://localhost:8088/sys/menu/edit/79', 'java.lang.NullPointerException', null, '2018-05-20 23:06:11');
INSERT INTO `sys_log` VALUES ('574', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 23:06:32');
INSERT INTO `sys_log` VALUES ('575', '1', 'admin', '更新菜单', '6', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2018-05-20 23:07:05');
INSERT INTO `sys_log` VALUES ('576', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:07:15');
INSERT INTO `sys_log` VALUES ('577', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:07:25');
INSERT INTO `sys_log` VALUES ('578', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:07:40');
INSERT INTO `sys_log` VALUES ('579', '1', 'admin', '编辑角色', '7', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-20 23:07:55');
INSERT INTO `sys_log` VALUES ('580', '1', 'admin', '编辑菜单', '7', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 23:08:35');
INSERT INTO `sys_log` VALUES ('581', '1', 'admin', '更新菜单', '6', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2018-05-20 23:08:57');
INSERT INTO `sys_log` VALUES ('582', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:09:00');
INSERT INTO `sys_log` VALUES ('583', '1', 'admin', '删除菜单', '9', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-20 23:09:18');
INSERT INTO `sys_log` VALUES ('584', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:09:25');
INSERT INTO `sys_log` VALUES ('585', '1', 'admin', '编辑角色', '13', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-20 23:09:31');
INSERT INTO `sys_log` VALUES ('586', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:09:37');
INSERT INTO `sys_log` VALUES ('587', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 23:09:58');
INSERT INTO `sys_log` VALUES ('588', '1', 'admin', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:09:58');
INSERT INTO `sys_log` VALUES ('589', '1', 'admin', '编辑菜单', '17', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 23:10:40');
INSERT INTO `sys_log` VALUES ('590', '1', 'admin', '更新菜单', '9', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2018-05-20 23:11:16');
INSERT INTO `sys_log` VALUES ('591', '1', 'admin', '编辑角色', '3', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-20 23:11:27');
INSERT INTO `sys_log` VALUES ('592', '1', 'admin', '登录', '23', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 23:12:07');
INSERT INTO `sys_log` VALUES ('593', '1', 'admin', '请求访问主页', '100', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:12:07');
INSERT INTO `sys_log` VALUES ('594', '1', 'admin', '请求访问主页', '33', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:13:35');
INSERT INTO `sys_log` VALUES ('595', '1', 'admin', '请求访问主页', '18', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:14:35');
INSERT INTO `sys_log` VALUES ('596', '1', 'admin', '请求访问主页', '14', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:15:33');
INSERT INTO `sys_log` VALUES ('597', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:15:57');
INSERT INTO `sys_log` VALUES ('598', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:16:15');
INSERT INTO `sys_log` VALUES ('599', '1', 'admin', '请求访问主页', '14', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:22:16');
INSERT INTO `sys_log` VALUES ('600', '1', 'admin', '请求访问主页', '16', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:24:13');
INSERT INTO `sys_log` VALUES ('601', '1', 'admin', '添加用户', '6', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-20 23:24:27');
INSERT INTO `sys_log` VALUES ('602', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:24:56');
INSERT INTO `sys_log` VALUES ('603', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-20 23:25:03');
INSERT INTO `sys_log` VALUES ('604', '1', 'admin', '保存用户', '24', 'com.bootdo.system.controller.UserController.save()', null, '127.0.0.1', '2018-05-20 23:25:40');
INSERT INTO `sys_log` VALUES ('605', '1', 'admin', 'error', null, 'http://localhost:8088/sys/user/edit/141', 'java.lang.NullPointerException', null, '2018-05-20 23:25:48');
INSERT INTO `sys_log` VALUES ('606', '1', 'admin', 'error', null, 'http://localhost:8088/sys/user/edit/141', 'java.lang.NullPointerException', null, '2018-05-20 23:25:56');
INSERT INTO `sys_log` VALUES ('607', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:25:59');
INSERT INTO `sys_log` VALUES ('608', '1', 'admin', 'error', null, 'http://localhost:8088/sys/user/edit/141', 'java.lang.NullPointerException', null, '2018-05-20 23:26:10');
INSERT INTO `sys_log` VALUES ('609', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:26:13');
INSERT INTO `sys_log` VALUES ('610', '1', 'admin', '编辑用户', '24', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-20 23:26:21');
INSERT INTO `sys_log` VALUES ('611', '1', 'admin', 'error', null, 'http://localhost:8088/sys/user/edit/141', 'java.lang.NullPointerException', null, '2018-05-20 23:26:33');
INSERT INTO `sys_log` VALUES ('612', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:26:36');
INSERT INTO `sys_log` VALUES ('613', '1', 'admin', '编辑角色', '6', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-20 23:26:44');
INSERT INTO `sys_log` VALUES ('614', '1', 'admin', '更新角色', '53', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-20 23:26:47');
INSERT INTO `sys_log` VALUES ('615', '1', 'admin', '编辑角色', '4', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-20 23:26:50');
INSERT INTO `sys_log` VALUES ('616', '1', 'admin', '更新角色', '10', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-20 23:26:52');
INSERT INTO `sys_log` VALUES ('617', '1', 'admin', 'error', null, 'http://localhost:8088/sys/user/edit/141', 'java.lang.NullPointerException', null, '2018-05-20 23:26:55');
INSERT INTO `sys_log` VALUES ('618', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:27:22');
INSERT INTO `sys_log` VALUES ('619', '141', 'xiaosong', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 23:27:28');
INSERT INTO `sys_log` VALUES ('620', '141', 'xiaosong', '请求访问主页', '16', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:27:28');
INSERT INTO `sys_log` VALUES ('621', '141', 'xiaosong', '请求访问主页', '6', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:29:36');
INSERT INTO `sys_log` VALUES ('622', '141', 'xiaosong', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:32:27');
INSERT INTO `sys_log` VALUES ('623', '141', 'xiaosong', '登录', '21', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 23:35:17');
INSERT INTO `sys_log` VALUES ('624', '141', 'xiaosong', '请求访问主页', '75', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:35:17');
INSERT INTO `sys_log` VALUES ('625', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 23:35:23');
INSERT INTO `sys_log` VALUES ('626', '1', 'admin', '请求访问主页', '29', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:35:23');
INSERT INTO `sys_log` VALUES ('627', '1', 'admin', 'error', null, 'http://localhost:8088/index', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-05-20 23:35:34');
INSERT INTO `sys_log` VALUES ('628', '1', 'admin', '请求访问主页', '14', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:35:36');
INSERT INTO `sys_log` VALUES ('629', '1', 'admin', 'error', null, 'http://localhost:8088/index', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-05-20 23:35:45');
INSERT INTO `sys_log` VALUES ('630', '1', 'admin', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:35:46');
INSERT INTO `sys_log` VALUES ('631', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:38:17');
INSERT INTO `sys_log` VALUES ('632', '1', 'admin', '编辑菜单', '21', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 23:40:25');
INSERT INTO `sys_log` VALUES ('633', '1', 'admin', '编辑菜单', '11', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 23:40:31');
INSERT INTO `sys_log` VALUES ('634', '1', 'admin', '添加菜单', '9', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2018-05-20 23:40:40');
INSERT INTO `sys_log` VALUES ('635', '1', 'admin', '保存菜单', '8', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2018-05-20 23:41:56');
INSERT INTO `sys_log` VALUES ('636', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:42:12');
INSERT INTO `sys_log` VALUES ('637', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 23:43:38');
INSERT INTO `sys_log` VALUES ('638', '1', 'admin', '更新菜单', '8', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2018-05-20 23:43:40');
INSERT INTO `sys_log` VALUES ('639', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:43:46');
INSERT INTO `sys_log` VALUES ('640', '1', 'admin', '编辑菜单', '11', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 23:43:58');
INSERT INTO `sys_log` VALUES ('641', '1', 'admin', '更新菜单', '6', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2018-05-20 23:44:39');
INSERT INTO `sys_log` VALUES ('642', '1', 'admin', '编辑菜单', '20', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 23:44:43');
INSERT INTO `sys_log` VALUES ('643', '1', 'admin', '编辑菜单', '9', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-20 23:44:47');
INSERT INTO `sys_log` VALUES ('644', '1', 'admin', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:44:56');
INSERT INTO `sys_log` VALUES ('645', '1', 'admin', '编辑角色', '9', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-20 23:45:18');
INSERT INTO `sys_log` VALUES ('646', '1', 'admin', '更新角色', '30', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-20 23:45:23');
INSERT INTO `sys_log` VALUES ('647', '1', 'admin', 'error', null, 'http://localhost:8088/sys/user/edit/141', 'java.lang.NullPointerException', null, '2018-05-20 23:46:07');
INSERT INTO `sys_log` VALUES ('648', '1', 'admin', '请求更改用户密码', '1', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-05-20 23:46:12');
INSERT INTO `sys_log` VALUES ('649', '1', 'admin', 'admin提交更改用户密码', '8', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:17');
INSERT INTO `sys_log` VALUES ('650', '1', 'admin', 'admin提交更改用户密码', '7', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:18');
INSERT INTO `sys_log` VALUES ('651', '1', 'admin', 'admin提交更改用户密码', '7', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:19');
INSERT INTO `sys_log` VALUES ('652', '1', 'admin', 'admin提交更改用户密码', '8', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:19');
INSERT INTO `sys_log` VALUES ('653', '1', 'admin', 'admin提交更改用户密码', '9', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:19');
INSERT INTO `sys_log` VALUES ('654', '1', 'admin', '请求更改用户密码', '1', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-05-20 23:46:22');
INSERT INTO `sys_log` VALUES ('655', '1', 'admin', 'admin提交更改用户密码', '8', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:25');
INSERT INTO `sys_log` VALUES ('656', '1', 'admin', 'admin提交更改用户密码', '8', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:26');
INSERT INTO `sys_log` VALUES ('657', '1', 'admin', 'admin提交更改用户密码', '8', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:26');
INSERT INTO `sys_log` VALUES ('658', '1', 'admin', 'admin提交更改用户密码', '7', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:26');
INSERT INTO `sys_log` VALUES ('659', '1', 'admin', 'admin提交更改用户密码', '7', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:27');
INSERT INTO `sys_log` VALUES ('660', '1', 'admin', 'admin提交更改用户密码', '7', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:27');
INSERT INTO `sys_log` VALUES ('661', '1', 'admin', 'admin提交更改用户密码', '6', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:27');
INSERT INTO `sys_log` VALUES ('662', '1', 'admin', 'admin提交更改用户密码', '7', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:27');
INSERT INTO `sys_log` VALUES ('663', '1', 'admin', 'admin提交更改用户密码', '6', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:46:27');
INSERT INTO `sys_log` VALUES ('664', '1', 'admin', '编辑用户', '24', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-20 23:46:31');
INSERT INTO `sys_log` VALUES ('665', '1', 'admin', '添加用户', '2', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-20 23:47:01');
INSERT INTO `sys_log` VALUES ('666', '1', 'admin', '删除用户', '12', 'com.bootdo.system.controller.UserController.remove()', null, '127.0.0.1', '2018-05-20 23:47:21');
INSERT INTO `sys_log` VALUES ('667', '1', 'admin', '添加用户', '3', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-20 23:47:22');
INSERT INTO `sys_log` VALUES ('668', '1', 'admin', '保存用户', '15', 'com.bootdo.system.controller.UserController.save()', null, '127.0.0.1', '2018-05-20 23:47:42');
INSERT INTO `sys_log` VALUES ('669', '1', 'admin', 'error', null, 'http://localhost:8088/sys/user/edit/142', 'java.lang.NullPointerException', null, '2018-05-20 23:47:44');
INSERT INTO `sys_log` VALUES ('670', '1', 'admin', 'error', null, 'http://localhost:8088/sys/user/edit/142', 'java.lang.NullPointerException', null, '2018-05-20 23:47:46');
INSERT INTO `sys_log` VALUES ('671', '1', 'admin', '请求更改用户密码', '1', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-05-20 23:47:49');
INSERT INTO `sys_log` VALUES ('672', '1', 'admin', 'admin提交更改用户密码', '7', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:47:52');
INSERT INTO `sys_log` VALUES ('673', '1', 'admin', 'admin提交更改用户密码', '6', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:47:53');
INSERT INTO `sys_log` VALUES ('674', '1', 'admin', 'admin提交更改用户密码', '6', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:47:53');
INSERT INTO `sys_log` VALUES ('675', '1', 'admin', 'admin提交更改用户密码', '7', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:47:53');
INSERT INTO `sys_log` VALUES ('676', '1', 'admin', 'admin提交更改用户密码', '6', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:47:54');
INSERT INTO `sys_log` VALUES ('677', '1', 'admin', 'admin提交更改用户密码', '6', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:47:54');
INSERT INTO `sys_log` VALUES ('678', '1', 'admin', 'admin提交更改用户密码', '6', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-20 23:47:54');
INSERT INTO `sys_log` VALUES ('679', '142', 'xiaosong', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 23:48:00');
INSERT INTO `sys_log` VALUES ('680', '142', 'xiaosong', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:48:00');
INSERT INTO `sys_log` VALUES ('681', '142', 'xiaosong', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 23:48:07');
INSERT INTO `sys_log` VALUES ('682', '142', 'xiaosong', '请求访问主页', '16', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:48:07');
INSERT INTO `sys_log` VALUES ('683', '142', 'xiaosong', 'error', null, 'http://localhost:8088/sys/user/edit/142', 'java.lang.NullPointerException', null, '2018-05-20 23:48:11');
INSERT INTO `sys_log` VALUES ('684', '142', 'xiaosong', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:50:31');
INSERT INTO `sys_log` VALUES ('685', '142', 'xiaosong', 'error', null, 'http://localhost:8088/sys/user/edit/142', 'java.lang.NullPointerException', null, '2018-05-20 23:50:35');
INSERT INTO `sys_log` VALUES ('686', '142', 'xiaosong', '删除用户', '8', 'com.bootdo.system.controller.UserController.remove()', null, '127.0.0.1', '2018-05-20 23:51:34');
INSERT INTO `sys_log` VALUES ('687', '142', 'xiaosong', '添加用户', '4', 'com.bootdo.system.controller.UserController.add()', null, '127.0.0.1', '2018-05-20 23:51:35');
INSERT INTO `sys_log` VALUES ('688', '142', 'xiaosong', '保存用户', '8', 'com.bootdo.system.controller.UserController.save()', null, '127.0.0.1', '2018-05-20 23:52:01');
INSERT INTO `sys_log` VALUES ('689', '142', 'xiaosong', '编辑用户', '17', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-20 23:52:02');
INSERT INTO `sys_log` VALUES ('690', '142', 'xiaosong', 'error', null, 'http://localhost:8088/sys/user/personal', 'java.lang.NullPointerException', null, '2018-05-20 23:53:15');
INSERT INTO `sys_log` VALUES ('691', '142', 'xiaosong', 'error', null, 'http://localhost:8088/sys/user/personal', 'java.lang.NullPointerException', null, '2018-05-20 23:53:19');
INSERT INTO `sys_log` VALUES ('692', '142', 'xiaosong', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:53:39');
INSERT INTO `sys_log` VALUES ('693', '142', 'xiaosong', 'error', null, 'http://localhost:8088/sys/user/personal', 'java.lang.NullPointerException', null, '2018-05-20 23:53:41');
INSERT INTO `sys_log` VALUES ('694', '142', 'xiaosong', 'error', null, 'http://localhost:8088/sys/user/personal', 'java.lang.NullPointerException', null, '2018-05-20 23:54:40');
INSERT INTO `sys_log` VALUES ('695', '143', 'xiaosong', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 23:57:23');
INSERT INTO `sys_log` VALUES ('696', '143', 'xiaosong', '请求访问主页', '68', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:57:23');
INSERT INTO `sys_log` VALUES ('697', '1', 'admin', '登录', '7', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 23:57:39');
INSERT INTO `sys_log` VALUES ('698', '1', 'admin', '请求访问主页', '30', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:57:39');
INSERT INTO `sys_log` VALUES ('699', '1', 'admin', '更新用户', '17', 'com.bootdo.system.controller.UserController.updatePeronal()', null, '127.0.0.1', '2018-05-20 23:58:45');
INSERT INTO `sys_log` VALUES ('700', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:59:11');
INSERT INTO `sys_log` VALUES ('701', '1', 'admin', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:59:21');
INSERT INTO `sys_log` VALUES ('702', '1', 'admin', '登录', '6', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-20 23:59:33');
INSERT INTO `sys_log` VALUES ('703', '1', 'admin', '请求访问主页', '22', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-20 23:59:33');
INSERT INTO `sys_log` VALUES ('704', '1', 'admin', '添加菜单', '15', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2018-05-20 23:59:52');
INSERT INTO `sys_log` VALUES ('705', '1', 'admin', 'error', null, 'http://localhost:8088/sys/menu/edit/80', 'java.lang.NullPointerException', null, '2018-05-20 23:59:55');
INSERT INTO `sys_log` VALUES ('706', '1', 'admin', '保存菜单', '11', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2018-05-21 00:01:03');
INSERT INTO `sys_log` VALUES ('707', '1', 'admin', '删除菜单', '13', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-21 00:01:18');
INSERT INTO `sys_log` VALUES ('708', '1', 'admin', '编辑菜单', '11', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-21 00:01:25');
INSERT INTO `sys_log` VALUES ('709', '1', 'admin', '添加菜单', '6', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2018-05-21 00:01:34');
INSERT INTO `sys_log` VALUES ('710', '1', 'admin', 'error', null, 'http://localhost:8088/sys/menu/edit/81', 'java.lang.NullPointerException', null, '2018-05-21 00:01:44');
INSERT INTO `sys_log` VALUES ('711', '1', 'admin', '保存菜单', '5', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2018-05-21 00:02:18');
INSERT INTO `sys_log` VALUES ('712', '1', 'admin', '删除菜单', '11', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-21 00:02:26');
INSERT INTO `sys_log` VALUES ('713', '1', 'admin', '添加菜单', '9', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2018-05-21 00:02:37');
INSERT INTO `sys_log` VALUES ('714', '1', 'admin', '保存菜单', '10', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2018-05-21 00:03:05');
INSERT INTO `sys_log` VALUES ('715', '1', 'admin', '删除菜单', '10', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-21 00:03:09');
INSERT INTO `sys_log` VALUES ('716', '1', 'admin', '登录', '23', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-21 00:03:57');
INSERT INTO `sys_log` VALUES ('717', '1', 'admin', '请求访问主页', '93', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:03:57');
INSERT INTO `sys_log` VALUES ('718', '1', 'admin', '编辑菜单', '21', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-21 00:04:43');
INSERT INTO `sys_log` VALUES ('719', '1', 'admin', '编辑菜单', '15', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-21 00:04:53');
INSERT INTO `sys_log` VALUES ('720', '1', 'admin', '编辑菜单', '10', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-21 00:04:57');
INSERT INTO `sys_log` VALUES ('721', '1', 'admin', '更新菜单', '13', 'com.bootdo.system.controller.MenuController.update()', null, '127.0.0.1', '2018-05-21 00:05:01');
INSERT INTO `sys_log` VALUES ('722', '1', 'admin', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:05:12');
INSERT INTO `sys_log` VALUES ('723', '1', 'admin', '编辑用户', '21', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-21 00:05:46');
INSERT INTO `sys_log` VALUES ('724', '1', 'admin', '更新用户', '21', 'com.bootdo.system.controller.UserController.update()', null, '127.0.0.1', '2018-05-21 00:05:53');
INSERT INTO `sys_log` VALUES ('725', '1', 'admin', '请求更改用户密码', '1', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-05-21 00:06:08');
INSERT INTO `sys_log` VALUES ('726', '1', 'admin', '编辑用户', '14', 'com.bootdo.system.controller.UserController.edit()', null, '127.0.0.1', '2018-05-21 00:06:18');
INSERT INTO `sys_log` VALUES ('727', '1', 'admin', '请求更改用户密码', '3', 'com.bootdo.system.controller.UserController.resetPwd()', null, '127.0.0.1', '2018-05-21 00:06:22');
INSERT INTO `sys_log` VALUES ('728', '1', 'admin', 'admin提交更改用户密码', '25', 'com.bootdo.system.controller.UserController.adminResetPwd()', null, '127.0.0.1', '2018-05-21 00:06:27');
INSERT INTO `sys_log` VALUES ('729', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:06:34');
INSERT INTO `sys_log` VALUES ('730', '1', 'admin', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-21 00:06:54');
INSERT INTO `sys_log` VALUES ('731', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-21 00:06:58');
INSERT INTO `sys_log` VALUES ('732', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-21 00:06:59');
INSERT INTO `sys_log` VALUES ('733', '143', 'xiaosong', '登录', '5', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-21 00:07:02');
INSERT INTO `sys_log` VALUES ('734', '143', 'xiaosong', '请求访问主页', '16', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:07:02');
INSERT INTO `sys_log` VALUES ('735', '143', 'xiaosong', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:07:07');
INSERT INTO `sys_log` VALUES ('736', '143', 'xiaosong', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:07:09');
INSERT INTO `sys_log` VALUES ('737', '143', 'xiaosong', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:13:11');
INSERT INTO `sys_log` VALUES ('738', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-21 00:13:25');
INSERT INTO `sys_log` VALUES ('739', '1', 'admin', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:13:25');
INSERT INTO `sys_log` VALUES ('740', '1', 'admin', '编辑角色', '6', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-21 00:14:12');
INSERT INTO `sys_log` VALUES ('741', '1', 'admin', '编辑角色', '3', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-21 00:14:34');
INSERT INTO `sys_log` VALUES ('742', '1', 'admin', '更新角色', '33', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-21 00:14:39');
INSERT INTO `sys_log` VALUES ('743', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:17:06');
INSERT INTO `sys_log` VALUES ('744', '1', 'admin', '编辑菜单', '7', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-21 00:34:05');
INSERT INTO `sys_log` VALUES ('745', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-21 00:34:21');
INSERT INTO `sys_log` VALUES ('746', '1', 'admin', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:34:21');
INSERT INTO `sys_log` VALUES ('747', '1', 'admin', '添加菜单', '16', 'com.bootdo.system.controller.MenuController.add()', null, '127.0.0.1', '2018-05-21 00:34:35');
INSERT INTO `sys_log` VALUES ('748', '1', 'admin', '保存菜单', '41', 'com.bootdo.system.controller.MenuController.save()', null, '127.0.0.1', '2018-05-21 00:35:02');
INSERT INTO `sys_log` VALUES ('749', '1', 'admin', '编辑角色', '7', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-21 00:35:10');
INSERT INTO `sys_log` VALUES ('750', '1', 'admin', '更新角色', '18', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-21 00:35:15');
INSERT INTO `sys_log` VALUES ('751', '1', 'admin', '请求访问主页', '12', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:35:18');
INSERT INTO `sys_log` VALUES ('752', '1', 'admin', '删除菜单', '10', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-21 00:35:30');
INSERT INTO `sys_log` VALUES ('753', '1', 'admin', '删除菜单', '8', 'com.bootdo.system.controller.MenuController.remove()', null, '127.0.0.1', '2018-05-21 00:35:33');
INSERT INTO `sys_log` VALUES ('754', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:35:38');
INSERT INTO `sys_log` VALUES ('755', '1', 'admin', '编辑角色', '3', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-21 00:35:52');
INSERT INTO `sys_log` VALUES ('756', '1', 'admin', '更新角色', '10', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-21 00:36:08');
INSERT INTO `sys_log` VALUES ('757', '1', 'admin', '编辑角色', '3', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-21 00:36:11');
INSERT INTO `sys_log` VALUES ('758', '1', 'admin', '更新角色', '8', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-21 00:36:38');
INSERT INTO `sys_log` VALUES ('759', '1', 'admin', '编辑角色', '2', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-21 00:36:46');
INSERT INTO `sys_log` VALUES ('760', '1', 'admin', '更新角色', '37', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-21 00:36:52');
INSERT INTO `sys_log` VALUES ('761', '1', 'admin', '编辑角色', '2', 'com.bootdo.system.controller.RoleController.edit()', null, '127.0.0.1', '2018-05-21 00:36:55');
INSERT INTO `sys_log` VALUES ('762', '1', 'admin', '更新角色', '9', 'com.bootdo.system.controller.RoleController.update()', null, '127.0.0.1', '2018-05-21 00:36:57');
INSERT INTO `sys_log` VALUES ('763', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:36:59');
INSERT INTO `sys_log` VALUES ('764', '1', 'admin', '编辑菜单', '8', 'com.bootdo.system.controller.MenuController.edit()', null, '127.0.0.1', '2018-05-21 00:40:15');
INSERT INTO `sys_log` VALUES ('765', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-05-21 00:41:55');
INSERT INTO `sys_log` VALUES ('766', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:41:55');
INSERT INTO `sys_log` VALUES ('767', '1', 'admin', '请求访问主页', '7', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:42:19');
INSERT INTO `sys_log` VALUES ('768', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 00:44:02');
INSERT INTO `sys_log` VALUES ('769', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 01:02:54');
INSERT INTO `sys_log` VALUES ('770', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 01:04:13');
INSERT INTO `sys_log` VALUES ('771', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 01:04:42');
INSERT INTO `sys_log` VALUES ('772', '1', 'admin', '请求访问主页', '18', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 01:04:46');
INSERT INTO `sys_log` VALUES ('773', '1', 'admin', '请求访问主页', '9', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 01:06:05');
INSERT INTO `sys_log` VALUES ('774', '1', 'admin', '请求访问主页', '13', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 01:06:46');
INSERT INTO `sys_log` VALUES ('775', '1', 'admin', '请求访问主页', '8', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2018-05-21 01:07:08');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('2', '3', '系统菜单', 'sys/menu/', 'sys:menu:menu', '1', 'fa fa-th-list', '2', '2017-08-09 22:55:15', null);
INSERT INTO `sys_menu` VALUES ('3', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES ('6', '3', '员工管理', 'sys/user/', 'sys:user:user', '1', 'fa fa-user', '0', '2017-08-10 14:12:11', null);
INSERT INTO `sys_menu` VALUES ('7', '3', '角色管理', 'sys/role', 'sys:role:role', '1', 'fa fa-paw', '1', '2017-08-10 14:13:19', null);
INSERT INTO `sys_menu` VALUES ('12', '6', '新增', '', 'sys:user:add', '2', '', '0', '2017-08-14 10:51:35', null);
INSERT INTO `sys_menu` VALUES ('13', '6', '编辑', '', 'sys:user:edit', '2', '', '0', '2017-08-14 10:52:06', null);
INSERT INTO `sys_menu` VALUES ('14', '6', '删除', null, 'sys:user:remove', '2', null, '0', '2017-08-14 10:52:24', null);
INSERT INTO `sys_menu` VALUES ('15', '7', '新增', '', 'sys:role:add', '2', '', '0', '2017-08-14 10:56:37', null);
INSERT INTO `sys_menu` VALUES ('20', '2', '新增', '', 'sys:menu:add', '2', '', '0', '2017-08-14 10:59:32', null);
INSERT INTO `sys_menu` VALUES ('21', '2', '编辑', '', 'sys:menu:edit', '2', '', '0', '2017-08-14 10:59:56', null);
INSERT INTO `sys_menu` VALUES ('22', '2', '删除', '', 'sys:menu:remove', '2', '', '0', '2017-08-14 11:00:26', null);
INSERT INTO `sys_menu` VALUES ('24', '6', '批量删除', '', 'sys:user:batchRemove', '2', '', '0', '2017-08-14 17:27:18', null);
INSERT INTO `sys_menu` VALUES ('25', '6', '停用', null, 'sys:user:disable', '2', null, '0', '2017-08-14 17:27:43', null);
INSERT INTO `sys_menu` VALUES ('26', '6', '重置密码', '', 'sys:user:resetPwd', '2', '', '0', '2017-08-14 17:28:34', null);
INSERT INTO `sys_menu` VALUES ('27', '91', '系统日志', 'common/log', 'common:log', '1', 'fa fa-warning', '0', '2017-08-14 22:11:53', null);
INSERT INTO `sys_menu` VALUES ('28', '27', '刷新', null, 'sys:log:list', '2', null, '0', '2017-08-14 22:30:22', null);
INSERT INTO `sys_menu` VALUES ('29', '27', '删除', null, 'sys:log:remove', '2', null, '0', '2017-08-14 22:30:43', null);
INSERT INTO `sys_menu` VALUES ('30', '27', '清空', null, 'sys:log:clear', '2', null, '0', '2017-08-14 22:31:02', null);
INSERT INTO `sys_menu` VALUES ('48', '77', '代码生成', 'common/generator', 'common:generator', '1', 'fa fa-code', '3', null, null);
INSERT INTO `sys_menu` VALUES ('55', '7', '编辑', '', 'sys:role:edit', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('56', '7', '删除', '', 'sys:role:remove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('57', '91', '运行监控', '/druid/index.html', '', '1', 'fa fa-caret-square-o-right', '1', null, null);
INSERT INTO `sys_menu` VALUES ('61', '2', '批量删除', '', 'sys:menu:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('62', '7', '批量删除', '', 'sys:role:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('72', '77', '计划任务', 'common/job', 'common:taskScheduleJob', '1', 'fa fa-hourglass-1', '4', null, null);
INSERT INTO `sys_menu` VALUES ('73', '3', '部门管理', '/system/sysDept', 'system:sysDept:sysDept', '1', 'fa fa-users', '3', null, null);
INSERT INTO `sys_menu` VALUES ('74', '73', '增加', '/system/sysDept/add', 'system:sysDept:add', '2', null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('75', '73', '刪除', 'system/sysDept/remove', 'system:sysDept:remove', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('76', '73', '编辑', '/system/sysDept/edit', 'system:sysDept:edit', '2', null, '3', null, null);
INSERT INTO `sys_menu` VALUES ('77', '0', '系统工具', '', '', '0', 'fa fa-gear', '4', null, null);
INSERT INTO `sys_menu` VALUES ('91', '0', '系统监控', '', '', '0', 'fa fa-video-camera', '5', null, null);
INSERT INTO `sys_menu` VALUES ('92', '91', '在线用户', 'sys/online', '', '1', 'fa fa-user', null, null, null);
INSERT INTO `sys_menu` VALUES ('97', '0', '图表管理', '', '', '0', 'fa fa-bar-chart', '7', null, null);
INSERT INTO `sys_menu` VALUES ('98', '97', '百度chart', '/chart/graph_echarts.html', '', '1', 'fa fa-area-chart', null, null, null);
INSERT INTO `sys_menu` VALUES ('102', '77', '数据字典', '/common/dict', 'common:dict:dict', '1', 'fa fa-book', '1', null, null);
INSERT INTO `sys_menu` VALUES ('103', '102', '增加', '/common/dict/add', 'common:dict:add', '2', '', '2', null, null);
INSERT INTO `sys_menu` VALUES ('104', '102', '编辑', '/common/dict/edit', 'common:dict:edit', '2', '', '3', null, null);
INSERT INTO `sys_menu` VALUES ('105', '102', '删除', '/common/dict/remove', 'common:dict:remove', '2', '', '2', null, null);
INSERT INTO `sys_menu` VALUES ('106', '102', '批量删除', '/common/dict/batchRemove', 'common:dict:batchRemove', '2', '', '2', null, null);
INSERT INTO `sys_menu` VALUES ('107', '77', '文件管理', '/common/sysFile', 'common:sysFile:sysFile', '1', 'fa fa-folder-open', '5', null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级用户角色', 'admin', '拥有最高权限', '2', '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES ('4', '普通员工权限', null, '拥有员工权限', null, null, null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3256 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('367', '44', '1');
INSERT INTO `sys_role_menu` VALUES ('368', '44', '32');
INSERT INTO `sys_role_menu` VALUES ('369', '44', '33');
INSERT INTO `sys_role_menu` VALUES ('370', '44', '34');
INSERT INTO `sys_role_menu` VALUES ('371', '44', '35');
INSERT INTO `sys_role_menu` VALUES ('372', '44', '28');
INSERT INTO `sys_role_menu` VALUES ('373', '44', '29');
INSERT INTO `sys_role_menu` VALUES ('374', '44', '30');
INSERT INTO `sys_role_menu` VALUES ('375', '44', '38');
INSERT INTO `sys_role_menu` VALUES ('376', '44', '4');
INSERT INTO `sys_role_menu` VALUES ('377', '44', '27');
INSERT INTO `sys_role_menu` VALUES ('378', '45', '38');
INSERT INTO `sys_role_menu` VALUES ('379', '46', '3');
INSERT INTO `sys_role_menu` VALUES ('380', '46', '20');
INSERT INTO `sys_role_menu` VALUES ('381', '46', '21');
INSERT INTO `sys_role_menu` VALUES ('382', '46', '22');
INSERT INTO `sys_role_menu` VALUES ('383', '46', '23');
INSERT INTO `sys_role_menu` VALUES ('384', '46', '11');
INSERT INTO `sys_role_menu` VALUES ('385', '46', '12');
INSERT INTO `sys_role_menu` VALUES ('386', '46', '13');
INSERT INTO `sys_role_menu` VALUES ('387', '46', '14');
INSERT INTO `sys_role_menu` VALUES ('388', '46', '24');
INSERT INTO `sys_role_menu` VALUES ('389', '46', '25');
INSERT INTO `sys_role_menu` VALUES ('390', '46', '26');
INSERT INTO `sys_role_menu` VALUES ('391', '46', '15');
INSERT INTO `sys_role_menu` VALUES ('392', '46', '2');
INSERT INTO `sys_role_menu` VALUES ('393', '46', '6');
INSERT INTO `sys_role_menu` VALUES ('394', '46', '7');
INSERT INTO `sys_role_menu` VALUES ('598', '50', '38');
INSERT INTO `sys_role_menu` VALUES ('632', '38', '42');
INSERT INTO `sys_role_menu` VALUES ('737', '51', '38');
INSERT INTO `sys_role_menu` VALUES ('738', '51', '39');
INSERT INTO `sys_role_menu` VALUES ('739', '51', '40');
INSERT INTO `sys_role_menu` VALUES ('740', '51', '41');
INSERT INTO `sys_role_menu` VALUES ('741', '51', '4');
INSERT INTO `sys_role_menu` VALUES ('742', '51', '32');
INSERT INTO `sys_role_menu` VALUES ('743', '51', '33');
INSERT INTO `sys_role_menu` VALUES ('744', '51', '34');
INSERT INTO `sys_role_menu` VALUES ('745', '51', '35');
INSERT INTO `sys_role_menu` VALUES ('746', '51', '27');
INSERT INTO `sys_role_menu` VALUES ('747', '51', '28');
INSERT INTO `sys_role_menu` VALUES ('748', '51', '29');
INSERT INTO `sys_role_menu` VALUES ('749', '51', '30');
INSERT INTO `sys_role_menu` VALUES ('750', '51', '1');
INSERT INTO `sys_role_menu` VALUES ('1064', '54', '53');
INSERT INTO `sys_role_menu` VALUES ('1095', '55', '2');
INSERT INTO `sys_role_menu` VALUES ('1096', '55', '6');
INSERT INTO `sys_role_menu` VALUES ('1097', '55', '7');
INSERT INTO `sys_role_menu` VALUES ('1098', '55', '3');
INSERT INTO `sys_role_menu` VALUES ('1099', '55', '50');
INSERT INTO `sys_role_menu` VALUES ('1100', '55', '49');
INSERT INTO `sys_role_menu` VALUES ('1101', '55', '1');
INSERT INTO `sys_role_menu` VALUES ('1856', '53', '28');
INSERT INTO `sys_role_menu` VALUES ('1857', '53', '29');
INSERT INTO `sys_role_menu` VALUES ('1858', '53', '30');
INSERT INTO `sys_role_menu` VALUES ('1859', '53', '27');
INSERT INTO `sys_role_menu` VALUES ('1860', '53', '57');
INSERT INTO `sys_role_menu` VALUES ('1861', '53', '71');
INSERT INTO `sys_role_menu` VALUES ('1862', '53', '48');
INSERT INTO `sys_role_menu` VALUES ('1863', '53', '72');
INSERT INTO `sys_role_menu` VALUES ('1864', '53', '1');
INSERT INTO `sys_role_menu` VALUES ('1865', '53', '7');
INSERT INTO `sys_role_menu` VALUES ('1866', '53', '55');
INSERT INTO `sys_role_menu` VALUES ('1867', '53', '56');
INSERT INTO `sys_role_menu` VALUES ('1868', '53', '62');
INSERT INTO `sys_role_menu` VALUES ('1869', '53', '15');
INSERT INTO `sys_role_menu` VALUES ('1870', '53', '2');
INSERT INTO `sys_role_menu` VALUES ('1871', '53', '61');
INSERT INTO `sys_role_menu` VALUES ('1872', '53', '20');
INSERT INTO `sys_role_menu` VALUES ('1873', '53', '21');
INSERT INTO `sys_role_menu` VALUES ('1874', '53', '22');
INSERT INTO `sys_role_menu` VALUES ('2084', '56', '68');
INSERT INTO `sys_role_menu` VALUES ('2085', '56', '60');
INSERT INTO `sys_role_menu` VALUES ('2086', '56', '59');
INSERT INTO `sys_role_menu` VALUES ('2087', '56', '58');
INSERT INTO `sys_role_menu` VALUES ('2088', '56', '51');
INSERT INTO `sys_role_menu` VALUES ('2089', '56', '50');
INSERT INTO `sys_role_menu` VALUES ('2090', '56', '49');
INSERT INTO `sys_role_menu` VALUES ('2243', '48', '72');
INSERT INTO `sys_role_menu` VALUES ('2247', '63', '-1');
INSERT INTO `sys_role_menu` VALUES ('2248', '63', '84');
INSERT INTO `sys_role_menu` VALUES ('2249', '63', '85');
INSERT INTO `sys_role_menu` VALUES ('2250', '63', '88');
INSERT INTO `sys_role_menu` VALUES ('2251', '63', '87');
INSERT INTO `sys_role_menu` VALUES ('2252', '64', '84');
INSERT INTO `sys_role_menu` VALUES ('2253', '64', '89');
INSERT INTO `sys_role_menu` VALUES ('2254', '64', '88');
INSERT INTO `sys_role_menu` VALUES ('2255', '64', '87');
INSERT INTO `sys_role_menu` VALUES ('2256', '64', '86');
INSERT INTO `sys_role_menu` VALUES ('2257', '64', '85');
INSERT INTO `sys_role_menu` VALUES ('2258', '65', '89');
INSERT INTO `sys_role_menu` VALUES ('2259', '65', '88');
INSERT INTO `sys_role_menu` VALUES ('2260', '65', '86');
INSERT INTO `sys_role_menu` VALUES ('2262', '67', '48');
INSERT INTO `sys_role_menu` VALUES ('2263', '68', '88');
INSERT INTO `sys_role_menu` VALUES ('2264', '68', '87');
INSERT INTO `sys_role_menu` VALUES ('2265', '69', '89');
INSERT INTO `sys_role_menu` VALUES ('2266', '69', '88');
INSERT INTO `sys_role_menu` VALUES ('2267', '69', '86');
INSERT INTO `sys_role_menu` VALUES ('2268', '69', '87');
INSERT INTO `sys_role_menu` VALUES ('2269', '69', '85');
INSERT INTO `sys_role_menu` VALUES ('2270', '69', '84');
INSERT INTO `sys_role_menu` VALUES ('2271', '70', '85');
INSERT INTO `sys_role_menu` VALUES ('2272', '70', '89');
INSERT INTO `sys_role_menu` VALUES ('2273', '70', '88');
INSERT INTO `sys_role_menu` VALUES ('2274', '70', '87');
INSERT INTO `sys_role_menu` VALUES ('2275', '70', '86');
INSERT INTO `sys_role_menu` VALUES ('2276', '70', '84');
INSERT INTO `sys_role_menu` VALUES ('2277', '71', '87');
INSERT INTO `sys_role_menu` VALUES ('2278', '72', '59');
INSERT INTO `sys_role_menu` VALUES ('2279', '73', '48');
INSERT INTO `sys_role_menu` VALUES ('2280', '74', '88');
INSERT INTO `sys_role_menu` VALUES ('2281', '74', '87');
INSERT INTO `sys_role_menu` VALUES ('2282', '75', '88');
INSERT INTO `sys_role_menu` VALUES ('2283', '75', '87');
INSERT INTO `sys_role_menu` VALUES ('2284', '76', '85');
INSERT INTO `sys_role_menu` VALUES ('2285', '76', '89');
INSERT INTO `sys_role_menu` VALUES ('2286', '76', '88');
INSERT INTO `sys_role_menu` VALUES ('2287', '76', '87');
INSERT INTO `sys_role_menu` VALUES ('2288', '76', '86');
INSERT INTO `sys_role_menu` VALUES ('2289', '76', '84');
INSERT INTO `sys_role_menu` VALUES ('2292', '78', '88');
INSERT INTO `sys_role_menu` VALUES ('2293', '78', '87');
INSERT INTO `sys_role_menu` VALUES ('2294', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2295', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2296', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2308', '80', '87');
INSERT INTO `sys_role_menu` VALUES ('2309', '80', '86');
INSERT INTO `sys_role_menu` VALUES ('2310', '80', '-1');
INSERT INTO `sys_role_menu` VALUES ('2311', '80', '84');
INSERT INTO `sys_role_menu` VALUES ('2312', '80', '85');
INSERT INTO `sys_role_menu` VALUES ('2328', '79', '72');
INSERT INTO `sys_role_menu` VALUES ('2329', '79', '48');
INSERT INTO `sys_role_menu` VALUES ('2330', '79', '77');
INSERT INTO `sys_role_menu` VALUES ('2331', '79', '84');
INSERT INTO `sys_role_menu` VALUES ('2332', '79', '89');
INSERT INTO `sys_role_menu` VALUES ('2333', '79', '88');
INSERT INTO `sys_role_menu` VALUES ('2334', '79', '87');
INSERT INTO `sys_role_menu` VALUES ('2335', '79', '86');
INSERT INTO `sys_role_menu` VALUES ('2336', '79', '85');
INSERT INTO `sys_role_menu` VALUES ('2337', '79', '-1');
INSERT INTO `sys_role_menu` VALUES ('2338', '77', '89');
INSERT INTO `sys_role_menu` VALUES ('2339', '77', '88');
INSERT INTO `sys_role_menu` VALUES ('2340', '77', '87');
INSERT INTO `sys_role_menu` VALUES ('2341', '77', '86');
INSERT INTO `sys_role_menu` VALUES ('2342', '77', '85');
INSERT INTO `sys_role_menu` VALUES ('2343', '77', '84');
INSERT INTO `sys_role_menu` VALUES ('2344', '77', '72');
INSERT INTO `sys_role_menu` VALUES ('2345', '77', '-1');
INSERT INTO `sys_role_menu` VALUES ('2346', '77', '77');
INSERT INTO `sys_role_menu` VALUES ('2974', '57', '93');
INSERT INTO `sys_role_menu` VALUES ('2975', '57', '99');
INSERT INTO `sys_role_menu` VALUES ('2976', '57', '95');
INSERT INTO `sys_role_menu` VALUES ('2977', '57', '101');
INSERT INTO `sys_role_menu` VALUES ('2978', '57', '96');
INSERT INTO `sys_role_menu` VALUES ('2979', '57', '94');
INSERT INTO `sys_role_menu` VALUES ('2980', '57', '-1');
INSERT INTO `sys_role_menu` VALUES ('2981', '58', '93');
INSERT INTO `sys_role_menu` VALUES ('2982', '58', '99');
INSERT INTO `sys_role_menu` VALUES ('2983', '58', '95');
INSERT INTO `sys_role_menu` VALUES ('2984', '58', '101');
INSERT INTO `sys_role_menu` VALUES ('2985', '58', '96');
INSERT INTO `sys_role_menu` VALUES ('2986', '58', '94');
INSERT INTO `sys_role_menu` VALUES ('2987', '58', '-1');
INSERT INTO `sys_role_menu` VALUES ('3201', '1', '98');
INSERT INTO `sys_role_menu` VALUES ('3202', '1', '92');
INSERT INTO `sys_role_menu` VALUES ('3203', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('3204', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('3205', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('3206', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('3207', '1', '76');
INSERT INTO `sys_role_menu` VALUES ('3208', '1', '75');
INSERT INTO `sys_role_menu` VALUES ('3209', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('3210', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('3211', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('3212', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('3213', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('3214', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('3215', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('3216', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('3217', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('3218', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('3219', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('3220', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('3221', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('3222', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('3223', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('3224', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('3225', '1', '97');
INSERT INTO `sys_role_menu` VALUES ('3226', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('3227', '1', '91');
INSERT INTO `sys_role_menu` VALUES ('3228', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('3229', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('3230', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('3231', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3232', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('3233', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('3234', '1', '77');
INSERT INTO `sys_role_menu` VALUES ('3235', '1', '106');
INSERT INTO `sys_role_menu` VALUES ('3236', '1', '105');
INSERT INTO `sys_role_menu` VALUES ('3237', '1', '104');
INSERT INTO `sys_role_menu` VALUES ('3238', '1', '103');
INSERT INTO `sys_role_menu` VALUES ('3239', '1', '107');
INSERT INTO `sys_role_menu` VALUES ('3240', '1', '102');
INSERT INTO `sys_role_menu` VALUES ('3241', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('3242', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('3243', '1', '-1');
INSERT INTO `sys_role_menu` VALUES ('3253', '4', '98');
INSERT INTO `sys_role_menu` VALUES ('3254', '4', '97');
INSERT INTO `sys_role_menu` VALUES ('3255', '4', '-1');

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES ('2', '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.bootdo.common.task.WelcomeJob', '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', null, '', 'welcomJob');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', 'd0af8fa1272ef5a152d9e27763eea293', '6', '18813362327@163.com', '18813362327', '1', '1', '2017-08-15 21:40:39', '2017-08-15 21:41:00', '96', '2017-12-14 00:00:00', '138', '车陂地铁口附近', '121;', '广东省', '广州市', '天河区');
INSERT INTO `sys_user` VALUES ('2', 'test', '临时用户', '6cf3bb3deba2aadbd41ec9a22511084e', '6', 'test@bootdo.com', null, '1', '1', '2017-08-14 13:43:05', '2017-08-14 21:15:36', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('36', 'ldh', '刘德华', 'bfd9394475754fbe45866eba97738c36', '7', 'ldh@bootdo.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('123', 'zxy', '张学友', '35174ba93f5fe7267f1fb3c1bf903781', '6', 'zxy@bootdo', null, '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('124', 'wyf', '吴亦凡', 'e179e6f687bbd57b9d7efc4746c8090a', '6', 'wyf@bootdo.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('130', 'lh', '鹿晗', '7924710cd673f68967cde70e188bb097', '9', 'lh@bootdo.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('131', 'lhc', '令狐冲', 'd515538e17ecb570ba40344b5618f5d4', '6', 'lhc@bootdo.com', null, '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('132', 'lyf', 'Boss', '7fdb1d9008f45950c1620ba0864e5fbd', '13', 'lyf@bootdo.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('134', 'lyh', '李彦宏', 'dc26092b3244d9d432863f2738180e19', '8', 'lyh@bootdo.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('135', 'wjl', '王健林', '3967697dfced162cf6a34080259b83aa', '6', 'wjl@bootod.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('136', 'gdg', '郭德纲', '3bb1bda86bc02bf6478cd91e42135d2f', '10', 'gdg@bootdo.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('139', 'boss1', '老板一', '20c5ed9ef346e3a9acf6fcb0d4ed56fb', null, '1690241987@qq.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('140', 'songlijun', '宋利军', '86ca397e2624207c8669ea8a9825719b', '12', '1690241987@qq.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('143', 'xiaosong', '小宋', '69c1e319ff192aa4ce947481a8b9aaaa', '16', 'xiaosong@qq.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_plus
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE `sys_user_plus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `payment` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_plus
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('73', '30', '48');
INSERT INTO `sys_user_role` VALUES ('74', '30', '49');
INSERT INTO `sys_user_role` VALUES ('75', '30', '50');
INSERT INTO `sys_user_role` VALUES ('76', '31', '48');
INSERT INTO `sys_user_role` VALUES ('77', '31', '49');
INSERT INTO `sys_user_role` VALUES ('78', '31', '52');
INSERT INTO `sys_user_role` VALUES ('79', '32', '48');
INSERT INTO `sys_user_role` VALUES ('80', '32', '49');
INSERT INTO `sys_user_role` VALUES ('81', '32', '50');
INSERT INTO `sys_user_role` VALUES ('82', '32', '51');
INSERT INTO `sys_user_role` VALUES ('83', '32', '52');
INSERT INTO `sys_user_role` VALUES ('84', '33', '38');
INSERT INTO `sys_user_role` VALUES ('85', '33', '49');
INSERT INTO `sys_user_role` VALUES ('86', '33', '52');
INSERT INTO `sys_user_role` VALUES ('87', '34', '50');
INSERT INTO `sys_user_role` VALUES ('88', '34', '51');
INSERT INTO `sys_user_role` VALUES ('89', '34', '52');
INSERT INTO `sys_user_role` VALUES ('106', '124', '1');
INSERT INTO `sys_user_role` VALUES ('110', '1', '1');
INSERT INTO `sys_user_role` VALUES ('111', '2', '1');
INSERT INTO `sys_user_role` VALUES ('113', '131', '48');
INSERT INTO `sys_user_role` VALUES ('117', '135', '1');
INSERT INTO `sys_user_role` VALUES ('120', '134', '1');
INSERT INTO `sys_user_role` VALUES ('121', '134', '48');
INSERT INTO `sys_user_role` VALUES ('123', '130', '1');
INSERT INTO `sys_user_role` VALUES ('124', null, '48');
INSERT INTO `sys_user_role` VALUES ('127', '123', '48');
INSERT INTO `sys_user_role` VALUES ('132', '36', '48');
INSERT INTO `sys_user_role` VALUES ('134', '140', '4');
INSERT INTO `sys_user_role` VALUES ('137', '143', '4');
INSERT INTO `sys_user_role` VALUES ('138', '136', '4');
SET FOREIGN_KEY_CHECKS=1;
