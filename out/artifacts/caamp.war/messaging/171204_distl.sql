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

/*Table structure for table `com_district` */

DROP TABLE IF EXISTS `com_district`;

CREATE TABLE `com_district` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area` double DEFAULT NULL,
  `bbID` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `DIVISION_ID` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `PPK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `com_district` */

insert  into `com_district`(`id`,`area`,`bbID`,`description`,`DIVISION_ID`,`name`,`population`,`PPK`) values (1,1831,NULL,'---','1','Barguna',882000,481),(2,2785,NULL,'---','1','Barisal',2291000,823),(3,3403,NULL,'---','1','Bhola',1758000,517),(4,749,NULL,'---','1','Jhalokati',596000,795),(5,3221,NULL,'---','1','Patuakhali',1517000,471),(6,1308,NULL,'---','1','Pirojpur',1103000,844),(7,4479,NULL,'---','2','Bandarban',383000,86),(8,1927,NULL,'---','2','Brahmanbaria',2808000,1457),(9,1704,NULL,'---','2','Chandpur',2393000,1404),(10,5283,NULL,'---','2','Chittagong',7509000,1421),(11,3085,NULL,'---','2','Comilla',5304000,1719),(12,2492,NULL,'---','2','Cox\'s Bazar',2275000,913),(13,928,NULL,'---','2','Feni',1420000,1530),(14,2700,NULL,'---','2','Khagrachhari',608000,225),(15,1456,NULL,'---','2','Lakshmipur',1711000,1175),(16,3601,NULL,'---','2','Noakhali',3072000,853),(17,6116,NULL,'---','2','Rangamati',596000,97),(18,1464,NULL,'---','3','Dhaka',11875000,8111),(19,2073,NULL,'---','3','Faridpur',1867000,901),(20,1800,NULL,'---','3','Gazipur',3333000,1852),(21,1490,NULL,'---','3','Gopalganj',1149000,771),(22,2032,NULL,'---','3','Jamalpur',2265000,1115),(23,2689,NULL,'---','3','Kishoreganj',2853000,1061),(24,1145,NULL,'---','3','Madaripur',1149000,1004),(25,1379,NULL,'---','3','Manikganj',1379000,1000),(26,955,NULL,'---','3','Munshiganj',1420000,1487),(27,4363,NULL,'---','3','Mymensingh',5042000,1156),(28,759,NULL,'---','3','Narayanganj',2897000,4139),(29,1141,NULL,'---','3','Narsingdi',2202000,1930),(30,2810,NULL,'---','3','Netrakona',2207000,786),(31,1119,NULL,'---','3','Rajbari',1040000,929),(32,1182,NULL,'---','3','Shariatpur',1146000,970),(33,1364,NULL,'---','3','Sherpur',1334000,978),(34,3414,NULL,'---','3','Tangail',3571000,1046),(35,3959,NULL,'---','4','Bagerhat',1461000,369),(36,1177,NULL,'---','4','Chuadanga',1123000,954),(37,2567,NULL,'---','4','Jessore',2742000,1068),(38,1961,NULL,'---','4','Jhenaidah',1756000,895),(39,4394,NULL,'---','4','Khulna',2294000,522),(40,1601,NULL,'---','4','Kushtia',1933000,1207),(41,1049,NULL,'---','4','Magura',913000,871),(42,509,NULL,'---','4','Meherpur',652000,910),(43,990,NULL,'---','4','Narail',715000,722),(44,3858,NULL,'---','4','Satkhira',1973000,511),(45,2920,NULL,'---','5','Bogra',3371000,1154),(46,965,NULL,'---','5','Joypurhat',909000,942),(47,3436,NULL,'---','5','Naogaon',2576000,750),(48,1896,NULL,'---','5','Natore',1696000,894),(49,1703,NULL,'---','5','Chapainawabganj',1635000,960),(50,2372,NULL,'---','5','Pabna',2497000,1053),(51,2407,NULL,'---','5','Rajshahi',2573000,1069),(52,2498,NULL,'---','5','Sirajganj',3072000,1230),(53,3438,NULL,'---','6','Dinajpur',2970000,864),(54,2179,NULL,'---','6','Gaibandha',2349000,1078),(55,2296,NULL,'---','6','Kurigram',2050000,893),(56,1241,NULL,'---','6','Lalmonirhat',1249000,1006),(57,1580,NULL,'---','6','Nilphamari',1820000,1152),(58,1405,NULL,'---','6','Panchagarh',981000,698),(59,2368,NULL,'---','6','Rangpur',2866000,1210),(60,1810,NULL,'---','6','Thakurgaon',1380000,762),(61,2637,NULL,'---','7','Habiganj',2059000,781),(62,2799,NULL,'---','7','Moulvibazar',1902000,679),(63,3670,NULL,'---','7','Sunamganj',2443000,666),(64,3490,NULL,'---','7','Sylhet',3404000,975);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
