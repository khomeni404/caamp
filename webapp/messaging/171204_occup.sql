/*
SQLyog Ultimate v11.11 (32 bit)
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

/*Table structure for table `com_occupation` */

DROP TABLE IF EXISTS `com_occupation`;

CREATE TABLE `com_occupation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_bn` varchar(255) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_82hf4bvud9mx7hehum4gf6t2a` (`parent`),
  CONSTRAINT `FK_82hf4bvud9mx7hehum4gf6t2a` FOREIGN KEY (`parent`) REFERENCES `com_occupation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `com_occupation` */

insert  into `com_occupation`(`id`,`name`,`name_bn`,`parent`) values (1,'Govt. Service',NULL,NULL),(5,'Clerk',NULL,1),(8,'Self Employed',NULL,NULL),(9,'Barbar',NULL,8),(10,'Artist',NULL,8),(11,'Blacksmith','&#2453;&#2494;&#2478;&#2494;&#2480;',8),(18,'Lawyer','&#2438;&#2439;&#2472;&#2460;&#2496;&#2476;&#2496;',8),(19,'Postman','&#2465;&#2494;&#2453;&#2474;&#2495;&#2527;&#2472;',1),(20,'Duftry','&#2470;&#2474;&#2509;&#2468;&#2480;&#2496;',1),(21,'Non Gov. Service','&#2476;&#2503;&#2488;&#2480;&#2453;&#2494;&#2480;&#2495; &#2458;&#2494;&#2453;&#2497;&#2480;&#2495;',NULL),(22,'Teacher','&#2486;&#2495;&#2453;&#2509;&#2487;&#2453;',NULL),(23,'Teacher','&#2486;&#2495;&#2453;&#2509;&#2487;&#2453;',21),(24,'Peon','&#2453;&#2480;&#2472;&#2495;&#2453;',21);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
