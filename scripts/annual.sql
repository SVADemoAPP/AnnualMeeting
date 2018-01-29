-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.40 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4833
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for annual
CREATE DATABASE IF NOT EXISTS `annual` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `annual`;


-- Dumping structure for table annual.sys_account
CREATE TABLE `sys_account` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NOT NULL COMMENT '工号' COLLATE 'utf8_bin',
	`password` VARCHAR(50) NOT NULL COMMENT '密码' COLLATE 'utf8_bin',
	`realname` VARCHAR(50) NOT NULL COMMENT '真实姓名' COLLATE 'utf8_bin',
	`phoneNo` VARCHAR(50) NOT NULL COMMENT '电话号码' COLLATE 'utf8_bin',
	`dept` VARCHAR(50) NOT NULL COMMENT '部门' COLLATE 'utf8_bin',
	`level` TINYINT(3) UNSIGNED NULL DEFAULT '0' COMMENT '员工级别',
	`lastLoginTime` DATETIME NULL DEFAULT NULL COMMENT '最后一次登录时间',
	`lastHeartbeat` DATETIME NULL DEFAULT NULL COMMENT '最后一次心跳时间',
	`onLineTime` INT(10) UNSIGNED NOT NULL COMMENT '累计在线时长',
	`loginState` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否登录(0:未登录;1:登录)',
	`openid` VARCHAR(50) NOT NULL COMMENT '微信用户唯一标识' COLLATE 'utf8_bin',
	`fu1` INT(11) NOT NULL COMMENT '燃 个数',
	`fu2` INT(11) NOT NULL COMMENT '情 个数',
	`fu3` INT(11) NOT NULL COMMENT '小 个数',
	`fu4` INT(11) NOT NULL COMMENT '站 个数',
	`fu5` INT(11) NOT NULL COMMENT '合成 个数',
	`gotFu` INT(11) NOT NULL DEFAULT '0' COMMENT '是否领取福奖',
	`remainRandomCount` INT(11) NOT NULL COMMENT '剩余抽奖次数',
	`nextRandomTime` DATETIME NOT NULL COMMENT '下次抽奖时间',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `username` (`username`)
)
COMMENT='账户信息表'
COLLATE='utf8_bin'
ENGINE=InnoDB
AUTO_INCREMENT=1;



