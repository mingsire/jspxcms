/*
Navicat MySQL Data Transfer

Source Server         : xxs
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : jspxcms411

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2015-05-17 21:51:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_ad
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad`;
CREATE TABLE `cms_ad` (
  `f_ad_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_adslot_id` int(11) NOT NULL,
  `f_name` varchar(150) NOT NULL COMMENT '名称',
  `f_begin_date` datetime DEFAULT NULL COMMENT '开始时间',
  `f_end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `f_url` varchar(255) DEFAULT NULL COMMENT '广告url',
  `f_text` varchar(255) DEFAULT NULL COMMENT '文字',
  `f_script` longtext COMMENT '代码',
  `f_image` varchar(255) DEFAULT NULL COMMENT '图片',
  `f_flash` varchar(255) DEFAULT NULL COMMENT 'flash',
  `f_seq` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`f_ad_id`),
  KEY `fk_cms_ad_adslot` (`f_adslot_id`),
  KEY `fk_cms_ad_site` (`f_site_id`),
  CONSTRAINT `fk_cms_ad_adslot` FOREIGN KEY (`f_adslot_id`) REFERENCES `cms_ad_slot` (`f_adslot_id`),
  CONSTRAINT `fk_cms_ad_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of cms_ad
-- ----------------------------
INSERT INTO `cms_ad` VALUES ('2', '1', '1', 'jspxcms演示广告', null, null, 'http://www.jspxcms.com', 'jspxcms演示广告', null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130812090148_furree.jpg', null, '50');
INSERT INTO `cms_ad` VALUES ('3', '7', '3', 'banner1', null, null, 'http://', 'banner1', null, '/uploads/7/image/public/201504/20150418212623_x221qh.jpg', null, '50');
INSERT INTO `cms_ad` VALUES ('4', '7', '3', 'banner1', null, null, 'http://', 'banner1', null, '/uploads/7/image/public/201504/20150418212637_sqm082.jpg', null, '50');
INSERT INTO `cms_ad` VALUES ('5', '7', '3', 'banner1', null, null, 'http://', 'banner1', null, '/uploads/7/image/public/201504/20150418212645_alyp3p.jpg', null, '50');
INSERT INTO `cms_ad` VALUES ('6', '7', '3', 'banner1', null, null, 'http://', 'banner1', null, '/uploads/7/image/public/201504/20150418224739_8yk7ao.jpg', null, '50');

-- ----------------------------
-- Table structure for cms_ad_slot
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad_slot`;
CREATE TABLE `cms_ad_slot` (
  `f_adslot_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_number` varchar(100) DEFAULT NULL COMMENT '编码',
  `f_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_type` int(11) NOT NULL COMMENT '类型(1:文字,2:图片,3:FLASH,4:代码)',
  `f_template` varchar(255) NOT NULL COMMENT '模板',
  `f_width` int(11) NOT NULL COMMENT '宽度',
  `f_height` int(11) NOT NULL COMMENT '高度',
  PRIMARY KEY (`f_adslot_id`),
  KEY `fk_cms_adslot_site` (`f_site_id`),
  CONSTRAINT `fk_cms_adslot_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告版位表';

-- ----------------------------
-- Records of cms_ad_slot
-- ----------------------------
INSERT INTO `cms_ad_slot` VALUES ('1', '1', '图片', 'picture', null, '2', '/sys_ad/ad_text.html', '700', '90');
INSERT INTO `cms_ad_slot` VALUES ('2', '3', '首页banner', 'banner', null, '2', '/pic_info.html', '200', '400');
INSERT INTO `cms_ad_slot` VALUES ('3', '7', '首页banner', 'banner', null, '2', '/banner.html', '200', '400');

-- ----------------------------
-- Table structure for cms_attribute
-- ----------------------------
DROP TABLE IF EXISTS `cms_attribute`;
CREATE TABLE `cms_attribute` (
  `f_attribute_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_number` varchar(20) NOT NULL COMMENT '编码',
  `f_name` varchar(50) NOT NULL COMMENT '名称',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  `f_is_with_image` char(1) NOT NULL DEFAULT '0' COMMENT '是否包含图片',
  `f_image_width` int(11) DEFAULT NULL COMMENT '图片宽度',
  `f_image_height` int(11) DEFAULT NULL COMMENT '图片高度',
  PRIMARY KEY (`f_attribute_id`),
  KEY `fk_cms_attribute_site` (`f_site_id`),
  CONSTRAINT `fk_cms_attribute_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='属性表';

-- ----------------------------
-- Records of cms_attribute
-- ----------------------------
INSERT INTO `cms_attribute` VALUES ('1', '1', 'focus', '焦点', '0', '1', '424', '290');
INSERT INTO `cms_attribute` VALUES ('2', '1', 'bignews', '头条', '1', '1', '50', '50');
INSERT INTO `cms_attribute` VALUES ('3', '1', 'marquee', '滚动', '2', '1', '95', '70');
INSERT INTO `cms_attribute` VALUES ('4', '1', 'recommend', '推荐', '3', '0', null, null);
INSERT INTO `cms_attribute` VALUES ('5', '7', 'c1', '分类1', '2147483647', '0', null, null);

-- ----------------------------
-- Table structure for cms_collect
-- ----------------------------
DROP TABLE IF EXISTS `cms_collect`;
CREATE TABLE `cms_collect` (
  `f_collect_id` int(11) NOT NULL,
  `f_node_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_charset` varchar(100) NOT NULL DEFAULT 'UTF-8' COMMENT '字符集',
  `f_url` varchar(2000) NOT NULL COMMENT '采集地址',
  `f_begin` int(11) NOT NULL DEFAULT '2' COMMENT '起始序号',
  `f_end` int(11) NOT NULL DEFAULT '10' COMMENT '结束序号',
  `f_is_desc` char(1) NOT NULL DEFAULT '1' COMMENT '是否倒序',
  `f_item_area` varchar(255) DEFAULT NULL COMMENT '文章地址区域',
  `f_item_url` varchar(255) DEFAULT NULL COMMENT '文章地址',
  `f_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `f_text` varchar(255) DEFAULT NULL COMMENT '正文开始代码',
  `f_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态(0:就绪,1:运行中,2:暂停)',
  PRIMARY KEY (`f_collect_id`),
  KEY `fk_cms_collect_node` (`f_node_id`),
  KEY `fk_cms_collect_site` (`f_site_id`),
  KEY `fk_cms_collect_user` (`f_user_id`),
  CONSTRAINT `fk_cms_collect_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`),
  CONSTRAINT `fk_cms_collect_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`),
  CONSTRAINT `fk_cms_collect_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集表';

-- ----------------------------
-- Records of cms_collect
-- ----------------------------
INSERT INTO `cms_collect` VALUES ('1', '42', '1', '1', '新浪新闻', 'GBK', 'http://roll.news.sina.com.cn/news/gnxw/gdxw1/index.shtml\r\nhttp://roll.news.sina.com.cn/news/gnxw/gdxw1/index_(*).shtml', '2', '10', '1', '<ul class=\"list_009\">(*)</ul>', '<li><a href=\"(*)\" target=\"_blank\">', '<meta property=\"og:title\" content=\"(*)\" />', '<!-- 正文内容 begin -->\r\n(*)\r\n<!-- publish_helper_end -->', '0');

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `f_comment_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_creator_id` int(11) NOT NULL COMMENT '创建人',
  `f_auditor_id` int(11) DEFAULT NULL COMMENT '审核人',
  `f_ftype` varchar(50) NOT NULL COMMENT '外表标识',
  `f_fid` int(11) NOT NULL COMMENT '外表ID',
  `f_creation_date` datetime NOT NULL COMMENT '评论时间',
  `f_audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `f_ip` varchar(100) NOT NULL DEFAULT '127.0.0.1' COMMENT 'IP地址',
  `f_score` int(11) NOT NULL DEFAULT '0' COMMENT '得分',
  `f_status` int(11) NOT NULL DEFAULT '0' COMMENT '0:未审核;1:已审核;2:推荐;3:屏蔽',
  `f_text` longtext,
  PRIMARY KEY (`f_comment_id`),
  KEY `fk_cms_comment_auditor` (`f_auditor_id`),
  KEY `fk_cms_comment_creator` (`f_creator_id`),
  KEY `fk_cms_comment_site` (`f_site_id`),
  CONSTRAINT `fk_cms_comment_auditor` FOREIGN KEY (`f_auditor_id`) REFERENCES `cms_user` (`f_user_id`),
  CONSTRAINT `fk_cms_comment_creator` FOREIGN KEY (`f_creator_id`) REFERENCES `cms_user` (`f_user_id`),
  CONSTRAINT `fk_cms_comment_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` VALUES ('16', '1', '1', null, 'Info', '28', '2014-02-22 12:40:48', null, '0:0:0:0:0:0:0:1', '0', '1', '很好看');

-- ----------------------------
-- Table structure for cms_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `cms_friendlink`;
CREATE TABLE `cms_friendlink` (
  `f_friendlink_id` int(11) NOT NULL,
  `f_friendlinktype_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL COMMENT '网站名称',
  `f_url` varchar(255) NOT NULL COMMENT '网站地址',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  `f_logo` varchar(255) DEFAULT NULL COMMENT '网站Logo',
  `f_description` varchar(255) DEFAULT NULL COMMENT '网站描述',
  `f_email` varchar(100) DEFAULT NULL COMMENT '站长Email',
  `f_is_with_logo` char(1) NOT NULL DEFAULT '0' COMMENT '是否带Logo',
  `f_is_recommend` char(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `f_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态(0:已审核,1:未审核)',
  PRIMARY KEY (`f_friendlink_id`),
  KEY `fk_cms_friendlink_fltype` (`f_friendlinktype_id`),
  KEY `fk_cms_friendlink_site` (`f_site_id`),
  CONSTRAINT `fk_cms_friendlink_fltype` FOREIGN KEY (`f_friendlinktype_id`) REFERENCES `cms_friendlink_type` (`f_friendlinktype_id`),
  CONSTRAINT `fk_cms_friendlink_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of cms_friendlink
-- ----------------------------
INSERT INTO `cms_friendlink` VALUES ('7', '1', '1', 'JSPXCMS官方', 'http://www.jspxcms.com', '2147483647', null, null, null, '0', '0', '0');
INSERT INTO `cms_friendlink` VALUES ('8', '3', '1', 'JAVA', 'http://www.java.com', '2147483647', null, null, null, '0', '0', '0');
INSERT INTO `cms_friendlink` VALUES ('9', '3', '1', 'TOMCAT', 'http://tomcat.apache.org', '2147483647', null, null, null, '0', '0', '0');
INSERT INTO `cms_friendlink` VALUES ('10', '3', '1', 'SPRINGSIDE', 'http://www.springside.org.cn', '2147483647', null, null, null, '0', '0', '0');
INSERT INTO `cms_friendlink` VALUES ('11', '4', '3', '百度', 'http://www.baidu.com', '2147483647', null, null, null, '0', '1', '0');
INSERT INTO `cms_friendlink` VALUES ('12', '5', '7', '光大银行', 'http://', '2147483647', '/uploads/7/image/public/201504/20150418232935_edj51i.gif', null, null, '1', '1', '0');
INSERT INTO `cms_friendlink` VALUES ('13', '5', '7', '广大银行', 'http://', '2147483647', '/uploads/7/image/public/201504/20150418232935_edj51i.gif', null, null, '1', '1', '0');
INSERT INTO `cms_friendlink` VALUES ('14', '5', '7', '广大银行', 'http://', '2147483647', '/uploads/7/image/public/201504/20150418232935_edj51i.gif', null, null, '1', '1', '0');
INSERT INTO `cms_friendlink` VALUES ('15', '5', '7', '广大银行', 'http://', '2147483647', '/uploads/7/image/public/201504/20150418232935_edj51i.gif', null, null, '1', '1', '0');
INSERT INTO `cms_friendlink` VALUES ('16', '5', '7', '广大银行', 'http://', '2147483647', '/uploads/7/image/public/201504/20150418232935_edj51i.gif', null, null, '1', '1', '0');
INSERT INTO `cms_friendlink` VALUES ('17', '5', '7', '广大银行', 'http://', '2147483647', '/uploads/7/image/public/201504/20150418232935_edj51i.gif', null, null, '1', '1', '0');
INSERT INTO `cms_friendlink` VALUES ('18', '5', '7', '广大银行', 'http://', '2147483647', '/uploads/7/image/public/201504/20150418232935_edj51i.gif', null, null, '1', '1', '0');
INSERT INTO `cms_friendlink` VALUES ('19', '5', '7', '广大银行', 'http://', '2147483647', '/uploads/7/image/public/201504/20150418232935_edj51i.gif', null, null, '1', '1', '0');
INSERT INTO `cms_friendlink` VALUES ('20', '5', '7', '广大银行', 'http://', '2147483647', '/uploads/7/image/public/201504/20150418232935_edj51i.gif', null, null, '1', '1', '0');
INSERT INTO `cms_friendlink` VALUES ('21', '5', '7', '广大银行', 'http://', '2147483647', '/uploads/7/image/public/201504/20150418232935_edj51i.gif', null, null, '1', '1', '0');

-- ----------------------------
-- Table structure for cms_friendlink_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_friendlink_type`;
CREATE TABLE `cms_friendlink_type` (
  `f_friendlinktype_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_number` varchar(100) DEFAULT NULL COMMENT '编码',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  PRIMARY KEY (`f_friendlinktype_id`),
  KEY `fk_cms_friendlinktype_site` (`f_site_id`),
  CONSTRAINT `fk_cms_friendlinktype_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接类型表';

-- ----------------------------
-- Records of cms_friendlink_type
-- ----------------------------
INSERT INTO `cms_friendlink_type` VALUES ('1', '1', '综合类', 'zonghe', '0');
INSERT INTO `cms_friendlink_type` VALUES ('3', '1', '技术类', 'yule', '1');
INSERT INTO `cms_friendlink_type` VALUES ('4', '3', '首页底部', 'index_footer_linker', '2147483647');
INSERT INTO `cms_friendlink_type` VALUES ('5', '7', '合作伙伴', 'friend', '2147483647');

-- ----------------------------
-- Table structure for cms_global
-- ----------------------------
DROP TABLE IF EXISTS `cms_global`;
CREATE TABLE `cms_global` (
  `f_global_id` int(11) NOT NULL,
  `f_protocol` varchar(50) NOT NULL DEFAULT 'http' COMMENT '协议',
  `f_port` int(11) DEFAULT NULL COMMENT '服务端口号',
  `f_context_path` varchar(255) DEFAULT NULL COMMENT '上下文路径',
  `f_is_with_domain` char(1) NOT NULL DEFAULT '0' COMMENT '是否URL包含域名',
  `f_version` varchar(50) NOT NULL COMMENT 'jspxcms版本号',
  PRIMARY KEY (`f_global_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局表';

-- ----------------------------
-- Records of cms_global
-- ----------------------------
INSERT INTO `cms_global` VALUES ('1', 'http', '80', null, '1', '4.1.1');

-- ----------------------------
-- Table structure for cms_global_clob
-- ----------------------------
DROP TABLE IF EXISTS `cms_global_clob`;
CREATE TABLE `cms_global_clob` (
  `f_global_id` int(11) NOT NULL,
  `f_key` varchar(50) NOT NULL COMMENT '键',
  `f_value` longtext COMMENT '值',
  KEY `fk_cms_globalclob_global` (`f_global_id`),
  CONSTRAINT `fk_cms_globalclob_global` FOREIGN KEY (`f_global_id`) REFERENCES `cms_global` (`f_global_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局大字段表';

-- ----------------------------
-- Records of cms_global_clob
-- ----------------------------

-- ----------------------------
-- Table structure for cms_global_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_global_custom`;
CREATE TABLE `cms_global_custom` (
  `f_global_id` int(11) NOT NULL,
  `f_key` varchar(50) NOT NULL COMMENT '键',
  `f_value` varchar(2000) DEFAULT NULL COMMENT '值',
  KEY `fk_cms_globalcustom_global` (`f_global_id`),
  CONSTRAINT `fk_cms_globalcustom_global` FOREIGN KEY (`f_global_id`) REFERENCES `cms_global` (`f_global_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局自定义表';

-- ----------------------------
-- Records of cms_global_custom
-- ----------------------------
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_flashAllowedExtensions', '');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_videoAllowedExtensions', '');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_videoDeniedExtensions', '');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_imageAllowedExtensions', '');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_linkDeniedExtensions', '');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_imageDeniedExtensions', '');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_linkAllowedExtensions', '');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_flashDeniedExtensions', '');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_mail_smtp_username', '89889');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_mail_smtp_host', 'jkkjkj');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_mail_smtp_auth', 'true');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_mail_smtp_password', '556');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_mail_from', 'fdfdfd');
INSERT INTO `cms_global_custom` VALUES ('1', 'sys_mail_smtp_port', '77');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_mode', '1');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_passwordEmailText', '亲爱的${username}:\r\n  请复制以下链接到浏览器中打开，进入密码修改页面。\r\n  ${url}\r\n\r\n${sitename}');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_maxLength', '20');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_minLength', '3');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_orgId', '1');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_validCharacter', '^[0-9a-zA-Z\\u4e00-\\u9fa5\\.\\-@_]+$');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_groupId', '1');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_passwordEmailSubject', '找回密码通知');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_verifyMode', '0');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_verifyEmailText', '亲爱的${username}:\r\n  请复制以下链接到浏览器中打开，以便激活您的帐号。\r\n  ${url}\r\n\r\n${sitename}');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_userAgreement', '1、在本站注册的会员，必须遵守《互联网电子公告服务管理规定》，不得在本站发表诽谤他人，侵犯他人隐私，侵犯他人知识产权，传播病毒，政治言论，商业讯息等信息。\r\n2、在所有在本站发表的文章，本站都具有最终编辑权，并且保留用于印刷或向第三方发表的权利，如果你的资料不齐全，我们将有权不作任何通知使用你在本站发布的作品。\r\n3、在登记过程中，您将选择注册名和密码。注册名的选择应遵守法律法规及社会公德。您必须对您的密码保密，您将对您注册名和密码下发生的所有活动承担责任。');
INSERT INTO `cms_global_custom` VALUES ('1', 'register_verifyEmailSubject', '帐号激活邮件');
INSERT INTO `cms_global_custom` VALUES ('1', 'mail_smtpAuth', 'true');
INSERT INTO `cms_global_custom` VALUES ('1', 'mail_smtpHost', 'smtp.163.com');
INSERT INTO `cms_global_custom` VALUES ('1', 'mail_from', '15070042724@163.com');
INSERT INTO `cms_global_custom` VALUES ('1', 'mail_smtpUsername', '15070042724@163.com');
INSERT INTO `cms_global_custom` VALUES ('1', 'mail_smtpPassword', '1234567890a');

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook`;
CREATE TABLE `cms_guestbook` (
  `f_guestbook_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_guestbooktype_id` int(11) NOT NULL COMMENT '留言类型',
  `f_creator_id` int(11) NOT NULL COMMENT '创建者',
  `f_replyer_id` int(11) DEFAULT NULL COMMENT '回复者',
  `f_title` varchar(150) DEFAULT NULL COMMENT '留言标题',
  `f_text` longtext COMMENT '留言内容',
  `f_creation_date` datetime NOT NULL COMMENT '留言日期',
  `f_creation_ip` varchar(100) NOT NULL COMMENT '留言IP',
  `f_reply_text` longtext COMMENT '回复内容',
  `f_reply_date` datetime DEFAULT NULL COMMENT '回复日期',
  `f_reply_ip` varchar(100) DEFAULT NULL COMMENT '回复IP',
  `f_is_reply` char(1) NOT NULL DEFAULT '0' COMMENT '是否回复',
  `f_is_recommend` char(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `f_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态(0:已审核,1:未审核,2:屏蔽)',
  `f_username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `f_gender` char(1) DEFAULT NULL COMMENT '性别',
  `f_phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `f_mobile` varchar(100) DEFAULT NULL COMMENT '手机',
  `f_qq` varchar(100) DEFAULT NULL COMMENT 'QQ号码',
  `f_email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  PRIMARY KEY (`f_guestbook_id`),
  KEY `fk_cms_guestbook_creator` (`f_creator_id`),
  KEY `fk_cms_guestbook_guestbooktype` (`f_guestbooktype_id`),
  KEY `fk_cms_guestbook_replyer` (`f_replyer_id`),
  KEY `fk_cms_guestbook_site` (`f_site_id`),
  CONSTRAINT `fk_cms_guestbook_creator` FOREIGN KEY (`f_creator_id`) REFERENCES `cms_user` (`f_user_id`),
  CONSTRAINT `fk_cms_guestbook_guestbooktype` FOREIGN KEY (`f_guestbooktype_id`) REFERENCES `cms_guestbook_type` (`f_guestbooktype_id`),
  CONSTRAINT `fk_cms_guestbook_replyer` FOREIGN KEY (`f_replyer_id`) REFERENCES `cms_user` (`f_user_id`),
  CONSTRAINT `fk_cms_guestbook_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板表';

-- ----------------------------
-- Records of cms_guestbook
-- ----------------------------
INSERT INTO `cms_guestbook` VALUES ('23', '1', '1', '1', '1', null, '终于等到jspxcms升级了，期待很久了。\r\n呵呵！', '2013-08-12 08:54:43', '0:0:0:0:0:0:0:1', '非常感谢大家长久以来的支持！', '2013-08-12 08:56:00', '0:0:0:0:0:0:0:1', '1', '0', '0', null, '1', null, null, null, null);
INSERT INTO `cms_guestbook` VALUES ('28', '1', '1', '1', null, null, '庆祝Jspcms4.1发布', '2014-03-18 13:56:44', '0:0:0:0:0:0:0:1', null, null, null, '0', '0', '0', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for cms_guestbook_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook_type`;
CREATE TABLE `cms_guestbook_type` (
  `f_guestbooktype_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_number` varchar(100) DEFAULT NULL COMMENT '编码',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  `f_description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`f_guestbooktype_id`),
  KEY `fk_cms_guestbooktype_site` (`f_site_id`),
  CONSTRAINT `fk_cms_guestbooktype_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板类型表';

-- ----------------------------
-- Records of cms_guestbook_type
-- ----------------------------
INSERT INTO `cms_guestbook_type` VALUES ('1', '1', '雁过留声', 'liusheng', '0', '游客或会员留言');

-- ----------------------------
-- Table structure for cms_info
-- ----------------------------
DROP TABLE IF EXISTS `cms_info`;
CREATE TABLE `cms_info` (
  `f_info_id` int(11) NOT NULL,
  `f_org_id` int(11) NOT NULL COMMENT '组织',
  `f_creator_id` int(11) NOT NULL COMMENT '创建者',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_node_id` int(11) NOT NULL COMMENT '节点',
  `f_publish_date` datetime NOT NULL COMMENT '发布日期',
  `f_priority` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优先级',
  `f_is_with_image` char(1) NOT NULL DEFAULT '0' COMMENT '是否包含图片',
  `f_views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览总数',
  `f_downloads` int(11) NOT NULL DEFAULT '0' COMMENT '下载总数',
  `f_comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论总数',
  `f_diggs` int(11) NOT NULL DEFAULT '0' COMMENT '顶',
  `f_score` int(11) NOT NULL DEFAULT '0' COMMENT '得分',
  `f_status` char(1) NOT NULL DEFAULT 'A' COMMENT '状态(0:发起者,1-9:审核中,A:已终审,B:草稿,C:投稿,D:退稿,E:采集,X:回收站,Z:归档)',
  `f_p1` tinyint(4) DEFAULT NULL COMMENT '自定义1',
  `f_p2` tinyint(4) DEFAULT NULL COMMENT '自定义2',
  `f_p3` tinyint(4) DEFAULT NULL COMMENT '自定义3',
  `f_p4` tinyint(4) DEFAULT NULL COMMENT '自定义4',
  `f_p5` tinyint(4) DEFAULT NULL COMMENT '自定义5',
  `f_p6` tinyint(4) DEFAULT NULL COMMENT '自定义6',
  PRIMARY KEY (`f_info_id`),
  KEY `fk_cms_info_node` (`f_node_id`),
  KEY `fk_cms_info_org` (`f_org_id`),
  KEY `fk_cms_info_site` (`f_site_id`),
  KEY `fk_cms_info_user_creator` (`f_creator_id`),
  CONSTRAINT `fk_cms_info_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`),
  CONSTRAINT `fk_cms_info_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`),
  CONSTRAINT `fk_cms_info_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`),
  CONSTRAINT `fk_cms_info_user_creator` FOREIGN KEY (`f_creator_id`) REFERENCES `cms_user` (`f_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息表';

-- ----------------------------
-- Records of cms_info
-- ----------------------------
INSERT INTO `cms_info` VALUES ('24', '1', '1', '1', '42', '2013-03-18 01:40:28', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('25', '1', '1', '1', '42', '2013-03-18 01:43:00', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('26', '1', '1', '1', '42', '2013-08-05 17:31:32', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('27', '1', '1', '1', '39', '2013-03-18 01:46:31', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('28', '1', '1', '1', '42', '2013-08-05 17:31:36', '0', '0', '50', '0', '1', '2', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('30', '1', '1', '1', '44', '2013-08-05 17:31:32', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('32', '1', '1', '1', '44', '2013-08-05 17:31:32', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('33', '1', '1', '1', '43', '2013-08-05 17:31:32', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('34', '1', '1', '1', '43', '2013-08-05 17:31:32', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('35', '1', '1', '1', '43', '2013-08-14 17:31:32', '0', '0', '10', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('36', '1', '1', '1', '43', '2013-08-06 17:31:32', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('37', '1', '1', '1', '39', '2013-03-18 09:06:26', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('38', '1', '1', '1', '39', '2013-03-18 09:07:16', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('39', '1', '1', '1', '39', '2013-03-18 09:11:20', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('40', '1', '1', '1', '45', '2013-03-18 13:09:08', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('43', '1', '1', '1', '38', '2013-08-11 00:55:52', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('44', '1', '1', '1', '38', '2013-08-11 01:02:32', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('45', '1', '1', '1', '38', '2013-03-11 01:06:31', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('46', '1', '1', '1', '38', '2013-08-11 01:09:43', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('47', '1', '1', '1', '40', '2013-03-19 01:16:20', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('48', '1', '1', '1', '40', '2013-03-19 01:17:39', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('49', '1', '1', '1', '40', '2013-03-19 01:20:15', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('50', '1', '1', '1', '40', '2013-03-19 01:23:30', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('52', '1', '1', '1', '41', '2013-03-19 01:31:00', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('53', '1', '1', '1', '41', '2013-03-19 01:32:45', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('54', '1', '1', '1', '41', '2013-03-19 01:36:50', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('55', '1', '1', '1', '41', '2013-03-19 01:38:50', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('64', '1', '1', '1', '45', '2013-03-18 13:09:41', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('70', '1', '1', '1', '45', '2013-04-04 01:31:04', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('71', '1', '1', '1', '45', '2013-04-07 15:13:21', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('72', '1', '1', '1', '45', '2013-04-07 15:13:51', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('73', '1', '1', '1', '38', '2013-08-07 04:07:07', '0', '1', '0', '0', '0', '10', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('78', '1', '1', '1', '48', '2013-08-06 06:51:58', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('79', '1', '1', '1', '48', '2013-08-06 06:59:08', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('80', '1', '1', '1', '48', '2013-08-06 08:26:57', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('81', '1', '1', '1', '48', '2013-08-06 08:36:28', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('83', '1', '1', '1', '49', '2013-08-06 09:32:47', '0', '0', '0', '5', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('84', '1', '1', '1', '51', '2013-08-08 02:12:45', '0', '1', '10', '0', '0', '1', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('85', '1', '1', '1', '51', '2013-08-08 02:15:25', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('86', '1', '1', '1', '51', '2013-08-08 02:46:19', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('87', '1', '1', '1', '51', '2013-08-08 02:53:12', '0', '1', '70', '0', '0', '3', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('93', '1', '1', '1', '49', '2013-08-08 07:32:47', '0', '1', '0', '5', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('94', '1', '1', '1', '52', '2013-08-08 07:35:46', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('95', '1', '1', '1', '52', '2013-08-08 07:39:12', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('97', '1', '1', '1', '52', '2013-08-08 09:26:09', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('98', '1', '1', '1', '52', '2013-08-12 01:33:02', '0', '1', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('99', '1', '1', '1', '44', '2013-08-13 08:02:06', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('100', '1', '1', '1', '44', '2013-08-13 08:03:20', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('117', '1', '1', '1', '69', '2014-03-18 14:36:08', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('118', '1', '1', '1', '69', '2014-03-18 14:36:40', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('126', '1', '1', '3', '74', '2015-03-26 21:18:44', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('127', '1', '1', '3', '86', '2015-03-28 16:53:01', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('128', '1', '1', '3', '84', '2015-03-28 16:54:33', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('129', '1', '1', '3', '85', '2015-03-28 17:00:03', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('130', '1', '1', '3', '85', '2015-03-28 17:00:12', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('131', '1', '1', '3', '86', '2015-03-28 17:00:20', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('132', '1', '1', '3', '86', '2015-03-28 17:00:33', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('133', '1', '1', '3', '84', '2015-03-28 17:00:42', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('134', '1', '1', '3', '85', '2015-03-28 17:00:52', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('135', '1', '1', '3', '84', '2015-03-28 17:01:00', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('136', '1', '1', '3', '84', '2015-03-28 17:01:08', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('137', '1', '1', '3', '77', '2015-03-28 21:27:54', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('138', '1', '1', '3', '77', '2015-03-28 21:55:15', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('139', '1', '1', '3', '85', '2015-03-28 22:09:56', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('140', '1', '1', '3', '86', '2015-03-28 22:10:28', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('141', '1', '1', '3', '77', '2015-03-28 22:10:35', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('142', '1', '1', '3', '77', '2015-03-28 22:10:41', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('143', '1', '1', '3', '77', '2015-03-28 22:10:43', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('144', '1', '1', '3', '77', '2015-03-28 22:10:50', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('145', '1', '1', '3', '77', '2015-03-28 22:10:52', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('146', '1', '1', '3', '77', '2015-03-28 22:10:54', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('147', '1', '1', '3', '77', '2015-03-28 22:10:57', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('148', '1', '1', '3', '77', '2015-03-28 22:10:59', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('149', '1', '1', '3', '77', '2015-03-28 22:11:01', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('150', '1', '1', '3', '77', '2015-03-28 22:11:03', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('151', '1', '1', '3', '77', '2015-03-28 22:11:05', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('152', '1', '1', '3', '77', '2015-03-28 22:11:07', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('153', '1', '1', '3', '77', '2015-03-28 22:11:10', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('154', '1', '1', '4', '87', '2015-03-28 22:32:08', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('155', '1', '1', '7', '117', '2015-04-18 22:59:37', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('156', '1', '1', '7', '113', '2015-04-18 23:03:29', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('157', '1', '1', '7', '113', '2015-04-18 23:04:41', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('158', '1', '1', '7', '113', '2015-04-18 23:37:32', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('159', '1', '1', '7', '113', '2015-04-18 23:37:36', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('160', '1', '1', '7', '113', '2015-04-18 23:37:40', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('161', '1', '1', '7', '113', '2015-04-18 23:37:44', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('162', '1', '1', '7', '113', '2015-04-18 23:37:46', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('163', '1', '1', '7', '113', '2015-04-18 23:37:48', '0', '0', '10', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('164', '1', '1', '7', '117', '2015-04-18 23:38:19', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('165', '1', '1', '7', '117', '2015-04-18 23:38:22', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('166', '1', '1', '7', '117', '2015-04-18 23:38:25', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('167', '1', '1', '7', '117', '2015-04-18 23:38:28', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);
INSERT INTO `cms_info` VALUES ('168', '1', '1', '7', '117', '2015-04-18 23:41:13', '0', '0', '0', '0', '0', '0', '0', 'A', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for cms_info_attribute
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_attribute`;
CREATE TABLE `cms_info_attribute` (
  `f_infoattr_id` int(11) NOT NULL,
  `f_info_id` int(11) NOT NULL COMMENT '信息',
  `f_attribute_id` int(11) NOT NULL COMMENT '属性',
  `f_image` varchar(255) DEFAULT NULL COMMENT '属性图片',
  PRIMARY KEY (`f_infoattr_id`),
  KEY `fk_cms_infoattr_attribute` (`f_attribute_id`),
  KEY `fk_cms_infoattr_info` (`f_info_id`),
  CONSTRAINT `fk_cms_infoattr_attribute` FOREIGN KEY (`f_attribute_id`) REFERENCES `cms_attribute` (`f_attribute_id`),
  CONSTRAINT `fk_cms_infoattr_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息与属性关联表';

-- ----------------------------
-- Records of cms_info_attribute
-- ----------------------------
INSERT INTO `cms_info_attribute` VALUES ('316', '48', '2', null);
INSERT INTO `cms_info_attribute` VALUES ('317', '48', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('339', '34', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('340', '33', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130318090142_wqk540.jpg');
INSERT INTO `cms_info_attribute` VALUES ('341', '33', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('360', '28', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('363', '36', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('382', '55', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319013832_fclut6.jpg');
INSERT INTO `cms_info_attribute` VALUES ('383', '54', '2', null);
INSERT INTO `cms_info_attribute` VALUES ('384', '54', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319013604_sofolh.jpg');
INSERT INTO `cms_info_attribute` VALUES ('385', '53', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319013238_m0ec3s.jpg');
INSERT INTO `cms_info_attribute` VALUES ('386', '52', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319013347_7r1ulg.jpg');
INSERT INTO `cms_info_attribute` VALUES ('387', '52', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('388', '46', '1', 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813074322_94fn4q.jpg');
INSERT INTO `cms_info_attribute` VALUES ('389', '46', '2', null);
INSERT INTO `cms_info_attribute` VALUES ('390', '46', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813074348_modh0m.jpg');
INSERT INTO `cms_info_attribute` VALUES ('391', '44', '1', 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813072401_15qx9s.jpg');
INSERT INTO `cms_info_attribute` VALUES ('392', '44', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813072346_yf8gr9.jpg');
INSERT INTO `cms_info_attribute` VALUES ('393', '44', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('394', '43', '1', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319062425_2c9ht9.jpg');
INSERT INTO `cms_info_attribute` VALUES ('395', '43', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319005548_uivpg4.jpg');
INSERT INTO `cms_info_attribute` VALUES ('396', '43', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('397', '73', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('398', '45', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319010606_4bmb91.jpg');
INSERT INTO `cms_info_attribute` VALUES ('399', '45', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('400', '49', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319011948_hebrvi.jpg');
INSERT INTO `cms_info_attribute` VALUES ('401', '49', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('402', '39', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130318091105_d9ymqp.jpg');
INSERT INTO `cms_info_attribute` VALUES ('403', '39', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('404', '38', '2', null);
INSERT INTO `cms_info_attribute` VALUES ('405', '38', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130318090801_qrqex9.jpg');
INSERT INTO `cms_info_attribute` VALUES ('406', '38', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('407', '37', '3', 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130318091208_muyl4o.jpg');
INSERT INTO `cms_info_attribute` VALUES ('408', '37', '4', null);
INSERT INTO `cms_info_attribute` VALUES ('409', '27', '4', null);

-- ----------------------------
-- Table structure for cms_info_buffer
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_buffer`;
CREATE TABLE `cms_info_buffer` (
  `f_info_id` int(11) NOT NULL,
  `f_views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `f_downloads` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `f_comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `f_involveds` int(11) NOT NULL DEFAULT '0' COMMENT '评论参与人数',
  `f_diggs` int(11) NOT NULL DEFAULT '0' COMMENT '顶',
  `f_burys` int(11) NOT NULL DEFAULT '0' COMMENT '踩',
  `f_score` int(11) NOT NULL DEFAULT '0' COMMENT '得分',
  PRIMARY KEY (`f_info_id`),
  CONSTRAINT `fk_cms_infobuffer_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息缓冲表';

-- ----------------------------
-- Records of cms_info_buffer
-- ----------------------------
INSERT INTO `cms_info_buffer` VALUES ('24', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('26', '6', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('28', '9', '0', '0', '0', '0', '0', '2');
INSERT INTO `cms_info_buffer` VALUES ('35', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('36', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('37', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('38', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('39', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('43', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('45', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('46', '5', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('48', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('49', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('50', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('52', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('54', '6', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('55', '4', '0', '0', '0', '1', '0', '1');
INSERT INTO `cms_info_buffer` VALUES ('71', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('73', '4', '0', '0', '0', '3', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('78', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('79', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('80', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('81', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('83', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('84', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('85', '5', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('86', '5', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('87', '2', '0', '0', '0', '0', '0', '2');
INSERT INTO `cms_info_buffer` VALUES ('93', '0', '0', '0', '0', '0', '0', '9');
INSERT INTO `cms_info_buffer` VALUES ('94', '0', '0', '0', '0', '0', '0', '5');
INSERT INTO `cms_info_buffer` VALUES ('95', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `cms_info_buffer` VALUES ('97', '0', '0', '0', '0', '0', '0', '6');
INSERT INTO `cms_info_buffer` VALUES ('98', '0', '0', '0', '0', '0', '0', '2');
INSERT INTO `cms_info_buffer` VALUES ('99', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('100', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('117', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('118', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('126', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('127', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('128', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('129', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('130', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('131', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('132', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('133', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('134', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('135', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('136', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('137', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('138', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('139', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('140', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('141', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('142', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('143', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('144', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('145', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('146', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('147', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('148', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('149', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('150', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('151', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('152', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('153', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('154', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('155', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('156', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('157', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('158', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('159', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('160', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('161', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('162', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('163', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('164', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('165', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('166', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('167', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_info_buffer` VALUES ('168', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for cms_info_clob
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_clob`;
CREATE TABLE `cms_info_clob` (
  `f_info_id` int(11) NOT NULL,
  `f_key` varchar(50) NOT NULL COMMENT '键',
  `f_value` longtext COMMENT '值',
  KEY `fk_cms_infoclob_info` (`f_info_id`),
  CONSTRAINT `fk_cms_infoclob_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息大字段表';

-- ----------------------------
-- Records of cms_info_clob
-- ----------------------------
INSERT INTO `cms_info_clob` VALUES ('24', 'text', '<p>&nbsp;</p>\r\n<p style=\"text-align:center;\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130813071000_kk4cm0.jpg\" style=\"width: 500px; height: 336px; \" /></p>\r\n<p style=\"text-align:center;\"><span style=\"color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; font-size: 16px; line-height: 28px; \">少林足球</span></p>\r\n<p>近日，有关登封武校将少林功夫融入足球，培训足球运动员的新鲜事儿在网上流传，引起社会各界的关注。</p>\r\n<p>8月6日下午，记者电话采访了嵩山少林寺武僧团培训基地总教头释延鲁。释延鲁说，8月2日全国第六届高校足球教练培训研讨会在登封举行，他向与会的70多位国内各高校的足球教练员阐述了他的观点。释延鲁认为，武术和足球两者可&ldquo;强强联合&rdquo;，少林功夫中的腿法如十二路弹腿、桩功和其他拳法，对提高学生的脚法、抗撞击能力和身体协调性有很大帮助，可将这些技能融入足球之中，希望能对提升足球的训练水平有所帮助。</p>\r\n<p>释延鲁说，他们已经就功夫与足球的结合，做了技术性的研究，并已付诸行动。早在2010年10月，少林寺武僧团培训基地就已开始组建青少年足球队。据介绍，目前少林武僧团培训基地与河南建业集团联合，规划建设少林建业国际足球学校。该项目今年2月26日奠基，计划投资20亿元，包括一个足球学校、一个体育场和两个体育馆等。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('25', 'text', '<p>&nbsp;</p>\r\n<p>北京警方10日通报，8月7日警方出动300名警力，对藏匿于一栋大厦内侵害公民个人信息的犯罪团伙实施抓捕，299名嫌犯落网，其中刑事拘留95人、行政拘留204人，并缴获数十箱公民个人信息名单。目前，涉案公司总裁仍在逃。</p>\r\n<p>北京市公安局丰台分局副局长郑威在10日的新闻发布会上介绍说，今年8月初，警方侦查发现，位于北京南三环一栋大厦内的某收藏品文化交流中心，涉嫌非法获取公民个人信息，实施违法犯罪活动。该公司机构庞大、组织严密。</p>\r\n<p>据侦破此案的警方介绍，该公司拥有400多名员工，下设23个部门，其中技术部被称为公司的核心机密部门，有7名员工，他们每天的任务是通过互联网等途径盗取大量公民个人信息，再经过分析梳理汇总后，输送到公司本部，分发到各个营销部门。为逃避打击，技术部的办公地点远离公司本部。</p>\r\n<p>警方调查发现，该公司推销的所谓收藏品均是从旧货市场、集币市场、纪念品制造厂家廉价收购的，这些低价的钱币、古玩，经过精美包装，配上公司自制的收藏证书，向客户高价销售。</p>\r\n<p>该公司招聘的近300名话务员经过培训，按照盗取的公民信息，用掌握的话术技巧虚构藏品价值，诱骗客户购买。每名话务员每天至少拨打200个以上电话进行推销。从查获该公司相关数据显示，其交易量3万余笔，交易额上亿元人民币。</p>\r\n<p>经审查嫌犯交代，涉案公司总裁为辽宁省人韩某，日常管理由张某等3个副总裁负责。目前，张某及400余名员工正在接受警方调查。警方对在逃的韩某展开抓捕。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('26', 'text', '<p>&nbsp;</p>\r\n<p>11日凌晨开始，北京雷雨大作，持续一夜，至9时许雨量减弱，天气转阴。北京市气象台发布消息称，11日白天到夜间，北京将有大到暴雨，并伴有雷电。尤其是傍晚至夜间，雨势较大，山区须注意防范地质灾害。</p>\r\n<p>降雨带来了些许清凉，一解前几日的持续暑热。11日一早，许多市民趁雨停了，纷纷出门采买，但整个京城仍然雾气朦胧，略显闷热。北京市气象台值班室相关人员表示，虽然已经立秋，但是三伏天还没结束，雨后的天气闷热感依旧较明显。</p>\r\n<p>11日7时35分，北京市气象台发布雷电黄色预警信号称，预计大范围的降雨自午后开始，傍晚到夜间雨势更加明显，最低气温23摄氏度。</p>\r\n<p>针对降雨可能带来的地质灾害，北京市国土局和气象局9时30分联合发布地质灾害气象风险黄色预警，预计11日白天到12日，北京市房山、门头沟、昌平、延庆、密云、怀柔、平谷等大部分山区，以及丰台、海淀、石景山部分浅山区发生地质灾害的气象风险较高，提示有关部门要加强监测、注意防范。</p>\r\n<p>北京市防汛办发出重点提示，请市民减少出行，注意交通安全，山区防山洪、滑坡、泥石流地质灾害。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('27', 'text', '<p style=\"text-indent: 2em\">作为淘宝最知名的团购平台，2011年是聚划算的爆发年，而历经反腐门之后，重新出台的聚划算团购服务竞拍规则(俗称&ldquo;坑位费&rdquo;)出台至今就重创了不少中小商家。</p>\r\n<p style=\"text-indent: 2em\">据聚划算官网显示，其竞拍时间为每天上午10：00-11：00，竞拍起拍价为人民币1000元，单次加价幅度为100元及其整数倍，参与聚划算竞拍的卖家应在竞拍前在支付宝账户中冻结1000元保证金。看似门栏低的竞价规则，在一轮轮商家疯狂竞价之后，从几万飙升至几十万，外加聚划算要收的1%到3%不等的佣金，中小商家叫苦不迭。</p>\r\n<p style=\"text-indent: 2em\">&ldquo;很多小卖家上了聚划算，但是卖了几十套、几百套的很多，付坑位费还不够。&rdquo;上海柔仕个人护理用品有限公司王文彬对《投资者报》记者说，&ldquo;聚划算流量是很大，但是类目细分的很厉害，分配给每个坑位的流量实际是有限的，其次聚划算的消费人群本身对价格敏感，如果价格比平时购买并无优势，消费者是不会买单的。&rdquo;</p>\r\n<p style=\"text-indent: 2em\">公开数据显示，2012年聚划算全年交易额207.5亿，是2011年2.03倍，但是分散到各个参与活动卖家却不甚乐观，加上不断上涨的高昂坑位费也影响了单品促销效果。2012年6月，聚划算在上线了品牌团、本地生活，每个品牌团商家平均销售额200万左右/期，最高达到700万(3天)，但品牌团销售额占整个聚划算的30%。</p>\r\n<p style=\"text-indent: 2em\">而随着参与聚划算平台的卖家利润不断挤压，聚划算早已沦为商家劣质产品集散地。&ldquo;据我认识的将近500个卖家，为了保持利润，基本都是压缩成本，在材料上偷换。做饰品的，基本都是拿好的去质检，然后</p>\r\n<p style=\"text-indent: 2em\">用不好的材质去生产，聚划算基本都是问题产品。&rdquo;义乌市朵拓贸易有限公司电子商务韩姓总监对《投资者报》记者说。</p>\r\n<p style=\"text-indent: 2em\"><strong>聚划算成清仓专用</strong></p>\r\n<p style=\"text-indent: 2em\">&ldquo;现在的聚划算我的理解就是清库存才会去上。要不然有些商家竞价那么高，会愿意出的吗，而且谁也无法知道这个销量能否得到保障。&rdquo;上海简恋家居用品有限公司电子商务部运营主管陈明顿对《投资者报》记者感叹到。</p>\r\n<p style=\"text-indent: 2em\">2012年上半年，聚划算从原来免费的模式开始变为竞拍坑位。之前只要跟店小二合作就能开展团购，这导致了一定程度上的内部腐败，之后随着<!--keyword--><span><a class=\"a-tips-Article-QQ\" href=\"http://stockhtm.finance.qq.com/hk/ggcx/01688.htm\" target=\"_blank\"><!--/keyword--><font color=\"#00479d\"><font face=\"微软雅黑\">阿里巴巴<!--keyword--></font></font></a></span><!--/keyword-->反腐，把聚划算的游戏规则重新改写。不过，这个改写也屡遭诟病。</p>\r\n<p style=\"text-indent: 2em\">&ldquo;以前行贿小二，跟小二商量，比如给一万，再拿几个点的提成，如果销量不好，就不需要付那么多的钱。跟之前比，当然是坑位费成本高，现在搞得跟赌博一样。&rdquo;上述韩姓总监愤慨到。</p>\r\n<p style=\"text-indent: 2em\">坑位费的水涨船高，挫败了中小商家，王文斌表示，现在的坑位费导致的是小卖家基本都处于观望的状态，当然对运营能力较强的大卖家而言，几乎没有影响。&ldquo;过去的坑位费大家都比较盲目，上什么都能赚钱，现在坑位费过高了，必须考虑投入产出，对商品销售做合理的预测。&rdquo;电子商务观察员鲁振旺对记者解释道。</p>\r\n<p style=\"text-indent: 2em\">收费竞拍坑位后，中小商家基本上不寄希望能赚钱，只是想处理自己推广不动的商品，而其实如果能做到清库存也不失为一件好事，但即使这样，也未必能如愿。如果上以前去聚划算是为了拉高销量，那现在的情境则完全会让商家绝望。</p>\r\n<p style=\"text-indent: 2em\">&ldquo;不是说销量提升，是销量比原来降了三分之一多，个别类目也有降了一半多。&rdquo;对比竞拍之后的销量变化，上述韩姓总监如此说道。当然他不是最惨的，他认识的一个做化妆品的同行，做聚划算根本没有销量，最后被逼无奈只能自己在十一点刷了五百多单。</p>\r\n<p style=\"text-indent: 2em\">2011年6月开始在聚划算做的韩总监见证了淘宝卖家在这个平台上的流失。他的一个淘宝卖家群有575个淘宝店主，覆盖将近两千个店面，但现在还依然做聚划算的寥寥无几了，除了清库存以外，卖家基本不会再去做聚划算了，而他负责做的几个店早已对聚划算敬而远之。</p>\r\n<p style=\"text-indent: 2em\"><strong>平台急于变现堵死中小商家 </strong></p>\r\n<p style=\"text-indent: 2em\">利用聚划算打造爆款的模式已经过去了，而现在，若想要把库存变现金，聚划算定是好平台，尤其对于有运营能力的卖家，聚划算几乎可以完美解决库存管理难题。</p>\r\n<p style=\"text-indent: 2em\">目前，在淘宝上能给到的流量最多的入口依然是聚划算，而其他的入口几乎都没能转化那么多的存货，但现在单品销售数量跟以前差距太大，以前能上万销量出现的单品，现在已属罕见。</p>\r\n<p style=\"text-indent: 2em\">并且昂贵的坑位费，还有三个点的佣金，加上第一次上聚划算还必须要如淘宝仓库发货，而这里比卖家自行合作的快递价格平均一件多2块左右。</p>\r\n<p style=\"text-indent: 2em\">昂贵的成本，有限的入口，中小卖家生存艰难。&ldquo;之前聚划算是一个快速回笼资金，打造爆款的平台，大家爱之不及，现在只要有正常商业头脑的中小商家对聚划算也逐渐恢复到了正常的心态吧。&rdquo;王文斌说。</p>\r\n<p style=\"text-indent: 2em\">取消坑位费的呼声一直都很高。王文斌认为，&ldquo;淘宝可以转为提高销售提成的方式，这样卖家定价可以更低，且卖家也不存在上一次聚划算亏一次的情况。&rdquo;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('28', 'text', '<p>&ldquo;这是今年最值得向大家推荐观测的流星雨&rdquo;，北京天文馆馆长朱进前日发微博&ldquo;推介&rdquo;即将于13日凌晨迎来极大值的英仙座流星雨，是日恰逢七夕。但天气预报显示，届时北京将以阴雨天气为主，市民能否一睹年度最佳流星雨，还要看天公是否做美。</p>\r\n<p>据国际流星组织(IMO)估计，今年英仙座流星雨的高峰期将在北京时间8月12日21：15至8月13日早晨9:45之间，极大峰值将出现在13日凌晨2:15至4:45之间，有望迎每小时约100颗流星。</p>\r\n<p>此次英仙座流星雨大爆发恰逢&ldquo;中国情人节&rdquo;七夕当日，而中国正好位于最佳观测区，因此备受网友关注。北京天文馆馆长朱进昨日告诉本报记者，13日凌晨的郊外，是北京观测流星雨的最佳时间和地点，但关键是天气。朱进10日通过看晴天钟预测，北京西北方向、内蒙古中部、宁夏、山西北部、陕西北部等地天气或将不错，观测条件好的话每小时肉眼可看到50颗以上的流星。</p>\r\n<p>但朱进表示，夏天天气多变，12日后半夜具体何地适合观测，还需根据今天最新的天气预报来判断，一般情况下北京地区总会有相对晴朗的地方可看到星空。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('30', 'text', '<p style=\"text-indent: 2em\">据美联社3月18日报道，瑞典智库斯德哥尔摩国际和平研究所(SIPRI)18日称，中国已取代英国成为世界第五大常规武器出口国。</p>\r\n<p style=\"text-indent: 2em\">SIPRI在报告中称，中国在过去5年(2008-2012)中武器出口总量增长了163%，国际军火市场占有份额从2%增至5%，同时排名也从之前的第八升至第五。</p>\r\n<p style=\"text-indent: 2em\">报告称，中国武器的最大买家来自巴基斯坦，其购买量占到中国常规武器总出口量的55%，紧随其后的是缅甸和孟加拉国，在中国武器出口中的占比分别为8%和7%。</p>\r\n<p style=\"text-indent: 2em\">针对国际社会对近年来中国武器出口的关注，中国国防部发言人耿雁生曾表示，中国在武器出口问题上，一直严格遵循三项原则：一是有助于接收国的正当防卫能力;二是不损害有关地区和世界的和平、安全与稳定;三是不干涉接收国的内政。耿雁生表示，中国严格遵守<span class=\"infoMblog      \">联合国</span>有关决议，建立了一套完备的军品出口管制法规体系，武器出口都是合法的、负责任的。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('32', 'text', '<p style=\"text-indent: 2em\">据《温哥华太阳报》等多家加拿大媒体17日报道，在因华人众多被称为&ldquo;小香港&rdquo;的加拿大不列颠哥伦比亚省列治文市，当地市民抱怨该市&ldquo;中文招牌广告过多&rdquo;，并发起要求市府出台限制令的联名请愿活动，引起激烈争议。不少学者认为，政府对商家的招牌进行管制有&ldquo;文化歧视&rdquo;之嫌，违背加拿大各民族平等的政策。</p>\r\n<p style=\"text-indent: 2em\">报道称，两位居民花了8个月对该市中文店标进行取证，认为&ldquo;纯中文标语太多&rdquo;、&ldquo;对不懂中文者十分不便&rdquo;、&ldquo;会增加种族隔离和抹掉加拿大身份&rdquo;，称倘若政府不加管制，不久该市将&ldquo;完全看不到英文&rdquo;。列治文市人口不到20万，其中亚裔占60%以上，华裔比例高达43.6%，是亚洲以外华裔比例最高的城市。资料显示，在列治文市以汉语、粤语、闽南话等中国语言为母语的常住居民比例高达40.9%，首次超越英语为母语的居民，后者比例为36.5%。</p>\r\n<p style=\"text-indent: 2em\">有意见认为华裔应&ldquo;入乡随俗&rdquo;，融入主流社会。但另一派意见认为，列治文自1990年建市开始，华裔就是主角，而加拿大也是个尊重少数族裔的多元文化社会。该市政府官员16日称，商家用什么样的招牌和市场有关，政府采取强制行为不妥当。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('33', 'text', '<p style=\"text-align: center; text-indent: 2em\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130318085043_oos13e.jpg\" /></p>\r\n<p style=\"text-align: center; text-indent: 2em\"><span style=\"font-size: 12px\">事故现场照片（翻拍自案卷</span></p>\r\n<p text-indent:=\"\">在高速上失控撞<a class=\"a-tips-Article-QQ\" href=\"http://data.auto.qq.com/car_serial/186/index.shtml\" target=\"_blank\">捷达</a> ，捷达车内一家四口身亡。司机和死者家属都认为事故系爆胎造成，肇事人月底前将来京申诉；死者家属近期也将起诉锦湖公司索赔。</p>\r\n<p style=\"text-indent: 2em\">此前，司机曾起诉锦湖轮胎公司，并申请鉴定轮胎质量。虽然3份证人证言、5份公检法出具的法律文书均证实爆胎引发车祸，鉴定机构却避开质量问题，推翻生效文书，称&ldquo;车祸导致爆胎&rdquo;，导致司机败诉。</p>\r\n<p style=\"text-indent: 2em\">肇事司机的律师质疑鉴定结论&ldquo;太荒唐&rdquo;。鉴定机构对此回应，&ldquo;对鉴定有异议，让法院来找我&rdquo;。</p>\r\n<p style=\"text-indent: 2em\"><strong>突发祸事出车祸一家四口全部身亡</strong></p>\r\n<p style=\"text-indent: 2em\">2010年8月11日晚上，74岁的胡振兴老人接到电话：大女儿胡彦军一家出车祸了。</p>\r\n<p style=\"text-indent: 2em\">京沈高速上，一辆车失控冲过隔离栏到马路对面，撞上胡彦军的车子，她的捷达车随后起火。44岁的胡彦军、她43岁的丈夫、她20岁的大女儿和17岁的小女儿都被烧死。</p>\r\n<p style=\"text-indent: 2em\">老人在房山区长沟镇东甘池村的家中接受了记者采访。他说，他有四个子女，大女儿一直是他的骄傲。&ldquo;女婿开了个石板厂，经济上挺富裕。夫妻俩感情也好，也孝顺，每周都给我来电话。两个孩子，从小就爱在我身旁撒娇。&rdquo;</p>\r\n<p style=\"text-indent: 2em\">老人说：&ldquo;那些天好难熬。早晨没等起床我就大哭一场，一整天眼泪围着眼眶转。猜测着事故的严重程度，我感觉床周围是万丈深渊，晚上靠安眠药才睡了半宿。&rdquo;</p>\r\n<p style=\"text-indent: 2em\">他把头仰在沙发上，睁大了眼睛叹气。&ldquo;女婿事业心强，想转行做更大的生意。转产之前想去外地放松一下，就去北戴河了。&rdquo;</p>\r\n<p style=\"text-indent: 2em\">&ldquo;俩孩子本来不想去，爹妈说光是大人没兴致，硬拉走了。玩了几天俩孩子觉得没意思，吵着要走，于是提前往回赶。谁承想&hellip;&hellip;&rdquo;</p>\r\n<p style=\"text-indent: 2em\"><strong>追忆经过15分钟行车逆转命运</strong></p>\r\n<p style=\"text-indent: 2em\">肇事司机苏琳是个1985年出生的兰州女孩。维权的不顺利已经让她对外界产生怀疑，坚持要求当面采访。3月8日晚，记者乘机飞抵兰州，次日上午与苏琳会面。</p>\r\n<p style=\"text-indent: 2em\">3月9日是个沙尘天，天色昏暗，路人戴着口罩来去匆匆。下午2点，一个一身黑衣的高个子女孩在朋友的陪同下，来到记者下榻的兰州航空大酒店一楼。这比约定的时间晚了一小时。苏琳不好意思地解释：为了多挣些钱，她周末也在加班，现在是请假出来的。</p>\r\n<p style=\"text-indent: 2em\">采访是在附近一家茶馆里进行的。苏琳拿着厚厚的茶水单看了很久，半天没说话。记者意会，随即主动选了一壶最便宜的茶水，并表示将会买单。苏琳的神色有些尴尬。她自嘲地说，车祸把她的命运逆转，她已经很久没过白领的生活了。</p>\r\n<p style=\"text-indent: 2em\">在北京读完大学，苏琳先在一家公司当白领，之后辞职经商。她说，出事前，她的生意挺红火。</p>\r\n<p style=\"text-indent: 2em\"><img alt=\"事故现场照片（翻拍自案卷\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130318084927_1siuwe.jpg\" /></p>\r\n<p style=\"text-align: center; text-indent: 2em\"><span style=\"font-size: 12px\">事故现场照片（翻拍自案卷</span></p>\r\n<p style=\"text-indent: 2em\">细细地喝了一口茶，她说出了当年的梦想：努力工作多挣钱，将来把兰州的房子卖掉，在北京买房，把父母接过来一起生活。</p>\r\n<p style=\"text-indent: 2em\">命运的转变发生在2010年8月11日。当天上午，苏琳的生意合伙人、东北女孩刘由迪开着她的华晨骏捷回抚顺老家。苏琳的姨家也在抚顺，于是苏琳和父母搭上刘由迪的车去串亲戚。</p>\r\n<p style=\"text-indent: 2em\">苏琳说：&ldquo;我们一路走京沈高速。开到第一个服务站后休息了会儿。之后我说一个人开车太累，就把刘由迪换下来了。结果，开了15分钟就出事了。&rdquo;</p>\r\n<p style=\"text-indent: 2em\"><strong>多方证实接受讯问司机坚称爆胎致祸</strong></p>\r\n<p style=\"text-indent: 2em\">苏琳说，当时自己已有两年驾龄。虽然车不是自己的，但因为刘由迪和自己一起租房生活，自己平时经常开她的车，对性能很熟悉。</p>\r\n<p style=\"text-indent: 2em\">讯问笔录显示，苏琳始终供述是爆胎导致车辆失控。她对警方表示：&ldquo;当时的车速大约是100迈。突然不知道怎么回事，感觉车跑偏了。当时刘由迪喊车偏了，车就撞到左侧护栏上了，之后我就什么都不知道了。&rdquo;</p>\r\n<p style=\"text-indent: 2em\">接受采访时，苏琳再次证实了这一点。</p>\r\n<p style=\"text-indent: 2em\">&ldquo;当时我们都晕过去了。我爸第一个醒过来，把我们救了出去。我妈大腿股骨头粉碎性骨折，我左脚根骨粉碎性骨折、脊椎第三节骨折，胸腔有三根骨头断了。&rdquo;尽管已经时隔几年，但说到这里，苏琳还是有些激动，语速也快了起来。</p>\r\n<p style=\"text-indent: 2em\">苏琳说，大家从车里出来后，发现前面有辆白色捷达着火了。</p>\r\n<p style=\"text-indent: 2em\">&ldquo;我爸打电话报了警。他想拿灭火器救火，但我们的车门已经打不开了。很快，那辆车的火势到了人没法接近的地步。&rdquo;她说。</p>\r\n<p style=\"text-indent: 2em\">苏琳说，她被送进医院、民警向她问话的时候，她才得知是自己的车撞了对方。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('34', 'text', '<p>6日晚，在昆明市白龙路一自助银行里，来取钱的刘老师站在柜员机前捣鼓了半天&mdash;&mdash;卡插不进去，他在柜员机上随便按了&ldquo;5000&rdquo;，谁知50张百元钞票就吐到了他面前。机器出了问题？他又按了&ldquo;5000&rdquo;，又有5000元吐到了手里。仔细一查，发现柜员机里原来已有一张银行卡，刘老师忙报了警。经过盘龙公安分局东华派出所民警的寻找，次日找到了卡的主人。</p>\r\n<p>　　6日当晚10点30分许，刘老师来到自助银行取款。掏出卡往自动存取款机上塞却塞不进。再塞，还是一样。难道柜员机出问题了？他试着输入了5000，按照柜员机提示按下&ldquo;取款&rdquo;，随着机器&ldquo;嗒嗒&rdquo;的声音，钞票盖打开，一沓钞票就在眼前。这是不是假钞呢？刘老师愣了一会，再试，又出来5000元。难道天上真会掉馅饼，经过一番检查，原来是柜员机里有一张银行卡。取出卡后，他用自己的卡进行了存取款&ldquo;试验&rdquo;，发现机器没问题，而是粗心人忘记取走银行卡。</p>\r\n<p>　　面对这个天上砸下的馅饼，刘老师没有犹豫，直接拨打110报警。当东华派出所民警赶到银行时，他把1万元现金和银行卡一并交给了警察，并请民警一定要找到失主。</p>\r\n<p>　　次日下午，在昆明开火锅店的刁女士接到东华派出所打来的电话，说她的银行卡和1万元现金被好心人拾到，请到派出所核实领取时，她很惊讶，自己的卡怎么会到了派出所？前一晚，火锅店打烊后，她将银行卡交给两名店员，带着当天的1万元营业款去银行存起来。10点半时，到了白龙路自助银行，一名店员站在旁边玩着手机，另一名数着钱。存款完成后，两人拿了凭条就离开了自助银行。</p>\r\n<p>　　15日下午，刁女士特地带着一封感谢信和一面锦旗，来到东华派出所，并从民警手中接过现金和银行卡。刁女士说：&ldquo;银行卡上有近10万元存款，也怪员工太粗心大意了，太感谢刘老师了！&rdquo;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('35', 'text', '<p>&nbsp;</p>\r\n<p>31省市男女最理想伴侣地图出炉</p>\r\n<p>首选嫁京男&nbsp;最爱娶川妹</p>\r\n<p>超五成的青年择偶时首选本地人；女性最想嫁的外省人中，北京男最受欢迎；男性则最想娶川妹子。</p>\r\n<p>记者上午获悉，零点指标数据进行2013年七夕主题调查，对全国各地1074位18至45周岁的网民进行随机访问，绘出31省市青年男女最理想伴侣地图。调查还显示，八成人打算庆祝七夕，比例超过西方情人节。</p>\r\n<p>半数择偶爱&ldquo;窝边草&rdquo;</p>\r\n<p>对&ldquo;您最想娶/嫁哪个地区的姑娘/男人&rdquo;选项的统计结果显示，54.5%男性和57.7%女性首选与自己家乡省份相同的人。</p>\r\n<p>在选择外省人作为理想伴侣的人中，选择南方姑娘和选择北方男人的比例相对较高；地理位置偏远的新疆、西藏、青海、甘肃、宁夏、贵州、广西等省区的女性和男性，被选中的比例最低。</p>\r\n<p>北京爷们儿成首选老公</p>\r\n<p>除去同乡人的吸引，最想嫁的男人当中，北京爷们儿排在第一位，并列第一的还有以&ldquo;小男人&rdquo;著称的上海男，都有15.2%的女青年首选。</p>\r\n<p>接下来受欢迎的依次是四川、黑龙江和辽宁男人。</p>\r\n<p>如果将女青年分成普通女青年和文艺女青年。那么其中，普通女青年偏爱北京爷们儿，占14.8%，文艺女青年更爱上海老公，占13%。</p>\r\n<p>娶妻偏好&ldquo;麻辣味&rdquo;</p>\r\n<p>男人最想娶的外省女性是四川妹子，占13.6%。</p>\r\n<p>接下来受欢迎的依次是浙江、江苏的姑娘。</p>\r\n<p>同属&ldquo;麻辣味&rdquo;的重庆姑娘，排名第四，占8.9%；北京姑娘居第五。</p>\r\n<p>网传旺夫的山东妹子只排到了第11位，占3.3%，竟未进入前十，其受欢迎程度与东北三省中的辽宁姑娘相当。</p>\r\n<p>怎么过七夕</p>\r\n<p>八成不满意</p>\r\n<p>伴侣表现怎么样？</p>\r\n<p>今天是七夕，此次调查结果显示，超过八成城市居民表示，如果有另一半会共享七夕节，超过选择过2月14日西方情人节75.9%的比例。</p>\r\n<p>不过，在有共度七夕节经历的情侣或夫妻中，却有高达79.8%的受访者对另一半在往年七夕当天的表现不满意。</p>\r\n<p>整日陪伴</p>\r\n<p>最想要什么礼物？</p>\r\n<p>零点调查发现，七夕情侣间最期待惊喜榜榜首的是&ldquo;整天时间陪伴在一起&rdquo;，占18.5%。分列二三位的七夕惊喜是：爱人下厨，占14.8%；一次旅行，占11.6%。</p>\r\n<p>而最多的惊喜礼物是&ldquo;亲自下厨&rdquo;，占20.2%，其次有13.5%的人选择送&ldquo;衣服/鞋/包&rdquo;，送&ldquo;手工礼物&rdquo;的占11.6%、&ldquo;旅游&rdquo;占10.7%。而最受期待的&ldquo;在一起&rdquo;并未得到人们的重视，仅有8.6%的人打算整天陪伴爱人。</p>\r\n<p>文/记者王婷婷</p>\r\n<p>中国情人节新人领证未见高峰</p>\r\n<p>上午全市仅千对</p>\r\n<p>七夕婚登门前&ldquo;稀&rdquo;</p>\r\n<p>本报讯（记者陈斯夜线报道组实习生柯竞）今天是&ldquo;中国情人节&rdquo;七夕，恰逢8月13日谐音&ldquo;不要散&rdquo;，民政部门按照婚姻登记高峰做准备，却未见新人扎堆儿领证。</p>\r\n<p>截至上午11点，全市婚登的新人约1000对，不及&ldquo;2013.1.4&rdquo;那天。</p>\r\n<p>昨天下午，朝阳区民政局结婚登记处预计七夕会有500对新人前来领证，特意准备好千张证书，并为了加快新人领证的速度，提前给证书上加盖好婚姻登记专用章，盖好印章的证书堆成了小山。</p>\r\n<p>今晨7点半，记者来到朝阳区婚姻登记处，已经有14对新人在门外分两队等待，右侧是已经在网上预约登记的，左侧则是未预约直接来的。</p>\r\n<p>为了应对预计可能出现的登记高峰，工作人员提前一个小时开始办理。但此时在门口等待登记的新人，没有了往日排大队的强大阵容。</p>\r\n<p>8点05分，第一对办好结婚证的闫先生和刘小姐微笑着携手而出，&ldquo;我们大概提前半个月在网上预约的，今天早上五点多就来了。感觉特别快，不到2分钟就办完了&rdquo;。</p>\r\n<p>不到10分钟，所有排队等候的新人全部拿到了结婚证。</p>\r\n<p>官方解析</p>\r\n<p>对传统节日里领证不感冒？</p>\r\n<p>朝阳区婚姻登记处负责人金先生表示，现在除了情人节、七夕节等传统的结婚登记吉日，5.20、9.9等谐音吉日也越来越受到年轻人的追捧。今年朝阳区在网上预约七夕当天登记结婚的新人有70多对，较往年有所减少。其主要原因是被其他好日子给分流了。</p>\r\n<p>像上周的8月8日人就比较多，2013.1.4世纪结婚日，零点刚过就开始办理了，当日全市有6000对新人领证。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('36', 'text', '<p>根据中国社科院相关机构进行的&ldquo;中国公民政治文化&rdquo;问卷调查：90．03％被调查者对&ldquo;作为中国人，我很自豪&rdquo;持赞同态度；72．23％被调查者认同&ldquo;中国传统文化对个人具有很大的影响&rdquo;。该调查在全国10个省份进行，获得6159份有效样本。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('37', 'text', '<p style=\"text-indent: 2em\">北京时间3月18日消息，据国外媒体报道，市场分析师当前普遍预计，在股价经历了连续下挫之后，<span onmouseover=\"ShowInfo(this,&quot;AAPL.OQ&quot;,&quot;200&quot;,&quot;-1&quot;,event);\">苹果</span>可能会宣布把季度派息上调一半以上，来提振公司股价。</p>\r\n<p style=\"text-indent: 2em\">市场分析师当前平均预计，苹果将把季度派息提高56%，达到每股4.14美元。这一调整将让这家公司每年派息达到157亿美元。不过由此产生的年3.7%的股息率，将会超过86%派息的标准普尔500指数成份股。投资银行Piper Jaffray分析师基恩&middot;蒙斯特（Gene Munster）就此认为，苹果能够在动用海外利润的情况下，使用现有现金流完成派息。</p>\r\n<p style=\"text-indent: 2em\">面临着把持有的1371亿美元现金和投资中的大多数返还给股东这一压力的苹果首席执行官蒂姆&middot;库克（Tim Cook），在去年3月份宣布恢复派息，已经一项100亿美元的股票回购计划。随着增长速度的放缓及面临<span class=\"infoMblog\">三星电子</span>等公司的激烈挑战，包括绿光资本的大卫&middot;埃因霍温（David Einhorn）等投资人，已经要求苹果把更多的现金返还给股东。</p>\r\n<p style=\"text-indent: 2em\">Topeka Capital Markets分析师布莱恩&middot;怀特（Brian White）就此表示，&ldquo;苹果贮备的现金有点太多。无论是什么样的熊市，这家公司也不需要这么多的现金。&rdquo;怀特在投资者报告中给予苹果股票&ldquo;买入&rdquo;评级，并将目标股价定为888美元。</p>\r\n<p style=\"text-indent: 2em\">苹果股价上周五在纳斯达克证券市场上涨2.6%，报收于443.66美元。自该公司股价在去年9月19日创出历史最高价至今，其股价累计跌幅已经达到了37%。标准普尔500指数同期的累计涨幅为6.8%。</p>\r\n<p style=\"text-indent: 2em\"><strong>返还现金</strong></p>\r\n<p style=\"text-indent: 2em\">许多公司都每年一次宣布对派息进行调整，随着距苹果去年3月19日宣布派息周年的即将来临，有关库克将会宣布什么计划的猜测逐渐增多。在经历了连续17年的不派息之后，库克在去年打破了苹果联合创始人史蒂夫&middot;乔布斯（Steve Jobs）保留现金的传统，开始向股东派发现金。</p>\r\n<p style=\"text-indent: 2em\">彭博社的统计数据显示，市场分析师当前平均预计，苹果季度派息将在3.31美元至5.30美元之间。</p>\r\n<p style=\"text-indent: 2em\">苹果表示，该公司一直就如何管理现金问题进行积极的讨论，并考虑股票回购和其它一些选择。苹果发言人史蒂夫&middot;道林（Steve Dowling）对于公司未来的派息和股票回购项目未置可否。</p>\r\n<p style=\"text-indent: 2em\">给予苹果股票&ldquo;买入&rdquo;评级的<span onmouseover=\"ShowInfo(this,&quot;ORCL.OQ&quot;,&quot;200&quot;,&quot;-1&quot;,event);\">甲骨文</span>投资研究公司（Oracle Investment Research）首席市场策略家劳伦斯&middot;巴尔特（Laurence Balter）表示，苹果今年的现金余额将增加400亿美元至420亿美元，其中在美国将产生大约150亿美元的现金余额。这意味着不需要从海外拿回现金支付高额的税款，苹果便能够使用现金余额完成派息。</p>\r\n<p style=\"text-indent: 2em\"><strong>市值下滑</strong></p>\r\n<p style=\"text-indent: 2em\">巴尔特表示，&ldquo;这家公司的市值下滑了近3000亿美元。任何一家美国或跨国公司出现这种情况，如果其首席执行官还无所事事的话，铁定将被辞退。&rdquo;</p>\r\n<p style=\"text-indent: 2em\">巴尔特预计，苹果可能宣布动用100亿美元进行一次性分红，并将季度派息提升至每股3.31美元。彭博社的统计数据显示，苹果2012财年的自由现金流为426亿美元，较上一年增加了28%。</p>\r\n<p style=\"text-indent: 2em\">持有苹果超过130万股股票的绿光资本，目前正敦促这家公司发行股息更高的优先股，从而把更多的现金返还给股东。绿光资本在上月举行的苹果股东大会中，成功的阻止了公司要求投资人批准停发优先股的决议。</p>\r\n<p style=\"text-indent: 2em\"><strong>返还资本</strong></p>\r\n<p style=\"text-indent: 2em\">苹果能够逐步增加其股息。彭博社预计，苹果能够把当前的季度派息增加13%，从每股2.65美元提升至3美元左右，让股息率达到2.7%。这一做法能够让苹果的股息率在同行中处于前列，仅次于<span onmouseover=\"ShowInfo(this,&quot;INTC.OQ&quot;,&quot;200&quot;,&quot;-1&quot;,event);\"><a class=\"a-tips-Article-QQ\" href=\"http://stockhtm.finance.qq.com/astock/ggcx/INTC.OQ.htm\" target=\"_blank\">英特尔</a></span>和<span onmouseover=\"ShowInfo(this,&quot;MSFT.OQ&quot;,&quot;200&quot;,&quot;-1&quot;,event);\"><a class=\"a-tips-Article-QQ\" href=\"http://stockhtm.finance.qq.com/astock/ggcx/MSFT.OQ.htm\" target=\"_blank\">微软</a></span>。彭博社的预期考虑到了其它大型科技公司的派息情况，以及苹果明年的每股收益和资产负债表中的现金数额。</p>\r\n<p style=\"text-indent: 2em\">巴克莱资本分析师本&middot;雷特兹（Ben Reitzes）表示，无论哪一种返回现金的方式，苹果都可以考虑举债完成，不需要动用海外的现金而支付高额的税款。在未来的三年时间里，苹果还能够把股票回购项目增加至300亿美元。</p>\r\n<p style=\"text-indent: 2em\">&ldquo;如果苹果完全使用自己的资产负债表，该公司有潜力让资本回报率提升一倍，&rdquo;雷特兹就此表示。该分析师给予了苹果股票&ldquo;持有&rdquo;评级，并将目标股价定为530美元。</p>\r\n<p style=\"text-indent: 2em\"><strong>估值打折</strong></p>\r\n<p style=\"text-indent: 2em\">彭博社的统计数据显示，在过去十年绝大多数的时间享受高溢价之后，该公司当前的市盈率较标准普尔500指数成份股的平均市盈率低出34%。</p>\r\n<p style=\"text-indent: 2em\">该统计数据还显示，苹果股价近期的暴跌，也让苹果的动态市盈率自2002年1月以来首次低于微软。彭博社的同时据显示，苹果当前的市盈率约为10倍左右；已经跌出全球十大最有价值公司排行榜的微软，市盈率约为11倍。</p>\r\n<p style=\"text-indent: 2em\">多年来，苹果持有现金的问题一直招致投资人的口诛笔伐。1995年，受管理层变动及PC市场份额下滑的影响，苹果暂停了派息。在1997年乔布斯重返苹果时，这家公司已濒临破产。随着他成功的推出iPod、iPhone和iPad等产品，苹果的现金余额开始逐步增多。</p>\r\n<p style=\"text-indent: 2em\">虽然苹果在去年宣布派息及股票回购，旨在解决持有现金不断增加的问题，但许多投资人一直要求苹果做的更激进一些。</p>\r\n<p style=\"text-indent: 2em\"><strong>投资人推动</strong></p>\r\n<p style=\"text-indent: 2em\">苹果公司股东之一的Capital Advisors Inc.首席执行官吉斯&middot;歌德达德（Keith Goddard）表示，&ldquo;坦白的讲，我对苹果为什么在这一问题上反应这么迟钝感到迷惑。&rdquo;歌德达德认为，苹果有可能会在今年年底宣布派息或股票回购计划，不过最早会在4月份发布第二财季财报时对外宣布。</p>\r\n<p style=\"text-indent: 2em\">彭博社的统计数据显示，苹果的三大机构投资人目前持有公司约1.334亿股股票。季度每股派息3美元，意味着它们每年将获得16亿美元股息。分析师怀特表示，&ldquo;增加派息能够向股价提供安全网。苹果必须吸引新投资人。提高派息是吸引新投资人的方式之一。&rdquo;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('38', 'text', '<p style=\"text-indent: 2em\">北京时间3月18日消息，据国外媒体报道，今天德国曼海姆地方法院宣布了对中国在德国的首次专利侵权诉讼的裁决结果，华为获得了对中兴的禁令，后者不再被允许在德国销售4G功能基站。</p>\r\n<p style=\"text-indent: 2em\">中兴获得了上诉法院下达的暂缓执行命令，但其更可能同意向华为支付版税。在德国提交的标准基本专利（SEP）诉讼中，华为虽然只有1起诉讼做出了裁决，但比三星更成功些，后者一直在起诉<span onmouseover=\"ShowInfo(this,&quot;AAPL.OQ&quot;,&quot;200&quot;,&quot;-1&quot;,event);\">苹果</span>，但在曼海姆的前三起诉讼都败诉，第四起诉讼暂缓审理（第五起诉讼是三星最可能获得赔偿的诉讼，但还未判决）。</p>\r\n<p style=\"text-indent: 2em\">诉讼中涉及的专利为专利号EP2273818有关&ldquo;导出密匙&rdquo;的专利，据悉是第四代移动通信标准&ldquo;长期演进&rdquo;（LTE）基础专利之一。华为赢得第1、7和 12项指控。法院的主审法官安德烈斯&middot;沃斯（Andreas Voss）和陪审法官伦巴赫和施密特裁定中兴停止销售这些基站及部件。</p>\r\n<p style=\"text-indent: 2em\">中兴可以对裁决提起上诉，但华为如果交了100万欧元（约合130万美元）保证金，在上诉期间可以强制执行。第7和12项指控是产品指控，即禁止出售或提供符合指控中所描述内容的设备，每违反1项可被判处蔑视法庭罪，最高可被罚款25万欧元（通常指的是发货给客户的每批次，而不是每件设备），或禁止经营最长六个月（在多次违反情况下最长两年）。</p>\r\n<p style=\"text-indent: 2em\">第1项指控是方法指控。只有在客户(在此案中指运营商）实际使用了中兴基站并在4G兼容模式下运行，才属于直接侵权。但如果他们仅在3G（UMTS）和GSM模式下使用，则不属于侵权。裁决为防止这种协助侵权，要求中兴做到在任何协议中&ldquo;明确和在突出位置表述&rdquo;客户需要从华为获得许可，只在客户（运营商）承诺向华为支付合同违约金5万欧元（或在多次侵权时每次最少支付2.5万欧元）。</p>\r\n<p style=\"text-indent: 2em\">今天的裁决证明了中国高科技行业存在创新。不过这也进一步表明，在曼海姆肯定可以赢得专利禁令，包括SEP专利。事实上，下周二<span onmouseover=\"ShowInfo(this,&quot;NOK.N&quot;,&quot;200&quot;,&quot;-1&quot;,event);\">诺基亚</span>很可能赢得在曼海姆对HTC的诉讼。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('39', 'text', '<p style=\"text-align: center; text-indent: 2em\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130318091017_f420oy.jpg\" /></p>\r\n<p style=\"text-indent: 2em\">北京时间3月18日消息，据国外媒体报道，夏普公司表示由于没有能够制定出<span onmouseover=\"ShowInfo(this,&quot;QCOM.OQ&quot;,&quot;200&quot;,&quot;-1&quot;,event);\"><a class=\"a-tips-Article-QQ\" href=\"http://stockhtm.finance.qq.com/astock/ggcx/QCOM.OQ.htm\" target=\"_blank\">高通</a></span>所规定的组装低能耗屏幕的方案，该公司将错失高通原计划于3月29日对夏普的第二轮投资。</p>\r\n<p style=\"text-indent: 2em\">芯片制造商高通于去年12月承诺向夏普投资1.2亿美元，并已支付一半金额。另外6千万美元的投资需在夏普完成智能手机和平板电脑屏幕的研发计划并能够投入生产的前提下支付。</p>\r\n<p style=\"text-indent: 2em\">同时高通规定夏普必须在其营业年的下半年获得营业利润，另外其净资产值也必须达到1千亿日元（约合10.5亿美元）。</p>\r\n<p style=\"text-indent: 2em\">夏普发言人中山美雪（Miyuki Nakayama）表示：&ldquo;财务上的目标并非此次高通延迟投资的原因。&rdquo;她还表示，高通对夏普的投资将会延迟至6月30日，在此之前夏普需满足高通设定的全部条件。</p>\r\n<p style=\"text-indent: 2em\">两家公司曾在去年12月对外表示，高通子公司Pixtronix将会和夏普一起合作以研发低能耗的铟镓锌氧化物（IGZO）显示器。</p>\r\n<p style=\"text-indent: 2em\">错失高通第二次投资将会为陷入资金困境的夏普公司增加更大的压力，目前夏普正在努力筹措资金以支付其在9月份到期的可转换债卷。另外，这家日本LCD面板制造商还未能够和台湾鸿海集团在新的谈判中达成协议，鸿海集团计划在3月26日之前购买夏普9.9%的股份，但双方的谈判很有可能无疾而终。</p>\r\n<p style=\"text-indent: 2em\"><span class=\"infoMblog\">三星电子</span>公司本月同意向夏普投资1.1亿美元，而夏普则要向其出售3%的股份并承诺会向三星提供面板。夏普一直为<span onmouseover=\"ShowInfo(this,&quot;AAPL.OQ&quot;,&quot;200&quot;,&quot;-1&quot;,event);\">苹果</span>的iPhoen5和iPad提供面板。</p>\r\n<p style=\"text-indent: 2em\">为了能够完成高通制定的财务目标，夏普的内部人士以及一些分析师表示他们希望夏普从其出售的资产和股票中获取足够的现金流和收益之后，采用发行股票筹资的方法以填补差额。</p>\r\n<p style=\"text-indent: 2em\">夏普还计划将其中国电视工厂出售给联想，将其墨西哥电视工厂出售给鸿海，并在和两家公司进行商谈。但夏普出售资产的能力不足，原因是在去年夏普已经抵押了其大部分的国内工厂和办公室以确保能从银行获得38亿美元的救济金。</p>\r\n<p style=\"text-indent: 2em\">信用评级公司给予夏普的&ldquo;垃圾&rdquo;评级也致使夏普在信用市场上的融资会较为困难。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('40', 'text', '<p>欢迎大家测试！</p>\r\n<p>&nbsp;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('43', 'text', '<p style=\"text-align: center\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130319005332_lmwkqx.jpg\" style=\"width: 670px; height: 300px\" /></p>\r\n<p>近日，有明星经纪公司爆料，唱遍大小春晚的&ldquo;农业重金属组合&rdquo;凤凰传奇，出场费已经涨到了60万/场，若加上代言，2012年约有1亿进账。1亿这个数字也许略有夸张，但实际收入肯定也不会少。网友们一边感叹农业重金属的力量不可小觑，一边又开始琢磨这么多钱他们怎么分呢？凤凰传奇经纪人接受采访时表示，&ldquo;玲花和曾毅早就签好协议，收入一人一半&rdquo;，这样一来，网友又有疑问了&mdash;&mdash;负责RAP部分的曾毅除了&ldquo;嘿、吼、喔、哈、切克闹&rdquo;就没别的词儿，难道也能分一半？这钱挣得也太轻松了吧！</p>\r\n<div>[PageBreak][/PageBreak]</div>\r\n<p>其实在娱乐圈，像凤凰传奇这样的&ldquo;人气搭档&rdquo;并不少，有的情比金坚，有的钱字当头，有的好聚好散，也有的老死不再往来。为此，腾讯娱乐采访了多位圈中资深人士，为大家八一八人气搭档&ldquo;分钱&rdquo;那点事儿。</p>\r\n<div>[PageBreak][/PageBreak]</div>\r\n<p>至于近几年大火的凤凰传奇，也是五五分成么？按网友的话说：&ldquo;女的唱得声嘶力竭，男的出来切克闹几句就下去了，如果平分亿元年收入，会不会太不公平？&rdquo;</p>\r\n<p>&nbsp;对此，凤凰传奇经纪公司总经理徐明朝回应称，&ldquo;从演唱角度看，玲花确实是主唱，但是从组合角度看，这是一个整体，没有主次之分。早在成名之前，他俩就已签好合约，无论将来赚多少都对半分。&rdquo;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('44', 'text', '<p style=\"text-align:center;\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130813072104_ur3e8y.jpg\" style=\"width: 640px; height: 426px; \" /></p>\r\n<p style=\"text-align:center;\">&nbsp;</p>\r\n<p>8月12日，羽泉(微博)(微信号：yuquanweixin&nbsp;)携专辑《拾伍》在京举办粉丝同乐会。而活动第二天&ldquo;七夕节&rdquo;恰好是胡海泉(微博)的生日，歌迷们不仅为海泉准备了礼物还送上蛋糕，倍受感动的海泉感慨道：&ldquo;对于羽泉来说，能在各位的陪伴和支持下一起走过的岁月就是最好的礼物。&rdquo;为了纪念出道15周年，羽泉还现场宣布将于9月7日和21日在泉州和深圳接力开唱，以实际行动回馈每一位歌迷的支持与喜爱。</p>\r\n<p style=\"margin: 0px 0px 29px; padding: 0px; font-size: 16px; line-height: 28px; font-family: 宋体, Arial, sans-serif; text-indent: 2em; \"><strong>聊high了 哥儿俩抢爆《拾伍》幕后花絮</strong></p>\r\n<p>现场，羽泉在主持人大鹏的介绍下出场，与大家分享了重唱集《拾伍》制作过程中的心路历程。&ldquo;老歌新翻，真不是一件容易的事儿，跟制作老师讨论编曲熬通宵变熊猫眼是常事儿&rdquo;，陈羽凡(微博)调侃道。</p>\r\n<p>由于专辑里大部分歌曲都是羽泉的老歌，而且几乎首首曾红极一时，所以此次回炉再造，不只是对羽泉，对其他幕后工作人员的压力也不小。机缘巧合下，羽泉在参赛《我是歌手》(观看)期间接触了来自日本的镰田老师，当时简短的交流，却奠定了此次专辑的合作。镰田几乎对羽泉组合进行了一次&ldquo;大手术&rdquo;，老歌里嗓音&ldquo;温润如水&rdquo;的海泉在这张专辑里嘶吼了起来，而&ldquo;高亢激进&rdquo;的羽凡反而展露了嗓音中更为细腻的一面。除镰田老师之外，担任乐手以及后期制作人员也都是日本乐坛数一数二的&ldquo;老江湖&rdquo;，很多人都是某一个曲风领域的绝对专家。在这些音乐人的合力之下，羽泉《拾伍》重唱集平衡了两个人的嗓音特点、平衡了原曲应有的风格和气质，所有的编曲也符合当下的音乐潮流，并且让大部分歌曲都焕然一新。而此次专辑是否算作翻新成功，得到了当天全体歌迷的一直认同。</p>\r\n<p style=\"margin: 0px 0px 29px; padding: 0px; font-size: 16px; line-height: 28px; font-family: 宋体, Arial, sans-serif; text-indent: 2em; \"><strong>玩疯了 与歌迷玩游戏不手软：&ldquo;吃苦瓜身体好&rdquo;</strong></p>\r\n<p>当天同乐会上的重头戏是玩游戏，经过前期活动选拔出来的十五对歌迷与哥俩分别成军大PK。成军十五年来，羽泉两人间的默契和感情一直为外界津津乐道，而此次活动设置的游戏也都是需要队员间默契协作方能完成的。无论是&ldquo;两人三足&rdquo;还是以羽泉为环绕点的&ldquo;比手画脚&rdquo;再加上行进的很艰难的&ldquo;终极战车&rdquo;，现场哥俩带领歌迷们玩疯了，两人对战起来毫不手软，互相放话互相拆台一点不客气，甚至不惜互相拆台以便&ldquo;打击&rdquo;对方的气势，比赛火热的同时笑声不断，熟男变&ldquo;活宝&rdquo;，最终输的一方接受了全队吃苦瓜的惩罚，&ldquo;在炎炎夏日，吃个清热解毒去火的绿色食物对身体好！&rdquo;</p>\r\n<p>羽泉承诺&ldquo;不离不弃&rdquo; 9月将于深圳开唱</p>\r\n<p>活动第二天是七夕情人节，正好是羽泉成员胡海泉的生日。所以，当天参加同乐会的歌迷也精心准备了礼物和蛋糕带到现场，并在最后的环节突然献上，疯狂的同乐会顿时变成了温馨的庆生会，海泉惊喜的同时也为歌迷的贴心举动感动不已。&ldquo;对于羽泉来说，能在各位的陪伴和支持下一起走过的岁月就是最好的礼物，现在我们已经顺利地走过了十五年，我们希望，未来的每一个十五年都可以像现在这样走过。&rdquo;当天，羽泉面对在场的歌迷郑重承诺：&ldquo;未来，不离不弃！&rdquo;</p>\r\n<p>在许下了生日的愿望之后，羽泉也为歌迷们送上了更大的&ldquo;回礼&rdquo;&mdash;&mdash;9月7日和21日，羽泉将在泉州和深圳接力开唱，以实际行动回馈每一位歌迷的支持与喜爱。&ldquo;用音乐给各位带来正能量是我们最擅长并会一直做下去的事，下一个十五年，请各位瞧好吧！&rdquo;</p>\r\n<p>&nbsp;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('45', 'text', '<p style=\"text-align: center; text-indent: 2em\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130319010512_e6pi7i.jpg\" style=\"width: 680px; height: 330px\" /></p>\r\n<p style=\"text-indent: 2em\">&ldquo;大家好，我是制片人杨幂。&rdquo;一身干练的黄色风衣，一句霸气外露的自我介绍，升级当了制片人的杨幂果然显现出女强人的气质。昨日，由其担任监制的都市时尚偶像剧《微时代之恋》在沪举行开机发布会，杨幂带着她钦点的男主角余文乐，以及她花费一年选出的八位新人齐齐亮相。腾讯网娱乐中心总监常斌到场助阵，宣布该剧官网正式落户腾讯娱乐。</p>\r\n<p style=\"text-indent: 2em\">在接受腾讯娱乐独家专访时，&ldquo;杨老板&rdquo;坦言自己这个初出茅庐的制片，在男友刘恺威(<span class=\"infoMblog\">微博</span>)(<span class=\"infoMblog\">微信号：hawicklaw</span>) 身上学到了很多东西。虽然这次她没有找刘恺威当男一号，但为了给女友的制片处女作保驾护航，刘恺威还全程跟随剧组前往巴厘岛，在片场化身超级助理和替身，打杂跑腿兼打气，让杨幂甜在心里。</p>\r\n<p style=\"text-indent: 2em\">虽说在事业上越做越大，杨幂却认为，自己离&ldquo;事业有成&rdquo;还很远。刘恺威年初已公开今年有迎娶杨幂的计划，她却不着急结婚，还想再谈谈恋爱。</p>\r\n<p style=\"text-indent: 2em\"><strong>&ldquo;事业有成&rdquo;离我很远 今年不着急结婚</strong></p>\r\n<p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：和林心如 (<span class=\"infoMblog\">微博</span>)、范冰冰(<span class=\"infoMblog\">微博</span>)等圈内&ldquo;演而优则制&rdquo;的女演员相比，你算是最年轻的一位女制片，为什么放着舒服的演员不当，要来挑制片重任？</span></p>\r\n<p style=\"text-indent: 2em\">杨幂：两三年前我没想过自己会拍电影，结果拍了，一年前我从没想过自己会当制片，现在也做了，我感谢每一个不可能的可能性发生在我身上。正好有一个机会摆在我面前，有人问我要不要做，我想，那就做吧。很多东西，我不一定完全有能力去做，好在身边有很多人帮我一起做，大家一起把梦想完成好，这是一个梦想照进现实的过程，我们都在努力！</p>\r\n<p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：有个情况挺有意思的，去年刘恺威担任制片人，邀请你做女主角的《盛夏晚晴天》去了法国拍，而你就去巴厘岛拍《微时代之恋》，是有心跟男友切磋还是别有苗头？</span></p>\r\n<p style=\"text-indent: 2em\">杨幂：我没有攀比的心思，正因为有《盛夏晚晴天》的班底和经验，才让我这次担任《微时代之恋》的制片非常顺手。如果他制片人做得成功，我当然为他开心，但我也有我的工作要做。我们在工作上是互相支持鼓励，也是相对独立的。</p>\r\n<p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：去年由刘恺威担任制片的《盛夏晚晴天》成绩喜人，他还筹备起第二部制片作品《一念向北》，你有向他取经吗？</span></p>\r\n<p style=\"text-indent: 2em\">杨幂：恺威是个很棒的制片人，我从他上耳濡目染学到了不少当制片人的经验，比如如何跟工作人员沟通，学会观察潜在的问题，现场遇到突发事件如何处理等等。但如果我碰到难题，自己能解决的还是想自己解决，毕竟遇到同一件事情，在别人那儿行得通的方法，在你这儿却未必合适。</p>\r\n<p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：为什么不找刘恺威主演，如果他演，一定愿意给你&ldquo;感情价&rdquo;的？</span></p>\r\n<p style=\"text-indent: 2em\">杨幂：为什么大家不会认为，他来，我不会给他更高的片酬？（笑）他有他自己的工作，我也会选择合适的人演剧中的角色，这次没有适合他的，等下次有了，我就找他。其实，我们不一定所有的事情都要绑在一起，当然我当制作人，他也会给我鼓励，为我加油。</p>\r\n<p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：身兼制片人和演员两职，应该挺辛苦吧，男友有没有来慰劳你？</span></p>\r\n<p style=\"text-indent: 2em\">杨幂：探过班，之前在巴厘岛的时候他有来帮忙。慰劳啊？他有来帮我演了一个后辈，因为有一场戏，和我对戏的演员没有在巴厘岛，我本来要和空气演戏，正好他在，就拉来搭了一场戏，不过还是会把他的镜头剪掉。</p>\r\n<p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：现在开起了工作室，还当了制片人，可说是&ldquo;事业有成&rdquo;了，想过结婚吗？</span></p>\r\n<p style=\"text-indent: 2em\">杨幂：&ldquo;事业有成&rdquo;这个词离我还挺远的，我还有很多东西没做到。我自身还有很多需要学习和补充的地方，还有很多专业知识是我不懂、也没有意识到的。而且，事业有成与结婚没什么关系，我会完全把工作与感情分开。</p>\r\n<p style=\"text-indent: 2em\"><span style=\"font-family: 楷体_GB2312\">腾讯娱乐：但是年初，刘恺威曾公开表示今年有迎娶你的计划，你今年没意向嫁他？</span></p>\r\n<p style=\"text-indent: 2em\">杨幂：没有，我想再谈谈恋爱吧，到现在我们其实都没吵过架。我们都希望能再相处一下，等我再成熟一些，但我想如果有一天走到那一步，应该就是这个人了。因为现在大家相处很好，磨合得也越来越有信心。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('46', 'text', '<p style=\"text-align:center;\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130813074431_fjvmu0.jpg\" style=\"width: 640px; height: 421px; \" /></p>\r\n<p>重庆，12日，《一夜惊喜》见面会。女神范冰冰(微博)(微信号：fbbstudio916&nbsp;)携李治廷空降山城重庆，在重庆各大影院轮番宣传最新电影《一夜惊喜》。电影中范冰冰和李治廷上演了姐弟恋，见面会现场，范爷霸气地将李治廷抱起来秀&ldquo;恩爱&rdquo;。当媒体问及范爷七夕怎么过时，范冰冰表示明天将在北京和&ldquo;那个他&rdquo;度过，那个他还出在考验期。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('47', 'text', '<p style=\"text-indent: 2em\">在上周六武汉卓尔与北京国安的比赛中，主裁判王迪先后错判国安外援格隆禁区内假摔，接着又漏判给故意踢人的卓尔球员柯钊红牌。中国足协裁委会赛后确认，王迪两次判罚属严重错、漏判。王迪面临停哨3至6场的重罚。据悉，王迪通过抽签获本场比赛执法资格后，足协曾有人提议由经验丰富的老裁判取而代之，但提议未被采纳。抽签定哨能保证裁判选派公平，但由此引发的&ldquo;昏、嫩哨&rdquo;现象却屡禁不止，而除了加大失误裁判惩处力度外，中国足协似乎也找不到更好的办法。</p>\r\n<p style=\"text-indent: 2em\"><strong>足协曾担心王迪成&ldquo;定时炸弹&rdquo;</strong></p>\r\n<p style=\"text-indent: 2em\">新赛季中超开幕前，中国足协技术部、裁委会在香河基地完成了中超前6轮的裁判抽签仪式。按照内部工作流程，足协技术部在每轮联赛之前，都会请职业联赛部门对当轮裁判人选提意见。据了解，足协有关人士曾公开反对王迪执法武汉卓尔与北京国安的比赛，这是因为上赛季国安与辽足、2011赛季国安与深足比赛，王迪都曾漏判给国安点球。足协内部有人形容王迪，有可能成为比赛的&ldquo;定时炸弹&rdquo;，但这一建议最终被拒，其理由是，王迪是中国足协7名国际主裁中的一员，也是年轻裁判的佼佼者。而卓尔与国安的比赛是本轮一场重要比赛。一旦更换他，可能会在国内裁判界造成一些不良影响，同时也不利于年轻裁判的培养。然而提议的足协人士不幸言中。</p>\r\n<p style=\"text-indent: 2em\"><strong>王迪受罚难阻&ldquo;昏哨&rdquo;继续现身</strong></p>\r\n<p style=\"text-indent: 2em\">由于王迪错判造成了不小影响，裁委会昨天就形成了评议意见。一位足协人士透露，王迪判罚格隆禁区内假摔、漏判柯钊红牌都是严重的判罚失误，他将面临最低3 场、最高6场的处罚。王迪并非本赛季首位受内部处罚的裁判。执法中超首轮鲁能与阿尔滨比赛的前国际主裁陶然成、执法富力与辽足比赛的年轻主裁傅明、执法揭幕战恒大与申鑫的国际助理裁判穆宇新、国安与东亚比赛的助理裁判 王峰4 人，都因出现重大错、漏判被停赛3场。今年，裁委会对职业联赛裁判工作提出了新要求，管理制度及上岗考核，较往年也更为严格，国家级裁判张正平就因未通过体测而被直接降级。足协人士指出，&ldquo;从前两轮中超执法情况看，年龄并不是裁判员犯错误的主要因素。我们感觉裁判错漏判，最大的问题还在于态度。如果准备不足、对执法工作的自律不够，王迪之后很可能还会出现其他&lsquo;昏哨、嫩哨&rsquo;。&rdquo;</p>\r\n<p style=\"text-indent: 2em\"><strong>抽签定哨 足协纠结 裁判埋怨</strong></p>\r\n<p style=\"text-indent: 2em\">一位足协人士指出，王迪出现错漏判表面上看，是缘于裁判自身业务水平和临场应变能力不足，但其背后却反映出&ldquo;抽签定哨&rdquo;的呆板。有裁委会人士曾诉苦说，&ldquo;假球、黑哨丑闻曝出后，中国足协在裁判选用上承受了巨大压力，抽签起码保证了裁判选用公平。&rdquo;但从2010赛季起至今，类似王迪这样的&ldquo;嫩哨&rdquo;不止一个，同样在2010赛季被破格提拔为国际主裁的小张雷就因经不起实践考验，于第二年被取消国际执法资格；另一位争议&ldquo;嫩哨&rdquo;马宁也多次被裁委会临时取消中超执法机会。一系列事实证明，这些被中国足协寄予厚望的年轻裁判并未完全得到信任。同时，中国足协抽签后改派的举动反而引起裁判圈的不满。一位裁判专家曾这样抱怨，&ldquo;安排抽签，却不按抽签结果派裁判，抽中的裁判不用，对裁判自身的心理打击很大。与其如此，还不如按国际惯例，完全指派裁判。&rdquo;抽签定哨有无必要延续下去，中国足协也的确有必要深思熟虑一番。文/本报记者肖赧(<span class=\"infoMblog\">微博</span>)</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('48', 'text', '<p>3月18日体育专电（记者林德韧）NBA(<span class=\"infoMblog  \">微博</span>)官方18日公布了最新一期的实力榜，拿下22连胜的迈阿密热火队当之无愧地继续排在榜首，圣安东尼奥马刺队和俄克拉荷马雷鸣队分居二、三位。</p>\r\n<p>　　在击败多伦多猛龙队之后，热火队保住了自己的不败金身，东区冠军的位置已经基本锁定，现在剩下的唯一悬念就是热火队的连胜还能持续多久。</p>\r\n<p>　　此前排名实力榜第三的马刺队在上一周展现了稳定的表现，与此同时也赢得了与俄克拉荷马雷鸣队之间的强强对话，排名超越雷鸣队排在了第二位。状态起起伏伏的雷鸣队下降至第三。</p>\r\n<p>　　排名本榜单第四至第十位的队伍分别是：掘金队、灰熊队、快船队、步行者队、凯尔特人队、湖人队、网队。</p>\r\n<p>　　上一周的亮点是湖人队，&ldquo;紫金军团&rdquo;在常规赛末段打出高水准，战绩提升至36胜12负，距离西区第七的休斯敦火箭队仅差半场，实力榜排名也从上一期的第十一上升至第九。</p>\r\n<p>　　休斯敦火箭队在一场关键对决中大比分负于竞争对手金州勇士队，西区前八的位置不再牢靠，实力榜排名从第十下降至第十一。</p>\r\n<p>　　排名本榜单第十一至第三十位的球队分别是：火箭、尼克斯、老鹰、公牛、小牛、勇士、雄鹿、爵士、奇才、开拓者、猛龙、骑士、森林狼、国王、太阳、76人、黄蜂、活塞、魔术、山猫。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('49', 'text', '<p style=\"text-align: center; text-indent: 2em\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130319011912_nqvbjh.jpg\" style=\"width: 550px; height: 390px\" /></p>\r\n<p style=\"text-indent: 2em\">在上周六中超联赛卓尔与国安比赛下半时，卓尔球员柯钊暴踢国安外援马季奇的举动在足球界引起了不小反响。中国足协裁判委员会今天也出具报告提请纪律委员会对柯钊追罚。据了解，纪委会很可能将柯钊的犯规定性为暴力行为。由于他及其俱乐部认错态度良好，中国足协将按照底线处罚柯钊，柯钊面临停赛2场、1万元左右的追罚。</p>\r\n<p style=\"text-indent: 2em\">电视慢动作显示，柯钊连续3次踢中马季奇，结果当值主裁王迪仅仅向柯钊出示了1张黄牌。虽然汉军最终饮恨主场，但是俱乐部上下深明大义，俱乐部代表及柯钊本人也都通过微博等渠道向外界及被踢的马季奇道歉。中国足协今天上午在总结上轮职业联赛时，重点提到了此事。据悉，裁判委员会的报告上写明，柯钊的行为属于暴力行为，理应被纪律委员会追加处罚。不过，足协内部有人认为，柯钊并非恶意伤人，只是因为本队比分落后，加之比赛时间所剩无几，他心情急躁，行为失控。</p>\r\n<p style=\"text-indent: 2em\">今晚有消息显示，柯钊将面临停赛4场、罚款2万的处罚，但是从中国足协传来消息显示，纪律委员会今天并没有开会具体商议此事。目前此事还停留在听取各方意见的过程中。但可以肯定的是，柯钊被追罚在所难免。一位足协官员表示，&ldquo;鉴于柯钊认错态度不错，他也是初犯，协会不会加重处罚他，但这个行为依然性质很严重，被停赛2场的可能性最大。&rdquo;至于格隆，虽然国安已经上诉，但纪律委员会依据国际惯例维持原判，红牌停赛不变。纪律委员会预计于明后两天内作出最终处罚结果。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('50', 'text', '<p style=\"text-align: center\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201303/20130319012259_khrjth.jpg\" style=\"width: 550px; height: 299px\" /></p>\r\n<p>北京时间3月15日晚，欧足联在瑞士尼翁总部进行了本赛季欧冠(<span class=\"infoMblog\">微博</span> 专题) 1/4决赛对阵形势抽签。杀进八强的三支西甲(<span class=\"infoMblog\">微博</span> 专题) 球队中，皇马(<span class=\"infoMblog\">官方微博</span> 数据) 抽中土超劲旅加拉塔萨雷，巴萨(<span class=\"infoMblog \">官方微博</span> 数据) 遭遇法甲大鳄巴黎圣日耳曼(<span class=\"infoMblog\">微博</span> 数据) ，马拉加(<span class=\"infoMblog\">官方微博</span> 数据) 则要迎接德甲球队多特蒙德的挑战。以下是部分西班牙媒体评论。</p>\r\n<p>《马卡报》：&ldquo;皇马的抽签结果相对来说不错，4月3日，主帅穆里尼奥将在伯纳乌球场迎来他的几位老朋友，他们分别是德罗巴(<span class=\"infoMblog\">微博</span>)、斯内德(<span class=\"infoMblog\">微博</span>)和大阿尔滕托普，德罗巴是穆里尼奥执教切尔西(<span class=\"infoMblog   \">官方微博</span> 数据) 期间亲自召入的爱将，斯内德是穆里尼奥率领国际米兰夺取三冠王时的关键球员，大阿尔滕托普也曾在皇马效力，这几人帮助加拉塔萨雷战胜了沙尔克04晋级，但面对皇马，他们的运气恐怕就没这么好了，唯一要小心的是他们的前锋伊尔马兹，这位土耳其人目前和C罗(<span class=\"infoMblog\">微博</span> 数据) 并列欧冠最佳射手。&rdquo;</p>\r\n<p>《世界体育报》：&ldquo;巴塞罗那与巴黎圣日耳曼的较量将是一次王者之争，淘汰赛看实力也要看运气，两支球队曾在1994-95赛季有过交手，当时输球的一方是巴塞罗那，不过在1996-97赛季的欧洲优胜者杯决赛中，巴塞罗那在荷兰鹿特丹战胜了对手捧起冠军奖杯，当时为巴塞罗那进球的是罗纳尔多。&rdquo;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('52', 'text', '<p style=\"text-indent: 2em\">尚德电力昨日宣布，公司已经收到3%可转债托管人的通知，即2013年3月15日到期的可转债仍有5.41亿<a class=\"a-tips-Article-QQ\" href=\"http://finance.qq.com/money/forex/index.htm\" target=\"_blank\">美元</a>的未支付金额，已经违约并要求尽快付款。该违约事件同时还导致尚德对包括国际金融公司和一些国内银行在内的其他债权人的交叉违约。</p>\r\n<p style=\"text-indent: 2em\">尚德电力也因此成为了中国大陆首家出现公司债务违约的企业。</p>\r\n<p style=\"text-indent: 2em\">公司表示，将继续努力进行重组，提高运营成本效率，保持与现有客户和供应商的良好关系，寻找其他的资金来源，以满足运营和债务偿还资金需求。</p>\r\n<p style=\"text-indent: 2em\">尚德电力的违约将有望引发债券持有人对公司的诉讼。尚德电力在上周宣布获得了63%债券持有人的同意，将把债务偿付时间延长两个月至5月15日，以便管理层着手进行债务重组。部分债权人拒绝接受这个方案，并组成一个团体威胁发起诉讼。</p>\r\n<p style=\"text-indent: 2em\">同时，尚德的声明显示其对国内银行也已出现违约。截至2011年末，尚德银行融资高达17亿美元，国内银行为尚德最主要的债权人，其中<span onmouseover=\"ShowInfo(this,&quot;00939&quot;,&quot;100&quot;,&quot;-1&quot;,event);\">建设银行</span>、国家开发银行、<span onmouseover=\"ShowInfo(this,&quot;03988&quot;,&quot;100&quot;,&quot;-1&quot;,event);\">中国银行</span>、<span onmouseover=\"ShowInfo(this,&quot;01288&quot;,&quot;100&quot;,&quot;-1&quot;,event);\">农业银行</span>等几家大行在尚德贷款较多，且大部分为无抵押的信用贷款。</p>\r\n<p style=\"text-indent: 2em\">据经济参考报(<span class=\"infoMblog\">微博</span>)报道，目前，尚德电力破产已成定局，具体的破产重组方案已获江苏省政府批准，将在20日左右出台。</p>\r\n<p style=\"text-indent: 2em\">从目前的情况来看，&ldquo;国资介入&rdquo;无疑是目前<span onmouseover=\"ShowInfo(this,&quot;STP.N&quot;,&quot;200&quot;,&quot;-1&quot;,event);\">无锡尚德</span>的唯一活路&ldquo;对于尚德电力来说，最好的选择将是为某些资产申请破产保护，并让国有力量进入该企业从而保护特定利益。当然，尚德电力不会全面破产，它的品牌将会一直存在&rdquo;。中国可再生能源协会副理事长孟宪淦指出。</p>\r\n<p style=\"text-indent: 2em\">无锡市国联发展(集团)有限公司(简称&ldquo;无锡国联&rdquo;)将有望接受和主导之后的重组工作，以母公司或者旗下产业投资基金的形式全面接管无锡尚德。据了解，无锡国联成立于1999年5月8日，是无锡市人民政府出资设立并授予国有资产投资主体资格的国有独资企业集团。</p>\r\n<p style=\"text-indent: 2em\">尚德电力由施正荣于 2001年创立，2006年，公司赴美上市，施正荣借此成为中国新首富，并引发了光伏产业一场声势浩大的造富运动。自去年以来，尚德的形势急转直下，截至今年3月份，该公司的负债总额已达到35.82亿美元，资产负债率已高达81.8%，市值从上市之初的49.22亿美元跌到如今的1.49亿美元。</p>\r\n<p style=\"text-indent: 2em\">3月4日，尚德电力发出公告称，施正荣辞去公司董事长职务，由王珊接替公司董事长一职。但是第二天施正荣就发出声明称，董事会撤除其董事长职务是非法无效的，并表示自己以在尚德的股权向银行担保并获取贷款。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('53', 'text', '<p>上世纪30年代，为利用美国技术建造新型军舰，苏联领导人特批从国库划拨50万美元的&ldquo;行政经费&rdquo;(在当时是一笔不小的数目)，供一家苏联外贸公司使用，以便打通美国高层关节。但这笔钱最终打了水漂，并连累不少人获罪，俄罗斯《权力》杂志日前刊文披露了这段秘闻。</p>\r\n<p>　　1924年，苏联在美国注册成立了阿姆外贸集团公司，专门从事苏美贸易。当时美苏尚未正式建交，阿姆外贸集团公司可以说垄断了两国的贸易活动。到了1933年，在苏联的要求下，同时也是为了迎合热心开拓苏联市场的美国工商界人士，美国新总统罗斯福正式承认苏联的合法性。</p>\r\n<p>　　当时，美国经济仍然萧条。美国商人都清楚，阿姆外贸集团公司的订单就是苏联政府的订单，意味着苏联政府的财政支持。但从另一个角度看，美国人认为，与这家公司签订合同就意味着与一个最敌对的国家开展贸易活动，所以特别警惕向该公司提供先进敏感的军事技术。鉴于此，莫斯科决定建立一个纯美国式的公司，找一个可靠的代理人。</p>\r\n<p>　　被选中的人叫卡尔普，一个有俄国血统的美国人。卡尔普出生在沙俄时期一个贫穷的裁缝家庭，1911年移居美国后，做过各种杂工，后做起石油生意。上世纪20年代末经济危机爆发后，卡尔普陷入困境，1933年，他不得不把自己的几个加油站低价处理。随后，他决定去莫斯科，看能否找到&ldquo;在俄罗斯赚美元&rdquo;的机会。正是在莫斯科，他结识了苏联对外贸易部官员，并受委托开始帮助苏联采购先进设备。</p>\r\n<p>　　但有不少人对卡尔普的能力表示怀疑。在1936年8月2日向时任苏联国防人民委员伏罗希洛夫的汇报中，苏联驻美国的军事参赞布尔津尤说：&ldquo;这个人(指卡尔普)行为举止欠稳妥，令人担忧。譬如，他到任何一个地方都随身携带虽说不是官方正式文件但都涉及我国采购设备的清单，甚至公开给一些有业务联系的企业和转售商看这些文件。这样做严重违反保密条款规定。总之，他一有机会就向人喋喋不休地介绍我国需求情况。&rdquo;这名参赞还提到卡尔普的特别背景苏联人民委员会主席莫洛托夫妻子热姆丘任娜的弟弟。</p>\r\n<p>　　尽管有人打了&ldquo;黑报告&rdquo;，卡尔普仍得到上面的信任。在与阿姆外贸集团公司达成划分采购权限的协议后，他顺利地完成了一些采购任务。卡尔普一有机会就向人们讲他与莫洛托夫的关系，并散布从苏联高层那儿得到的一些重要采购信息，去找他的客商很快便络绎不绝。卡尔普一下子成了一个&ldquo;神奇&rdquo;的商人。</p>\r\n<p>　　1937年5月14日，阿姆外贸集团公司董事会主席罗佐夫向莫斯科发去一份紧急密码文件。文件称：&ldquo;卡尔普今日向我报告，美国政府已拟订向我出售配置16英寸火炮系统战列舰以及火炮中央控制器的文件。为获得这份文件他需要50万美元用以补偿相关人士。&rdquo;莫斯科经过反复研究，决定做这个交易。</p>\r\n<p>　　苏联方面先划拨了30万美元，后来又增补了20万。这笔汇款的收款人一开始定为美国民主党全国委员会的一个重要人物以及总统的助手。此外，苏联人还想将这笔款项交到美国各部委员会负责军工技术产品审批事项的官员手中。事实上，这笔巨额资金最终到了罗斯福总统的儿子手里，为的是通过他将这笔钱送到罗斯福手中。</p>\r\n<p>　　没想到，卡尔普所办的事情被新闻界曝光了，连续几天美国各大新闻社、报刊都报道说苏联将在美国采购巨额军事装备，很多报刊不惜笔墨将该事件描绘成已经开始执行的订单。此外，在美国国务院办妥向苏联发运军事装备的批文后，涉及采购战列舰相关技术设备的麻烦越来越多。1937年11月3日，莫斯科接到报告说：&ldquo;卡尔普拿到的批文对采购战列舰专用的涡轮根本不起作用。<span onmouseover=\"ShowInfo(this,&quot;GE.N&quot;,&quot;200&quot;,&quot;-1&quot;,event);\">通用电气</span>作为海军部供应发动机的主要商家，根本不想接受我们的货物订单，而且还必须得到海军部的正式批文&hellip;&hellip;造船厂在媒体的一阵旋风式报道后，也想从苏联贸易代表处拿到战列舰设计费用&hellip;&hellip;&rdquo;</p>\r\n<p>　　据档案记载，莫斯科决定还是让卡尔普去做说客，并由苏联商贸代表特罗扬诺夫斯基约见美国总统。1937年11月27日，特罗扬诺夫斯基见到了罗斯福。据他事后向莫洛托夫报告，他向罗斯福抱怨美国海军部对苏方订单态度冷淡，罗斯福则表示会给负责海军事务的长官下指示，总统还建议直接在美国建船坞，并称会按照美国海军现役军舰标准为苏联设计建造战舰专用装甲钢板。</p>\r\n<p>　　事实上，这件事没有任何转机，在长时间的摩擦后，苏联人既没有得到驱逐舰，也没得到有关驱逐舰的任何技术设计图纸。经过苦口婆心的工作，美国人最后同意苏方带走有关建造战列舰的技术图纸。但苏联专家鉴定后表示，这些图纸完全不符合苏方的技术要求。</p>\r\n<p>　　1938年，美国国会成立了一个专门调查反美思潮的机构，卡尔普引起该机构的高度关注。他后来供出使用50万美元的细节，他本人从中擅自扣留了 10万美元。卡尔普的姐姐热姆丘任娜也未能幸免，1939年被控与&ldquo;人民公敌&rdquo;合作。1940年，阿姆外贸集团公司董事会主席罗佐夫被捕，被指控从事间谍活动，不断向卡尔普拨付苏共政治局决定的境外行政支出款项。1945年年底，美苏同盟关系名存实亡，这起让苏联人恼火的采购事件也被认为是源头之一。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('54', 'text', '<p style=\"text-indent: 2em\">北京时间3月19日凌晨消息，华尔街日报中国实时报栏目周一文章称，两名经济学家指出，美国房地产市场崩溃之前曾有过的三个警示性信号已经在中国出现，这意味着中国只有非常有限的时间来摆脱困境。</p>\r\n<p style=\"text-indent: 2em\">文章指出，在野村证券于上周六公布的一份报告中，经济学家张智威和陈家瑶指出，物业价格的上涨、杠杆化的快速积累和潜在增长率的下滑都可能导致系统性的危机。</p>\r\n<p style=\"text-indent: 2em\">这份报告引用凯斯席勒房价指数指出，美国的房价在2001年到2006年之间飙升了84%。而作为野村证券经济学家的张智威和陈家瑶对中国的官方指数提出了质疑，并认为这组数据指出的2004年到2012年之间主要大城市房价113%的&ldquo;良性增长&rdquo;并不准确。他们认为，这个数据过于宽泛，包括了全国范围内老旧和低品质的住房。与之相比，近期一份考虑到这种质量差异的学术报告认为，仅2004年到2009年之间，中国房价的涨幅就已经是250%。</p>\r\n<p style=\"text-indent: 2em\">张智威和陈家瑶在报告中写道，&ldquo;中国政府显然已经认识到房地产行业的风险，在过去多年推出了一系列逐渐收紧政策以控制物业价格的措施。市场的模式是，在紧缩政策推出之初下降，然后反弹，这意味着风险并没有得到缓解。&rdquo;依赖出售土地作为主要收入来源的地方政府可能在房地产开发商因为市场崩溃而受打击时遭受同等的重创。这些问题会轻易地在银行系统找到突破口&mdash;&mdash;估算显示，中国银行业14.1%的流通贷款发放给了地方政府的融资平台，6.2%授予了房地产开发商。</p>\r\n<p style=\"text-indent: 2em\">野村证券认为，中国还是有时间来避免系统性的金融危机，只要政府不畏惧马上启动政策紧缩。不过这一做法的代价将是2013年经济增长前景的受压制&mdash;&mdash;虽然最终的实际增长还是有望在2013年上半年达到8.1%，在下半年维持7.3%。报告强调，早期的紧缩可能引发可以控制的债务违约情况。</p>\r\n<p style=\"text-indent: 2em\">报告指出，另一个结果是继续目前的宽松政策，实现超过8%的2013年经济增长，然后面对可能在2014年初就出现了市场崩溃。而这种崩溃将会很快蔓延到整个系统，迫使政府介入对银行和地方政府进行救援，可能需要出售公共资产来解决混乱局面。</p>\r\n<p style=\"text-indent: 2em\">报告认为，最终导致中国出现危机可能性增加的因素是潜在增长率的下降。这并不是一个可以轻松计算的数字，它代表了经济在不产生额外通货膨胀情况下可以实现的最大增长速度。即使是最乐观的分析师也同意野村证券的判断，包括适龄劳动人口数量的萎缩等等因素都造成了这个指标的下降。这使得中国决策者刺激经济增长的回旋余地相比过去大大减少。</p>\r\n<p style=\"text-indent: 2em\">张智威和陈家瑶指出，&ldquo;金融危机通常跟随技术革命和所谓的经济奇迹，因为投资者和决策者开始过高估计经济的潜在增长能力。决策者可能错误解读潜在增长的结构性放缓，将它视作周期性的现象，并试图使用扩张性政策来刺激增长，这实际上为过热和最终痛苦的调整埋下了种子。&rdquo;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('55', 'text', '<p style=\"text-indent: 2em\">针对日前有报道称&ldquo;中国<span onmouseover=\"ShowInfo(this,&quot;00763&quot;,&quot;100&quot;,&quot;-1&quot;,event);\">中兴通讯</span>股份有限公司在蒙古承建项目时涉嫌行贿，其管理人员已被蒙古国家反贪局逮捕&rdquo;，中兴公司18日接受《环球时报》记者采访时予以否认。</p>\r\n<p style=\"text-indent: 2em\">该报道称，本月13日，蒙古国家反贪局对中兴公司在当地的办事处、高管住处、私人汽车及车库进行搜查，将搜到的文件资料都带走，并将中兴高管羁押在监狱。</p>\r\n<p style=\"text-indent: 2em\">针对此事，中兴公司18日给《环球时报》发来声明称，作为在中国深港两地上市的国际化通信企业，中兴通讯一直以来秉持守法经营的理念。中兴通讯在蒙古的业务开展，与其他国家一样，完全符合行业国际惯例要求和所在国法律的规定。目前，我们的业务遍及全球140 多个国家的500多个运营商，有着近30年良好的行业经历。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('64', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('70', 'text', '<p>欢迎测试！</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('71', 'text', '<p>Jspxcms1.0正式发布</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('72', 'text', '<p>Jspxcms2.0正式发布</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('73', 'text', '<p>&nbsp;</p>\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130813070348_9dcm1m.jpg\" style=\"width: 405px; height: 550px; \" /></p>\r\n<p style=\"text-align:center\">杨钰莹</p>\r\n<p>&ldquo;女人不是因为美丽而可爱，是因为可爱而美丽。&rdquo;俄罗斯文学家列夫&middot;托尔斯泰在《战争与和平》中的这句话，用在杨钰莹身上正合适。白裙子，长头发，低声说，轻声笑，杨钰莹完全保留着少女的神态。10多年的岁月，惊涛骇浪的往事，在她身上仿佛没留下痕迹。</p>\r\n<p>但交谈久了，还是不一样。你会发现，她从前接受采访时那些活泼的小动作，比如扬扬眉、撇撇嘴、甩甩头发，现在全都没有了。以前的她像一幅动态画，现在变成了一幅静物画。</p>\r\n<p>在离开公众视线长达10年后，这次回归，她闯进了一个全新的领域&mdash;&mdash;主持人。公众和媒体对她的主持人形象充满好感，那些纠缠不放的负面消息也被人们淡忘了。</p>\r\n<p>很难想象，她是怎么走过低谷和风浪的。她自己的解释是：&ldquo;生活中不仅有幸福和快乐，更有悲伤和无奈，都要笑纳，因为它们都是生活的组成部分。&rdquo;</p>\r\n<p>&ldquo;柔软&rdquo;面对批评</p>\r\n<p>2013年初，杨钰莹正筹备自己的演唱会，突然接到天津卫视新节目《天下无双》(在线观看)邀约：&ldquo;来给我们做主持人吧。&rdquo;对她而言，这是机会，也是挑战。考虑了将近一个月，反复看了这档节目的国外原版录像，终于，在节目录制的前一天，杨钰莹答应了。</p>\r\n<p>谁都没有想到，这一次会反响这么好。第一期节目播出后，获得了全国收视率第四的好成绩。没多久，杨钰莹和主持界的老前辈赵忠祥同台，也没露怯。赵忠祥夸她&ldquo;水平比央视有些女主持人都要好，可以推荐她去主持春晚了&rdquo;。杨钰莹庆幸接了这个工作，&ldquo;为自己打开了新的一扇窗&rdquo;。</p>\r\n<p>环球人物杂志：这3个月的节目，看得出你进步很大。有没有请老师来辅导发声、走台这些技巧？</p>\r\n<p>杨钰莹：没有呀。我每每在<a href=\"http://ent.qq.com/tv/\" target=\"_blank\">电视</a>上看到自己的不足，都会说：&ldquo;哎呀！怎么没有人教我一下呀！&rdquo;(笑)有时候发现自己在节目中又忘了说&ldquo;硬口&rdquo;(指主持人必须要讲的话)，就会特别着急。</p>\r\n<p>环球人物杂志：现在给自己的主持工作打多少分？</p>\r\n<p>杨钰莹：我还是多鼓励自己吧，打80分。不过，我给自己的态度打100分。任何时候，工作态度永远比工作能力更重要。</p>\r\n<p>环球人物杂志：也有一些人批评你主持风格&ldquo;太嗲&rdquo;，&ldquo;气质胜过技巧&rdquo;。</p>\r\n<p>杨钰莹：其实我这个人一点都不&ldquo;嗲&rdquo;，有时候还挺爷们儿的。至于技巧，我就是没有技巧，不过还算有点气质(笑)。</p>\r\n<p>对于这些批评，我会非常柔软地去面对。我看到那些中肯的意见，会在心底说：&ldquo;谢谢你，我会努力地改进。&rdquo;</p>\r\n<p>环球人物杂志：谁也没有想到你做主持人这么成功，以后还会唱歌吗？</p>\r\n<p>杨钰莹：当然会。没有歌唱事业做基础，主持也就不必了。我首先还是歌手，而且说话和唱歌相比，我还是唱歌的水平更好。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('83', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('93', 'text', '<p><span style=\"line-height: 22px; font-family: tahoma, Arial, 宋体, 微软雅黑; color: rgb(0,0,0)\">免费的即时聊天软件，给上网带来更多沟通乐趣。腾讯QQ2013年度皮肤呈现视觉盛宴，皮肤编辑器实现个性化面板创意；QQ应用盒子全新呈现，丰富应用满足多彩生活；QQ短信首度面世，畅享无处不在的沟通体验；炫彩字体，炫出聊天个性与风采；QQ支持自定义标签，标签顺序随心换。提示：如果您正在运行着腾讯QQ或者TM ,请退出后再进行一键安装。</span></p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('95', 'packingList', '<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" class=\"gm_guig\" style=\"border-collapse: collapse; border-spacing: 0px; margin: 20px 0px 0px; color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" width=\"100%\">\r\n <tbody>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">电池</span>：</td>\r\n     <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       惠州比亚迪电子有限公司</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">充电器</span>：</td>\r\n      <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       20120629</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">数据线</span>：</td>\r\n      <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       高通7625A</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">立体声耳机</span>：</td>\r\n      <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       CDMA EVDO Rev.A/GSM</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">包装、说明书、保修卡</span>：</td>\r\n     <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       CDMA EVDO Rev.A/GSM</td>\r\n    </tr>\r\n </tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('95', 'introduce', '<p><span style=\"color: rgb(140, 7, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; font-size: 14px; font-weight: bold; line-height: 30px; text-indent: 30px; \">此机型为电信定制机，支持双模双待双通，即您可以同时使用一张电信卡+另外一张移动卡或联通卡，2张卡是同时待机，也可以同时通话，出厂设置为只能使用电信卡2G或3G上网，另外一张移动或联通卡无法上网！请亲们知晓哦！</span><br style=\"color: rgb(140, 7, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; font-size: 14px; font-weight: bold; line-height: 30px; text-indent: 30px; \" />\r\n <span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; font-size: 14px; font-weight: bold; line-height: 30px; text-indent: 30px; color: rgb(0, 0, 0); \">A199</span><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; font-size: 14px; font-weight: bold; line-height: 30px; text-indent: 30px; color: rgb(39, 70, 114); \">最新软件版本已在华为官网提供下载，可通过软件升级解决前期出现的部分G网单卡的通话问题！</span></p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('95', 'services', '<p><strong style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">一．退换货政策（非苹果手机售后政策）</strong><span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（一）.天翼手机网承诺：自产品售出之日起7日内出现《移动电话机产品修理更换退货责任规定》附录3中所列的性能故障（以下简称&ldquo;性能故障&rdquo;）且不影响二次销售的情况下可以退货，自产品售出之日起15日内出现性能故障时可以换货，用户可通过天翼手机网的客服中心联系办理退换货事宜。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">1.&nbsp;产品出现性能故障，经由生产厂家指定或特约售后服务中心检测确认，并出具检测报告、保修卡、发票。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">2.&nbsp;到货物流损或缺件情况：物流损指在运输过程中造成的损坏、漏液、破碎、性能故障，经售后人员核查情况属实（期间可能需要快递人员证明或要求您提供实物照片等，以便售后人员快速做出判断及时处理），无条件办理退换货事宜。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">3.&nbsp;判断产品售出之日的规则：天翼手机网通过第三方物流平台配送或者自提的订单，以客户实际签收日期为准；如果第三方物流平台不能有效返回签收日期，则天翼手机网客服根据距离等因素和用户人工确认实际到货日期。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">4.&nbsp;天翼手机网视为影响二次销售的情况:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;1.&nbsp;产品包装破损&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;2.&nbsp;产品有人为原因导致的故障问题&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;3.&nbsp;产品出现划痕或磨损&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;4.&nbsp;产品配件不全&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（二）.售后服务工作时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">每周一至周五，上午9：00至11：30，下午13：00至17：30，法定节假日无法正常处理情况除外。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（三）.售后服务处理周期：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">退货处理周期：自接收到问题产品、购机发票、保修卡、检测报告且经天翼手机网审核真实齐全之日起7个工作日之内为您处理完成；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">换货处理周期：自接收到问题产品、购机发票、保修卡、检测报告且经天翼手机网审核真实齐全之日起5个工作日之内为您处理完成；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">注：国家法定节假日，因部分品牌生产厂家的售后服务中心推迟提供服务，售后服务处理周期也相应延长。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（四）.售后物流说明：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">天翼手机网承担售后服务的物流费用。如用户所在地支持顺丰快递，用户应选择顺丰快递进行售后机回寄。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（五）.特别说明，以下情况天翼手机网售后服务不予办理退换货：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">1. 任何非天翼手机网出售的产品（序列号不符）；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">2. 号卡套餐的退机业务不予受理；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">3. 对于过保产品（超过《移动电话机产品修理更换退货责任规定》中所列的三包有效期的产品）；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">4. 未经授权的维修、误用、碰撞、疏忽、滥用、进液、事故、改动、不正确的安装所造成的产品质量问题，或撕毁、涂改标贴、机器序号、防伪标记；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">5. 产品的外包装、附件、赠品（券）（需要和主产品一起退换）、说明书及保修卡不完整，（券）发票缺失或涂改；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <strong style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">二．售后温馨提示（非苹果手机）</strong><span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;产品售出后7日内，请妥善保管好您的产品、产品外包装、发票、保修贴及赠品，请避免产品产生人为的损坏及磨损。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;产品售出后15日内，请妥善保管好您的产品、发票、及正规厂家授权的售后出具的检测工单，请避免产品产生人为的损坏及磨损。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">以下天翼手机网将不予受理：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（一）任何非天翼手机网出售的产品（机型、串码不符）。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（二）产品的外包装、配件、说明书和保修卡、检测报告或换机单、发票任一缺失。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（三）号卡套餐的退机业务不予受理。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（四）任何因非正常使用及保管导致出现问题的产品（碰撞、进液、自行拆机、维修、滥用或不正确的安装及操作，撕毁或涂改标贴、机器序号、防伪标记）。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（五）产品及附件不完整或有损毁，对于外观有物理损伤（俗称有外伤）的产品，我公司商城将不予受理。如果您误将外观有物理损伤的产品寄送给我公司商城，我公司商城人员将直接按原地址或按订单地址返回，并不承担相应运费。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（六）对于过保产品（超过保修期的产品）的保修，天翼手机网将不予受理。如果您误将过保产品寄送给我公司商城，我公司商城将直接按原地址或按订单地址返回，并不承担由此产生的运费。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（七）由于您操作方式不当或使用环境限制造成的误报以及实际情况与您描述不符，天翼手机网将直接按原地址或按订单地址返回，并不承担由此产生运费。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（八）产品兼容性问题不属于产品质量问题，天翼手机网不提供售后服务。</span></p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('95', 'specification', '<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" class=\"gm_guig\" style=\"border-collapse: collapse; border-spacing: 0px; margin: 20px 0px 0px; color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" width=\"100%\">\r\n <tbody>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品上市时间：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       20130425</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       是否在售：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       是</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品市场定位：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       新潮炫酷</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品销售卖点：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       （1）四核1.5G &mdash;&mdash;四核1.5GHZ强劲处理器，搭配2G RAM大容量内存！（2）5英寸1280x720高清大屏 &mdash;&mdash;5英寸720P高清IPS显示屏。（3）CDMA+GSM双卡双通 &mdash;&mdash;支持CDMA+GSM两种网络制式，同时在线通话。（4）华为酷炫EMUI ----华为Emotion UI,合一桌面，多种主题。（5）智能管理</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品标准配置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       单电单充、耳机、数据线、使用手册</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       芯片平台：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       高通6085</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       网络支持：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       CDMA EVDO Rev.A/GSM</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       上市销售软件版本：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       A199V100R001C92B118</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       网络频段：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       GSM 1900MHz,GSM 900MHz,GSM 1800MHz,CDMA 800MHZ</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       待机类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       双网双待</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       外观类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       直板</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       天线设计：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       内置</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       外壳材质：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       塑料</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品尺寸：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       141.5&times;72.5&times;8.9 mm</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品重量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       160 g</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电源接口：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       MicroUSB</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       耳机接口：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       3.5mm</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       屏幕数量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       单屏幕</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       主屏幕尺寸：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       5.0</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       显示分辩率：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       1280*720</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       触摸屏类型：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       电容式触摸屏</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       RAM：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       2048 MB</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       ROM：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       8192 MB</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Flash内存：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       5500 MB</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       扩展内存：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       32G</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电话簿容量：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信收件箱：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信发件箱：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信草稿箱：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话记录已接：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       500</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话记录已拨：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       500</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话记录未接：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       500</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       音频播放/管理：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       AAC,MP3,MIDI</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       视频播放/管理：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       H.264,MP4,H.263,3GP,MPEG4</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       主摄像头：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       800万像素</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       副摄像头：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       130万像素</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       微距功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       摄影功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       定位导航功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       FM广播功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电视功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       PC同步：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       U盘模式：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Modem功能：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       红外无线通信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       蓝牙无线通信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WLAN无线通信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电池类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       锂电</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电池容量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       2150 mAh</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话时间：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       C网通话时间：600 分钟 G网通话时间：600 分钟</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       待机时间：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       C网待机时间：220 小时 G网待机时间：300 小时 双待待机时间：130 小时</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       本地音频连续播放时长：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       14 小时</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       本地视频连续播放时长：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       7 小时</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       图形菜单：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       系统自带</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Widget功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       动画屏保：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       待机图片：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Touch技术：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       重力感应器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       方向感应器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       来电识别：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       铃声图片识别</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       免提功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       自动重拨：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       自动应答：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       快速拨号设置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       会议电话（三方）：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       话费管理（计时/计数）：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       语音拨号：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话录音：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       号码分组：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通讯录快速查询：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       按首字母/姓名/组别/模糊查询</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通讯录容量查询（包括话机/UIM卡通讯录容量查询）：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信群发：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       常用短信设置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信容量查询（包括话机/UIM卡容量查询）：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信群发数量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       100</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       语言支持：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       中文简体,英文</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       支持文本输入类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       拼音,数字,英文,符号</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       输入法：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       中文联想</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       文字输入方式：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       键盘+手写双输入</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       智能操作系统：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       Android4.1</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       文件管理：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       powerpoint,pdf,word,txt,excel</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       名片扫描：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       呼入电话限制：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       开机密码保护：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       自动锁键盘：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       其他安全功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       来电归属地,开机启动管理</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       录音铃声设置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       铃声编辑：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       开机闹钟：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       关机闹钟：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       语音报时：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       日历（支持农历）：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       备忘录/日程表：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       计算器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       定时器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       秒表：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       OTA：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       MEID：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       长短信：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       彩信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WAP：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       WAP2.0</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       BREW：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       JAVA：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       流媒体：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       GPSone/GPS：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       独立GPS：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WWW浏览：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WWW浏览器类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       WWW+WAP</td>\r\n    </tr>\r\n </tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('94', 'introduce', '<p><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130808074509_7bba9r.jpg\" style=\"width: 850px; height: 1707px; \" /></p>\r\n<p><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130808074756_aemhld.jpg\" style=\"width: 850px; height: 1830px; \" /></p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('94', 'packingList', '<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" class=\"gm_guig\" style=\"border-collapse: collapse; border-spacing: 0px; margin: 20px 0px 0px; color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" width=\"100%\">\r\n <tbody>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">电池</span>：</td>\r\n     <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       惠州比亚迪电子有限公司</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">充电器</span>：</td>\r\n      <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       20120629</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">数据线</span>：</td>\r\n      <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       高通7625A</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">立体声耳机</span>：</td>\r\n      <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       CDMA EVDO Rev.A/GSM</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">包装、说明书、保修卡</span>：</td>\r\n     <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       CDMA EVDO Rev.A/GSM</td>\r\n    </tr>\r\n </tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('94', 'services', '<p><strong style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">一．退换货政策（非苹果手机售后政策）</strong><span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（一）.天翼手机网承诺：自产品售出之日起7日内出现《移动电话机产品修理更换退货责任规定》附录3中所列的性能故障（以下简称&ldquo;性能故障&rdquo;）且不影响二次销售的情况下可以退货，自产品售出之日起15日内出现性能故障时可以换货，用户可通过天翼手机网的客服中心联系办理退换货事宜。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">1.&nbsp;产品出现性能故障，经由生产厂家指定或特约售后服务中心检测确认，并出具检测报告、保修卡、发票。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">2.&nbsp;到货物流损或缺件情况：物流损指在运输过程中造成的损坏、漏液、破碎、性能故障，经售后人员核查情况属实（期间可能需要快递人员证明或要求您提供实物照片等，以便售后人员快速做出判断及时处理），无条件办理退换货事宜。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">3.&nbsp;判断产品售出之日的规则：天翼手机网通过第三方物流平台配送或者自提的订单，以客户实际签收日期为准；如果第三方物流平台不能有效返回签收日期，则天翼手机网客服根据距离等因素和用户人工确认实际到货日期。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">4.&nbsp;天翼手机网视为影响二次销售的情况:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;1.&nbsp;产品包装破损&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;2.&nbsp;产品有人为原因导致的故障问题&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;3.&nbsp;产品出现划痕或磨损&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;4.&nbsp;产品配件不全&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（二）.售后服务工作时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">每周一至周五，上午9：00至11：30，下午13：00至17：30，法定节假日无法正常处理情况除外。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（三）.售后服务处理周期：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">退货处理周期：自接收到问题产品、购机发票、保修卡、检测报告且经天翼手机网审核真实齐全之日起7个工作日之内为您处理完成；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">换货处理周期：自接收到问题产品、购机发票、保修卡、检测报告且经天翼手机网审核真实齐全之日起5个工作日之内为您处理完成；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">注：国家法定节假日，因部分品牌生产厂家的售后服务中心推迟提供服务，售后服务处理周期也相应延长。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（四）.售后物流说明：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">天翼手机网承担售后服务的物流费用。如用户所在地支持顺丰快递，用户应选择顺丰快递进行售后机回寄。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（五）.特别说明，以下情况天翼手机网售后服务不予办理退换货：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">1. 任何非天翼手机网出售的产品（序列号不符）；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">2. 号卡套餐的退机业务不予受理；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">3. 对于过保产品（超过《移动电话机产品修理更换退货责任规定》中所列的三包有效期的产品）；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">4. 未经授权的维修、误用、碰撞、疏忽、滥用、进液、事故、改动、不正确的安装所造成的产品质量问题，或撕毁、涂改标贴、机器序号、防伪标记；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">5. 产品的外包装、附件、赠品（券）（需要和主产品一起退换）、说明书及保修卡不完整，（券）发票缺失或涂改；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <strong style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">二．售后温馨提示（非苹果手机）</strong><span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;产品售出后7日内，请妥善保管好您的产品、产品外包装、发票、保修贴及赠品，请避免产品产生人为的损坏及磨损。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;产品售出后15日内，请妥善保管好您的产品、发票、及正规厂家授权的售后出具的检测工单，请避免产品产生人为的损坏及磨损。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">以下天翼手机网将不予受理：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（一）任何非天翼手机网出售的产品（机型、串码不符）。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（二）产品的外包装、配件、说明书和保修卡、检测报告或换机单、发票任一缺失。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（三）号卡套餐的退机业务不予受理。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（四）任何因非正常使用及保管导致出现问题的产品（碰撞、进液、自行拆机、维修、滥用或不正确的安装及操作，撕毁或涂改标贴、机器序号、防伪标记）。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（五）产品及附件不完整或有损毁，对于外观有物理损伤（俗称有外伤）的产品，我公司商城将不予受理。如果您误将外观有物理损伤的产品寄送给我公司商城，我公司商城人员将直接按原地址或按订单地址返回，并不承担相应运费。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（六）对于过保产品（超过保修期的产品）的保修，天翼手机网将不予受理。如果您误将过保产品寄送给我公司商城，我公司商城将直接按原地址或按订单地址返回，并不承担由此产生的运费。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（七）由于您操作方式不当或使用环境限制造成的误报以及实际情况与您描述不符，天翼手机网将直接按原地址或按订单地址返回，并不承担由此产生运费。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（八）产品兼容性问题不属于产品质量问题，天翼手机网不提供售后服务。</span></p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('94', 'specification', '<p>&nbsp;</p>\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" class=\"gm_guig\" style=\"border-collapse: collapse; border-spacing: 0px; margin: 20px 0px 0px; color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" width=\"100%\">\r\n  <tbody>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       生产厂商：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       惠州比亚迪电子有限公司</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品上市时间：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       20120629</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       芯片平台：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       高通7625A</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       网络支持：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       CDMA EVDO Rev.A/GSM</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       上市销售软件版本：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       AGSPIN_B_02.01.35RPD</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       网络频段：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       CDMA 800MHZ GSM 900/1800/1900MHZ</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       待机类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       双网双待</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       外观类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       直板</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       天线设计：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       内置</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       外壳材质：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       工程塑料</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品尺寸：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       118&times;67.28&times;11.9mm</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品重量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       135g</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电源接口：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       MicroUSB</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       耳机接口：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       3.5mm</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       屏幕数量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       单屏幕</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       主屏幕尺寸：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       4</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       显示分辩率：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       HVGA 480*320</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       触摸屏类型：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       电容式触摸屏</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       RAM：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       512MB</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       ROM：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       512MB</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Flash内存：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       90MB</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       扩展内存：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       32G</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电话簿容量：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信收件箱：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信发件箱：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信草稿箱：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话记录已接：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       500</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话记录已拨：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       500</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话记录未接：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       500</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       音频播放/管理：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       AAC+,QCP,AAC,AMR,WMA,MP3,MIDI,WAV</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       视频播放/管理：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       H.264,WMV,MP4,H.263,3GP,DivX,RM,AVI,MPEG4</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       主摄像头：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       300万像素</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       副摄像头：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       微距功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       摄影功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       定位导航功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       FM广播功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电视功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       PC同步：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       U盘模式：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Modem功能：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       红外无线通信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       蓝牙无线通信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WLAN无线通信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电池类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       锂电</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电池容量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       1735 mAh</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话时间：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       C网通话时间：700分钟 G网通话时间：900</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       待机时间：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       C网待机时间：230小时 G网待机时间：300小时 双待待机时间：160 小时</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       本地音频连续播放时长：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       30 小时</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       本地视频连续播放时长：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       14小时</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       图形菜单：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       16宫格</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Widget功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       动画屏保：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       待机图片：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Touch技术：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       重力感应器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       方向感应器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       来电识别：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       铃声图片识别</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       免提功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       自动重拨：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       自动应答：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       快速拨号设置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       会议电话（三方）：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       话费管理（计时/计数）：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       语音拨号：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话录音：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       号码分组：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通讯录快速查询：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       首字母/姓名/号码/模糊查询</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通讯录容量查询（包括话机/UIM卡通讯录容量查询）：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信群发：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       常用短信设置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信容量查询（包括话机/UIM卡容量查询）：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信群发数量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       50</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       语言支持：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       中文简体,英文</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       支持文本输入类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       拼音,数字,英文,符号</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       输入法：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       中文联想</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       文字输入方式：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       键盘+手写双输入</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       智能操作系统：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       android2.3</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       文件管理：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       名片扫描：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       呼入电话限制：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       开机密码保护：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       自动锁键盘：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       录音铃声设置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       铃声编辑：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       开机闹钟：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       关机闹钟：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       语音报时：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       日历（支持农历）：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       备忘录/日程表：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       计算器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       定时器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       秒表：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       OTA：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       MEID：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       长短信：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       彩信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WAP：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       WAP2.0</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       BREW：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       JAVA：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       流媒体：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       GPSone/GPS：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       独立GPS：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WWW浏览：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WWW浏览器类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       WWW+WAP</td>\r\n    </tr>\r\n </tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('97', 'packingList', '<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" class=\"gm_guig\" style=\"border-collapse: collapse; border-spacing: 0px; margin: 20px 0px 0px; color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" width=\"100%\">\r\n <tbody>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">电池</span>：</td>\r\n     <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       惠州比亚迪电子有限公司</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">充电器</span>：</td>\r\n      <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       20120629</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">数据线</span>：</td>\r\n      <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       高通7625A</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">立体声耳机</span>：</td>\r\n      <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       CDMA EVDO Rev.A/GSM</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 2px 5px 2px 38px; font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       <span style=\"color: rgb(0, 0, 0); font-size: 14px; line-height: 22px; \">包装、说明书、保修卡</span>：</td>\r\n     <td style=\"border-style: solid; border-color: rgb(204, 204, 204); padding: 0px 5px 0px 22px; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       CDMA EVDO Rev.A/GSM</td>\r\n    </tr>\r\n </tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('97', 'introduce', '<p><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130808092534_6rhokc.jpg\" style=\"width: 800px; height: 800px; \" /></p>\r\n<p><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130808092547_cqt1ir.jpg\" style=\"width: 800px; height: 800px; \" /></p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('97', 'services', '<p><strong style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">一．退换货政策（非苹果手机售后政策）</strong><span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（一）.天翼手机网承诺：自产品售出之日起7日内出现《移动电话机产品修理更换退货责任规定》附录3中所列的性能故障（以下简称&ldquo;性能故障&rdquo;）且不影响二次销售的情况下可以退货，自产品售出之日起15日内出现性能故障时可以换货，用户可通过天翼手机网的客服中心联系办理退换货事宜。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">1.&nbsp;产品出现性能故障，经由生产厂家指定或特约售后服务中心检测确认，并出具检测报告、保修卡、发票。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">2.&nbsp;到货物流损或缺件情况：物流损指在运输过程中造成的损坏、漏液、破碎、性能故障，经售后人员核查情况属实（期间可能需要快递人员证明或要求您提供实物照片等，以便售后人员快速做出判断及时处理），无条件办理退换货事宜。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">3.&nbsp;判断产品售出之日的规则：天翼手机网通过第三方物流平台配送或者自提的订单，以客户实际签收日期为准；如果第三方物流平台不能有效返回签收日期，则天翼手机网客服根据距离等因素和用户人工确认实际到货日期。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">4.&nbsp;天翼手机网视为影响二次销售的情况:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;1.&nbsp;产品包装破损&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;2.&nbsp;产品有人为原因导致的故障问题&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;3.&nbsp;产品出现划痕或磨损&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;&nbsp;&nbsp;&nbsp;4.&nbsp;产品配件不全&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（二）.售后服务工作时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">每周一至周五，上午9：00至11：30，下午13：00至17：30，法定节假日无法正常处理情况除外。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（三）.售后服务处理周期：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">退货处理周期：自接收到问题产品、购机发票、保修卡、检测报告且经天翼手机网审核真实齐全之日起7个工作日之内为您处理完成；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">换货处理周期：自接收到问题产品、购机发票、保修卡、检测报告且经天翼手机网审核真实齐全之日起5个工作日之内为您处理完成；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">注：国家法定节假日，因部分品牌生产厂家的售后服务中心推迟提供服务，售后服务处理周期也相应延长。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（四）.售后物流说明：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">天翼手机网承担售后服务的物流费用。如用户所在地支持顺丰快递，用户应选择顺丰快递进行售后机回寄。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（五）.特别说明，以下情况天翼手机网售后服务不予办理退换货：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">1. 任何非天翼手机网出售的产品（序列号不符）；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">2. 号卡套餐的退机业务不予受理；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">3. 对于过保产品（超过《移动电话机产品修理更换退货责任规定》中所列的三包有效期的产品）；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">4. 未经授权的维修、误用、碰撞、疏忽、滥用、进液、事故、改动、不正确的安装所造成的产品质量问题，或撕毁、涂改标贴、机器序号、防伪标记；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">5. 产品的外包装、附件、赠品（券）（需要和主产品一起退换）、说明书及保修卡不完整，（券）发票缺失或涂改；&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <strong style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">二．售后温馨提示（非苹果手机）</strong><span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;产品售出后7日内，请妥善保管好您的产品、产品外包装、发票、保修贴及赠品，请避免产品产生人为的损坏及磨损。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">&nbsp;产品售出后15日内，请妥善保管好您的产品、发票、及正规厂家授权的售后出具的检测工单，请避免产品产生人为的损坏及磨损。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">以下天翼手机网将不予受理：&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（一）任何非天翼手机网出售的产品（机型、串码不符）。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（二）产品的外包装、配件、说明书和保修卡、检测报告或换机单、发票任一缺失。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（三）号卡套餐的退机业务不予受理。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（四）任何因非正常使用及保管导致出现问题的产品（碰撞、进液、自行拆机、维修、滥用或不正确的安装及操作，撕毁或涂改标贴、机器序号、防伪标记）。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（五）产品及附件不完整或有损毁，对于外观有物理损伤（俗称有外伤）的产品，我公司商城将不予受理。如果您误将外观有物理损伤的产品寄送给我公司商城，我公司商城人员将直接按原地址或按订单地址返回，并不承担相应运费。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（六）对于过保产品（超过保修期的产品）的保修，天翼手机网将不予受理。如果您误将过保产品寄送给我公司商城，我公司商城将直接按原地址或按订单地址返回，并不承担由此产生的运费。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（七）由于您操作方式不当或使用环境限制造成的误报以及实际情况与您描述不符，天翼手机网将直接按原地址或按订单地址返回，并不承担由此产生运费。&nbsp;</span><br style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" />\r\n  <span style=\"color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \">（八）产品兼容性问题不属于产品质量问题，天翼手机网不提供售后服务。</span></p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('97', 'specification', '<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" class=\"gm_guig\" style=\"border-collapse: collapse; border-spacing: 0px; margin: 20px 0px 0px; color: rgb(0, 0, 0); font-family: Arial, Lucida, Verdana, Helvetica, sans-serif; line-height: 22px; \" width=\"100%\">\r\n <tbody>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       生产厂商：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       惠州三星电子有限公司</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品上市时间：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       20130427</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       是否在售：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       是</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品市场定位：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       商务功能</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品销售卖点：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       5英寸全高清炫丽屏；双镜头拍摄；手势感应；Group play</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品标准配置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       单电单充、耳机、数据线、使用手册</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       芯片平台：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       高通MDM6600</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       网络支持：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       CDMA EVDO Rev.A/GSM</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       上市销售软件版本：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       I959KEUAMDH</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       网络频段：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       GSM 1900MHz,CDMA 1900MHZ,GSM 900MHz,GSM 1800MHz,CDMA 800MHZ</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       待机类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       双网双待</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       外观类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       直板</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       天线设计：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       内置</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       外壳材质：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       工程塑料</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品尺寸：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       136.6&times;69.8&times;7.9 mm</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       产品重量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       132 g</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电源接口：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       MicroUSB</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       耳机接口：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       3.5mm</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       屏幕数量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       单屏幕</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       主屏幕尺寸：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       5</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       显示分辩率：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       1920*1080</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       触摸屏类型：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       电容式触摸屏</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       RAM：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       2048 MB</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       ROM：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       16384 MB</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Flash内存：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       9031 MB</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       扩展内存：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       64G</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电话簿容量：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信收件箱：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信发件箱：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信草稿箱：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       依照内存定</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话记录已接：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       500</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话记录已拨：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       500</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话记录未接：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       500</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       音频播放/管理：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       AAC+,AAC,WMA,MP3</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       视频播放/管理：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       H.264,RMVB,WMV,H.263,DivX,AVI,MPEG4</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       主摄像头：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       1300万像素</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       副摄像头：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       200万像素</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       微距功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       摄影功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       定位导航功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       FM广播功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电视功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       PC同步：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       U盘模式：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Modem功能：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       红外无线通信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       蓝牙无线通信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WLAN无线通信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电池类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       锂电</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       电池容量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       2600 mAh</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话时间：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       C网通话时间：1020 分钟 G网通话时间：1620 分钟</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       待机时间：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       C网待机时间：320 小时 G网待机时间：330 小时 双待待机时间：290 小时</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       本地音频连续播放时长：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       48 小时</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       本地视频连续播放时长：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       8 小时</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       图形菜单：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       20宫格</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Widget功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       动画屏保：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       待机图片：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       Touch技术：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       重力感应器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       其他设计：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       加速度感应器，距离感应器，电子罗盘</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       方向感应器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       来电识别：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       铃声识别</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       免提功能：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       自动重拨：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       自动应答：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       快速拨号设置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       会议电话（三方）：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       语音拨号：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通话录音：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       号码分组：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通讯录快速查询：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       按首字母/姓名/组别/号码/模糊查询等</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       通讯录容量查询（包括话机/UIM卡通讯录容量查询）：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信群发：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       常用短信设置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信容量查询（包括话机/UIM卡容量查询）：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       短信群发数量：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       1000</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       语言支持：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       中文简体,英文,中文繁体,其他语言</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       支持文本输入类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       拼音,笔画,数字,英文,符号</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       输入法：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       T9</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       文字输入方式：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       键盘+手写双输入</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       智能操作系统：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       Android4.2</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       文件管理：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       powerpoint,pdf,word,txt,excel</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       名片扫描：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       呼入电话限制：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       开机密码保护：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       自动锁键盘：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       录音铃声设置：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       铃声编辑：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       开机闹钟：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       关机闹钟：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       语音报时：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       日历（支持农历）：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       备忘录/日程表：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       计算器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       定时器：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       秒表：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       OTA：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       MEID：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       长短信：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       彩信：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WAP：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       WAP2.0</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       BREW：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       JAVA：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       不支持</td>\r\n    </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       流媒体：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       GPSone/GPS：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       独立GPS：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WWW浏览：</td>\r\n     <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       支持</td>\r\n   </tr>\r\n   <tr id=\"kb\">\r\n      <td colspan=\"2\" height=\"20px\" style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       &nbsp;</td>\r\n   </tr>\r\n   <tr>\r\n      <td class=\"guig\" style=\"padding: 2px 5px 2px 38px; border-style: solid; border-color: rgb(204, 204, 204); font-weight: bold; line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; width: 125px; background-color: rgb(242, 242, 242); \">\r\n       WWW浏览器类型：</td>\r\n      <td style=\"padding: 0px 5px 0px 22px; border-style: solid; border-color: rgb(204, 204, 204); line-height: 26px; color: rgb(51, 51, 51); vertical-align: top; overflow: hidden; \">\r\n       WWW+WAP</td>\r\n    </tr>\r\n </tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('98', 'packingList', '<p>&nbsp;</p>\r\n<ul style=\"margin: 0px; padding-right: 0px; padding-left: 0px; list-style: none; overflow: hidden; color: rgb(51, 51, 51); font-family: \'Lucida Grande\', Arial, 宋体; line-height: 18px; \">\r\n	<li id=\"55\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"Miui/小米 \">\r\n		&nbsp;</li>\r\n</ul>\r\n');
INSERT INTO `cms_info_clob` VALUES ('98', 'introduce', '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<ul style=\"padding-right: 0px; padding-left: 0px; margin: 0px; list-style: none; overflow: hidden; color: rgb(51, 51, 51); font-family: \'Lucida Grande\', Arial, 宋体; line-height: 18px; \">\r\n	<li>\r\n		<ul>\r\n			<li id=\"55\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"Miui/小米 \">\r\n				<span style=\"color: rgb(128, 128, 128); \">品牌：</span><span class=\"attrValue\">Miui/小米</span></li>\r\n			<li id=\"39715\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"M2A \">\r\n				<span style=\"color: rgb(128, 128, 128); \">型号：</span><span class=\"attrValue\">M2A</span></li>\r\n			<li id=\"49\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"白色 \">\r\n				<span style=\"color: rgb(128, 128, 128); \">颜色：</span><span class=\"attrValue\">白色</span></li>\r\n			<li id=\"35403\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"双摄像头 \">\r\n				<span style=\"color: rgb(128, 128, 128); \">摄像头布局：</span><span class=\"attrValue\">双摄像头</span></li>\r\n			<li id=\"1\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"800万 \">\r\n				<span style=\"color: rgb(128, 128, 128); \">主摄像头像素：</span><span class=\"attrValue\">800万</span></li>\r\n			<li id=\"42355\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"200万 \">\r\n				<span style=\"color: rgb(128, 128, 128); \">副摄像头像素：</span><span class=\"attrValue\">200万</span></li>\r\n			<li id=\"12303\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"4.5英寸 \">\r\n				<span style=\"color: rgb(128, 128, 128); \">屏幕尺寸：</span><span class=\"attrValue\">4.5英寸</span></li>\r\n			<li id=\"7\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"Android-改版 \">\r\n				<span style=\"color: rgb(128, 128, 128); \">操作系统：</span><span class=\"attrValue\">Android-改版</span></li>\r\n			<li id=\"36045\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"16G \">\r\n				<span style=\"color: rgb(128, 128, 128); \">机身存储ROM：</span><span class=\"attrValue\">16G</span></li>\r\n			<li id=\"36044\" style=\"margin: 0px; padding: 0px 35.5px 0px 0px; float: left; width: 198.8000030517578px; height: 1.8em; line-height: 1.8; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; \" title=\"1G \">\r\n				<span style=\"color: rgb(128, 128, 128); \">运行内存RAM：</span><span class=\"attrValue\">1G</span></li>\r\n			<br />\r\n		</ul>\r\n	</li>\r\n</ul>\r\n');
INSERT INTO `cms_info_clob` VALUES ('98', 'services', '');
INSERT INTO `cms_info_clob` VALUES ('98', 'specification', '');
INSERT INTO `cms_info_clob` VALUES ('99', 'text', '<p>&nbsp;</p>\r\n<p>8月12日电 (记者 王欢)美国联邦公报最新公布的数据显示，2013年第二季度放弃美国国籍的人数再创新高，暴增至1131人，比去年同期的189人多出5倍。美国媒体称，美国政府为了增加税收应对拮据的财政状况，准备实施更严格的资产申报规定，使得放弃美国公民身份或绿卡的人数持续增长。</p>\r\n<p>　　报告显示，2013年到6月为止的3个月里，旅居海外的美国人向使馆申请放弃国籍、同时也放弃了美国政府税单的人数攀升到1131人，虽然在超过600万旅居海外的美国人中只占少数，但这是国税局自1998年开始公布名单以来放弃美国国籍人数最多的一个季度。今年上半年，共有1810人放弃美国国籍，是2008年全年235人的近8倍。照此速度发展，2013年可能成为&ldquo;告别美国&rdquo;具有里程碑意义的一年。</p>\r\n<p>　　据彭博社报道，在经济合作与发展组织中，唯有美国规定无论居住地是何处，美国公民都需向国家缴税。国会数据指出，美国每年因公民逃税造成的损失估计高达一亿美元。致力削减预算赤字的奥巴马政府，希望通过追查纳税人利用海外资产逃税的行为，增加国库收入。</p>\r\n<p>　　美国2010年通过的《外国账户税收遵从法》(FATCA)一旦实施，资产申报要求将会更严格。按照FATCA的条规，外国金融机构必须向美国税务局提供美国纳税人的资料，包括他们持有的外国公司实质性所有者权益。瑞士和英国等许多主要银行国家，已经同意配合美国政府披露这些资料。未向美国税务局申报足够资料的银行客户，银行可从他们账户中扣减&ldquo;与美国相关付款&rdquo;款额的30%。</p>\r\n<p>　　美国国会税收联合委员会根据这项税务法追税，未来10年估计可为政府增加87亿美元的税收。</p>\r\n<p>　　&ldquo;随着2014年7月《外国账户税收遵从法》执行日期的临近，越来越多的美国人开始意识到他们有义务向美国纳税申报。&rdquo;在瑞士苏黎世工作的美国税务律师马修(Matthew Ledvina)表示，&ldquo;一旦知道了这一点，他们就会决定放弃美国国籍。&rdquo;</p>\r\n<p>　　2012年，共有包括社会名流兼词曲作家丹尼斯&middot;里奇(Denise Rich)以及&ldquo;脸书&rdquo;(Facebook)创始人之一爱德华多&middot;萨韦林(Eduardo Saverin)在内的932名美国人放弃了美国国籍。萨韦林搬到了不征收资本利得税的新加坡；而作为亿万富翁前妻的里奇则将节省数百万美元的税费。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('100', 'text', '<p style=\"text-align:center;\"><img alt=\"\" src=\"http://demo.jspxcms.com/uploads/1/image/public/201308/20130813080255_pyeqx6.jpg\" style=\"width: 550px; height: 439px; \" /></p>\r\n<p>8月12日电 (记者 周兆军)英国和西班牙围绕直布罗陀的主权争议升级，12日，英国皇家海军的的一支快速反应部队前往地中海进行年度演习，包括&ldquo;光辉&rdquo;号航母在内的多艘军舰将前往直布罗陀海域。</p>\r\n<p>英国国防部宣布，包括&ldquo;光辉&rdquo;号航空母舰、两艘护卫舰和辅助舰只在内的10艘军舰前往地中海进行演习。英国国防部强调这次演习&ldquo;早有计划&rdquo;，属于&ldquo;例行部署&rdquo;，其发言人表示，直布罗陀是英国防卫的战略基地，因此英国海军全年都有军舰前往直布罗陀海域，这属于例行部署的一部分，派出军舰的数量和级别以及海军士兵人数都与以往一样，演习与直布罗陀争端没有关联。</p>\r\n<p>西班牙外交部表示，英方事先曾向西班牙提出申请军舰在直布罗陀海峡附近的罗塔(Rota)海军基地停靠，并获得西班牙的许可。不过，西班牙媒体认为，这次演习是英国的恐吓行为。</p>\r\n<p>在四个月的演习中，英国军舰还会前往葡萄牙、西班牙、土耳其、马耳他等国的港口进行演练，最终目的地是中东海湾地区。</p>\r\n<p>当天，英国首相府发言人表示，西班牙卫兵执行严格的安全检查，导致西班牙与直布罗陀边境交通堵塞，是&ldquo;有政治动机的、完全不适当的行为&rdquo;。卡梅伦首相对西班牙未能取消多余的边境检查感到失望，英国正考虑采取法律行动。</p>\r\n<p>西班牙方面也针锋相对，外交部发言人表示，西班牙正考虑将直布罗陀争议诉至联合国与海牙国际法庭等国际机构，并考虑与阿根廷结成统一阵线。阿根廷与英国在马尔维纳斯群岛(英国称福克兰群岛)存在主权争议。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('126', 'text', '<p>222222222222222222222222222222</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('127', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('128', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('129', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('130', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('131', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('132', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('133', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('134', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('135', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('136', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('137', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2015年3月20日经典漆地产业务部销售总监祁文及地产业务部经理张操应邀参加恒大战略合作伙伴区域交流会。<br />\r\n	战略合作伙伴区域交流会作为恒大2015年加强与优质经销商的沟通互动而采取的创新举措。恒大根据承办会议的供应商意愿与申请，安排就近区域的类别供应商集中到该承办厂商进行交流。<br />\r\n	与会供应商一行首先参观了承办厂商工厂。参观结束后，进行交流会议。会议由恒大供应商服务管理部张明明经理主持，恒大材料公司苏鑫常务副总经理作了交流报告，经典漆地产业务部销售总监祁文先生在会议上发言。<br />\r\n	<img _src=\"http://www.jadypaint.com/um/php/upload/20150327/14274202737736.jpg\" height=\"480\" src=\"http://www.jadypaint.com/um/php/upload/20150327/14274202737736.jpg\" style=\"margin: 0.5em 0px; padding: 0px; border: 0px; vertical-align: middle; max-width: 100%;\" width=\"720\" /></p>\r\n<p align=\"center\" style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">苏鑫常务副总经理介绍了2015年涂料、五金卫浴类别采购情况与2015采购预测。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">恒大对供应商的品质、交期要求之严格是众所周知的。经典漆作为涂料类别核心供应商之一，积极配合恒大发展要求及材料公司供应商管理新规则，利用自身强大过硬 的技术研发实力及分布全国各地分厂的交货优势，提供超出客户期望的产品与服务，积极与恒大驻地项目工作人员沟通交货进度及计划，提供技术交底及施工培训服务，配合施工单位提高施工效率，提高产品附加值。<br />\r\n	经典漆恒大服务团队以饱满的热情，细致专业的工作及创新的举措，必将在2015年取得卓越的工作成绩。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('138', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('139', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('140', 'text', '<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">1、色彩与分区</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程&mdash;&mdash;窗帘、床罩、楼梯&hellip;&hellip;等（主底色、强调色、点缀色），⑤装饰品（主底色及点缀色），⑥灯具、灯罩&mdash;&mdash;（主色及点缀色）等，色彩非一个平面或一个点，而是视觉区域内的一个立体呈现，故在作色彩配置时，要以整体规划为大原则，以分区手法作分割处理，才可使色彩变得协调合宜。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">2、色彩与质感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">不同的材质使色彩表现有不同的感受。因材质不同，可表现出柔软、刚烈、眩目、冰冷、平质&hellip;&hellip;等等，故在色彩的计划中，要加以实质材质色的配置，而非单纯的色票配色，就如同壁布鞋柔质的绿色与油漆光亮的绿色给予人的感受是完全不同的，要作好色彩的质感配色计划，最好是作实质样品或样本的Color List，使业主更易了解。而以透视色彩或色票配色，多与实际材料色有很大出入。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">3、色彩与面层感</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">任何材质表面皆为平直或凹凸，由平面、雾面、皮面、石材面、凹凸面，对于色彩的演出皆有不同的效果，经过非平整的细部分割，可使色彩浓度降低，加上自然分割或人为分割，可使色彩气氛更加浓郁。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">4、色彩与照明</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">照明有自然采光与人工采光，而人工照明方面因灯具及光度不同，使色彩表现演出也有很大的不同；对于自然采光因受光面大小与方向，对设计案的色彩表现也有很大的不同，故色彩计划并非单纯配色即可，必须加入照明与日照因素，甚至考虑不同的时间、场合需求照明下的色彩表现，及照明下产生光影对色彩的效果与变化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">5、色彩与界定</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩是点、是线、是面、是体时对整体设计各有不同的效果。点色彩有突出、点缀的效果，面线彩色是点彩色的集合具象征、标示及指引的效果，面彩色有片面、独立面、体的分断面效果，小的面彩色是点及线彩色的延伸，大的面彩色是体彩色的一部分，色彩的界定是将色彩作个别围括，而加以对整体作个配置，而以体彩色为基本衬底。色彩界定尤其首重线的指引、突破及次重要的独立面色彩效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">6、色彩与使用年限</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">每一种材料有一定的表面质年限，也就是装潢材的色彩与使用年限有关。在设计中，要对本设计案作年限评估，如样品展、餐厅、办公室、商店、住宅其装修年限都有不同。对于不同年限，一些因素要加以考虑，如某些使用材色彩会愈用愈褪色，某些装潢材愈用愈光亮，色泽更清晰&hellip;&hellip;等，材质色彩的选择应考虑整个使用年限内的效果。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">7、色彩与功能使用</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于不同的假想有机使用对象与使用人力分布，都应加入在我们整体色彩规划内。机能使用可分为①对象&mdash;&mdash;人②时效&mdash;&mdash;使用的时间。人与时间是活动上的两个意向轴线，随时有不同的变化，对于设计色彩上要考虑有机使用者及使用者感受的有机时效，如过分艳丽的色彩会使空间活泼、突出、有活力，若有机使用者在较长的有机时效内，会造成压迫感及不舒适，故一般展示会时，时效短、流动量大，对于浓厚、突出对比的色彩往往有很好的效果，若用在住宅、办公室委实不当。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">8、色彩与活动色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">活动色彩物是不定向的彩色质点，一般包含①动向的人与人的行为，②活动的动物，③定期或不定期的更换物如画、分栽、地毯、摆饰，④变化的灯光与灯具。活动色彩在整体色彩规划上是个很重要的因素，若装潢色彩与以后使用的色彩不能配合，将是一个有缺点的设计。活动色彩对于使用频繁而滞留时效又不太长的家居设计尤其重要。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">9、色彩与心理</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">由前述的色彩特性可知色彩对于使用者及环境有显着的影响，帮对针对不同对象的需求充分掌握使用者的心理，引正业主偏差的心理作出好的色彩计划。如多年来医院多取白色，在日光灯照射下，病菌人及工作人员的脸色更加惨白、冷酷、无情、无依，如采用协调节器的其它色彩，以工作人员及病菌人都有会感到舒适而有生气。对于延伸到室外的色彩（招牌、建物外墙及庭园）如处理不当，将会造成视而不见觉污染与不适，破坏环境的协调与美感。千万勿因一已错误的执着面造成千万人的污染及都市的丑化。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">10、色彩与形态</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">对于固定形态的设计，多应配合先行抉择的形态来作色彩计划，如法式设计案应多用白色、米色为底色；中式设计多采红木色表现传统配色。对于现代感的设计多用金属的亮灰及玻璃等透明色等。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">11、色彩与造型</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内造型可分几何形及不规则形，对于不同的造形都有有其基本的精神与特性，再考虑用何种色彩处理方式（对比、协调、统一、韵律&hellip;&hellip;），由基本造型加上色彩计划，使其要求的设计感更能表达。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">12、色彩与气氛</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计的气氛在表达设计的理想，而色彩是有形设计物的外涂装，由色彩本身的特性国上设计形的表达，可使气氛充分表现，帮要掌握色彩造成的气氛，应当对色彩本身的特性充分了解，才可善加运用。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">13、色彩与空间</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计空间本身是一个体&mdash;&mdash;单元体或者说群组体，空间的优点，可借色彩的优特性来发挥，空间的缺点也可借色彩的特性加以修正或遮饰。小空间可用明朗色加以扩大，大空间用不同色系加以分割而变为协调，狭长的空间可用色彩配合变宽，太低的空间也可用色彩使空间有提高感。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">14、色彩与音效</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">音感可加重色彩的变化感，可使无生命的固定色彩变得有生命感。音效的配合一般来说有自然音效及人工音效。自然音效有下雨声，风拂声、流水声；人工音效主要有人工瀑布、音响、助鸣器（如风铃）及机械设备等。在色彩设计上，也有必要加上音效设计配合。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">15、色彩与室外延伸</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">室内色彩对于具有穿透性及目隐性的面，应考虑室外景物色彩的延伸与室内色彩配合，尤其是大的透明或半透明面（如玻璃、压克力等）。对于一般住宅室内色彩与阳台色彩的配合就是最好的说明，室外景物的色感，对室内空间色感应负辅助的责任，切勿忽略室外延伸空间设计。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">16、色彩与保养</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">设计案材质表现的色彩随材质衰退而变质，帮对装潢材表面的保养及维护是十分重要的。在作装潢的选用时，一定要注意保养维护工作，对于不同使用者，依其自行保养的能力，配置设计色彩为主配的适当材料。由色彩的明、暗及深、浅，可知明亮、浅色多不易保养，深色、间色较耐脏，也较易保养，故选色实应了解机能、使用对象及时效。</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">17、设计色彩与体验色彩</p>\r\n<p style=\"margin: 0px 0px 0.5em; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: 微软雅黑, SimSun, Arial, sans-serif; line-height: 24px;\">色彩计划是设计师依自己判断分析加上业主意见，而决定之配色，故在决定本色前最好在类似的案例中作色彩体验，可以实质材作成的样品作实质体验，才能真正充分掌握正确的配色。以实质材小样品贴附于实际平面的图板上作成Color List 是体验色彩的最佳方式。</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('141', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('142', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('143', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('144', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('145', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('146', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('147', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('148', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('149', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('150', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('151', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('152', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('153', 'text', '<p>木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('154', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('155', 'text', '<p>博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('156', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('157', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('158', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('159', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('160', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('161', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('162', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('163', 'text', '');
INSERT INTO `cms_info_clob` VALUES ('164', 'text', '<p>博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('165', 'text', '<p>博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('166', 'text', '<p>博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('167', 'text', '<p>博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱</p>\r\n');
INSERT INTO `cms_info_clob` VALUES ('168', 'text', '<p>博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱</p>\r\n');

-- ----------------------------
-- Table structure for cms_info_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_custom`;
CREATE TABLE `cms_info_custom` (
  `f_info_id` int(11) NOT NULL,
  `f_key` varchar(50) NOT NULL COMMENT '键',
  `f_value` varchar(2000) DEFAULT NULL COMMENT '值',
  KEY `fk_cms_infocustom_info` (`f_info_id`),
  CONSTRAINT `fk_cms_infocustom_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息自定义表';

-- ----------------------------
-- Records of cms_info_custom
-- ----------------------------
INSERT INTO `cms_info_custom` VALUES ('83', 'authorization', '免费软件');
INSERT INTO `cms_info_custom` VALUES ('83', 'langue', '简体中文');
INSERT INTO `cms_info_custom` VALUES ('83', 'runEnviorment', '');
INSERT INTO `cms_info_custom` VALUES ('83', 'softType', '国产软件');
INSERT INTO `cms_info_custom` VALUES ('83', 'system', 'win8,win7,vista,winxp,win2003');
INSERT INTO `cms_info_custom` VALUES ('93', 'authorization', '免费软件');
INSERT INTO `cms_info_custom` VALUES ('93', 'langue', '简体中文');
INSERT INTO `cms_info_custom` VALUES ('93', 'system', 'win8,win7,vista,winxp,win2003');
INSERT INTO `cms_info_custom` VALUES ('93', 'runEnviorment', '');
INSERT INTO `cms_info_custom` VALUES ('93', 'softType', '国产软件');
INSERT INTO `cms_info_custom` VALUES ('94', 'physicalPic', 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808083619_8y5tal.jpg');
INSERT INTO `cms_info_custom` VALUES ('94', 'discount', '1290.00');
INSERT INTO `cms_info_custom` VALUES ('94', 'marketValue', '1690.00');
INSERT INTO `cms_info_custom` VALUES ('95', 'physicalPic', 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808092245_yefcil.jpg');
INSERT INTO `cms_info_custom` VALUES ('95', 'discount', '1799.00');
INSERT INTO `cms_info_custom` VALUES ('95', 'marketValue', '1999.00');
INSERT INTO `cms_info_custom` VALUES ('94', 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES ('95', 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES ('97', 'physicalPic', 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808092604_09mpaj.png');
INSERT INTO `cms_info_custom` VALUES ('97', 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES ('97', 'discount', '4650.00');
INSERT INTO `cms_info_custom` VALUES ('97', 'marketValue', '4950.00');
INSERT INTO `cms_info_custom` VALUES ('98', 'physicalPic', 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130812013341_4kfl1t.jpg');
INSERT INTO `cms_info_custom` VALUES ('98', 'stock', '有货');
INSERT INTO `cms_info_custom` VALUES ('98', 'discount', '999');
INSERT INTO `cms_info_custom` VALUES ('98', 'marketValue', '1200');
INSERT INTO `cms_info_custom` VALUES ('117', 'location', '南昌');
INSERT INTO `cms_info_custom` VALUES ('117', 'salary', '面议');
INSERT INTO `cms_info_custom` VALUES ('117', 'number', '5');
INSERT INTO `cms_info_custom` VALUES ('117', 'company', '南昌蓝智科技有限公司');
INSERT INTO `cms_info_custom` VALUES ('117', 'qualifications', '1.二年以上Java开发经验，Java基础知识扎实。\r\n2.熟悉JS，CSS，掌握常用的js框架，如JQuery，HTML。\r\n3.有企业级web应用开发经验，熟练掌握Web应用程序的开发调试技术。\r\n4.熟悉java开源框架，如spring，jpa，shiro等\r\n5.熟悉常用的设计模式、面向对象的分析和设计技术。\r\n6.学习能力强，沟通和表达能力良好，能迅速理解需求并给出解决方案。');
INSERT INTO `cms_info_custom` VALUES ('117', 'responsibilities', '1.根据项目的需求，负责子模块或功能的设计与开发，以及后期的升级和维护工作。\r\n2.根据开发规范与流程独立完成模块的设计、编码、测试以及相关文档。');
INSERT INTO `cms_info_custom` VALUES ('117', 'dept', '研发部');
INSERT INTO `cms_info_custom` VALUES ('118', 'location', '南昌');
INSERT INTO `cms_info_custom` VALUES ('118', 'salary', '面议');
INSERT INTO `cms_info_custom` VALUES ('118', 'number', '4');
INSERT INTO `cms_info_custom` VALUES ('118', 'company', '南昌蓝智科技有限公司');
INSERT INTO `cms_info_custom` VALUES ('118', 'qualifications', '1、一年以上网页设计或UI设计经验；熟练使用photoshop、Dreamweaver、Flash网页设计软件，并能结合项目需求设计、制作与维护商业、企业网站；\r\n2、熟练掌握DIV+CSS；\r\n3、有扎实的美术功底、良好的创意思维和理解能力，能及时把握客户需求；\r\n4、能独立负责网站作品的设计及程序制作。\r\n5、善于沟通、有良好的团队合作精神和高度的责任感、能够承受压力、对设计充满激情。');
INSERT INTO `cms_info_custom` VALUES ('118', 'responsibilities', '1、与客户进行充分沟通,进行网站视觉效果设计,并向客户进行提案取得客户认可；\r\n2、与客户建立良好关系；\r\n3、根据设计经理或组长的分配，完成其他设计任务。');
INSERT INTO `cms_info_custom` VALUES ('118', 'dept', '设计部');
INSERT INTO `cms_info_custom` VALUES ('136', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('134', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('133', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('132', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('131', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('130', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('129', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('128', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('127', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('137', 'smallimage', '/uploads/3/image/public/201503/20150328220751_8v0e3s.jpg');
INSERT INTO `cms_info_custom` VALUES ('138', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('139', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('140', 'nc', '瑞彩千呈相关知识');
INSERT INTO `cms_info_custom` VALUES ('141', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('142', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('143', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('144', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('145', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('146', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('147', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('148', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('149', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('150', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('151', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('152', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('153', 'smallimage', '/uploads/3/image/public/201503/20150328220813_euo21d.jpg');
INSERT INTO `cms_info_custom` VALUES ('154', 'smallimage', '');
INSERT INTO `cms_info_custom` VALUES ('155', 'smallimage', '');
INSERT INTO `cms_info_custom` VALUES ('156', 'smallimage', '/uploads/7/image/public/201504/20150418230449_ygt545.jpg');
INSERT INTO `cms_info_custom` VALUES ('157', 'smallimage', '/uploads/7/image/public/201504/20150418230440_6r5w9b.jpg');
INSERT INTO `cms_info_custom` VALUES ('158', 'smallimage', '/uploads/7/image/public/201504/20150418230440_6r5w9b.jpg');
INSERT INTO `cms_info_custom` VALUES ('159', 'smallimage', '/uploads/7/image/public/201504/20150418230440_6r5w9b.jpg');
INSERT INTO `cms_info_custom` VALUES ('160', 'smallimage', '/uploads/7/image/public/201504/20150418230440_6r5w9b.jpg');
INSERT INTO `cms_info_custom` VALUES ('161', 'smallimage', '/uploads/7/image/public/201504/20150418230440_6r5w9b.jpg');
INSERT INTO `cms_info_custom` VALUES ('162', 'smallimage', '/uploads/7/image/public/201504/20150418230440_6r5w9b.jpg');
INSERT INTO `cms_info_custom` VALUES ('163', 'smallimage', '/uploads/7/image/public/201504/20150418230440_6r5w9b.jpg');
INSERT INTO `cms_info_custom` VALUES ('164', 'smallimage', '');
INSERT INTO `cms_info_custom` VALUES ('165', 'smallimage', '');
INSERT INTO `cms_info_custom` VALUES ('166', 'smallimage', '');
INSERT INTO `cms_info_custom` VALUES ('167', 'smallimage', '');
INSERT INTO `cms_info_custom` VALUES ('168', 'smallimage', '');

-- ----------------------------
-- Table structure for cms_info_detail
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_detail`;
CREATE TABLE `cms_info_detail` (
  `f_info_id` int(11) NOT NULL,
  `f_title` varchar(150) NOT NULL COMMENT '主标题',
  `f_subtitle` varchar(150) DEFAULT NULL COMMENT '副标题',
  `f_full_title` varchar(150) DEFAULT NULL COMMENT '完整标题',
  `f_link` varchar(255) DEFAULT NULL COMMENT '转向链接',
  `f_is_new_window` char(1) DEFAULT NULL COMMENT '是否在新窗口打开',
  `f_color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `f_is_strong` char(1) NOT NULL DEFAULT '0' COMMENT '是否粗体',
  `f_is_em` char(1) NOT NULL DEFAULT '0' COMMENT '是否斜体',
  `f_info_path` varchar(255) DEFAULT NULL COMMENT '信息路径',
  `f_info_template` varchar(255) DEFAULT NULL COMMENT '信息模板',
  `f_meta_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_source` varchar(50) DEFAULT NULL COMMENT '来源名称',
  `f_source_url` varchar(255) DEFAULT NULL COMMENT '来源url',
  `f_author` varchar(50) DEFAULT NULL COMMENT '作者',
  `f_small_image` varchar(255) DEFAULT NULL COMMENT '小图',
  `f_large_image` varchar(255) DEFAULT NULL COMMENT '大图',
  `f_video` varchar(255) DEFAULT NULL COMMENT '视频url',
  `f_video_name` varchar(255) DEFAULT NULL COMMENT '视频名称',
  `f_file` varchar(255) DEFAULT NULL COMMENT '文件url',
  `f_file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `f_file_length` bigint(20) DEFAULT NULL COMMENT '文档长度',
  `f_is_allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  `f_step_name` varchar(100) DEFAULT NULL COMMENT '审核步骤名称',
  PRIMARY KEY (`f_info_id`),
  CONSTRAINT `fk_cms_infodetail_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息详细表';

-- ----------------------------
-- Records of cms_info_detail
-- ----------------------------
INSERT INTO `cms_info_detail` VALUES ('24', '少林寺欲将功夫融入足球培训运动员', null, null, null, null, null, '0', '0', null, null, null, '南方日报', null, '杨春', null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('25', '北京警方捣毁侵害公民信息团伙 抓获299人', null, null, null, null, null, '0', '0', null, null, null, '南方日报', null, '杨春', null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('26', '北京发布雷电黄色预警 傍晚至夜间将有大到暴雨', null, null, null, null, null, '0', '0', null, null, null, '中国广播网', null, '王军', null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('27', '聚划算成清仓专用 问题产品充斥', null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('28', '七夕前夜英仙座流星雨助兴 我国处于最佳观测区', null, null, null, null, null, '0', '0', null, null, null, '京华时报', null, '商西', null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('30', '报告称中国取代英国成世界第5大常规武器出口国', null, null, null, null, null, '0', '0', null, null, null, '环球时报', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('32', '加拿大市民抱怨“中文招牌广告过多”引争议', null, null, null, null, null, '0', '0', null, null, null, '环球时报', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('33', '汽车高速爆胎致车祸 鉴定机构回避轮胎质量问题', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130318084854_x4wvqy.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('34', '市民未插卡取款机吐出一万元 不受诱惑忙报警', null, null, null, null, null, '0', '0', null, null, null, '春城晚报', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('35', '31省市最理想伴侣地图出炉：男性最想娶川妹子', null, null, null, null, null, '0', '0', null, null, null, '中国新闻网', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('36', '调查称逾九成被调查者对中国人身份感到自豪', null, null, null, null, null, '0', '0', null, null, null, '东方网', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('37', '苹果或将季度股息提升56% 年股息将达3.7%', null, null, null, null, null, '0', '0', null, null, null, '腾讯科技', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130318091217_owcigs.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('38', '华为在德国赢得对中兴4G基站专利诉讼', null, null, null, null, null, '0', '0', null, null, null, '腾讯科技', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130318090820_h8dw6s.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('39', '夏普将错失高通3月29日的第二轮投资', null, null, null, null, null, '0', '0', null, null, null, '腾讯科技', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130318091115_3qappk.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('40', 'Jspxcms官方网站正式改版', null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('43', '凤凰传奇赚1亿 人气搭档怎么分钱', null, null, null, null, null, '0', '0', null, null, null, '腾讯娱乐', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319005453_gcalyk.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('44', '羽泉同乐会为海泉庆生 9月开唱回馈歌迷', null, null, null, null, null, '0', '0', null, null, null, '腾讯娱乐', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813072417_4y837l.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('45', '专访杨幂：“事业有成”离我很远 不着急完婚', null, null, null, null, null, '0', '0', null, null, null, '腾讯娱乐', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319010624_en4gsf.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('46', '范冰冰熊抱李治廷威武霸气 戴戒指暗示名花有主', null, null, null, null, null, '0', '0', null, null, null, '腾讯娱乐', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813074358_b07hjf.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('47', '足协曾忧王迪成\"定时炸弹\" 两次漏判国安点球', null, null, null, null, null, '0', '0', null, null, null, '腾讯体育', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('48', '热火不败继续称霸实力榜 湖人升至第9火箭第11', null, null, null, null, null, '0', '0', null, null, null, '新华网', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('49', '足协或罚武汉暴力后卫停赛2场 格隆停赛不变', null, null, null, null, null, '0', '0', null, null, null, '腾讯体育', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319012002_dsuaw3.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('50', '西媒：巴萨巴黎巅峰对决 皇马上签穆帅会老友', null, null, null, null, null, '0', '0', null, null, null, '腾讯体育', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319012426_unib1p.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('52', '尚德宣布可转债违约 成大陆首家公司债违约企业', null, null, null, null, null, '0', '0', null, null, null, '腾讯财经', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('53', '俄媒：苏联为买军火曾贿赂罗斯福', null, null, null, null, null, '0', '0', null, null, null, '新华网', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('54', 'WSJ：中国正在重蹈美国金融危机覆辙', null, null, null, null, null, '0', '0', null, null, null, '东方网', null, '李军', null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('55', '传中兴管理人员被蒙古国反贪局逮捕 公司否认', null, null, null, null, null, '0', '0', null, null, null, '环球时报', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130319013842_536jdy.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('64', '欢迎浏览！', null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('70', 'Jspxcms演示站正式上线', null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('71', 'Jspxcms1.0发布公告', null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('72', 'Jspxcms2.0发布公告', null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('73', '杨钰莹再谈与赖文峰恋情 面对爱情并不后悔', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130814133153_a6qtv0.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('78', '凯蒂-佩里激情戏水 泳裤滑落尴尬露臀', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813073812_3sey4w.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('79', '欧洲最高瀑布：冰岛黛提瀑布', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813073542_b9g8sv.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('80', '第十二届全运会礼仪小姐训练实拍', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813062009_6k7xe6.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('81', '中气象台再发高温预警 浙湘渝局地气温达42℃', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813072752_n45cbc.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('83', '搜狗输入法(搜狗拼音) 7.1c', null, null, null, null, null, '0', '0', null, null, '搜狗输入法(搜狗拼音) 7.1c', null, null, null, null, null, null, null, 'http://cndns2.newhua.com/down/sogou_pinyin_71c.zip', 'sogou_pinyin_71c.zip', '36194023', null, null);
INSERT INTO `cms_info_detail` VALUES ('84', '2014款英菲尼迪Q50 3.7L V6轿跑车试驾', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808021152_1li3ra.png', null, 'http://demo.jspxcms.com/uploads/1/video/public/201308/20130808021606_g9yyg0.flv', '2014款英菲尼迪Q50 3.7L V6轿跑车试驾 标清.flv', null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('85', '看的鼻血狂喷-上豪车赏美女首尔车展玩疯色迷主持', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808022350_0y3fpc.png', null, 'http://demo.jspxcms.com/uploads/1/video/public/201308/20130808022323_wvx3el.flv', '看的鼻血狂喷-上豪车赏美女首尔车展玩疯色迷主持 标清.flv', null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('86', 'iOS 7 beta 5测试版 10大新功能演示', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808024425_ygjxp7.png', null, 'http://demo.jspxcms.com/uploads/1/video/public/201308/20130808024617_p7ki4a.flv', 'iOS 7 beta 5测试版 10大新功能演示 标清.flv', null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('87', '英先生秀VOL.5 纯爷们的射击日常！那些游戏中的奇葩枪械', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808024839_whv1nr.png', null, 'http://demo.jspxcms.com/uploads/1/video/public/201308/20130808025310_xip5q8.flv', '英先生秀VOL.5 纯爷们的射击日常！那些游戏中的奇葩枪械！ 标清.flv', null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('93', '腾讯QQ 5.2', null, null, null, null, null, '0', '0', null, null, '免费的即时聊天软件，给上网带来更多沟通乐趣。腾讯QQ2013年度皮肤呈现视觉盛宴，皮肤编辑器实现个性化面板创意；QQ应用盒子全新呈现，丰富应用满足多彩生活；QQ短信首度面世，畅享无处不在的沟通体验；炫彩字体，炫出聊天个性与风采；QQ支持自定义标签，标签顺序随心换。提示：如果您正在运行着腾讯QQ或者T', null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808073151_sa03fk.jpg', null, null, null, 'http://sqdx.newhua.com/down/QQ5.2.zip', 'QQ5.2.zip', '59068088', null, null);
INSERT INTO `cms_info_detail` VALUES ('94', '摩托罗拉 XT553 律动黑 4寸大屏/双网双待/android2.3/独立音乐播放键/时尚元素一网打尽/超级好“玩”！ 双网双待！劲爆直降！全网最低！数量有限，先到先得！', null, null, null, null, '#FF0000', '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808081244_moa6gd.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('95', '华为麦芒 A199 红色- 5.0’ / 四核1.5GHz/双网双待/ Android4.1 /主摄头：800万像素，副摄头:130万像素/ RAM：2GB，ROM:8GB', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808092241_ha9a93.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('97', '三星 i959 蓝色 - GALAXY S4 / 5.0\'Full HD/ 四核1.6GHz+四核1.2GHz /双网双待/ Android4.2 /主摄头:1300万像素,副摄头:200万像素/ RAM:2GB,ROM:16GB/ 三星S4火热上市！', null, null, null, null, null, '0', '0', null, null, null, null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130808092559_t2cufb.png', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('98', '999元抢购 MIUI/小米2A小米M2A小米手机2A 标准版16G 国行15', null, null, null, null, null, '0', '0', null, null, '999元抢购 MIUI/小米2A小米M2A小米手机2A 标准版16G 国行15', null, null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130812013337_ijdj9f.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('99', '美官方统计：为避税放弃美国国籍人数1年暴增5倍', null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('100', '英国派军舰赴地中海演习 西班牙称是恐吓行为', null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('117', 'Java开发工程师', null, null, null, null, null, '0', '0', null, null, 'Java开发工程师', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('118', '网页设计师', null, null, null, null, null, '0', '0', null, null, '网页设计师', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('126', '2222', null, null, null, null, '#330033', '1', '0', null, null, '222', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('127', '装修色彩理论', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('128', '木器漆病分析-光泽不均匀', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('129', '色彩与五行', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('130', '如何辨别真假沙比利木？', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('131', '乳胶漆的施工工艺', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('132', '木器漆病分析-开裂', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('133', '经典漆教您识板材-樱桃木', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('134', '聚酯漆基本介绍', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('135', '水性木器漆基本介绍', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('136', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('137', '经典漆参加2015年恒大战略合作伙伴区域交流会', null, null, null, null, null, '0', '0', null, null, '2015年3月20日经典漆地产业务部销售总监祁文及地产业务部经理张操应邀参加恒大战略合作伙伴区域交流会。\r\n	战略合作伙伴区域交流会作为恒大2015年加强与优质经销商的沟通互动而采取的创新举措。恒大根据承办会议的供应商意愿与申请，安排就近区域的类别供应商集中到该承办厂商进行交流。\r\n	与会供应商一行', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('138', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('139', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('140', '如何辨别真假沙比利木？', null, null, null, null, null, '0', '0', null, null, '1、色彩与分区\r\n室内设计作色彩配置先要了解整体及分区，一般可依作用独立者作机能性区分，即可分为①墙面（主墙、次主墙、一般底墙及点缀墙），②天花板（主景及次景及点缀景），地板面（主地面、次地面及点缀面），③家具、隔屏（底色、强调色、点缀色），④附属工程——窗帘、床罩、楼梯……等（主底色、强调色、点缀', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('141', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('142', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('143', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('144', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('145', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('146', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('147', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('148', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('149', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('150', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('151', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('152', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('153', '木器漆病分析-渗色', null, null, null, null, null, '0', '0', null, null, '木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析-渗色木器漆病分析', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('154', '测试', null, null, null, null, null, '0', '0', null, null, '测试', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('155', '博创科技浅析网站应该如何获得流量柔柔弱弱', null, null, null, null, null, '0', '0', null, null, '博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱\r\n', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('156', '潍坊海瑞通机电设备有限公司', null, null, null, null, null, '0', '0', null, null, '我公司专业从事各种与涂料、建筑腻子、干粉砂浆生产、粉末加工有关的机械设备、实验室仪器的加工和销售。涂料、建筑腻子、干粉砂浆生产机械主要包括分散机、研磨机、搅拌机、灌装机等单机和成套设备；粉末加工机械主要包括气流磨、震动磨、机械磨、分级机、风机和脉冲除尘器等单机和成套设备。', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('157', '安丘快直送货物运输公司', null, null, null, null, null, '0', '0', null, null, '安丘快直送位于安丘市东联物流园B栋7-8号，我公司主要承接全国各个市县区的货物运输业务。公司常年承担着通用机械厂、三源铝业、汶瑞机械、潍坊科创、精华粉体、亿佳节能、博莱特、奥宗麦克斯、奥诺臭氧、德信机械、科扬机械、耀发机械、宇洋机械、大昌机械、信金机械、东翰机械、容大液袋、华安锅炉、恒安散热器、天一生物、金贝尔生物、嘉林生物、新生力等公司企业的物流运输服务。我公司还办理代收货款业务，手续费低、回款及时，安全有保障。', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('158', '安丘快直送货物运输公司', null, null, null, null, null, '0', '0', null, null, '安丘快直送位于安丘市东联物流园B栋7-8号，我公司主要承接全国各个市县区的货物运输业务。公司常年承担着通用机械厂、三源铝业、汶瑞机械、潍坊科创、精华粉体、亿佳节能、博莱特、奥宗麦克斯、奥诺臭氧、德信机械、科扬机械、耀发机械、宇洋机械、大昌机械、信金机械、东翰机械、容大液袋、华安锅炉、恒安散热器、天一生物、金贝尔生物、嘉林生物、新生力等公司企业的物流运输服务。我公司还办理代收货款业务，手续费低、回款及时，安全有保障。', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('159', '安丘快直送货物运输公司', null, null, null, null, null, '0', '0', null, null, '安丘快直送位于安丘市东联物流园B栋7-8号，我公司主要承接全国各个市县区的货物运输业务。公司常年承担着通用机械厂、三源铝业、汶瑞机械、潍坊科创、精华粉体、亿佳节能、博莱特、奥宗麦克斯、奥诺臭氧、德信机械、科扬机械、耀发机械、宇洋机械、大昌机械、信金机械、东翰机械、容大液袋、华安锅炉、恒安散热器、天一生物、金贝尔生物、嘉林生物、新生力等公司企业的物流运输服务。我公司还办理代收货款业务，手续费低、回款及时，安全有保障。', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('160', '安丘快直送货物运输公司', null, null, null, null, null, '0', '0', null, null, '安丘快直送位于安丘市东联物流园B栋7-8号，我公司主要承接全国各个市县区的货物运输业务。公司常年承担着通用机械厂、三源铝业、汶瑞机械、潍坊科创、精华粉体、亿佳节能、博莱特、奥宗麦克斯、奥诺臭氧、德信机械、科扬机械、耀发机械、宇洋机械、大昌机械、信金机械、东翰机械、容大液袋、华安锅炉、恒安散热器、天一生物、金贝尔生物、嘉林生物、新生力等公司企业的物流运输服务。我公司还办理代收货款业务，手续费低、回款及时，安全有保障。', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('161', '安丘快直送货物运输公司', null, null, null, null, null, '0', '0', null, null, '安丘快直送位于安丘市东联物流园B栋7-8号，我公司主要承接全国各个市县区的货物运输业务。公司常年承担着通用机械厂、三源铝业、汶瑞机械、潍坊科创、精华粉体、亿佳节能、博莱特、奥宗麦克斯、奥诺臭氧、德信机械、科扬机械、耀发机械、宇洋机械、大昌机械、信金机械、东翰机械、容大液袋、华安锅炉、恒安散热器、天一生物、金贝尔生物、嘉林生物、新生力等公司企业的物流运输服务。我公司还办理代收货款业务，手续费低、回款及时，安全有保障。', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('162', '安丘快直送货物运输公司', null, null, null, null, null, '0', '0', null, null, '安丘快直送位于安丘市东联物流园B栋7-8号，我公司主要承接全国各个市县区的货物运输业务。公司常年承担着通用机械厂、三源铝业、汶瑞机械、潍坊科创、精华粉体、亿佳节能、博莱特、奥宗麦克斯、奥诺臭氧、德信机械、科扬机械、耀发机械、宇洋机械、大昌机械、信金机械、东翰机械、容大液袋、华安锅炉、恒安散热器、天一生物、金贝尔生物、嘉林生物、新生力等公司企业的物流运输服务。我公司还办理代收货款业务，手续费低、回款及时，安全有保障。', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('163', '安丘快直送货物运输公司', null, null, null, null, null, '0', '0', null, null, '安丘快直送位于安丘市东联物流园B栋7-8号，我公司主要承接全国各个市县区的货物运输业务。公司常年承担着通用机械厂、三源铝业、汶瑞机械、潍坊科创、精华粉体、亿佳节能、博莱特、奥宗麦克斯、奥诺臭氧、德信机械、科扬机械、耀发机械、宇洋机械、大昌机械、信金机械、东翰机械、容大液袋、华安锅炉、恒安散热器、天一生物、金贝尔生物、嘉林生物、新生力等公司企业的物流运输服务。我公司还办理代收货款业务，手续费低、回款及时，安全有保障。', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('164', '博创科技浅析网站应该如何获得流量柔柔弱弱', null, null, null, null, null, '0', '0', null, null, '博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('165', '为儿童为儿童为儿童', null, null, null, null, null, '0', '0', null, null, '博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('166', '三十多分公司的分公司的风格', null, null, null, null, null, '0', '0', null, null, '博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('167', '博创科技浅析网站应该如何获得流量柔柔弱弱', null, null, null, null, null, '0', '0', null, null, '博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_info_detail` VALUES ('168', '收费规范的规范规定过后', null, null, null, null, null, '0', '0', null, null, '博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱博创科技浅析网站应该如何获得流量柔柔弱弱', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for cms_info_file
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_file`;
CREATE TABLE `cms_info_file` (
  `f_info_id` int(11) NOT NULL,
  `f_name` varchar(150) NOT NULL COMMENT '文件名称',
  `f_length` bigint(20) NOT NULL DEFAULT '0' COMMENT '文件长度',
  `f_file` varchar(255) NOT NULL COMMENT '文件地址',
  `f_index` int(11) NOT NULL DEFAULT '0' COMMENT '文件序号',
  `f_downloads` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  KEY `fk_cms_infofile_info` (`f_info_id`),
  CONSTRAINT `fk_cms_infofile_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息附件集表';

-- ----------------------------
-- Records of cms_info_file
-- ----------------------------

-- ----------------------------
-- Table structure for cms_info_image
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_image`;
CREATE TABLE `cms_info_image` (
  `f_info_id` int(11) NOT NULL,
  `f_name` varchar(150) DEFAULT NULL COMMENT '图片名称',
  `f_image` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `f_index` int(11) NOT NULL DEFAULT '0' COMMENT '图片序号',
  `f_text` longtext COMMENT '图片正文',
  KEY `fk_cms_infoimage_info` (`f_info_id`),
  CONSTRAINT `fk_cms_infoimage_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息图片集表';

-- ----------------------------
-- Records of cms_info_image
-- ----------------------------
INSERT INTO `cms_info_image` VALUES ('78', null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813073818_1ijjw4.jpg', '0', '凯蒂·佩里近日几个友人在水上公园游玩，身着黑色比基尼套装的“水果姐”玩到兴头上，力度太大，泳裤不慎滑落，露出雪白丰腴的美臀。');
INSERT INTO `cms_info_image` VALUES ('78', null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813073846_me1wrq.jpg', '1', null);
INSERT INTO `cms_info_image` VALUES ('79', null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813073525_6bya46.jpg', '0', '黛提瀑布(Dettifoss)是冰岛共和国东北方、Jokulsargljufur国家公园米湖(Myvatn)湖区附近的瀑布，源流是瓦特纳冰原，坐落于菲约德勒姆冰河，并流入峡谷中。黛提瀑布宽度约100米，高度有44米，被认为是欧洲最高、最汹涌的瀑布。流量因季节而异，枯水期约有每秒200立方米;夏季冰融使河水增加，流量也达到500立方米。知名影片《普罗米修斯》也曾在此取景');
INSERT INTO `cms_info_image` VALUES ('79', null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813073612_q6m4kt.jpg', '1', '黛提瀑布(Dettifoss)是冰岛共和国东北方、Jokulsargljufur国家公园米湖(Myvatn)湖区附近的瀑布，源流是瓦特纳冰原，坐落于菲约德勒姆冰河，并流入峡谷中。黛提瀑布宽度约100米，高度有44米，被认为是欧洲最高、最汹涌的瀑布。流量因季节而异，枯水期约有每秒200立方米;夏季冰融使河水增加，流量也达到500立方米。知名影片《普罗米修斯》也曾在此取景。');
INSERT INTO `cms_info_image` VALUES ('80', null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813063704_4gflo6.jpg', '0', '8月11日，第十二届全运会（十二运）礼仪引导志愿者封闭训练。当日，在沈阳体育学院开放十二运礼仪引导志愿者媒体开放日活动。第十二届全运会将于2013年8月31日至9月12日在辽宁举行，历时13天。');
INSERT INTO `cms_info_image` VALUES ('80', null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813064757_oppd1r.jpg', '1', '8月11日，第十二届全运会（十二运）礼仪引导志愿者封闭训练。');
INSERT INTO `cms_info_image` VALUES ('80', null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813064842_iey6ge.jpg', '2', '8月11日，第十二届全运会（十二运）礼仪引导志愿者封闭训练。');
INSERT INTO `cms_info_image` VALUES ('81', null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813072804_clocm9.jpg', '0', '8月11日，一位年轻人在合肥一家水上乐园戏水。在连续16天发布高温橙色预警之后，合肥市气象台于当日上午将高温橙色预警信号提升为红色，这是该市有气象记录以来首次发布高温红色预警信号。');
INSERT INTO `cms_info_image` VALUES ('81', null, 'http://demo.jspxcms.com/uploads/1/image/public/201308/20130813072914_56u0hi.jpg', '1', '当日，杭州城区最高气温达到40℃以上，自8月5日起杭州已连续8天最高气温超过40℃。据浙江省气象台监测，截至16时，全省共有16个县（市、区）最高气温达40℃以上，其中6个县（市、区）达41℃以上，高温范围比前期（8-11日）已明显缩小。浙江省气象部门预计13日全省高温范围将继续缩小，并更改高温红色预警信号为高温橙色预警信号。');

-- ----------------------------
-- Table structure for cms_info_membergroup
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_membergroup`;
CREATE TABLE `cms_info_membergroup` (
  `f_infomgroup_id` int(11) NOT NULL,
  `f_membergroup_id` int(11) NOT NULL,
  `f_info_id` int(11) NOT NULL,
  `f_is_view_perm` char(1) NOT NULL DEFAULT '0' COMMENT '是否有浏览权限',
  PRIMARY KEY (`f_infomgroup_id`),
  KEY `fk_cms_infomgroup_info` (`f_info_id`),
  KEY `fk_cms_infomgroup_mgroup` (`f_membergroup_id`),
  CONSTRAINT `fk_cms_infomgroup_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`),
  CONSTRAINT `fk_cms_infomgroup_mgroup` FOREIGN KEY (`f_membergroup_id`) REFERENCES `cms_member_group` (`f_membergroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息与会员组权限表';

-- ----------------------------
-- Records of cms_info_membergroup
-- ----------------------------
INSERT INTO `cms_info_membergroup` VALUES ('33', '0', '93', '0');
INSERT INTO `cms_info_membergroup` VALUES ('34', '1', '93', '0');
INSERT INTO `cms_info_membergroup` VALUES ('35', '0', '83', '0');
INSERT INTO `cms_info_membergroup` VALUES ('36', '1', '83', '0');
INSERT INTO `cms_info_membergroup` VALUES ('37', '0', '117', '0');
INSERT INTO `cms_info_membergroup` VALUES ('38', '1', '117', '0');
INSERT INTO `cms_info_membergroup` VALUES ('39', '0', '118', '0');
INSERT INTO `cms_info_membergroup` VALUES ('40', '1', '118', '0');
INSERT INTO `cms_info_membergroup` VALUES ('53', '0', '126', '0');
INSERT INTO `cms_info_membergroup` VALUES ('54', '1', '126', '0');
INSERT INTO `cms_info_membergroup` VALUES ('55', '0', '127', '0');
INSERT INTO `cms_info_membergroup` VALUES ('56', '1', '127', '0');
INSERT INTO `cms_info_membergroup` VALUES ('57', '0', '128', '0');
INSERT INTO `cms_info_membergroup` VALUES ('58', '1', '128', '0');
INSERT INTO `cms_info_membergroup` VALUES ('59', '0', '129', '0');
INSERT INTO `cms_info_membergroup` VALUES ('60', '1', '129', '0');
INSERT INTO `cms_info_membergroup` VALUES ('61', '0', '130', '0');
INSERT INTO `cms_info_membergroup` VALUES ('62', '1', '130', '0');
INSERT INTO `cms_info_membergroup` VALUES ('63', '0', '131', '0');
INSERT INTO `cms_info_membergroup` VALUES ('64', '1', '131', '0');
INSERT INTO `cms_info_membergroup` VALUES ('65', '0', '132', '0');
INSERT INTO `cms_info_membergroup` VALUES ('66', '1', '132', '0');
INSERT INTO `cms_info_membergroup` VALUES ('67', '0', '133', '0');
INSERT INTO `cms_info_membergroup` VALUES ('68', '1', '133', '0');
INSERT INTO `cms_info_membergroup` VALUES ('69', '0', '134', '0');
INSERT INTO `cms_info_membergroup` VALUES ('70', '1', '134', '0');
INSERT INTO `cms_info_membergroup` VALUES ('71', '0', '135', '0');
INSERT INTO `cms_info_membergroup` VALUES ('72', '1', '135', '0');
INSERT INTO `cms_info_membergroup` VALUES ('73', '0', '136', '0');
INSERT INTO `cms_info_membergroup` VALUES ('74', '1', '136', '0');
INSERT INTO `cms_info_membergroup` VALUES ('75', '0', '137', '0');
INSERT INTO `cms_info_membergroup` VALUES ('76', '1', '137', '0');
INSERT INTO `cms_info_membergroup` VALUES ('77', '0', '138', '0');
INSERT INTO `cms_info_membergroup` VALUES ('78', '1', '138', '0');
INSERT INTO `cms_info_membergroup` VALUES ('79', '0', '139', '0');
INSERT INTO `cms_info_membergroup` VALUES ('80', '1', '139', '0');
INSERT INTO `cms_info_membergroup` VALUES ('81', '0', '140', '0');
INSERT INTO `cms_info_membergroup` VALUES ('82', '1', '140', '0');
INSERT INTO `cms_info_membergroup` VALUES ('83', '0', '141', '0');
INSERT INTO `cms_info_membergroup` VALUES ('84', '1', '141', '0');
INSERT INTO `cms_info_membergroup` VALUES ('85', '0', '142', '0');
INSERT INTO `cms_info_membergroup` VALUES ('86', '1', '142', '0');
INSERT INTO `cms_info_membergroup` VALUES ('87', '0', '143', '0');
INSERT INTO `cms_info_membergroup` VALUES ('88', '1', '143', '0');
INSERT INTO `cms_info_membergroup` VALUES ('89', '0', '144', '0');
INSERT INTO `cms_info_membergroup` VALUES ('90', '1', '144', '0');
INSERT INTO `cms_info_membergroup` VALUES ('91', '0', '145', '0');
INSERT INTO `cms_info_membergroup` VALUES ('92', '1', '145', '0');
INSERT INTO `cms_info_membergroup` VALUES ('93', '0', '146', '0');
INSERT INTO `cms_info_membergroup` VALUES ('94', '1', '146', '0');
INSERT INTO `cms_info_membergroup` VALUES ('95', '0', '147', '0');
INSERT INTO `cms_info_membergroup` VALUES ('96', '1', '147', '0');
INSERT INTO `cms_info_membergroup` VALUES ('97', '0', '148', '0');
INSERT INTO `cms_info_membergroup` VALUES ('98', '1', '148', '0');
INSERT INTO `cms_info_membergroup` VALUES ('99', '0', '149', '0');
INSERT INTO `cms_info_membergroup` VALUES ('100', '1', '149', '0');
INSERT INTO `cms_info_membergroup` VALUES ('101', '0', '150', '0');
INSERT INTO `cms_info_membergroup` VALUES ('102', '1', '150', '0');
INSERT INTO `cms_info_membergroup` VALUES ('103', '0', '151', '0');
INSERT INTO `cms_info_membergroup` VALUES ('104', '1', '151', '0');
INSERT INTO `cms_info_membergroup` VALUES ('105', '0', '152', '0');
INSERT INTO `cms_info_membergroup` VALUES ('106', '1', '152', '0');
INSERT INTO `cms_info_membergroup` VALUES ('107', '0', '153', '0');
INSERT INTO `cms_info_membergroup` VALUES ('108', '1', '153', '0');
INSERT INTO `cms_info_membergroup` VALUES ('109', '0', '154', '0');
INSERT INTO `cms_info_membergroup` VALUES ('110', '1', '154', '0');
INSERT INTO `cms_info_membergroup` VALUES ('111', '0', '98', '0');
INSERT INTO `cms_info_membergroup` VALUES ('112', '1', '98', '0');
INSERT INTO `cms_info_membergroup` VALUES ('113', '0', '155', '0');
INSERT INTO `cms_info_membergroup` VALUES ('114', '1', '155', '0');
INSERT INTO `cms_info_membergroup` VALUES ('115', '0', '156', '0');
INSERT INTO `cms_info_membergroup` VALUES ('116', '1', '156', '0');
INSERT INTO `cms_info_membergroup` VALUES ('117', '0', '157', '0');
INSERT INTO `cms_info_membergroup` VALUES ('118', '1', '157', '0');
INSERT INTO `cms_info_membergroup` VALUES ('119', '0', '158', '0');
INSERT INTO `cms_info_membergroup` VALUES ('120', '1', '158', '0');
INSERT INTO `cms_info_membergroup` VALUES ('121', '0', '159', '0');
INSERT INTO `cms_info_membergroup` VALUES ('122', '1', '159', '0');
INSERT INTO `cms_info_membergroup` VALUES ('123', '0', '160', '0');
INSERT INTO `cms_info_membergroup` VALUES ('124', '1', '160', '0');
INSERT INTO `cms_info_membergroup` VALUES ('125', '0', '161', '0');
INSERT INTO `cms_info_membergroup` VALUES ('126', '1', '161', '0');
INSERT INTO `cms_info_membergroup` VALUES ('127', '0', '162', '0');
INSERT INTO `cms_info_membergroup` VALUES ('128', '1', '162', '0');
INSERT INTO `cms_info_membergroup` VALUES ('129', '0', '163', '0');
INSERT INTO `cms_info_membergroup` VALUES ('130', '1', '163', '0');
INSERT INTO `cms_info_membergroup` VALUES ('131', '0', '164', '0');
INSERT INTO `cms_info_membergroup` VALUES ('132', '1', '164', '0');
INSERT INTO `cms_info_membergroup` VALUES ('133', '0', '165', '0');
INSERT INTO `cms_info_membergroup` VALUES ('134', '1', '165', '0');
INSERT INTO `cms_info_membergroup` VALUES ('135', '0', '166', '0');
INSERT INTO `cms_info_membergroup` VALUES ('136', '1', '166', '0');
INSERT INTO `cms_info_membergroup` VALUES ('137', '0', '167', '0');
INSERT INTO `cms_info_membergroup` VALUES ('138', '1', '167', '0');
INSERT INTO `cms_info_membergroup` VALUES ('139', '0', '168', '0');
INSERT INTO `cms_info_membergroup` VALUES ('140', '1', '168', '0');

-- ----------------------------
-- Table structure for cms_info_node
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_node`;
CREATE TABLE `cms_info_node` (
  `f_infonode_id` int(11) NOT NULL,
  `f_info_id` int(11) NOT NULL COMMENT '信息',
  `f_node_id` int(11) NOT NULL COMMENT '节点',
  `f_node_index` int(11) NOT NULL DEFAULT '0' COMMENT '节点顺序',
  PRIMARY KEY (`f_infonode_id`),
  KEY `fk_cms_infonode_info` (`f_info_id`),
  KEY `fk_cms_infonode_node` (`f_node_id`),
  CONSTRAINT `fk_cms_infonode_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`),
  CONSTRAINT `fk_cms_infonode_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息与节点关联表';

-- ----------------------------
-- Records of cms_info_node
-- ----------------------------
INSERT INTO `cms_info_node` VALUES ('10', '47', '40', '0');
INSERT INTO `cms_info_node` VALUES ('11', '48', '40', '0');
INSERT INTO `cms_info_node` VALUES ('22', '33', '43', '0');
INSERT INTO `cms_info_node` VALUES ('23', '34', '43', '0');
INSERT INTO `cms_info_node` VALUES ('29', '32', '44', '0');
INSERT INTO `cms_info_node` VALUES ('30', '40', '45', '0');
INSERT INTO `cms_info_node` VALUES ('31', '64', '45', '0');
INSERT INTO `cms_info_node` VALUES ('32', '70', '45', '0');
INSERT INTO `cms_info_node` VALUES ('33', '71', '45', '0');
INSERT INTO `cms_info_node` VALUES ('34', '72', '45', '0');
INSERT INTO `cms_info_node` VALUES ('134', '35', '43', '-1');
INSERT INTO `cms_info_node` VALUES ('141', '28', '42', '-1');
INSERT INTO `cms_info_node` VALUES ('142', '26', '42', '-1');
INSERT INTO `cms_info_node` VALUES ('143', '25', '42', '-1');
INSERT INTO `cms_info_node` VALUES ('145', '36', '43', '-1');
INSERT INTO `cms_info_node` VALUES ('158', '24', '42', '-1');
INSERT INTO `cms_info_node` VALUES ('159', '100', '44', '-1');
INSERT INTO `cms_info_node` VALUES ('160', '99', '44', '-1');
INSERT INTO `cms_info_node` VALUES ('161', '30', '44', '-1');
INSERT INTO `cms_info_node` VALUES ('162', '81', '48', '-1');
INSERT INTO `cms_info_node` VALUES ('163', '80', '48', '-1');
INSERT INTO `cms_info_node` VALUES ('164', '79', '48', '-1');
INSERT INTO `cms_info_node` VALUES ('165', '78', '48', '-1');
INSERT INTO `cms_info_node` VALUES ('166', '87', '51', '-1');
INSERT INTO `cms_info_node` VALUES ('167', '86', '51', '-1');
INSERT INTO `cms_info_node` VALUES ('168', '85', '51', '-1');
INSERT INTO `cms_info_node` VALUES ('169', '84', '51', '-1');
INSERT INTO `cms_info_node` VALUES ('170', '55', '41', '-1');
INSERT INTO `cms_info_node` VALUES ('171', '54', '41', '-1');
INSERT INTO `cms_info_node` VALUES ('172', '53', '41', '-1');
INSERT INTO `cms_info_node` VALUES ('173', '52', '41', '-1');
INSERT INTO `cms_info_node` VALUES ('174', '46', '38', '-1');
INSERT INTO `cms_info_node` VALUES ('175', '44', '38', '-1');
INSERT INTO `cms_info_node` VALUES ('176', '43', '38', '-1');
INSERT INTO `cms_info_node` VALUES ('177', '73', '38', '-1');
INSERT INTO `cms_info_node` VALUES ('178', '45', '38', '-1');
INSERT INTO `cms_info_node` VALUES ('179', '50', '40', '-1');
INSERT INTO `cms_info_node` VALUES ('180', '49', '40', '-1');
INSERT INTO `cms_info_node` VALUES ('181', '39', '39', '-1');
INSERT INTO `cms_info_node` VALUES ('182', '38', '39', '-1');
INSERT INTO `cms_info_node` VALUES ('183', '37', '39', '-1');
INSERT INTO `cms_info_node` VALUES ('184', '27', '39', '-1');
INSERT INTO `cms_info_node` VALUES ('186', '97', '52', '-1');
INSERT INTO `cms_info_node` VALUES ('187', '95', '52', '-1');
INSERT INTO `cms_info_node` VALUES ('193', '94', '52', '-1');
INSERT INTO `cms_info_node` VALUES ('214', '83', '49', '-1');
INSERT INTO `cms_info_node` VALUES ('216', '93', '49', '-1');
INSERT INTO `cms_info_node` VALUES ('217', '117', '69', '-1');
INSERT INTO `cms_info_node` VALUES ('218', '118', '69', '-1');
INSERT INTO `cms_info_node` VALUES ('226', '126', '74', '-1');
INSERT INTO `cms_info_node` VALUES ('242', '136', '84', '-1');
INSERT INTO `cms_info_node` VALUES ('244', '135', '84', '-1');
INSERT INTO `cms_info_node` VALUES ('245', '134', '85', '-1');
INSERT INTO `cms_info_node` VALUES ('247', '133', '84', '-1');
INSERT INTO `cms_info_node` VALUES ('248', '131', '86', '-1');
INSERT INTO `cms_info_node` VALUES ('249', '130', '85', '-1');
INSERT INTO `cms_info_node` VALUES ('250', '129', '85', '-1');
INSERT INTO `cms_info_node` VALUES ('251', '128', '84', '-1');
INSERT INTO `cms_info_node` VALUES ('252', '127', '86', '-1');
INSERT INTO `cms_info_node` VALUES ('258', '137', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('259', '138', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('261', '139', '85', '-1');
INSERT INTO `cms_info_node` VALUES ('262', '132', '86', '-1');
INSERT INTO `cms_info_node` VALUES ('263', '140', '86', '-1');
INSERT INTO `cms_info_node` VALUES ('264', '141', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('265', '142', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('266', '143', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('267', '144', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('268', '145', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('269', '146', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('270', '147', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('271', '148', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('272', '149', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('273', '150', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('274', '151', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('275', '152', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('276', '153', '77', '-1');
INSERT INTO `cms_info_node` VALUES ('277', '154', '87', '-1');
INSERT INTO `cms_info_node` VALUES ('279', '98', '52', '-1');
INSERT INTO `cms_info_node` VALUES ('280', '155', '117', '-1');
INSERT INTO `cms_info_node` VALUES ('282', '157', '113', '-1');
INSERT INTO `cms_info_node` VALUES ('283', '156', '113', '-1');
INSERT INTO `cms_info_node` VALUES ('284', '158', '113', '-1');
INSERT INTO `cms_info_node` VALUES ('285', '159', '113', '-1');
INSERT INTO `cms_info_node` VALUES ('286', '160', '113', '-1');
INSERT INTO `cms_info_node` VALUES ('287', '161', '113', '-1');
INSERT INTO `cms_info_node` VALUES ('288', '162', '113', '-1');
INSERT INTO `cms_info_node` VALUES ('289', '163', '113', '-1');
INSERT INTO `cms_info_node` VALUES ('290', '164', '117', '-1');
INSERT INTO `cms_info_node` VALUES ('293', '167', '117', '-1');
INSERT INTO `cms_info_node` VALUES ('294', '166', '117', '-1');
INSERT INTO `cms_info_node` VALUES ('295', '168', '117', '-1');
INSERT INTO `cms_info_node` VALUES ('296', '165', '117', '-1');

-- ----------------------------
-- Table structure for cms_info_org
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_org`;
CREATE TABLE `cms_info_org` (
  `f_infoorg_id` int(11) NOT NULL,
  `f_info_id` int(11) NOT NULL,
  `f_org_id` int(11) NOT NULL,
  `f_is_view_perm` char(1) NOT NULL DEFAULT '0' COMMENT '是否有浏览权限',
  PRIMARY KEY (`f_infoorg_id`),
  KEY `fk_cms_infoorg_info` (`f_info_id`),
  KEY `fk_cms_infoorg_org` (`f_org_id`),
  CONSTRAINT `fk_cms_infoorg_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`),
  CONSTRAINT `fk_cms_infoorg_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息与组织权限表';

-- ----------------------------
-- Records of cms_info_org
-- ----------------------------
INSERT INTO `cms_info_org` VALUES ('17', '93', '1', '0');
INSERT INTO `cms_info_org` VALUES ('18', '83', '1', '0');
INSERT INTO `cms_info_org` VALUES ('19', '117', '1', '0');
INSERT INTO `cms_info_org` VALUES ('20', '118', '1', '0');
INSERT INTO `cms_info_org` VALUES ('27', '126', '1', '0');
INSERT INTO `cms_info_org` VALUES ('28', '127', '1', '0');
INSERT INTO `cms_info_org` VALUES ('29', '128', '1', '0');
INSERT INTO `cms_info_org` VALUES ('30', '129', '1', '0');
INSERT INTO `cms_info_org` VALUES ('31', '130', '1', '0');
INSERT INTO `cms_info_org` VALUES ('32', '131', '1', '0');
INSERT INTO `cms_info_org` VALUES ('33', '132', '1', '0');
INSERT INTO `cms_info_org` VALUES ('34', '133', '1', '0');
INSERT INTO `cms_info_org` VALUES ('35', '134', '1', '0');
INSERT INTO `cms_info_org` VALUES ('36', '135', '1', '0');
INSERT INTO `cms_info_org` VALUES ('37', '136', '1', '0');
INSERT INTO `cms_info_org` VALUES ('38', '137', '1', '0');
INSERT INTO `cms_info_org` VALUES ('39', '138', '1', '0');
INSERT INTO `cms_info_org` VALUES ('40', '139', '1', '0');
INSERT INTO `cms_info_org` VALUES ('41', '140', '1', '0');
INSERT INTO `cms_info_org` VALUES ('42', '141', '1', '0');
INSERT INTO `cms_info_org` VALUES ('43', '142', '1', '0');
INSERT INTO `cms_info_org` VALUES ('44', '143', '1', '0');
INSERT INTO `cms_info_org` VALUES ('45', '144', '1', '0');
INSERT INTO `cms_info_org` VALUES ('46', '145', '1', '0');
INSERT INTO `cms_info_org` VALUES ('47', '146', '1', '0');
INSERT INTO `cms_info_org` VALUES ('48', '147', '1', '0');
INSERT INTO `cms_info_org` VALUES ('49', '148', '1', '0');
INSERT INTO `cms_info_org` VALUES ('50', '149', '1', '0');
INSERT INTO `cms_info_org` VALUES ('51', '150', '1', '0');
INSERT INTO `cms_info_org` VALUES ('52', '151', '1', '0');
INSERT INTO `cms_info_org` VALUES ('53', '152', '1', '0');
INSERT INTO `cms_info_org` VALUES ('54', '153', '1', '0');
INSERT INTO `cms_info_org` VALUES ('55', '154', '1', '0');
INSERT INTO `cms_info_org` VALUES ('56', '98', '1', '0');
INSERT INTO `cms_info_org` VALUES ('57', '155', '1', '0');
INSERT INTO `cms_info_org` VALUES ('58', '156', '1', '0');
INSERT INTO `cms_info_org` VALUES ('59', '157', '1', '0');
INSERT INTO `cms_info_org` VALUES ('60', '158', '1', '0');
INSERT INTO `cms_info_org` VALUES ('61', '159', '1', '0');
INSERT INTO `cms_info_org` VALUES ('62', '160', '1', '0');
INSERT INTO `cms_info_org` VALUES ('63', '161', '1', '0');
INSERT INTO `cms_info_org` VALUES ('64', '162', '1', '0');
INSERT INTO `cms_info_org` VALUES ('65', '163', '1', '0');
INSERT INTO `cms_info_org` VALUES ('66', '164', '1', '0');
INSERT INTO `cms_info_org` VALUES ('67', '165', '1', '0');
INSERT INTO `cms_info_org` VALUES ('68', '166', '1', '0');
INSERT INTO `cms_info_org` VALUES ('69', '167', '1', '0');
INSERT INTO `cms_info_org` VALUES ('70', '168', '1', '0');

-- ----------------------------
-- Table structure for cms_info_special
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_special`;
CREATE TABLE `cms_info_special` (
  `f_infospecial_id` int(11) NOT NULL,
  `f_info_id` int(11) NOT NULL COMMENT '信息',
  `f_special_id` int(11) NOT NULL COMMENT '专题',
  `f_special_index` int(11) NOT NULL COMMENT '专题序号',
  PRIMARY KEY (`f_infospecial_id`),
  KEY `fk_cms_infospecial_info` (`f_info_id`),
  KEY `fk_cms_infospecial_special` (`f_special_id`),
  CONSTRAINT `fk_cms_infospecial_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`),
  CONSTRAINT `fk_cms_infospecial_special` FOREIGN KEY (`f_special_id`) REFERENCES `cms_special` (`f_special_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息与专题关联表';

-- ----------------------------
-- Records of cms_info_special
-- ----------------------------
INSERT INTO `cms_info_special` VALUES ('2', '27', '1', '0');
INSERT INTO `cms_info_special` VALUES ('5', '136', '14', '0');
INSERT INTO `cms_info_special` VALUES ('7', '139', '14', '0');

-- ----------------------------
-- Table structure for cms_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `cms_info_tag`;
CREATE TABLE `cms_info_tag` (
  `f_infotag_id` int(11) NOT NULL,
  `f_info_id` int(11) NOT NULL COMMENT '信息',
  `f_tag_id` int(11) NOT NULL COMMENT 'tag',
  `f_tag_index` int(11) NOT NULL COMMENT 'tag序号',
  PRIMARY KEY (`f_infotag_id`),
  KEY `fk_cms_infotag_info` (`f_info_id`),
  KEY `fk_cms_infotag_tag` (`f_tag_id`),
  CONSTRAINT `fk_cms_infotag_info` FOREIGN KEY (`f_info_id`) REFERENCES `cms_info` (`f_info_id`),
  CONSTRAINT `fk_cms_infotag_tag` FOREIGN KEY (`f_tag_id`) REFERENCES `cms_tag` (`f_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息与tag关联表';

-- ----------------------------
-- Records of cms_info_tag
-- ----------------------------
INSERT INTO `cms_info_tag` VALUES ('20', '30', '56', '0');
INSERT INTO `cms_info_tag` VALUES ('21', '30', '71', '1');
INSERT INTO `cms_info_tag` VALUES ('22', '30', '72', '2');
INSERT INTO `cms_info_tag` VALUES ('23', '30', '73', '3');
INSERT INTO `cms_info_tag` VALUES ('24', '55', '58', '0');
INSERT INTO `cms_info_tag` VALUES ('25', '55', '59', '1');
INSERT INTO `cms_info_tag` VALUES ('26', '55', '60', '2');
INSERT INTO `cms_info_tag` VALUES ('27', '55', '61', '3');
INSERT INTO `cms_info_tag` VALUES ('28', '54', '56', '0');
INSERT INTO `cms_info_tag` VALUES ('29', '54', '57', '1');
INSERT INTO `cms_info_tag` VALUES ('30', '54', '62', '2');
INSERT INTO `cms_info_tag` VALUES ('31', '53', '63', '0');
INSERT INTO `cms_info_tag` VALUES ('32', '53', '64', '1');
INSERT INTO `cms_info_tag` VALUES ('33', '53', '65', '2');
INSERT INTO `cms_info_tag` VALUES ('34', '53', '66', '3');
INSERT INTO `cms_info_tag` VALUES ('35', '52', '67', '0');
INSERT INTO `cms_info_tag` VALUES ('36', '52', '68', '1');
INSERT INTO `cms_info_tag` VALUES ('37', '52', '69', '2');
INSERT INTO `cms_info_tag` VALUES ('38', '52', '70', '3');
INSERT INTO `cms_info_tag` VALUES ('39', '126', '74', '0');

-- ----------------------------
-- Table structure for cms_member_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_group`;
CREATE TABLE `cms_member_group` (
  `f_membergroup_id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `f_description` varchar(255) DEFAULT NULL,
  `f_ip` longtext COMMENT 'IP',
  `f_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型(0:普通组,1:游客组,2:IP组,3:待验证组)',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  PRIMARY KEY (`f_membergroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员组表';

-- ----------------------------
-- Records of cms_member_group
-- ----------------------------
INSERT INTO `cms_member_group` VALUES ('0', '游客组', null, null, '1', '0');
INSERT INTO `cms_member_group` VALUES ('1', '普通会员', null, null, '0', '2147483647');

-- ----------------------------
-- Table structure for cms_model
-- ----------------------------
DROP TABLE IF EXISTS `cms_model`;
CREATE TABLE `cms_model` (
  `f_model_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_type` varchar(100) NOT NULL COMMENT '类型(info:信息,node:节点,node_home:首页;special:专题)',
  `f_name` varchar(50) NOT NULL COMMENT '名称',
  `f_seq` int(11) NOT NULL DEFAULT '10' COMMENT '顺序',
  PRIMARY KEY (`f_model_id`),
  KEY `fk_cms_model_site` (`f_site_id`),
  CONSTRAINT `fk_cms_model_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模型表';

-- ----------------------------
-- Records of cms_model
-- ----------------------------
INSERT INTO `cms_model` VALUES ('1', '1', 'node_home', '首页', '0');
INSERT INTO `cms_model` VALUES ('2', '1', 'info', '新闻', '0');
INSERT INTO `cms_model` VALUES ('3', '1', 'node', '新闻', '0');
INSERT INTO `cms_model` VALUES ('4', '1', 'node', '图集', '1');
INSERT INTO `cms_model` VALUES ('5', '1', 'info', '图集', '1');
INSERT INTO `cms_model` VALUES ('6', '1', 'node', '下载', '2');
INSERT INTO `cms_model` VALUES ('7', '1', 'info', '下载', '2');
INSERT INTO `cms_model` VALUES ('8', '1', 'node', '视频', '3');
INSERT INTO `cms_model` VALUES ('9', '1', 'info', '视频', '3');
INSERT INTO `cms_model` VALUES ('10', '1', 'node', '产品', '4');
INSERT INTO `cms_model` VALUES ('11', '1', 'info', '产品', '4');
INSERT INTO `cms_model` VALUES ('12', '1', 'site', '站点模型', '2147483647');
INSERT INTO `cms_model` VALUES ('13', '1', 'node', '招聘', '2147483647');
INSERT INTO `cms_model` VALUES ('14', '1', 'info', '招聘', '2147483647');
INSERT INTO `cms_model` VALUES ('15', '3', 'site', '站点模型', '2147483647');
INSERT INTO `cms_model` VALUES ('16', '3', 'node_home', '首页', '0');
INSERT INTO `cms_model` VALUES ('17', '3', 'node', '新闻', '0');
INSERT INTO `cms_model` VALUES ('18', '3', 'info', '新闻', '0');
INSERT INTO `cms_model` VALUES ('20', '3', 'node', '知识库', '2147483647');
INSERT INTO `cms_model` VALUES ('21', '3', 'info', '知识库', '2147483647');
INSERT INTO `cms_model` VALUES ('22', '4', 'site', '站点模型', '2147483647');
INSERT INTO `cms_model` VALUES ('23', '4', 'node_home', '首页', '0');
INSERT INTO `cms_model` VALUES ('24', '4', 'node', '新闻', '0');
INSERT INTO `cms_model` VALUES ('25', '4', 'info', '新闻', '0');
INSERT INTO `cms_model` VALUES ('26', '4', 'node', '项目案例', '2147483647');
INSERT INTO `cms_model` VALUES ('27', '4', 'info', '项目案例', '2147483647');
INSERT INTO `cms_model` VALUES ('28', '5', 'site', '站点模型', '2147483647');
INSERT INTO `cms_model` VALUES ('29', '5', 'node_home', '首页', '0');
INSERT INTO `cms_model` VALUES ('30', '5', 'node', '新闻', '0');
INSERT INTO `cms_model` VALUES ('31', '5', 'info', '新闻', '0');
INSERT INTO `cms_model` VALUES ('32', '6', 'site', '站点模型', '2147483647');
INSERT INTO `cms_model` VALUES ('33', '6', 'node_home', '首页', '0');
INSERT INTO `cms_model` VALUES ('34', '6', 'node', '新闻', '0');
INSERT INTO `cms_model` VALUES ('35', '6', 'info', '新闻', '0');
INSERT INTO `cms_model` VALUES ('36', '7', 'site', '站点模型', '2147483647');
INSERT INTO `cms_model` VALUES ('37', '7', 'node_home', '首页', '0');
INSERT INTO `cms_model` VALUES ('38', '7', 'node', '新闻', '0');
INSERT INTO `cms_model` VALUES ('39', '7', 'info', '新闻', '0');
INSERT INTO `cms_model` VALUES ('40', '7', 'info', '案例', '2147483647');
INSERT INTO `cms_model` VALUES ('41', '7', 'node', '案例', '2147483647');
INSERT INTO `cms_model` VALUES ('42', '8', 'site', '站点模型', '2147483647');
INSERT INTO `cms_model` VALUES ('43', '8', 'node_home', '首页', '0');
INSERT INTO `cms_model` VALUES ('44', '8', 'node', '新闻', '0');
INSERT INTO `cms_model` VALUES ('45', '8', 'info', '新闻', '0');

-- ----------------------------
-- Table structure for cms_model_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_model_custom`;
CREATE TABLE `cms_model_custom` (
  `f_model_id` int(11) NOT NULL,
  `f_key` varchar(50) NOT NULL COMMENT '键',
  `f_value` varchar(2000) DEFAULT NULL COMMENT '值',
  KEY `fk_cms_modelcustom_model` (`f_model_id`),
  CONSTRAINT `fk_cms_modelcustom_model` FOREIGN KEY (`f_model_id`) REFERENCES `cms_model` (`f_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模型自定义表';

-- ----------------------------
-- Records of cms_model_custom
-- ----------------------------
INSERT INTO `cms_model_custom` VALUES ('2', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('2', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('2', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('2', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('2', 'template', '/info.html');
INSERT INTO `cms_model_custom` VALUES ('2', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('3', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('3', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('3', 'staticPage', '5');
INSERT INTO `cms_model_custom` VALUES ('3', 'listTemplate', '/list.html');
INSERT INTO `cms_model_custom` VALUES ('3', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('3', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('3', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('3', 'infoPath', '/{site_number}/news_{node_id}');
INSERT INTO `cms_model_custom` VALUES ('3', 'nodePath', '/{site_number}/news_index');
INSERT INTO `cms_model_custom` VALUES ('3', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('3', 'staticMethod', '4');
INSERT INTO `cms_model_custom` VALUES ('1', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('1', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('1', 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES ('1', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('1', 'template', '/index.html');
INSERT INTO `cms_model_custom` VALUES ('1', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('1', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('1', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('1', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('1', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('4', 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES ('4', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('4', 'staticPage', '5');
INSERT INTO `cms_model_custom` VALUES ('4', 'listTemplate', 'pic_list.html');
INSERT INTO `cms_model_custom` VALUES ('4', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('4', 'coverTemplate', 'pic_cover.html');
INSERT INTO `cms_model_custom` VALUES ('4', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('4', 'infoPath', '/{site_number}/pictures_{info_id}{year}{month}{day}');
INSERT INTO `cms_model_custom` VALUES ('4', 'nodePath', '/{site_number}/pictures_index');
INSERT INTO `cms_model_custom` VALUES ('4', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('4', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('5', 'template', '/pic_info.html');
INSERT INTO `cms_model_custom` VALUES ('6', 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES ('6', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('6', 'staticPage', '5');
INSERT INTO `cms_model_custom` VALUES ('6', 'listTemplate', '/list.html');
INSERT INTO `cms_model_custom` VALUES ('6', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('6', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('6', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('6', 'infoPath', '/{site_number}/download_{info_id}{year}{month}{day}');
INSERT INTO `cms_model_custom` VALUES ('6', 'nodePath', '/{site_number}/download_index');
INSERT INTO `cms_model_custom` VALUES ('6', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('6', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('7', 'template', '/down_info.html');
INSERT INTO `cms_model_custom` VALUES ('8', 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES ('8', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('8', 'staticPage', '5');
INSERT INTO `cms_model_custom` VALUES ('8', 'listTemplate', '/video_list.html');
INSERT INTO `cms_model_custom` VALUES ('8', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('8', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('8', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('8', 'infoPath', '/{site_number}/shipin_{info_id}{year}{month}{day}');
INSERT INTO `cms_model_custom` VALUES ('8', 'nodePath', '/{site_number}/shipin_index');
INSERT INTO `cms_model_custom` VALUES ('8', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('8', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('9', 'template', '/info.html');
INSERT INTO `cms_model_custom` VALUES ('10', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('10', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('10', 'staticPage', '5');
INSERT INTO `cms_model_custom` VALUES ('10', 'listTemplate', '/product_list.html');
INSERT INTO `cms_model_custom` VALUES ('10', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('10', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('10', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('10', 'infoPath', '/{site_number}/cp_{info_id}{year}{month}{day}');
INSERT INTO `cms_model_custom` VALUES ('10', 'nodePath', '/{site_number}/cp_index');
INSERT INTO `cms_model_custom` VALUES ('10', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('10', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('11', 'template', '/product_info.html');
INSERT INTO `cms_model_custom` VALUES ('13', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('13', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('13', 'staticPage', '5');
INSERT INTO `cms_model_custom` VALUES ('13', 'listTemplate', '/list_recruitment.html');
INSERT INTO `cms_model_custom` VALUES ('13', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('13', 'coverTemplate', '/list_recruitment.html');
INSERT INTO `cms_model_custom` VALUES ('13', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('13', 'infoPath', '/{site_number}/zp_{info_id}{year}{month}{day}');
INSERT INTO `cms_model_custom` VALUES ('13', 'nodePath', '/{site_number}/zp_index');
INSERT INTO `cms_model_custom` VALUES ('13', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('13', 'staticMethod', '4');
INSERT INTO `cms_model_custom` VALUES ('14', 'template', '/info_recruitment.html');
INSERT INTO `cms_model_custom` VALUES ('16', 'template', '/index.html');
INSERT INTO `cms_model_custom` VALUES ('16', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('16', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('16', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('16', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('16', 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES ('16', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('16', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('16', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('16', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('17', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('17', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('17', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('17', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('17', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('17', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('17', 'listTemplate', '/list.html');
INSERT INTO `cms_model_custom` VALUES ('17', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('17', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('17', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('17', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('18', 'template', '/info.html');
INSERT INTO `cms_model_custom` VALUES ('18', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('18', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('18', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('18', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('18', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('20', 'listTemplate', '/n_list.html');
INSERT INTO `cms_model_custom` VALUES ('20', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('20', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('20', 'coverTemplate', '/n_info.html');
INSERT INTO `cms_model_custom` VALUES ('20', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('20', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('20', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('20', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('20', 'staticMethod', '4');
INSERT INTO `cms_model_custom` VALUES ('20', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('20', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('21', 'template', '/n_info.html');
INSERT INTO `cms_model_custom` VALUES ('23', 'template', '/index.html');
INSERT INTO `cms_model_custom` VALUES ('23', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('23', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('23', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('23', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('23', 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES ('23', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('23', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('23', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('23', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('24', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('24', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('24', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('24', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('24', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('24', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('24', 'listTemplate', '/list.html');
INSERT INTO `cms_model_custom` VALUES ('24', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('24', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('24', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('24', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('25', 'template', '/info.html');
INSERT INTO `cms_model_custom` VALUES ('25', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('25', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('25', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('25', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('25', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('26', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('26', 'coverTemplate', '/product_info.html');
INSERT INTO `cms_model_custom` VALUES ('26', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('26', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('26', 'staticMethod', '4');
INSERT INTO `cms_model_custom` VALUES ('26', 'listTemplate', '/product_list.html');
INSERT INTO `cms_model_custom` VALUES ('26', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('26', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('26', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('26', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('26', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('27', 'template', '/product_info.html');
INSERT INTO `cms_model_custom` VALUES ('29', 'template', '/index.html');
INSERT INTO `cms_model_custom` VALUES ('29', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('29', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('29', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('29', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('29', 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES ('29', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('29', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('29', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('29', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('30', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('30', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('30', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('30', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('30', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('30', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('30', 'listTemplate', '/list.html');
INSERT INTO `cms_model_custom` VALUES ('30', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('30', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('30', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('30', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('31', 'template', '/info.html');
INSERT INTO `cms_model_custom` VALUES ('31', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('31', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('31', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('31', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('31', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('33', 'template', '/index.html');
INSERT INTO `cms_model_custom` VALUES ('33', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('33', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('33', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('33', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('33', 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES ('33', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('33', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('33', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('33', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('34', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('34', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('34', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('34', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('34', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('34', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('34', 'listTemplate', '/list.html');
INSERT INTO `cms_model_custom` VALUES ('34', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('34', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('34', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('34', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('35', 'template', '/info.html');
INSERT INTO `cms_model_custom` VALUES ('35', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('35', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('35', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('35', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('35', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('37', 'template', '/index.html');
INSERT INTO `cms_model_custom` VALUES ('37', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('37', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('37', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('37', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('37', 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES ('37', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('37', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('37', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('37', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('38', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('38', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('38', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('38', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('38', 'nodePath', '/{site_number}/news_index');
INSERT INTO `cms_model_custom` VALUES ('38', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('38', 'listTemplate', '/list.html');
INSERT INTO `cms_model_custom` VALUES ('38', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('38', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('38', 'infoPath', '/{site_number}/news_{node_id}');
INSERT INTO `cms_model_custom` VALUES ('38', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('39', 'template', '/info.html');
INSERT INTO `cms_model_custom` VALUES ('39', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('39', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('39', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('39', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('39', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('40', 'template', '/case_info.html');
INSERT INTO `cms_model_custom` VALUES ('41', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('41', 'listTemplate', '/case_list.html');
INSERT INTO `cms_model_custom` VALUES ('41', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('41', 'nodePath', '/{site_number}/al_index');
INSERT INTO `cms_model_custom` VALUES ('41', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('41', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('41', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('41', 'infoPath', '/{site_number}/al_{node_id}');
INSERT INTO `cms_model_custom` VALUES ('41', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('41', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('41', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('43', 'template', '/index.html');
INSERT INTO `cms_model_custom` VALUES ('43', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('43', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('43', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('43', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('43', 'defPage', 'false');
INSERT INTO `cms_model_custom` VALUES ('43', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('43', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('43', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('43', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('44', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('44', 'generateNode', 'false');
INSERT INTO `cms_model_custom` VALUES ('44', 'generateInfo', 'false');
INSERT INTO `cms_model_custom` VALUES ('44', 'coverTemplate', '/cover.html');
INSERT INTO `cms_model_custom` VALUES ('44', 'nodePath', '');
INSERT INTO `cms_model_custom` VALUES ('44', 'defPage', 'true');
INSERT INTO `cms_model_custom` VALUES ('44', 'listTemplate', '/list.html');
INSERT INTO `cms_model_custom` VALUES ('44', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('44', 'infoExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('44', 'staticPage', '1');
INSERT INTO `cms_model_custom` VALUES ('44', 'infoPath', '');
INSERT INTO `cms_model_custom` VALUES ('45', 'template', '/info.html');
INSERT INTO `cms_model_custom` VALUES ('45', 'staticMethod', '3');
INSERT INTO `cms_model_custom` VALUES ('45', 'generateNode', 'true');
INSERT INTO `cms_model_custom` VALUES ('45', 'generateInfo', 'true');
INSERT INTO `cms_model_custom` VALUES ('45', 'nodeExtension', '.html');
INSERT INTO `cms_model_custom` VALUES ('45', 'infoExtension', '.html');

-- ----------------------------
-- Table structure for cms_model_field
-- ----------------------------
DROP TABLE IF EXISTS `cms_model_field`;
CREATE TABLE `cms_model_field` (
  `f_modefiel_id` int(11) NOT NULL,
  `f_model_id` int(11) NOT NULL COMMENT '模型',
  `f_type` int(11) NOT NULL COMMENT '输入类型',
  `f_inner_type` int(11) NOT NULL DEFAULT '0' COMMENT '内部类型(0:用户自定义字段;1:系统定义字段;2:预留大文本字段;3:预留可查询字段)',
  `f_label` varchar(50) NOT NULL COMMENT '字段标签',
  `f_name` varchar(50) NOT NULL COMMENT '字段名称',
  `f_prompt` varchar(255) DEFAULT NULL COMMENT '提示信息',
  `f_def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `f_is_required` char(1) NOT NULL DEFAULT '0' COMMENT '是否必填项',
  `f_seq` int(11) NOT NULL DEFAULT '10' COMMENT '顺序',
  `f_is_dbl_column` char(1) NOT NULL DEFAULT '0' COMMENT '是否双列布局',
  `f_is_disabled` char(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`f_modefiel_id`),
  KEY `fk_cms_modefiel_model` (`f_model_id`),
  CONSTRAINT `fk_cms_modefiel_model` FOREIGN KEY (`f_model_id`) REFERENCES `cms_model` (`f_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模型字段表';

-- ----------------------------
-- Records of cms_model_field
-- ----------------------------
INSERT INTO `cms_model_field` VALUES ('1', '1', '1', '2', '名称', 'name', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('2', '1', '1', '2', '编码', 'number', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('5', '1', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('6', '1', '5', '2', '文档模型', 'infoModel', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('7', '1', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('8', '1', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '5', '1', '0');
INSERT INTO `cms_model_field` VALUES ('9', '1', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('10', '1', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('11', '1', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('12', '1', '1', '2', '静态化页数', 'staticPage', null, '1', '1', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('199', '4', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('200', '4', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('201', '4', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('202', '4', '1', '2', '链接地址', 'link', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('203', '4', '5', '2', '新窗口打开', 'newWindow', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('216', '4', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '5', '1', '0');
INSERT INTO `cms_model_field` VALUES ('217', '4', '5', '2', '文档模型', 'infoModel', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('235', '2', '1', '2', '栏目', 'node', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('237', '2', '1', '2', '专题', 'specials', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('238', '2', '1', '2', '标题', 'title', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('239', '2', '1', '2', '颜色', 'color', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('242', '2', '1', '2', '关键词', 'tagKeywords', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('243', '2', '6', '2', '描述', 'metaDescription', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('246', '2', '1', '2', '优先级', 'priority', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('247', '2', '2', '2', '发布时间', 'publishDate', null, null, '0', '7', '1', '0');
INSERT INTO `cms_model_field` VALUES ('248', '2', '1', '2', '来源', 'source', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('249', '2', '1', '2', '作者', 'author', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('250', '2', '1', '2', '属性', 'attributes', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('255', '2', '50', '2', '正文', 'text', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('256', '3', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('257', '3', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('258', '3', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('259', '3', '1', '2', '链接地址', 'link', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('260', '3', '5', '2', '新窗口打开', 'newWindow', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('261', '3', '1', '2', '关键词', 'metaKeywords', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('262', '3', '1', '2', '描述', 'metaDescription', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('263', '3', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('264', '3', '5', '2', '文档模型', 'infoModel', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('265', '3', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '10', '1', '0');
INSERT INTO `cms_model_field` VALUES ('266', '3', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '11', '1', '0');
INSERT INTO `cms_model_field` VALUES ('267', '3', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '12', '0', '0');
INSERT INTO `cms_model_field` VALUES ('268', '3', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('269', '3', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '14', '1', '0');
INSERT INTO `cms_model_field` VALUES ('270', '3', '1', '2', '静态化页数', 'staticPage', null, '1', '0', '15', '1', '0');
INSERT INTO `cms_model_field` VALUES ('273', '1', '1', '2', '关键词', 'metaKeywords', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('274', '1', '1', '2', '描述', 'metaDescription', null, null, '0', '11', '0', '0');
INSERT INTO `cms_model_field` VALUES ('275', '5', '1', '2', '栏目', 'node', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('276', '5', '1', '2', '标题', 'title', null, null, '0', '1', '0', '0');
INSERT INTO `cms_model_field` VALUES ('278', '5', '2', '2', '发布时间', 'publishDate', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('279', '5', '51', '2', '图片集', 'images', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('281', '5', '7', '2', '标题图', 'smallImage', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('282', '6', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('283', '6', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('284', '6', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('287', '6', '1', '2', '转向链接', 'link', null, null, '0', '5', '1', '0');
INSERT INTO `cms_model_field` VALUES ('288', '6', '5', '2', '新窗口打开', 'newWindow', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('289', '6', '1', '2', '关键词', 'metaKeywords', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('290', '6', '1', '2', '描述', 'metaDescription', null, null, '0', '8', '0', '0');
INSERT INTO `cms_model_field` VALUES ('292', '6', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '10', '1', '0');
INSERT INTO `cms_model_field` VALUES ('293', '6', '5', '2', '文档模型', 'infoModel', null, null, '0', '11', '1', '0');
INSERT INTO `cms_model_field` VALUES ('294', '6', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '12', '1', '0');
INSERT INTO `cms_model_field` VALUES ('295', '6', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '13', '1', '0');
INSERT INTO `cms_model_field` VALUES ('296', '6', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '14', '0', '0');
INSERT INTO `cms_model_field` VALUES ('297', '6', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '15', '0', '0');
INSERT INTO `cms_model_field` VALUES ('298', '6', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '16', '1', '0');
INSERT INTO `cms_model_field` VALUES ('299', '6', '1', '2', '静态化页数', 'staticPage', null, '1', '0', '17', '1', '0');
INSERT INTO `cms_model_field` VALUES ('303', '7', '1', '2', '栏目', 'node', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('304', '7', '1', '2', '标题', 'title', null, null, '0', '1', '0', '0');
INSERT INTO `cms_model_field` VALUES ('305', '7', '50', '2', '正文', 'text', null, null, '0', '9', '0', '0');
INSERT INTO `cms_model_field` VALUES ('306', '7', '4', '0', '软件类型', 'softType', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('307', '7', '4', '0', '授权方式', 'authorization', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('308', '7', '4', '0', '界面语言', 'langue', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('309', '7', '1', '0', '运行环境', 'runEnviorment', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('311', '7', '9', '2', '文件', 'file', null, null, '0', '8', '0', '0');
INSERT INTO `cms_model_field` VALUES ('312', '8', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('313', '8', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('314', '8', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('315', '8', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('316', '8', '5', '2', '文档模型', 'infoModel', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('318', '9', '1', '2', '栏目', 'node', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('319', '9', '1', '2', '标题', 'title', null, null, '0', '1', '0', '0');
INSERT INTO `cms_model_field` VALUES ('320', '9', '2', '2', '发布时间', 'publishDate', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('321', '9', '8', '2', '视频', 'video', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('322', '9', '7', '2', '标题图', 'smallImage', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('323', '10', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('324', '10', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('325', '10', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('326', '11', '1', '2', '栏目', 'node', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('327', '11', '1', '2', '标题', 'title', null, null, '0', '1', '0', '0');
INSERT INTO `cms_model_field` VALUES ('328', '11', '7', '2', '标题图', 'smallImage', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('329', '10', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('330', '10', '5', '2', '文档模型', 'infoModel', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('331', '11', '1', '0', '优惠介', 'discount', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('332', '11', '1', '0', '市场价', 'marketValue', null, null, '1', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('333', '11', '7', '0', '实物图', 'physicalPic', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('334', '11', '4', '0', '商品库存', 'stock', null, '有货', '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('335', '11', '50', '1', '商品介绍', 'introduce', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('336', '11', '50', '1', '规格参数', 'specification', null, null, '0', '8', '0', '0');
INSERT INTO `cms_model_field` VALUES ('337', '11', '50', '1', '包装清单', 'packingList', null, null, '0', '9', '0', '0');
INSERT INTO `cms_model_field` VALUES ('338', '11', '50', '1', '售后服务', 'services', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('339', '7', '3', '0', '适合系统', 'system', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('340', '7', '7', '2', '标题图', 'smallImage', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('343', '3', '5', '2', '审核流程', 'workflow', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('344', '12', '1', '0', '公司名称', 'company', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('345', '12', '1', '0', '备案号', 'icp', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('346', '13', '1', '2', '所属栏目', 'parent', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('347', '13', '1', '2', '名称', 'name', null, null, '0', '2147483647', '1', '0');
INSERT INTO `cms_model_field` VALUES ('348', '13', '1', '2', '编码', 'number', null, null, '0', '2147483647', '1', '0');
INSERT INTO `cms_model_field` VALUES ('349', '13', '1', '2', '关键词', 'metaKeywords', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('350', '13', '1', '2', '描述', 'metaDescription', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('351', '13', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '2147483647', '1', '0');
INSERT INTO `cms_model_field` VALUES ('352', '13', '5', '2', '文档模型', 'infoModel', null, null, '0', '2147483647', '1', '0');
INSERT INTO `cms_model_field` VALUES ('353', '14', '1', '2', '栏目', 'node', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('354', '14', '1', '2', '标题', 'title', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('356', '14', '2', '2', '发布时间', 'publishDate', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('357', '14', '1', '0', '公司名称', 'company', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('358', '14', '1', '0', '部门名称', 'dept', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('359', '14', '1', '0', '招聘人数', 'number', null, null, '0', '5', '1', '0');
INSERT INTO `cms_model_field` VALUES ('360', '14', '1', '0', '薪酬待遇', 'salary', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('361', '14', '1', '0', '工作地点', 'location', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('362', '14', '6', '0', '岗位职责', 'responsibilities', null, null, '0', '8', '0', '0');
INSERT INTO `cms_model_field` VALUES ('363', '14', '6', '0', '岗位要求', 'qualifications', null, null, '0', '9', '0', '0');
INSERT INTO `cms_model_field` VALUES ('364', '13', '3', '2', '浏览权限', 'viewGroups', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('365', '1', '3', '2', '浏览权限', 'viewGroups', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('366', '15', '1', '0', '公司名称', 'company', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('367', '15', '1', '0', '备案号', 'icp', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('368', '16', '1', '2', '名称', 'name', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('369', '16', '1', '2', '编码', 'number', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('370', '16', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('371', '16', '5', '2', '文档模型', 'infoModel', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('372', '16', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('373', '16', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '5', '1', '0');
INSERT INTO `cms_model_field` VALUES ('374', '16', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('375', '16', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('376', '16', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('377', '16', '1', '2', '静态化页数', 'staticPage', null, '1', '1', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('378', '16', '1', '2', '关键词', 'metaKeywords', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('379', '16', '1', '2', '描述', 'metaDescription', null, null, '0', '11', '0', '0');
INSERT INTO `cms_model_field` VALUES ('380', '16', '3', '2', '浏览权限', 'viewGroups', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('381', '17', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('382', '17', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('383', '17', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('384', '17', '1', '2', '链接地址', 'link', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('385', '17', '5', '2', '新窗口打开', 'newWindow', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('386', '17', '1', '2', '关键词', 'metaKeywords', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('387', '17', '1', '2', '描述', 'metaDescription', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('388', '17', '5', '2', '审核流程', 'workflow', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('389', '17', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('390', '17', '5', '2', '文档模型', 'infoModel', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('391', '17', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '10', '1', '0');
INSERT INTO `cms_model_field` VALUES ('392', '17', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '11', '1', '0');
INSERT INTO `cms_model_field` VALUES ('393', '17', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '12', '0', '0');
INSERT INTO `cms_model_field` VALUES ('394', '17', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('395', '17', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '14', '1', '0');
INSERT INTO `cms_model_field` VALUES ('396', '17', '1', '2', '静态化页数', 'staticPage', null, '1', '0', '15', '1', '0');
INSERT INTO `cms_model_field` VALUES ('397', '18', '1', '2', '栏目', 'node', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('398', '18', '1', '2', '专题', 'specials', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('399', '18', '1', '2', '标题', 'title', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('400', '18', '1', '2', '颜色', 'color', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('401', '18', '1', '2', '关键词', 'tagKeywords', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('402', '18', '6', '2', '描述', 'metaDescription', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('403', '18', '1', '2', '优先级', 'priority', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('404', '18', '2', '2', '发布时间', 'publishDate', null, null, '0', '7', '1', '0');
INSERT INTO `cms_model_field` VALUES ('405', '18', '1', '2', '来源', 'source', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('406', '18', '1', '2', '作者', 'author', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('407', '18', '1', '2', '属性', 'attributes', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('408', '18', '50', '2', '正文', 'text', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('411', '21', '1', '2', '栏目', 'node', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('412', '21', '1', '2', '专题', 'specials', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('413', '21', '1', '2', '标题', 'title', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('414', '21', '1', '2', '颜色', 'color', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('415', '21', '1', '2', '关键词', 'tagKeywords', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('416', '21', '6', '2', '描述', 'metaDescription', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('417', '21', '1', '2', '优先级', 'priority', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('418', '21', '2', '2', '发布时间', 'publishDate', null, null, '0', '7', '1', '0');
INSERT INTO `cms_model_field` VALUES ('419', '21', '1', '2', '来源', 'source', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('420', '21', '1', '2', '作者', 'author', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('421', '21', '1', '2', '属性', 'attributes', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('422', '21', '50', '2', '正文', 'text', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('423', '21', '5', '0', '知识库分类', 'nc', null, null, '1', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('424', '18', '7', '0', '标题图', 'smallimage', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('425', '22', '1', '0', '公司名称', 'company', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('426', '22', '1', '0', '备案号', 'icp', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('427', '23', '1', '2', '名称', 'name', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('428', '23', '1', '2', '编码', 'number', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('429', '23', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('430', '23', '5', '2', '文档模型', 'infoModel', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('431', '23', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('432', '23', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '5', '1', '0');
INSERT INTO `cms_model_field` VALUES ('433', '23', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('434', '23', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('435', '23', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('436', '23', '1', '2', '静态化页数', 'staticPage', null, '1', '1', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('437', '23', '1', '2', '关键词', 'metaKeywords', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('438', '23', '1', '2', '描述', 'metaDescription', null, null, '0', '11', '0', '0');
INSERT INTO `cms_model_field` VALUES ('439', '23', '3', '2', '浏览权限', 'viewGroups', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('440', '24', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('441', '24', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('442', '24', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('443', '24', '1', '2', '链接地址', 'link', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('444', '24', '5', '2', '新窗口打开', 'newWindow', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('445', '24', '1', '2', '关键词', 'metaKeywords', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('446', '24', '1', '2', '描述', 'metaDescription', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('447', '24', '5', '2', '审核流程', 'workflow', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('448', '24', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('449', '24', '5', '2', '文档模型', 'infoModel', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('450', '24', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '10', '1', '0');
INSERT INTO `cms_model_field` VALUES ('451', '24', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '11', '1', '0');
INSERT INTO `cms_model_field` VALUES ('452', '24', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '12', '0', '0');
INSERT INTO `cms_model_field` VALUES ('453', '24', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('454', '24', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '14', '1', '0');
INSERT INTO `cms_model_field` VALUES ('455', '24', '1', '2', '静态化页数', 'staticPage', null, '1', '0', '15', '1', '0');
INSERT INTO `cms_model_field` VALUES ('456', '25', '1', '2', '栏目', 'node', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('457', '25', '1', '2', '专题', 'specials', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('458', '25', '1', '2', '标题', 'title', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('459', '25', '1', '2', '颜色', 'color', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('460', '25', '1', '2', '关键词', 'tagKeywords', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('461', '25', '6', '2', '描述', 'metaDescription', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('462', '25', '1', '2', '优先级', 'priority', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('463', '25', '2', '2', '发布时间', 'publishDate', null, null, '0', '7', '1', '0');
INSERT INTO `cms_model_field` VALUES ('464', '25', '1', '2', '来源', 'source', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('465', '25', '1', '2', '作者', 'author', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('466', '25', '1', '2', '属性', 'attributes', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('467', '25', '50', '2', '正文', 'text', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('468', '25', '7', '0', '标题图', 'smallimage', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('469', '28', '1', '0', '公司名称', 'company', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('470', '28', '1', '0', '备案号', 'icp', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('471', '29', '1', '2', '名称', 'name', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('472', '29', '1', '2', '编码', 'number', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('473', '29', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('474', '29', '5', '2', '文档模型', 'infoModel', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('475', '29', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('476', '29', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '5', '1', '0');
INSERT INTO `cms_model_field` VALUES ('477', '29', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('478', '29', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('479', '29', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('480', '29', '1', '2', '静态化页数', 'staticPage', null, '1', '1', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('481', '29', '1', '2', '关键词', 'metaKeywords', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('482', '29', '1', '2', '描述', 'metaDescription', null, null, '0', '11', '0', '0');
INSERT INTO `cms_model_field` VALUES ('483', '29', '3', '2', '浏览权限', 'viewGroups', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('484', '30', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('485', '30', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('486', '30', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('487', '30', '1', '2', '链接地址', 'link', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('488', '30', '5', '2', '新窗口打开', 'newWindow', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('489', '30', '1', '2', '关键词', 'metaKeywords', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('490', '30', '1', '2', '描述', 'metaDescription', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('491', '30', '5', '2', '审核流程', 'workflow', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('492', '30', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('493', '30', '5', '2', '文档模型', 'infoModel', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('494', '30', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '10', '1', '0');
INSERT INTO `cms_model_field` VALUES ('495', '30', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '11', '1', '0');
INSERT INTO `cms_model_field` VALUES ('496', '30', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '12', '0', '0');
INSERT INTO `cms_model_field` VALUES ('497', '30', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('498', '30', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '14', '1', '0');
INSERT INTO `cms_model_field` VALUES ('499', '30', '1', '2', '静态化页数', 'staticPage', null, '1', '0', '15', '1', '0');
INSERT INTO `cms_model_field` VALUES ('500', '31', '1', '2', '栏目', 'node', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('501', '31', '1', '2', '专题', 'specials', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('502', '31', '1', '2', '标题', 'title', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('503', '31', '1', '2', '颜色', 'color', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('504', '31', '1', '2', '关键词', 'tagKeywords', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('505', '31', '6', '2', '描述', 'metaDescription', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('506', '31', '1', '2', '优先级', 'priority', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('507', '31', '2', '2', '发布时间', 'publishDate', null, null, '0', '7', '1', '0');
INSERT INTO `cms_model_field` VALUES ('508', '31', '1', '2', '来源', 'source', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('509', '31', '1', '2', '作者', 'author', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('510', '31', '1', '2', '属性', 'attributes', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('511', '31', '50', '2', '正文', 'text', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('512', '31', '7', '0', '标题图', 'smallimage', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('513', '32', '1', '0', '公司名称', 'company', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('514', '32', '1', '0', '备案号', 'icp', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('515', '33', '1', '2', '名称', 'name', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('516', '33', '1', '2', '编码', 'number', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('517', '33', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('518', '33', '5', '2', '文档模型', 'infoModel', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('519', '33', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('520', '33', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '5', '1', '0');
INSERT INTO `cms_model_field` VALUES ('521', '33', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('522', '33', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('523', '33', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('524', '33', '1', '2', '静态化页数', 'staticPage', null, '1', '1', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('525', '33', '1', '2', '关键词', 'metaKeywords', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('526', '33', '1', '2', '描述', 'metaDescription', null, null, '0', '11', '0', '0');
INSERT INTO `cms_model_field` VALUES ('527', '33', '3', '2', '浏览权限', 'viewGroups', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('528', '34', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('529', '34', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('530', '34', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('531', '34', '1', '2', '链接地址', 'link', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('532', '34', '5', '2', '新窗口打开', 'newWindow', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('533', '34', '1', '2', '关键词', 'metaKeywords', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('534', '34', '1', '2', '描述', 'metaDescription', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('535', '34', '5', '2', '审核流程', 'workflow', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('536', '34', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('537', '34', '5', '2', '文档模型', 'infoModel', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('538', '34', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '10', '1', '0');
INSERT INTO `cms_model_field` VALUES ('539', '34', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '11', '1', '0');
INSERT INTO `cms_model_field` VALUES ('540', '34', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '12', '0', '0');
INSERT INTO `cms_model_field` VALUES ('541', '34', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('542', '34', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '14', '1', '0');
INSERT INTO `cms_model_field` VALUES ('543', '34', '1', '2', '静态化页数', 'staticPage', null, '1', '0', '15', '1', '0');
INSERT INTO `cms_model_field` VALUES ('544', '35', '1', '2', '栏目', 'node', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('545', '35', '1', '2', '专题', 'specials', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('546', '35', '1', '2', '标题', 'title', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('547', '35', '1', '2', '颜色', 'color', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('548', '35', '1', '2', '关键词', 'tagKeywords', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('549', '35', '6', '2', '描述', 'metaDescription', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('550', '35', '1', '2', '优先级', 'priority', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('551', '35', '2', '2', '发布时间', 'publishDate', null, null, '0', '7', '1', '0');
INSERT INTO `cms_model_field` VALUES ('552', '35', '1', '2', '来源', 'source', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('553', '35', '1', '2', '作者', 'author', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('554', '35', '1', '2', '属性', 'attributes', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('555', '35', '50', '2', '正文', 'text', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('556', '35', '7', '0', '标题图', 'smallimage', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('557', '36', '1', '0', '公司名称', 'company', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('558', '36', '1', '0', '备案号', 'icp', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('559', '37', '1', '2', '名称', 'name', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('560', '37', '1', '2', '编码', 'number', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('561', '37', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('562', '37', '5', '2', '文档模型', 'infoModel', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('563', '37', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('564', '37', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '5', '1', '0');
INSERT INTO `cms_model_field` VALUES ('565', '37', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('566', '37', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('567', '37', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('568', '37', '1', '2', '静态化页数', 'staticPage', null, '1', '1', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('569', '37', '1', '2', '关键词', 'metaKeywords', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('570', '37', '1', '2', '描述', 'metaDescription', null, null, '0', '11', '0', '0');
INSERT INTO `cms_model_field` VALUES ('571', '37', '3', '2', '浏览权限', 'viewGroups', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('572', '38', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('573', '38', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('574', '38', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('575', '38', '1', '2', '链接地址', 'link', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('576', '38', '5', '2', '新窗口打开', 'newWindow', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('577', '38', '1', '2', '关键词', 'metaKeywords', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('578', '38', '1', '2', '描述', 'metaDescription', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('579', '38', '5', '2', '审核流程', 'workflow', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('580', '38', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('581', '38', '5', '2', '文档模型', 'infoModel', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('582', '38', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '10', '1', '0');
INSERT INTO `cms_model_field` VALUES ('583', '38', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '11', '1', '0');
INSERT INTO `cms_model_field` VALUES ('584', '38', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '12', '0', '0');
INSERT INTO `cms_model_field` VALUES ('585', '38', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('586', '38', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '14', '1', '0');
INSERT INTO `cms_model_field` VALUES ('587', '38', '1', '2', '静态化页数', 'staticPage', null, '1', '0', '15', '1', '0');
INSERT INTO `cms_model_field` VALUES ('588', '39', '1', '2', '栏目', 'node', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('589', '39', '1', '2', '专题', 'specials', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('590', '39', '1', '2', '标题', 'title', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('591', '39', '1', '2', '颜色', 'color', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('592', '39', '1', '2', '关键词', 'tagKeywords', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('593', '39', '6', '2', '描述', 'metaDescription', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('594', '39', '1', '2', '优先级', 'priority', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('595', '39', '2', '2', '发布时间', 'publishDate', null, null, '0', '7', '1', '0');
INSERT INTO `cms_model_field` VALUES ('596', '39', '1', '2', '来源', 'source', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('597', '39', '1', '2', '作者', 'author', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('598', '39', '1', '2', '属性', 'attributes', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('599', '39', '50', '2', '正文', 'text', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('601', '40', '1', '2', '栏目', 'node', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('602', '40', '1', '2', '专题', 'specials', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('603', '40', '1', '2', '标题', 'title', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('604', '40', '1', '2', '颜色', 'color', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('605', '40', '1', '2', '关键词', 'tagKeywords', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('606', '40', '6', '2', '描述', 'metaDescription', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('607', '40', '1', '2', '优先级', 'priority', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('608', '40', '2', '2', '发布时间', 'publishDate', null, null, '0', '7', '1', '0');
INSERT INTO `cms_model_field` VALUES ('609', '40', '1', '2', '来源', 'source', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('610', '40', '1', '2', '作者', 'author', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('611', '40', '1', '2', '属性', 'attributes', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('612', '40', '50', '2', '正文', 'text', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('613', '40', '7', '0', '标题图', 'smallimage', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('614', '41', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('615', '41', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('616', '41', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('617', '41', '1', '2', '链接地址', 'link', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('618', '41', '5', '2', '新窗口打开', 'newWindow', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('619', '41', '1', '2', '关键词', 'metaKeywords', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('620', '41', '1', '2', '描述', 'metaDescription', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('621', '41', '5', '2', '审核流程', 'workflow', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('622', '41', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('623', '41', '5', '2', '文档模型', 'infoModel', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('624', '41', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '10', '1', '0');
INSERT INTO `cms_model_field` VALUES ('625', '41', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '11', '1', '0');
INSERT INTO `cms_model_field` VALUES ('626', '41', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '12', '0', '0');
INSERT INTO `cms_model_field` VALUES ('627', '41', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('628', '41', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '14', '1', '0');
INSERT INTO `cms_model_field` VALUES ('629', '41', '1', '2', '静态化页数', 'staticPage', null, '1', '0', '15', '1', '0');
INSERT INTO `cms_model_field` VALUES ('630', '39', '7', '2', '标题图', 'smallImage', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('631', '39', '51', '2', '图片集', 'images', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('632', '42', '1', '0', '公司名称', 'company', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('633', '42', '1', '0', '备案号', 'icp', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('634', '43', '1', '2', '名称', 'name', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('635', '43', '1', '2', '编码', 'number', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('636', '43', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('637', '43', '5', '2', '文档模型', 'infoModel', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('638', '43', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('639', '43', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '5', '1', '0');
INSERT INTO `cms_model_field` VALUES ('640', '43', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('641', '43', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('642', '43', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('643', '43', '1', '2', '静态化页数', 'staticPage', null, '1', '1', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('644', '43', '1', '2', '关键词', 'metaKeywords', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('645', '43', '1', '2', '描述', 'metaDescription', null, null, '0', '11', '0', '0');
INSERT INTO `cms_model_field` VALUES ('646', '43', '3', '2', '浏览权限', 'viewGroups', null, null, '0', '2147483647', '0', '0');
INSERT INTO `cms_model_field` VALUES ('647', '44', '1', '2', '所属栏目', 'parent', null, null, '0', '0', '0', '0');
INSERT INTO `cms_model_field` VALUES ('648', '44', '1', '2', '名称', 'name', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('649', '44', '1', '2', '编码', 'number', null, null, '0', '2', '1', '0');
INSERT INTO `cms_model_field` VALUES ('650', '44', '1', '2', '链接地址', 'link', null, null, '0', '3', '1', '0');
INSERT INTO `cms_model_field` VALUES ('651', '44', '5', '2', '新窗口打开', 'newWindow', null, null, '0', '4', '1', '0');
INSERT INTO `cms_model_field` VALUES ('652', '44', '1', '2', '关键词', 'metaKeywords', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('653', '44', '1', '2', '描述', 'metaDescription', null, null, '0', '6', '0', '0');
INSERT INTO `cms_model_field` VALUES ('654', '44', '5', '2', '审核流程', 'workflow', null, null, '0', '7', '0', '0');
INSERT INTO `cms_model_field` VALUES ('655', '44', '5', '2', '栏目模型', 'nodeModel', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('656', '44', '5', '2', '文档模型', 'infoModel', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('657', '44', '1', '2', '栏目页模板', 'nodeTemplate', null, null, '0', '10', '1', '0');
INSERT INTO `cms_model_field` VALUES ('658', '44', '1', '2', '文档页模板', 'infoTemplate', null, null, '0', '11', '1', '0');
INSERT INTO `cms_model_field` VALUES ('659', '44', '1', '2', '栏目页静态化', 'generateNode', null, null, '0', '12', '0', '0');
INSERT INTO `cms_model_field` VALUES ('660', '44', '1', '2', '文档页静态化', 'generateInfo', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('661', '44', '5', '2', '静态化方式', 'staticMethod', null, null, '0', '14', '1', '0');
INSERT INTO `cms_model_field` VALUES ('662', '44', '1', '2', '静态化页数', 'staticPage', null, '1', '0', '15', '1', '0');
INSERT INTO `cms_model_field` VALUES ('663', '45', '1', '2', '栏目', 'node', null, null, '0', '0', '1', '0');
INSERT INTO `cms_model_field` VALUES ('664', '45', '1', '2', '专题', 'specials', null, null, '0', '1', '1', '0');
INSERT INTO `cms_model_field` VALUES ('665', '45', '1', '2', '标题', 'title', null, null, '0', '2', '0', '0');
INSERT INTO `cms_model_field` VALUES ('666', '45', '1', '2', '颜色', 'color', null, null, '0', '3', '0', '0');
INSERT INTO `cms_model_field` VALUES ('667', '45', '1', '2', '关键词', 'tagKeywords', null, null, '0', '4', '0', '0');
INSERT INTO `cms_model_field` VALUES ('668', '45', '6', '2', '描述', 'metaDescription', null, null, '0', '5', '0', '0');
INSERT INTO `cms_model_field` VALUES ('669', '45', '1', '2', '优先级', 'priority', null, null, '0', '6', '1', '0');
INSERT INTO `cms_model_field` VALUES ('670', '45', '2', '2', '发布时间', 'publishDate', null, null, '0', '7', '1', '0');
INSERT INTO `cms_model_field` VALUES ('671', '45', '1', '2', '来源', 'source', null, null, '0', '8', '1', '0');
INSERT INTO `cms_model_field` VALUES ('672', '45', '1', '2', '作者', 'author', null, null, '0', '9', '1', '0');
INSERT INTO `cms_model_field` VALUES ('673', '45', '1', '2', '属性', 'attributes', null, null, '0', '10', '0', '0');
INSERT INTO `cms_model_field` VALUES ('674', '45', '50', '2', '正文', 'text', null, null, '0', '13', '0', '0');
INSERT INTO `cms_model_field` VALUES ('675', '45', '7', '0', '标题图', 'smallimage', null, null, '0', '2147483647', '0', '0');

-- ----------------------------
-- Table structure for cms_model_field_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_model_field_custom`;
CREATE TABLE `cms_model_field_custom` (
  `f_modefiel_id` int(11) NOT NULL,
  `f_key` varchar(50) NOT NULL COMMENT '键',
  `f_value` varchar(2000) DEFAULT NULL COMMENT '值',
  KEY `fk_cms_modfiecus_modefiel` (`f_modefiel_id`),
  CONSTRAINT `fk_cms_modfiecus_modefiel` FOREIGN KEY (`f_modefiel_id`) REFERENCES `cms_model_field` (`f_modefiel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模型字段自定义信息表';

-- ----------------------------
-- Records of cms_model_field_custom
-- ----------------------------
INSERT INTO `cms_model_field_custom` VALUES ('201', 'datePattern', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'cols', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'imageHeight', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'rows', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'width', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'maxlength', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'toolbar', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'options', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'height', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'imageWidth', '');
INSERT INTO `cms_model_field_custom` VALUES ('201', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('279', 'thumbnail', 'true');
INSERT INTO `cms_model_field_custom` VALUES ('279', 'thumbnailWidth', '130');
INSERT INTO `cms_model_field_custom` VALUES ('279', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('279', 'imageHeight', '800');
INSERT INTO `cms_model_field_custom` VALUES ('279', 'imageWidth', '800');
INSERT INTO `cms_model_field_custom` VALUES ('279', 'imageScale', 'true');
INSERT INTO `cms_model_field_custom` VALUES ('279', 'thumbnailHeight', '80');
INSERT INTO `cms_model_field_custom` VALUES ('281', 'imageHeight', '100');
INSERT INTO `cms_model_field_custom` VALUES ('281', 'imageWidth', '140');
INSERT INTO `cms_model_field_custom` VALUES ('281', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('281', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('306', 'options', '国产软件\r\n国外软件');
INSERT INTO `cms_model_field_custom` VALUES ('307', 'options', '免费软件\r\n收费软件');
INSERT INTO `cms_model_field_custom` VALUES ('308', 'options', '简体中文\r\n繁体中文\r\n英文');
INSERT INTO `cms_model_field_custom` VALUES ('309', 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES ('309', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('309', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('322', 'imageHeight', '80');
INSERT INTO `cms_model_field_custom` VALUES ('322', 'imageWidth', '130');
INSERT INTO `cms_model_field_custom` VALUES ('322', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('322', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('328', 'imageHeight', '200');
INSERT INTO `cms_model_field_custom` VALUES ('328', 'imageWidth', '200');
INSERT INTO `cms_model_field_custom` VALUES ('331', 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES ('331', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('331', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('332', 'width', '250');
INSERT INTO `cms_model_field_custom` VALUES ('332', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('332', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('333', 'imageHeight', '310');
INSERT INTO `cms_model_field_custom` VALUES ('333', 'imageWidth', '310');
INSERT INTO `cms_model_field_custom` VALUES ('333', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('333', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('334', 'options', '有货\r\n缺货');
INSERT INTO `cms_model_field_custom` VALUES ('335', 'width', '');
INSERT INTO `cms_model_field_custom` VALUES ('335', 'height', '');
INSERT INTO `cms_model_field_custom` VALUES ('335', 'toolbar', 'Cms');
INSERT INTO `cms_model_field_custom` VALUES ('336', 'width', '');
INSERT INTO `cms_model_field_custom` VALUES ('336', 'height', '');
INSERT INTO `cms_model_field_custom` VALUES ('336', 'toolbar', 'Cms');
INSERT INTO `cms_model_field_custom` VALUES ('337', 'width', '');
INSERT INTO `cms_model_field_custom` VALUES ('337', 'height', '');
INSERT INTO `cms_model_field_custom` VALUES ('337', 'toolbar', 'Cms');
INSERT INTO `cms_model_field_custom` VALUES ('338', 'width', '');
INSERT INTO `cms_model_field_custom` VALUES ('338', 'height', '');
INSERT INTO `cms_model_field_custom` VALUES ('338', 'toolbar', 'Cms');
INSERT INTO `cms_model_field_custom` VALUES ('328', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('328', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('339', 'options', 'win8\r\nwin7\r\nvista\r\nwinxp\r\nwin2003');
INSERT INTO `cms_model_field_custom` VALUES ('340', 'imageHeight', '93');
INSERT INTO `cms_model_field_custom` VALUES ('340', 'imageWidth', '140');
INSERT INTO `cms_model_field_custom` VALUES ('344', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('344', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('344', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('345', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('345', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('345', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('357', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('357', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('357', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('358', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('358', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('358', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('359', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('359', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('359', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('360', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('360', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('360', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('361', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('361', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('361', 'width', '300');
INSERT INTO `cms_model_field_custom` VALUES ('362', 'height', '80');
INSERT INTO `cms_model_field_custom` VALUES ('362', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('362', 'width', '500');
INSERT INTO `cms_model_field_custom` VALUES ('363', 'height', '80');
INSERT INTO `cms_model_field_custom` VALUES ('363', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('363', 'width', '500');
INSERT INTO `cms_model_field_custom` VALUES ('354', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('354', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('354', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('366', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('366', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('366', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('367', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('367', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('367', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('423', 'width', '');
INSERT INTO `cms_model_field_custom` VALUES ('423', 'options', '瑞彩千呈相关知识\r\n乳胶漆相关知识');
INSERT INTO `cms_model_field_custom` VALUES ('424', 'imageWidth', '');
INSERT INTO `cms_model_field_custom` VALUES ('424', 'imageHeight', '');
INSERT INTO `cms_model_field_custom` VALUES ('424', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('424', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('425', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('425', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('425', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('426', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('426', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('426', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('468', 'imageHeight', '');
INSERT INTO `cms_model_field_custom` VALUES ('468', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('468', 'imageWidth', '');
INSERT INTO `cms_model_field_custom` VALUES ('468', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('469', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('469', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('469', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('470', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('470', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('470', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('512', 'imageHeight', '');
INSERT INTO `cms_model_field_custom` VALUES ('512', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('512', 'imageWidth', '');
INSERT INTO `cms_model_field_custom` VALUES ('512', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('513', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('513', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('513', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('514', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('514', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('514', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('556', 'imageHeight', '');
INSERT INTO `cms_model_field_custom` VALUES ('556', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('556', 'imageWidth', '');
INSERT INTO `cms_model_field_custom` VALUES ('556', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('557', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('557', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('557', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('558', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('558', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('558', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('613', 'imageHeight', '');
INSERT INTO `cms_model_field_custom` VALUES ('613', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('613', 'imageWidth', '');
INSERT INTO `cms_model_field_custom` VALUES ('613', 'imageWatermark', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('630', 'imageHeight', '93');
INSERT INTO `cms_model_field_custom` VALUES ('630', 'imageWidth', '140');
INSERT INTO `cms_model_field_custom` VALUES ('632', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('632', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('632', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('633', 'maxLength', '');
INSERT INTO `cms_model_field_custom` VALUES ('633', 'validation', '');
INSERT INTO `cms_model_field_custom` VALUES ('633', 'width', '180');
INSERT INTO `cms_model_field_custom` VALUES ('675', 'imageHeight', '');
INSERT INTO `cms_model_field_custom` VALUES ('675', 'imageScale', 'false');
INSERT INTO `cms_model_field_custom` VALUES ('675', 'imageWidth', '');
INSERT INTO `cms_model_field_custom` VALUES ('675', 'imageWatermark', 'false');

-- ----------------------------
-- Table structure for cms_node
-- ----------------------------
DROP TABLE IF EXISTS `cms_node`;
CREATE TABLE `cms_node` (
  `f_node_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_parent_id` int(11) DEFAULT NULL COMMENT '父节点',
  `f_creator_id` int(11) NOT NULL COMMENT '创建者',
  `f_node_model_id` int(11) NOT NULL COMMENT '节点模型',
  `f_workflow_id` int(11) DEFAULT NULL COMMENT '流程',
  `f_domain` varchar(100) DEFAULT NULL COMMENT '绑定域名',
  `f_domain_path` varchar(100) DEFAULT NULL COMMENT '绑定目录',
  `f_info_model_id` int(11) DEFAULT NULL COMMENT '信息模型',
  `f_number` varchar(100) DEFAULT NULL COMMENT '编码',
  `f_name` varchar(150) NOT NULL COMMENT '名称',
  `f_tree_number` varchar(100) NOT NULL DEFAULT '0000' COMMENT '树编码',
  `f_tree_level` int(11) NOT NULL DEFAULT '0' COMMENT '树级别',
  `f_tree_max` varchar(10) NOT NULL DEFAULT '0000' COMMENT '树子节点最大编码',
  `f_creation_date` datetime NOT NULL COMMENT '创建时间',
  `f_refers` int(11) NOT NULL DEFAULT '0' COMMENT '信息数量',
  `f_views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览总数',
  `f_is_real_node` char(1) NOT NULL DEFAULT '1' COMMENT '是否真实节点',
  `f_is_hidden` char(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `f_p1` tinyint(4) DEFAULT NULL COMMENT '自定义1',
  `f_p2` tinyint(4) DEFAULT NULL COMMENT '自定义2',
  `f_p3` tinyint(4) DEFAULT NULL COMMENT '自定义3',
  `f_p4` tinyint(4) DEFAULT NULL COMMENT '自定义4',
  `f_p5` tinyint(4) DEFAULT NULL COMMENT '自定义5',
  `f_p6` tinyint(4) DEFAULT NULL COMMENT '自定义6',
  PRIMARY KEY (`f_node_id`),
  KEY `fk_cms_node_model_info` (`f_info_model_id`),
  KEY `fk_cms_node_model_node` (`f_node_model_id`),
  KEY `fk_cms_node_parent` (`f_parent_id`),
  KEY `fk_cms_node_site` (`f_site_id`),
  KEY `fk_cms_node_user_creator` (`f_creator_id`),
  KEY `fk_cms_node_workflow` (`f_workflow_id`),
  CONSTRAINT `fk_cms_node_model_info` FOREIGN KEY (`f_info_model_id`) REFERENCES `cms_model` (`f_model_id`),
  CONSTRAINT `fk_cms_node_model_node` FOREIGN KEY (`f_node_model_id`) REFERENCES `cms_model` (`f_model_id`),
  CONSTRAINT `fk_cms_node_parent` FOREIGN KEY (`f_parent_id`) REFERENCES `cms_node` (`f_node_id`),
  CONSTRAINT `fk_cms_node_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`),
  CONSTRAINT `fk_cms_node_user_creator` FOREIGN KEY (`f_creator_id`) REFERENCES `cms_user` (`f_user_id`),
  CONSTRAINT `fk_cms_node_workflow` FOREIGN KEY (`f_workflow_id`) REFERENCES `cms_workflow` (`f_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
-- Records of cms_node
-- ----------------------------
INSERT INTO `cms_node` VALUES ('1', '1', null, '1', '1', null, null, null, '2', null, '首页', '0000', '0', '000i', '2013-02-21 20:59:27', '-43', '140', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('36', '1', '1', '1', '3', null, null, null, '2', 'news', '新闻', '0000-0000', '1', '0003', '2013-03-04 22:18:36', '-9', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('38', '1', '1', '1', '4', null, null, null, '2', 'yule', '娱乐', '0000-0004', '1', '0000', '2013-03-04 22:18:42', '-7', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('39', '1', '1', '1', '3', null, null, null, '2', 'tech', '科技', '0000-0006', '1', '0000', '2013-03-18 01:27:17', '-11', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('40', '1', '1', '1', '3', null, null, null, '2', 'sport', '体育', '0000-0005', '1', '0000', '2013-03-18 01:27:48', '-3', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('41', '1', '1', '1', '3', '2', null, null, '2', 'fina', '财经', '0000-0003', '1', '0000', '2013-03-18 01:28:02', '-7', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('42', '1', '36', '1', '3', null, null, null, '2', null, '国内', '0000-0000-0000', '2', '0001', '2013-03-18 01:30:03', '-16', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('43', '1', '36', '1', '3', null, null, null, '2', null, '社会', '0000-0000-0002', '2', '0000', '2013-03-18 01:33:08', '-16', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('44', '1', '36', '1', '3', null, null, null, '2', 'guoji', '国际', '0000-0000-0001', '2', '0000', '2013-03-18 01:33:48', '-21', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('45', '1', '1', '1', '3', null, null, null, null, 'notice', '网站公告', '0000-000a', '1', '0000', '2013-03-18 12:54:03', '6', '0', '0', '1', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('48', '1', '1', '1', '4', null, null, null, '5', 'picture', '图集', '0000-0001', '1', '0000', '2013-08-06 02:11:53', '6', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('49', '1', '1', '1', '6', null, null, null, '7', 'download', '下载', '0000-0008', '1', '0000', '2013-08-06 08:45:34', '3', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('51', '1', '1', '1', '8', null, null, null, '9', 'video', '视频', '0000-0002', '1', '0000', '2013-08-08 01:42:51', '4', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('52', '1', '1', '1', '10', null, null, null, '11', 'product', '产品', '0000-0007', '1', '0000', '2013-08-08 05:56:39', '5', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('67', '1', '1', '1', '3', null, null, null, null, 'guestbook', '在线留言', '0000-000c', '1', '0000', '2013-08-09 08:44:10', '0', '0', '0', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('68', '1', '1', '1', '3', null, null, null, null, 'bbs', '论坛', '0000-000d', '1', '0000', '2013-08-14 06:41:58', '0', '0', '0', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('69', '1', '1', '1', '13', null, null, null, '14', null, '诚聘英才', '0000-000b', '1', '0000', '2014-03-18 14:13:23', '2', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('74', '3', null, '1', '16', null, null, null, '18', null, '测试第一个栏目', '0000', '0', '0006', '2015-03-26 21:18:21', '1', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('75', '3', '74', '1', '17', null, null, null, '21', 'colors', '瑞彩千呈', '0000-0000', '1', '0000', '2015-03-28 15:29:25', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('76', '3', '74', '1', '17', null, null, null, '21', 'product', '产品', '0000-0001', '1', '0003', '2015-03-28 15:33:03', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('77', '3', '74', '1', '17', null, null, null, '18', 'blog', '企业新闻', '0000-0002', '1', '0000', '2015-03-28 15:33:23', '15', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('78', '3', '74', '1', '17', null, null, null, '21', 'kbase', '知识库', '0000-0003', '1', '0003', '2015-03-28 15:33:31', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('79', '3', '74', '1', '17', null, null, null, '18', 'network', '经销网点', '0000-0004', '1', '0000', '2015-03-28 15:33:42', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('80', '3', '74', '1', '17', null, null, null, '18', 'gc', '专业工程', '0000-0005', '1', '0000', '2015-03-28 15:33:51', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('81', '3', '76', '1', '17', null, null, null, '18', null, '产品1', '0000-0001-0000', '2', '0000', '2015-03-28 15:37:55', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('82', '3', '76', '1', '17', null, null, null, '18', null, '产品2', '0000-0001-0001', '2', '0000', '2015-03-28 15:38:06', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('83', '3', '76', '1', '17', null, null, null, '18', null, '产品3', '0000-0001-0002', '2', '0000', '2015-03-28 15:38:10', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('84', '3', '78', '1', '17', null, null, null, '21', null, '瑞彩千呈相关知识', '0000-0003-0000', '2', '0000', '2015-03-28 20:50:09', '4', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('85', '3', '78', '1', '17', null, null, null, '21', null, '乳胶漆相关知识', '0000-0003-0001', '2', '0000', '2015-03-28 20:50:15', '4', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('86', '3', '78', '1', '17', null, null, null, '21', null, '木器漆相关知识', '0000-0003-0002', '2', '0000', '2015-03-28 20:50:23', '4', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('87', '4', null, '1', '23', null, null, null, '25', null, '新闻', '0000', '0', '0004', '2015-03-28 22:31:57', '1', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('88', '4', '87', '1', '24', null, null, null, '25', 'introduction', '简介', '0000-0000', '1', '0005', '2015-03-28 22:54:08', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('89', '4', '87', '1', '24', null, null, null, '25', 'news', '新闻', '0000-0001', '1', '0003', '2015-03-28 22:54:23', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('90', '4', '87', '1', '24', null, null, null, '27', 'project', '项目', '0000-0002', '1', '0005', '2015-03-28 22:54:37', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('91', '4', '87', '1', '24', null, null, null, '25', 'contact', '联系', '0000-0003', '1', '0000', '2015-03-28 22:54:49', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('92', '4', '88', '1', '24', null, null, null, '25', 'linian', '公司理念', '0000-0000-0000', '2', '0000', '2015-03-28 23:18:00', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('93', '4', '88', '1', '24', null, null, null, '25', 'youshi', '行业优势', '0000-0000-0001', '2', '0000', '2015-03-28 23:18:12', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('94', '4', '88', '1', '24', null, null, null, '25', 'server', '服务理念', '0000-0000-0002', '2', '0000', '2015-03-28 23:18:23', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('95', '4', '88', '1', '24', null, null, null, '25', 'fanwei', '服务范围', '0000-0000-0003', '2', '0000', '2015-03-28 23:18:39', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('96', '4', '88', '1', '24', null, null, null, '25', 'team', '精英团队', '0000-0000-0004', '2', '0000', '2015-03-28 23:19:20', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('97', '4', '89', '1', '24', null, null, null, '25', 'dongtai', '公司动态', '0000-0001-0000', '2', '0000', '2015-03-28 23:20:06', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('98', '4', '89', '1', '24', null, null, null, '25', 'hangye', '行业动态', '0000-0001-0001', '2', '0000', '2015-03-28 23:20:15', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('99', '4', '89', '1', '24', null, null, null, '25', 'qingshi', '青士课堂', '0000-0001-0002', '2', '0000', '2015-03-28 23:20:51', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('100', '4', '90', '1', '24', null, null, null, '27', 'juzhu', '居住景观', '0000-0002-0000', '2', '0000', '2015-03-28 23:21:21', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('101', '4', '90', '1', '24', null, null, null, '27', 'guihua', '景观规划', '0000-0002-0001', '2', '0000', '2015-03-28 23:21:36', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('102', '4', '90', '1', '24', null, null, null, '27', 'gonggong', '公共景观', '0000-0002-0002', '2', '0000', '2015-03-28 23:21:51', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('103', '4', '90', '1', '24', null, null, null, '27', 'yishu', '自然艺术', '0000-0002-0003', '2', '0000', '2015-03-28 23:22:04', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('104', '4', '90', '1', '24', null, null, null, '27', 'donghua', '动画漫游', '0000-0002-0004', '2', '0000', '2015-03-28 23:22:18', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('105', '5', null, '1', '29', null, null, null, '31', null, '首页', '0000', '0', '0000', '2015-03-29 14:09:02', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('106', '6', null, '1', '33', null, null, null, '35', null, '首页', '0000', '0', '0004', '2015-04-06 12:32:50', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('107', '6', '106', '1', '34', null, null, null, '35', 'About us', '关于我们', '0000-0000', '1', '0000', '2015-04-06 12:45:31', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('108', '6', '106', '1', '34', null, null, null, '35', 'Business', '业务领域', '0000-0001', '1', '0000', '2015-04-06 12:46:07', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('109', '6', '106', '1', '34', null, null, null, '35', 'News center', '新闻中心', '0000-0002', '1', '0000', '2015-04-06 12:46:17', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('110', '6', '106', '1', '34', null, null, null, '35', 'Recruitment', '人才招聘', '0000-0003', '1', '0000', '2015-04-06 12:46:30', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('111', '7', null, '1', '37', null, null, null, '39', 'home', '首页', '0000', '0', '0006', '2015-04-18 10:24:17', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('112', '7', '111', '1', '38', null, null, null, '39', null, '网站建设', '0000-0000', '1', '0000', '2015-04-18 21:18:21', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('113', '7', '111', '1', '41', null, null, null, '40', null, '经典案例', '0000-0001', '1', '0000', '2015-04-18 21:18:41', '8', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('114', '7', '111', '1', '38', null, null, null, '39', null, '售后服务', '0000-0002', '1', '0000', '2015-04-18 21:18:49', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('115', '7', '111', '1', '38', null, null, null, '39', null, '关于我们', '0000-0003', '1', '0000', '2015-04-18 21:18:56', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('116', '7', '111', '1', '38', null, null, null, '39', null, '联系我们', '0000-0004', '1', '0000', '2015-04-18 21:19:05', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('117', '7', '111', '1', '38', null, null, null, '39', null, '网站公告', '0000-0005', '1', '0000', '2015-04-18 22:53:49', '6', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('118', '8', null, '1', '43', null, null, null, '45', 'home', '首页', '0000', '0', '0004', '2015-04-24 12:04:15', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('119', '8', '118', '1', '44', null, null, null, '45', 'news', '最近更新', '0000-0000', '1', '0000', '2015-04-24 12:20:27', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('120', '8', '118', '1', '44', null, null, null, '45', 'olds', '传统网站', '0000-0001', '1', '0000', '2015-04-24 12:20:46', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('121', '8', '118', '1', '44', null, null, null, '45', 'phones', '手机网站', '0000-0002', '1', '0000', '2015-04-24 12:20:59', '0', '0', '1', '0', null, null, null, null, null, null);
INSERT INTO `cms_node` VALUES ('122', '8', '118', '1', '44', null, null, null, '45', 'server', '建站服务', '0000-0003', '1', '0000', '2015-04-24 12:21:20', '0', '0', '1', '0', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for cms_node_buffer
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_buffer`;
CREATE TABLE `cms_node_buffer` (
  `f_node_id` int(11) NOT NULL,
  `f_views` int(11) NOT NULL COMMENT '浏览次数',
  PRIMARY KEY (`f_node_id`),
  CONSTRAINT `fk_cms_nodebuffer_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点缓冲表';

-- ----------------------------
-- Records of cms_node_buffer
-- ----------------------------
INSERT INTO `cms_node_buffer` VALUES ('1', '7');
INSERT INTO `cms_node_buffer` VALUES ('38', '5');
INSERT INTO `cms_node_buffer` VALUES ('42', '1');
INSERT INTO `cms_node_buffer` VALUES ('44', '2');
INSERT INTO `cms_node_buffer` VALUES ('48', '0');
INSERT INTO `cms_node_buffer` VALUES ('49', '0');
INSERT INTO `cms_node_buffer` VALUES ('51', '0');
INSERT INTO `cms_node_buffer` VALUES ('52', '0');
INSERT INTO `cms_node_buffer` VALUES ('67', '0');
INSERT INTO `cms_node_buffer` VALUES ('68', '0');
INSERT INTO `cms_node_buffer` VALUES ('69', '0');
INSERT INTO `cms_node_buffer` VALUES ('74', '0');
INSERT INTO `cms_node_buffer` VALUES ('75', '0');
INSERT INTO `cms_node_buffer` VALUES ('76', '0');
INSERT INTO `cms_node_buffer` VALUES ('77', '0');
INSERT INTO `cms_node_buffer` VALUES ('78', '0');
INSERT INTO `cms_node_buffer` VALUES ('79', '0');
INSERT INTO `cms_node_buffer` VALUES ('80', '0');
INSERT INTO `cms_node_buffer` VALUES ('81', '0');
INSERT INTO `cms_node_buffer` VALUES ('82', '0');
INSERT INTO `cms_node_buffer` VALUES ('83', '0');
INSERT INTO `cms_node_buffer` VALUES ('84', '0');
INSERT INTO `cms_node_buffer` VALUES ('85', '0');
INSERT INTO `cms_node_buffer` VALUES ('86', '0');
INSERT INTO `cms_node_buffer` VALUES ('87', '0');
INSERT INTO `cms_node_buffer` VALUES ('88', '0');
INSERT INTO `cms_node_buffer` VALUES ('89', '0');
INSERT INTO `cms_node_buffer` VALUES ('90', '0');
INSERT INTO `cms_node_buffer` VALUES ('91', '0');
INSERT INTO `cms_node_buffer` VALUES ('92', '0');
INSERT INTO `cms_node_buffer` VALUES ('93', '0');
INSERT INTO `cms_node_buffer` VALUES ('94', '0');
INSERT INTO `cms_node_buffer` VALUES ('95', '0');
INSERT INTO `cms_node_buffer` VALUES ('96', '0');
INSERT INTO `cms_node_buffer` VALUES ('97', '0');
INSERT INTO `cms_node_buffer` VALUES ('98', '0');
INSERT INTO `cms_node_buffer` VALUES ('99', '0');
INSERT INTO `cms_node_buffer` VALUES ('100', '0');
INSERT INTO `cms_node_buffer` VALUES ('101', '0');
INSERT INTO `cms_node_buffer` VALUES ('102', '0');
INSERT INTO `cms_node_buffer` VALUES ('103', '0');
INSERT INTO `cms_node_buffer` VALUES ('104', '0');
INSERT INTO `cms_node_buffer` VALUES ('105', '0');
INSERT INTO `cms_node_buffer` VALUES ('106', '0');
INSERT INTO `cms_node_buffer` VALUES ('107', '0');
INSERT INTO `cms_node_buffer` VALUES ('108', '0');
INSERT INTO `cms_node_buffer` VALUES ('109', '0');
INSERT INTO `cms_node_buffer` VALUES ('110', '0');
INSERT INTO `cms_node_buffer` VALUES ('111', '0');
INSERT INTO `cms_node_buffer` VALUES ('112', '0');
INSERT INTO `cms_node_buffer` VALUES ('113', '0');
INSERT INTO `cms_node_buffer` VALUES ('114', '0');
INSERT INTO `cms_node_buffer` VALUES ('115', '0');
INSERT INTO `cms_node_buffer` VALUES ('116', '0');
INSERT INTO `cms_node_buffer` VALUES ('117', '0');
INSERT INTO `cms_node_buffer` VALUES ('118', '0');
INSERT INTO `cms_node_buffer` VALUES ('119', '0');
INSERT INTO `cms_node_buffer` VALUES ('120', '0');
INSERT INTO `cms_node_buffer` VALUES ('121', '0');
INSERT INTO `cms_node_buffer` VALUES ('122', '0');

-- ----------------------------
-- Table structure for cms_node_clob
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_clob`;
CREATE TABLE `cms_node_clob` (
  `f_node_id` int(11) NOT NULL,
  `f_key` varchar(50) NOT NULL COMMENT '键',
  `f_value` longtext COMMENT '值',
  KEY `fk_cms_nodeclob_node` (`f_node_id`),
  CONSTRAINT `fk_cms_nodeclob_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点大字段表';

-- ----------------------------
-- Records of cms_node_clob
-- ----------------------------
INSERT INTO `cms_node_clob` VALUES ('49', 'text', '');

-- ----------------------------
-- Table structure for cms_node_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_custom`;
CREATE TABLE `cms_node_custom` (
  `f_node_id` int(11) NOT NULL,
  `f_key` varchar(50) NOT NULL COMMENT '键',
  `f_value` varchar(2000) DEFAULT NULL COMMENT '值',
  KEY `fk_cms_nodecustom_node` (`f_node_id`),
  CONSTRAINT `fk_cms_nodecustom_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点自定义表';

-- ----------------------------
-- Records of cms_node_custom
-- ----------------------------

-- ----------------------------
-- Table structure for cms_node_detail
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_detail`;
CREATE TABLE `cms_node_detail` (
  `f_node_id` int(11) NOT NULL,
  `f_link` varchar(255) DEFAULT NULL COMMENT '转向链接',
  `f_meta_keywords` varchar(150) DEFAULT NULL COMMENT '关键字',
  `f_meta_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_is_new_window` char(1) DEFAULT NULL COMMENT '是否在新窗口打开',
  `f_node_template` varchar(255) DEFAULT NULL COMMENT '节点模板',
  `f_info_template` varchar(255) DEFAULT NULL COMMENT '信息模板',
  `f_is_generate_node` char(1) DEFAULT NULL COMMENT '是否生成节点页',
  `f_is_generate_info` char(1) DEFAULT NULL COMMENT '是否生成信息页',
  `f_node_extension` varchar(10) DEFAULT NULL COMMENT '节点页扩展名',
  `f_info_extension` varchar(10) DEFAULT NULL COMMENT '信息页扩展名',
  `f_node_path` varchar(100) DEFAULT NULL COMMENT '节点路径',
  `f_info_path` varchar(100) DEFAULT NULL COMMENT '信息路径',
  `f_is_def_page` char(1) DEFAULT NULL COMMENT '是否默认页',
  `f_static_method` int(11) DEFAULT NULL COMMENT '静态页生成方式(0:手动生成;1:自动生成节点页;2:自动生成信息页及节点页;3:自动生成信息页、节点页、父节点页、首页)',
  `f_static_page` int(11) DEFAULT NULL COMMENT '节点列表静态化页数',
  `f_small_image` varchar(255) DEFAULT NULL COMMENT '小图',
  `f_large_image` varchar(255) DEFAULT NULL COMMENT '大图',
  PRIMARY KEY (`f_node_id`),
  CONSTRAINT `fk_cms_nodedetail_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点详细表';

-- ----------------------------
-- Records of cms_node_detail
-- ----------------------------
INSERT INTO `cms_node_detail` VALUES ('1', null, null, null, null, null, null, null, null, null, null, '/index', null, '1', null, '1', null, null);
INSERT INTO `cms_node_detail` VALUES ('36', null, null, null, null, '/cover.html', '/list.html', null, null, '.html', '.html', null, null, null, '4', '5', null, null);
INSERT INTO `cms_node_detail` VALUES ('38', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('39', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('40', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('41', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('42', null, null, null, null, null, null, '1', '1', '.html', '.html', '/zongzhan/guonei/index', '/zongzhan/guonei/{info_id}', '1', '4', '5', null, null);
INSERT INTO `cms_node_detail` VALUES ('43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('44', null, null, null, null, '/cover.html', '/list.html', '0', '0', '.html', '.html', 'guoji', 'guoji', '1', null, '4', null, null);
INSERT INTO `cms_node_detail` VALUES ('45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('52', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('67', '/guestbook.jspx', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('68', 'http://bbs.jspxcms.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('69', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('74', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('75', null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('76', null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('77', null, null, null, null, '/news_list.html', '/news_info.html', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('78', null, null, null, null, '/n_list.html', '/n_info.html', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('79', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('80', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('81', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('82', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('83', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('84', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('85', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('86', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('87', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('88', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('89', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('90', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('91', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('92', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('93', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('94', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('95', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('96', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('97', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('98', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('99', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('101', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('102', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('103', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('104', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('105', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('106', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('107', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('108', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('109', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('110', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('111', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('112', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('113', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('114', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('115', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('116', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('117', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('118', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('119', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('120', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('121', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cms_node_detail` VALUES ('122', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for cms_node_membergroup
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_membergroup`;
CREATE TABLE `cms_node_membergroup` (
  `f_nodemgroup_id` int(11) NOT NULL,
  `f_node_id` int(11) NOT NULL,
  `f_membergroup_id` int(11) NOT NULL,
  `f_is_view_perm` char(1) NOT NULL DEFAULT '1' COMMENT '是否有浏览权限',
  `f_is_contri_perm` char(1) NOT NULL DEFAULT '1' COMMENT '是否有投稿权限',
  `f_is_comment_perm` char(1) NOT NULL DEFAULT '1' COMMENT '是否有评论权限',
  PRIMARY KEY (`f_nodemgroup_id`),
  KEY `fk_cms_nodemgroup_group` (`f_membergroup_id`),
  KEY `fk_cms_nodemgroup_node` (`f_node_id`),
  CONSTRAINT `fk_cms_nodemgroup_group` FOREIGN KEY (`f_membergroup_id`) REFERENCES `cms_member_group` (`f_membergroup_id`),
  CONSTRAINT `fk_cms_nodemgroup_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点与用户组权限表';

-- ----------------------------
-- Records of cms_node_membergroup
-- ----------------------------
INSERT INTO `cms_node_membergroup` VALUES ('1', '1', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('2', '36', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('3', '42', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('4', '44', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('5', '43', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('6', '48', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('7', '51', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('8', '41', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('9', '38', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('10', '40', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('11', '39', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('12', '52', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('13', '49', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('15', '45', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('16', '68', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('17', '67', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('18', '1', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('19', '36', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('20', '42', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('21', '44', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('22', '43', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('23', '48', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('24', '51', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('25', '41', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('26', '38', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('27', '40', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('28', '39', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('29', '52', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('30', '49', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('32', '45', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('33', '68', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('34', '67', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('35', '69', '0', '1', '0', '0');
INSERT INTO `cms_node_membergroup` VALUES ('36', '69', '1', '1', '0', '0');
INSERT INTO `cms_node_membergroup` VALUES ('45', '74', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('46', '74', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('47', '75', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('48', '75', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('49', '76', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('50', '76', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('51', '77', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('52', '77', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('53', '78', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('54', '78', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('55', '79', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('56', '79', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('57', '80', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('58', '80', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('59', '81', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('60', '81', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('61', '82', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('62', '82', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('63', '83', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('64', '83', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('65', '84', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('66', '84', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('67', '85', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('68', '85', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('69', '86', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('70', '86', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('71', '87', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('72', '87', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('73', '88', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('74', '88', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('75', '89', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('76', '89', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('77', '90', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('78', '90', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('79', '91', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('80', '91', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('81', '92', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('82', '92', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('83', '93', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('84', '93', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('85', '94', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('86', '94', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('87', '95', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('88', '95', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('89', '96', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('90', '96', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('91', '97', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('92', '97', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('93', '98', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('94', '98', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('95', '99', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('96', '99', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('97', '100', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('98', '100', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('99', '101', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('100', '101', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('101', '102', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('102', '102', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('103', '103', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('104', '103', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('105', '104', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('106', '104', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('107', '105', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('108', '105', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('109', '106', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('110', '106', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('111', '107', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('112', '107', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('113', '108', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('114', '108', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('115', '109', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('116', '109', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('117', '110', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('118', '110', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('119', '111', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('120', '111', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('121', '112', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('122', '112', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('123', '113', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('124', '113', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('125', '114', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('126', '114', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('127', '115', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('128', '115', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('129', '116', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('130', '116', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('131', '117', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('132', '117', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('133', '118', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('134', '118', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('135', '119', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('136', '119', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('137', '120', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('138', '120', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('139', '121', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('140', '121', '1', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('141', '122', '0', '1', '1', '1');
INSERT INTO `cms_node_membergroup` VALUES ('142', '122', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for cms_node_org
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_org`;
CREATE TABLE `cms_node_org` (
  `f_nodeorg_id` int(11) NOT NULL,
  `f_org_id` int(11) NOT NULL,
  `f_node_id` int(11) NOT NULL,
  `f_is_view_perm` char(1) NOT NULL DEFAULT '0' COMMENT '是否有浏览权限',
  PRIMARY KEY (`f_nodeorg_id`),
  KEY `fk_cms_nodeorg_node` (`f_node_id`),
  KEY `fk_cms_nodeorg_org` (`f_org_id`),
  CONSTRAINT `fk_cms_nodeorg_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`),
  CONSTRAINT `fk_cms_nodeorg_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点与组织权限表';

-- ----------------------------
-- Records of cms_node_org
-- ----------------------------
INSERT INTO `cms_node_org` VALUES ('1', '1', '41', '0');
INSERT INTO `cms_node_org` VALUES ('2', '1', '69', '0');
INSERT INTO `cms_node_org` VALUES ('3', '1', '67', '0');
INSERT INTO `cms_node_org` VALUES ('4', '1', '68', '0');
INSERT INTO `cms_node_org` VALUES ('5', '1', '45', '0');
INSERT INTO `cms_node_org` VALUES ('10', '1', '74', '0');
INSERT INTO `cms_node_org` VALUES ('11', '1', '75', '0');
INSERT INTO `cms_node_org` VALUES ('12', '1', '76', '0');
INSERT INTO `cms_node_org` VALUES ('13', '1', '77', '0');
INSERT INTO `cms_node_org` VALUES ('14', '1', '78', '0');
INSERT INTO `cms_node_org` VALUES ('15', '1', '79', '0');
INSERT INTO `cms_node_org` VALUES ('16', '1', '80', '0');
INSERT INTO `cms_node_org` VALUES ('17', '1', '81', '0');
INSERT INTO `cms_node_org` VALUES ('18', '1', '82', '0');
INSERT INTO `cms_node_org` VALUES ('19', '1', '83', '0');
INSERT INTO `cms_node_org` VALUES ('20', '1', '84', '0');
INSERT INTO `cms_node_org` VALUES ('21', '1', '85', '0');
INSERT INTO `cms_node_org` VALUES ('22', '1', '86', '0');
INSERT INTO `cms_node_org` VALUES ('23', '1', '87', '0');
INSERT INTO `cms_node_org` VALUES ('24', '1', '88', '0');
INSERT INTO `cms_node_org` VALUES ('25', '1', '89', '0');
INSERT INTO `cms_node_org` VALUES ('26', '1', '90', '0');
INSERT INTO `cms_node_org` VALUES ('27', '1', '91', '0');
INSERT INTO `cms_node_org` VALUES ('28', '1', '92', '0');
INSERT INTO `cms_node_org` VALUES ('29', '1', '93', '0');
INSERT INTO `cms_node_org` VALUES ('30', '1', '94', '0');
INSERT INTO `cms_node_org` VALUES ('31', '1', '95', '0');
INSERT INTO `cms_node_org` VALUES ('32', '1', '96', '0');
INSERT INTO `cms_node_org` VALUES ('33', '1', '97', '0');
INSERT INTO `cms_node_org` VALUES ('34', '1', '98', '0');
INSERT INTO `cms_node_org` VALUES ('35', '1', '99', '0');
INSERT INTO `cms_node_org` VALUES ('36', '1', '100', '0');
INSERT INTO `cms_node_org` VALUES ('37', '1', '101', '0');
INSERT INTO `cms_node_org` VALUES ('38', '1', '102', '0');
INSERT INTO `cms_node_org` VALUES ('39', '1', '103', '0');
INSERT INTO `cms_node_org` VALUES ('40', '1', '104', '0');
INSERT INTO `cms_node_org` VALUES ('41', '1', '105', '0');
INSERT INTO `cms_node_org` VALUES ('42', '1', '106', '0');
INSERT INTO `cms_node_org` VALUES ('43', '1', '107', '0');
INSERT INTO `cms_node_org` VALUES ('44', '1', '108', '0');
INSERT INTO `cms_node_org` VALUES ('45', '1', '109', '0');
INSERT INTO `cms_node_org` VALUES ('46', '1', '110', '0');
INSERT INTO `cms_node_org` VALUES ('47', '1', '36', '0');
INSERT INTO `cms_node_org` VALUES ('48', '1', '44', '0');
INSERT INTO `cms_node_org` VALUES ('49', '1', '43', '0');
INSERT INTO `cms_node_org` VALUES ('50', '1', '42', '0');
INSERT INTO `cms_node_org` VALUES ('51', '1', '111', '0');
INSERT INTO `cms_node_org` VALUES ('52', '1', '112', '0');
INSERT INTO `cms_node_org` VALUES ('53', '1', '113', '0');
INSERT INTO `cms_node_org` VALUES ('54', '1', '114', '0');
INSERT INTO `cms_node_org` VALUES ('55', '1', '115', '0');
INSERT INTO `cms_node_org` VALUES ('56', '1', '116', '0');
INSERT INTO `cms_node_org` VALUES ('57', '1', '117', '0');
INSERT INTO `cms_node_org` VALUES ('58', '1', '118', '0');
INSERT INTO `cms_node_org` VALUES ('59', '1', '119', '0');
INSERT INTO `cms_node_org` VALUES ('60', '1', '120', '0');
INSERT INTO `cms_node_org` VALUES ('61', '1', '121', '0');
INSERT INTO `cms_node_org` VALUES ('62', '1', '122', '0');

-- ----------------------------
-- Table structure for cms_node_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_node_role`;
CREATE TABLE `cms_node_role` (
  `f_noderole_id` int(11) NOT NULL,
  `f_node_id` int(11) NOT NULL,
  `f_role_id` int(11) NOT NULL,
  `f_is_node_perm` char(1) NOT NULL DEFAULT '1' COMMENT '节点权限',
  `f_is_info_perm` char(1) NOT NULL DEFAULT '1' COMMENT '信息权限',
  PRIMARY KEY (`f_noderole_id`),
  KEY `fk_cms_noderole_node` (`f_node_id`),
  KEY `fk_cms_noderole_role` (`f_role_id`),
  CONSTRAINT `fk_cms_noderole_node` FOREIGN KEY (`f_node_id`) REFERENCES `cms_node` (`f_node_id`),
  CONSTRAINT `fk_cms_noderole_role` FOREIGN KEY (`f_role_id`) REFERENCES `cms_role` (`f_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点与角色权限表';

-- ----------------------------
-- Records of cms_node_role
-- ----------------------------
INSERT INTO `cms_node_role` VALUES ('1', '1', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('2', '36', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('3', '42', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('4', '44', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('5', '43', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('6', '48', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('7', '51', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('8', '41', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('9', '38', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('10', '40', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('11', '39', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('12', '52', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('13', '49', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('15', '45', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('16', '68', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('17', '67', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('18', '69', '1', '0', '0');
INSERT INTO `cms_node_role` VALUES ('23', '74', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('24', '75', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('25', '76', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('26', '77', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('27', '78', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('28', '79', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('29', '80', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('30', '81', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('31', '82', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('32', '83', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('33', '84', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('34', '85', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('35', '86', '3', '0', '0');
INSERT INTO `cms_node_role` VALUES ('36', '87', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('37', '88', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('38', '89', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('39', '90', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('40', '91', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('41', '92', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('42', '93', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('43', '94', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('44', '95', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('45', '96', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('46', '97', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('47', '98', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('48', '99', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('49', '100', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('50', '101', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('51', '102', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('52', '103', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('53', '104', '4', '0', '0');
INSERT INTO `cms_node_role` VALUES ('54', '105', '5', '0', '0');
INSERT INTO `cms_node_role` VALUES ('55', '106', '6', '0', '0');
INSERT INTO `cms_node_role` VALUES ('56', '107', '6', '0', '0');
INSERT INTO `cms_node_role` VALUES ('57', '108', '6', '0', '0');
INSERT INTO `cms_node_role` VALUES ('58', '109', '6', '0', '0');
INSERT INTO `cms_node_role` VALUES ('59', '110', '6', '0', '0');
INSERT INTO `cms_node_role` VALUES ('60', '111', '7', '0', '0');
INSERT INTO `cms_node_role` VALUES ('61', '112', '7', '0', '0');
INSERT INTO `cms_node_role` VALUES ('62', '113', '7', '0', '0');
INSERT INTO `cms_node_role` VALUES ('63', '114', '7', '0', '0');
INSERT INTO `cms_node_role` VALUES ('64', '115', '7', '0', '0');
INSERT INTO `cms_node_role` VALUES ('65', '116', '7', '0', '0');
INSERT INTO `cms_node_role` VALUES ('66', '117', '7', '0', '0');
INSERT INTO `cms_node_role` VALUES ('67', '118', '8', '0', '0');
INSERT INTO `cms_node_role` VALUES ('68', '119', '8', '0', '0');
INSERT INTO `cms_node_role` VALUES ('69', '120', '8', '0', '0');
INSERT INTO `cms_node_role` VALUES ('70', '121', '8', '0', '0');
INSERT INTO `cms_node_role` VALUES ('71', '122', '8', '0', '0');

-- ----------------------------
-- Table structure for cms_org
-- ----------------------------
DROP TABLE IF EXISTS `cms_org`;
CREATE TABLE `cms_org` (
  `f_org_id` int(11) NOT NULL,
  `f_parent_id` int(11) DEFAULT NULL COMMENT '上级组织',
  `f_name` varchar(150) NOT NULL COMMENT '名称',
  `f_full_name` varchar(150) DEFAULT NULL COMMENT '全称',
  `f_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_number` varchar(100) DEFAULT NULL COMMENT '编码',
  `f_phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `f_fax` varchar(100) DEFAULT NULL COMMENT '传真',
  `f_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `f_tree_number` varchar(100) NOT NULL DEFAULT '0000' COMMENT '树编码',
  `f_tree_level` int(11) NOT NULL DEFAULT '0' COMMENT '树级别',
  `f_tree_max` varchar(10) NOT NULL DEFAULT '0000' COMMENT '树子节点最大编码',
  PRIMARY KEY (`f_org_id`),
  KEY `fk_cms_org_parent` (`f_parent_id`),
  CONSTRAINT `fk_cms_org_parent` FOREIGN KEY (`f_parent_id`) REFERENCES `cms_org` (`f_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织表';

-- ----------------------------
-- Records of cms_org
-- ----------------------------
INSERT INTO `cms_org` VALUES ('1', null, '所有', null, null, '000', null, null, null, '0000', '0', '0001');

-- ----------------------------
-- Table structure for cms_qitem_qrecord
-- ----------------------------
DROP TABLE IF EXISTS `cms_qitem_qrecord`;
CREATE TABLE `cms_qitem_qrecord` (
  `f_qitemqrecord_id` int(11) NOT NULL,
  `f_questionrecord_id` int(11) NOT NULL,
  `f_questionoption_id` int(11) NOT NULL,
  `f_answer` longtext COMMENT '回答',
  PRIMARY KEY (`f_qitemqrecord_id`),
  KEY `fk_cms_qiqr_qoption` (`f_questionoption_id`),
  KEY `fk_cms_qiqr_qrecord` (`f_questionrecord_id`),
  CONSTRAINT `fk_cms_qiqr_qoption` FOREIGN KEY (`f_questionoption_id`) REFERENCES `cms_question_option` (`f_questionoption_id`),
  CONSTRAINT `fk_cms_qiqr_qrecord` FOREIGN KEY (`f_questionrecord_id`) REFERENCES `cms_question_record` (`f_questionrecord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查问卷项与调查问卷记录关联表';

-- ----------------------------
-- Records of cms_qitem_qrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cms_qoption_qrecord
-- ----------------------------
DROP TABLE IF EXISTS `cms_qoption_qrecord`;
CREATE TABLE `cms_qoption_qrecord` (
  `f_qoptionqrecord_id` int(11) NOT NULL,
  `f_questionrecord_id` int(11) NOT NULL,
  `f_questionoption_id` int(11) NOT NULL,
  PRIMARY KEY (`f_qoptionqrecord_id`),
  KEY `fk_cms_qoqr_qoption` (`f_questionoption_id`),
  KEY `fk_cms_qoqr_qrecord` (`f_questionrecord_id`),
  CONSTRAINT `fk_cms_qoqr_qoption` FOREIGN KEY (`f_questionoption_id`) REFERENCES `cms_question_option` (`f_questionoption_id`),
  CONSTRAINT `fk_cms_qoqr_qrecord` FOREIGN KEY (`f_questionrecord_id`) REFERENCES `cms_question_record` (`f_questionrecord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查问卷选项与调查问卷记录关联表';

-- ----------------------------
-- Records of cms_qoption_qrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cms_question
-- ----------------------------
DROP TABLE IF EXISTS `cms_question`;
CREATE TABLE `cms_question` (
  `f_question_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_title` varchar(150) NOT NULL COMMENT '标题',
  `f_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_begin_date` datetime DEFAULT NULL COMMENT '开始日期',
  `f_end_date` datetime DEFAULT NULL COMMENT '结束日期',
  `f_creation_date` datetime NOT NULL COMMENT '创建日期',
  `f_mode` int(11) NOT NULL DEFAULT '1' COMMENT '模式(1:独立访客,2:独立IP,3:独立用户)',
  `f_total` int(11) NOT NULL DEFAULT '0' COMMENT '总票数',
  `f_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态(0:启用,1:禁用)',
  PRIMARY KEY (`f_question_id`),
  KEY `fk_cms_question_site` (`f_site_id`),
  CONSTRAINT `fk_cms_question_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查问卷表';

-- ----------------------------
-- Records of cms_question
-- ----------------------------

-- ----------------------------
-- Table structure for cms_question_item
-- ----------------------------
DROP TABLE IF EXISTS `cms_question_item`;
CREATE TABLE `cms_question_item` (
  `f_questionitem_id` int(11) NOT NULL,
  `f_question_id` int(11) NOT NULL,
  `f_title` varchar(150) NOT NULL,
  `f_max_selected` int(11) NOT NULL DEFAULT '1' COMMENT '最多可选几项(0不限制)',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  PRIMARY KEY (`f_questionitem_id`),
  KEY `fk_cms_qitem_question` (`f_question_id`),
  CONSTRAINT `fk_cms_qitem_question` FOREIGN KEY (`f_question_id`) REFERENCES `cms_question` (`f_question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查问卷项表';

-- ----------------------------
-- Records of cms_question_item
-- ----------------------------

-- ----------------------------
-- Table structure for cms_question_option
-- ----------------------------
DROP TABLE IF EXISTS `cms_question_option`;
CREATE TABLE `cms_question_option` (
  `f_questionoption_id` int(11) NOT NULL,
  `f_questionitem_id` int(11) NOT NULL,
  `f_title` varchar(150) DEFAULT NULL COMMENT '标题',
  `f_is_input` char(1) NOT NULL DEFAULT '0' COMMENT '是否输入框',
  `f_count` int(11) NOT NULL DEFAULT '0' COMMENT '得票数',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  PRIMARY KEY (`f_questionoption_id`),
  KEY `fk_cms_qoption_qitem` (`f_questionitem_id`),
  CONSTRAINT `fk_cms_qoption_qitem` FOREIGN KEY (`f_questionitem_id`) REFERENCES `cms_question_item` (`f_questionitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查问卷选项表';

-- ----------------------------
-- Records of cms_question_option
-- ----------------------------

-- ----------------------------
-- Table structure for cms_question_record
-- ----------------------------
DROP TABLE IF EXISTS `cms_question_record`;
CREATE TABLE `cms_question_record` (
  `f_questionrecord_id` int(11) NOT NULL,
  `f_user_id` int(11) DEFAULT NULL,
  `f_question_id` int(11) NOT NULL,
  `f_date` datetime NOT NULL COMMENT '日期',
  `f_ip` varchar(100) NOT NULL COMMENT 'IP',
  `f_cookie` varchar(100) NOT NULL COMMENT 'Cookie',
  PRIMARY KEY (`f_questionrecord_id`),
  KEY `fk_cms_qrecord_question` (`f_question_id`),
  KEY `fk_cms_questionrecord_user` (`f_user_id`),
  CONSTRAINT `fk_cms_qrecord_question` FOREIGN KEY (`f_question_id`) REFERENCES `cms_question` (`f_question_id`),
  CONSTRAINT `fk_cms_questionrecord_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调查问卷记录表';

-- ----------------------------
-- Records of cms_question_record
-- ----------------------------

-- ----------------------------
-- Table structure for cms_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_role`;
CREATE TABLE `cms_role` (
  `f_role_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  `f_perms` longtext COMMENT '功能权限',
  `f_is_all_perm` char(1) NOT NULL DEFAULT '1' COMMENT '是否拥有所有功能权限',
  `f_is_all_info_perm` char(1) NOT NULL DEFAULT '1' COMMENT '是否拥有所有信息权限',
  `f_is_all_node_perm` char(1) NOT NULL DEFAULT '1' COMMENT '是否拥有所有节点权限',
  `f_is_info_final_perm` char(1) NOT NULL DEFAULT '0' COMMENT '是否拥有信息终审权限',
  `f_info_perm_type` int(11) NOT NULL DEFAULT '1' COMMENT '信息权限类型(1:所有;2:组织;3:自身)',
  PRIMARY KEY (`f_role_id`),
  KEY `fk_cms_role_site` (`f_site_id`),
  CONSTRAINT `fk_cms_role_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of cms_role
-- ----------------------------
INSERT INTO `cms_role` VALUES ('1', '1', '管理员', null, '2147483647', null, '1', '1', '1', '1', '1');
INSERT INTO `cms_role` VALUES ('3', '3', 'administrators', null, '2147483647', null, '1', '1', '1', '1', '1');
INSERT INTO `cms_role` VALUES ('4', '4', 'administrators', null, '2147483647', null, '1', '1', '1', '1', '1');
INSERT INTO `cms_role` VALUES ('5', '5', 'administrators', null, '2147483647', null, '1', '1', '1', '1', '1');
INSERT INTO `cms_role` VALUES ('6', '6', 'administrators', null, '2147483647', null, '1', '1', '1', '1', '1');
INSERT INTO `cms_role` VALUES ('7', '7', 'administrators', null, '2147483647', null, '1', '1', '1', '1', '1');
INSERT INTO `cms_role` VALUES ('8', '8', 'administrators', null, '2147483647', null, '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for cms_score_board
-- ----------------------------
DROP TABLE IF EXISTS `cms_score_board`;
CREATE TABLE `cms_score_board` (
  `f_scoreboard_id` int(11) NOT NULL,
  `f_scoreitem_id` int(11) NOT NULL COMMENT '记分项',
  `f_ftype` varchar(50) NOT NULL COMMENT '外表标识',
  `f_fid` int(11) NOT NULL COMMENT '外表ID',
  `f_votes` int(11) NOT NULL DEFAULT '0' COMMENT '投票次数',
  PRIMARY KEY (`f_scoreboard_id`),
  KEY `fk_cms_scoreboard_scoreitem` (`f_scoreitem_id`),
  CONSTRAINT `fk_cms_scoreboard_scoreitem` FOREIGN KEY (`f_scoreitem_id`) REFERENCES `cms_score_item` (`f_scoreitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计分牌表';

-- ----------------------------
-- Records of cms_score_board
-- ----------------------------
INSERT INTO `cms_score_board` VALUES ('1', '1', 'InfoScore', '97', '1');
INSERT INTO `cms_score_board` VALUES ('2', '1', 'InfoScore', '28', '1');
INSERT INTO `cms_score_board` VALUES ('3', '13', 'InfoScore', '94', '1');
INSERT INTO `cms_score_board` VALUES ('4', '11', 'InfoScore', '95', '1');
INSERT INTO `cms_score_board` VALUES ('5', '13', 'InfoScore', '93', '1');
INSERT INTO `cms_score_board` VALUES ('6', '2', 'InfoScore', '55', '1');
INSERT INTO `cms_score_board` VALUES ('7', '12', 'InfoScore', '93', '1');
INSERT INTO `cms_score_board` VALUES ('8', '10', 'InfoScore', '98', '1');
INSERT INTO `cms_score_board` VALUES ('9', '13', 'InfoScore', '97', '1');
INSERT INTO `cms_score_board` VALUES ('10', '3', 'InfoScore', '87', '1');
INSERT INTO `cms_score_board` VALUES ('11', '4', 'InfoScore', '87', '1');
INSERT INTO `cms_score_board` VALUES ('12', '5', 'InfoScore', '28', '1');

-- ----------------------------
-- Table structure for cms_score_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_score_group`;
CREATE TABLE `cms_score_group` (
  `f_scoregroup_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_number` varchar(100) DEFAULT NULL COMMENT '编码',
  `f_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  PRIMARY KEY (`f_scoregroup_id`),
  KEY `fk_cms_scoregroup_site` (`f_site_id`),
  CONSTRAINT `fk_cms_scoregroup_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计分组表';

-- ----------------------------
-- Records of cms_score_group
-- ----------------------------
INSERT INTO `cms_score_group` VALUES ('1', '1', '心情评分', 'mood', null, '0');
INSERT INTO `cms_score_group` VALUES ('2', '1', '星级评分', 'start', null, '1');

-- ----------------------------
-- Table structure for cms_score_item
-- ----------------------------
DROP TABLE IF EXISTS `cms_score_item`;
CREATE TABLE `cms_score_item` (
  `f_scoreitem_id` int(11) NOT NULL,
  `f_scoregroup_id` int(11) NOT NULL COMMENT '计分组',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_score` int(11) NOT NULL DEFAULT '1' COMMENT '分值',
  `f_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  PRIMARY KEY (`f_scoreitem_id`),
  KEY `fk_cms_scoreitem_scoregroup` (`f_scoregroup_id`),
  KEY `fk_cms_scoreitem_site` (`f_site_id`),
  CONSTRAINT `fk_cms_scoreitem_scoregroup` FOREIGN KEY (`f_scoregroup_id`) REFERENCES `cms_score_group` (`f_scoregroup_id`),
  CONSTRAINT `fk_cms_scoreitem_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计分项表';

-- ----------------------------
-- Records of cms_score_item
-- ----------------------------
INSERT INTO `cms_score_item` VALUES ('1', '1', '1', '感动', '1', '/images/mood/0.gif', '0');
INSERT INTO `cms_score_item` VALUES ('2', '1', '1', '路过', '1', '/images/mood/1.gif', '1');
INSERT INTO `cms_score_item` VALUES ('3', '1', '1', '高兴', '1', '/images/mood/2.gif', '2');
INSERT INTO `cms_score_item` VALUES ('4', '1', '1', '难过', '1', '/images/mood/3.gif', '3');
INSERT INTO `cms_score_item` VALUES ('5', '1', '1', '搞笑', '1', '/images/mood/4.gif', '4');
INSERT INTO `cms_score_item` VALUES ('6', '1', '1', '无聊', '1', '/images/mood/5.gif', '5');
INSERT INTO `cms_score_item` VALUES ('7', '1', '1', '愤怒', '1', '/images/mood/6.gif', '6');
INSERT INTO `cms_score_item` VALUES ('8', '1', '1', '同情', '1', '/images/mood/7.gif', '7');
INSERT INTO `cms_score_item` VALUES ('9', '2', '1', '一星', '1', null, '0');
INSERT INTO `cms_score_item` VALUES ('10', '2', '1', '二星', '2', null, '1');
INSERT INTO `cms_score_item` VALUES ('11', '2', '1', '三星', '3', null, '2');
INSERT INTO `cms_score_item` VALUES ('12', '2', '1', '四星', '4', null, '3');
INSERT INTO `cms_score_item` VALUES ('13', '2', '1', '五星', '5', null, '4');

-- ----------------------------
-- Table structure for cms_sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `cms_sensitive_word`;
CREATE TABLE `cms_sensitive_word` (
  `f_sensitiveword_id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL COMMENT '敏感词',
  `f_replacement` varchar(100) DEFAULT NULL COMMENT '替换词',
  `f_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态(0:启用,1:禁用)',
  PRIMARY KEY (`f_sensitiveword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='敏感词表';

-- ----------------------------
-- Records of cms_sensitive_word
-- ----------------------------

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site` (
  `f_site_id` int(11) NOT NULL,
  `f_global_id` int(11) NOT NULL COMMENT '全局',
  `f_org_id` int(11) NOT NULL COMMENT '组织',
  `f_parent_id` int(11) DEFAULT NULL COMMENT '上级站点',
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_number` varchar(100) NOT NULL COMMENT '编码',
  `f_full_name` varchar(100) DEFAULT NULL COMMENT '完整名称',
  `f_no_picture` varchar(255) NOT NULL DEFAULT '/img/no_picture.jpg' COMMENT '暂无图片',
  `f_template_theme` varchar(100) NOT NULL DEFAULT 'default' COMMENT '模板主题',
  `f_html_path` varchar(100) DEFAULT NULL COMMENT 'html路径',
  `f_domain` varchar(100) NOT NULL DEFAULT 'localhost' COMMENT '域名',
  `f_is_url_rewrite` char(1) NOT NULL DEFAULT '0' COMMENT '是否url重写',
  `f_is_identify_domain` char(1) NOT NULL DEFAULT '0' COMMENT '是否识别域名',
  `f_is_def` char(1) NOT NULL DEFAULT '0' COMMENT '是否默认站点',
  `f_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态(0:正常,1:禁用)',
  `f_tree_number` varchar(100) NOT NULL DEFAULT '0000' COMMENT '树编码',
  `f_tree_level` int(11) NOT NULL DEFAULT '0' COMMENT '树级别',
  `f_tree_max` varchar(10) NOT NULL DEFAULT '0000' COMMENT '树子节点最大编码',
  PRIMARY KEY (`f_site_id`),
  UNIQUE KEY `ak_number` (`f_number`),
  KEY `fk_cms_site_global` (`f_global_id`),
  KEY `fk_cms_site_org` (`f_org_id`),
  KEY `fk_cms_site_parent` (`f_parent_id`),
  CONSTRAINT `fk_cms_site_global` FOREIGN KEY (`f_global_id`) REFERENCES `cms_global` (`f_global_id`),
  CONSTRAINT `fk_cms_site_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`),
  CONSTRAINT `fk_cms_site_parent` FOREIGN KEY (`f_parent_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点表';

-- ----------------------------
-- Records of cms_site
-- ----------------------------
INSERT INTO `cms_site` VALUES ('1', '1', '1', null, 'Jspxcms演示站', '1', 'Jspxcms演示站', '/images/no_picture.jpg', 'bluewise', null, 'localhost', '0', '0', '1', '0', '0000', '0', '0001');
INSERT INTO `cms_site` VALUES ('3', '1', '1', null, '信诚松木', '2', null, '/img/no_picture.jpg', 'xincheng', null, '127.0.0.1', '0', '1', '0', '0', '0001', '0', '0000');
INSERT INTO `cms_site` VALUES ('4', '1', '1', null, '青土景观', '4', null, '/img/no_picture.jpg', 'qingtu', null, 'qingtu', '0', '1', '0', '0', '0002', '0', '0000');
INSERT INTO `cms_site` VALUES ('5', '1', '1', null, '设计空间', '5', null, '/img/no_picture.jpg', 'kongjian', null, 'kongjian', '0', '1', '0', '0', '0003', '0', '0000');
INSERT INTO `cms_site` VALUES ('6', '1', '1', null, '企业模板', '6', null, '/img/no_picture.jpg', 'qiye', null, 'qiye', '0', '0', '0', '0', '0004', '0', '0000');
INSERT INTO `cms_site` VALUES ('7', '1', '1', null, '模版大全', '7', '模板大全', '/img/no_picture.jpg', 'muban', null, 'muban', '0', '1', '1', '0', '0005', '0', '0000');
INSERT INTO `cms_site` VALUES ('8', '1', '1', null, '模板商城', '8', '模板商城', '/img/no_picture.jpg', 'muban', null, 'mshop', '0', '1', '1', '0', '0006', '0', '0000');

-- ----------------------------
-- Table structure for cms_site_clob
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_clob`;
CREATE TABLE `cms_site_clob` (
  `f_site_id` int(11) NOT NULL,
  `f_key` varchar(50) NOT NULL COMMENT '键',
  `f_value` longtext COMMENT '值',
  KEY `fk_cms_siteclob_site` (`f_site_id`),
  CONSTRAINT `fk_cms_siteclob_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点大字段表';

-- ----------------------------
-- Records of cms_site_clob
-- ----------------------------

-- ----------------------------
-- Table structure for cms_site_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_custom`;
CREATE TABLE `cms_site_custom` (
  `f_site_id` int(11) NOT NULL,
  `f_key` varchar(50) NOT NULL COMMENT '键',
  `f_value` varchar(2000) DEFAULT NULL COMMENT '值',
  KEY `fk_cms_sitecustom_site` (`f_site_id`),
  CONSTRAINT `fk_cms_sitecustom_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点自定义表';

-- ----------------------------
-- Records of cms_site_custom
-- ----------------------------
INSERT INTO `cms_site_custom` VALUES ('1', 'company', '南昌蓝智科技有限公司');
INSERT INTO `cms_site_custom` VALUES ('1', 'icp', '赣ICP备12001124号');

-- ----------------------------
-- Table structure for cms_special
-- ----------------------------
DROP TABLE IF EXISTS `cms_special`;
CREATE TABLE `cms_special` (
  `f_special_id` int(11) NOT NULL,
  `f_creator_id` int(11) NOT NULL COMMENT '创建者',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_speccate_id` int(11) NOT NULL COMMENT '专题类别',
  `f_creation_date` datetime NOT NULL COMMENT '创建日期',
  `f_title` varchar(150) NOT NULL COMMENT '标题',
  `f_meta_keywords` varchar(150) DEFAULT NULL COMMENT '关键字',
  `f_meta_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_small_image` varchar(255) DEFAULT NULL COMMENT '小图',
  `f_large_image` varchar(255) DEFAULT NULL COMMENT '大图',
  `f_video` varchar(255) DEFAULT NULL COMMENT '视频',
  `f_refers` int(11) NOT NULL DEFAULT '0' COMMENT '信息数量',
  `f_views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览总数',
  `f_is_with_image` char(1) NOT NULL DEFAULT '0' COMMENT '是否有图片',
  `f_is_recommend` char(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`f_special_id`),
  KEY `fk_cms_special_creator` (`f_creator_id`),
  KEY `fk_cms_special_site` (`f_site_id`),
  KEY `fk_cms_special_speccate` (`f_speccate_id`),
  CONSTRAINT `fk_cms_special_creator` FOREIGN KEY (`f_creator_id`) REFERENCES `cms_user` (`f_user_id`),
  CONSTRAINT `fk_cms_special_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`),
  CONSTRAINT `fk_cms_special_speccate` FOREIGN KEY (`f_speccate_id`) REFERENCES `cms_special_category` (`f_speccate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题表';

-- ----------------------------
-- Records of cms_special
-- ----------------------------
INSERT INTO `cms_special` VALUES ('1', '1', '1', '1', '2013-02-28 17:10:02', '论道中国', null, null, 'http://demo.jspxcms.com/uploads/1/image/public/201303/20130318030529_8vfvns.jpg', null, null, '3', '0', '0', '0');
INSERT INTO `cms_special` VALUES ('2', '1', '1', '1', '2013-02-27 17:10:53', '问题与建议', null, null, null, null, null, '3', '0', '0', '0');
INSERT INTO `cms_special` VALUES ('8', '1', '1', '1', '2013-03-19 02:57:45', '食品安全报告', null, null, null, null, null, '0', '0', '0', '0');
INSERT INTO `cms_special` VALUES ('9', '1', '1', '2', '2013-03-19 02:58:18', '名家专论', null, null, null, null, null, '0', '0', '0', '0');
INSERT INTO `cms_special` VALUES ('10', '1', '1', '2', '2013-03-19 02:58:35', '资本主义危机纵横谈', null, null, null, null, null, '0', '0', '0', '0');
INSERT INTO `cms_special` VALUES ('11', '1', '1', '3', '2013-03-19 03:00:11', '热钱透视', null, null, null, null, null, '0', '0', '0', '0');
INSERT INTO `cms_special` VALUES ('12', '1', '1', '3', '2013-03-19 03:00:39', '能源观察', null, null, null, null, null, '0', '0', '0', '0');
INSERT INTO `cms_special` VALUES ('13', '1', '1', '4', '2013-03-19 03:01:02', '核武透明度', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('14', '1', '3', '5', '2015-03-28 18:30:45', '知识库右侧列表', null, null, null, null, null, '2', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('15', '1', '8', '6', '2015-04-24 12:14:05', '地产/金融/投资', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('16', '1', '8', '6', '2015-04-24 12:14:20', '科技/IT电子', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('17', '1', '8', '6', '2015-04-24 12:15:08', '医药/健康产业', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('18', '1', '8', '6', '2015-04-24 12:15:15', '制造/工业产品', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('19', '1', '8', '6', '2015-04-24 12:15:23', '传媒/广告/公关策划', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('20', '1', '8', '6', '2015-04-24 12:15:29', '时尚/生活/娱乐', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('21', '1', '8', '6', '2015-04-24 12:15:34', '商业贸易/物流', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('22', '1', '8', '6', '2015-04-24 12:15:40', '教育/培训/咨询', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('23', '1', '8', '6', '2015-04-24 12:15:46', '服饰/化妆/美容', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('24', '1', '8', '6', '2015-04-24 12:15:53', '食品/餐饮/酒类', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('25', '1', '8', '6', '2015-04-24 12:15:59', '服务行业', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('26', '1', '8', '6', '2015-04-24 12:16:05', '装饰/设计', null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `cms_special` VALUES ('27', '1', '8', '6', '2015-04-24 12:16:11', '事业单位/组织机构', null, null, null, null, null, '0', '0', '0', '1');

-- ----------------------------
-- Table structure for cms_special_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_category`;
CREATE TABLE `cms_special_category` (
  `f_speccate_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(50) NOT NULL COMMENT '名称',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  `f_views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览总数',
  `f_meta_keywords` varchar(150) DEFAULT NULL COMMENT '关键字',
  `f_meta_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_creation_date` datetime NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`f_speccate_id`),
  KEY `fk_cms_speccategory_site` (`f_site_id`),
  CONSTRAINT `fk_cms_speccategory_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题类别表';

-- ----------------------------
-- Records of cms_special_category
-- ----------------------------
INSERT INTO `cms_special_category` VALUES ('1', '1', '中国观点', '2147483647', '0', null, null, '2013-02-28 17:09:49');
INSERT INTO `cms_special_category` VALUES ('2', '1', '国际观点', '2147483647', '0', null, null, '2013-03-18 02:22:45');
INSERT INTO `cms_special_category` VALUES ('3', '1', '财经观点', '2147483647', '0', null, null, '2013-03-18 02:58:00');
INSERT INTO `cms_special_category` VALUES ('4', '1', '军事观点', '2147483647', '0', null, null, '2013-03-18 02:58:52');
INSERT INTO `cms_special_category` VALUES ('5', '3', '常用更多', '2147483647', '0', null, null, '2015-03-28 18:30:10');
INSERT INTO `cms_special_category` VALUES ('6', '8', '行业分类', '2147483647', '0', null, null, '2015-04-24 12:13:26');

-- ----------------------------
-- Table structure for cms_special_custom
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_custom`;
CREATE TABLE `cms_special_custom` (
  `f_special_id` int(11) NOT NULL,
  `f_name` varchar(50) DEFAULT NULL COMMENT '键',
  `f_value` varchar(2000) DEFAULT NULL COMMENT '值',
  KEY `fk_cms_specialcustom_special` (`f_special_id`),
  CONSTRAINT `fk_cms_specialcustom_special` FOREIGN KEY (`f_special_id`) REFERENCES `cms_special` (`f_special_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题自定义表';

-- ----------------------------
-- Records of cms_special_custom
-- ----------------------------

-- ----------------------------
-- Table structure for cms_tag
-- ----------------------------
DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE `cms_tag` (
  `f_tag_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(50) NOT NULL COMMENT '名称',
  `f_creation_date` datetime NOT NULL COMMENT '创建日期',
  `f_refers` int(11) NOT NULL DEFAULT '0' COMMENT '信息数量',
  PRIMARY KEY (`f_tag_id`),
  KEY `fk_cms_tag_site` (`f_site_id`),
  CONSTRAINT `fk_cms_tag_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TAG表';

-- ----------------------------
-- Records of cms_tag
-- ----------------------------
INSERT INTO `cms_tag` VALUES ('56', '1', '中国', '2013-03-11 12:00:12', '3');
INSERT INTO `cms_tag` VALUES ('57', '1', '美国', '2013-03-11 12:00:12', '1');
INSERT INTO `cms_tag` VALUES ('58', '1', '中兴', '2013-03-19 02:08:21', '1');
INSERT INTO `cms_tag` VALUES ('59', '1', '蒙古国', '2013-03-19 02:08:21', '1');
INSERT INTO `cms_tag` VALUES ('60', '1', '反贪局', '2013-03-19 02:08:21', '1');
INSERT INTO `cms_tag` VALUES ('61', '1', '逮捕', '2013-03-19 02:08:21', '1');
INSERT INTO `cms_tag` VALUES ('62', '1', '金融危机', '2013-03-19 02:08:58', '1');
INSERT INTO `cms_tag` VALUES ('63', '1', '苏联', '2013-03-19 02:09:23', '1');
INSERT INTO `cms_tag` VALUES ('64', '1', '军火', '2013-03-19 02:09:23', '1');
INSERT INTO `cms_tag` VALUES ('65', '1', '贿赂', '2013-03-19 02:09:23', '1');
INSERT INTO `cms_tag` VALUES ('66', '1', '罗斯福', '2013-03-19 02:09:23', '1');
INSERT INTO `cms_tag` VALUES ('67', '1', '可转债', '2013-03-19 02:10:00', '1');
INSERT INTO `cms_tag` VALUES ('68', '1', '违约', '2013-03-19 02:10:00', '1');
INSERT INTO `cms_tag` VALUES ('69', '1', '首家', '2013-03-19 02:10:00', '1');
INSERT INTO `cms_tag` VALUES ('70', '1', '公司债', '2013-03-19 02:10:00', '1');
INSERT INTO `cms_tag` VALUES ('71', '1', '英国', '2013-03-19 02:27:44', '1');
INSERT INTO `cms_tag` VALUES ('72', '1', '常规武器', '2013-03-19 02:27:44', '1');
INSERT INTO `cms_tag` VALUES ('73', '1', '出口国', '2013-03-19 02:27:44', '1');
INSERT INTO `cms_tag` VALUES ('74', '3', '222', '2015-03-26 21:18:44', '1');
INSERT INTO `cms_tag` VALUES ('75', '7', '热销', '2015-04-21 20:42:55', '0');
INSERT INTO `cms_tag` VALUES ('76', '7', '最新', '2015-04-21 20:43:38', '0');

-- ----------------------------
-- Table structure for cms_task
-- ----------------------------
DROP TABLE IF EXISTS `cms_task`;
CREATE TABLE `cms_task` (
  `f_task_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(150) NOT NULL COMMENT '名称',
  `f_description` longtext COMMENT '描述',
  `f_begin_time` datetime NOT NULL COMMENT '开始时间',
  `f_end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `f_total` int(11) NOT NULL DEFAULT '0' COMMENT '总完成数量',
  `f_type` int(11) NOT NULL DEFAULT '1' COMMENT '类型(1:节点HTML生成,2:信息HTML生成,3:全文索引生成)',
  `f_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态(0:运行中,1:完成,2:中止,3:停止)',
  PRIMARY KEY (`f_task_id`),
  KEY `fk_cms_task_site` (`f_site_id`),
  KEY `fk_cms_task_user` (`f_user_id`),
  CONSTRAINT `fk_cms_task_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`),
  CONSTRAINT `fk_cms_task_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';

-- ----------------------------
-- Records of cms_task
-- ----------------------------
INSERT INTO `cms_task` VALUES ('1', '1', '1', 'Node: ALL', null, '2014-02-21 16:02:37', '2014-02-21 16:02:45', '52', '3', '1');
INSERT INTO `cms_task` VALUES ('2', '1', '1', 'Site: Jspxcms演示站', null, '2014-02-24 09:32:12', '2014-02-24 09:32:12', '0', '1', '1');
INSERT INTO `cms_task` VALUES ('3', '1', '1', 'Node: ALL', null, '2014-02-24 09:35:45', '2014-02-24 09:35:52', '52', '3', '1');
INSERT INTO `cms_task` VALUES ('4', '1', '1', 'Node: ALL', null, '2014-02-24 10:03:10', '2014-02-24 10:03:21', '52', '3', '1');
INSERT INTO `cms_task` VALUES ('5', '1', '1', 'Node: ALL', null, '2014-03-18 16:23:55', '2014-03-18 16:24:05', '54', '3', '1');
INSERT INTO `cms_task` VALUES ('6', '1', '1', 'Node: ALL', null, '2014-03-18 16:28:36', '2014-03-18 16:28:44', '50', '3', '1');
INSERT INTO `cms_task` VALUES ('7', '1', '3', 'Site: 信诚松木', null, '2015-03-28 12:52:55', '2015-03-28 12:52:56', '0', '1', '1');
INSERT INTO `cms_task` VALUES ('8', '1', '3', 'Site: 信诚松木', null, '2015-03-28 15:39:16', '2015-03-28 15:39:16', '0', '1', '1');
INSERT INTO `cms_task` VALUES ('9', '1', '3', 'Site: 信诚松木', null, '2015-03-28 15:44:54', '2015-03-28 15:44:54', '0', '1', '1');
INSERT INTO `cms_task` VALUES ('10', '1', '3', 'Site: 信诚松木', null, '2015-03-28 15:44:55', '2015-03-28 15:44:55', '0', '1', '1');
INSERT INTO `cms_task` VALUES ('11', '1', '3', 'Site: 信诚松木', null, '2015-03-28 22:14:05', '2015-03-28 22:14:05', '0', '1', '1');
INSERT INTO `cms_task` VALUES ('12', '1', '1', 'Site: Jspxcms演示站', null, '2015-04-06 13:02:10', '2015-04-06 13:02:11', '8', '1', '2');
INSERT INTO `cms_task` VALUES ('13', '1', '1', 'Node: 首页 - 新闻 - 社会', null, '2015-04-06 13:02:28', '2015-04-06 13:02:28', '1', '1', '1');
INSERT INTO `cms_task` VALUES ('14', '1', '1', 'Node: 首页 - 新闻 - 社会', null, '2015-04-06 13:02:51', '2015-04-06 13:02:51', '4', '2', '1');
INSERT INTO `cms_task` VALUES ('15', '1', '1', 'Site: Jspxcms演示站', null, '2015-04-06 13:04:57', '2015-04-06 13:04:58', '8', '1', '2');
INSERT INTO `cms_task` VALUES ('16', '1', '1', 'Node: 首页 - 新闻', null, '2015-04-06 13:05:01', '2015-04-06 13:05:01', '4', '1', '1');
INSERT INTO `cms_task` VALUES ('17', '1', '1', 'Node: 首页 - 新闻', null, '2015-04-06 13:05:05', '2015-04-06 13:05:05', '12', '2', '1');
INSERT INTO `cms_task` VALUES ('18', '1', '1', 'Site: Jspxcms演示站', null, '2015-04-06 13:07:17', '2015-04-06 13:07:17', '8', '1', '2');
INSERT INTO `cms_task` VALUES ('19', '1', '1', 'Node: 首页', null, '2015-04-06 13:07:21', '2015-04-06 13:07:22', '8', '1', '1');
INSERT INTO `cms_task` VALUES ('20', '1', '1', 'Node: 首页', null, '2015-04-06 13:07:24', '2015-04-06 13:07:25', '0', '2', '2');
INSERT INTO `cms_task` VALUES ('21', '1', '1', 'Node: 首页 - 新闻', null, '2015-04-06 13:15:06', '2015-04-06 13:15:06', '4', '1', '1');
INSERT INTO `cms_task` VALUES ('22', '1', '1', 'Node: 首页 - 新闻', null, '2015-04-06 13:15:09', '2015-04-06 13:15:10', '12', '2', '1');
INSERT INTO `cms_task` VALUES ('23', '1', '1', 'Site: Jspxcms演示站', null, '2015-04-06 13:15:17', '2015-04-06 13:15:17', '8', '1', '2');
INSERT INTO `cms_task` VALUES ('24', '1', '1', 'Node: ALL', null, '2015-04-06 13:19:36', '2015-04-06 13:19:36', '8', '1', '1');
INSERT INTO `cms_task` VALUES ('25', '1', '1', 'Node: ALL', null, '2015-04-06 13:19:36', '2015-04-06 13:19:37', '0', '2', '2');
INSERT INTO `cms_task` VALUES ('26', '1', '1', 'Node: 首页 - 新闻', null, '2015-04-06 13:19:41', '2015-04-06 13:19:41', '4', '1', '1');
INSERT INTO `cms_task` VALUES ('27', '1', '1', 'Node: 首页 - 新闻', null, '2015-04-06 13:19:44', '2015-04-06 13:19:45', '12', '2', '1');
INSERT INTO `cms_task` VALUES ('28', '1', '1', 'Site: Jspxcms演示站', null, '2015-04-06 13:21:04', '2015-04-06 13:21:04', '7', '1', '2');
INSERT INTO `cms_task` VALUES ('29', '1', '1', 'Site: Jspxcms演示站', null, '2015-04-06 13:21:20', '2015-04-06 13:21:20', '5', '1', '1');
INSERT INTO `cms_task` VALUES ('30', '1', '1', 'Node: ALL', null, '2015-04-06 13:21:42', '2015-04-06 13:21:42', '1', '1', '1');
INSERT INTO `cms_task` VALUES ('31', '1', '1', 'Site: Jspxcms演示站', null, '2015-04-06 13:22:11', '2015-04-06 13:22:11', '0', '1', '1');
INSERT INTO `cms_task` VALUES ('32', '1', '1', 'Node: 首页 - 新闻', null, '2015-04-06 13:24:40', '2015-04-06 13:24:40', '1', '1', '1');
INSERT INTO `cms_task` VALUES ('33', '1', '1', 'Node: 首页 - 新闻', null, '2015-04-06 13:24:43', '2015-04-06 13:24:43', '0', '2', '1');
INSERT INTO `cms_task` VALUES ('34', '1', '1', 'Node: 首页 - 新闻', null, '2015-04-06 13:26:22', '2015-04-06 13:26:22', '2', '1', '1');
INSERT INTO `cms_task` VALUES ('35', '1', '1', 'Node: 首页 - 新闻', null, '2015-04-06 13:26:25', '2015-04-06 13:26:25', '4', '2', '1');
INSERT INTO `cms_task` VALUES ('36', '1', '1', 'Node: ALL', null, '2015-04-06 13:34:15', '2015-04-06 13:34:15', '2', '1', '1');
INSERT INTO `cms_task` VALUES ('37', '1', '1', 'Node: ALL', null, '2015-04-06 13:34:16', '2015-04-06 13:34:16', '4', '2', '1');
INSERT INTO `cms_task` VALUES ('38', '1', '1', 'Site: Jspxcms演示站', null, '2015-04-06 14:15:06', '2015-04-06 14:15:07', '30', '1', '1');
INSERT INTO `cms_task` VALUES ('39', '1', '7', 'Site: 模版大全', null, '2015-05-17 11:31:41', '2015-05-17 11:31:42', '5', '1', '2');
INSERT INTO `cms_task` VALUES ('40', '1', '7', 'Site: 模版大全', null, '2015-05-17 13:31:32', '2015-05-17 13:31:33', '5', '1', '2');
INSERT INTO `cms_task` VALUES ('41', '1', '7', 'Site: 模版大全', null, '2015-05-17 13:31:52', '2015-05-17 13:31:52', '5', '1', '2');
INSERT INTO `cms_task` VALUES ('42', '1', '7', 'Site: 模版大全', null, '2015-05-17 13:32:44', '2015-05-17 13:32:44', '5', '1', '2');
INSERT INTO `cms_task` VALUES ('43', '1', '7', 'Site: 模版大全', null, '2015-05-17 13:33:05', '2015-05-17 13:33:05', '5', '1', '2');
INSERT INTO `cms_task` VALUES ('44', '1', '7', 'Site: 模版大全', null, '2015-05-17 13:33:50', '2015-05-17 13:33:51', '11', '1', '1');
INSERT INTO `cms_task` VALUES ('45', '1', '7', 'Site: 模版大全', null, '2015-05-17 13:34:05', '2015-05-17 13:34:05', '5', '1', '2');
INSERT INTO `cms_task` VALUES ('46', '1', '7', 'Site: 模版大全', null, '2015-05-17 13:43:43', '2015-05-17 13:43:43', '11', '1', '1');
INSERT INTO `cms_task` VALUES ('47', '1', '7', 'Site: 模版大全', null, '2015-05-17 13:44:53', '2015-05-17 13:44:53', '11', '1', '1');
INSERT INTO `cms_task` VALUES ('48', '1', '7', 'Site: 模版大全', null, '2015-05-17 13:47:22', '2015-05-17 13:47:22', '11', '1', '1');
INSERT INTO `cms_task` VALUES ('49', '1', '7', 'Site: 模版大全', null, '2015-05-17 13:53:21', '2015-05-17 13:53:22', '11', '1', '1');
INSERT INTO `cms_task` VALUES ('50', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 14:00:18', '2015-05-17 14:00:20', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('51', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 14:22:29', '2015-05-17 14:22:30', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('52', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 14:43:37', '2015-05-17 14:43:39', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('53', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 14:45:32', '2015-05-17 14:45:33', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('54', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 14:46:55', '2015-05-17 14:46:56', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('55', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 14:52:34', null, '0', '1', '0');
INSERT INTO `cms_task` VALUES ('56', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 14:55:14', '2015-05-17 14:55:17', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('57', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 14:56:03', '2015-05-17 14:56:05', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('58', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 14:56:54', '2015-05-17 14:57:03', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('59', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:00:09', '2015-05-17 15:00:15', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('60', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:02:56', '2015-05-17 15:02:57', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('61', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:21:16', '2015-05-17 15:21:17', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('62', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:22:33', '2015-05-17 15:22:36', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('63', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:29:44', '2015-05-17 15:29:46', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('64', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:33:31', '2015-05-17 15:33:32', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('65', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:37:53', '2015-05-17 15:37:54', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('66', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:41:26', '2015-05-17 15:41:28', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('67', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:44:47', '2015-05-17 15:44:48', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('68', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:44:51', '2015-05-17 15:44:52', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('69', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:46:17', '2015-05-17 15:46:18', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('70', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:46:37', '2015-05-17 15:46:38', '13', '1', '2');
INSERT INTO `cms_task` VALUES ('71', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:53:18', '2015-05-17 15:53:19', '12', '1', '2');
INSERT INTO `cms_task` VALUES ('72', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:53:57', '2015-05-17 15:53:58', '12', '1', '2');
INSERT INTO `cms_task` VALUES ('73', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:55:02', '2015-05-17 15:55:03', '11', '1', '2');
INSERT INTO `cms_task` VALUES ('74', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 15:55:43', '2015-05-17 15:55:44', '10', '1', '2');
INSERT INTO `cms_task` VALUES ('75', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 16:01:24', '2015-05-17 16:01:25', '10', '1', '2');
INSERT INTO `cms_task` VALUES ('76', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 16:02:07', '2015-05-17 16:02:07', '10', '1', '2');
INSERT INTO `cms_task` VALUES ('77', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 16:40:37', '2015-05-17 16:40:38', '10', '1', '2');
INSERT INTO `cms_task` VALUES ('78', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 16:41:45', '2015-05-17 16:41:48', '10', '1', '2');
INSERT INTO `cms_task` VALUES ('79', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 20:56:45', '2015-05-17 20:56:47', '10', '1', '2');
INSERT INTO `cms_task` VALUES ('80', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 20:58:02', '2015-05-17 20:58:03', '10', '1', '2');
INSERT INTO `cms_task` VALUES ('81', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 21:42:34', '2015-05-17 21:42:37', '10', '1', '2');
INSERT INTO `cms_task` VALUES ('82', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 21:43:49', '2015-05-17 21:43:50', '10', '1', '2');
INSERT INTO `cms_task` VALUES ('83', '1', '1', 'Site: Jspxcms演示站', null, '2015-05-17 21:44:54', '2015-05-17 21:44:55', '10', '1', '2');
INSERT INTO `cms_task` VALUES ('84', '1', '7', 'Site: 模版大全', null, '2015-05-17 21:46:52', '2015-05-17 21:46:52', '11', '1', '1');
INSERT INTO `cms_task` VALUES ('85', '1', '7', 'Site: 模版大全', null, '2015-05-17 21:48:39', '2015-05-17 21:48:40', '20', '1', '1');

-- ----------------------------
-- Table structure for cms_user
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user` (
  `f_user_id` int(11) NOT NULL,
  `f_org_id` int(11) NOT NULL COMMENT '组织',
  `f_membergroup_id` int(11) NOT NULL COMMENT '会员组',
  `f_username` varchar(50) NOT NULL COMMENT '用户名',
  `f_password` varchar(128) DEFAULT NULL COMMENT '密码',
  `f_salt` varchar(32) DEFAULT NULL COMMENT '加密混淆码',
  `f_email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `f_mobile` varchar(100) DEFAULT NULL COMMENT '手机',
  `f_real_name` varchar(100) DEFAULT NULL COMMENT '用户实名',
  `f_gender` char(1) DEFAULT NULL COMMENT '性别',
  `f_birth_date` datetime DEFAULT NULL COMMENT '出生年月',
  `f_validation_type` varchar(50) DEFAULT NULL COMMENT '验证类型(用户激活,重置密码,邮箱激活)',
  `f_validation_key` varchar(100) DEFAULT NULL COMMENT '验证KEY',
  `f_rank` int(11) NOT NULL DEFAULT '999' COMMENT '等级',
  `f_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型(0:会员,1:管理员)',
  `f_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态(0:正常,1:锁定,2:待验证)',
  PRIMARY KEY (`f_user_id`),
  UNIQUE KEY `ak_username` (`f_username`),
  KEY `fk_cms_user_membergroup` (`f_membergroup_id`),
  KEY `fk_cms_user_org` (`f_org_id`),
  CONSTRAINT `fk_cms_user_membergroup` FOREIGN KEY (`f_membergroup_id`) REFERENCES `cms_member_group` (`f_membergroup_id`),
  CONSTRAINT `fk_cms_user_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES ('0', '1', '1', 'anonymous', null, null, 'atarm@163.com', null, null, 'M', null, null, null, '1', '1', '1');
INSERT INTO `cms_user` VALUES ('1', '1', '1', 'admin', '2d8e591a5b9c7d2fcda30db6e33b52adc60dca43', '94047fb78c658cbc', null, null, null, null, null, null, null, '0', '1', '0');

-- ----------------------------
-- Table structure for cms_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_detail`;
CREATE TABLE `cms_user_detail` (
  `f_user_id` int(11) NOT NULL,
  `f_validation_date` datetime DEFAULT NULL COMMENT '验证生成时间',
  `f_validation_value` varchar(255) DEFAULT NULL COMMENT '验证值',
  `f_login_error_date` datetime DEFAULT NULL COMMENT '登录错误时间',
  `f_login_error_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `f_prev_login_date` datetime DEFAULT NULL COMMENT '上次登录日期',
  `f_prev_login_ip` varchar(100) DEFAULT NULL COMMENT '上次登录IP',
  `f_last_login_date` datetime DEFAULT NULL COMMENT '最后登录日期',
  `f_last_login_ip` varchar(100) DEFAULT NULL COMMENT '最后登录IP',
  `f_creation_date` datetime NOT NULL COMMENT '加入日期',
  `f_creation_ip` varchar(100) NOT NULL COMMENT '加入IP',
  `f_logins` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `f_avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `f_bio` varchar(255) DEFAULT NULL COMMENT '自我介绍',
  `f_come_from` varchar(100) DEFAULT NULL COMMENT '来自',
  `f_qq` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `f_msn` varchar(100) DEFAULT NULL COMMENT 'MSN',
  `f_weixin` varchar(100) DEFAULT NULL COMMENT '微信',
  PRIMARY KEY (`f_user_id`),
  CONSTRAINT `fk_cms_userdetail_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详细信息表';

-- ----------------------------
-- Records of cms_user_detail
-- ----------------------------
INSERT INTO `cms_user_detail` VALUES ('0', null, null, null, '0', null, null, null, null, '2013-03-09 22:18:56', '127.0.0.1', '0', null, null, null, '22807465', null, null);
INSERT INTO `cms_user_detail` VALUES ('1', null, null, null, '0', '2015-05-17 15:22:29', '127.0.0.1', '2015-05-17 21:42:29', '127.0.0.1', '2013-02-21 20:59:27', '127.0.0.1', '304', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for cms_user_membergroup
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_membergroup`;
CREATE TABLE `cms_user_membergroup` (
  `f_usermgroup_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL,
  `f_membergroup_id` int(11) NOT NULL,
  `f_group_index` int(11) NOT NULL DEFAULT '0' COMMENT '会员组排列顺序',
  PRIMARY KEY (`f_usermgroup_id`),
  KEY `fk_cms_usermgroup_mgroup` (`f_membergroup_id`),
  KEY `fk_cms_usermgroup_user` (`f_user_id`),
  CONSTRAINT `fk_cms_usermgroup_mgroup` FOREIGN KEY (`f_membergroup_id`) REFERENCES `cms_member_group` (`f_membergroup_id`),
  CONSTRAINT `fk_cms_usermgroup_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与会员组关联表';

-- ----------------------------
-- Records of cms_user_membergroup
-- ----------------------------
INSERT INTO `cms_user_membergroup` VALUES ('2', '1', '1', '0');
INSERT INTO `cms_user_membergroup` VALUES ('6', '0', '1', '0');

-- ----------------------------
-- Table structure for cms_user_org
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_org`;
CREATE TABLE `cms_user_org` (
  `f_userorg_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL,
  `f_org_id` int(11) NOT NULL,
  `f_org_index` int(11) NOT NULL DEFAULT '0' COMMENT '组织顺序',
  PRIMARY KEY (`f_userorg_id`),
  KEY `fk_cms_userorg_org` (`f_org_id`),
  KEY `fk_cms_userorg_user` (`f_user_id`),
  CONSTRAINT `fk_cms_userorg_org` FOREIGN KEY (`f_org_id`) REFERENCES `cms_org` (`f_org_id`),
  CONSTRAINT `fk_cms_userorg_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与组织关联表';

-- ----------------------------
-- Records of cms_user_org
-- ----------------------------
INSERT INTO `cms_user_org` VALUES ('2', '1', '1', '0');
INSERT INTO `cms_user_org` VALUES ('6', '0', '1', '0');

-- ----------------------------
-- Table structure for cms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_role`;
CREATE TABLE `cms_user_role` (
  `f_userrole_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL,
  `f_role_id` int(11) NOT NULL,
  `f_role_index` int(11) NOT NULL DEFAULT '0' COMMENT '角色顺序',
  PRIMARY KEY (`f_userrole_id`),
  KEY `fk_cms_userrole_role` (`f_role_id`),
  KEY `fk_cms_userrole_user` (`f_user_id`),
  CONSTRAINT `fk_cms_userrole_role` FOREIGN KEY (`f_role_id`) REFERENCES `cms_role` (`f_role_id`),
  CONSTRAINT `fk_cms_userrole_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色关联表';

-- ----------------------------
-- Records of cms_user_role
-- ----------------------------
INSERT INTO `cms_user_role` VALUES ('1', '1', '1', '0');
INSERT INTO `cms_user_role` VALUES ('2', '1', '3', '0');
INSERT INTO `cms_user_role` VALUES ('3', '1', '4', '0');
INSERT INTO `cms_user_role` VALUES ('4', '1', '5', '0');
INSERT INTO `cms_user_role` VALUES ('5', '1', '6', '0');
INSERT INTO `cms_user_role` VALUES ('6', '1', '7', '0');
INSERT INTO `cms_user_role` VALUES ('7', '1', '8', '0');

-- ----------------------------
-- Table structure for cms_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_visit_log`;
CREATE TABLE `cms_visit_log` (
  `f_visitlog_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_url` varchar(255) NOT NULL COMMENT '页面URL',
  `f_referrer` varchar(255) DEFAULT NULL COMMENT '来源URL',
  `f_ip` varchar(100) DEFAULT NULL COMMENT 'IP地址',
  `f_ip_date` varchar(100) DEFAULT NULL COMMENT 'IP地址+日期',
  `f_cookie` varchar(100) DEFAULT NULL COMMENT 'COOKIE值',
  `f_cookie_date` varchar(100) DEFAULT NULL COMMENT 'COOKIE值+日期',
  `f_date` char(10) NOT NULL COMMENT '日期（字符串格式）',
  `f_time` datetime NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`f_visitlog_id`),
  KEY `fk_cms_visitlog_site` (`f_site_id`),
  CONSTRAINT `fk_cms_visitlog_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问日志表';

-- ----------------------------
-- Records of cms_visit_log
-- ----------------------------
INSERT INTO `cms_visit_log` VALUES ('1', '1', 'http://localhost:8080/', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 12:15:50');
INSERT INTO `cms_visit_log` VALUES ('2', '1', 'http://localhost:8080/', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:37:57');
INSERT INTO `cms_visit_log` VALUES ('3', '1', 'http://localhost:8080/', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:38:15');
INSERT INTO `cms_visit_log` VALUES ('4', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:38:16');
INSERT INTO `cms_visit_log` VALUES ('5', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:38:20');
INSERT INTO `cms_visit_log` VALUES ('6', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/node/48.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:38:39');
INSERT INTO `cms_visit_log` VALUES ('7', '1', 'http://localhost:8080/node/42.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:40:10');
INSERT INTO `cms_visit_log` VALUES ('8', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:44:29');
INSERT INTO `cms_visit_log` VALUES ('9', '1', 'http://localhost:8080/info/71.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:44:34');
INSERT INTO `cms_visit_log` VALUES ('10', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:55:48');
INSERT INTO `cms_visit_log` VALUES ('11', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:55:50');
INSERT INTO `cms_visit_log` VALUES ('12', '1', 'http://localhost:8080/info/71.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:55:53');
INSERT INTO `cms_visit_log` VALUES ('13', '1', 'http://localhost:8080/info/71.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:55:57');
INSERT INTO `cms_visit_log` VALUES ('14', '1', 'http://localhost:8080/info/35.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:56:06');
INSERT INTO `cms_visit_log` VALUES ('15', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:57:43');
INSERT INTO `cms_visit_log` VALUES ('16', '1', 'http://localhost:8080/node/39.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:57:46');
INSERT INTO `cms_visit_log` VALUES ('17', '1', 'http://localhost:8080/node/52.jspx', 'http://localhost:8080/node/39.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 15:57:48');
INSERT INTO `cms_visit_log` VALUES ('18', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/info/97.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 16:02:53');
INSERT INTO `cms_visit_log` VALUES ('19', '1', 'http://localhost:8080/info/28.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 16:02:56');
INSERT INTO `cms_visit_log` VALUES ('20', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/node/52.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-21', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-21', '2014-02-21', '2014-02-21 16:12:47');
INSERT INTO `cms_visit_log` VALUES ('21', '1', 'http://localhost:8080/', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 11:58:02');
INSERT INTO `cms_visit_log` VALUES ('22', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:01:34');
INSERT INTO `cms_visit_log` VALUES ('23', '1', 'http://localhost:8080/node/42.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:04:16');
INSERT INTO `cms_visit_log` VALUES ('24', '1', 'http://localhost:8080/info/28.jspx', 'http://localhost:8080/cmscp/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:04:56');
INSERT INTO `cms_visit_log` VALUES ('25', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:05:49');
INSERT INTO `cms_visit_log` VALUES ('26', '1', 'http://localhost:8080/info/28.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:05:51');
INSERT INTO `cms_visit_log` VALUES ('27', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:06:04');
INSERT INTO `cms_visit_log` VALUES ('28', '1', 'http://localhost:8080/', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:06:23');
INSERT INTO `cms_visit_log` VALUES ('29', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:06:25');
INSERT INTO `cms_visit_log` VALUES ('30', '1', 'http://localhost:8080/', 'http://localhost:8080/info/79.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:11:42');
INSERT INTO `cms_visit_log` VALUES ('31', '1', 'http://localhost:8080/', 'http://localhost:8080/login.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:11:48');
INSERT INTO `cms_visit_log` VALUES ('32', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:11:50');
INSERT INTO `cms_visit_log` VALUES ('33', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/login.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-22', '2014-02-22', '2014-02-22 12:12:03');
INSERT INTO `cms_visit_log` VALUES ('34', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/login.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-22', '2014-02-22', '2014-02-22 12:12:06');
INSERT INTO `cms_visit_log` VALUES ('35', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/login.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-22', '2014-02-22', '2014-02-22 12:12:07');
INSERT INTO `cms_visit_log` VALUES ('36', '1', 'http://localhost:8080/', 'http://localhost:8080/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:25:00');
INSERT INTO `cms_visit_log` VALUES ('37', '1', 'http://localhost:8080/node/51.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:39:27');
INSERT INTO `cms_visit_log` VALUES ('38', '1', 'http://localhost:8080/info/87.jspx', 'http://localhost:8080/node/51.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:39:31');
INSERT INTO `cms_visit_log` VALUES ('39', '1', 'http://localhost:8080/node/41.jspx', 'http://localhost:8080/node/51.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:39:40');
INSERT INTO `cms_visit_log` VALUES ('40', '1', 'http://localhost:8080/info/55.jspx', 'http://localhost:8080/node/41.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:39:42');
INSERT INTO `cms_visit_log` VALUES ('41', '1', 'http://localhost:8080/node/40.jspx', 'http://localhost:8080/node/41.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:39:46');
INSERT INTO `cms_visit_log` VALUES ('42', '1', 'http://localhost:8080/info/50.jspx', 'http://localhost:8080/node/40.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:39:48');
INSERT INTO `cms_visit_log` VALUES ('43', '1', 'http://localhost:8080/node/39.jspx', 'http://localhost:8080/node/40.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:39:52');
INSERT INTO `cms_visit_log` VALUES ('44', '1', 'http://localhost:8080/node/52.jspx', 'http://localhost:8080/node/39.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:39:54');
INSERT INTO `cms_visit_log` VALUES ('45', '1', 'http://localhost:8080/info/98.jspx', 'http://localhost:8080/node/52.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:39:56');
INSERT INTO `cms_visit_log` VALUES ('46', '1', 'http://localhost:8080/node/49.jspx', 'http://localhost:8080/node/52.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:40:04');
INSERT INTO `cms_visit_log` VALUES ('47', '1', 'http://localhost:8080/info/93.jspx', 'http://localhost:8080/node/49.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:40:06');
INSERT INTO `cms_visit_log` VALUES ('48', '1', 'http://localhost:8080/info/83.jspx', 'http://localhost:8080/node/49.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:40:16');
INSERT INTO `cms_visit_log` VALUES ('49', '1', 'http://localhost:8080/node/46.jspx', 'http://localhost:8080/node/49.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:40:24');
INSERT INTO `cms_visit_log` VALUES ('50', '1', 'http://localhost:8080/info/69.jspx', 'http://localhost:8080/node/46.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:40:26');
INSERT INTO `cms_visit_log` VALUES ('51', '1', 'http://localhost:8080/guestbook.jspx', 'http://localhost:8080/node/46.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:40:33');
INSERT INTO `cms_visit_log` VALUES ('52', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:40:35');
INSERT INTO `cms_visit_log` VALUES ('53', '1', 'http://localhost:8080/info/28.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:40:38');
INSERT INTO `cms_visit_log` VALUES ('54', '1', 'http://localhost:8080/info/28.jspx', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:40:51');
INSERT INTO `cms_visit_log` VALUES ('55', '1', 'http://localhost:8080/info/28.jspx', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:41:00');
INSERT INTO `cms_visit_log` VALUES ('56', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 12:42:11');
INSERT INTO `cms_visit_log` VALUES ('57', '1', 'http://localhost:8080/', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 17:22:34');
INSERT INTO `cms_visit_log` VALUES ('58', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 17:22:35');
INSERT INTO `cms_visit_log` VALUES ('59', '1', 'http://localhost:8080/', 'http://localhost:8080/login.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 17:23:38');
INSERT INTO `cms_visit_log` VALUES ('60', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 17:23:40');
INSERT INTO `cms_visit_log` VALUES ('61', '1', 'http://localhost:8080/my/profile.jspx', 'http://localhost:8080/login.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 17:50:07');
INSERT INTO `cms_visit_log` VALUES ('62', '1', 'http://localhost:8080/my/password.jspx', 'http://localhost:8080/my/profile.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 17:50:10');
INSERT INTO `cms_visit_log` VALUES ('63', '1', 'http://localhost:8080/my/email.jspx', 'http://localhost:8080/my/password.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 17:50:12');
INSERT INTO `cms_visit_log` VALUES ('64', '1', 'http://localhost:8080/my/profile.jspx', 'http://localhost:8080/my/email.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 17:50:14');
INSERT INTO `cms_visit_log` VALUES ('65', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/my/profile.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 17:50:18');
INSERT INTO `cms_visit_log` VALUES ('66', '1', 'http://localhost:8080/my/profile.jspx', 'http://localhost:8080/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:04:42');
INSERT INTO `cms_visit_log` VALUES ('67', '1', 'http://localhost:8080/my/profile.jspx', 'http://localhost:8080/my/profile.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:04:44');
INSERT INTO `cms_visit_log` VALUES ('68', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/my/profile.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:05:09');
INSERT INTO `cms_visit_log` VALUES ('69', '1', 'http://localhost:8080/my/profile.jspx', 'http://localhost:8080/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:05:58');
INSERT INTO `cms_visit_log` VALUES ('70', '1', 'http://localhost:8080/my/profile.jspx', 'http://localhost:8080/my/profile.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:06:07');
INSERT INTO `cms_visit_log` VALUES ('71', '1', 'http://localhost:8080/my/profile.jspx', 'http://localhost:8080/my/profile.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:06:20');
INSERT INTO `cms_visit_log` VALUES ('72', '1', 'http://localhost:8080/my/profile.jspx', 'http://localhost:8080/my/profile.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:06:30');
INSERT INTO `cms_visit_log` VALUES ('73', '1', 'http://localhost:8080/my/profile.jspx', 'http://localhost:8080/my/profile.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:06:31');
INSERT INTO `cms_visit_log` VALUES ('74', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/my/profile.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:06:46');
INSERT INTO `cms_visit_log` VALUES ('75', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/login.jspx;jsessionid=E8C2E57833F6D95EDDC1367CA476E6DD', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-22', '2014-02-22', '2014-02-22 18:07:07');
INSERT INTO `cms_visit_log` VALUES ('76', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:07:31');
INSERT INTO `cms_visit_log` VALUES ('77', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:12:07');
INSERT INTO `cms_visit_log` VALUES ('78', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:12:12');
INSERT INTO `cms_visit_log` VALUES ('79', '1', 'http://localhost:8080/my/profile.jspx', 'http://localhost:8080/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:12:14');
INSERT INTO `cms_visit_log` VALUES ('80', '1', 'http://localhost:8080/my.jspx', 'http://localhost:8080/my/profile.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-22', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-22', '2014-02-22', '2014-02-22 18:12:17');
INSERT INTO `cms_visit_log` VALUES ('81', '1', 'http://localhost:8080/', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-23', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-23', '2014-02-23', '2014-02-23 10:57:42');
INSERT INTO `cms_visit_log` VALUES ('82', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-23', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-23', '2014-02-23', '2014-02-23 10:57:44');
INSERT INTO `cms_visit_log` VALUES ('83', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/info/80.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-23', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-23', '2014-02-23', '2014-02-23 11:26:47');
INSERT INTO `cms_visit_log` VALUES ('84', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/info/78.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-23', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-23', '2014-02-23', '2014-02-23 11:28:06');
INSERT INTO `cms_visit_log` VALUES ('85', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/info/80.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-23', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-23', '2014-02-23', '2014-02-23 11:28:18');
INSERT INTO `cms_visit_log` VALUES ('86', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/info/80.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-23', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-23', '2014-02-23', '2014-02-23 11:28:27');
INSERT INTO `cms_visit_log` VALUES ('87', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/info/79.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-23', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-23', '2014-02-23', '2014-02-23 11:28:31');
INSERT INTO `cms_visit_log` VALUES ('88', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/info/78.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-23', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-23', '2014-02-23', '2014-02-23 11:28:40');
INSERT INTO `cms_visit_log` VALUES ('89', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/info/81.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-23', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-23', '2014-02-23', '2014-02-23 11:28:44');
INSERT INTO `cms_visit_log` VALUES ('90', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/info/80.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-23', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-23', '2014-02-23', '2014-02-23 11:28:47');
INSERT INTO `cms_visit_log` VALUES ('91', '1', 'http://localhost:8080/', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:11:23');
INSERT INTO `cms_visit_log` VALUES ('92', '1', 'http://localhost:8080/', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:16:44');
INSERT INTO `cms_visit_log` VALUES ('93', '1', 'http://localhost:8080/', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:31:00');
INSERT INTO `cms_visit_log` VALUES ('94', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:33:21');
INSERT INTO `cms_visit_log` VALUES ('95', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:35:01');
INSERT INTO `cms_visit_log` VALUES ('96', '1', 'http://localhost:8080/sitemap.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:35:15');
INSERT INTO `cms_visit_log` VALUES ('97', '1', 'http://localhost:8080/tags.jspx', 'http://localhost:8080/sitemap.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:35:18');
INSERT INTO `cms_visit_log` VALUES ('98', '1', 'http://localhost:8080/', 'http://localhost:8080/tags.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:36:13');
INSERT INTO `cms_visit_log` VALUES ('99', '1', 'http://localhost:8080/search.jspx?q=Ã¤Â¸Â­Ã¥ÂÂ½', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:36:20');
INSERT INTO `cms_visit_log` VALUES ('100', '1', 'http://localhost:8080/info/55.jspx', 'http://localhost:8080/search.jspx?q=Ã¤Â¸Â­Ã¥ÂÂ½', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:36:30');
INSERT INTO `cms_visit_log` VALUES ('101', '1', 'http://localhost:8080/info/38.jspx', 'http://localhost:8080/search.jspx?q=Ã¤Â¸Â­Ã¥ÂÂ½', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 09:36:48');
INSERT INTO `cms_visit_log` VALUES ('102', '1', 'http://localhost:8080/info/36.jspx', 'http://localhost:8080/search.jspx?q=Ã¤Â¸Â­Ã¥ÂÂ½', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 10:03:37');
INSERT INTO `cms_visit_log` VALUES ('103', '1', 'http://localhost:8080/search.jspx?q=Ã¤Â¸Â­Ã¥ÂÂ½', 'http://localhost:8080/search.jspx?q=Ã¤Â¸Â­Ã¥ÂÂ½', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-24', '2014-02-24', '2014-02-24 10:03:51');
INSERT INTO `cms_visit_log` VALUES ('104', '1', 'http://localhost:8080/info/35.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-24', '2014-02-24', '2014-02-24 15:34:41');
INSERT INTO `cms_visit_log` VALUES ('105', '1', 'http://localhost:8080/', null, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-24', '2014-02-24', '2014-02-24 15:38:55');
INSERT INTO `cms_visit_log` VALUES ('106', '1', 'http://localhost:8080/info/71.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-24', '2014-02-24', '2014-02-24 16:26:13');
INSERT INTO `cms_visit_log` VALUES ('107', '1', 'http://localhost:8080/info/35.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-24', '2014-02-24', '2014-02-24 16:26:18');
INSERT INTO `cms_visit_log` VALUES ('108', '1', 'http://localhost:8080/info/35.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-24', '2014-02-24', '2014-02-24 16:26:55');
INSERT INTO `cms_visit_log` VALUES ('109', '1', 'http://localhost:8080/', 'http://localhost:8080/info/35.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-24', '2014-02-24', '2014-02-24 16:26:57');
INSERT INTO `cms_visit_log` VALUES ('110', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-24', '08cc3f05b9a74064a856f3c24655c1a7', '08cc3f05b9a74064a856f3c24655c1a72014-02-24', '2014-02-24', '2014-02-24 16:26:59');
INSERT INTO `cms_visit_log` VALUES ('111', '1', 'http://localhost:8080/', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:28');
INSERT INTO `cms_visit_log` VALUES ('112', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:38');
INSERT INTO `cms_visit_log` VALUES ('113', '1', 'http://localhost:8080/', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:40');
INSERT INTO `cms_visit_log` VALUES ('114', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:42');
INSERT INTO `cms_visit_log` VALUES ('115', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:43');
INSERT INTO `cms_visit_log` VALUES ('116', '1', 'http://localhost:8080/node/51.jspx', 'http://localhost:8080/node/48.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:44');
INSERT INTO `cms_visit_log` VALUES ('117', '1', 'http://localhost:8080/node/41.jspx', 'http://localhost:8080/node/51.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:45');
INSERT INTO `cms_visit_log` VALUES ('118', '1', 'http://localhost:8080/node/38.jspx', 'http://localhost:8080/node/41.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:46');
INSERT INTO `cms_visit_log` VALUES ('119', '1', 'http://localhost:8080/node/40.jspx', 'http://localhost:8080/node/38.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:47');
INSERT INTO `cms_visit_log` VALUES ('120', '1', 'http://localhost:8080/node/39.jspx', 'http://localhost:8080/node/40.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:48');
INSERT INTO `cms_visit_log` VALUES ('121', '1', 'http://localhost:8080/node/52.jspx', 'http://localhost:8080/node/39.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:50');
INSERT INTO `cms_visit_log` VALUES ('122', '1', 'http://localhost:8080/node/49.jspx', 'http://localhost:8080/node/52.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:51');
INSERT INTO `cms_visit_log` VALUES ('123', '1', 'http://localhost:8080/node/46.jspx', 'http://localhost:8080/node/49.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:52');
INSERT INTO `cms_visit_log` VALUES ('124', '1', 'http://localhost:8080/guestbook.jspx', 'http://localhost:8080/node/46.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:53');
INSERT INTO `cms_visit_log` VALUES ('125', '1', 'http://localhost:8080/', 'http://localhost:8080/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:55');
INSERT INTO `cms_visit_log` VALUES ('126', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:38:56');
INSERT INTO `cms_visit_log` VALUES ('127', '1', 'http://localhost:8080/info/28.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 11:39:00');
INSERT INTO `cms_visit_log` VALUES ('128', '1', 'http://localhost:8080/', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-02-27', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-02-27', '2014-02-27', '2014-02-27 13:43:01');
INSERT INTO `cms_visit_log` VALUES ('129', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 10:46:34');
INSERT INTO `cms_visit_log` VALUES ('130', '1', 'http://localhost:8080/', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 10:46:39');
INSERT INTO `cms_visit_log` VALUES ('131', '1', 'http://localhost:8080/info/46.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 10:46:49');
INSERT INTO `cms_visit_log` VALUES ('132', '1', 'http://localhost:8080/node/36.jspx', 'http://localhost:8080/info/46.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 10:46:56');
INSERT INTO `cms_visit_log` VALUES ('133', '1', 'http://localhost:8080/node/48.jspx', 'http://localhost:8080/node/36.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 10:46:57');
INSERT INTO `cms_visit_log` VALUES ('134', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:18:42');
INSERT INTO `cms_visit_log` VALUES ('135', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:18:44');
INSERT INTO `cms_visit_log` VALUES ('136', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:25:15');
INSERT INTO `cms_visit_log` VALUES ('137', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:25:23');
INSERT INTO `cms_visit_log` VALUES ('138', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:30:57');
INSERT INTO `cms_visit_log` VALUES ('139', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:31:00');
INSERT INTO `cms_visit_log` VALUES ('140', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:32:18');
INSERT INTO `cms_visit_log` VALUES ('141', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:52:04');
INSERT INTO `cms_visit_log` VALUES ('142', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:52:08');
INSERT INTO `cms_visit_log` VALUES ('143', '1', 'http://localhost:8080/node/49.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:52:09');
INSERT INTO `cms_visit_log` VALUES ('144', '1', 'http://localhost:8080/info/83.jspx', 'http://localhost:8080/node/49.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 11:52:12');
INSERT INTO `cms_visit_log` VALUES ('145', '1', 'http://localhost:8080/', 'http://localhost:8080/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 12:05:12');
INSERT INTO `cms_visit_log` VALUES ('146', '1', 'http://localhost:8080/node/49.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 12:23:39');
INSERT INTO `cms_visit_log` VALUES ('147', '1', 'http://localhost:8080/info/93.jspx', 'http://localhost:8080/node/49.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 12:23:42');
INSERT INTO `cms_visit_log` VALUES ('148', '1', 'http://localhost:8080/info/83.jspx', 'http://localhost:8080/node/49.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 12:23:57');
INSERT INTO `cms_visit_log` VALUES ('149', '1', 'http://localhost:8080/info/83.jspx', 'http://localhost:8080/node/49.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 12:24:09');
INSERT INTO `cms_visit_log` VALUES ('150', '1', 'http://localhost:8080/node/49.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 12:29:42');
INSERT INTO `cms_visit_log` VALUES ('151', '1', 'http://localhost:8080/info/83.jspx', 'http://localhost:8080/node/49.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 12:29:52');
INSERT INTO `cms_visit_log` VALUES ('152', '1', 'http://localhost:8080/', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:52:27');
INSERT INTO `cms_visit_log` VALUES ('153', '1', 'http://localhost:8080/guestbook.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:53:26');
INSERT INTO `cms_visit_log` VALUES ('154', '1', 'http://localhost:8080/guestbook.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:54:02');
INSERT INTO `cms_visit_log` VALUES ('155', '1', 'http://localhost:8080/guestbook.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:54:32');
INSERT INTO `cms_visit_log` VALUES ('156', '1', 'http://localhost:8080/guestbook.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:54:52');
INSERT INTO `cms_visit_log` VALUES ('157', '1', 'http://localhost:8080/guestbook.jspx', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:56:02');
INSERT INTO `cms_visit_log` VALUES ('158', '1', 'http://localhost:8080/guestbook.jspx', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:56:46');
INSERT INTO `cms_visit_log` VALUES ('159', '1', 'http://localhost:8080/guestbook.jspx', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:56:59');
INSERT INTO `cms_visit_log` VALUES ('160', '1', 'http://localhost:8080/guestbook.jspx?page=2', 'http://localhost:8080/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:57:00');
INSERT INTO `cms_visit_log` VALUES ('161', '1', 'http://localhost:8080/guestbook.jspx', 'http://localhost:8080/guestbook.jspx?page=2', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:57:03');
INSERT INTO `cms_visit_log` VALUES ('162', '1', 'http://localhost:8080/guestbook.jspx', 'http://localhost:8080/guestbook.jspx?page=2', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 13:57:15');
INSERT INTO `cms_visit_log` VALUES ('163', '1', 'http://localhost:8081/', 'http://localhost:8081/cmscp/index.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 14:37:34');
INSERT INTO `cms_visit_log` VALUES ('164', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 14:37:37');
INSERT INTO `cms_visit_log` VALUES ('165', '1', 'http://localhost:8081/', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 14:42:41');
INSERT INTO `cms_visit_log` VALUES ('166', '1', 'http://localhost:8081/node/70.jspx', 'http://localhost:8081/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 14:42:43');
INSERT INTO `cms_visit_log` VALUES ('167', '1', 'http://localhost:8081/node/41.jspx', 'http://localhost:8081/node/70.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 14:43:17');
INSERT INTO `cms_visit_log` VALUES ('168', '1', 'http://localhost:8081/info/55.jspx', 'http://localhost:8081/node/41.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 14:43:20');
INSERT INTO `cms_visit_log` VALUES ('169', '1', 'http://localhost:8081/node/41.jspx', 'http://localhost:8081/node/70.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 14:55:10');
INSERT INTO `cms_visit_log` VALUES ('170', '1', 'http://localhost:8081/guestbook.jspx', 'http://localhost:8081/node/41.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 14:55:11');
INSERT INTO `cms_visit_log` VALUES ('171', '1', 'http://localhost:8081/guestbook.jspx', 'http://localhost:8081/node/41.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 14:56:00');
INSERT INTO `cms_visit_log` VALUES ('172', '1', 'http://localhost:8081/guestbook.jspx', 'http://localhost:8081/node/41.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 14:58:03');
INSERT INTO `cms_visit_log` VALUES ('173', '1', 'http://localhost:8081/info/122.jspx', 'http://localhost:8081/cmscp/core/info/list.do?queryNodeId=73', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:02:35');
INSERT INTO `cms_visit_log` VALUES ('174', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/cmscp/core/info/list.do', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:04:13');
INSERT INTO `cms_visit_log` VALUES ('175', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:04:21');
INSERT INTO `cms_visit_log` VALUES ('176', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:11:18');
INSERT INTO `cms_visit_log` VALUES ('177', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:11:39');
INSERT INTO `cms_visit_log` VALUES ('178', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:11:59');
INSERT INTO `cms_visit_log` VALUES ('179', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:12:13');
INSERT INTO `cms_visit_log` VALUES ('180', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:12:15');
INSERT INTO `cms_visit_log` VALUES ('181', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:14:00');
INSERT INTO `cms_visit_log` VALUES ('182', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:14:10');
INSERT INTO `cms_visit_log` VALUES ('183', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/guestbook.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:14:37');
INSERT INTO `cms_visit_log` VALUES ('184', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:15:05');
INSERT INTO `cms_visit_log` VALUES ('185', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:16:31');
INSERT INTO `cms_visit_log` VALUES ('186', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:16:38');
INSERT INTO `cms_visit_log` VALUES ('187', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:16:57');
INSERT INTO `cms_visit_log` VALUES ('188', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:17:29');
INSERT INTO `cms_visit_log` VALUES ('189', '1', 'http://localhost:8081/info/117.jspx', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:18:35');
INSERT INTO `cms_visit_log` VALUES ('190', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:20:06');
INSERT INTO `cms_visit_log` VALUES ('191', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:21:24');
INSERT INTO `cms_visit_log` VALUES ('192', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:22:01');
INSERT INTO `cms_visit_log` VALUES ('193', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:22:41');
INSERT INTO `cms_visit_log` VALUES ('194', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:23:01');
INSERT INTO `cms_visit_log` VALUES ('195', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:23:31');
INSERT INTO `cms_visit_log` VALUES ('196', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:23:54');
INSERT INTO `cms_visit_log` VALUES ('197', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:25:11');
INSERT INTO `cms_visit_log` VALUES ('198', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:25:29');
INSERT INTO `cms_visit_log` VALUES ('199', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:25:51');
INSERT INTO `cms_visit_log` VALUES ('200', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:26:16');
INSERT INTO `cms_visit_log` VALUES ('201', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:26:31');
INSERT INTO `cms_visit_log` VALUES ('202', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:26:55');
INSERT INTO `cms_visit_log` VALUES ('203', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:27:05');
INSERT INTO `cms_visit_log` VALUES ('204', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:27:07');
INSERT INTO `cms_visit_log` VALUES ('205', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:28:04');
INSERT INTO `cms_visit_log` VALUES ('206', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:28:30');
INSERT INTO `cms_visit_log` VALUES ('207', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:28:58');
INSERT INTO `cms_visit_log` VALUES ('208', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:29:09');
INSERT INTO `cms_visit_log` VALUES ('209', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:29:26');
INSERT INTO `cms_visit_log` VALUES ('210', '1', 'http://localhost:8081/info/118.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:30:16');
INSERT INTO `cms_visit_log` VALUES ('211', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:37:57');
INSERT INTO `cms_visit_log` VALUES ('212', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:38:33');
INSERT INTO `cms_visit_log` VALUES ('213', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:38:51');
INSERT INTO `cms_visit_log` VALUES ('214', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:38:54');
INSERT INTO `cms_visit_log` VALUES ('215', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:39:12');
INSERT INTO `cms_visit_log` VALUES ('216', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:39:54');
INSERT INTO `cms_visit_log` VALUES ('217', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:40:06');
INSERT INTO `cms_visit_log` VALUES ('218', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:41:39');
INSERT INTO `cms_visit_log` VALUES ('219', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:41:57');
INSERT INTO `cms_visit_log` VALUES ('220', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', 'ba0a4533c8c94162a0efd83424766ae8', 'ba0a4533c8c94162a0efd83424766ae82014-03-18', '2014-03-18', '2014-03-18 15:42:06');
INSERT INTO `cms_visit_log` VALUES ('221', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', 'ba0a4533c8c94162a0efd83424766ae8', 'ba0a4533c8c94162a0efd83424766ae82014-03-18', '2014-03-18', '2014-03-18 15:42:15');
INSERT INTO `cms_visit_log` VALUES ('222', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:42:19');
INSERT INTO `cms_visit_log` VALUES ('223', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:42:43');
INSERT INTO `cms_visit_log` VALUES ('224', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', 'ba0a4533c8c94162a0efd83424766ae8', 'ba0a4533c8c94162a0efd83424766ae82014-03-18', '2014-03-18', '2014-03-18 15:42:47');
INSERT INTO `cms_visit_log` VALUES ('225', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', 'ba0a4533c8c94162a0efd83424766ae8', 'ba0a4533c8c94162a0efd83424766ae82014-03-18', '2014-03-18', '2014-03-18 15:42:47');
INSERT INTO `cms_visit_log` VALUES ('226', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:44:19');
INSERT INTO `cms_visit_log` VALUES ('227', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:44:40');
INSERT INTO `cms_visit_log` VALUES ('228', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:46:45');
INSERT INTO `cms_visit_log` VALUES ('229', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', 'http://localhost:8081/info/118.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:47:06');
INSERT INTO `cms_visit_log` VALUES ('230', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:47:16');
INSERT INTO `cms_visit_log` VALUES ('231', '1', 'http://localhost:8081/resume.jspx?post=网页设计师', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:47:44');
INSERT INTO `cms_visit_log` VALUES ('232', '1', 'http://localhost:8081/my.jspx', 'http://localhost:8081/resume.jspx?post=网页设计师', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:50:33');
INSERT INTO `cms_visit_log` VALUES ('233', '1', 'http://localhost:8081/my.jspx', 'http://localhost:8081/resume.jspx?post=网页设计师', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:52:05');
INSERT INTO `cms_visit_log` VALUES ('234', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:53:40');
INSERT INTO `cms_visit_log` VALUES ('235', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:55:28');
INSERT INTO `cms_visit_log` VALUES ('236', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:55:57');
INSERT INTO `cms_visit_log` VALUES ('237', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:56:14');
INSERT INTO `cms_visit_log` VALUES ('238', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:56:31');
INSERT INTO `cms_visit_log` VALUES ('239', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:57:18');
INSERT INTO `cms_visit_log` VALUES ('240', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:57:35');
INSERT INTO `cms_visit_log` VALUES ('241', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:58:03');
INSERT INTO `cms_visit_log` VALUES ('242', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:58:13');
INSERT INTO `cms_visit_log` VALUES ('243', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:58:22');
INSERT INTO `cms_visit_log` VALUES ('244', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:58:43');
INSERT INTO `cms_visit_log` VALUES ('245', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:58:55');
INSERT INTO `cms_visit_log` VALUES ('246', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:58:57');
INSERT INTO `cms_visit_log` VALUES ('247', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 15:59:35');
INSERT INTO `cms_visit_log` VALUES ('248', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:08:43');
INSERT INTO `cms_visit_log` VALUES ('249', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:08:59');
INSERT INTO `cms_visit_log` VALUES ('250', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:09:26');
INSERT INTO `cms_visit_log` VALUES ('251', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:09:35');
INSERT INTO `cms_visit_log` VALUES ('252', '1', 'http://localhost:8081/my/contribution.jspx', 'http://localhost:8081/my.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:11:54');
INSERT INTO `cms_visit_log` VALUES ('253', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:13:03');
INSERT INTO `cms_visit_log` VALUES ('254', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:16:33');
INSERT INTO `cms_visit_log` VALUES ('255', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:17:36');
INSERT INTO `cms_visit_log` VALUES ('256', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:17:55');
INSERT INTO `cms_visit_log` VALUES ('257', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:18:04');
INSERT INTO `cms_visit_log` VALUES ('258', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:18:17');
INSERT INTO `cms_visit_log` VALUES ('259', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:18:36');
INSERT INTO `cms_visit_log` VALUES ('260', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:18:55');
INSERT INTO `cms_visit_log` VALUES ('261', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:19:43');
INSERT INTO `cms_visit_log` VALUES ('262', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:20:03');
INSERT INTO `cms_visit_log` VALUES ('263', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:20:48');
INSERT INTO `cms_visit_log` VALUES ('264', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:20:57');
INSERT INTO `cms_visit_log` VALUES ('265', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:21:10');
INSERT INTO `cms_visit_log` VALUES ('266', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:21:12');
INSERT INTO `cms_visit_log` VALUES ('267', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:21:30');
INSERT INTO `cms_visit_log` VALUES ('268', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:21:51');
INSERT INTO `cms_visit_log` VALUES ('269', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:22:01');
INSERT INTO `cms_visit_log` VALUES ('270', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:22:31');
INSERT INTO `cms_visit_log` VALUES ('271', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:23:03');
INSERT INTO `cms_visit_log` VALUES ('272', '1', 'http://localhost:8081/my/contribution.jspx', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:23:10');
INSERT INTO `cms_visit_log` VALUES ('273', '1', 'http://localhost:8081/my/contribution.jspx', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:23:15');
INSERT INTO `cms_visit_log` VALUES ('274', '1', 'http://localhost:8081/my/contribution/create.jspx', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:23:18');
INSERT INTO `cms_visit_log` VALUES ('275', '1', 'http://localhost:8081/my/contribution.jspx', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:23:37');
INSERT INTO `cms_visit_log` VALUES ('276', '1', 'http://localhost:8081/my/contribution.jspx', '', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:23:42');
INSERT INTO `cms_visit_log` VALUES ('277', '1', 'http://localhost:8081/', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:24:02');
INSERT INTO `cms_visit_log` VALUES ('278', '1', 'http://localhost:8081/', 'http://localhost:8081/my/contribution.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:25:38');
INSERT INTO `cms_visit_log` VALUES ('279', '1', 'http://localhost:8081/node/69.jspx', 'http://localhost:8081/', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:25:40');
INSERT INTO `cms_visit_log` VALUES ('280', '1', 'http://localhost:8081/node/52.jspx', 'http://localhost:8081/node/69.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:25:46');
INSERT INTO `cms_visit_log` VALUES ('281', '1', 'http://localhost:8081/node/49.jspx', 'http://localhost:8081/node/52.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:25:47');
INSERT INTO `cms_visit_log` VALUES ('282', '1', 'http://localhost:8081/node/40.jspx', 'http://localhost:8081/node/49.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:25:49');
INSERT INTO `cms_visit_log` VALUES ('283', '1', 'http://localhost:8081/node/38.jspx', 'http://localhost:8081/node/40.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:25:50');
INSERT INTO `cms_visit_log` VALUES ('284', '1', 'http://localhost:8081/node/41.jspx', 'http://localhost:8081/node/38.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:25:52');
INSERT INTO `cms_visit_log` VALUES ('285', '1', 'http://localhost:8081/', 'http://localhost:8081/node/41.jspx', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:12014-03-18', '313e662adb864836a79ac0df36c54d42', '313e662adb864836a79ac0df36c54d422014-03-18', '2014-03-18', '2014-03-18 16:25:54');
INSERT INTO `cms_visit_log` VALUES ('286', '1', 'http://127.0.0.1:8080/', '', '127.0.0.1', '127.0.0.12015-03-26', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-26', '2015-03-26', '2015-03-26 20:22:03');
INSERT INTO `cms_visit_log` VALUES ('287', '1', 'http://127.0.0.1:8080/', '', '127.0.0.1', '127.0.0.12015-03-26', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-26', '2015-03-26', '2015-03-26 20:51:22');
INSERT INTO `cms_visit_log` VALUES ('288', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do?_site=3', '127.0.0.1', '127.0.0.12015-03-26', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-26', '2015-03-26', '2015-03-26 21:18:54');
INSERT INTO `cms_visit_log` VALUES ('289', '3', 'http://127.0.0.1:8080/tag/74.jspx', 'http://127.0.0.1:8080/', '127.0.0.1', '127.0.0.12015-03-26', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-26', '2015-03-26', '2015-03-26 21:19:01');
INSERT INTO `cms_visit_log` VALUES ('290', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 11:03:50');
INSERT INTO `cms_visit_log` VALUES ('291', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 11:57:12');
INSERT INTO `cms_visit_log` VALUES ('292', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 12:52:48');
INSERT INTO `cms_visit_log` VALUES ('293', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 12:52:58');
INSERT INTO `cms_visit_log` VALUES ('294', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 12:53:20');
INSERT INTO `cms_visit_log` VALUES ('295', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 12:53:49');
INSERT INTO `cms_visit_log` VALUES ('296', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 13:08:49');
INSERT INTO `cms_visit_log` VALUES ('297', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:05:25');
INSERT INTO `cms_visit_log` VALUES ('298', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:05:27');
INSERT INTO `cms_visit_log` VALUES ('299', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:05:28');
INSERT INTO `cms_visit_log` VALUES ('300', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:05:44');
INSERT INTO `cms_visit_log` VALUES ('301', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:10:29');
INSERT INTO `cms_visit_log` VALUES ('302', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:11:47');
INSERT INTO `cms_visit_log` VALUES ('303', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:15:30');
INSERT INTO `cms_visit_log` VALUES ('304', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:19:24');
INSERT INTO `cms_visit_log` VALUES ('305', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:20:12');
INSERT INTO `cms_visit_log` VALUES ('306', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:27:19');
INSERT INTO `cms_visit_log` VALUES ('307', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:28:02');
INSERT INTO `cms_visit_log` VALUES ('308', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:30:28');
INSERT INTO `cms_visit_log` VALUES ('309', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:34:10');
INSERT INTO `cms_visit_log` VALUES ('310', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:34:12');
INSERT INTO `cms_visit_log` VALUES ('311', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:34:12');
INSERT INTO `cms_visit_log` VALUES ('312', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:34:13');
INSERT INTO `cms_visit_log` VALUES ('313', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:38:19');
INSERT INTO `cms_visit_log` VALUES ('314', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:39:06');
INSERT INTO `cms_visit_log` VALUES ('315', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:39:18');
INSERT INTO `cms_visit_log` VALUES ('316', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:43:39');
INSERT INTO `cms_visit_log` VALUES ('317', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:44:57');
INSERT INTO `cms_visit_log` VALUES ('318', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:45:16');
INSERT INTO `cms_visit_log` VALUES ('319', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:46:23');
INSERT INTO `cms_visit_log` VALUES ('320', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:46:45');
INSERT INTO `cms_visit_log` VALUES ('321', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:48:56');
INSERT INTO `cms_visit_log` VALUES ('322', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:49:09');
INSERT INTO `cms_visit_log` VALUES ('323', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:49:10');
INSERT INTO `cms_visit_log` VALUES ('324', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:49:41');
INSERT INTO `cms_visit_log` VALUES ('325', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:51:39');
INSERT INTO `cms_visit_log` VALUES ('326', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:52:09');
INSERT INTO `cms_visit_log` VALUES ('327', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:52:42');
INSERT INTO `cms_visit_log` VALUES ('328', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/cmscp/index.do', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 15:52:56');
INSERT INTO `cms_visit_log` VALUES ('329', '1', 'http://localhost:8080/', 'http://127.0.0.1:8080/cmscp/index.do?_site=1', '127.0.0.1', '127.0.0.12015-03-28', 'fb2fe520fa40438487cd108f30f51472', 'fb2fe520fa40438487cd108f30f514722015-03-28', '2015-03-28', '2015-03-28 21:02:18');
INSERT INTO `cms_visit_log` VALUES ('330', '1', 'http://localhost:8080/node/40.jspx', 'http://localhost:8080/', '127.0.0.1', '127.0.0.12015-03-28', 'fb2fe520fa40438487cd108f30f51472', 'fb2fe520fa40438487cd108f30f514722015-03-28', '2015-03-28', '2015-03-28 21:02:24');
INSERT INTO `cms_visit_log` VALUES ('331', '1', 'http://localhost:8080/info/50.jspx', 'http://localhost:8080/node/40.jspx', '127.0.0.1', '127.0.0.12015-03-28', 'fb2fe520fa40438487cd108f30f51472', 'fb2fe520fa40438487cd108f30f514722015-03-28', '2015-03-28', '2015-03-28 21:58:03');
INSERT INTO `cms_visit_log` VALUES ('332', '3', 'http://127.0.0.1:8080/', 'http://127.0.0.1:8080/node/77.jspx', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 22:13:36');
INSERT INTO `cms_visit_log` VALUES ('333', '3', 'http://127.0.0.1:8080/node/76.jspx', 'http://127.0.0.1:8080/', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 22:13:44');
INSERT INTO `cms_visit_log` VALUES ('334', '3', 'http://127.0.0.1:8080/node/81.jspx', 'http://127.0.0.1:8080/node/76.jspx', '127.0.0.1', '127.0.0.12015-03-28', '9fb31840b1754eadbc6f535a73f4b67d', '9fb31840b1754eadbc6f535a73f4b67d2015-03-28', '2015-03-28', '2015-03-28 22:13:46');

-- ----------------------------
-- Table structure for cms_vote
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote`;
CREATE TABLE `cms_vote` (
  `f_vote_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_title` varchar(150) NOT NULL COMMENT '标题',
  `f_number` varchar(100) DEFAULT NULL COMMENT '编码',
  `f_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_begin_date` datetime DEFAULT NULL COMMENT '开始日期',
  `f_end_date` datetime DEFAULT NULL COMMENT '结束日期',
  `f_interval` int(11) NOT NULL DEFAULT '0' COMMENT '间隔时间（天）',
  `f_max_selected` int(11) NOT NULL DEFAULT '1' COMMENT '最多可选几项(0不限制)',
  `f_mode` int(11) NOT NULL DEFAULT '1' COMMENT '模式(1:独立访客,2:独立IP,3:独立用户)',
  `f_total` int(11) NOT NULL DEFAULT '0' COMMENT '总票数',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  `f_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态(0:启用,1:禁用)',
  PRIMARY KEY (`f_vote_id`),
  KEY `fk_cms_vote_site` (`f_site_id`),
  CONSTRAINT `fk_cms_vote_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票表';

-- ----------------------------
-- Records of cms_vote
-- ----------------------------
INSERT INTO `cms_vote` VALUES ('1', '1', '您从哪里知道本网站的', null, null, null, null, '0', '1', '1', '6', '999', '0');

-- ----------------------------
-- Table structure for cms_vote_mark
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote_mark`;
CREATE TABLE `cms_vote_mark` (
  `f_votemark_id` int(11) NOT NULL,
  `f_ftype` varchar(50) NOT NULL COMMENT '外表标识',
  `f_fid` int(11) NOT NULL COMMENT '外表ID',
  `f_date` datetime NOT NULL COMMENT '日期',
  `f_user_id` int(11) DEFAULT NULL COMMENT '用户',
  `f_ip` varchar(100) NOT NULL COMMENT 'IP',
  `f_cookie` varchar(100) NOT NULL COMMENT 'Cookie',
  PRIMARY KEY (`f_votemark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票标记表';

-- ----------------------------
-- Records of cms_vote_mark
-- ----------------------------
INSERT INTO `cms_vote_mark` VALUES ('17', 'InfoDigg', '73', '2013-08-12 09:23:32', '7', '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('18', 'InfoScore', '93', '2013-08-12 09:31:29', null, '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('19', 'InfoScore', '98', '2013-08-12 09:36:18', null, '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('20', 'InfoScore', '97', '2013-08-12 09:38:47', null, '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('21', 'InfoDigg', '69', '2013-08-13 01:15:47', '1', '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('22', 'InfoDigg', '69', '2013-08-13 01:15:48', '1', '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('23', 'Vote', '1', '2013-08-13 05:23:04', '1', '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('24', 'InfoScore', '87', '2013-08-13 05:23:16', '1', '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('25', 'InfoDigg', '87', '2013-08-13 05:23:18', '1', '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('26', 'InfoDigg', '28', '2013-08-13 07:00:03', '1', '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('27', 'InfoDigg', '87', '2013-08-14 03:04:12', null, '0:0:0:0:0:0:0:1', 'b4533b38b0884e3fa8646719f81b88c5');
INSERT INTO `cms_vote_mark` VALUES ('28', 'InfoScore', '87', '2013-08-14 03:34:11', null, '192.168.1.5', 'cd939e3841ec4fd19b85489f8366030b');
INSERT INTO `cms_vote_mark` VALUES ('29', 'InfoDigg', '84', '2013-08-14 05:45:34', '1', '0:0:0:0:0:0:0:1', '229c54fa33b944af961103eaa0e28908');
INSERT INTO `cms_vote_mark` VALUES ('30', 'InfoScore', '28', '2014-02-22 12:40:57', '1', '0:0:0:0:0:0:0:1', '313e662adb864836a79ac0df36c54d42');

-- ----------------------------
-- Table structure for cms_vote_option
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote_option`;
CREATE TABLE `cms_vote_option` (
  `f_voteoption_id` int(11) NOT NULL,
  `f_vote_id` int(11) NOT NULL,
  `f_title` varchar(150) NOT NULL COMMENT '标题',
  `f_count` int(11) NOT NULL DEFAULT '0' COMMENT '得票数',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  PRIMARY KEY (`f_voteoption_id`),
  KEY `fk_cms_voteoption_vote` (`f_vote_id`),
  CONSTRAINT `fk_cms_voteoption_vote` FOREIGN KEY (`f_vote_id`) REFERENCES `cms_vote` (`f_vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票项表';

-- ----------------------------
-- Records of cms_vote_option
-- ----------------------------
INSERT INTO `cms_vote_option` VALUES ('1', '1', '网友介绍的', '0', '0');
INSERT INTO `cms_vote_option` VALUES ('2', '1', '百度搜索的', '2', '1');
INSERT INTO `cms_vote_option` VALUES ('3', '1', 'Google搜索的', '1', '2');
INSERT INTO `cms_vote_option` VALUES ('4', '1', '其它搜索过来的', '1', '3');
INSERT INTO `cms_vote_option` VALUES ('5', '1', '网址输错了进来的', '0', '4');
INSERT INTO `cms_vote_option` VALUES ('6', '1', '太忙了不记得了', '2', '5');

-- ----------------------------
-- Table structure for cms_workflow
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow`;
CREATE TABLE `cms_workflow` (
  `f_workflow_id` int(11) NOT NULL,
  `f_workflowgroup_id` int(11) NOT NULL COMMENT '工作流',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  `f_status` int(11) NOT NULL DEFAULT '1' COMMENT '状态(1:启用;2:禁用)',
  PRIMARY KEY (`f_workflow_id`),
  KEY `fk_cms_workflow_site` (`f_site_id`),
  KEY `fk_cms_workflow_workflowgroup` (`f_workflowgroup_id`),
  CONSTRAINT `fk_cms_workflow_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`),
  CONSTRAINT `fk_cms_workflow_workflowgroup` FOREIGN KEY (`f_workflowgroup_id`) REFERENCES `cms_workflow_group` (`f_workflowgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流表';

-- ----------------------------
-- Records of cms_workflow
-- ----------------------------
INSERT INTO `cms_workflow` VALUES ('2', '2', '1', '文档一级审核', null, '2147483647', '1');

-- ----------------------------
-- Table structure for cms_workflowstep_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflowstep_role`;
CREATE TABLE `cms_workflowstep_role` (
  `f_wfsteprole_id` int(11) NOT NULL,
  `f_role_id` int(11) NOT NULL,
  `f_workflowstep_id` int(11) NOT NULL,
  `f_role_index` int(11) NOT NULL DEFAULT '0' COMMENT '角色排列顺序',
  PRIMARY KEY (`f_wfsteprole_id`),
  KEY `fk_cms_wfsteprole_role` (`f_role_id`),
  KEY `fk_cms_wfsteprole_wfstep` (`f_workflowstep_id`),
  CONSTRAINT `fk_cms_wfsteprole_role` FOREIGN KEY (`f_role_id`) REFERENCES `cms_role` (`f_role_id`),
  CONSTRAINT `fk_cms_wfsteprole_wfstep` FOREIGN KEY (`f_workflowstep_id`) REFERENCES `cms_workflow_step` (`f_workflowstep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审核步骤与角色关联表';

-- ----------------------------
-- Records of cms_workflowstep_role
-- ----------------------------
INSERT INTO `cms_workflowstep_role` VALUES ('1', '1', '4', '0');

-- ----------------------------
-- Table structure for cms_workflow_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow_group`;
CREATE TABLE `cms_workflow_group` (
  `f_workflowgroup_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  PRIMARY KEY (`f_workflowgroup_id`),
  KEY `fk_cms_workflowgroup_site` (`f_site_id`),
  CONSTRAINT `fk_cms_workflowgroup_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流组表';

-- ----------------------------
-- Records of cms_workflow_group
-- ----------------------------
INSERT INTO `cms_workflow_group` VALUES ('2', '1', '文档审核', null, '2147483647');

-- ----------------------------
-- Table structure for cms_workflow_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow_log`;
CREATE TABLE `cms_workflow_log` (
  `f_workflowlog_id` int(11) NOT NULL,
  `f_user_id` int(11) NOT NULL COMMENT '操作人',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_workflowprocess_id` int(11) NOT NULL COMMENT '过程',
  `f_from` varchar(100) NOT NULL COMMENT '从哪',
  `f_to` varchar(100) NOT NULL COMMENT '到哪',
  `f_creation_date` datetime NOT NULL COMMENT '创建时间',
  `f_opinion` varchar(255) DEFAULT NULL COMMENT '意见',
  `f_type` int(11) NOT NULL COMMENT '类型(1:前进;2后退:;3:原地)',
  PRIMARY KEY (`f_workflowlog_id`),
  KEY `fk_cms_workflowlog_site` (`f_site_id`),
  KEY `fk_cms_workflowlog_user` (`f_user_id`),
  KEY `fk_cms_workflowlog_wfprocess` (`f_workflowprocess_id`),
  CONSTRAINT `fk_cms_workflowlog_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`),
  CONSTRAINT `fk_cms_workflowlog_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`),
  CONSTRAINT `fk_cms_workflowlog_wfprocess` FOREIGN KEY (`f_workflowprocess_id`) REFERENCES `cms_workflow_process` (`f_workflowprocess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流流程日志表';

-- ----------------------------
-- Records of cms_workflow_log
-- ----------------------------

-- ----------------------------
-- Table structure for cms_workflow_process
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow_process`;
CREATE TABLE `cms_workflow_process` (
  `f_workflowprocess_id` int(11) NOT NULL,
  `f_workflowstep_id` int(11) DEFAULT NULL COMMENT '步骤',
  `f_site_id` int(11) NOT NULL COMMENT '站点',
  `f_workflow_id` int(11) NOT NULL COMMENT '流程',
  `f_user_id` int(11) NOT NULL COMMENT '发起人',
  `f_data_id` int(11) NOT NULL COMMENT '数据ID',
  `f_data_type` int(11) NOT NULL COMMENT '数据类型(1:信息)',
  `f_begin_date` datetime NOT NULL COMMENT '开始时间',
  `f_end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `f_is_rejection` char(1) NOT NULL DEFAULT '0' COMMENT '是否退回',
  `f_is_end` char(1) NOT NULL DEFAULT '0' COMMENT '是否结束',
  PRIMARY KEY (`f_workflowprocess_id`),
  KEY `fk_cms_wfprocess_wfstep` (`f_workflowstep_id`),
  KEY `fk_cms_workflowproc_site` (`f_site_id`),
  KEY `fk_cms_workflowproc_user` (`f_user_id`),
  KEY `fk_cms_workflowproc_workflow` (`f_workflow_id`),
  CONSTRAINT `fk_cms_wfprocess_wfstep` FOREIGN KEY (`f_workflowstep_id`) REFERENCES `cms_workflow_step` (`f_workflowstep_id`),
  CONSTRAINT `fk_cms_workflowproc_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`),
  CONSTRAINT `fk_cms_workflowproc_user` FOREIGN KEY (`f_user_id`) REFERENCES `cms_user` (`f_user_id`),
  CONSTRAINT `fk_cms_workflowproc_workflow` FOREIGN KEY (`f_workflow_id`) REFERENCES `cms_workflow` (`f_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流过程表';

-- ----------------------------
-- Records of cms_workflow_process
-- ----------------------------

-- ----------------------------
-- Table structure for cms_workflow_step
-- ----------------------------
DROP TABLE IF EXISTS `cms_workflow_step`;
CREATE TABLE `cms_workflow_step` (
  `f_workflowstep_id` int(11) NOT NULL,
  `f_workflow_id` int(11) NOT NULL COMMENT '工作流',
  `f_name` varchar(100) NOT NULL COMMENT '名称',
  `f_seq` int(11) NOT NULL DEFAULT '2147483647' COMMENT '排序',
  PRIMARY KEY (`f_workflowstep_id`),
  KEY `fk_cms_workflowstep_workflow` (`f_workflow_id`),
  CONSTRAINT `fk_cms_workflowstep_workflow` FOREIGN KEY (`f_workflow_id`) REFERENCES `cms_workflow` (`f_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流步骤表';

-- ----------------------------
-- Records of cms_workflow_step
-- ----------------------------
INSERT INTO `cms_workflow_step` VALUES ('4', '2', '等待终审', '2147483647');

-- ----------------------------
-- Table structure for plug_resume
-- ----------------------------
DROP TABLE IF EXISTS `plug_resume`;
CREATE TABLE `plug_resume` (
  `f_resume_id` int(11) NOT NULL,
  `f_site_id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL COMMENT '姓名',
  `f_post` varchar(100) NOT NULL COMMENT '应聘职位',
  `f_creation_date` datetime NOT NULL COMMENT '投递日期',
  `f_gender` char(1) NOT NULL DEFAULT 'M' COMMENT '性别',
  `f_birth_date` datetime DEFAULT NULL COMMENT '出生日期',
  `f_mobile` varchar(100) DEFAULT NULL COMMENT '手机',
  `f_email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `f_expected_salary` int(11) DEFAULT NULL COMMENT '期望薪水',
  `f_education_experience` longtext COMMENT '教育经历',
  `f_work_experience` longtext COMMENT '工作经历',
  `f_remark` longtext COMMENT '备注',
  PRIMARY KEY (`f_resume_id`),
  KEY `fk_plug_resume_site` (`f_site_id`),
  CONSTRAINT `fk_plug_resume_site` FOREIGN KEY (`f_site_id`) REFERENCES `cms_site` (`f_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历表';

-- ----------------------------
-- Records of plug_resume
-- ----------------------------

-- ----------------------------
-- Table structure for t_id_table
-- ----------------------------
DROP TABLE IF EXISTS `t_id_table`;
CREATE TABLE `t_id_table` (
  `f_table` varchar(100) NOT NULL COMMENT '表名',
  `f_id_value` bigint(20) NOT NULL COMMENT 'ID值',
  PRIMARY KEY (`f_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主键表';

-- ----------------------------
-- Records of t_id_table
-- ----------------------------
INSERT INTO `t_id_table` VALUES ('cms_ad', '7');
INSERT INTO `t_id_table` VALUES ('cms_ad_slot', '4');
INSERT INTO `t_id_table` VALUES ('cms_attribute', '6');
INSERT INTO `t_id_table` VALUES ('cms_collect', '2');
INSERT INTO `t_id_table` VALUES ('cms_comment', '17');
INSERT INTO `t_id_table` VALUES ('cms_friendlink', '22');
INSERT INTO `t_id_table` VALUES ('cms_friendlinktype', '6');
INSERT INTO `t_id_table` VALUES ('cms_guestbook', '29');
INSERT INTO `t_id_table` VALUES ('cms_guestbooktype', '5');
INSERT INTO `t_id_table` VALUES ('cms_info', '169');
INSERT INTO `t_id_table` VALUES ('cms_info_attribute', '410');
INSERT INTO `t_id_table` VALUES ('cms_info_membergroup', '141');
INSERT INTO `t_id_table` VALUES ('cms_info_node', '297');
INSERT INTO `t_id_table` VALUES ('cms_info_org', '71');
INSERT INTO `t_id_table` VALUES ('cms_info_special', '8');
INSERT INTO `t_id_table` VALUES ('cms_info_tag', '40');
INSERT INTO `t_id_table` VALUES ('cms_member_group', '2');
INSERT INTO `t_id_table` VALUES ('cms_model', '46');
INSERT INTO `t_id_table` VALUES ('cms_model_field', '676');
INSERT INTO `t_id_table` VALUES ('cms_node', '123');
INSERT INTO `t_id_table` VALUES ('cms_node_membergroup', '143');
INSERT INTO `t_id_table` VALUES ('cms_node_org', '63');
INSERT INTO `t_id_table` VALUES ('cms_node_role', '72');
INSERT INTO `t_id_table` VALUES ('cms_org', '3');
INSERT INTO `t_id_table` VALUES ('cms_role', '9');
INSERT INTO `t_id_table` VALUES ('cms_rolenode_info', '1');
INSERT INTO `t_id_table` VALUES ('cms_rolenode_node', '1');
INSERT INTO `t_id_table` VALUES ('cms_role_site', '2');
INSERT INTO `t_id_table` VALUES ('cms_scoreboard', '13');
INSERT INTO `t_id_table` VALUES ('cms_scoregroup', '3');
INSERT INTO `t_id_table` VALUES ('cms_scoreitem', '14');
INSERT INTO `t_id_table` VALUES ('cms_site', '9');
INSERT INTO `t_id_table` VALUES ('cms_special', '28');
INSERT INTO `t_id_table` VALUES ('cms_special_category', '7');
INSERT INTO `t_id_table` VALUES ('cms_tag', '77');
INSERT INTO `t_id_table` VALUES ('cms_task', '86');
INSERT INTO `t_id_table` VALUES ('cms_user', '10');
INSERT INTO `t_id_table` VALUES ('cms_user_membergroup', '8');
INSERT INTO `t_id_table` VALUES ('cms_user_org', '8');
INSERT INTO `t_id_table` VALUES ('cms_user_role', '8');
INSERT INTO `t_id_table` VALUES ('cms_visit_log', '335');
INSERT INTO `t_id_table` VALUES ('cms_vote', '2');
INSERT INTO `t_id_table` VALUES ('cms_vote_mark', '31');
INSERT INTO `t_id_table` VALUES ('cms_vote_option', '7');
INSERT INTO `t_id_table` VALUES ('cms_workflow', '3');
INSERT INTO `t_id_table` VALUES ('cms_workflowprocess_user', '1');
INSERT INTO `t_id_table` VALUES ('cms_workflowstep_role', '2');
INSERT INTO `t_id_table` VALUES ('cms_workflow_group', '3');
INSERT INTO `t_id_table` VALUES ('cms_workflow_step', '5');
INSERT INTO `t_id_table` VALUES ('plug_resume', '3');
