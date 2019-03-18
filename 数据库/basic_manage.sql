/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : basic_manage

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-12-31 17:01:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) DEFAULT NULL COMMENT 'url',
  `spread` char(1) DEFAULT '0' COMMENT '是否展开，1展开 0不展开',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `is_top` varchar(1) DEFAULT '0' COMMENT '是否是顶级菜单 1：是 0 不是',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `level` int(10) DEFAULT NULL COMMENT '层级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '75', '系统管理', '&#xe75c;', '', '0', '1', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('2', '1', '后台首页', '&#xe79c;', 'main.html', '0', '1', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('3', '1', '我的面板', '&#xe9b6;', null, '0', '2', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('4', '3', '个人信息', '&#xe689;', '/oneManage/user/personInfo.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('5', '3', '修改密码', '&#xe7ce;', '/oneManage/user/pwd.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('6', '1', '系统设置', '&#xe64b;', null, '0', '3', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('7', '6', '用户管理', '&#xe70b;', '/oneManage/user/list.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('8', '6', '角色管理', '&#xe6d2;', '/oneManage/role/list.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('9', '6', '菜单管理', '&#xe6e2;', '/oneManage/menu/list.do', '0', '3', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('10', '6', '权限管理', '&#xe807;', '/oneManage/index/temp.do', '0', '4', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('11', '6', '系统参数配置', '&#xe7c4;', '/oneManage/index/temp.do', '0', '5', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('12', '6', '系统配置管理', '&#xe7c6;', '/oneManage/index/temp.do', '0', '6', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('13', '6', '系统日志管理', '&#xea25;', '/oneManage/index/temp.do', '0', '7', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('14', '6', '安全设置', '&#xe7fe;', '/oneManage/index/temp.do', '0', '8', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('15', '6', '短信接口设置', '&#xe7da;', '/oneManage/index/temp.do', '0', '9', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('16', '6', '支付宝接口配置', '&#xe7f4;', '/oneManage/index/temp.do', '0', '10', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('17', '1', '会员管理', '&#xe8a4;', null, '0', '4', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('18', '17', '会员列表', '&#xea3c;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('19', '17', '留言管理', '&#xea0c;', '/oneManage/index/temp.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('20', '1', '网站维护', '&#xea0e;', null, '0', '5', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('21', '20', '主题设置', '&#xe6cb;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('22', '20', '数据库管理', '&#xe9c2;', '/oneManage/index/temp.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('24', '75', '内容管理', '&#xe8ab;', null, '0', '2', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('25', '24', '网站管理', '&#xea0e;', null, '0', '1', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('26', '25', '网站栏目管理', '&#xe8c1;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('27', '25', '所有档案列表', '&#xe869;', 'html/content/article_list.html', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('28', '25', '待审核的档案', '&#xe82d;', '/oneManage/index/temp.do', '0', '3', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('29', '25', '我发布的文档', '&#xe905;', '/oneManage/index/temp.do', '0', '4', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('30', '25', 'Tags管理', '&#xe897;', '/oneManage/index/temp.do', '0', '5', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('31', '25', '内容回收站', '&#xe84e;', '/oneManage/index/temp.do', '0', '6', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('32', '24', '模型管理', '&#xe889;', null, '0', '2', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('33', '32', '内容模型管理', '&#xea27;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('34', '32', '单页文档管理', '&#xe9e0;', '/oneManage/index/temp.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('35', '32', '自由列表管理', '&#xe9e3;', '/oneManage/index/temp.do', '0', '3', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('36', '32', '自定义表单', '&#xe88e;', '/oneManage/index/temp.do', '0', '4', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('37', '32', '联动类别管理', '&#xe99e;', '/oneManage/index/temp.do', '0', '5', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('38', '24', '广告管理', '&#xe9da;', null, '0', '3', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('39', '38', '自定义广告', '&#xe8d1;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('40', '38', '网盟广告', '&#xe826;', '/oneManage/index/temp.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('41', '24', '采集管理', '&#xe9b5;', null, '0', '4', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('42', '41', '采集节点管理', '&#xe9b4;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('43', '24', '附件管理', '&#xe9c1;', null, '0', '5', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('44', '43', '文件管理器', '&#xe9c8;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('45', '43', '上传新文件', '&#xe819;', '/oneManage/index/temp.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('46', '24', '批量维护', '&#xe621;', null, '0', '6', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('47', '46', '一键更新网站', '&#xe839;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('48', '46', '更新系统缓存', '&#xe6a2;', '/oneManage/index/temp.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('49', '46', '重复文档检查', '&#xe82d;', '/oneManage/index/temp.do', '0', '3', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('50', '46', '更新网站地图', '&#xe891;', '/oneManage/index/temp.do', '0', '4', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('51', '75', '微信公众', '&#xe62b;', null, '0', '3', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('52', '51', '微信参数配置', '&#xe7f0;', null, '0', '1', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('53', '52', '微信接口配置', '&#xea33;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('54', '52', '微信支付配置', '&#xe9a6;', '/oneManage/index/temp.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('55', '51', '微信定制管理', '&#xe6f8;', null, '0', '2', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('56', '55', '菜单定制', '&#xe770;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('57', '55', '关键字管理', '&#xe911;', '/oneManage/index/temp.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('58', '55', '关注自动回复', '&#xe61d;', '/oneManage/index/temp.do', '0', '3', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('59', '55', '无默认值回复', '&#xe61d;', '/oneManage/index/temp.do', '0', '4', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('60', '51', '素材资源管理', '&#xe8cb;', null, '0', '3', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('61', '60', '图文列表', '&#xe869;', '/oneManage/index/temp.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('62', '60', '添加图文', '&#xe832;', '/oneManage/index/temp.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('63', '75', 'LarryMS文档', '&#xea3b;', null, '0', '4', '1', '0', '1');
