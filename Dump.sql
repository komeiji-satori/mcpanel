-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `Balance`;
CREATE TABLE `Balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` float NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DELIMITER ;;

CREATE TRIGGER `balance_logs` AFTER UPDATE ON `Balance` FOR EACH ROW
begin
insert into BalanceLogs (balance,after_deduction,username,insert_time) values(old.balance,new.balance,new.username,unix_timestamp(now()));
END;;

DELIMITER ;

DROP TABLE IF EXISTS `BalanceLogs`;
CREATE TABLE `BalanceLogs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `balance` float NOT NULL,
  `after_deduction` float NOT NULL,
  `username` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `insert_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `Member`;
CREATE TABLE `Member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `password` text NOT NULL,
  `telegram_uid` int(20) DEFAULT NULL,
  `skin` int(2) NOT NULL DEFAULT '0',
  `realname` varchar(16) NOT NULL,
  `web_name` text,
  `lastip` varchar(16) NOT NULL,
  `lastlogin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Skins`;
CREATE TABLE `Skins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `textures` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int(10) NOT NULL,
  `username` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;