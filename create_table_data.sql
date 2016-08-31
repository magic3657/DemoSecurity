# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.14)
# Database: demo
# Generation Time: 2016-08-31 17:34:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table APP_USER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `APP_USER`;

CREATE TABLE `APP_USER` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sso_id` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sso_id` (`sso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `APP_USER` WRITE;
/*!40000 ALTER TABLE `APP_USER` DISABLE KEYS */;

INSERT INTO `APP_USER` (`id`, `sso_id`, `password`, `first_name`, `last_name`, `email`, `state`)
VALUES
	(1,'bill','abc123','Bill','Watcher','bill@xyz.com','Active'),
	(2,'danny','abc124','Danny','Theys','danny@xyz.com','Active'),
	(3,'sam','abc125','Sam','Smith','samy@xyz.com','Active'),
	(4,'nicole','abc126','Nicole','warner','nicloe@xyz.com','Active'),
	(5,'kenny','abc127','Kenny','Roger','kenny@xyz.com','Active');

/*!40000 ALTER TABLE `APP_USER` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table APP_USER_USER_PROFILE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `APP_USER_USER_PROFILE`;

CREATE TABLE `APP_USER_USER_PROFILE` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`user_profile_id`),
  KEY `FK_USER_PROFILE` (`user_profile_id`),
  CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `APP_USER` (`id`),
  CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `USER_PROFILE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `APP_USER_USER_PROFILE` WRITE;
/*!40000 ALTER TABLE `APP_USER_USER_PROFILE` DISABLE KEYS */;

INSERT INTO `APP_USER_USER_PROFILE` (`user_id`, `user_profile_id`)
VALUES
	(1,1),
	(2,1),
	(3,2),
	(5,2),
	(4,3),
	(5,3);

/*!40000 ALTER TABLE `APP_USER_USER_PROFILE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table USER_PROFILE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_PROFILE`;

CREATE TABLE `USER_PROFILE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `USER_PROFILE` WRITE;
/*!40000 ALTER TABLE `USER_PROFILE` DISABLE KEYS */;

INSERT INTO `USER_PROFILE` (`id`, `type`)
VALUES
	(2,'ADMIN'),
	(3,'DBA'),
	(1,'USER');

/*!40000 ALTER TABLE `USER_PROFILE` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