INSERT INTO `sys_menu` VALUES ('65', '63', 'LarryMS图标管理', '&#xe9e4;', '/oneManage/systemDoc/icon.do', '0', '2', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('66', '63', 'LarryMS示例页面', '&#xea55;', null, '0', '3', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('67', '66', 'Hover页面', '&#xea2f;', '/oneManage/systemDoc/hover.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('68', '66', 'Animate页面', '&#xe610;', '/oneManage/systemDoc/animate.do', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('69', '66', '404页面', '&#xe82b;', '/oneManage/systemDoc/four.do', '0', '3', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('70', '63', 'LarryMS扩展组件', '&#xe89e;', null, '0', '4', '0', '0', '2');
INSERT INTO `sys_menu` VALUES ('71', '70', 'larryTab组件', '&#xe82d;', '/oneManage/systemDoc/larrytab.do', '0', '1', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('72', '70', 'common组件', '&#xe6bc;', 'subgroup/common.html', '0', '2', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('73', '70', 'ajaxGP组件', '&#xe895;', 'subgroup/ajax.html', '0', '3', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('74', '70', 'larryMenu右键菜单', '&#xe618;', 'subgroup/menu.html', '0', '4', '0', '0', '3');
INSERT INTO `sys_menu` VALUES ('75', '0', 'BasicManage后台管理系统', '&#xe75c;', '', '1', '1', '0', '0', '0');
INSERT INTO `sys_menu` VALUES ('76', '25', '友链管理', '&#xe8a0;', '/oneManage/friendLink/list.do', '0', '7', '0', '0', '3');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `useable` varchar(64) DEFAULT '0' COMMENT '是否可用 0：可用  1：不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('4', '部门管理员', '0');
INSERT INTO `sys_role` VALUES ('5', '超级管理员', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(255) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(255) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '10');
INSERT INTO `sys_role_menu` VALUES ('4', '11');
INSERT INTO `sys_role_menu` VALUES ('4', '12');
INSERT INTO `sys_role_menu` VALUES ('4', '13');
INSERT INTO `sys_role_menu` VALUES ('4', '14');
INSERT INTO `sys_role_menu` VALUES ('4', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '16');
INSERT INTO `sys_role_menu` VALUES ('4', '17');
INSERT INTO `sys_role_menu` VALUES ('4', '18');
INSERT INTO `sys_role_menu` VALUES ('4', '19');
INSERT INTO `sys_role_menu` VALUES ('4', '2');
INSERT INTO `sys_role_menu` VALUES ('4', '20');
INSERT INTO `sys_role_menu` VALUES ('4', '21');
INSERT INTO `sys_role_menu` VALUES ('4', '22');
INSERT INTO `sys_role_menu` VALUES ('4', '23');
INSERT INTO `sys_role_menu` VALUES ('4', '24');
INSERT INTO `sys_role_menu` VALUES ('4', '25');
INSERT INTO `sys_role_menu` VALUES ('4', '26');
INSERT INTO `sys_role_menu` VALUES ('4', '27');
INSERT INTO `sys_role_menu` VALUES ('4', '28');
INSERT INTO `sys_role_menu` VALUES ('4', '29');
INSERT INTO `sys_role_menu` VALUES ('4', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '30');
INSERT INTO `sys_role_menu` VALUES ('4', '31');
INSERT INTO `sys_role_menu` VALUES ('4', '32');
INSERT INTO `sys_role_menu` VALUES ('4', '33');
INSERT INTO `sys_role_menu` VALUES ('4', '34');
INSERT INTO `sys_role_menu` VALUES ('4', '35');
INSERT INTO `sys_role_menu` VALUES ('4', '36');
INSERT INTO `sys_role_menu` VALUES ('4', '37');
INSERT INTO `sys_role_menu` VALUES ('4', '38');
INSERT INTO `sys_role_menu` VALUES ('4', '39');
INSERT INTO `sys_role_menu` VALUES ('4', '4');
INSERT INTO `sys_role_menu` VALUES ('4', '40');
INSERT INTO `sys_role_menu` VALUES ('4', '41');
INSERT INTO `sys_role_menu` VALUES ('4', '42');
INSERT INTO `sys_role_menu` VALUES ('4', '43');
INSERT INTO `sys_role_menu` VALUES ('4', '44');
INSERT INTO `sys_role_menu` VALUES ('4', '45');
INSERT INTO `sys_role_menu` VALUES ('4', '46');
INSERT INTO `sys_role_menu` VALUES ('4', '47');
INSERT INTO `sys_role_menu` VALUES ('4', '48');
INSERT INTO `sys_role_menu` VALUES ('4', '49');
INSERT INTO `sys_role_menu` VALUES ('4', '5');
INSERT INTO `sys_role_menu` VALUES ('4', '50');
INSERT INTO `sys_role_menu` VALUES ('4', '6');
INSERT INTO `sys_role_menu` VALUES ('4', '7');
INSERT INTO `sys_role_menu` VALUES ('4', '8');
INSERT INTO `sys_role_menu` VALUES ('4', '9');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '2');
INSERT INTO `sys_role_menu` VALUES ('5', '24');
INSERT INTO `sys_role_menu` VALUES ('5', '25');
INSERT INTO `sys_role_menu` VALUES ('5', '3');
INSERT INTO `sys_role_menu` VALUES ('5', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '5');
INSERT INTO `sys_role_menu` VALUES ('5', '6');
INSERT INTO `sys_role_menu` VALUES ('5', '63');
INSERT INTO `sys_role_menu` VALUES ('5', '65');
INSERT INTO `sys_role_menu` VALUES ('5', '66');
INSERT INTO `sys_role_menu` VALUES ('5', '67');
INSERT INTO `sys_role_menu` VALUES ('5', '68');
INSERT INTO `sys_role_menu` VALUES ('5', '69');
INSERT INTO `sys_role_menu` VALUES ('5', '7');
INSERT INTO `sys_role_menu` VALUES ('5', '76');
INSERT INTO `sys_role_menu` VALUES ('5', '8');
INSERT INTO `sys_role_menu` VALUES ('5', '9');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` char(1) DEFAULT '0' COMMENT '可用状态：0可用 1不可用',
  `name` varchar(255) DEFAULT NULL COMMENT '真是姓名',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'ISMvKXpXpadDiUoOSoAfww==', '\\upload\\image\\20171231\\2017123116475550082721.JPG', '15751155335@163.com', null, '15751155335', '0', '张世烩', '5');
INSERT INTO `sys_user` VALUES ('2', '格式化记忆', '4QrcOUm6Wau+VuBX8g+IPg==', null, '1367251002@qq.com', null, '15751155335', '1', 'admin', '5');
INSERT INTO `sys_user` VALUES ('3', '记忆格式化格式化记忆', null, null, '1367251002@qq.com', null, '15751155335', '0', 'admin', '4');
INSERT INTO `sys_user` VALUES ('6', 'test', null, null, '15751155335@163.com', null, '15751155335', '0', 'test', '4');
INSERT INTO `sys_user` VALUES ('12', 'test', '4QrcOUm6Wau+VuBX8g+IPg==', null, '15751155335@163.com', null, '15751155335', '0', 'test1', '4');

-- ----------------------------
-- Table structure for web_flink
-- ----------------------------
DROP TABLE IF EXISTS `web_flink`;
CREATE TABLE `web_flink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webname` varchar(255) DEFAULT NULL COMMENT '网站名称',
  `alink` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `email` varchar(255) DEFAULT NULL COMMENT '站长邮箱',
  `addtime` datetime DEFAULT NULL COMMENT '天假时间',
  `dispos` varchar(255) DEFAULT NULL COMMENT '展示位置',
  `content` varchar(4000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of web_flink
-- ----------------------------
INSERT INTO `web_flink` VALUES ('6', 'ONE源码官网', 'http://www.y-one.cn', 'xianxin@layui.com', '2017-12-19 14:47:21', '首页', '测试测试');
INSERT INTO `web_flink` VALUES ('7', 'ONE源码官网', 'http://www.y-one.cn', 'xianxin@layui.com', '2017-12-19 14:47:21', '首页', '测试测试');
INSERT INTO `web_flink` VALUES ('8', 'ONE源码官网', 'http://www.y-one.cn', 'xianxin@layui.com', '2017-12-19 14:47:21', '首页', '测试测试');
INSERT INTO `web_flink` VALUES ('9', 'ONE源码官网', 'http://www.y-one.cn', 'xianxin@layui.com', '2017-12-19 14:47:21', '首页', '测试测试');
INSERT INTO `web_flink` VALUES ('10', 'ONE源码官网', 'http://www.y-one.cn', 'xianxin@layui.com', '2017-12-19 14:47:21', '首页', '测试测试');
INSERT INTO `web_flink` VALUES ('11', 'ONE源码官网', 'http://www.y-one.cn', 'xianxin@layui.com', '2017-12-19 14:47:21', '首页', '测试测试');
INSERT INTO `web_flink` VALUES ('14', 'ONE源码', 'http://www.y-one.cn', '15751155335@163.com', '2017-12-26 13:58:27', '首页', '但是');
INSERT INTO `web_flink` VALUES ('15', '11', 'http://www.y-one.cn', '15751155335@163.com', '2017-12-26 13:58:44', '首页', '撒');
INSERT INTO `web_flink` VALUES ('16', '2', 'http://www.y-one.cn', '15751155335@163.com', '2017-12-26 13:47:59', '首页', '23 ');
INSERT INTO `web_flink` VALUES ('17', '3', 'http://www.y-one.cn', '15751155335@163.com', '2017-12-26 13:49:06', '首页', '的方法第三方');

-- ----------------------------
-- Function structure for queryChildrenAreaInfo
-- ----------------------------
DROP FUNCTION IF EXISTS `queryChildrenAreaInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `queryChildrenAreaInfo`(areaId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);

SET sTemp = '$';
SET sTempChd = cast(areaId as char);

WHILE sTempChd is not NULL DO
SET sTemp = CONCAT(sTemp,',',sTempChd);
SELECT group_concat(id) INTO sTempChd FROM sys_menu where FIND_IN_SET(pid,sTempChd)>0;
END WHILE;
return sTemp;
END
;;
DELIMITER ;
