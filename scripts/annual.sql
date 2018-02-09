/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : chinasoft

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-02-09 10:46:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept_winning_rate
-- ----------------------------
DROP TABLE IF EXISTS `dept_winning_rate`;
CREATE TABLE `dept_winning_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '部门名称',
  `rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '获奖概率',
  `prizeCode` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '获奖级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of dept_winning_rate
-- ----------------------------
INSERT INTO `dept_winning_rate` VALUES ('1', '1', '2500', '3');
INSERT INTO `dept_winning_rate` VALUES ('2', '2', '2500', '3');
INSERT INTO `dept_winning_rate` VALUES ('3', '3', '2500', '3');
INSERT INTO `dept_winning_rate` VALUES ('4', '4', '2500', '3');
INSERT INTO `dept_winning_rate` VALUES ('5', '1', '2500', '2');
INSERT INTO `dept_winning_rate` VALUES ('6', '2', '2500', '2');
INSERT INTO `dept_winning_rate` VALUES ('7', '3', '2500', '2');
INSERT INTO `dept_winning_rate` VALUES ('8', '4', '2500', '2');
INSERT INTO `dept_winning_rate` VALUES ('9', '1', '2500', '1');
INSERT INTO `dept_winning_rate` VALUES ('10', '2', '2500', '1');
INSERT INTO `dept_winning_rate` VALUES ('11', '3', '2500', '1');
INSERT INTO `dept_winning_rate` VALUES ('12', '4', '2500', '1');
INSERT INTO `dept_winning_rate` VALUES ('13', '1', '2500', '4');
INSERT INTO `dept_winning_rate` VALUES ('14', '2', '2500', '4');
INSERT INTO `dept_winning_rate` VALUES ('15', '3', '2500', '4');
INSERT INTO `dept_winning_rate` VALUES ('16', '4', '2500', '4');
INSERT INTO `dept_winning_rate` VALUES ('17', '1', '2500', '5');
INSERT INTO `dept_winning_rate` VALUES ('18', '2', '2500', '5');
INSERT INTO `dept_winning_rate` VALUES ('19', '3', '2500', '5');
INSERT INTO `dept_winning_rate` VALUES ('20', '4', '2500', '5');

-- ----------------------------
-- Table structure for prize
-- ----------------------------
DROP TABLE IF EXISTS `prize`;
CREATE TABLE `prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品等级',
  `desc` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品描述',
  `count` smallint(5) unsigned NOT NULL COMMENT '奖品数量',
  `code` tinyint(3) unsigned NOT NULL COMMENT '奖品代号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='奖品设置';

-- ----------------------------
-- Records of prize
-- ----------------------------
INSERT INTO `prize` VALUES ('1', '一等奖', 'MateBookX一台', '3', '1');
INSERT INTO `prize` VALUES ('2', '二等奖', 'P8手机一部', '10', '2');
INSERT INTO `prize` VALUES ('3', '三等奖', '荣耀手环一条', '20', '3');
INSERT INTO `prize` VALUES ('7', '幸运奖', '', '20', '4');

-- ----------------------------
-- Table structure for sys_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_account`;
CREATE TABLE `sys_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '工号',
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `realname` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '真实姓名',
  `phoneNo` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `dept` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `district` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '地域',
  `level` tinyint(3) unsigned DEFAULT '0',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `lastHeartbeat` datetime DEFAULT NULL COMMENT '最后一次心跳时间',
  `onLineTime` int(10) unsigned DEFAULT NULL COMMENT '累计在线时长',
  `loginState` tinyint(3) unsigned DEFAULT '0' COMMENT '是否登录(0:未登录;1:登录)',
  `openid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '微信用户唯一标识',
  `fu1` int(11) DEFAULT NULL COMMENT '燃 个数',
  `fu2` int(11) DEFAULT NULL COMMENT '情 个数',
  `fu3` int(11) DEFAULT NULL COMMENT '小 个数',
  `fu4` int(11) DEFAULT NULL COMMENT '站 个数',
  `fu5` int(11) DEFAULT NULL COMMENT '合成 个数',
  `gotFu` int(11) DEFAULT '0' COMMENT '是否领取福奖',
  `remainRandomCount` int(11) DEFAULT NULL COMMENT '剩余抽奖次数',
  `nextRandomTime` datetime DEFAULT NULL COMMENT '下次抽奖时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2684 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='账户信息表';

