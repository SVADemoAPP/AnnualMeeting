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
CREATE TABLE IF NOT EXISTS `sys_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '工号',
  `password` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `realname` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '真实姓名',
  `phoneNo` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '电话号码',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `lastHeartbeat` datetime DEFAULT NULL COMMENT '最后一次心跳时间',
  `onLineTime` int(10) unsigned NOT NULL COMMENT '累计在线时长',
  `loginState` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否登录(0:未登录;1:登录)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='账户信息表';

-- Dumping data for table annual.sys_account: ~1 rows (approximately)
/*!40000 ALTER TABLE `sys_account` DISABLE KEYS */;
INSERT INTO `sys_account` (`id`, `username`, `password`, `realname`, `phoneNo`, `lastLoginTime`, `lastHeartbeat`, `onLineTime`, `loginState`) VALUES
	(1, 'admin', 'admin@123', '管理员', '', NULL, NULL, 0, 0);
/*!40000 ALTER TABLE `sys_account` ENABLE KEYS */;


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
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
