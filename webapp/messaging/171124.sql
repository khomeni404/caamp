/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.8 : Database - online
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`online` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `online`;

/*Table structure for table `sec_action` */

DROP TABLE IF EXISTS `sec_action`;

CREATE TABLE `sec_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_action` */

/*Table structure for table `sec_component` */

DROP TABLE IF EXISTS `sec_component`;

CREATE TABLE `sec_component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_component` */

/*Table structure for table `sec_token` */

DROP TABLE IF EXISTS `sec_token`;

CREATE TABLE `sec_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_on1oois27s8v9s3mi0godjgng` (`username`),
  KEY `FK_qr42pux9qs81ftn0wvarfxmy1` (`user`),
  CONSTRAINT `FK_qr42pux9qs81ftn0wvarfxmy1` FOREIGN KEY (`user`) REFERENCES `sec_user_master` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `sec_token` */

insert  into `sec_token`(`id`,`password`,`username`,`user`) values (1,'hs7V9h485ik=','mak',1);

/*Table structure for table `sec_user_group` */

DROP TABLE IF EXISTS `sec_user_group`;

CREATE TABLE `sec_user_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_user_group` */

/*Table structure for table `sec_user_group_action` */

DROP TABLE IF EXISTS `sec_user_group_action`;

CREATE TABLE `sec_user_group_action` (
  `GROUP_ID` bigint(20) NOT NULL,
  `ACTION_ID` bigint(20) NOT NULL,
  KEY `FK_qnlp7n7qix7wnysr15grwua0b` (`ACTION_ID`),
  KEY `FK_lh4iceeddectyjnvjtcuqcbvs` (`GROUP_ID`),
  CONSTRAINT `FK_lh4iceeddectyjnvjtcuqcbvs` FOREIGN KEY (`GROUP_ID`) REFERENCES `sec_user_group` (`id`),
  CONSTRAINT `FK_qnlp7n7qix7wnysr15grwua0b` FOREIGN KEY (`ACTION_ID`) REFERENCES `sec_action` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_user_group_action` */

/*Table structure for table `sec_user_group_user` */

DROP TABLE IF EXISTS `sec_user_group_user`;

CREATE TABLE `sec_user_group_user` (
  `GROUP_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  KEY `FK_joe1aj35mxylr4tn38sdald2e` (`USER_ID`),
  KEY `FK_jtddqmoeoqygxc8nnob3pxbpu` (`GROUP_ID`),
  CONSTRAINT `FK_jtddqmoeoqygxc8nnob3pxbpu` FOREIGN KEY (`GROUP_ID`) REFERENCES `sec_user_group` (`id`),
  CONSTRAINT `FK_joe1aj35mxylr4tn38sdald2e` FOREIGN KEY (`USER_ID`) REFERENCES `sec_user_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sec_user_group_user` */

/*Table structure for table `sec_user_master` */

DROP TABLE IF EXISTS `sec_user_master`;

CREATE TABLE `sec_user_master` (
  `type` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `cell` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `sec_user_master` */

insert  into `sec_user_master`(`type`,`id`,`active`,`name`,`applicant_id`,`cell`) values ('Staff',1,'','Khomeni',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
