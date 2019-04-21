/*
Navicat MySQL Data Transfer

Source Server         : Mysql_localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : yzncms

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-21 09:55:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yzn_addons
-- ----------------------------
DROP TABLE IF EXISTS `yzn_addons`;
CREATE TABLE `yzn_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of yzn_addons
-- ----------------------------
INSERT INTO `yzn_addons` VALUES ('2', 'database', '数据库备份', '简单的数据库备份', '1', '{\"path\":\"\\/Data\\/\",\"part\":\"20971520\",\"compress\":\"1\",\"level\":\"9\"}', '御宅男', '1.0.0', '1554790573', '1');
INSERT INTO `yzn_addons` VALUES ('3', 'returntop', '返回顶部', '回到顶部美化，随机或指定显示，100款样式，每天一种换，天天都用新样式', '1', '{\"random\":\"1\",\"current\":\"89\"}', '御宅男', '1.0.0', '1554790633', '0');

-- ----------------------------
-- Table structure for yzn_admin
-- ----------------------------
DROP TABLE IF EXISTS `yzn_admin`;
CREATE TABLE `yzn_admin` (
  `userid` smallint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '管理账号',
  `password` varchar(32) DEFAULT NULL COMMENT '管理密码',
  `roleid` tinyint(4) unsigned DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL COMMENT '加密因子',
  `nickname` char(16) NOT NULL COMMENT '昵称',
  `last_login_time` int(10) unsigned DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) unsigned DEFAULT '0' COMMENT '最后登录IP',
  `email` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of yzn_admin
-- ----------------------------
INSERT INTO `yzn_admin` VALUES ('1', 'admin', 'aafe32203ccc259349dd9696c9310e6f', '1', 'd9hhee', '御宅男', '1555807644', '0', '530765310@qq.com', '1');
INSERT INTO `yzn_admin` VALUES ('2', 'ken678', '932e31f030b850a87702a86c0e16db16', '2', 'Sxq6dR', '御宅男', '1542781151', '2130706433', '530765310@qq.com', '1');

-- ----------------------------
-- Table structure for yzn_adminlog
-- ----------------------------
DROP TABLE IF EXISTS `yzn_adminlog`;
CREATE TABLE `yzn_adminlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `uid` smallint(3) NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `info` text COMMENT '说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` bigint(20) unsigned NOT NULL DEFAULT '0',
  `get` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=333 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of yzn_adminlog
-- ----------------------------
INSERT INTO `yzn_adminlog` VALUES ('36', '1', '1', '提示语:操作成功！', '1554727150', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('35', '1', '1', '提示语:修改成功！', '1554727124', '0', '/YZNCMS/public/index.php/cms/tags/edit.html?id=14');
INSERT INTO `yzn_adminlog` VALUES ('34', '1', '1', '提示语:删除日志成功！', '1554727052', '0', '/YZNCMS/public/index.php/admin/adminlog/deletelog.html');
INSERT INTO `yzn_adminlog` VALUES ('5', '0', '0', '提示语:请先登陆', '1554724097', '0', '/YZNCMS/public/index.php/Admin');
INSERT INTO `yzn_adminlog` VALUES ('6', '0', '0', '提示语:请先登陆', '1554724102', '0', '/YZNCMS/public/index.php/admin');
INSERT INTO `yzn_adminlog` VALUES ('7', '1', '1', '提示语:恭喜您，登陆成功', '1554724120', '0', '/YZNCMS/public/index.php/admin/index/login.html');
INSERT INTO `yzn_adminlog` VALUES ('8', '1', '1', '提示语:模块安装成功！一键清理缓存后生效！', '1554724308', '0', '/YZNCMS/public/index.php/admin/module/install.html');
INSERT INTO `yzn_adminlog` VALUES ('9', '1', '1', '提示语:模块安装成功！一键清理缓存后生效！', '1554724317', '0', '/YZNCMS/public/index.php/admin/module/install.html');
INSERT INTO `yzn_adminlog` VALUES ('10', '1', '1', '提示语:清理缓存', '1554724321', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1554724122621');
INSERT INTO `yzn_adminlog` VALUES ('11', '0', '1', '提示语:密码和确认字段不一致', '1554724509', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('12', '1', '1', '提示语:操作成功!', '1554724855', '0', '/YZNCMS/public/index.php/admin/auth_manager/writegroup.html');
INSERT INTO `yzn_adminlog` VALUES ('13', '1', '1', '提示语:操作成功！', '1554724975', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('14', '0', '1', '提示语:该页面不存在！', '1554724983', '0', '/YZNCMS/public/index.php/addons/addons/addonadmin/menuid/35.html');
INSERT INTO `yzn_adminlog` VALUES ('15', '1', '1', '提示语:操作成功！', '1554724999', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('16', '0', '1', '提示语:该页面不存在！', '1554725007', '0', '/YZNCMS/public/index.php/addons/addons/addonadmin/menuid/35.html');
INSERT INTO `yzn_adminlog` VALUES ('17', '0', '1', '提示语:栏目标题不得为空', '1554725322', '0', '/YZNCMS/public/index.php/cms/category/add.html');
INSERT INTO `yzn_adminlog` VALUES ('18', '0', '1', '提示语:栏目标题不得为空', '1554725328', '0', '/YZNCMS/public/index.php/cms/category/add.html');
INSERT INTO `yzn_adminlog` VALUES ('19', '0', '1', '提示语:栏目标题不得为空', '1554725330', '0', '/YZNCMS/public/index.php/cms/category/add.html');
INSERT INTO `yzn_adminlog` VALUES ('20', '1', '1', '提示语:操作成功！', '1554725362', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('21', '1', '1', '提示语:操作成功！', '1554725376', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('22', '0', '1', '提示语:密码和确认字段不一致', '1554725397', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('23', '0', '1', '提示语:密码和确认字段不一致', '1554725414', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('24', '1', '1', '提示语:设置更新成功', '1554725630', '0', '/YZNCMS/public/index.php/admin/config/setting/group/base.html');
INSERT INTO `yzn_adminlog` VALUES ('25', '1', '1', '提示语:操作成功！', '1554725741', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('26', '0', '1', '提示语:名称不能为空', '1554725932', '0', '/YZNCMS/public/index.php/admin/menu/add.html');
INSERT INTO `yzn_adminlog` VALUES ('27', '0', '1', '提示语:名称不能为空', '1554726184', '0', '/YZNCMS/public/index.php/admin/menu/add.html');
INSERT INTO `yzn_adminlog` VALUES ('28', '0', '1', '提示语:名称不能为空', '1554726277', '0', '/YZNCMS/public/index.php/admin/menu/add.html');
INSERT INTO `yzn_adminlog` VALUES ('29', '0', '1', '提示语:名称不能为空', '1554726307', '0', '/YZNCMS/public/index.php/admin/menu/add.html');
INSERT INTO `yzn_adminlog` VALUES ('30', '0', '1', '提示语:名称不能为空', '1554726409', '0', '/YZNCMS/public/index.php/admin/menu/add.html');
INSERT INTO `yzn_adminlog` VALUES ('31', '0', '1', '提示语:名称不能为空', '1554726426', '0', '/YZNCMS/public/index.php/admin/menu/add.html');
INSERT INTO `yzn_adminlog` VALUES ('32', '0', '1', '提示语:用户名已存在', '1554726550', '0', '/YZNCMS/public/index.php/admin/manager/add.html');
INSERT INTO `yzn_adminlog` VALUES ('33', '1', '1', '提示语:操作成功!', '1554726686', '0', '/YZNCMS/public/index.php/admin/auth_manager/writegroup.html');
INSERT INTO `yzn_adminlog` VALUES ('37', '0', '1', '提示语:邮箱不能为空', '1554728249', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('38', '0', '1', '提示语:邮箱格式不符', '1554728256', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('39', '0', '1', '提示语:用户名已存在', '1554728279', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('40', '0', '1', '提示语:用户名已存在', '1554728323', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('41', '0', '1', '提示语:用户名已存在', '1554728597', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('42', '0', '1', '提示语:昵称已存在', '1554728647', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('43', '0', '1', '提示语:密码不能为空', '1554728650', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('44', '0', '1', '提示语:密码不能为空', '1554728823', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('45', '0', '1', '提示语:用户名已存在', '1554728833', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('46', '1', '1', '提示语:修改成功！', '1554730948', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('47', '1', '1', '提示语:操作成功！', '1554731251', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('48', '1', '1', '提示语:操作成功！', '1554731286', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('49', '1', '1', '提示语:操作成功！', '1554731310', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('50', '1', '1', '提示语:操作成功！', '1554731311', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('51', '1', '1', '提示语:操作成功！', '1554731312', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('52', '1', '1', '提示语:更新缓存成功！', '1554731425', '0', '/YZNCMS/public/index.php/cms/category/public_cache.html');
INSERT INTO `yzn_adminlog` VALUES ('53', '1', '1', '提示语:操作成功！', '1554731491', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('54', '1', '1', '提示语:会员配置修改成功！', '1554732770', '0', '/YZNCMS/public/index.php/member/setting/setting/menuid/94.html');
INSERT INTO `yzn_adminlog` VALUES ('55', '1', '1', '提示语:会员配置修改成功！', '1554732859', '0', '/YZNCMS/public/index.php/member/setting/setting/menuid/94.html');
INSERT INTO `yzn_adminlog` VALUES ('56', '1', '1', '提示语:会员配置修改成功！', '1554732888', '0', '/YZNCMS/public/index.php/member/setting/setting/menuid/94.html');
INSERT INTO `yzn_adminlog` VALUES ('57', '1', '1', '提示语:会员配置修改成功！', '1554732985', '0', '/YZNCMS/public/index.php/member/setting/setting/menuid/94.html');
INSERT INTO `yzn_adminlog` VALUES ('58', '0', '1', '提示语:用户名长度不符合要求 3,20', '1554734382', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('59', '0', '1', '提示语:密码不能为空', '1554734388', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('60', '0', '1', '提示语:密码和确认字段不一致', '1554734395', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('61', '0', '1', '提示语:邮箱不能为空', '1554734402', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('62', '0', '1', '提示语:会员组不能为空', '1554734413', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('63', '0', '1', '提示语:添加会员失败！', '1554734419', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('64', '0', '1', '提示语:用户名已存在', '1554734470', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('65', '1', '1', '提示语:添加会员成功！', '1554734613', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('66', '1', '1', '提示语:修改成功！', '1554734939', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('67', '1', '1', '提示语:修改成功！', '1554734992', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('68', '1', '1', '提示语:操作成功！', '1554735278', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('69', '1', '1', '提示语:操作成功！', '1554735280', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('70', '1', '1', '提示语:操作成功！', '1554735577', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('71', '1', '1', '提示语:操作成功！', '1554735583', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('72', '1', '1', '提示语:操作成功！', '1554735590', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('73', '1', '1', '提示语:操作成功！', '1554735591', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('74', '1', '1', '提示语:操作成功！', '1554735591', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('75', '1', '1', '提示语:操作成功！', '1554735596', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('76', '1', '1', '提示语:操作成功！', '1554735597', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('77', '1', '1', '提示语:操作成功！', '1554735597', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('78', '1', '1', '提示语:操作成功！', '1554735636', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('79', '1', '1', '提示语:操作成功！', '1554735637', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('80', '1', '1', '提示语:操作成功！', '1554735729', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('81', '1', '1', '提示语:操作成功！', '1554736277', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('82', '1', '1', '提示语:操作成功！', '1554736325', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('83', '1', '1', '提示语:操作成功！', '1554736333', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('84', '1', '1', '提示语:操作成功！', '1554736571', '0', '/YZNCMS/public/index.php/member/member/setverifystate.html');
INSERT INTO `yzn_adminlog` VALUES ('85', '1', '1', '提示语:操作成功！', '1554736591', '0', '/YZNCMS/public/index.php/member/member/setverifystate.html');
INSERT INTO `yzn_adminlog` VALUES ('86', '1', '1', '提示语:操作成功！', '1554736593', '0', '/YZNCMS/public/index.php/member/member/setverifystate.html');
INSERT INTO `yzn_adminlog` VALUES ('87', '1', '1', '提示语:操作成功！', '1554736596', '0', '/YZNCMS/public/index.php/member/member/setverifystate.html');
INSERT INTO `yzn_adminlog` VALUES ('88', '1', '1', '提示语:操作成功！', '1554736602', '0', '/YZNCMS/public/index.php/member/member/setverifystate.html');
INSERT INTO `yzn_adminlog` VALUES ('89', '0', '1', '提示语:该页面不存在！', '1554736636', '0', '/YZNCMS/public/index.php/member/member/show.html?id=2');
INSERT INTO `yzn_adminlog` VALUES ('90', '1', '1', '提示语:操作成功！', '1554737138', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('91', '1', '1', '提示语:操作成功！', '1554737142', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('92', '1', '1', '提示语:操作成功！', '1554737144', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('93', '1', '1', '提示语:操作成功！', '1554737145', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('94', '0', '0', '提示语:请先登陆', '1554790398', '0', '/YZNCMS/public/index.php/admin/menu/index.html');
INSERT INTO `yzn_adminlog` VALUES ('95', '0', '0', '提示语:用户名或者密码错误，登陆失败！', '1554790428', '0', '/YZNCMS/public/index.php/admin/index/login.html');
INSERT INTO `yzn_adminlog` VALUES ('96', '1', '1', '提示语:恭喜您，登陆成功', '1554790450', '0', '/YZNCMS/public/index.php/admin/index/login.html');
INSERT INTO `yzn_adminlog` VALUES ('97', '1', '1', '提示语:操作成功！', '1554790476', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('98', '1', '1', '提示语:操作成功！', '1554790489', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('99', '1', '1', '提示语:操作成功！', '1554790490', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('100', '1', '1', '提示语:操作成功！', '1554790503', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('101', '1', '1', '提示语:操作成功！', '1554790508', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('102', '1', '1', '提示语:操作成功！', '1554790508', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('103', '0', '1', '提示语:该页面不存在！', '1554790531', '0', '/YZNCMS/public/index.php/addons/addons/addonadmin/menuid/35.html');
INSERT INTO `yzn_adminlog` VALUES ('104', '1', '1', '提示语:插件解压成功，可以进入插件管理进行安装！', '1554790560', '0', '/YZNCMS/public/index.php/addons/addons/local.html');
INSERT INTO `yzn_adminlog` VALUES ('105', '1', '1', '提示语:插件安装成功！清除浏览器缓存和框架缓存后生效！', '1554790573', '0', '/YZNCMS/public/index.php/addons/addons/install.html');
INSERT INTO `yzn_adminlog` VALUES ('106', '1', '1', '提示语:清理缓存', '1554790581', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1554790535664');
INSERT INTO `yzn_adminlog` VALUES ('107', '1', '1', '提示语:插件解压成功，可以进入插件管理进行安装！', '1554790618', '0', '/YZNCMS/public/index.php/addons/addons/local.html');
INSERT INTO `yzn_adminlog` VALUES ('108', '1', '1', '提示语:插件安装成功！清除浏览器缓存和框架缓存后生效！', '1554790634', '0', '/YZNCMS/public/index.php/addons/addons/install.html');
INSERT INTO `yzn_adminlog` VALUES ('109', '1', '1', '提示语:清理缓存', '1554790638', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1554790585449');
INSERT INTO `yzn_adminlog` VALUES ('110', '1', '1', '提示语:保存成功', '1554790660', '0', '/YZNCMS/public/index.php/addons/addons/saveconfig.html');
INSERT INTO `yzn_adminlog` VALUES ('111', '1', '1', '提示语:保存成功', '1554790803', '0', '/YZNCMS/public/index.php/addons/addons/saveconfig.html');
INSERT INTO `yzn_adminlog` VALUES ('112', '1', '1', '提示语:初始化成功！', '1554790828', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html');
INSERT INTO `yzn_adminlog` VALUES ('113', '1', '1', '提示语:备份完成！', '1554790828', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=0&start=0');
INSERT INTO `yzn_adminlog` VALUES ('114', '1', '1', '提示语:备份完成！', '1554790828', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=1&start=0');
INSERT INTO `yzn_adminlog` VALUES ('115', '1', '1', '提示语:备份完成！', '1554790829', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=2&start=0');
INSERT INTO `yzn_adminlog` VALUES ('116', '1', '1', '提示语:备份完成！', '1554790829', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=3&start=0');
INSERT INTO `yzn_adminlog` VALUES ('117', '1', '1', '提示语:备份完成！', '1554790829', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=4&start=0');
INSERT INTO `yzn_adminlog` VALUES ('118', '1', '1', '提示语:备份完成！', '1554790829', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=5&start=0');
INSERT INTO `yzn_adminlog` VALUES ('119', '1', '1', '提示语:备份完成！', '1554790830', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=6&start=0');
INSERT INTO `yzn_adminlog` VALUES ('120', '1', '1', '提示语:备份完成！', '1554790830', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=7&start=0');
INSERT INTO `yzn_adminlog` VALUES ('121', '1', '1', '提示语:备份完成！', '1554790830', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=8&start=0');
INSERT INTO `yzn_adminlog` VALUES ('122', '1', '1', '提示语:备份完成！', '1554790830', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=9&start=0');
INSERT INTO `yzn_adminlog` VALUES ('123', '1', '1', '提示语:备份完成！', '1554790831', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=10&start=0');
INSERT INTO `yzn_adminlog` VALUES ('124', '1', '1', '提示语:备份完成！', '1554790831', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=11&start=0');
INSERT INTO `yzn_adminlog` VALUES ('125', '1', '1', '提示语:备份完成！', '1554790831', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=12&start=0');
INSERT INTO `yzn_adminlog` VALUES ('126', '1', '1', '提示语:备份完成！', '1554790831', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=13&start=0');
INSERT INTO `yzn_adminlog` VALUES ('127', '1', '1', '提示语:备份完成！', '1554790832', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=14&start=0');
INSERT INTO `yzn_adminlog` VALUES ('128', '1', '1', '提示语:备份完成！', '1554790832', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=15&start=0');
INSERT INTO `yzn_adminlog` VALUES ('129', '1', '1', '提示语:备份完成！', '1554790832', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=16&start=0');
INSERT INTO `yzn_adminlog` VALUES ('130', '1', '1', '提示语:备份完成！', '1554790833', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=17&start=0');
INSERT INTO `yzn_adminlog` VALUES ('131', '1', '1', '提示语:备份完成！', '1554790833', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=18&start=0');
INSERT INTO `yzn_adminlog` VALUES ('132', '1', '1', '提示语:备份完成！', '1554790833', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=19&start=0');
INSERT INTO `yzn_adminlog` VALUES ('133', '1', '1', '提示语:备份完成！', '1554790833', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=20&start=0');
INSERT INTO `yzn_adminlog` VALUES ('134', '1', '1', '提示语:备份完成！', '1554790834', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=21&start=0');
INSERT INTO `yzn_adminlog` VALUES ('135', '1', '1', '提示语:备份完成！', '1554790834', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=22&start=0');
INSERT INTO `yzn_adminlog` VALUES ('136', '1', '1', '提示语:备份完成！', '1554790834', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=23&start=0');
INSERT INTO `yzn_adminlog` VALUES ('137', '1', '1', '提示语:备份完成！', '1554790834', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=24&start=0');
INSERT INTO `yzn_adminlog` VALUES ('138', '1', '1', '提示语:备份完成！', '1554790835', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=25&start=0');
INSERT INTO `yzn_adminlog` VALUES ('139', '1', '1', '提示语:备份完成！', '1554790835', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=26&start=0');
INSERT INTO `yzn_adminlog` VALUES ('140', '1', '1', '提示语:备份完成！', '1554790835', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=27&start=0');
INSERT INTO `yzn_adminlog` VALUES ('141', '1', '1', '提示语:备份完成！', '1554790835', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=28&start=0');
INSERT INTO `yzn_adminlog` VALUES ('142', '1', '1', '提示语:备份完成！', '1554790836', '0', '/YZNCMS/public/index.php/addons/database/export/isadmin/1.html?id=29&start=0');
INSERT INTO `yzn_adminlog` VALUES ('143', '1', '1', '提示语:模块解压成功，可以进入模块管理进行安装！', '1554790907', '0', '/YZNCMS/public/index.php/admin/module/local.html');
INSERT INTO `yzn_adminlog` VALUES ('144', '1', '1', '提示语:模块安装成功！一键清理缓存后生效！', '1554790931', '0', '/YZNCMS/public/index.php/admin/module/install.html');
INSERT INTO `yzn_adminlog` VALUES ('145', '1', '1', '提示语:清理缓存', '1554790943', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1554790643263');
INSERT INTO `yzn_adminlog` VALUES ('146', '1', '1', '提示语:模块解压成功，可以进入模块管理进行安装！', '1554790970', '0', '/YZNCMS/public/index.php/admin/module/local.html');
INSERT INTO `yzn_adminlog` VALUES ('147', '1', '1', '提示语:模块安装成功！一键清理缓存后生效！', '1554790992', '0', '/YZNCMS/public/index.php/admin/module/install.html');
INSERT INTO `yzn_adminlog` VALUES ('148', '1', '1', '提示语:清理缓存', '1554790997', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1554790947280');
INSERT INTO `yzn_adminlog` VALUES ('149', '1', '1', '提示语:sitemap.xml文件已生成到网站根目录', '1554791021', '0', '/YZNCMS/public/index.php/sitemap/index/index/menuid/117.html');
INSERT INTO `yzn_adminlog` VALUES ('150', '1', '1', '提示语:删除菜单成功！', '1554791256', '0', '/YZNCMS/public/index.php/admin/menu/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('151', '1', '1', '提示语:删除菜单成功！', '1554791266', '0', '/YZNCMS/public/index.php/admin/menu/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('152', '1', '1', '提示语:删除菜单成功！', '1554791275', '0', '/YZNCMS/public/index.php/admin/menu/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('153', '1', '1', '提示语:操作成功！', '1554791289', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('154', '1', '1', '提示语:操作成功！', '1554791290', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('155', '1', '1', '提示语:操作成功！', '1554791291', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('156', '1', '1', '提示语:操作成功！', '1554791292', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('157', '1', '1', '提示语:操作成功！', '1554791292', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('158', '1', '1', '提示语:添加成功！', '1554791551', '0', '/YZNCMS/public/index.php/links/links/add.html');
INSERT INTO `yzn_adminlog` VALUES ('159', '1', '1', '提示语:操作成功！', '1554791557', '0', '/YZNCMS/public/index.php/links/links/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('160', '1', '1', '提示语:操作成功！', '1554791558', '0', '/YZNCMS/public/index.php/links/links/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('161', '1', '1', '提示语:更新成功！', '1554791594', '0', '/YZNCMS/public/index.php/links/links/termsedit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('162', '1', '1', '提示语:删除菜单成功！', '1554791755', '0', '/YZNCMS/public/index.php/admin/menu/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('163', '1', '1', '提示语:删除菜单成功！', '1554791764', '0', '/YZNCMS/public/index.php/admin/menu/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('164', '1', '1', '提示语:操作成功！', '1554791775', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('165', '1', '1', '提示语:操作成功！', '1554791776', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('166', '1', '1', '提示语:删除菜单成功！', '1554792323', '0', '/YZNCMS/public/index.php/admin/menu/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('167', '1', '1', '提示语:添加成功！', '1554792535', '0', '/YZNCMS/public/index.php/admin/menu/add.html');
INSERT INTO `yzn_adminlog` VALUES ('168', '1', '1', '提示语:操作成功！', '1554792587', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('169', '1', '1', '提示语:操作成功！', '1554792588', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('170', '1', '1', '提示语:添加会员组成功！', '1554795625', '0', '/YZNCMS/public/index.php/member/group/add.html');
INSERT INTO `yzn_adminlog` VALUES ('171', '0', '1', '提示语:请指定需要删除的会员组！', '1554795674', '0', '/YZNCMS/public/index.php/member/group/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('172', '1', '1', '提示语:编辑会员组成功！', '1554795887', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=9');
INSERT INTO `yzn_adminlog` VALUES ('173', '1', '1', '提示语:会员组删除成功！', '1554796004', '0', '/YZNCMS/public/index.php/member/group/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('174', '0', '1', '提示语:该会员组为系统组，不能删除！', '1554796011', '0', '/YZNCMS/public/index.php/member/group/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('175', '0', '1', '提示语:该会员组为系统组，不能删除！', '1554796022', '0', '/YZNCMS/public/index.php/member/group/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('176', '1', '1', '提示语:添加会员组成功！', '1554796028', '0', '/YZNCMS/public/index.php/member/group/add.html');
INSERT INTO `yzn_adminlog` VALUES ('177', '1', '1', '提示语:会员组删除成功！', '1554796041', '0', '/YZNCMS/public/index.php/member/group/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('178', '0', '0', '提示语:请先登陆', '1554811569', '0', '/YZNCMS/public/index.php/admin/menu/index.html');
INSERT INTO `yzn_adminlog` VALUES ('179', '1', '1', '提示语:恭喜您，登陆成功', '1554811581', '0', '/YZNCMS/public/index.php/admin/index/login.html');
INSERT INTO `yzn_adminlog` VALUES ('180', '0', '1', '提示语:会员组已存在', '1554811605', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('181', '0', '1', '提示语:会员组已存在', '1554811618', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('182', '0', '1', '提示语:会员组已存在', '1554811861', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('183', '0', '1', '提示语:会员组不能为空', '1554811875', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('184', '1', '1', '提示语:编辑会员组成功！', '1554811985', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('185', '1', '1', '提示语:添加会员组成功！', '1554811997', '0', '/YZNCMS/public/index.php/member/group/add.html');
INSERT INTO `yzn_adminlog` VALUES ('186', '0', '1', '提示语:会员组已存在', '1554812006', '0', '/YZNCMS/public/index.php/member/group/add.html');
INSERT INTO `yzn_adminlog` VALUES ('187', '1', '1', '提示语:添加会员组成功！', '1554812009', '0', '/YZNCMS/public/index.php/member/group/add.html');
INSERT INTO `yzn_adminlog` VALUES ('188', '1', '1', '提示语:会员组删除成功！', '1554812113', '0', '/YZNCMS/public/index.php/member/group/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('189', '1', '1', '提示语:会员组删除成功！', '1554812118', '0', '/YZNCMS/public/index.php/member/group/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('190', '1', '1', '提示语:编辑成功！', '1554812180', '0', '/YZNCMS/public/index.php/admin/menu/edit.html');
INSERT INTO `yzn_adminlog` VALUES ('191', '1', '1', '提示语:操作成功！', '1554812247', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('192', '0', '1', '提示语:密码不能为空', '1554812393', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('193', '0', '1', '提示语:密码不能为空', '1554812674', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('194', '0', '1', '提示语:密码不能为空', '1554812706', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('195', '0', '1', '提示语:密码不能为空', '1554812716', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('196', '0', '1', '提示语:密码不能为空', '1554812792', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('197', '1', '1', '提示语:修改成功！', '1554812832', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=1');
INSERT INTO `yzn_adminlog` VALUES ('198', '1', '1', '提示语:修改成功！', '1554812850', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=2');
INSERT INTO `yzn_adminlog` VALUES ('199', '0', '1', '提示语:昵称只能是字母、数字和下划线_及破折号-', '1554812875', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('200', '0', '1', '提示语:昵称只能是字母、数字和下划线_及破折号-', '1554812882', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('201', '0', '1', '提示语:昵称只能是字母、数字和下划线_及破折号-', '1554812906', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('202', '0', '1', '提示语:昵称长度不符合要求 3,20', '1554812964', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('203', '0', '1', '提示语:会员组已存在', '1554813543', '0', '/YZNCMS/public/index.php/member/group/add.html');
INSERT INTO `yzn_adminlog` VALUES ('204', '1', '1', '提示语:添加会员组成功！', '1554813546', '0', '/YZNCMS/public/index.php/member/group/add.html');
INSERT INTO `yzn_adminlog` VALUES ('205', '1', '1', '提示语:编辑会员组成功！', '1554813552', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('206', '1', '1', '提示语:编辑会员组成功！', '1554813558', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('207', '1', '1', '提示语:编辑会员组成功！', '1554813592', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('208', '0', '1', '提示语:会员组已存在', '1554813601', '0', '/YZNCMS/public/index.php/member/group/add.html');
INSERT INTO `yzn_adminlog` VALUES ('209', '1', '1', '提示语:编辑会员组成功！', '1554813810', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('210', '1', '1', '提示语:编辑会员组成功！', '1554813819', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('211', '1', '1', '提示语:编辑会员组成功！', '1554813887', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('212', '1', '1', '提示语:编辑会员组成功！', '1554813942', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('213', '1', '1', '提示语:编辑会员组成功！', '1554813963', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('214', '1', '1', '提示语:编辑会员组成功！', '1554814005', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('215', '0', '1', '提示语:会员组已存在', '1554814101', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('216', '0', '1', '提示语:会员组已存在', '1554814652', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('217', '1', '1', '提示语:编辑会员组成功！', '1554814654', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('218', '0', '1', '提示语:会员组已存在', '1554814663', '0', '/YZNCMS/public/index.php/member/group/add.html');
INSERT INTO `yzn_adminlog` VALUES ('219', '0', '1', '提示语:会员组已存在', '1554814681', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('220', '0', '1', '提示语:会员组已存在', '1554814701', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('221', '0', '1', '提示语:会员组已存在', '1554814714', '0', '/YZNCMS/public/index.php/member/group/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('222', '0', '1', '提示语:会员组已存在', '1554814752', '0', '/YZNCMS/public/index.php/member/group/add.html');
INSERT INTO `yzn_adminlog` VALUES ('223', '0', '1', '提示语:', '1554814824', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('224', '0', '1', '提示语:', '1554814826', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('225', '0', '1', '提示语:', '1554814849', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('226', '0', '1', '提示语:用户名已存在', '1554814908', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('227', '0', '1', '提示语:用户名已存在', '1554814930', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('228', '1', '1', '提示语:修改成功！', '1554814940', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('229', '1', '1', '提示语:修改成功！', '1554814954', '0', '/YZNCMS/public/index.php/member/member/edit.html?id=3');
INSERT INTO `yzn_adminlog` VALUES ('230', '0', '1', '提示语:用户名已存在', '1554814964', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('231', '0', '1', '提示语:用户名已存在', '1554814969', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('232', '1', '1', '提示语:操作成功！', '1554815090', '0', '/YZNCMS/public/index.php/cms/cms/add/catid/5.html');
INSERT INTO `yzn_adminlog` VALUES ('233', '0', '1', '提示语:用户名长度不符合要求 3,20', '1554815127', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('234', '0', '1', '提示语:邮箱不能为空', '1554815173', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('235', '0', '1', '提示语:会员组不能为空', '1554815185', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('236', '1', '1', '提示语:添加会员成功！', '1554815189', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('237', '1', '1', '提示语:添加会员成功！', '1554815216', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('238', '1', '1', '提示语:添加会员成功！', '1554815232', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('239', '1', '1', '提示语:添加会员成功！', '1554815249', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('240', '1', '1', '提示语:添加会员成功！', '1554815263', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('241', '0', '1', '提示语:密码和确认字段不一致', '1554815279', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('242', '1', '1', '提示语:添加会员成功！', '1554815284', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('243', '1', '1', '提示语:添加会员成功！', '1554815299', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('244', '1', '1', '提示语:添加会员成功！', '1554815314', '0', '/YZNCMS/public/index.php/member/member/add.html');
INSERT INTO `yzn_adminlog` VALUES ('245', '1', '1', '提示语:操作成功！', '1554815842', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('246', '1', '1', '提示语:操作成功！', '1554815843', '0', '/YZNCMS/public/index.php/member/member/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('247', '1', '1', '提示语:操作成功!', '1554816344', '0', '/YZNCMS/public/index.php/admin/auth_manager/writegroup.html');
INSERT INTO `yzn_adminlog` VALUES ('248', '1', '1', '提示语:修改成功！', '1554817225', '0', '/YZNCMS/public/index.php/cms/tags/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('249', '1', '1', '提示语:修改成功！', '1554817244', '0', '/YZNCMS/public/index.php/cms/tags/edit.html?id=13');
INSERT INTO `yzn_adminlog` VALUES ('250', '0', '1', '提示语:栏目标题不得为空', '1554817324', '0', '/YZNCMS/public/index.php/cms/category/add.html');
INSERT INTO `yzn_adminlog` VALUES ('251', '1', '1', '提示语:修改成功！', '1554817420', '0', '/YZNCMS/public/index.php/cms/category/edit.html');
INSERT INTO `yzn_adminlog` VALUES ('252', '1', '1', '提示语:修改成功！', '1554818190', '0', '/YZNCMS/public/index.php/cms/category/edit.html');
INSERT INTO `yzn_adminlog` VALUES ('253', '1', '1', '提示语:操作成功！', '1554818629', '0', '/YZNCMS/public/index.php/cms/cms/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('254', '1', '1', '提示语:操作成功！', '1554818674', '0', '/YZNCMS/public/index.php/cms/cms/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('255', '1', '1', '提示语:操作成功！', '1554818675', '0', '/YZNCMS/public/index.php/cms/cms/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('256', '1', '1', '提示语:操作成功！', '1554818676', '0', '/YZNCMS/public/index.php/cms/cms/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('257', '1', '1', '提示语:操作成功！', '1554818677', '0', '/YZNCMS/public/index.php/cms/cms/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('258', '1', '1', '提示语:操作成功！', '1554818677', '0', '/YZNCMS/public/index.php/cms/cms/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('259', '1', '1', '提示语:操作成功！', '1554818701', '0', '/YZNCMS/public/index.php/cms/cms/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('260', '1', '1', '提示语:添加模型成功！', '1554818857', '0', '/YZNCMS/public/index.php/cms/models/add.html');
INSERT INTO `yzn_adminlog` VALUES ('261', '0', '1', '提示语:字段名称只能为字母和数字，并且仅能字母开头', '1554818905', '0', '/YZNCMS/public/index.php/cms/field/add.html');
INSERT INTO `yzn_adminlog` VALUES ('262', '0', '1', '提示语:字段名称只能为字母和数字，并且仅能字母开头', '1554818923', '0', '/YZNCMS/public/index.php/cms/field/add.html');
INSERT INTO `yzn_adminlog` VALUES ('263', '0', '1', '提示语:参数错误！', '1554819032', '0', '/YZNCMS/public/index.php/cms/field/index/modelid/6.html');
INSERT INTO `yzn_adminlog` VALUES ('264', '0', '1', '提示语:字段名称只能为字母和数字，并且仅能字母开头', '1554819108', '0', '/YZNCMS/public/index.php/cms/field/add.html');
INSERT INTO `yzn_adminlog` VALUES ('265', '0', '1', '提示语:字段名称只能为字母和数字，并且仅能字母开头', '1554819138', '0', '/YZNCMS/public/index.php/cms/field/add.html');
INSERT INTO `yzn_adminlog` VALUES ('266', '0', '1', '提示语:参数错误！', '1554819156', '0', '/YZNCMS/public/index.php/cms/field/index.html');
INSERT INTO `yzn_adminlog` VALUES ('267', '1', '1', '提示语:新增成功', '1554819436', '0', '/YZNCMS/public/index.php/cms/field/add.html');
INSERT INTO `yzn_adminlog` VALUES ('268', '1', '1', '提示语:新增成功', '1554819541', '0', '/YZNCMS/public/index.php/cms/field/add.html');
INSERT INTO `yzn_adminlog` VALUES ('269', '1', '1', '提示语:更新成功！', '1554819558', '0', '/YZNCMS/public/index.php/cms/field/edit.html');
INSERT INTO `yzn_adminlog` VALUES ('270', '0', '1', '提示语:参数错误！', '1554819560', '0', '/YZNCMS/public/index.php/cms/field/index.html');
INSERT INTO `yzn_adminlog` VALUES ('271', '1', '1', '提示语:新增成功', '1554819595', '0', '/YZNCMS/public/index.php/cms/field/add.html');
INSERT INTO `yzn_adminlog` VALUES ('272', '1', '1', '提示语:新增成功', '1554819628', '0', '/YZNCMS/public/index.php/cms/field/add.html');
INSERT INTO `yzn_adminlog` VALUES ('273', '1', '1', '提示语:添加成功！', '1554819685', '0', '/YZNCMS/public/index.php/cms/category/add.html');
INSERT INTO `yzn_adminlog` VALUES ('274', '0', '1', '提示语:\'标题\'必须填写~', '1554819753', '0', '/YZNCMS/public/index.php/cms/cms/add/catid/20.html');
INSERT INTO `yzn_adminlog` VALUES ('275', '1', '1', '提示语:操作成功！', '1554819764', '0', '/YZNCMS/public/index.php/cms/cms/add/catid/20.html');
INSERT INTO `yzn_adminlog` VALUES ('276', '0', '0', '提示语:请先登陆', '1554946789', '0', '/YZNCMS/public/index.php/admin/menu/index.html');
INSERT INTO `yzn_adminlog` VALUES ('277', '1', '1', '提示语:恭喜您，登陆成功', '1554946800', '0', '/YZNCMS/public/index.php/admin/index/login.html');
INSERT INTO `yzn_adminlog` VALUES ('278', '0', '0', '提示语:请先登陆', '1554984198', '0', '/YZNCMS/public/index.php/admin/menu/index.html');
INSERT INTO `yzn_adminlog` VALUES ('279', '0', '0', '提示语:请先登陆', '1554984199', '0', '/YZNCMS/public/index.php/admin/menu/index.html');
INSERT INTO `yzn_adminlog` VALUES ('280', '1', '1', '提示语:恭喜您，登陆成功', '1554984210', '0', '/YZNCMS/public/index.php/admin/index/login.html');
INSERT INTO `yzn_adminlog` VALUES ('281', '1', '1', '提示语:操作成功！', '1554984287', '0', '/YZNCMS/public/index.php/admin/menu/setstate.html');
INSERT INTO `yzn_adminlog` VALUES ('282', '1', '1', '提示语:配置添加成功~', '1554984344', '0', '/YZNCMS/public/index.php/admin/config/add.html');
INSERT INTO `yzn_adminlog` VALUES ('283', '1', '1', '提示语:配置编辑成功~', '1554984357', '0', '/YZNCMS/public/index.php/admin/config/edit/id/1.html');
INSERT INTO `yzn_adminlog` VALUES ('284', '1', '1', '提示语:配置添加成功~', '1554984415', '0', '/YZNCMS/public/index.php/admin/config/add.html');
INSERT INTO `yzn_adminlog` VALUES ('285', '1', '1', '提示语:配置添加成功~', '1554984455', '0', '/YZNCMS/public/index.php/admin/config/add.html');
INSERT INTO `yzn_adminlog` VALUES ('286', '1', '1', '提示语:设置更新成功', '1554984510', '0', '/YZNCMS/public/index.php/admin/config/setting/group/system.html');
INSERT INTO `yzn_adminlog` VALUES ('287', '0', '1', '提示语:配置分组不能为空', '1554984518', '0', '/YZNCMS/public/index.php/admin/config/add.html');
INSERT INTO `yzn_adminlog` VALUES ('288', '0', '0', '提示语:请先登陆', '1555114074', '0', '/YZNCMS/public/index.php/admin/menu/index.html');
INSERT INTO `yzn_adminlog` VALUES ('289', '1', '1', '提示语:设置更新成功', '1555123783', '0', '/YZNCMS/public/index.php/admin/config/setting/group/base.html');
INSERT INTO `yzn_adminlog` VALUES ('290', '1', '0', '提示语:注销成功！', '1555124041', '0', '/YZNCMS/public/index.php/admin/index/logout.html');
INSERT INTO `yzn_adminlog` VALUES ('291', '1', '1', '提示语:恭喜您，登陆成功', '1555124081', '0', '/YZNCMS/public/index.php/admin/index/login.html');
INSERT INTO `yzn_adminlog` VALUES ('292', '1', '1', '提示语:密码修改成功', '1555124255', '0', '/YZNCMS/public/index.php/admin/index/updatepwd.html');
INSERT INTO `yzn_adminlog` VALUES ('293', '1', '0', '提示语:注销成功！', '1555124263', '0', '/YZNCMS/public/index.php/admin/index/logout.html');
INSERT INTO `yzn_adminlog` VALUES ('294', '1', '1', '提示语:恭喜您，登陆成功', '1555124272', '0', '/YZNCMS/public/index.php/admin/index/login.html');
INSERT INTO `yzn_adminlog` VALUES ('295', '1', '1', '提示语:设置更新成功', '1555124289', '0', '/YZNCMS/public/index.php/admin/config/setting/group/base.html');
INSERT INTO `yzn_adminlog` VALUES ('296', '1', '1', '提示语:清理缓存', '1555124968', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555124335799');
INSERT INTO `yzn_adminlog` VALUES ('297', '1', '1', '提示语:清理缓存', '1555125344', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555124335800');
INSERT INTO `yzn_adminlog` VALUES ('298', '1', '1', '提示语:修改成功！', '1555125437', '0', '/YZNCMS/public/index.php/cms/category/edit.html');
INSERT INTO `yzn_adminlog` VALUES ('299', '1', '1', '提示语:更新缓存成功！', '1555125463', '0', '/YZNCMS/public/index.php/cms/category/public_cache.html');
INSERT INTO `yzn_adminlog` VALUES ('300', '1', '1', '提示语:清理缓存', '1555125465', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555125428029');
INSERT INTO `yzn_adminlog` VALUES ('301', '1', '1', '提示语:清理缓存', '1555126071', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555126068951');
INSERT INTO `yzn_adminlog` VALUES ('302', '1', '1', '提示语:清理缓存', '1555126228', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555126141367');
INSERT INTO `yzn_adminlog` VALUES ('303', '1', '1', '提示语:清理缓存', '1555126416', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555126141368');
INSERT INTO `yzn_adminlog` VALUES ('304', '1', '1', '提示语:清理缓存', '1555126708', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555126678236');
INSERT INTO `yzn_adminlog` VALUES ('305', '1', '1', '提示语:设置更新成功', '1555126735', '0', '/YZNCMS/public/index.php/admin/config/setting/group/base.html');
INSERT INTO `yzn_adminlog` VALUES ('306', '1', '1', '提示语:清理缓存', '1555127259', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555126742220');
INSERT INTO `yzn_adminlog` VALUES ('307', '1', '1', '提示语:清理缓存', '1555127353', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555127262469');
INSERT INTO `yzn_adminlog` VALUES ('308', '1', '1', '提示语:清理缓存', '1555127440', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555127356137');
INSERT INTO `yzn_adminlog` VALUES ('309', '0', '0', '提示语:请先登陆', '1555807637', '0', '/YZNCMS/public/index.php/admin/menu/index.html');
INSERT INTO `yzn_adminlog` VALUES ('310', '1', '1', '提示语:恭喜您，登陆成功', '1555807644', '0', '/YZNCMS/public/index.php/admin/index/login.html');
INSERT INTO `yzn_adminlog` VALUES ('311', '1', '1', '提示语:清理缓存', '1555807670', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555807647126');
INSERT INTO `yzn_adminlog` VALUES ('312', '1', '1', '提示语:删除成功！', '1555807764', '0', '/YZNCMS/public/index.php/cms/cms/delete/catid/20.html');
INSERT INTO `yzn_adminlog` VALUES ('313', '1', '1', '提示语:栏目删除成功！', '1555807774', '0', '/YZNCMS/public/index.php/cms/category/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('314', '1', '1', '提示语:更新缓存成功！', '1555807776', '0', '/YZNCMS/public/index.php/cms/category/public_cache.html');
INSERT INTO `yzn_adminlog` VALUES ('315', '1', '1', '提示语:删除成功！', '1555807787', '0', '/YZNCMS/public/index.php/cms/models/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('316', '1', '1', '提示语:会员组删除成功！', '1555807819', '0', '/YZNCMS/public/index.php/member/group/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('317', '1', '1', '提示语:删除成功！', '1555807873', '0', '/YZNCMS/public/index.php/cms/models/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('318', '0', '1', '提示语:栏目含有信息，无法删除！', '1555807908', '0', '/YZNCMS/public/index.php/cms/category/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('319', '1', '1', '提示语:删除成功！', '1555807913', '0', '/YZNCMS/public/index.php/cms/cms/delete/catid/4.html');
INSERT INTO `yzn_adminlog` VALUES ('320', '1', '1', '提示语:栏目删除成功！', '1555807920', '0', '/YZNCMS/public/index.php/cms/category/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('321', '1', '1', '提示语:更新缓存成功！', '1555807923', '0', '/YZNCMS/public/index.php/cms/category/public_cache.html');
INSERT INTO `yzn_adminlog` VALUES ('322', '1', '1', '提示语:删除成功！', '1555807939', '0', '/YZNCMS/public/index.php/cms/models/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('323', '1', '1', '提示语:删除成功！', '1555809639', '0', '/YZNCMS/public/index.php/cms/cms/delete/catid/10.html');
INSERT INTO `yzn_adminlog` VALUES ('324', '1', '1', '提示语:删除成功！', '1555809642', '0', '/YZNCMS/public/index.php/cms/cms/delete/catid/10.html');
INSERT INTO `yzn_adminlog` VALUES ('325', '1', '1', '提示语:操作成功！', '1555809652', '0', '/YZNCMS/public/index.php/cms/cms/add/catid/10.html');
INSERT INTO `yzn_adminlog` VALUES ('326', '1', '1', '提示语:操作成功！', '1555809657', '0', '/YZNCMS/public/index.php/cms/cms/add/catid/10.html');
INSERT INTO `yzn_adminlog` VALUES ('327', '1', '1', '提示语:删除成功！', '1555809667', '0', '/YZNCMS/public/index.php/cms/cms/delete/catid/10.html');
INSERT INTO `yzn_adminlog` VALUES ('328', '1', '1', '提示语:删除成功！', '1555809671', '0', '/YZNCMS/public/index.php/cms/cms/delete/catid/10.html');
INSERT INTO `yzn_adminlog` VALUES ('329', '1', '1', '提示语:栏目删除成功！', '1555809676', '0', '/YZNCMS/public/index.php/cms/category/delete.html');
INSERT INTO `yzn_adminlog` VALUES ('330', '1', '1', '提示语:更新缓存成功！', '1555809678', '0', '/YZNCMS/public/index.php/cms/category/public_cache.html');
INSERT INTO `yzn_adminlog` VALUES ('331', '1', '1', '提示语:清理缓存', '1555809694', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555807753570');
INSERT INTO `yzn_adminlog` VALUES ('332', '1', '1', '提示语:清理缓存', '1555811740', '0', '/YZNCMS/public/index.php/admin/index/cache.html?type=all&_=1555807753571');

-- ----------------------------
-- Table structure for yzn_article
-- ----------------------------
DROP TABLE IF EXISTS `yzn_article`;
CREATE TABLE `yzn_article` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `flag` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '属性',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'SEO关键词',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Tags标签',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `hits` mediumint(8) unsigned DEFAULT '0' COMMENT '点击量',
  `inputtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章模型模型表';

-- ----------------------------
-- Records of yzn_article
-- ----------------------------
INSERT INTO `yzn_article` VALUES ('1', '9', '让客户留住更长时间访问你的网站', '', '', '什么能让您的客户“一见钟情”？除了网站的界面，没有其他因素。网站的界面是非常重要的因素之一。因为这是客户访问网站时的第一印象。那时，您需要为客户提供一个吸引人且引人注目的界面。要做到这一点非常容易，你只需要有一个合理布局的界面，整洁不要分散读者的注意力。在与网站互动时，客户可以轻松搜索他们需要学习的信息。此外，您还可以使用一些额外的注释来使界面更加美观：首先，效果的最大效果用于避免分散用户的注意力。这些效果甚至会使网站更重，并且加载速度更慢。其次，您可以创建更多可用空间并消除不重要的信息，从而使关键消息更', '', '100', '0', '2', '1550188136', '1550476672', '0');
INSERT INTO `yzn_article` VALUES ('2', '9', '移动网站需要吸引哪些观众并将其转化为客户', '', '', '在移动设备上设计网站以吸引观众并使他们成为他们的客户并不容易。移动网站是否只有两个友好元素，下载速度是否足够快？使用移动设备访问网站的人是那些时间很少的人，所以他们总是希望事情快速而正确。', '', '100', '0', '9', '1550202861', '1550450153', '1');
INSERT INTO `yzn_article` VALUES ('3', '14', '空壳网站是什么？如何避免成为空壳网站？空壳网站怎么处理？', '', '', '一、备案数据，包括：主体信息、网站信息、接入信息。\r\n（1）主体信息是指，网站主办者（网站开办者）的注册信息。\r\n（2）网站信息是指，网站主办者开办的（一个或多个）网站的注册信息。\r\n（3）接入信息是指，网站主办者（每个）网站的数据存放的虚拟空间的接入信息。', '', '100', '0', '1', '1550448808', '1550476816', '1');
INSERT INTO `yzn_article` VALUES ('4', '14', '单位或网站涉及金融类关键词，办理网站备案注意事项', '', '', '1.根据《国务院办公厅关于印发互联网金融风险专项整治工作实施方案的通知（国办发〔2016〕21号）》要求，公司注册名称或经营范围中使用“交易所”、“交易中心”、“金融”、“资产管理”、“理财”、“基金”、“基金管理”、“投资管理（包括投资）”、“财富管理”、“股权投资基金”、“网贷”、“网络借贷”、“P2P”、“股权众筹”、“互联网保险”、“支付”、“信托”等字样的企业，在做网站备案业务办理时，需提供金融管理部门的专项审批文件。', '', '100', '0', '0', '1550449235', '1550449733', '1');

-- ----------------------------
-- Table structure for yzn_article_data
-- ----------------------------
DROP TABLE IF EXISTS `yzn_article_data`;
CREATE TABLE `yzn_article_data` (
  `did` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci COMMENT '内容',
  PRIMARY KEY (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章模型模型表';

-- ----------------------------
-- Records of yzn_article_data
-- ----------------------------
INSERT INTO `yzn_article_data` VALUES ('1', '&lt;p&gt;&lt;strong&gt;通过网站让客户“一见钟情”&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;什么能让您的客户“一见钟情”？除了网站的界面，没有其他因素。网站的界面是非常重要的因素之一。因为这是客户访问网站时的第一印象。那时，您需要为客户提供一个吸引人且引人注目的界面。要做到这一点非常容易，你只需要有一个合理布局的界面，整洁不要分散读者的注意力。在与网站互动时，客户可以轻松搜索他们需要学习的信息。此外，您还可以使用一些额外的注释来使界面更加美观：首先，效果的最大效果用于避免分散用户的注意力。这些效果甚至会使网站更重，并且加载速度更慢。其次，您可以创建更多可用空间并消除不重要的信息，从而使关键消息更容易，更快地到达客户。&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;内容不仅要有回报，还应该精美呈现&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;对客户有用的内容是让客户保持更长时间的首要因素之一。但是，不仅昂贵的信息足够，内容的呈现和格式是您的网站有更长的时间留在客户的技巧。您可以设计一个白色背景的网站，以便所有信息变得更加突出。绝对不要使用色彩鲜艳的花朵和图案的深色背景，因为它可能使读者难以获取信息。此外，字体用法和段落间距同样重要。选择的字体不应该太挑剔，时尚，但应该是简单，易于看到的字体和显示专业性。附加，线条之间应该是合理的距离，内容布局的段落更加开放。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;优化网站以与所有设备兼容&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;通常情况下，企业只能优化显示在计算机或笔记本电脑上，但往往会忽略各种其他重要设备，如智能手机或平板电脑等。但是，用户数量的情况随着移动设备的访问越来越多，新网站可确保与设备（包括移动设备）的兼容性。&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;适当地浏览网站中的信息&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;如果您通过主页给客户留下了深刻印象，客户一直渴望了解您的业务。为了使此过程更好地运行，您需要确保子页面的所有链接与前面提到的链接标题的内容一致。\r\n您还可以为关键位置的内容创建重音，以提高点击率。而且您也不要忘记确保您没有基本错误，例如链接到损坏的页面，丢失图像甚至丢失链接。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;定期更新网站内容&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;内容不需要质量，但在网站上也需要有数量。这里的金额并不意味着猖獗的金额，而是每天都是偶数。如果客户返回您的网站但仍然是旧内容，则您可能会失去客户，因为客户不想返回网站更新旧内容。\r\n有了这些提示，您需要立即更新缺少的元素以完成网站并留住客户。做好这些事情后，您会很快注意到您网站的跳出率大&lt;/p&gt;');
INSERT INTO `yzn_article_data` VALUES ('2', '&lt;p&gt;在移动设备上设计网站以吸引观众并使他们成为他们的客户并不容易。移动网站是否只有两个友好元素，下载速度是否足够快？&lt;br/&gt;&lt;/p&gt;&lt;p&gt;使用移动设备访问网站的人是那些时间很少的人，所以他们总是希望事情快速而正确。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;1：并非计算机上显示的所有内容都需要显示在移动设备上&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;很容易看出微小的移动屏幕不能像计算机那样宽，因此需要选择出现在移动屏幕上的网站内容。重要内容，您需要将它们推上去，以便它们可以显示在移动屏幕上&lt;/p&gt;&lt;p&gt;还需要选择移动屏幕上显示的网站内容&lt;br/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;2：网站下载速度&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;专业网站设计师应该始终关注的一件事是下载网站的速度。根据一项研究，谷歌正在研究，53％的用户将离开一个网站，如果下载需要超过3秒。提高网站的下载速度有时只是为了删除图像，减少图像的大小是网站可以更快下载。但是，有时原因比我们想象的更复杂，例如，原因来自网站代码，或者可能是因为您的网站开发的内容远远超过原始网站，而且当前主机不再响应了。&lt;/p&gt;&lt;p&gt;所以你需要找出你的网站下载速度慢的原因以及在哪里立即修复它。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;3：添加通话按钮&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;对于移动用户，尤其是移动用户访问网站，他们说话的时间非常重要。因此，在查看产品信息之后，他们会立即打电话询问产品。但你确定他们会耐心等待撤回并找到你的电话号码吗？绝对不是。现在，移动屏幕上始终可用的简单呼叫按钮是可以立即按下客户想要呼叫的最全面的解决方案。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;4：集成返回顶部按钮&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;对于网站，菜单始终是一个重要的导航栏，可帮助用户导航到网站内的子页面。对于某些网站，当用户向下滚动并阅读下面的内容时，此菜单栏将始终显示在屏幕上。但是，其他一些网站没有。因此，当用户在网站底部附近阅读时，想要查看菜单，他们必须进行大量冲浪，现在，返回顶部按钮将非常有效并让用户感到舒适。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;5：网站上的菜单&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;与网站显示在计算机上的不同，手机上显示的网站菜单将减少到一行。当您想要查看时，用户将单击以显示子菜单。菜单图标现在是3个图块，但不是每个人都知道图标是菜单，因此如果您想让它更容易理解，您可以立即编写菜单字母。&lt;/p&gt;');
INSERT INTO `yzn_article_data` VALUES ('3', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); &quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px; text-indent: 0em;&quot;&gt;一、备案数据，包括：主体信息、网站信息、接入信息。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;（1）主体信息是指，网站主办者（网站开办者）的注册信息。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90);&quot;&gt;&lt;span style=&quot;font-size: 14px; text-indent: 0em;&quot;&gt;&lt;span style=&quot;line-height: 22px;&quot;&gt;（2）&lt;/span&gt;网站信息是指，网站主办者开办的（一个或多个）网站的注册信息。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;line-height: 22px;&quot;&gt;（3）&lt;/span&gt;接入信息是指，网站主办者（每个）网站的数据存放的虚拟空间的接入信息。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;strong&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: medium;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 16px; font-family: 黑体, simhei;&quot;&gt;二、空壳类备案数据，包括:空壳主体和空壳网站。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;line-height: 22px;&quot;&gt;（1）&lt;/span&gt;空壳主体是指，在工业和信息化部备案系统中，网站主办者的历史备案信息只存在主体信息，没有网站信息和接入信息。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;line-height: 22px;&quot;&gt;（2）&lt;/span&gt;空壳网站是指，在工业和信息化部备案系统中，网站主办者的历史备案信息中含有主体信息和网站信息，但（一个或多个网站）没有接入信息（即网站有备案号，但由于网站实际使用空间IP地址变更，之前空间接入商已将网站的备案信息取消接入，同时网站主办者并没有在新的空间接入商办理备案信息转接入）。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 通俗来讲，空壳网站是指，用户域名绑定IP发生变更（主要是更换了不同空间接入商IP），但备案信息没有及时变更，因此就变成了空壳网站。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;strong&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: medium;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 16px; font-family: 黑体, simhei;&quot;&gt;三、&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: medium;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 16px; font-family: 黑体, simhei;&quot;&gt;空壳类备案数据处理方式。&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;line-height: 22px;&quot;&gt;（1）&lt;/span&gt;若网站主办者存在空壳主体信息，则唯一解决方式：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: medium;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size:&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 需网站主办者携带相关证件到网站实际的接入商重新办理备案。已被注销（收回）的备案号及备案信息无法恢复。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;font-size:&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;strong&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: medium;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 16px; font-family: 黑体, simhei;&quot;&gt;四、&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: medium;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 16px; font-family: 黑体, simhei;&quot;&gt;如何避免成为空壳类数据。&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;line-height: 22px;&quot;&gt;（1）&lt;/span&gt;不可随意变更域名绑定IP（若需变更请及时联系网站实际使用的空间接入商）；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: medium;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size:&quot;&gt;以此避免因未及时变更网站备案接入信息，而成为空壳类备案数据，从而被当地省通信管理局注销（收回）备案号。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;font-size:&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;strong&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: medium;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 16px; font-family: 黑体, simhei;&quot;&gt;五、&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: medium;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;line-height: 22px; text-indent: 24px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 16px; line-height: 22px;&quot;&gt;办理&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 16px; font-family: 黑体, simhei;&quot;&gt;网站备案真实性核验&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 16px; font-family: 黑体, simhei;&quot;&gt;，&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: medium;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;请网站负责人携带以下材料&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size: medium; margin: 0px; padding: 0px;&quot;&gt;：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;line-height: 22px;&quot;&gt;（1）&lt;/span&gt;本人身份证原件&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;line-height: 22px;&quot;&gt;（2）&lt;/span&gt;单位有效证件（含年检页）原件&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;line-height: 22px;&quot;&gt;（3）&lt;/span&gt;企业法人身份证原件&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 3px 5px; word-break: break-all; letter-spacing: 1px; text-indent: 0em; line-height: 22px; color: rgb(90, 90, 90); font-size: 13px; &quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;line-height: 22px;&quot;&gt;（4）&lt;/span&gt;单位公章&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
INSERT INTO `yzn_article_data` VALUES ('4', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;1.根据《国务院办公厅关于印发互联网金融风险专项整治工作实施方案的通知（国办发〔2016〕21号）》要求，公司注册名称或经营范围中使用“交易所”、“交易中心”、“金融”、“资产管理”、“理财”、“基金”、“基金管理”、“投资管理（包括投资）”、“财富管理”、“股权投资基金”、“网贷”、“网络借贷”、“P2P”、“股权众筹”、“互联网保险”、“支付”、“信托”等字样的企业，在做网站备案业务办理时，需提供金融管理部门的专项审批文件。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;2.无相关金融许可的不允许接入。若网站内容确实和金融活动无关的，需要用户更改公司注册名称或经营范围，否则不予备案。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 22px;&quot;&gt;3.对于上述存量网站，景安备案中心将会不定期进行核查，一旦发现违规从事金融活动，将直接予以注销备案号处置。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 22px;&quot;&gt;4.（仅供参考）涉及金融类业务&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-family: 微软雅黑, tahoma, 宋体; widows: 1; text-indent: 2em;&quot;&gt;相关许可证办理部门：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;text-indent: 32px;&quot;&gt;&amp;nbsp; ①&amp;nbsp;&lt;/span&gt;p2p网站需要金融办和银监会两家一起发的许可证；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;text-indent: 32px;&quot;&gt;&amp;nbsp; ②&amp;nbsp;&lt;/span&gt;股票、公募基金是证监会发的证；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;text-indent: 32px;&quot;&gt;&amp;nbsp; ③&amp;nbsp;&lt;/span&gt;私募基金是证券协会的备案（股权投资指的就是私募基金）；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;text-indent: 32px;&quot;&gt;&amp;nbsp; ④&amp;nbsp;&lt;/span&gt;小额贷款是银监会发证；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;text-indent: 32px;&quot;&gt;&amp;nbsp; ⑤&amp;nbsp;&lt;/span&gt;第三方支付是人民银行发证；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;text-indent: 32px;&quot;&gt;&amp;nbsp; ⑥&amp;nbsp;&lt;/span&gt;保险是保监会发证；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;text-indent: 32px;&quot;&gt;&amp;nbsp; ⑦&amp;nbsp;&lt;/span&gt;金融机构发证比如银行什么的都是银监会；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;text-indent: 32px;&quot;&gt;&amp;nbsp; ⑧&amp;nbsp;&lt;/span&gt;证券公司发证都是证监会；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; color: rgb(102, 102, 102); font-size: 14px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;&quot;&gt;&lt;span style=&quot;color: rgb(128, 128, 128); font-variant-east-asian: normal; line-height: 22px; widows: 1;&quot;&gt;&lt;span style=&quot;text-indent: 32px;&quot;&gt;&amp;nbsp; ⑨&amp;nbsp;&lt;/span&gt;信托公司是银监会；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');

-- ----------------------------
-- Table structure for yzn_attachment
-- ----------------------------
DROP TABLE IF EXISTS `yzn_attachment`;
CREATE TABLE `yzn_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` char(50) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` char(15) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(64) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorders` int(5) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of yzn_attachment
-- ----------------------------
INSERT INTO `yzn_attachment` VALUES ('1', '1', 'logo.png', 'links', 'images/20190409/7a1ccd14c93fa9a74e3532259b15b499.png', '', '', 'image/png', 'png', '4883', '90546a4d34494aaaa32733926d4c7a1c', '71b454e83893ee2ca290a8ec7a4661b8bdf0ce11', 'local', '1554791549', '1554791549', '100', '1');
INSERT INTO `yzn_attachment` VALUES ('2', '1', 'QQ浏览器截图20181128215118.png', 'cms', 'images/20190409/7a731c60bcea92edd755382563e0bff1.png', '', '', 'image/png', 'png', '117396', 'c2199c59e986a3bdb74e029f5355f77f', '7d91d8e8c052ee89b39dc162d75f564a2f8787a6', 'local', '1554819721', '1554819721', '100', '1');
INSERT INTO `yzn_attachment` VALUES ('3', '1', 'QQ截图20170627215103.png', 'cms', 'images/20190409/95110f740cca3b639ad427ef615f4643.png', '', '', 'image/png', 'png', '24278', '263e5afebdc7d998ef7186d8be4c063d', '6b1893b1e8179bf9158dc92c0cd6f1c4039f11b2', 'local', '1554819745', '1554819745', '100', '1');

-- ----------------------------
-- Table structure for yzn_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `yzn_auth_group`;
CREATE TABLE `yzn_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of yzn_auth_group
-- ----------------------------
INSERT INTO `yzn_auth_group` VALUES ('1', 'admin', '1', '超级管理员', '拥有所有权限', '1', '');
INSERT INTO `yzn_auth_group` VALUES ('2', 'admin', '1', '编辑', '编辑', '1', '');
INSERT INTO `yzn_auth_group` VALUES ('3', 'admin', '1', 'shanc', '', '1', '');

-- ----------------------------
-- Table structure for yzn_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `yzn_auth_rule`;
CREATE TABLE `yzn_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of yzn_auth_rule
-- ----------------------------
INSERT INTO `yzn_auth_rule` VALUES ('1', 'admin', '2', 'admin/index/index', '首页', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('2', 'admin', '2', 'admin/setting/index', '设置', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('3', 'admin', '1', 'admin/config/index1', '系统配置', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('4', 'admin', '1', 'admin/config/index', '配置管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('5', 'admin', '1', 'admin/adminlog/deletelog', '删除日志', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('6', 'admin', '1', 'admin/config/setting', '网站设置', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('7', 'admin', '1', 'admin/menu/index', '菜单管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('8', 'admin', '1', 'admin/manager/index1', '权限管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('9', 'admin', '1', 'admin/manager/index', '管理员管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('10', 'admin', '1', 'admin/authManager/index', '角色管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('11', 'admin', '1', 'admin/manager/add', '添加管理员', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('12', 'admin', '1', 'admin/manager/edit', '编辑管理员', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('13', 'admin', '1', 'admin/adminlog/index', '管理日志', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('14', 'admin', '1', 'admin/manager/del', '删除管理员', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('15', 'admin', '1', 'admin/authManager/createGroup', '添加角色', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('16', 'admin', '1', 'admin/menu/add', '新增菜单', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('17', 'admin', '1', 'admin/menu/edit', '编辑菜单', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('18', 'admin', '1', 'admin/menu/delete', '删除菜单', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('19', 'attachment', '1', 'attachment/attachments/upload', '附件上传', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('20', 'attachment', '1', 'attachment/attachments/delete', '附件删除', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('21', 'addons', '1', 'addons/addons/index2', '插件扩展', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('22', 'addons', '1', 'addons/addons/index', '插件管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('23', 'addons', '1', 'addons/addons/hooks', '行为管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('24', 'addons', '1', 'addons/addons/addonadmin', '插件后台列表', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('25', 'admin', '1', 'admin/cloud/index', '在线云平台', '-1', '');
INSERT INTO `yzn_auth_rule` VALUES ('26', 'admin', '1', 'admin/module/index2', '本地模块', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('27', 'admin', '1', 'admin/module/index', '模块后台列表', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('28', 'admin', '1', 'admin/moduleshop/index', '模块商店', '-1', '');
INSERT INTO `yzn_auth_rule` VALUES ('29', 'admin', '1', 'admin/addonshop/index', '插件商店', '-1', '');
INSERT INTO `yzn_auth_rule` VALUES ('30', 'admin', '1', 'admin/authManager/editGroup', '编辑角色', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('31', 'admin', '1', 'admin/authManager/deleteGroup', '删除角色', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('32', 'admin', '1', 'admin/authManager/access', '访问授权', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('33', 'admin', '1', 'admin/authManager/writeGroup', '角色授权', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('34', 'admin', '1', 'admin/module/install', '模块安装', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('35', 'admin', '1', 'admin/module/uninstall', '模块卸载', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('36', 'admin', '1', 'admin/module/local', '本地安装', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('37', 'admin', '2', 'admin/index/cache', '缓存更新', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('38', 'admin', '2', 'admin/main/index', '控制面板', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('39', 'attachment', '1', 'attachment/attachments/index', '附件管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('40', 'admin', '1', 'admin/config/add', '新增配置', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('41', 'admin', '1', 'admin/config/edit', '编辑配置', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('42', 'admin', '1', 'admin/config/del', '删除配置', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('43', 'admin', '2', 'admin/module/index1', '模块', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('44', 'addons', '2', 'addons/addons/index1', '扩展', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('45', 'cms', '1', 'cms/cms/index2', '内容管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('46', 'cms', '1', 'cms/cms/index', '管理内容', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('47', 'cms', '1', 'cms/cms/panl', '面板', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('48', 'cms', '1', 'cms/cms/public_categorys', '栏目列表', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('49', 'cms', '1', 'cms/cms/classlist', '信息列表', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('50', 'cms', '1', 'cms/cms/add', '添加', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('51', 'cms', '1', 'cms/cms/edit', '编辑', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('52', 'cms', '1', 'cms/cms/delete', '删除', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('53', 'cms', '1', 'cms/cms/listorder', '排序', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('54', 'cms', '1', 'cms/cms/setstate', '状态设置', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('55', 'cms', '1', 'cms/tags/index', '列表', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('56', 'cms', '1', 'cms/tags/add', '添加', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('57', 'cms', '1', 'cms/tags/edit', '编辑', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('58', 'cms', '1', 'cms/tags/delete', '删除', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('59', 'cms', '1', 'cms/category/index1', '相关设置', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('60', 'cms', '1', 'cms/setting/index', 'CMS配置', '-1', '');
INSERT INTO `yzn_auth_rule` VALUES ('61', 'cms', '1', 'cms/category/index', '栏目列表', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('62', 'cms', '1', 'cms/category/add', '添加栏目', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('63', 'cms', '1', 'cms/category/singlepage', '添加单页', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('64', 'cms', '1', 'cms/category/wadd', '添加外部链接', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('65', 'cms', '1', 'cms/category/edit', '编辑栏目', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('66', 'cms', '1', 'cms/category/delete', '删除栏目', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('67', 'cms', '1', 'cms/category/public_cache', '更新栏目', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('68', 'cms', '1', 'cms/category/listorder', '排序', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('69', 'cms', '1', 'cms/category/setstate', '状态设置', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('70', 'cms', '1', 'cms/models/index', '模型管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('71', 'cms', '1', 'cms/field/index', '字段管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('72', 'cms', '1', 'cms/field/add', '字段添加', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('73', 'cms', '1', 'cms/field/edit', '字段编辑', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('74', 'cms', '1', 'cms/field/delete', '字段删除', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('75', 'cms', '1', 'cms/field/listorder', '字段排序', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('76', 'cms', '1', 'cms/field/setstate', '字段状态', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('77', 'cms', '1', 'cms/field/setsearch', '字段搜索', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('78', 'cms', '1', 'cms/field/setvisible', '字段隐藏', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('79', 'cms', '1', 'cms/field/setrequire', '字段必须', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('80', 'cms', '1', 'cms/models/add', '添加模型', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('81', 'cms', '1', 'cms/models/edit', '修改模型', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('82', 'cms', '1', 'cms/models/delete', '删除模型', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('83', 'cms', '1', 'cms/models/setSub', '模型投稿', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('84', 'cms', '1', 'cms/models/setstate', '设置模型状态', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('85', 'member', '1', 'member/member/index', '会员管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('86', 'member', '1', 'member/setting/setting', '会员设置', '-1', '');
INSERT INTO `yzn_auth_rule` VALUES ('87', 'member', '1', 'member/member/manage', '会员管理', '-1', '');
INSERT INTO `yzn_auth_rule` VALUES ('88', 'member', '1', 'member/member/userverify', '审核会员', '-1', '');
INSERT INTO `yzn_auth_rule` VALUES ('89', 'member', '1', 'member/group/index1', '会员组', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('90', 'member', '1', 'member/group/index', '会员组管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('91', 'cms', '2', 'cms/cms/index1', '内容', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('92', 'member', '2', 'member/member/index1', '会员', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('93', 'addons', '1', 'addons/database/index', '数据库备份', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('94', 'addons', '1', 'addons/database/restore', '备份还原', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('95', 'addons', '1', 'addons/database/del', '删除备份', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('96', 'addons', '1', 'addons/database/repair', '修复表', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('97', 'addons', '1', 'addons/database/optimize', '优化表', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('98', 'addons', '1', 'addons/database/import', '还原表', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('99', 'addons', '1', 'addons/database/export', '备份数据库', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('100', 'addons', '1', 'addons/database/download', '备份数据库下载', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('101', 'links', '1', 'links/links/index', '友情链接', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('102', 'links', '1', 'links/links/add', '添加友情链接', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('103', 'links', '1', 'links/links/edit', '链接编辑', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('104', 'links', '1', 'links/links/delete', '链接删除', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('105', 'links', '1', 'links/links/setstate', '链接状态', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('106', 'links', '1', 'links/links/listorder', '链接排序', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('107', 'links', '1', 'links/links/terms', '分类管理', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('108', 'links', '1', 'links/links/addTerms', '分类新增', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('109', 'links', '1', 'links/links/termsedit', '分类修改', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('110', 'links', '1', 'links/links/termsdelete', '分类删除', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('111', 'member', '1', 'member/member/setstate', '状态设置', '1', '');
INSERT INTO `yzn_auth_rule` VALUES ('112', 'sitemap', '1', 'sitemap/index/index', 'SiteMap地图', '1', '');

-- ----------------------------
-- Table structure for yzn_cache
-- ----------------------------
DROP TABLE IF EXISTS `yzn_cache`;
CREATE TABLE `yzn_cache` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key` char(100) NOT NULL DEFAULT '' COMMENT '缓存KEY值',
  `name` char(100) NOT NULL DEFAULT '' COMMENT '名称',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '模块名称',
  `model` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `action` char(30) NOT NULL DEFAULT '' COMMENT '方法名',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统',
  PRIMARY KEY (`id`),
  KEY `ckey` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='缓存列队表';

-- ----------------------------
-- Records of yzn_cache
-- ----------------------------
INSERT INTO `yzn_cache` VALUES ('1', 'Config', '网站配置', 'admin', 'Config', 'config_cache', '1');
INSERT INTO `yzn_cache` VALUES ('2', 'Menu', '后台菜单', 'admin', 'Menu', 'menu_cache', '1');
INSERT INTO `yzn_cache` VALUES ('3', 'Module', '可用模块列表', 'admin', 'Module', 'module_cache', '1');
INSERT INTO `yzn_cache` VALUES ('4', 'Model', '模型列表', 'admin', 'Models', 'model_cache', '1');
INSERT INTO `yzn_cache` VALUES ('5', 'ModelField', '模型字段', 'admin', 'ModelField', 'model_field_cache', '1');
INSERT INTO `yzn_cache` VALUES ('6', 'Category', '栏目索引', 'cms', 'Category', 'category_cache', '0');
INSERT INTO `yzn_cache` VALUES ('7', 'Cms_Config', 'CMS配置', 'cms', 'Cms', 'cms_cache', '0');
INSERT INTO `yzn_cache` VALUES ('8', 'Member_Config', '会员配置', 'member', 'Member', 'member_cache', '0');
INSERT INTO `yzn_cache` VALUES ('9', 'Member_Group', '会员组', 'member', 'MemberGroup', 'membergroup_cache', '0');

-- ----------------------------
-- Table structure for yzn_category
-- ----------------------------
DROP TABLE IF EXISTS `yzn_category`;
CREATE TABLE `yzn_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `catname` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `catdir` varchar(30) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类别',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `arrparentid` varchar(200) NOT NULL DEFAULT '' COMMENT '所有父ID',
  `arrchildid` varchar(200) NOT NULL DEFAULT '' COMMENT '所有子栏目ID',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否存在子栏目，1存在',
  `image` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '栏目图片',
  `description` mediumtext NOT NULL COMMENT '栏目描述',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接地址',
  `setting` mediumtext NOT NULL COMMENT '相关配置信息',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of yzn_category
-- ----------------------------
INSERT INTO `yzn_category` VALUES ('2', '公司简介', 'Introduction', '1', '0', '1', '0,1', '2', '0', '0', '', '', 'a:7:{s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:13:\"category.html\";s:13:\"list_template\";s:9:\"list.html\";s:13:\"show_template\";s:9:\"show.html\";s:13:\"page_template\";s:9:\"page.html\";}', '1', '1');
INSERT INTO `yzn_category` VALUES ('3', '企业文化', 'culture', '1', '0', '1', '0,1', '3', '0', '0', '', '', 'a:7:{s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:13:\"category.html\";s:13:\"list_template\";s:9:\"list.html\";s:13:\"show_template\";s:9:\"show.html\";s:13:\"page_template\";s:9:\"page.html\";}', '2', '1');
INSERT INTO `yzn_category` VALUES ('5', '案例展示', 'case', '2', '3', '0', '0', '5', '0', '0', '', '', 'a:7:{s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:18:\"category_case.html\";s:13:\"list_template\";s:14:\"list_case.html\";s:13:\"show_template\";s:17:\"show_picture.html\";s:13:\"page_template\";s:9:\"page.html\";}', '2', '1');
INSERT INTO `yzn_category` VALUES ('6', '新闻中心', 'news', '2', '1', '0', '0', '6,9,14', '1', '0', '', '', 'a:7:{s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:13:\"category.html\";s:13:\"list_template\";s:9:\"list.html\";s:13:\"show_template\";s:9:\"show.html\";s:13:\"page_template\";s:9:\"page.html\";}', '3', '1');
INSERT INTO `yzn_category` VALUES ('8', '联系我们', 'contact', '3', '0', '0', '0', '8,18,19', '1', '0', '', 'index/index/lists?catid=18', 'a:7:{s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:13:\"category.html\";s:13:\"list_template\";s:9:\"list.html\";s:13:\"show_template\";s:9:\"show.html\";s:13:\"page_template\";s:9:\"page.html\";}', '4', '1');
INSERT INTO `yzn_category` VALUES ('9', '网络营销', 'marketing', '2', '1', '6', '0,6', '9', '0', '0', '', '', 'a:7:{s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:13:\"category.html\";s:13:\"list_template\";s:9:\"list.html\";s:13:\"show_template\";s:9:\"show.html\";s:13:\"page_template\";s:9:\"page.html\";}', '1', '1');
INSERT INTO `yzn_category` VALUES ('14', '备案知识', 'record', '2', '1', '6', '0,6', '14', '0', '0', '', '', 'a:7:{s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:13:\"category.html\";s:13:\"list_template\";s:9:\"list.html\";s:13:\"show_template\";s:9:\"show.html\";s:13:\"page_template\";s:9:\"page.html\";}', '3', '1');
INSERT INTO `yzn_category` VALUES ('1', '关于我们', 'about', '3', '0', '0', '0', '1,2,3', '1', '0', '11', 'index/index/lists?catid=2', 'N;', '1', '1');
INSERT INTO `yzn_category` VALUES ('18', '联系方式', 'fangshi', '1', '0', '8', '0,8', '18', '0', '0', '', '', 'a:7:{s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:13:\"category.html\";s:13:\"list_template\";s:9:\"list.html\";s:13:\"show_template\";s:9:\"show.html\";s:13:\"page_template\";s:9:\"page.html\";}', '100', '1');
INSERT INTO `yzn_category` VALUES ('19', '在线留言', 'guestbook', '2', '5', '8', '0,8', '19', '0', '0', '', '', 'a:7:{s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:13:\"category.html\";s:13:\"list_template\";s:19:\"list_guestbook.html\";s:13:\"show_template\";s:9:\"show.html\";s:13:\"page_template\";s:9:\"page.html\";}', '100', '1');

-- ----------------------------
-- Table structure for yzn_config
-- ----------------------------
DROP TABLE IF EXISTS `yzn_config`;
CREATE TABLE `yzn_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` varchar(32) NOT NULL DEFAULT '' COMMENT '配置分组',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `listorder` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='网站配置';

-- ----------------------------
-- Records of yzn_config
-- ----------------------------
INSERT INTO `yzn_config` VALUES ('1', 'web_site_icp', 'text', '备案信息', 'base', '', '', '1551244923', '1554984357', '1', '渝A000001', '99');
INSERT INTO `yzn_config` VALUES ('2', 'web_site_statistics', 'textarea', '站点代码', 'base', '', '', '1551244957', '1551244957', '1', '', '100');
INSERT INTO `yzn_config` VALUES ('3', 'config_group', 'array', '配置分组', 'system', '', '', '1494408414', '1494408414', '1', 'base:基础\r\nemail:邮箱\r\nsystem:系统\r\nupload:上传', '0');
INSERT INTO `yzn_config` VALUES ('4', 'theme', 'text', '主题风格', 'system', '', '', '1541752781', '1541756888', '1', 'default', '1');
INSERT INTO `yzn_config` VALUES ('5', 'upload_image_size', 'text', '图片上传大小限制', 'upload', '', '0为不限制大小，单位：kb', '1540457656', '1552436075', '1', '0', '2');
INSERT INTO `yzn_config` VALUES ('6', 'upload_image_ext', 'text', '允许上传的图片后缀', 'upload', '', '多个后缀用逗号隔开，不填写则不限制类型', '1540457657', '1552436074', '1', 'gif,jpg,jpeg,bmp,png', '1');
INSERT INTO `yzn_config` VALUES ('7', 'upload_file_size', 'text', '文件上传大小限制', 'upload', '', '0为不限制大小，单位：kb', '1540457658', '1552436078', '1', '0', '3');
INSERT INTO `yzn_config` VALUES ('8', 'upload_file_ext', 'text', '允许上传的文件后缀', 'upload', '', '多个后缀用逗号隔开，不填写则不限制类型', '1540457659', '1552436080', '1', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '4');
INSERT INTO `yzn_config` VALUES ('9', 'upload_driver', 'radio', '上传驱动', 'upload', 'local:本地', '图片或文件上传驱动', '1541752781', '1552436085', '1', 'local', '9');
INSERT INTO `yzn_config` VALUES ('10', 'upload_thumb_water', 'switch', '添加水印', 'upload', '', '', '1552435063', '1552436080', '1', '0', '5');
INSERT INTO `yzn_config` VALUES ('11', 'upload_thumb_water_pic', 'image', '水印图片', 'upload', '', '只有开启水印功能才生效', '1552435183', '1552436081', '1', '', '6');
INSERT INTO `yzn_config` VALUES ('12', 'upload_thumb_water_position', 'radio', '水印位置', 'upload', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '1552435257', '1552436082', '1', '9', '7');
INSERT INTO `yzn_config` VALUES ('13', 'upload_thumb_water_alpha', 'text', '水印透明度', 'upload', '', '请输入0~100之间的数字，数字越小，透明度越高', '1552435299', '1552436083', '1', '50', '8');
INSERT INTO `yzn_config` VALUES ('14', 'mail_type', 'radio', '邮件发送模式', 'email', '1:SMTP\r\n2:Mail', '', '1553652833', '1553652915', '1', '1', '1');
INSERT INTO `yzn_config` VALUES ('15', 'mail_smtp_host', 'text', '邮件服务器', 'email', '', '错误的配置发送邮件会导致服务器超时', '1553652889', '1553652917', '1', 'smtp.163.com', '2');
INSERT INTO `yzn_config` VALUES ('16', 'mail_smtp_port', 'text', '邮件发送端口', 'email', '', '不加密默认25,SSL默认465,TLS默认587', '1553653165', '1553653292', '1', '465', '3');
INSERT INTO `yzn_config` VALUES ('17', 'mail_auth', 'radio', '身份认证', 'email', '0:关闭\r\n1:开启', '', '1553658375', '1553658392', '1', '1', '4');
INSERT INTO `yzn_config` VALUES ('18', 'mail_smtp_user', 'text', '用户名', 'email', '', '', '1553653267', '1553658393', '1', '', '5');
INSERT INTO `yzn_config` VALUES ('19', 'mail_smtp_pass', 'text', '密码', 'email', '', '', '1553653344', '1553658394', '1', '', '6');
INSERT INTO `yzn_config` VALUES ('20', 'mail_verify_type', 'radio', '验证方式', 'email', '1:TLS\r\n2:SSL', '', '1553653426', '1553658395', '1', '2', '7');
INSERT INTO `yzn_config` VALUES ('21', 'mail_from', 'text', '发件人邮箱', 'email', '', '', '1553653500', '1553658397', '1', '', '8');
INSERT INTO `yzn_config` VALUES ('22', 'web_site_name', 'text', '站点名称', 'base', '', '', '1554984344', '1554984344', '1', 'ZLCMS管理系统', '1');
INSERT INTO `yzn_config` VALUES ('23', 'web_site_keyword', 'text', '站点关键词', 'base', '', '', '1554984415', '1554984415', '1', 'ZLCMS管理系统', '2');
INSERT INTO `yzn_config` VALUES ('24', 'web_site_description', 'textarea', '站点描述', 'base', '', '', '1554984455', '1554984455', '1', 'ZLCMS管理系统', '3');

-- ----------------------------
-- Table structure for yzn_field_type
-- ----------------------------
DROP TABLE IF EXISTS `yzn_field_type`;
CREATE TABLE `yzn_field_type` (
  `name` varchar(32) NOT NULL COMMENT '字段类型',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '中文类型名',
  `listorder` int(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `default_define` varchar(128) NOT NULL DEFAULT '' COMMENT '默认定义',
  `ifoption` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要设置选项',
  `ifstring` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否自由字符',
  `vrule` varchar(256) NOT NULL DEFAULT '' COMMENT '验证规则',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='字段类型表';

-- ----------------------------
-- Records of yzn_field_type
-- ----------------------------
INSERT INTO `yzn_field_type` VALUES ('text', '输入框', '1', 'varchar(255) NOT NULL DEFAULT \'\'', '0', '1', '');
INSERT INTO `yzn_field_type` VALUES ('checkbox', '复选框', '2', 'varchar(32) NOT NULL DEFAULT \'\'', '1', '0', '');
INSERT INTO `yzn_field_type` VALUES ('textarea', '多行文本', '3', 'varchar(255) NOT NULL DEFAULT \'\'', '0', '1', '');
INSERT INTO `yzn_field_type` VALUES ('radio', '单选按钮', '4', 'tinyint(2) UNSIGNED NOT NULL DEFAULT \'0\'', '1', '0', 'isChsAlphaNum');
INSERT INTO `yzn_field_type` VALUES ('switch', '开关', '5', 'tinyint(2) UNSIGNED NOT NULL DEFAULT \'0\'', '0', '0', 'isBool');
INSERT INTO `yzn_field_type` VALUES ('array', '数组', '6', 'varchar(512) NOT NULL DEFAULT \'\'', '0', '0', '');
INSERT INTO `yzn_field_type` VALUES ('select', '下拉框', '7', 'tinyint(2) UNSIGNED NOT NULL DEFAULT \'0\'', '1', '0', 'isChsAlphaNum');
INSERT INTO `yzn_field_type` VALUES ('image', '单张图', '8', 'int(5) UNSIGNED NOT NULL DEFAULT \'0\'', '0', '0', 'isNumber');
INSERT INTO `yzn_field_type` VALUES ('tags', '标签', '10', 'varchar(255) NOT NULL DEFAULT \'\'', '0', '1', '');
INSERT INTO `yzn_field_type` VALUES ('number', '数字', '11', 'int(10) UNSIGNED NOT NULL DEFAULT \'0\'', '0', '0', 'isNumber');
INSERT INTO `yzn_field_type` VALUES ('datetime', '日期和时间', '12', 'int(11) UNSIGNED NOT NULL DEFAULT \'0\'', '0', '0', '');
INSERT INTO `yzn_field_type` VALUES ('Ueditor', '百度编辑器', '13', 'text NOT NULL', '0', '1', '');
INSERT INTO `yzn_field_type` VALUES ('images', '多张图', '9', 'varchar(256) NOT NULL DEFAULT \'\'', '0', '0', '');
INSERT INTO `yzn_field_type` VALUES ('color', '颜色值', '17', 'varchar(7) NOT NULL DEFAULT \'\'', '0', '0', '');
INSERT INTO `yzn_field_type` VALUES ('files', '多文件', '15', 'varchar(255) NOT NULL DEFAULT \'\'', '0', '0', '');
INSERT INTO `yzn_field_type` VALUES ('summernote', '简洁编辑器', '14', 'text NOT NULL', '0', '1', '');
INSERT INTO `yzn_field_type` VALUES ('file', '单文件', '16', 'int(5) UNSIGNED NOT NULL DEFAULT \'0\'', '0', '0', 'isNumber');

-- ----------------------------
-- Table structure for yzn_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `yzn_guestbook`;
CREATE TABLE `yzn_guestbook` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '您的姓名',
  `flag` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '属性',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `hits` mediumint(8) unsigned DEFAULT '0' COMMENT '点击量',
  `inputtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '您的电话',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '您的邮箱',
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '您的意见或建议',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='留言本模型表';

-- ----------------------------
-- Records of yzn_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for yzn_hooks
-- ----------------------------
DROP TABLE IF EXISTS `yzn_hooks`;
CREATE TABLE `yzn_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='插件钩子';

-- ----------------------------
-- Records of yzn_hooks
-- ----------------------------
INSERT INTO `yzn_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '1509174020', '');
INSERT INTO `yzn_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '1509174020', 'returntop');

-- ----------------------------
-- Table structure for yzn_links
-- ----------------------------
DROP TABLE IF EXISTS `yzn_links`;
CREATE TABLE `yzn_links` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接id',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:文字链接,1:logo链接',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '链接名称',
  `image` mediumint(8) unsigned NOT NULL COMMENT '链接图片',
  `target` varchar(25) NOT NULL DEFAULT '' COMMENT '链接打开方式',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '链接描述',
  `inputtime` int(11) NOT NULL COMMENT '添加时间',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `termsid` smallint(4) NOT NULL COMMENT '分类id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未通过,1正常,2未审核',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of yzn_links
-- ----------------------------
INSERT INTO `yzn_links` VALUES ('1', '1', 'http://52changdu.com', '畅读小说', '1', '', '网站简介', '1554791551', '100', '1', '1');

-- ----------------------------
-- Table structure for yzn_member
-- ----------------------------
DROP TABLE IF EXISTS `yzn_member`;
CREATE TABLE `yzn_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` char(32) NOT NULL COMMENT '密码',
  `encrypt` varchar(6) DEFAULT NULL COMMENT '加密因子',
  `password_question` varchar(255) DEFAULT NULL COMMENT '密码问题',
  `password_answer` varchar(255) DEFAULT NULL COMMENT '密码答案',
  `birthday` varchar(255) DEFAULT NULL COMMENT '出生日期',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `major` varchar(255) DEFAULT NULL COMMENT '专业',
  `workplace` varchar(255) DEFAULT NULL COMMENT '工作单位',
  `post` varchar(255) DEFAULT NULL COMMENT '职务',
  `special_committee` varchar(255) DEFAULT NULL COMMENT '专委会',
  `point` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '钱金总额',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `email` char(32) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户组ID',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户模型ID',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `ischeck_email` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否验证过邮箱',
  `ischeck_mobile` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否验证过手机',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态  1正常 0禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of yzn_member
-- ----------------------------

-- ----------------------------
-- Table structure for yzn_member_group
-- ----------------------------
DROP TABLE IF EXISTS `yzn_member_group`;
CREATE TABLE `yzn_member_group` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员组id',
  `name` char(15) NOT NULL COMMENT '用户组名称',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是系统组',
  `starnum` tinyint(2) unsigned NOT NULL COMMENT '会员组星星数',
  `point` smallint(6) unsigned NOT NULL COMMENT '积分范围',
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '许允发短消息数量',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许访问',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发稿',
  `allowpostverify` tinyint(1) unsigned NOT NULL COMMENT '是否投稿不需审核',
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许搜索',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许自主升级',
  `allowsendmessage` tinyint(1) unsigned NOT NULL COMMENT '允许发送短消息',
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '每天允许发文章数',
  `allowattachment` tinyint(1) NOT NULL COMMENT '是否允许上传附件',
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '包年价格',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '包月价格',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '包天价格',
  `icon` char(30) NOT NULL COMMENT '用户组图标',
  `usernamecolor` char(7) NOT NULL COMMENT '用户名颜色',
  `description` char(100) NOT NULL COMMENT '描述',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='会员组';

-- ----------------------------
-- Records of yzn_member_group
-- ----------------------------
INSERT INTO `yzn_member_group` VALUES ('1', '禁止访问', '1', '0', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '0', '0', '0');
INSERT INTO `yzn_member_group` VALUES ('2', '新手上路', '1', '1', '50', '100', '1', '1', '0', '0', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '2', '0');
INSERT INTO `yzn_member_group` VALUES ('4', '中级会员', '1', '3', '150', '500', '1', '1', '0', '1', '1', '1', '0', '0', '500.00', '60.00', '1.00', '', '', '', '4', '0');
INSERT INTO `yzn_member_group` VALUES ('5', '高级会员', '1', '5', '300', '999', '1', '1', '0', '1', '1', '1', '0', '0', '360.00', '90.00', '5.00', '', '', '', '5', '0');
INSERT INTO `yzn_member_group` VALUES ('6', '注册会员', '1', '2', '100', '150', '0', '1', '0', '0', '1', '1', '0', '0', '300.00', '30.00', '1.00', '', '', '', '6', '0');
INSERT INTO `yzn_member_group` VALUES ('7', '邮件认证', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '7', '0');
INSERT INTO `yzn_member_group` VALUES ('8', '游客', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');

-- ----------------------------
-- Table structure for yzn_menu
-- ----------------------------
DROP TABLE IF EXISTS `yzn_menu`;
CREATE TABLE `yzn_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `app` char(20) NOT NULL DEFAULT '' COMMENT '应用标识',
  `controller` char(20) NOT NULL DEFAULT '' COMMENT '控制器标识',
  `action` char(20) NOT NULL DEFAULT '' COMMENT '方法标识',
  `parameter` char(255) NOT NULL DEFAULT '' COMMENT '附加参数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开发者可见',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `pid` (`parentid`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of yzn_menu
-- ----------------------------
INSERT INTO `yzn_menu` VALUES ('1', '首页', '', '0', 'admin', 'index', 'index', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('2', '控制面板', '', '0', 'admin', 'main', 'index', '', '0', '', '0', '1');
INSERT INTO `yzn_menu` VALUES ('3', '设置', 'icon-setup', '0', 'admin', 'setting', 'index', '', '1', '', '0', '100');
INSERT INTO `yzn_menu` VALUES ('4', '模块', 'icon-supply', '0', 'admin', 'module', 'index1', '', '1', '', '0', '9');
INSERT INTO `yzn_menu` VALUES ('5', '扩展', 'icon-tools', '0', 'addons', 'addons', 'index1', '', '1', '', '0', '10');
INSERT INTO `yzn_menu` VALUES ('10', '系统配置', 'icon-zidongxiufu', '3', 'admin', 'config', 'index1', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('11', '配置管理', 'icon-apartment', '10', 'admin', 'config', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('12', '删除日志', '', '20', 'admin', 'adminlog', 'deletelog', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('13', '网站设置', 'icon-setup', '10', 'admin', 'config', 'setting', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('14', '菜单管理', 'icon-other', '10', 'admin', 'menu', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('15', '权限管理', 'icon-guanliyuan', '3', 'admin', 'manager', 'index1', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('16', '管理员管理', 'icon-guanliyuan', '15', 'admin', 'manager', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('17', '角色管理', 'icon-group', '15', 'admin', 'authManager', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('18', '添加管理员', '', '16', 'admin', 'manager', 'add', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('19', '编辑管理员', '', '16', 'admin', 'manager', 'edit', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('20', '管理日志', 'icon-rizhi', '15', 'admin', 'adminlog', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('21', '删除管理员', '', '16', 'admin', 'manager', 'del', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('22', '添加角色', '', '17', 'admin', 'authManager', 'createGroup', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('23', '附件管理', 'icon-accessory', '10', 'attachment', 'attachments', 'index', '', '1', '', '0', '1');
INSERT INTO `yzn_menu` VALUES ('24', '新增配置', '', '11', 'admin', 'config', 'add', '', '1', '', '0', '1');
INSERT INTO `yzn_menu` VALUES ('25', '编辑配置', '', '11', 'admin', 'config', 'edit', '', '1', '', '0', '2');
INSERT INTO `yzn_menu` VALUES ('26', '删除配置', '', '11', 'admin', 'config', 'del', '', '1', '', '0', '3');
INSERT INTO `yzn_menu` VALUES ('27', '新增菜单', '', '14', 'admin', 'menu', 'add', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('28', '编辑菜单', '', '14', 'admin', 'menu', 'edit', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('29', '删除菜单', '', '14', 'admin', 'menu', 'delete', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('30', '附件上传', '', '23', 'attachment', 'attachments', 'upload', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('31', '附件删除', '', '23', 'attachment', 'attachments', 'delete', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('32', '插件扩展', 'icon-tools', '5', 'addons', 'addons', 'index2', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('33', '插件管理', 'icon-plugins-', '32', 'addons', 'addons', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('34', '行为管理', 'icon-hangweifenxi', '32', 'addons', 'addons', 'hooks', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('35', '插件后台列表', 'icon-liebiaosousuo', '5', 'addons', 'addons', 'addonadmin', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('37', '本地模块', 'icon-supply', '4', 'admin', 'module', 'index2', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('38', '模块管理', 'icon-mokuaishezhi', '37', 'admin', 'module', 'index', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('39', '模块后台列表', 'icon-liebiaosousuo', '4', 'admin', 'module', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('42', '编辑角色', '', '17', 'admin', 'authManager', 'editGroup', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('43', '删除角色', '', '17', 'admin', 'authManager', 'deleteGroup', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('44', '访问授权', '', '17', 'admin', 'authManager', 'access', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('45', '角色授权', '', '17', 'admin', 'authManager', 'writeGroup', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('46', '模块安装', '', '38', 'admin', 'module', 'install', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('47', '模块卸载', '', '38', 'admin', 'module', 'uninstall', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('48', '本地安装', '', '38', 'admin', 'module', 'local', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('49', '缓存更新', '', '0', 'admin', 'index', 'cache', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('50', '内容', 'icon-shiyongwendang', '0', 'cms', 'cms', 'index1', '', '1', '', '0', '3');
INSERT INTO `yzn_menu` VALUES ('51', '内容管理', 'icon-neirongguanli', '50', 'cms', 'cms', 'index2', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('52', '管理内容', 'icon-neirongguanli', '51', 'cms', 'cms', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('53', '面板', '', '52', 'cms', 'cms', 'panl', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('54', '栏目列表', '', '52', 'cms', 'cms', 'public_categorys', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('55', '信息列表', '', '52', 'cms', 'cms', 'classlist', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('56', '添加', '', '52', 'cms', 'cms', 'add', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('57', '编辑', '', '52', 'cms', 'cms', 'edit', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('58', '删除', '', '52', 'cms', 'cms', 'delete', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('59', '排序', '', '52', 'cms', 'cms', 'listorder', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('60', '状态设置', '', '52', 'cms', 'cms', 'setstate', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('61', 'Tags管理', 'icon-label', '51', 'cms', 'tags', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('62', '列表', '', '61', 'cms', 'tags', 'index', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('63', '添加', '', '61', 'cms', 'tags', 'add', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('64', '编辑', '', '61', 'cms', 'tags', 'edit', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('65', '删除', '', '61', 'cms', 'tags', 'delete', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('66', '相关设置', 'icon-zidongxiufu', '50', 'cms', 'category', 'index1', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('118', '状态设置', '', '93', 'member', 'member', 'setstate', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('68', '栏目列表', 'icon-other', '66', 'cms', 'category', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('69', '添加栏目', '', '68', 'cms', 'category', 'add', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('70', '添加单页', '', '68', 'cms', 'category', 'singlepage', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('71', '添加外部链接', '', '68', 'cms', 'category', 'wadd', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('72', '编辑栏目', '', '68', 'cms', 'category', 'edit', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('73', '删除栏目', '', '68', 'cms', 'category', 'delete', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('74', '更新栏目', '', '68', 'cms', 'category', 'public_cache', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('75', '排序', '', '68', 'cms', 'category', 'listorder', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('76', '状态设置', '', '68', 'cms', 'category', 'setstate', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('77', '模型管理', 'icon-apartment', '66', 'cms', 'models', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('78', '字段管理', '', '77', 'cms', 'field', 'index', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('79', '字段添加', '', '77', 'cms', 'field', 'add', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('80', '字段编辑', '', '77', 'cms', 'field', 'edit', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('81', '字段删除', '', '77', 'cms', 'field', 'delete', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('82', '字段排序', '', '77', 'cms', 'field', 'listorder', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('83', '字段状态', '', '77', 'cms', 'field', 'setstate', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('84', '字段搜索', '', '77', 'cms', 'field', 'setsearch', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('85', '字段隐藏', '', '77', 'cms', 'field', 'setvisible', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('86', '字段必须', '', '77', 'cms', 'field', 'setrequire', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('87', '添加模型', '', '77', 'cms', 'models', 'add', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('88', '修改模型', '', '77', 'cms', 'models', 'edit', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('89', '删除模型', '', '77', 'cms', 'models', 'delete', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('90', '模型投稿', '', '77', 'cms', 'models', 'setSub', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('91', '设置模型状态', '', '77', 'cms', 'models', 'setstate', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('92', '会员', 'icon-people', '0', 'member', 'member', 'index1', '', '1', '', '0', '4');
INSERT INTO `yzn_menu` VALUES ('93', '会员管理', 'icon-people', '92', 'member', 'member', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('95', '会员管理', 'icon-huiyuan', '93', 'member', 'member', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('97', '会员组', 'icon-huiyuan2', '92', 'member', 'group', 'index1', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('98', '会员组管理', 'icon-huiyuan2', '97', 'member', 'group', 'index', '', '1', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('99', '数据库备份', '', '35', 'addons', 'database', 'index', 'isadmin=1', '1', '数据库备份插件管理后台！', '0', '0');
INSERT INTO `yzn_menu` VALUES ('100', '备份还原', '', '35', 'addons', 'database', 'restore', 'isadmin=1', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('101', '删除备份', '', '35', 'addons', 'database', 'del', 'isadmin=1', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('102', '修复表', '', '35', 'addons', 'database', 'repair', 'isadmin=1', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('103', '优化表', '', '35', 'addons', 'database', 'optimize', 'isadmin=1', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('104', '还原表', '', '35', 'addons', 'database', 'import', 'isadmin=1', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('105', '备份数据库', '', '35', 'addons', 'database', 'export', 'isadmin=1', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('106', '备份数据库下载', '', '35', 'addons', 'database', 'download', 'isadmin=1', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('107', '友情链接', 'icon-lianjie', '39', 'links', 'links', 'index', '', '1', '友情链接！', '0', '0');
INSERT INTO `yzn_menu` VALUES ('108', '添加友情链接', '', '107', 'links', 'links', 'add', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('109', '链接编辑', '', '107', 'links', 'links', 'edit', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('110', '链接删除', '', '107', 'links', 'links', 'delete', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('111', '链接状态', '', '107', 'links', 'links', 'setstate', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('112', '链接排序', '', '107', 'links', 'links', 'listorder', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('113', '分类管理', '', '107', 'links', 'links', 'terms', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('114', '分类新增', '', '107', 'links', 'links', 'addTerms', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('115', '分类修改', '', '107', 'links', 'links', 'termsedit', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('116', '分类删除', '', '107', 'links', 'links', 'termsdelete', '', '0', '', '0', '0');
INSERT INTO `yzn_menu` VALUES ('117', 'SiteMap地图', 'icon-apartment', '39', 'sitemap', 'index', 'index', '', '1', '', '0', '3');

-- ----------------------------
-- Table structure for yzn_model
-- ----------------------------
DROP TABLE IF EXISTS `yzn_model`;
CREATE TABLE `yzn_model` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL DEFAULT '' COMMENT '所属模块',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `tablename` char(20) NOT NULL DEFAULT '' COMMENT '表名',
  `description` char(100) NOT NULL DEFAULT '' COMMENT '描述',
  `setting` text COMMENT '配置信息',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '模型类别：1-独立表，2-主附表',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorders` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用 1禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='模型列表';

-- ----------------------------
-- Records of yzn_model
-- ----------------------------
INSERT INTO `yzn_model` VALUES ('1', 'cms', '文章模型', 'article', '文章模型', 'a:1:{s:5:\"ifsub\";s:1:\"0\";}', '2', '1546574975', '1546574975', '0', '1');
INSERT INTO `yzn_model` VALUES ('3', 'cms', '产品模型', 'product', '产品模型', 'a:1:{s:5:\"ifsub\";s:1:\"0\";}', '2', '1549165800', '1549165800', '0', '1');
INSERT INTO `yzn_model` VALUES ('5', 'cms', '留言本', 'guestbook', '留言本', 'a:1:{s:5:\"ifsub\";s:1:\"1\";}', '1', '1550480944', '1550480944', '0', '1');

-- ----------------------------
-- Table structure for yzn_model_field
-- ----------------------------
DROP TABLE IF EXISTS `yzn_model_field`;
CREATE TABLE `yzn_model_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '别名',
  `remark` tinytext NOT NULL COMMENT '字段提示',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '字段类型',
  `setting` mediumtext,
  `ifsystem` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否主表字段 1 是',
  `ifeditable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以编辑',
  `iffixed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否固定不可修改',
  `ifrequire` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `ifsearch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '作为搜索条件',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 禁用 1启用',
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='模型字段列表';

-- ----------------------------
-- Records of yzn_model_field
-- ----------------------------
INSERT INTO `yzn_model_field` VALUES ('1', '1', 'id', '文档id', '', 'hidden', '', '1', '1', '1', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('2', '1', 'catid', '栏目id', '', 'hidden', '', '1', '1', '1', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('3', '1', 'title', '标题', '', 'text', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '1', '1', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('4', '1', 'flag', '属性', '', 'checkbox', 'a:3:{s:6:\"define\";s:31:\"varchar(32) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:76:\"1:置顶[1]\r\n2:头条[2]\r\n3:特荐[3]\r\n4:推荐[4]\r\n5:热点[5]\r\n6:幻灯[6]\";s:5:\"value\";s:0:\"\";}', '1', '1', '1', '0', '0', '1551846870', '1551846870', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('5', '1', 'keywords', 'SEO关键词', '多关键词之间用空格或者“,”隔开', 'text', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('6', '1', 'description', 'SEO摘要', '如不填写，则自动截取附表中编辑器的200字符', 'textarea', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('7', '1', 'tags', 'Tags标签', '多关键词之间用空格或者“,”隔开', 'text', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('8', '1', 'uid', '用户id', '', 'number', 'a:3:{s:6:\"define\";s:21:\"mediumint(8) UNSIGNED\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '0', '1', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('9', '1', 'listorder', '排序', '', 'number', 'a:3:{s:6:\"define\";s:40:\"tinyint(3) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:3:\"100\";}', '1', '1', '1', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('10', '1', 'status', '状态', '', 'radio', 'a:3:{s:6:\"define\";s:40:\"tinyint(2) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:18:\"0:禁用\r\n1:启用\";s:5:\"value\";s:1:\"1\";}', '1', '1', '1', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('11', '1', 'inputtime', '创建时间', '', 'datetime', 'a:3:{s:6:\"define\";s:37:\"int(11) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '1', '0', '0', '1546574975', '1546574975', '200', '1');
INSERT INTO `yzn_model_field` VALUES ('12', '1', 'updatetime', '更新时间', '', 'datetime', 'a:3:{s:6:\"define\";s:37:\"int(11) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '0', '1', '0', '0', '1546574975', '1546574975', '200', '1');
INSERT INTO `yzn_model_field` VALUES ('13', '1', 'hits', '点击量', '', 'number', 'a:3:{s:6:\"define\";s:42:\"mediumint(8) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"0\";}', '1', '1', '1', '0', '0', '1546574975', '1546574975', '200', '1');
INSERT INTO `yzn_model_field` VALUES ('14', '1', 'did', '附表文档id', '', 'hidden', '', '0', '0', '1', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('15', '1', 'content', '内容', '', 'Ueditor', 'a:3:{s:6:\"define\";s:13:\"text NOT NULL\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '0', '1', '0', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('31', '3', 'id', '文档id', '', 'hidden', '', '1', '1', '1', '0', '0', '1549165800', '1549165800', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('32', '3', 'catid', '栏目id', '', 'hidden', '', '1', '1', '1', '0', '0', '1549165800', '1549165800', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('33', '3', 'title', '标题', '', 'text', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '1', '1', '1549165800', '1549165800', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('34', '3', 'flag', '属性', '', 'checkbox', 'a:3:{s:6:\"define\";s:31:\"varchar(32) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:76:\"1:置顶[1]\r\n2:头条[2]\r\n3:特荐[3]\r\n4:推荐[4]\r\n5:热点[5]\r\n6:幻灯[6]\";s:5:\"value\";s:0:\"\";}', '1', '1', '1', '0', '0', '1551846870', '1551846870', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('35', '3', 'keywords', 'SEO关键词', '多关键词之间用空格或者“,”隔开', 'text', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '0', '0', '1549165800', '1549165800', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('36', '3', 'description', 'SEO摘要', '如不填写，则自动截取附表中编辑器的200字符', 'textarea', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '0', '0', '1549165800', '1549165800', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('37', '3', 'tags', 'Tags标签', '多关键词之间用空格或者“,”隔开', 'text', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '0', '0', '1546574975', '1546574975', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('38', '3', 'uid', '用户id', '', 'number', 'a:3:{s:6:\"define\";s:21:\"mediumint(8) UNSIGNED\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '0', '1', '0', '0', '1549165800', '1549165800', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('39', '3', 'listorder', '排序', '', 'number', 'a:3:{s:6:\"define\";s:40:\"tinyint(3) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:3:\"100\";}', '1', '1', '1', '0', '0', '1549165800', '1549165800', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('40', '3', 'status', '状态', '', 'radio', 'a:3:{s:6:\"define\";s:40:\"tinyint(2) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:18:\"0:禁用\r\n1:启用\";s:5:\"value\";s:1:\"1\";}', '1', '1', '1', '0', '0', '1549165800', '1549165800', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('41', '3', 'inputtime', '创建时间', '', 'datetime', 'a:3:{s:6:\"define\";s:37:\"int(11) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '1', '0', '0', '1549165800', '1549165800', '200', '1');
INSERT INTO `yzn_model_field` VALUES ('42', '3', 'updatetime', '更新时间', '', 'datetime', 'a:3:{s:6:\"define\";s:37:\"int(11) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '0', '1', '0', '0', '1549165800', '1549165800', '200', '1');
INSERT INTO `yzn_model_field` VALUES ('43', '3', 'hits', '点击量', '', 'number', 'a:3:{s:6:\"define\";s:42:\"mediumint(8) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"0\";}', '1', '1', '1', '0', '0', '1549165800', '1549165800', '200', '1');
INSERT INTO `yzn_model_field` VALUES ('44', '3', 'did', '附表文档id', '', 'hidden', '', '0', '0', '1', '0', '0', '1549165800', '1549165800', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('45', '3', 'content', '内容', '', 'Ueditor', 'a:3:{s:6:\"define\";s:13:\"text NOT NULL\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '0', '1', '0', '0', '0', '1549165800', '1549165800', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('61', '5', 'inputtime', '创建时间', '', 'datetime', 'a:3:{s:6:\"define\";s:37:\"int(11) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '1', '0', '0', '1550480944', '1550480944', '200', '1');
INSERT INTO `yzn_model_field` VALUES ('62', '5', 'status', '状态', '', 'radio', 'a:3:{s:6:\"define\";s:40:\"tinyint(2) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:18:\"0:禁用\r\n1:启用\";s:5:\"value\";s:1:\"1\";}', '1', '1', '1', '0', '0', '1550480944', '1550480944', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('64', '5', 'listorder', '排序', '', 'number', 'a:3:{s:6:\"define\";s:40:\"tinyint(3) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:3:\"100\";}', '1', '1', '1', '0', '0', '1550480944', '1550480944', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('65', '5', 'uid', '用户id', '', 'number', 'a:3:{s:6:\"define\";s:21:\"mediumint(8) UNSIGNED\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '0', '1', '0', '0', '1550480944', '1550480944', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('66', '5', 'phone', '您的电话', '', 'text', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '1', '1', '1550629851', '1550630223', '2', '1');
INSERT INTO `yzn_model_field` VALUES ('67', '5', 'email', '您的邮箱', '', 'text', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '1', '1', '1550629880', '1550630224', '3', '1');
INSERT INTO `yzn_model_field` VALUES ('68', '5', 'title', '您的姓名', '', 'text', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '1', '1', '1550480944', '1550630221', '1', '1');
INSERT INTO `yzn_model_field` VALUES ('69', '5', 'flag', '属性', '', 'checkbox', 'a:3:{s:6:\"define\";s:31:\"varchar(32) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:76:\"1:置顶[1]\r\n2:头条[2]\r\n3:特荐[3]\r\n4:推荐[4]\r\n5:热点[5]\r\n6:幻灯[6]\";s:5:\"value\";s:0:\"\";}', '1', '1', '1', '0', '0', '1551846870', '1551846870', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('70', '5', 'catid', '栏目id', '', 'hidden', '', '1', '1', '1', '0', '0', '1550480944', '1550480944', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('71', '5', 'id', '文档id', '', 'hidden', '', '1', '1', '1', '0', '0', '1550480944', '1550480944', '100', '1');
INSERT INTO `yzn_model_field` VALUES ('72', '5', 'updatetime', '更新时间', '', 'datetime', 'a:3:{s:6:\"define\";s:37:\"int(11) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '0', '1', '0', '0', '1550480944', '1550480944', '200', '1');
INSERT INTO `yzn_model_field` VALUES ('73', '5', 'hits', '点击量', '', 'number', 'a:3:{s:6:\"define\";s:42:\"mediumint(8) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:1:\"0\";}', '1', '1', '1', '0', '0', '1550480944', '1550480944', '200', '1');
INSERT INTO `yzn_model_field` VALUES ('74', '5', 'content', '您的意见或建议', '', 'textarea', 'a:3:{s:6:\"define\";s:32:\"varchar(255) NOT NULL DEFAULT \'\'\";s:7:\"options\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '1', '1', '1550629912', '1550630226', '4', '1');
INSERT INTO `yzn_model_field` VALUES ('75', '3', 'type', '类型', '', 'radio', 'a:4:{s:6:\"define\";s:40:\"tinyint(2) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:91:\"1:营销网站\r\n2:电商网站\r\n3:响应式网站\r\n4:手机网站\r\n5:外贸网站\r\n6:其他\";s:10:\"filtertype\";s:1:\"1\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '1', '0', '1552368369', '1552372294', '0', '1');
INSERT INTO `yzn_model_field` VALUES ('76', '3', 'trade', '行业', '', 'radio', 'a:4:{s:6:\"define\";s:40:\"tinyint(2) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:78:\"1:机械设备\r\n2:车辆物流\r\n3:地产建筑装修\r\n4:教育培训\r\n5:其他\";s:10:\"filtertype\";s:1:\"1\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '1', '0', '1552372387', '1552372387', '0', '1');
INSERT INTO `yzn_model_field` VALUES ('77', '3', 'price', '价格', '', 'radio', 'a:4:{s:6:\"define\";s:40:\"tinyint(2) UNSIGNED NOT NULL DEFAULT \'0\'\";s:7:\"options\";s:42:\"1:≤2500\r\n2:≤5000\r\n3:≤8000\r\n4:≥1万\";s:10:\"filtertype\";s:1:\"1\";s:5:\"value\";s:0:\"\";}', '1', '1', '0', '1', '0', '1552372433', '1552372433', '0', '1');

-- ----------------------------
-- Table structure for yzn_module
-- ----------------------------
DROP TABLE IF EXISTS `yzn_module`;
CREATE TABLE `yzn_module` (
  `module` varchar(15) NOT NULL COMMENT '模块',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模块名称',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '签名',
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '内置模块',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用',
  `version` varchar(50) NOT NULL DEFAULT '' COMMENT '版本',
  `setting` mediumtext COMMENT '设置信息',
  `installtime` int(10) NOT NULL DEFAULT '0' COMMENT '安装时间',
  `updatetime` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`module`),
  KEY `sign` (`sign`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='已安装模块列表';

-- ----------------------------
-- Records of yzn_module
-- ----------------------------
INSERT INTO `yzn_module` VALUES ('cms', 'cms模块', 'b19cc279ed484c13c96c2f7142e2f437', '0', '1', '1.0.0', '', '1554724306', '1554724306', '0');
INSERT INTO `yzn_module` VALUES ('member', '会员模块', 'fcfe4d97f35d1f30df5d6018a84f74ba', '0', '1', '1.0.0', '', '1554724316', '1554732985', '0');
INSERT INTO `yzn_module` VALUES ('links', '友情链接', '960c30f9b119fa6c39a4a31867441c82', '0', '1', '1.0.0', null, '1554790931', '1554790931', '0');
INSERT INTO `yzn_module` VALUES ('sitemap', 'sitemap网站地图', '2cd67448032301277ba60dda2c5f2740', '0', '1', '1.0.0', null, '1554790992', '1554790992', '0');

-- ----------------------------
-- Table structure for yzn_page
-- ----------------------------
DROP TABLE IF EXISTS `yzn_page`;
CREATE TABLE `yzn_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(160) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `content` text COMMENT '内容',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单页内容表';

-- ----------------------------
-- Records of yzn_page
-- ----------------------------
INSERT INTO `yzn_page` VALUES ('2', '关于我们', '', '', '<p>&nbsp; &nbsp; xxx网络科技股份有限公司是一家集策略咨询、创意创新、视觉设计、技术研发、内容制造、营销推广为一体的综合型数字化创新服务企业，其利用公司持续积累的核心技术和互联网思维，提供以互联网、移动互联网为核心的网络技术服务和互动整合营销服务，为传统企业实现“互联网+”升级提供整套解决方案。公司定位于中大型企业为核心客户群，可充分满足这一群体相比中小企业更为丰富、高端、多元的互联网数字综合需求。</p><p><br/></p><p>&nbsp; &nbsp; xxx网络科技股份有限公司作为一家互联网数字服务综合商，其主营业务包括移动互联网应用开发服务、数字互动整合营销服务、互联网网站建设综合服务和电子商务综合服务。</p><p><br/></p><p>&nbsp; &nbsp; xxx网络科技股份有限公司秉承实现全网价值营销的理念，通过实现互联网与移动互联网的精准数字营销和用户数据分析，日益深入到客户互联网技术建设及运维营销的方方面面，在帮助客户形成自身互联网运作体系的同时，有效对接BAT(百度，阿里，腾讯)等平台即百度搜索、阿里电商、腾讯微信，通过平台的推广来推进互联网综合服务，实现企业、用户、平台三者完美对接，并形成高效互动的枢纽，在帮助客户获取互联网高附加价值的同时获得自身的不断成长和壮大。</p>', '0', '0');
INSERT INTO `yzn_page` VALUES ('3', '企业文化', '', '', '<p>【愿景】</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>不断倾听和满足用户需求，引导并超越用户需求，赢得用户尊敬</p></li><li><p>通过提升品牌形象，使员工具有高度企业荣誉感，赢得员工尊敬&nbsp;</p></li><li><p>推动互联网行业的健康发展，与合作伙伴共成长，赢得行业尊敬</p></li><li><p>注重企业责任，用心服务，关爱社会、回馈社会，赢得社会尊敬</p></li></ul><p><br/></p><p>【使命】</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>使产品和服务像水和电融入人们的生活，为人们带来便捷和愉悦</p></li><li><p>关注不同地域、群体，并针对不同对象提供差异化的产品和服务</p></li><li><p>打造开放共赢平台，与合作伙伴共同营造健康的互联网生态环境</p></li></ul><p><br/></p><p>【管理理念】</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>为员工提供良好的工作环境和激励机制&nbsp;</p></li><li><p>完善员工培养体系和职业发展通道，使员工与企业同步成长</p></li><li><p>充分尊重和信任员工，不断引导和鼓励，使其获得成就的喜悦</p></li></ul>', '0', '0');
INSERT INTO `yzn_page` VALUES ('18', '联系我们', '', '', '<p>手　机：158-88888888</p><p>传　真：0512-88888888</p><p>邮　编：215000</p><p>邮　箱：admin@admin.com</p><p>地　址：江苏省苏州市吴中区某某工业园一区</p><p><br/></p><p><img width=\"530\" height=\"340\" src=\"http://api.map.baidu.com/staticimage?center=116.404,39.915&zoom=10&width=530&height=340&markers=116.404,39.915\"/></p>', '0', '0');

-- ----------------------------
-- Table structure for yzn_product
-- ----------------------------
DROP TABLE IF EXISTS `yzn_product`;
CREATE TABLE `yzn_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `flag` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '属性',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'SEO关键词',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Tags标签',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `hits` mediumint(8) unsigned DEFAULT '0' COMMENT '点击量',
  `inputtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `trade` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '行业',
  `price` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='产品模型模型表';

-- ----------------------------
-- Records of yzn_product
-- ----------------------------
INSERT INTO `yzn_product` VALUES ('1', '5', '苏州欧泊**机电进出口有限公司', '', '', '苏州欧伯**机电进出口有限公司成立于2014年，是德国HUK/DOPAG/METER MIX定量注脂、打胶产品正式授权的代理商，另经销德国CAPTRON、NORELEM等众多国外知名品牌，可为客户提供从技术咨询、产品销售、技术支持到售后服务的全程服务。公司自成立以来，一直致力于为客户提供德国及欧美地区原产的各类工业备品、备件，并确保100%原厂全新正品。', '注脂,打胶', '100', '0', '0', '1552365964', '1553067407', '1', '4', '1', '1');
INSERT INTO `yzn_product` VALUES ('4', '5', '南通红*居餐饮管理有限公司', '4', '', '南通红*居餐饮管理有限公司是一家具有自己的厨师团队，具备丰富的经验，专业承包及管理企事业机关单位、学校、医院、大型工业园区、工厂，建筑工地、写字楼的食堂及营养配餐等后勤项目的大型餐饮承包企业，在上海、江苏、浙江、都有设立公司营业部。团队有500余人，并可为各企业提供专业厨师团队、厨工，勤杂工，免费厨房餐饮管理;餐饮服务，保洁服务，家庭服务；停车场管理服务；劳务派遣经营；绿化维护，食品经营;婚庆礼仪服务;会...', '餐饮管理,婚庆礼仪,劳务派遣', '100', '0', '3', '1552366803', '1553067319', '1', '3', '5', '3');
INSERT INTO `yzn_product` VALUES ('2', '5', '海安华**仓储有限公司', '', '', '海安华**仓储有限公司主要以海安物流、仓储为主。 公司秉承“诚信经营、服务至上”的核心价值观；先进的物流理念和丰富的物流操作经验，为不同客户量身定做及提供专业物流方案和优质、高效的物流服务，从而帮客户降低成本，提升市场竞争力。　　公司已和众多知名企业携手合作，共创辉煌；承运范围涵盖了化工、机械、建材、纺织、电子电器、食品、制药、高科技产品等各行各业。', '物流服务', '100', '0', '1', '1552366267', '1553067377', '1', '5', '2', '3');
INSERT INTO `yzn_product` VALUES ('3', '5', '苏州领*线教育科技有限公司', '4', '', '苏州领*线教育科技有限公司是一家专注于高品质少儿培训和智能课程开发、提供精品化与专业化相结合的少儿教育科技机构。我们多年来，始终致力于将我们的课堂打造成为孩子快乐成长的乐园与成功的起点，并且成为江苏校外教育的品牌。我们已在苏州市区、常熟、张家港、吴江、昆山、太仓、常州、无锡、杭州、江西九江、内蒙古通辽、山东淄博等地成功开办了教学基地。', '校外教育,智能课程', '100', '0', '1', '1552366358', '1553067339', '1', '3', '4', '4');
INSERT INTO `yzn_product` VALUES ('5', '5', '苏州威*莱斯升降机械设备有限公司', '4', '', '苏州威*莱斯升降机械设备有限公司是专业提供各类升降平台出租租赁服务的厂家，自公司创立以来，经过长期对液压升降机、升降平台、高空作业车的研制和探索，积累了丰富的专业经验。凭借丰富的专业技术及不断开拓创新的精神，致力于产品的开发和创新，以自身专业特长，创造高品质的产品。', '机械设备,升降机,租赁服务', '100', '0', '0', '1552366872', '1553067296', '1', '3', '1', '2');
INSERT INTO `yzn_product` VALUES ('6', '5', '苏州非*搬运包装有限公司', '4', '', '苏州非*搬运安装有限公司于2016年7月在苏州工业园区这块沸腾的热土上重组合并挂牌成立。随着经济的发展,，公司秉承创新、创优、与时共进的原则把原有四家搬运公司重组洗牌、强强联手。作为一家专业承接各类精密机器设备搬运、装卸、安装定位工程的大企业，公司装备齐全、技术力量雄厚。施工人员均受过国家安全生产监督部门正规的专业培训，持有相应的资格证书，对各种精密机器设备的搬运、安装工程有着丰富的工作经验。施工车辆都是...', '精密机器,专业培训,资格证书', '100', '0', '1', '1552366920', '1553067267', '1', '1', '5', '1');
INSERT INTO `yzn_product` VALUES ('7', '5', '的方式方式', '', '', '胜多负少的', '', '100', '0', '0', '1554815079', '1554815089', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for yzn_product_data
-- ----------------------------
DROP TABLE IF EXISTS `yzn_product_data`;
CREATE TABLE `yzn_product_data` (
  `did` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci COMMENT '内容',
  PRIMARY KEY (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='产品模型模型表';

-- ----------------------------
-- Records of yzn_product_data
-- ----------------------------
INSERT INTO `yzn_product_data` VALUES ('1', '&lt;p&gt;苏州欧伯**机电进出口有限公司成立于2014年，是德国HUK/DOPAG/METER MIX定量注脂、打胶产品正式授权的代理商，另经销德国CAPTRON、NORELEM等众多国外知名品牌，可为客户提供从技术咨询、产品销售、技术支持到售后服务的全程服务。公司自成立以来，一直致力于为客户提供德国及欧美地区原产的各类工业备品、备件，并确保100%原厂全新正品。&lt;/p&gt;');
INSERT INTO `yzn_product_data` VALUES ('4', '&lt;p&gt;南通红*居餐饮管理有限公司是一家具有自己的厨师团队，具备丰富的经验，专业承包及管理企事业机关单位、学校、医院、大型工业园区、工厂，建筑工地、写字楼的食堂及营养配餐等后勤项目的大型餐饮承包企业，在上海、江苏、浙江、都有设立公司营业部。团队有500余人，并可为各企业提供专业厨师团队、厨工，勤杂工，免费厨房餐饮管理;餐饮服务，保洁服务，家庭服务；停车场管理服务；劳务派遣经营；绿化维护，食品经营;婚庆礼仪服务;会务服务;展览展示服务;厨房设备及用品、餐具、办公用品的销售、餐厅规划设计，厨具设计、出售、安装等服务&lt;/p&gt;');
INSERT INTO `yzn_product_data` VALUES ('2', '&lt;p&gt;海安华**仓储有限公司主要以海安物流、仓储为主。 公司秉承“诚信经营、服务至上”的核心价值观；先进的物流理念和丰富的物流操作经验，为不同客户量身定做及提供专业物流方案和优质、高效的物流服务，从而帮客户降低成本，提升市场竞争力。\r\n　　公司已和众多知名企业携手合作，共创辉煌；承运范围涵盖了化工、机械、建材、纺织、电子电器、食品、制药、高科技产品等各行各业。&lt;/p&gt;');
INSERT INTO `yzn_product_data` VALUES ('3', '&lt;p&gt;苏州领*线教育科技有限公司是一家专注于高品质少儿培训和智能课程开发、提供精品化与专业化相结合的少儿教育科技机构。我们多年来，始终致力于将我们的课堂打造成为孩子快乐成长的乐园与成功的起点，并且成为江苏校外教育的品牌。我们已在苏州市区、常熟、张家港、吴江、昆山、太仓、常州、无锡、杭州、江西九江、内蒙古通辽、山东淄博等地成功开办了教学基地。&lt;/p&gt;');
INSERT INTO `yzn_product_data` VALUES ('5', '&lt;p&gt;苏州威*莱斯升降机械设备有限公司是专业提供各类升降平台出租租赁服务的厂家，自公司创立以来，经过长期对液压升降机、升降平台、高空作业车的研制和探索，积累了丰富的专业经验。凭借丰富的专业技术及不断开拓创新的精神，致力于产品的开发和创新，以自身专业特长，创造高品质的产品。&lt;/p&gt;');
INSERT INTO `yzn_product_data` VALUES ('6', '&lt;p&gt;苏州非*搬运安装有限公司于2016年7月在苏州工业园区这块沸腾的热土上重组合并挂牌成立。随着经济的发展,，公司秉承创新、创优、与时共进的原则把原有四家搬运公司重组洗牌、强强联手。作为一家专业承接各类精密机器设备搬运、装卸、安装定位工程的大企业，公司装备齐全、技术力量雄厚。施工人员均受过国家安全生产监督部门正规的专业培训，持有相应的资格证书，对各种精密机器设备的搬运、安装工程有着丰富的工作经验。施工车辆都是定期由特种设备监督局定期安检的，搬运工具都是领先的。长期与多家财险、寿险公司合作，保证客户利益的最大化，员工利益的最大保障。&lt;/p&gt;');
INSERT INTO `yzn_product_data` VALUES ('7', '&lt;p&gt;胜多负少的&lt;/p&gt;');

-- ----------------------------
-- Table structure for yzn_tags
-- ----------------------------
DROP TABLE IF EXISTS `yzn_tags`;
CREATE TABLE `yzn_tags` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'tagID',
  `tag` char(20) NOT NULL DEFAULT '' COMMENT 'tag名称',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo标题',
  `seo_keyword` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo关键字',
  `seo_description` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo简介',
  `usetimes` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '信息总数',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`),
  KEY `usetimes` (`usetimes`,`listorder`),
  KEY `hits` (`hits`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='tags主表';

-- ----------------------------
-- Records of yzn_tags
-- ----------------------------
INSERT INTO `yzn_tags` VALUES ('1', '精密机器', '', '', '', '1', '0', '1553067267', '1553067267', '0');
INSERT INTO `yzn_tags` VALUES ('2', '专业培训', '', '', '', '1', '0', '1553067267', '1553067267', '0');
INSERT INTO `yzn_tags` VALUES ('3', '资格证书', '', '', '', '1', '0', '1553067267', '1553067267', '0');
INSERT INTO `yzn_tags` VALUES ('4', '机械设备', '', '', '', '1', '0', '1553067296', '1553067296', '0');
INSERT INTO `yzn_tags` VALUES ('5', '升降机', '', '', '', '1', '0', '1553067296', '1553067296', '0');
INSERT INTO `yzn_tags` VALUES ('6', '租赁服务', '', '', '', '1', '0', '1553067296', '1553067296', '0');
INSERT INTO `yzn_tags` VALUES ('7', '餐饮管理', '', '', '', '1', '0', '1553067319', '1553067319', '0');
INSERT INTO `yzn_tags` VALUES ('8', '婚庆礼仪', '', '', '', '1', '0', '1553067319', '1553067319', '0');
INSERT INTO `yzn_tags` VALUES ('9', '劳务派遣', '', '', '', '1', '0', '1553067319', '1553067319', '0');
INSERT INTO `yzn_tags` VALUES ('10', '校外教育', '', '', '', '1', '0', '1553067339', '1553067339', '0');
INSERT INTO `yzn_tags` VALUES ('11', '智能课程', '', '', '', '1', '0', '1553067339', '1553067339', '0');
INSERT INTO `yzn_tags` VALUES ('12', '物流服务', '', '', '', '1', '0', '1553067377', '1553067377', '0');
INSERT INTO `yzn_tags` VALUES ('13', '注脂', '', '', '', '1', '0', '1553067408', '1554817244', '0');
INSERT INTO `yzn_tags` VALUES ('14', '打胶', '', '', '', '1', '0', '1553067408', '1554727124', '0');

-- ----------------------------
-- Table structure for yzn_tags_content
-- ----------------------------
DROP TABLE IF EXISTS `yzn_tags_content`;
CREATE TABLE `yzn_tags_content` (
  `tag` char(20) NOT NULL COMMENT 'tag名称',
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `contentid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  KEY `modelid` (`modelid`,`contentid`),
  KEY `tag` (`tag`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tags数据表';

-- ----------------------------
-- Records of yzn_tags_content
-- ----------------------------
INSERT INTO `yzn_tags_content` VALUES ('精密机器', '3', '6', '5', '1553067267');
INSERT INTO `yzn_tags_content` VALUES ('专业培训', '3', '6', '5', '1553067267');
INSERT INTO `yzn_tags_content` VALUES ('资格证书', '3', '6', '5', '1553067267');
INSERT INTO `yzn_tags_content` VALUES ('机械设备', '3', '5', '5', '1553067296');
INSERT INTO `yzn_tags_content` VALUES ('升降机', '3', '5', '5', '1553067296');
INSERT INTO `yzn_tags_content` VALUES ('租赁服务', '3', '5', '5', '1553067296');
INSERT INTO `yzn_tags_content` VALUES ('餐饮管理', '3', '4', '5', '1553067319');
INSERT INTO `yzn_tags_content` VALUES ('婚庆礼仪', '3', '4', '5', '1553067319');
INSERT INTO `yzn_tags_content` VALUES ('劳务派遣', '3', '4', '5', '1553067319');
INSERT INTO `yzn_tags_content` VALUES ('校外教育', '3', '3', '5', '1553067339');
INSERT INTO `yzn_tags_content` VALUES ('智能课程', '3', '3', '5', '1553067339');
INSERT INTO `yzn_tags_content` VALUES ('物流服务', '3', '2', '5', '1553067377');
INSERT INTO `yzn_tags_content` VALUES ('注脂', '3', '1', '5', '1553067408');
INSERT INTO `yzn_tags_content` VALUES ('打胶', '3', '1', '5', '1553067408');

-- ----------------------------
-- Table structure for yzn_terms
-- ----------------------------
DROP TABLE IF EXISTS `yzn_terms`;
CREATE TABLE `yzn_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parentid` smallint(5) NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '分类名称',
  `module` varchar(15) NOT NULL DEFAULT '' COMMENT '所属模块',
  `setting` mediumtext COMMENT '相关配置信息',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of yzn_terms
-- ----------------------------
INSERT INTO `yzn_terms` VALUES ('1', '0', '链接分类一', 'links', null);