-- ----------------------------
-- Records of sys_account
-- ----------------------------
INSERT INTO `sys_account` VALUES ('1', 'admin', '123', 'admin', '', '', '', '0', '2018-02-06 09:42:25', '2018-02-06 15:16:20', '0', '0', '', '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2189', '050907', null, '王维', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2190', '051356', null, '刘路', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2191', '051631', null, '周昕', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2192', '061115', null, '万克波', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2193', '060588', null, '辜义睿', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2194', '059404', null, '蒋朋家', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2195', '055336', null, '李学义', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2196', '052602', null, '向传勇', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2197', '051836', null, '何俊', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2198', '053638', null, '曾皓', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2199', '055754', null, '龙云波', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2200', '059288', null, '黄霞', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2201', '059644', null, '赵阳', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2202', '056466', null, '黄蓉', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2203', '061519', null, '周琴', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2204', '054912', null, '蒲坚', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2205', '052540', null, '夏梦德', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2206', '052531', null, '陈文', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2207', '041323', null, '于海龙', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2208', '053656', null, '张世强', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2209', '055408', null, '任秀丽', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2210', '056277', null, '谢昌秀', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2211', '066992', null, '赵磊', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2212', '067321', null, '殷艺伦', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2213', '066017', null, '张涛', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2214', '063117', null, '伍锐恒', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2215', '064177', null, '高寒', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2216', '064176', null, '王俊', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2217', '064171', null, '郑洲', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2218', '022317', null, '颜涛', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2219', '014568', null, '胥海勋', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2220', '011979', null, '章耀中', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2221', '037841', null, '金鑫', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2222', '033232', null, '薛雪', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2223', '031698', null, '任秋林', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2224', '034786', null, '潘杰', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2225', '035323', null, '丁俊', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2226', '034954', null, '黄鑫', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2227', '024350', null, '唐红', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2228', '028842', null, '许珂', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2229', '029795', null, '范彬彬', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2230', '031213', null, '王改萍', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2231', '004419', null, '张玉波', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2232', '004346', null, '伍伟', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2233', '004242', null, '白涛', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2234', '033458', null, '李小龙', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2235', '077233', null, '张涛', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2236', '073960', null, '何朝容', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2237', '079504', null, '何娟', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2238', '073283', null, '戴学锋', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2239', '069258', null, '刘学', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2240', '069331', null, '严正', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2241', '068512', null, '廖绍强', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2242', '068494', null, '黄彬', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2243', '067764', null, '刘桂花', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2244', '061574', null, '吴东艳', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2245', '064612', null, '蒋兰英', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2246', '034350', null, '任兴旺', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2247', '035619', null, '张静', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2248', '013745', null, '熊永兴', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2249', '003859', null, '邓丽', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2250', '007112', null, '邓超', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2251', '005913', null, '陈灵利', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2252', '029578', null, '卿翠', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2253', '030852', null, '童亮', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2254', '018516', null, '黄浩峰', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2255', '018524', null, '李旁', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2256', '035204', null, '梁波平', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2257', '035388', null, '刘宇强', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2258', '035800', null, '胡晓宇', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2259', '035809', null, '姜继雪', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2260', '035796', null, '周琳', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2261', '035797', null, '方立俊', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2262', '036288', null, '黄友丽', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2263', '032713', null, '胡晓', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2264', '032722', null, '唐朝朋', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2265', '032708', null, '郑成', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2266', '048865', null, '刘蓉', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2267', '048871', null, '李玲玉', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2268', '049485', null, '敬杰', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2269', '050454', null, '代龙', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2270', '046586', null, '曹玉梅', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2271', '045769', null, '周治强', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2272', '045896', null, '李伟', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2273', '046087', null, '易梦琳', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2274', '046905', null, '程祥', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2275', '041319', null, '杨庆', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2276', '045193', null, '王学永', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2277', '004124', null, '刘小军', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2278', '063315', null, '白双', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2279', '032472', null, '肖剑萍', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2280', '064182', null, '白杰', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2281', '062550', null, '文彦', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2282', '041671', null, '熊莉英', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2283', '079370', null, '赵倩', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2284', '078061', null, '李国勇', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2285', '014307', null, '费仕均', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2286', '018959', null, '田丹丹', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2287', '009684', null, '张俊', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2288', '062644', null, '余琼', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2289', '062191', null, '罗宏', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2290', '068556', null, '王浩', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2291', '067228', null, '毛荣生', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2292', '065960', null, '秦霜', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2293', '065685', null, '徐广林', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2294', '076406', null, '胡维果', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2295', '074435', null, '阳健辉', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2296', '073525', null, '任春林', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2297', '074622', null, '罗怀金', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2298', '064635', null, '卢梦洁', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2299', '006776', null, '王澜', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2300', '014120', null, '易燕', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2301', '011458', null, '田爽', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2302', '073747', null, '唐德林', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2303', '014331', null, '肖汉军', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2304', '044125', null, '夏红祥', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2305', '057519', null, '杨帆', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2306', '053828', null, '王孝笑', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2307', '054594', null, '丁楠', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2308', '055497', null, '帅小英', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2309', '057319', null, '姚敏', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2310', '059287', null, '刘婷', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2311', '057529', null, '彭培', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2312', '055743', null, '罗婷', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2313', '053338', null, '何秘', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2314', '052537', null, '赵娟', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2315', '050969', null, '李凡', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2316', '036141', null, '苏臻', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2317', '061557', null, '杨欢', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2318', '061532', null, '张佳超', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2319', '039915', null, '王炯', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2320', '040196', null, '陈玉峰', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2321', '047709', null, '张大明', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2322', '049867', null, '阳佳吕', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2323', '051056', null, '张发强', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2324', '054097', null, '何飞', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2325', '053122', null, '李晓丽', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2326', '053117', null, '龚琳', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2327', '052327', null, '杨江', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2328', '051607', null, '王娇娇', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2329', '051172', null, '黄静', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2330', '051173', null, '严清', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2331', '085291', null, '张宇阳', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2332', '085960', null, '杨鹰', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2333', '088342', null, '严家勇', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2334', '090738', null, '刘人萍', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2335', '090719', null, '杨婉珍', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2336', '090807', null, '曾磊', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2337', '088603', null, '冯鑫', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2338', '092262', null, '陈妮', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2339', '100529', null, '王海怀', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2340', '100530', null, '刘妍汝', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2341', '100533', null, '张凯', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2342', '100534', null, '周玲玲', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2343', '100535', null, '罗海', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2344', '100531', null, '唐知庚', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2345', '100528', null, '刘涛', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2346', '100503', null, '李俊', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2347', '100532', null, '邹敏', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2348', '106082', null, '马晓', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2349', '111424', null, '鲜韵豪', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2350', '113059', null, '黄文丰', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2351', '127521', null, '鲜菲', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2352', '127675', null, '郝云凯', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2353', '114778', null, '张大成', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2354', '115294', null, '叶正江', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2355', '126938', null, '张敏', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2356', '126939', null, '刘晓', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2357', '115102', null, '李鹏', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2358', '127585', null, '王兴政', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2359', '127765', null, '刘冬', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2360', '127734', null, '黄菊花', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2361', '127677', null, '徐成', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2362', '127502', null, '曾涛', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2363', '114936', null, '陈蕾', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2364', '128070', null, '左欢', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2365', '128054', null, '田林', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2366', '129843', null, '祝翔龙', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2367', '129796', null, '唐国庆', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2368', '129966', null, '张云川', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2369', '129303', null, '傅仪', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2370', '130021', null, '黄一峰', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2371', '128369', null, '张纯', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2372', '027329', null, '佀庆磊', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2373', '046904', null, '池辽', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2374', '044575', null, '陈勇', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2375', '032315', null, '蔡小玲', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2376', '035316', null, '蹇川', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2377', '030323', null, '林薛鹏', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2378', '031347', null, '伍龙军', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2379', '031796', null, '牟小亮', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2380', '031819', null, '王波', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2381', '031037', null, '陈超', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2382', '030913', null, '李万', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2383', '005159', null, '陈文超', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2384', '035566', null, '张淼', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2385', '033866', null, '张钰', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2386', '033909', null, '李兵', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2387', '032462', null, '胡斌', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2388', '044379', null, '杜利平', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2389', '032468', null, '胡诚', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2390', '033758', null, '周思睿', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2391', '034288', null, '丁亚', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2392', '034346', null, '王应斌', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2393', '035747', null, '罗爽', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2394', '035799', null, '李强', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2395', '023991', null, '张耀杰', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2396', '028363', null, '王书雄', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2397', '028947', null, '甘云峰', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2398', '031298', null, '邱实', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2399', '031378', null, '吴强', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2400', '031500', null, '汪洪春', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2401', '027359', null, '唐宜强', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2402', '033247', null, '熊岑晨', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2403', '035203', null, '段超', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2404', '027357', null, '胡超', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2405', '029794', null, '袁笛', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2406', '034952', null, '何柯臻', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2407', '036144', null, '刘玉梅', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2408', '035795', null, '郭鹏飞', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2409', '034550', null, '刘棚', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2410', '032876', null, '文强', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2411', '045888', null, '张欢', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2412', '005603', null, '郭波梅', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2413', '031933', null, '何松泽', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2414', '075676', null, '张秉乾', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2415', '071514', null, '汪骥驰', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2416', '070634', null, '门保江', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2417', '067844', null, '张立', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2418', '067670', null, '吴刚', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2419', '066674', null, '廖凤丹', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2420', '064991', null, '梁志', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2421', '065163', null, '何俊达', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2422', '064180', null, '杨帆', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2423', '019729', null, '张军', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2424', '014607', null, '向锐', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2425', '011826', null, '贺勇', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2426', '064911', null, '王森', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2427', '068524', null, '张明鸣', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2428', '069906', null, '王生荣', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2429', '016323', null, '蒲海儿', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2430', '022426', null, '张邹', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2431', '066981', null, '赵琪', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2432', '066274', null, '张虎', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2433', '066500', null, '宋洋', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2434', '067669', null, '黄雪梅', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2435', '064655', null, '吴玲萍', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2436', '069141', null, '卢家涛', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2437', '074336', null, '高萍', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2438', '070640', null, '张语宸', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2439', '064628', null, '康曦', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2440', '008948', null, '汪瑜', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2441', '016503', null, '郭志刚', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2442', '014888', null, '李晓东', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2443', '063731', null, '孙桥梁', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2444', '012371', null, '张佳丽', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2445', '076765', null, '陈泳杉', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2446', '021716', null, '楚天舒', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2447', '022586', null, '周景龙', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2448', '072362', null, '唐亮', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2449', '059076', null, '廖家志', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2450', '058563', null, '胡定超', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2451', '057540', null, '李小军', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2452', '057397', null, '廖泽明', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2453', '054575', null, '杨显强', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2454', '055211', null, '陈睿智', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2455', '056345', null, '田代茂', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2456', '053119', null, '张永恒', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2457', '050035', null, '肖龙', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2458', '049604', null, '白阳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2459', '046094', null, '陈献章', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2460', '043892', null, '陈超', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2461', '043232', null, '袁涛', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2462', '039832', null, '查银锋', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2463', '040836', null, '金涛', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2464', '041052', null, '张良', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2465', '038931', null, '张强', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2466', '036873', null, '赵浪进', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2467', '035880', null, '周泽乾', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2468', '036450', null, '孟洧生', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2469', '041048', null, '彭冬明', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2470', '040546', null, '赵云飞', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2471', '047919', null, '李光久', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2472', '049209', null, '陈阳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2473', '052763', null, '赵界', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2474', '057527', null, '陈苏毅', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2475', '046165', null, '刘朋', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2476', '040198', null, '杨丁睿', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2477', '042197', null, '米阳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2478', '039750', null, '罗友雄', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2479', '039125', null, '陈川龙', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2480', '039127', null, '王英学', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2481', '037193', null, '雷素', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2482', '037798', null, '边娇娇', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2483', '036049', null, '刘峰', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2484', '044130', null, '何梁军', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2485', '041557', null, '肖云敏', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2486', '046658', null, '李鑫', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2487', '053250', null, '李於平', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2488', '056584', null, '周维川', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2489', '043756', null, '曾俊', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2490', '036777', null, '李翠莲', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2491', '060432', null, '伍珂妮', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2492', '061544', null, '张洋华', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2493', '039397', null, '陈林莎', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2494', '038930', null, '王乐熙', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2495', '036686', null, '李国彬', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2496', '040628', null, '张英', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2497', '040108', null, '曾朝阳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2498', '040193', null, '彭青', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2499', '048491', null, '陈舒帆', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2500', '048053', null, '张光琪', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2501', '050251', null, '姜鹏', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2502', '055855', null, '贺嘉雪', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2503', '055493', null, '滕谨临', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2504', '051050', null, '蒲彬', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2505', '058595', null, '王莉', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2506', '054561', null, '陈晓梅', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2507', '043417', null, '徐婷', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2508', '059089', null, '张艺娟', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2509', '038327', null, '陈俊龙', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2510', '038606', null, '慕聪', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2511', '088814', null, '钟焕芳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2512', '087890', null, '于晓慧', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2513', '090915', null, '楼凯炜', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2514', '090730', null, '彭波', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2515', '090717', null, '唐锦波', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2516', '090788', null, '胡明全', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2517', '090765', null, '匡攀', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2518', '090771', null, '陆斌', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2519', '090774', null, '代卓昱', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2520', '090777', null, '张雨鹏', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2521', '090779', null, '章元源', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2522', '090800', null, '曾维龙', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2523', '090805', null, '胡洪籍', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2524', '090755', null, '陈玲', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2525', '090793', null, '鲁江波', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2526', '089611', null, '郭安然', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2527', '091346', null, '王东', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2528', '095340', null, '严露露', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2529', '111423', null, '田阳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2530', '111127', null, '刘学涛', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2531', '112536', null, '严海浪', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2532', '112667', null, '罗潇', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2533', '112558', null, '杨颖', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2534', '114437', null, '陈佳霖', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2535', '114523', null, '袁海龙', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2536', '112960', null, '杨健', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2537', '112858', null, '王成皓', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2538', '112861', null, '倪俊洋', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2539', '113064', null, '高培智', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2540', '113051', null, '李鹏程', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2541', '114932', null, '邓乐', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2542', '127874', null, '卢彤', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2543', '129599', null, '罗雁', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2544', '127407', null, '夏蕾', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2545', '044459', null, '钟晓龙', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2546', '044974', null, '罗俊', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2547', '044373', null, '欧粮华', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2548', '046444', null, '王亦君', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2549', '049427', null, '杨婷', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2550', '046913', null, '黄俊杰', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2551', '050389', null, '刘涛', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2552', '053457', null, '向伟', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2553', '060594', null, '石舒虹', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2554', '067423', null, '罗锡彬', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2555', '065374', null, '张天兵', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2556', '052447', null, '邓杨', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2557', '077852', null, '范义东', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2558', '073262', null, '刘海', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2559', '067972', null, '杭元元', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2560', '060342', null, '漆康', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2561', '057520', null, '杜朋来', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2562', '073897', null, '刘宇阳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2563', '072358', null, '徐文洁', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2564', '080799', null, '吕莎', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2565', '078697', null, '吴越', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2566', '073261', null, '吴贞毅', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2567', '075675', null, '李珍珍', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2568', '057518', null, '杨蕤', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2569', '057530', null, '李中正', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2570', '057515', null, '钱豪', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2571', '061566', null, '胡媛', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2572', '064173', null, '张敏', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2573', '064418', null, '王玉兰', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2574', '048511', null, '牟健', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2575', '040960', null, '黄勇', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2576', '040623', null, '罗承勇', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2577', '045025', null, '陈小军', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2578', '045208', null, '卢栋东', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2579', '042809', null, '凌俊', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2580', '041324', null, '李林', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2581', '041523', null, '王琰锋', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2582', '041620', null, '陈永松', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2583', '039615', null, '曾建芬', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2584', '039749', null, '李潘', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2585', '070483', null, '罗昌梅', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2586', '039046', null, '陈洪桂', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2587', '036940', null, '刘巧红', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2588', '004328', null, '唐正洪', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2589', '004415', null, '蒲代红', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2590', '009580', null, '吕家闻', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2591', '035387', null, '彭伟', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2592', '039586', null, '白杰', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2593', '006048', null, '吴观香', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2594', '031744', null, '马双华', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2595', '027241', null, '崔晶晶', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2596', '008816', null, '梁倩', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2597', '036305', null, '钟超', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2598', '038780', null, '罗军', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2599', '039047', null, '钱华军', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2600', '034332', null, '林凤明', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2601', '039049', null, '彭佳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2602', '037945', null, '左倩', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2603', '034917', null, '蒋伟', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2604', '039050', null, '李军', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2605', '017912', null, '鲍晓平', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2606', '015409', null, '杜慧', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2607', '006029', null, '钟睿', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2608', '011120', null, '邹开利', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2609', '011828', null, '陈方敏', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2610', '030949', null, '江西堂', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2611', '031932', null, '李建', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2612', '029854', null, '文敏', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2613', '029963', null, '涂欢', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2614', '030042', null, '杨淇瑚', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2615', '026165', null, '杨海', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2616', '026382', null, '杨柳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2617', '028256', null, '郭中原', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2618', '018957', null, '陈星豪', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2619', '022699', null, '陈云', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2620', '021930', null, '何宗云', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2621', '011830', null, '王霞', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2622', '013875', null, '谭承军', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2623', '011456', null, '杨婷', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2624', '008225', null, '兰东', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2625', '004255', null, '吕小亮', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2626', '005602', null, '杜敏', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2627', '010393', null, '伍东海', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2628', '012348', null, '赵婷', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2629', '017905', null, '孙科', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2630', '016791', null, '艾正武', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2631', '016282', null, '谢仲阳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2632', '039045', null, '肖智', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2633', '038781', null, '陈华', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2634', '039598', null, '刘艳', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2635', '039585', null, '尹君', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2636', '039605', null, '凡亮', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2637', '014162', null, '陈乐天', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2638', '012166', null, '钟波', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2639', '014308', null, '修申龙', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2640', '014621', null, '钟健', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2641', '017730', null, '王圣杨', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2642', '018532', null, '徐伟力', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2643', '020374', null, '肖春梅', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2644', '004114', null, '陈家彬', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2645', '013005', null, '朱文刚', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2646', '086327', null, '罗程', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2647', '085052', null, '石小龙', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2648', '081324', null, '黄锐', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2649', '085802', null, '苏幻', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2650', '087176', null, '黄子宽', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2651', '088338', null, '陶进', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2652', '090746', null, '周敖', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2653', '090804', null, '杨楠', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2654', '090292', null, '肖婷', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2655', '090748', null, '胡胜', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2656', '090749', null, '徐素曼', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2657', '090722', null, '龙芸', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2658', '090806', null, '张晓思', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2659', '090808', null, '张夏雨', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2660', '090809', null, '李晗', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2661', '090811', null, '许凤杰', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2662', '090783', null, '谢天峰', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2663', '090332', null, '向俞霖', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2664', '096122', null, '王帮云', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2665', '096708', null, '宋文浩', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2666', '091546', null, '曾波', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2667', '107540', null, '熊晓梅', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2668', '110796', null, '刘敏', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2669', '111359', null, '杨小琴', null, '1', '无线平台事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2670', '007039', null, '向玉莲', null, '1', 'HRBP部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2671', '005766', null, '刘霞', null, '1', 'HRBP部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2672', '052982', null, '古菊红', null, '1', 'HRBP部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2673', '059643', null, '樊浪', null, '1', 'HRBP部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2674', '078057', null, '王艺璇', null, '1', '项目管理与质量部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2675', '074436', null, '朱磊', null, '1', '项目管理与质量部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2676', '064644', null, '张翠翠', null, '1', '项目管理与质量部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2677', '014276', null, '张晓宇', null, '1', '无线产品事业部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2678', '011682', null, '何飞', null, '1', '项目管理与质量部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2679', '046091', null, '熊媛', null, '1', '项目管理与质量部', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2680', '062446', null, '刘琴', null, '1', '秘书科', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2681', '068201', null, '林世娜', null, '1', '秘书科', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2682', '035393', null, '胡彦艳', null, '1', '秘书科', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');
INSERT INTO `sys_account` VALUES ('2683', '103757', null, '童琴', null, '1', '秘书科', '0', null, null, null, '0', null, '0', '0', '0', '0', '0', '0', '39', '2018-02-08 11:30:00');