INSERT INTO `sys_account` (`id`, `username`, `password`, `realname`, `phoneNo`, `dept`, `lastLoginTime`, `lastHeartbeat`, `onLineTime`, `loginState`, `openid`, `fu1`, `fu2`, `fu3`, `fu4`, `fu5`, `gotFu`, `remainRandomCount`, `nextRandomTime`) VALUES
    (1, 'admin', 'admin@123', '管理员', '', '', NULL, NULL, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (2, '283823', '1234', '王俊', '13535356666', 'AE', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (3, '283824', '1234', '王俊2', '13535356666', 'AE', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (4, '283825', '1234', '王俊3', '13535356666', 'AE', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (5, '283826', '1234', '王俊4', '13535356666', 'AE', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (6, '283827', '1234', '王俊5', '13535356666', 'AE', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (7, '283833', '1234', '王俊11', '13535356666', 'AC', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (8, '283843', '1234', '王俊12', '13535356666', 'AC', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (9, '283853', '1234', '王俊13', '13535356666', 'AC', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (10, '283863', '1234', '王俊14', '13535356666', 'AC', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (11, '283873', '1234', '王俊15', '13535356666', 'AC', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (12, '284823', '1234', '王俊21', '13535356666', 'AP', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (13, '285823', '1234', '王俊22', '13535356666', 'AP', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (14, '286823', '1234', '王俊23', '13535356666', 'AP', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (15, '287823', '1234', '王俊24', '13535356666', 'AP', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (16, '288823', '1234', '王俊25', '13535356666', 'AP', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (17, '383823', '1234', '王俊31', '13535356666', 'SVA', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (18, '483823', '1234', '王俊32', '13535356666', 'SVA', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (19, '583823', '1234', '王俊33', '13535356666', 'SVA', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (20, '683823', '1234', '王俊34', '13535356666', 'SVA', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00'),
    (21, '783823', '1234', '王俊35', '13535356666', 'SVA', '2018-01-24 11:31:10', '2018-01-24 11:31:12', 0, 0, 'omWBL1pLyb_3AY3VLhj5iTpjQQyI', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');


CREATE TABLE `sys_fu` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL DEFAULT '0' COMMENT '名称' COLLATE 'utf8_bin',
	`totalCount` INT(11) NOT NULL DEFAULT '0' COMMENT '总量',
	`remainCount` INT(11) NOT NULL DEFAULT '0' COMMENT '余量',
	`weight` INT(11) NOT NULL DEFAULT '0' COMMENT '权重，即概率',
	PRIMARY KEY (`id`)
)
COMMENT=' 账户角色关系表'
COLLATE='utf8_bin'
ENGINE=InnoDB
AUTO_INCREMENT=1;

INSERT INTO `sys_fu` (`id`, `name`, `totalCount`, `remainCount`, `weight`) VALUES
	(1, '燃', 33, 33, 25);
INSERT INTO `sys_fu` (`id`, `name`, `totalCount`, `remainCount`, `weight`) VALUES
	(2, '情', 33, 33, 25);
INSERT INTO `sys_fu` (`id`, `name`, `totalCount`, `remainCount`, `weight`) VALUES
	(3, '小', 33, 33, 25);
INSERT INTO `sys_fu` (`id`, `name`, `totalCount`, `remainCount`, `weight`) VALUES
	(4, '站', 33, 33, 25);

-- Dumping structure for table annual.sys_account_role
CREATE TABLE IF NOT EXISTS `sys_account_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT=' 账户角色关系表';

-- Dumping data for table annual.sys_account_role: ~1 rows (approximately)
/*!40000 ALTER TABLE `sys_account_role` DISABLE KEYS */;
INSERT INTO `sys_account_role` (`id`, `accountId`, `roleId`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `sys_account_role` ENABLE KEYS */;


-- Dumping structure for table annual.sys_role
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- Dumping data for table annual.sys_role: ~2 rows (approximately)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`id`, `name`) VALUES
	(1, 'ADMIN'),
	(2, 'CUSTOMER');

CREATE TABLE IF NOT EXISTS `winning_record` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `accountId` INT(11) NOT NULL COMMENT '获奖账户',
    `prizeCode` INT(11) NOT NULL COMMENT '奖品',
    `received` TINYINT(3) UNSIGNED NOT NULL COMMENT '是否领取(0:未领取;1:领取)',
    `time` DATETIME NOT NULL COMMENT '领取时间',
    PRIMARY KEY (`id`)
)
COMMENT='中奖记录'
COLLATE='utf8_bin'
ENGINE=InnoDB
AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品等级',
  `desc` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '奖品描述',
  `count` smallint(5) unsigned NOT NULL COMMENT '奖品数量',
  `code` tinyint(3) unsigned NOT NULL COMMENT '奖品代号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='奖品设置';

INSERT INTO `prize` (`id`, `name`, `desc`, `count`, `code`) VALUES
    (1, '一等奖', 'MateBookX一台', 3, 1),
    (2, '二等奖', 'P8手机一部', 10, 2),
    (3, '三等奖', '荣耀手环一条', 20, 3);

CREATE TABLE IF NOT EXISTS `dept_winning_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '部门名称',
  `rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '获奖概率',
  `prizeCode` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '获奖级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `dept_winning_rate` (`id`, `dept`, `rate`, `prizeCode`) VALUES
    (1, 'SVA', 2500, 3),
    (2, 'AC', 2500, 3),
    (3, 'AP', 2500, 3),
    (4, 'AE', 2500, 3),
    (5, 'SVA', 2500, 2),
    (6, 'AC', 2500, 2),
    (7, 'AP', 2500, 2),
    (8, 'AE', 2500, 2),
    (9, 'SVA', 2500, 1),
    (10, 'AC', 2500, 1),
    (11, 'AP', 2500, 1),
    (12, 'AE', 2500, 1);

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