-- ----------------------------
-- Table structure for sys_account_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_copy`;
CREATE TABLE `sys_account_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '工号',
  `password` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `realname` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '真实姓名',
  `phoneNo` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `dept` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `district` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '地域',
  `level` tinyint(3) unsigned DEFAULT '0',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `lastHeartbeat` datetime DEFAULT NULL COMMENT '最后一次心跳时间',
  `onLineTime` int(10) unsigned DEFAULT NULL COMMENT '累计在线时长',
  `loginState` tinyint(3) unsigned DEFAULT '0' COMMENT '是否登录(0:未登录;1:登录)',
  `openid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '微信用户唯一标识',
  `fu1` int(11) DEFAULT NULL COMMENT '燃 个数',
  `fu2` int(11) DEFAULT NULL COMMENT '情 个数',
  `fu3` int(11) DEFAULT NULL COMMENT '小 个数',
  `fu4` int(11) DEFAULT NULL COMMENT '站 个数',
  `fu5` int(11) DEFAULT NULL COMMENT '合成 个数',
  `gotFu` int(11) DEFAULT '0' COMMENT '是否领取福奖',
  `remainRandomCount` int(11) DEFAULT NULL COMMENT '剩余抽奖次数',
  `nextRandomTime` datetime DEFAULT NULL COMMENT '下次抽奖时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1694 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='账户信息表';

-- ----------------------------
-- Records of sys_account_copy
-- ----------------------------
INSERT INTO `sys_account_copy` VALUES ('1455', 'admin', 'admin123', 'admin', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, '0', null, '2018-02-07 23:09:24');
INSERT INTO `sys_account_copy` VALUES ('1456', '00381404', '00381404', '代传龙', '829322851', '3', '海外', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1457', '00418897', '00418897', '王淳', '7948017659', '2', '海外', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1458', '00363998', '00363998', '李文龙', '13684029485', '1', '海外', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1459', '00341462', '00341462', '张君', '13980728465', '4', '海外', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1460', '00201242', '00201242', '孙璐苹', '13908171981', '3', '海外', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1461', '00178205', '00178205', '陈超', '583956160', '4', '海外', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1462', '00329807', '00329807', '许慧', '15108298653', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1463', '00266479', '00266479', '代辉', '18180810991', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1464', '00404923', '00404923', '牟和平', '13541073052', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1465', '00351317', '00351317', '刘婷', '13699441640', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1466', '00387002', '00387002', '潘峰', '15608200308', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1467', '00369346', '00369346', '安勇', '18982024433', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1468', '00207442', '00207442', '罗雁冰', '18180429101', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1469', '00333052', '00333052', '秦钰昆', '13551168566', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1470', '00425506', '00425506', '陈书书', '18782977341', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1471', '00425745', '00425745', '姚家雄', '17621627896', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1472', '00425295', '00425295', '张婷婷', '18782976489', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1473', '00423913', '00423913', '王辉', '18717887681', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1474', '00424038', '00424038', '高超', '18328005388', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1475', '00424028', '00424028', '张奎', '18280389672', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1476', '00422865', '00422865', '吴曦', '18280389672', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1477', '00339936', '00339936', '覃燕敏', '13761336989', '1', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1478', '00364219', '00364219', '闻勋颖', '18621711310', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1479', '00358511', '00358511', '蔡文洲', '13816828957', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1480', '00337063', '00337063', '孙晓光', '13764823301', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1481', '00421707', '00421707', '余婷', '13541128974', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1482', '00421173', '00421173', '杜光宇', '15982365005', '4', '出差', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1483', '00292181', '00292181', '石子娟', '17740807675', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1484', '00284381', '00284381', '孙科健', '18980897090', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1485', '00398230', '00398230', '王敏', '18502887453', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1486', '00417222', '00417222', '鲁江波', '13730669089', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1487', '00402479', '00402479', '彭劲东', '13882096415', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1488', '00401713', '00401713', '肖克祥', '13699441767', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1489', '00398122', '00398122', '赵兴宇', '18086833078', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1490', '00397253', '00397253', '孙靖', '18602868547', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1491', '00425434', '00425434', '马天辉', '13611840473', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1492', '00390424', '00390424', '盛昊', '15601868586', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1493', '00388082', '00388082', '胡挺', '17396260712', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1494', '00388010', '00388010', '刘清彬', '18602830715', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1495', '00387766', '00387766', '孙超', '15184430135', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1496', '00423908', '00423908', '王宁', '17621745699', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1497', '00387077', '00387077', '黄海', '18980406675', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1498', '00422680', '00422680', '王飞', '13438375385', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1499', '00386694', '00386694', '贺峻', '18602815210', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1500', '00386609', '00386609', '彭万彬', '15198251278', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1501', '00386394', '00386394', '邴立东', '15882242424', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1502', '00384073', '00384073', '徐茂涛', '18980487436', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1503', '00382699', '00382699', '曾年', '18628173679', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1504', '00382679', '00382679', '施钻专', '13764816418', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1505', '00382642', '00382642', '郑文三', '13320983304', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1506', '00382602', '00382602', '武俊青', '18080120576', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1507', '00381259', '00381259', '李堂艳', '15813744343', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1508', '00381151', '00381151', '母海兵', '18981733497', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1509', '00274969', '00274969', '汤志平', '18602157533', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1510', '00349848', '00349848', '顾闻', '18017637828', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1511', '00380580', '00380580', '丁鑫鑫', '18030689291', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1512', '00380198', '00380198', '周越', '18215615708', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1513', '00379982', '00379982', '王豪', '18382205937', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1514', '00379848', '00379848', '吴瑶', '18190883971', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1515', '00379832', '00379832', '夏天立', '17380122091', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1516', '00378904', '00378904', '张青婷', '13540866891', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1517', '00378823', '00378823', '徐加文', '18328510556', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1518', '00377853', '00377853', '李潇', '18081061206', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1519', '00377823', '00377823', '周子博', '15802898552', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1520', '00377819', '00377819', '杨青山', '18215624577', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1521', '00377766', '00377766', '罗骥', '15680888963', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1522', '00376773', '00376773', '舒云', '13666127783', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1523', '00376715', '00376715', '熊竞', '18180767136', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1524', '00347360', '00347360', '张志佼', '15921591245', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1525', '00375725', '00375725', '于江', '18908183045', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1526', '00375471', '00375471', '赵娟', '18140133161', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1527', '00375663', '00375663', '陈轶', '13688061922', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1528', '00375661', '00375661', '刘艺', '13348853283', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1529', '00375542', '00375542', '黎刚', '13880641001', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1530', '00375015', '00375015', '石祥', '15982025600', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1531', '00374985', '00374985', '雷宁凡', '13880039911', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1532', '00372587', '00372587', '古显耀', '15982208526', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1533', '00372540', '00372540', '王黔川', '13558872577', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1534', '00372339', '00372339', '王艳', '15528282728', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1535', '00371862', '00371862', '张中理', '17323198079', '4', '出差', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1536', '00418883', '00418883', '王鹏', '18516129167', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1537', '00369354', '00369354', '杨岩磊', '13541364390', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1538', '00367123', '00367123', '赵培', '18054796820', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1539', '00364330', '00364330', '罗维东', '13402804163', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1540', '00364230', '00364230', '朱宁', '18980654327', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1541', '00285082', '00285082', '周妍', '13636315978', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1542', '00364000', '00364000', '郑颖', '13880079779', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1543', '00363940', '00363940', '刘仁崇', '18086813705', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1544', '00267880', '00267880', '徐超', '13817268147', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1545', '00355879', '00355879', '刘博', '18483667934', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1546', '00354542', '00354542', '谭梦然', '13882081945', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1547', '00353572', '00353572', '申甦祺', '15008210903', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1548', '00351868', '00351868', '巫素', '15608087661', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1549', '00351272', '00351272', '唐溧', '18688728072', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1550', '00340773', '00340773', '朱伟', '18621180761', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1551', '00380980', '00380980', '何明均', '13730624642', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1552', '00335454', '00335454', '张勇', '18616935031', '2', '上海', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1553', '00342877', '00342877', '杨照宇', '18030587518', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1554', '00286667', '00286667', '洪劲松', '13689048783', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1555', '00341460', '00341460', '杨俊卿', '15982126610', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1556', '00341459', '00341459', '马利民', '18011373721', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1557', '00391840', '00391840', '付维翔', '13688110019', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1558', '00337453', '00337453', '李胜兰', '13880959794', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1559', '00337278', '00337278', '牛晓莉', '15102829340', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1560', '00337245', '00337245', '张贤均', '13398177511', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1561', '00274507', '00274507', '俞新民', '15928849772', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1562', '00334003', '00334003', '何志访', '18780290874', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1563', '00333571', '00333571', '罗瑶', '13880728014', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1564', '00334260', '00334260', '袁权', '18608026906', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1565', '00424273', '00424273', '李力行', '15608171516', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1566', '00380910', '00380910', '游燕珍', '18982166784', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1567', '00274976', '00274976', '张军', '15828534174', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1568', '00316971', '00316971', '叶波', '18180573308', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1569', '00210943', '00210943', '高翔', '18190949221', '2', '出差', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1570', '00302805', '00302805', '王宏舟', '18582580309', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1571', '00302719', '00302719', '刘佳奇', '18080919377', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1572', '00302545', '00302545', '李斌', '18684015915', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1573', '00302667', '00302667', '陈桂林', '13699470403', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1574', '00299437', '00299437', '王小亮', '18728461858', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1575', '00440610', '00440610', '张伟', '13880027246', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1576', '00289424', '00289424', '杨超', '13980032104', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1577', '00303310', '00303310', '席辉', '15982128958', '2', '成都', '4', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1578', '00287359', '00287359', '姚婷', '13551133760', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1579', '00286218', '00286218', '陈斌', '18908184978', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1580', '00286150', '00286150', '赵吉英', '13880523811', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1581', '00286059', '00286059', '姜伟', '18030596773', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1582', '00286012', '00286012', '刘雁林', '18048597026', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1583', '00285226', '00285226', '黄宇明', '18402886425', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1584', '00342889', '00342889', '刘金华', '13980620361', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1585', '00287485', '00287485', '熊彬', '18980641649', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1586', '00282870', '00282870', '张明', '13661999904', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1587', '00282186', '00282186', '翟孝军', '15108461467', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1588', '00179092', '00179092', '曾礼君', '17608040228', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1589', '00376277', '00376277', '罗鹏', '18081988295', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1590', '00341461', '00341461', '任邛涛', '13693493907', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1591', '00274441', '00274441', '高新志', '18908216649', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1592', '00372119', '00372119', '张旻', '18160012975', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1593', '00371855', '00371855', '邓桦', '13980460956', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1594', '00266603', '00266603', '钟昭', '18628003866', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1595', '00265234', '00265234', '黄磊', '720488923', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1596', '00254908', '00254908', '陈伦', '13980969380', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1597', '00167377', '00167377', '易秦', '17380121109', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1598', '00250116', '00250116', '李丹凤', '18980637535', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1599', '00248539', '00248539', '宁望涛', '13547932137', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1600', '00245754', '00245754', '吴禹', '15828061180', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1601', '00244792', '00244792', '蔡寿祥', '13348893255', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1602', '00239616', '00239616', '张鹏', '18081049010', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1603', '00227637', '00227637', '李叶明', '13541372368', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1604', '00227602', '00227602', '廖义娟', '18349291526', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1605', '00225765', '00225765', '张若时', '18010528893', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1606', '00225761', '00225761', '邓茜', '13308174277', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1607', '00225686', '00225686', '郭杰', '18780052077', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1608', '00225660', '00225660', '刘显强', '13550316688', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1609', '00223401', '00223401', '吕涛', '13880049368', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1610', '00223381', '00223381', '王磊', '17780730062', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1611', '00221443', '00221443', '邹洪伟', '15829362653', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1612', '00221064', '00221064', '赖寒冰', '18628267020', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1613', '00221060', '00221060', '阮志锋', '13648004017', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1614', '00220057', '00220057', '李建锋', '17358519862', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1615', '00219501', '00219501', '刘佳', '8034756995', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1616', '00418982', '00418982', '孙强', '18980079176', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1617', '00215515', '00215515', '王泉', '13902472347', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1618', '00211383', '00211383', '聂采毅', '17796487545', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1619', '00268313', '00268313', '唐瑜键', '17780617387', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1620', '00210172', '00210172', '赵述军', '18328337210', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1621', '00209602', '00209602', '宁小科', '18190878533', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1622', '00209302', '00209302', '闫涛', '18983355994', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1623', '00208943', '00208943', '田悦', '13981802607', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1624', '00208413', '00208413', '罗斌', '18980974917', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1625', '00207629', '00207629', '何加波', '18682554433', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1626', '00207444', '00207444', '孟凡右', '18180516769', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1627', '00387720', '00387720', '谢梦', '13518109514', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1628', '00204423', '00204423', '郑凤媛', '18980709194', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1629', '00204038', '00204038', '杨权', '13438050117', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1630', '00204000', '00204000', '朱志朋', '15208383930', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1631', '00202837', '00202837', '罗启林', '13618044211', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1632', '00202691', '00202691', '王元明', '18080491826', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1633', '00201754', '00201754', '邓明', '13028164836', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1634', '00201327', '00201327', '张林', '13540781538', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1635', '00201243', '00201243', '周勇志', '18702854977', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1636', '00201138', '00201138', '滕志超', '13730802680', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1637', '00200901', '00200901', '姜鹏程', '18190785882', '3', '出差', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1638', '00200245', '00200245', '刘人齐', '18628317767', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1639', '00198572', '00198572', '王强', '18980906042', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1640', '00198552', '00198552', '任祥贵', '18084811292', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1641', '00196240', '00196240', '金勇均', '18780016037', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1642', '00195439', '00195439', '李安安', '13688058275', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1643', '00195352', '00195352', '袁号', '18628358212', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1644', '00195149', '00195149', '晋峥', '13882298800', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1645', '00191919', '00191919', '祝仰伟', '15802829983', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1646', '00191545', '00191545', '张梅', '17340170211', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1647', '00190883', '00190883', '何其钰', '17708103592', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1648', '00190521', '00190521', '乔梁', '18000523152', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1649', '00190370', '00190370', '胡家豪', '18008046803', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1650', '00189183', '00189183', '邝秀玉', '15884445638', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1651', '00188890', '00188890', '董振奇', '13730668086', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1652', '00330987', '00330987', '杨洪涛', '18080949080', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1653', '00178112', '00178112', '程勇', '18681224169', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1654', '00176309', '00176309', '邓先武', '13708088293', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1655', '00171446', '00171446', '卢建', '15882110184', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1656', '00170052', '00170052', '陈丽容', '17381800413', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1657', '00170050', '00170050', '李毓蕙', '18981964327', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1658', '00170008', '00170008', '蒲星宇', '13551066339', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1659', '00169666', '00169666', '龚长松', '13880611531', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1660', '00169553', '00169553', '李广俊', '13408557122', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1661', '00169046', '00169046', '邵明义', '15882476021', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1662', '00168760', '00168760', '陈炜', '18981945870', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1663', '00168601', '00168601', '何承玺', '13908091329', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1664', '00168538', '00168538', '陈辞', '18108045781', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1665', '00168381', '00168381', '刘鉴旭', '13518135499', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1666', '00168357', '00168357', '汪志刚', '18583260373', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1667', '00334955', '00334955', '田路', '18190836521', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1668', '00364739', '00364739', '陈晓', '17828060388', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1669', '00168081', '00168081', '邹畅', '18981860855', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1670', '00167629', '00167629', '叶茂', '13980970220', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1671', '00250186', '00250186', '张霄龙', '18502805195', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1672', '00205225', '00205225', '石庆彬', '18615748765', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1673', '00337387', '00337387', '罗璟真', '7584475171', '4', '出差', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1674', '00436520', '00436520', '张梅胜蓝', '18080951139', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1675', '00300535', '00300535', '钟林栖', '13618036263', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1676', '00439580', '00439580', '王昕', '18680380931', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1677', '00439473', '00439473', '叶建荣', '17360022048', '3', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1678', '00439372', '00439372', '付学智', '13688407305', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1679', '00439973', '00439973', '杜鑫', '17745027991', '2', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1680', '00230876', '00230876', '周光波', '13568878071', '4', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1681', '00375446', '00375446', '王英', '18628205647', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1682', '00265857', '00265857', '龙河冰', '13438890753', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1683', '00415194', '00415194', '胡霞 ', '18980698539', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1684', '00369175', '00369175', '程宇', '13880612649', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1685', '00335099', '00335099', '彭灵芝', '18328349233', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1686', '00364289', '00364289', '莫小林', '18116562468', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1687', '00288078', '00288078', '王艳丽', '13683497508', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1688', '00375328', '00375328', '卓熹', '18628168215', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1689', '00375760', '00375760', '钟荣敏', '18982056064', '1', '成都', '0', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1690', 'WX531815', 'WX531815', '刘晓', '15928754238', '1', '成都', '4', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1691', 'zwx317834', 'zwx317834', '周昕', '15982095345', '1', '成都', '4', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1692', 'rwx332254', 'rwx332254', '任秀丽', '13618081980', '1', '成都', '4', null, null, null, '0', null, null, null, null, null, null, '0', null, null);
INSERT INTO `sys_account_copy` VALUES ('1693', 'hwx337064', 'hwx337064', '黄蓉', '18511835269', '1', '成都', '4', null, null, null, '0', null, null, null, null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for sys_account_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_role`;
CREATE TABLE `sys_account_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT=' 账户角色关系表';

-- ----------------------------
-- Records of sys_account_role
-- ----------------------------
INSERT INTO `sys_account_role` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for sys_fu
-- ----------------------------
DROP TABLE IF EXISTS `sys_fu`;
CREATE TABLE `sys_fu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '名称',
  `totalCount` int(11) NOT NULL DEFAULT '0' COMMENT '总量',
  `remainCount` int(11) NOT NULL DEFAULT '0' COMMENT '余量',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '权重，即概率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT=' 账户角色关系表';

-- ----------------------------
-- Records of sys_fu
-- ----------------------------
INSERT INTO `sys_fu` VALUES ('1', '燃', '10', '10', '5');
INSERT INTO `sys_fu` VALUES ('2', '情', '33', '33', '25');
INSERT INTO `sys_fu` VALUES ('3', '小', '33', '33', '25');
INSERT INTO `sys_fu` VALUES ('4', '站', '33', '33', '25');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ADMIN');
INSERT INTO `sys_role` VALUES ('2', 'CUSTOMER');

-- ----------------------------
-- Table structure for winning_record
-- ----------------------------
DROP TABLE IF EXISTS `winning_record`;
CREATE TABLE `winning_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL COMMENT '获奖账户',
  `prizeCode` int(11) NOT NULL COMMENT '奖品',
  `received` tinyint(3) unsigned NOT NULL COMMENT '是否领取(0:未领取;1:领取)',
  `time` datetime NOT NULL COMMENT '领取时间',
  `confirm` tinyint(3) NOT NULL DEFAULT '0' COMMENT '领奖标识（1为已领取，0为未领取）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='中奖记录';

-- ----------------------------
-- Records of winning_record
-- ----------------------------
