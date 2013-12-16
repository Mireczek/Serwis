/*
SQLyog Trial v8.71 
MySQL - 5.1.33-community-log : Database - mechanic_garage
*********************************************************************
*/ 

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`Serwis` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `Serwis`;

/*Table structure for table `bill` */

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `bill_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `payment_taype_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `FK_bill` (`client_id`),
  KEY `FK_bill2` (`payment_taype_id`),
  CONSTRAINT `FK_bill2` FOREIGN KEY (`payment_taype_id`) REFERENCES `payment` (`payment_id`),
  CONSTRAINT `FK_bill` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `car_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `prod_year` date NOT NULL,
  `enigne_type_id` int(10) unsigned NOT NULL,
  `suspension_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `FK_car` (`model_id`),
  KEY `FK_car2` (`client_id`),
  KEY `FK_car3` (`enigne_type_id`),
  KEY `FK_car4` (`suspension_type_id`),
  CONSTRAINT `FK_car4` FOREIGN KEY (`suspension_type_id`) REFERENCES `suspension_type` (`suspension_type_id`),
  CONSTRAINT `FK_car` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`),
  CONSTRAINT `FK_car2` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `FK_car3` FOREIGN KEY (`enigne_type_id`) REFERENCES `engine_type` (`engine_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `client_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) NOT NULL,
  `client_surrname` varchar(100) NOT NULL,
  `client_birth_date` varchar(100) NOT NULL,
  `client_policy_number` varchar(100) NOT NULL,
  `client_phone_number` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `cost_table` */

DROP TABLE IF EXISTS `client_password`;
CREATE TABLE `client_password`(
	`client_id` int(10) unsigned NOT NULL,
	`password` varchar(100) NOT NULL,
	KEY `pass` (`client_id`),
	CONSTRAINT `pass` FOREIGN KEY (`client_id`) REFERENCES 	`client` (`client_id`)
)ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `cost_table`;

CREATE TABLE `cost_table` (
  `cost_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned NOT NULL,
  `service_type` int(10) unsigned NOT NULL,
  `cost` float unsigned NOT NULL,
  PRIMARY KEY (`cost_id`),
  KEY `FK_cost_table2` (`model_id`),
  KEY `FK_cost_table3` (`service_type`),
  CONSTRAINT `FK_cost_table` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`),
  CONSTRAINT `FK_cost_table3` FOREIGN KEY (`service_type`) REFERENCES `service_type` (`service_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `engine_type` */




DROP TABLE IF EXISTS `producent`;
CREATE TABLE `producent` (
  `producent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) NOT NULL,
  `adres` varchar(100) not NULL,
  `telefon` int(12) unsigned NOT NULL,
  `email` varchar(30) not null,
  PRIMARY KEY (`producent_id`)


) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1; 





DROP TABLE IF EXISTS `engine_type`;

CREATE TABLE `engine_type` (
  `engine_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `engine_type_name` varchar(100) NOT NULL,
  `producent_id` int(10) not null ,
  PRIMARY KEY (`engine_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



/*Table structure for table `model` */

DROP TABLE IF EXISTS `model`;

CREATE TABLE `model` (
  `model_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mark` varchar(100) NOT NULL,  
  `model_name` varchar(100) NOT NULL,
  
  PRIMARY KEY (`model_id`)

) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `model_to_part` */

DROP TABLE IF EXISTS `model_to_part`;

CREATE TABLE `model_to_part` (
  `part_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `engine_type_id` int(10) unsigned NOT NULL,
  
  `production year` date NOT NULL,
  PRIMARY KEY (`part_id`,`model_id`),
  KEY `FK_model_to_part2` (`model_id`),
  KEY `FK_model_to_part3` (`engine_type_id`),
  CONSTRAINT `FK_model_to_part` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`),
  CONSTRAINT `FK_model_to_part2` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`),
  CONSTRAINT `FK_model_to_part3` FOREIGN KEY (`engine_type_id`) REFERENCES `engine_type` (`engine_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `paint` */

DROP TABLE IF EXISTS `paint`;

CREATE TABLE `paint` (
  `paint_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paint_name` varchar(100) NOT NULL,
  PRIMARY KEY (`paint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `part` */

DROP TABLE IF EXISTS `part`;

CREATE TABLE `part` (
  `part_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `part_type_id` int(10) unsigned NOT NULL,
  `part_name` varchar(100) NOT NULL,
  `part_price` int(10) unsigned NOT NULL,
  `producent_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`part_id`),
  KEY `FK_part` (`part_type_id`),
  KEY `FK_part3` (`producent_id`),
  CONSTRAINT `FK_part` FOREIGN KEY (`part_type_id`) REFERENCES `part_type` (`part_type_id`),
  CONSTRAINT `FK_part3` FOREIGN KEY (`producent_id`) REFERENCES `producent` (`producent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `part_to_install` */

DROP TABLE IF EXISTS `part_to_install`;

CREATE TABLE `part_to_install` (
  `part_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `count` int(10) NOT NULL,
  PRIMARY KEY (`part_id`,`service_id`),
  KEY `FK_part_to_install2` (`service_id`),
  CONSTRAINT `FK_part_to_install2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`),
  CONSTRAINT `FK_part_to_install` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `part_to_paint` */

DROP TABLE IF EXISTS `part_to_paint`;

CREATE TABLE `part_to_paint` (
  `part_type_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `paint_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`part_type_id`,`service_id`),
  KEY `FK_part_to_paint2` (`service_id`),
  KEY `FK_part_to_paint3` (`paint_id`),
  CONSTRAINT `FK_part_to_paint3` FOREIGN KEY (`paint_id`) REFERENCES `paint` (`paint_id`),
  CONSTRAINT `FK_part_to_paint` FOREIGN KEY (`part_type_id`) REFERENCES `part_type` (`part_type_id`),
  CONSTRAINT `FK_part_to_paint2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `part_to_repair` */

DROP TABLE IF EXISTS `part_to_repair`;

CREATE TABLE `part_to_repair` (
  `service_id` int(10) unsigned NOT NULL,
  `part_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`service_id`,`part_type_id`),
  KEY `FK_part_to_repair` (`part_type_id`),
  CONSTRAINT `FK_part_to_repair2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`),
  CONSTRAINT `FK_part_to_repair` FOREIGN KEY (`part_type_id`) REFERENCES `part_type` (`part_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `part_type` */

DROP TABLE IF EXISTS `part_type`;

CREATE TABLE `part_type` (
  `part_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `part_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`part_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(100) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



/*Table structure for table `producent_part` */

DROP TABLE IF EXISTS `producent_part`;

CREATE TABLE `producent_part` (
  `producent_id` int(10) unsigned NOT NULL,
  `part_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`producent_id`,`part_type_id`),
  KEY `FK_producent_part2` (`part_type_id`),
  CONSTRAINT `FK_producent_part` FOREIGN KEY (`producent_id`) REFERENCES `producent` (`producent_id`),
  CONSTRAINT `FK_producent_part2` FOREIGN KEY (`part_type_id`) REFERENCES `part_type` (`part_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `service` */

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `service_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int(10) unsigned NOT NULL,
  `service_type_id` int(10) unsigned NOT NULL,
  `car_id` int(10) unsigned NOT NULL,
  `cost` float DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `FK_service` (`bill_id`),
  KEY `FK_service2` (`car_id`),
  KEY `FK_service3` (`service_type_id`),
  CONSTRAINT `FK_service3` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`service_type_id`),
  CONSTRAINT `FK_service` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  CONSTRAINT `FK_service2` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `service_type` */

DROP TABLE IF EXISTS `service_type`;

CREATE TABLE `service_type` (
  `service_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`service_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `suspension_type` */

DROP TABLE IF EXISTS `suspension_type`;

CREATE TABLE `suspension_type` (
  `suspension_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suspension_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`suspension_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `worker` */

DROP TABLE IF EXISTS `worker`;

CREATE TABLE `worker` (
  `worker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `worker_name` varchar(100) NOT NULL,
  `worker_surrname` varchar(100) NOT NULL,
  `worker_phone` varchar(100) NOT NULL,
  `worker_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`worker_id`),
  KEY `FK_worker` (`worker_level`),
  CONSTRAINT `FK_worker` FOREIGN KEY (`worker_level`) REFERENCES `worker_level` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `worker_level` */

DROP TABLE IF EXISTS `worker_level`;

CREATE TABLE `worker_level` (
  `level_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(100) NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `worker_to_service` */

DROP TABLE IF EXISTS `worker_to_service`;

CREATE TABLE `worker_to_service` (
  `worker_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`worker_id`,`service_id`),
  KEY `FK_worker_to_service` (`service_id`),
  CONSTRAINT `FK_worker_to_service2` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`worker_id`),
  CONSTRAINT `FK_worker_to_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `model` WRITE;


INSERT INTO `model` VALUES (8795,'Volkswagen','1 Litre'),(8796,'Volkswagen','AAC'),(8797,'Volkswagen','Beetle'),(8798,'Volkswagen','Beetle 1.8 T'),(8799,'Volkswagen','Beetle 1.8 T Automatic'),(8800,'Volkswagen','Beetle 1.8T'),(8801,'Volkswagen','Beetle 2.0'),(8802,'Volkswagen','Beetle 2.0 Cabriolet'),(8803,'Volkswagen','Beetle 2.0 Highline'),(8804,'Volkswagen','Beetle 2.0 Highline Automatic'),(8805,'Volkswagen','Beetle Diesel'),(8806,'Volkswagen','Beetle Dune'),(8807,'Volkswagen','Beetle RSi'),(8808,'Volkswagen','Beetle S Turbo'),(8809,'Volkswagen','Beetle VR5'),(8810,'Volkswagen','Bora'),(8811,'Volkswagen','Bora 1.4'),(8812,'Volkswagen','Bora 1.6'),(8813,'Volkswagen','Bora 1.6 Automatic'),(8814,'Volkswagen','Bora 1.6 FSI'),(8815,'Volkswagen','Bora 1.6 FSI Variant'),(8816,'Volkswagen','Bora 1.6 Variant'),(8817,'Volkswagen','Bora 1.8'),(8818,'Volkswagen','Bora 1.8 T Highline'),(8819,'Volkswagen','Bora 1.8 T Highline Variant'),(8820,'Volkswagen','Bora 1.8 T Trendline'),(8821,'Volkswagen','Bora 1.8 T Trendline Variant'),(8822,'Volkswagen','Bora 1.8 Variant'),(8823,'Volkswagen','Bora 1.8T'),(8824,'Volkswagen','Bora 1.8T Trendline'),(8825,'Volkswagen','Bora 1.9 D'),(8826,'Volkswagen','Bora 1.9 D Variant'),(8827,'Volkswagen','Bora 1.9 TDI'),(8828,'Volkswagen','Bora 1.9 TDI Highline'),(8829,'Volkswagen','Bora 1.9 TDI Highline Variant'),(8830,'Volkswagen','Bora 1.9 TDI Variant'),(8831,'Volkswagen','Bora 2.0'),(8832,'Volkswagen','Bora 2.0 Variant'),(8833,'Volkswagen','Bora 2.3'),(8834,'Volkswagen','Bora 2.3 Variant'),(8835,'Volkswagen','Bora 2.8'),(8836,'Volkswagen','Bora 2.8 Variant'),(8837,'Volkswagen','Bora Variant'),(8838,'Volkswagen','Bora Variant 1.6'),(8839,'Volkswagen','Bora Variant 2.0'),(8840,'Volkswagen','Bora Variant TDI'),(8841,'Volkswagen','Cabriolet'),(8842,'Volkswagen','Caddy'),(8843,'Volkswagen','Caddy 1.4 Life'),(8844,'Volkswagen','Caddy 1.6'),(8845,'Volkswagen','Caddy 1.6 Life'),(8846,'Volkswagen','Caddy 1.6i'),(8847,'Volkswagen','Caddy 1.6i Life'),(8848,'Volkswagen','Caddy 1.6i Panel Van'),(8849,'Volkswagen','Caddy 1.9 D'),(8850,'Volkswagen','Caddy 1.9 TDI'),(8851,'Volkswagen','Caddy 1.9 TDi Life'),(8852,'Volkswagen','Caddy 2.0 Eco Life'),(8853,'Volkswagen','Caddy 2.0 SDi Life'),(8854,'Volkswagen','Caddy Life'),(8855,'Volkswagen','Caddy Life 1.4'),(8856,'Volkswagen','Caddy Life 1.6'),(8857,'Volkswagen','Caddy Life 1.9 TDi'),(8858,'Volkswagen','Caddy Life 2.0 Eco'),(8859,'Volkswagen','Caddy Life 2.0 EcoFuel'),(8860,'Volkswagen','Caddy Life 2.0 SDI'),(8861,'Volkswagen','Caravelle'),(8862,'Volkswagen','Caravelle 1.9 D'),(8863,'Volkswagen','Caravelle 2.4 D'),(8864,'Volkswagen','Caravelle 2.5 Automatic'),(8865,'Volkswagen','Caravelle 2.5 D'),(8866,'Volkswagen','Caravelle 2.5 TDi'),(8867,'Volkswagen','Caravelle 2.5 TDi 4-Motion'),(8868,'Volkswagen','Caravelle 2.5 TDi 4Motion'),(8869,'Volkswagen','Caravelle 2.5 TDi Tiptronic'),(8870,'Volkswagen','Caravelle 2.8'),(8871,'Volkswagen','Caravelle 3.2 V6 4-Motion'),(8872,'Volkswagen','Caravelle 3.2 V6 4Motion'),(8873,'Volkswagen','Caravelle TDI 2.5 TDI Trendline LWB'),(8874,'Volkswagen','CC'),(8875,'Volkswagen','CC Sport'),(8876,'Volkswagen','CC VR6 4Motion'),(8877,'Volkswagen','CC VR6 Sport'),(8878,'Volkswagen','Citi 1.4i'),(8879,'Volkswagen','Citi 1.6 Ritz'),(8880,'Volkswagen','Citi 1.6i'),(8881,'Volkswagen','Citi 1.8i R'),(8882,'Volkswagen','Citi Chico 1.4'),(8883,'Volkswagen','Citi Golf 1.4i'),(8884,'Volkswagen','Citi Golf 1.6i'),(8885,'Volkswagen','Citi Golf Chico 1.4'),(8886,'Volkswagen','Citi Rhythm 1.4'),(8887,'Volkswagen','Citi Rox 1.4i'),(8888,'Volkswagen','Citi Rox 1.6i'),(8889,'Volkswagen','Citi Sport 1.4i'),(8890,'Volkswagen','Citi Sport 1.6i'),(8891,'Volkswagen','Citi Storm 1.4i'),(8892,'Volkswagen','Citi TenaCiti 1.4i'),(8893,'Volkswagen','Citi VeloCiti 1.4i'),(8894,'Volkswagen','Citi VeloCiti 1.6i'),(8895,'Volkswagen','Citi Wolf 1.4i'),(8896,'Volkswagen','Commercial LT 2.5 TDi'),(8897,'Volkswagen','Concept C'),(8898,'Volkswagen','Concept T'),(8899,'Volkswagen','Corrado'),(8900,'Volkswagen','Corrado 2.0'),(8901,'Volkswagen','Corrado 2.9'),(8902,'Volkswagen','Corrado VR6'),(8903,'Volkswagen','Eos 1.6 FSi'),(8904,'Volkswagen','Eos 2.0'),(8905,'Volkswagen','Eos 2.0 FSI'),(8906,'Volkswagen','Eos 2.0 Komfort'),(8907,'Volkswagen','Eos 2.0 Lux'),(8908,'Volkswagen','EOS 2.0 T FSi'),(8909,'Volkswagen','Eos 2.0 TDi'),(8910,'Volkswagen','Eos 2.0 Turbo'),(8911,'Volkswagen','Eos 2.0T FSi'),(8912,'Volkswagen','Eos 3.2'),(8913,'Volkswagen','Eos Komfort'),(8914,'Volkswagen','Eos Lux'),(8915,'Volkswagen','Eurovan'),(8916,'Volkswagen','Fox 1.2'),(8917,'Volkswagen','Fox 1.4'),(8918,'Volkswagen','Fox 1.4 TDI'),(8919,'Volkswagen','Fusca'),(8920,'Volkswagen','GLI 2.0T'),(8921,'Volkswagen','Gol II'),(8922,'Volkswagen','Gol II 1.8'),(8923,'Volkswagen','Gol II 2.0'),(8924,'Volkswagen','Golf'),(8925,'Volkswagen','Golf 1.4'),(8926,'Volkswagen','Golf 1.4 CL'),(8927,'Volkswagen','Golf 1.4 Comfortline'),(8928,'Volkswagen','Golf 1.4 FSI Comfortline'),(8929,'Volkswagen','Golf 1.4 FSi Sportline'),(8930,'Volkswagen','Golf 1.4 GT'),(8931,'Volkswagen','Golf 1.4 Sportline'),(8932,'Volkswagen','Golf 1.4 TDi GT'),(8933,'Volkswagen','Golf 1.4 Trendline'),(8934,'Volkswagen','Golf 1.4 TSi'),(8935,'Volkswagen','Golf 1.4 Variant'),(8936,'Volkswagen','Golf 1.6'),(8937,'Volkswagen','Golf 1.6 Comfortline'),(8938,'Volkswagen','Golf 1.6 Comfortline Tiptronic'),(8939,'Volkswagen','Golf 1.6 FSi'),(8940,'Volkswagen','Golf 1.6 FSI Comfortline'),(8941,'Volkswagen','Golf 1.6 FSI Sportline'),(8942,'Volkswagen','Golf 1.6 FSI Trendline'),(8943,'Volkswagen','Golf 1.6 FSI Variant'),(8944,'Volkswagen','Golf 1.6 Sportline'),(8945,'Volkswagen','Golf 1.6 Trendline'),(8946,'Volkswagen','Golf 1.6 Variant'),(8947,'Volkswagen','Golf 1.6 Variant Automatic'),(8948,'Volkswagen','Golf 1.8'),(8949,'Volkswagen','Golf 1.8 5V'),(8950,'Volkswagen','Golf 1.8 5V Automatic'),(8951,'Volkswagen','Golf 1.8 CL'),(8952,'Volkswagen','Golf 1.8 GL'),(8953,'Volkswagen','Golf 1.8 T GTI'),(8954,'Volkswagen','Golf 1.9 4Motion TDi'),(8955,'Volkswagen','Golf 1.9 4Motion TDi Variant'),(8956,'Volkswagen','Golf 1.9 CL Umwelt'),(8957,'Volkswagen','Golf 1.9 D'),(8958,'Volkswagen','Golf 1.9 D Cabriolet'),(8959,'Volkswagen','Golf 1.9 D Variant'),(8960,'Volkswagen','Golf 1.9 SDI Variant'),(8961,'Volkswagen','Golf 1.9 TDi'),(8962,'Volkswagen','Golf 1.9 TDi 4Motion'),(8963,'Volkswagen','Golf 1.9 TDI 4Motion Trendline'),(8964,'Volkswagen','Golf 1.9 TDi Automatic'),(8965,'Volkswagen','Golf 1.9 TDI Basis'),(8966,'Volkswagen','Golf 1.9 TDI Comfortline'),(8967,'Volkswagen','Golf 1.9 TDi Comfortline DSG'),(8968,'Volkswagen','Golf 1.9 TDi Cross'),(8969,'Volkswagen','Golf 1.9 TDi CrossGolf'),(8970,'Volkswagen','Golf 1.9 TDi Sportline'),(8971,'Volkswagen','Golf 1.9 TDI Trendline'),(8972,'Volkswagen','Golf 1.9 TDi Variant'),(8973,'Volkswagen','Golf 1.9 TDi Variant 4Motion'),(8974,'Volkswagen','Golf 2.0'),(8975,'Volkswagen','Golf 2.0 4Motion'),(8976,'Volkswagen','Golf 2.0 4Motion Variant'),(8977,'Volkswagen','Golf 2.0 Automatic'),(8978,'Volkswagen','Golf 2.0 Bi-Fuel Variant'),(8979,'Volkswagen','Golf 2.0 Cabriolet'),(8980,'Volkswagen','Golf 2.0 Comfortline'),(8981,'Volkswagen','Golf 2.0 FSI'),(8982,'Volkswagen','Golf 2.0 FSI 4Motion Comfortline'),(8983,'Volkswagen','Golf 2.0 FSI Comfortline'),(8984,'Volkswagen','Golf 2.0 FSI Sport Tiptronic'),(8985,'Volkswagen','Golf 2.0 FSI Sportline'),(8986,'Volkswagen','Golf 2.0 GTi'),(8987,'Volkswagen','Golf 2.0 GTi 2.0T FSi'),(8988,'Volkswagen','Golf 2.0 GTi 2.0T FSi DSG'),(8989,'Volkswagen','Golf 2.0 GTi Turbo DSG'),(8990,'Volkswagen','Golf 2.0 SDI'),(8991,'Volkswagen','Golf 2.0 SDi Comfortline'),(8992,'Volkswagen','Golf 2.0 SDi Sportline'),(8993,'Volkswagen','Golf 2.0 SDI Trendline'),(8994,'Volkswagen','Golf 2.0 TDI'),(8995,'Volkswagen','Golf 2.0 TDI 4Motion Sportline'),(8996,'Volkswagen','Golf 2.0 TDI Comfortline'),(8997,'Volkswagen','Golf 2.0 TDi GT'),(8998,'Volkswagen','Golf 2.0 TDi Sport DSG'),(8999,'Volkswagen','Golf 2.0 TDI Sportline'),(9000,'Volkswagen','Golf 2.0 Trendline'),(9001,'Volkswagen','Golf 2.0 Variant'),(9002,'Volkswagen','Golf 2.0 Variant Automatic'),(9003,'Volkswagen','Golf 2.3'),(9004,'Volkswagen','Golf 2.3 Variant'),(9005,'Volkswagen','Golf 2.8'),(9006,'Volkswagen','Golf 3.2'),(9007,'Volkswagen','Golf 4 1.6'),(9008,'Volkswagen','Golf 5 1.6 Comfortline'),(9009,'Volkswagen','Golf 5 1.6 Trendline'),(9010,'Volkswagen','Golf 5 1.9 TDi Comfortline'),(9011,'Volkswagen','Golf 5 1.9 TDi Comfortline DSG'),(9012,'Volkswagen','Golf 5 2.0 Comfortline'),(9013,'Volkswagen','Golf 5 2.0 FSi Sportline'),(9014,'Volkswagen','Golf 5 2.0 TDi Sportline'),(9015,'Volkswagen','Golf 5 2.0 Trendline'),(9016,'Volkswagen','Golf 5 GTi 2.0T FSi'),(9017,'Volkswagen','Golf 5 GTi 2.0T FSi DSG'),(9018,'Volkswagen','Golf 5 R32'),(9019,'Volkswagen','Golf Cabriolet'),(9020,'Volkswagen','Golf G 60'),(9021,'Volkswagen','Golf GL'),(9022,'Volkswagen','Golf GL 1.9 TDI Sedan'),(9023,'Volkswagen','Golf GL 2.0'),(9024,'Volkswagen','Golf GL 2.0 Sedan'),(9025,'Volkswagen','Golf GLS 1.9 TDI'),(9026,'Volkswagen','Golf GLS 2.0'),(9027,'Volkswagen','Golf GT 1.4'),(9028,'Volkswagen','Golf GT 2.0 TDI'),(9029,'Volkswagen','Golf GTi'),(9030,'Volkswagen','Golf GTI 2.0'),(9031,'Volkswagen','Golf GTi 2.0T Coupe'),(9032,'Volkswagen','Golf GTi DSG'),(9033,'Volkswagen','Golf GTi VR6'),(9034,'Volkswagen','Golf Plus 1.4 Trendline'),(9035,'Volkswagen','Golf Plus 1.4i'),(9036,'Volkswagen','Golf Plus 1.6 FSI Comfortline'),(9037,'Volkswagen','Golf Plus 1.6 FSI Trendline'),(9038,'Volkswagen','Golf Plus 1.9 TDI PDE'),(9039,'Volkswagen','Golf Plus 1.9 TDI Trendline'),(9040,'Volkswagen','Golf Plus 2.0 FSI'),(9041,'Volkswagen','Golf Plus 2.0 TDI Trendline'),(9042,'Volkswagen','Golf R32'),(9043,'Volkswagen','Golf V5'),(9044,'Volkswagen','Golf V6 4Motion'),(9045,'Volkswagen','Golf Variant'),(9046,'Volkswagen','Golf Variant 1.4'),(9047,'Volkswagen','Golf Variant 1.6'),(9048,'Volkswagen','Golf Variant 1.6 Automatic'),(9049,'Volkswagen','Golf Variant 1.6 Automatik'),(9050,'Volkswagen','Golf Variant 1.6 FSi'),(9051,'Volkswagen','Golf Variant 1.9 SDI'),(9052,'Volkswagen','Golf Variant 1.9 TDI'),(9053,'Volkswagen','Golf Variant 1.9 TDI 4Motion'),(9054,'Volkswagen','Golf Variant 2.0'),(9055,'Volkswagen','Golf Variant 2.0 4Motion'),(9056,'Volkswagen','Golf Variant 2.0 Bi-Fuel'),(9057,'Volkswagen','Golf Variant 2.0 Bifuel'),(9058,'Volkswagen','Golf Variant FSi'),(9059,'Volkswagen','Golf VR6'),(9060,'Volkswagen','GTI'),(9061,'Volkswagen','GTI 1.8 T'),(9062,'Volkswagen','GTI 2.0 T'),(9063,'Volkswagen','GTI 2.0T Coupe'),(9064,'Volkswagen','GTI 2.0T Sedan'),(9065,'Volkswagen','GTI 2.0T Sedan PZEV'),(9066,'Volkswagen','GTI VR 6'),(9067,'Volkswagen','Hac'),(9068,'Volkswagen','Jetta'),(9069,'Volkswagen','Jetta 1.6'),(9070,'Volkswagen','Jetta 1.6 Comfortline'),(9071,'Volkswagen','Jetta 1.6 Comfortline Tiptronic'),(9072,'Volkswagen','Jetta 1.6 Trendline'),(9073,'Volkswagen','Jetta 1.9 TDI'),(9074,'Volkswagen','Jetta 1.9 TDI Comfortline'),(9075,'Volkswagen','Jetta 1.9 TDI Comfortline DSG'),(9076,'Volkswagen','Jetta 2.0 Comfortline'),(9077,'Volkswagen','Jetta 2.0 FSI Sportline'),(9078,'Volkswagen','Jetta 2.0 GLi'),(9079,'Volkswagen','Jetta 2.0 SportWagen TDi'),(9080,'Volkswagen','Jetta 2.0 TDi'),(9081,'Volkswagen','Jetta 2.0 TDI Sportline'),(9082,'Volkswagen','Jetta 2.0 Trendline'),(9083,'Volkswagen','Jetta 2.0SportWagen SEL'),(9084,'Volkswagen','Jetta 2.0T FSI'),(9085,'Volkswagen','Jetta 2.0T FSI DSG'),(9086,'Volkswagen','Jetta 2.0T FSi Sportline'),(9087,'Volkswagen','Jetta 2.0T FSi Sportline DSG'),(9088,'Volkswagen','Jetta 2.0T Sedan'),(9089,'Volkswagen','Jetta 2.5'),(9090,'Volkswagen','Jetta 2.5 PZEV'),(9091,'Volkswagen','Jetta 2.5 S'),(9092,'Volkswagen','Jetta 2.5 S PZEV'),(9093,'Volkswagen','Jetta 2.5 SE'),(9094,'Volkswagen','Jetta 2.5 SE PZEV'),(9095,'Volkswagen','Jetta 2.5 SEL'),(9096,'Volkswagen','Jetta 2.5 SEL PZEV'),(9097,'Volkswagen','Jetta 2.5 SportWagen SE'),(9098,'Volkswagen','Jetta 2.5 Value Edition'),(9099,'Volkswagen','Jetta 2.5 Wolfsburg Edition'),(9100,'Volkswagen','Jetta 4 1.8 T Executive'),(9101,'Volkswagen','Jetta GLX'),(9102,'Volkswagen','Jetta Sedan GL 2.0 L'),(9103,'Volkswagen','Jetta Sedan GL 2.0 L PZEV'),(9104,'Volkswagen','Jetta Sedan GL TDI-PD'),(9105,'Volkswagen','Jetta Sedan GLI 1.8 T'),(9106,'Volkswagen','Jetta Sedan GLI 2.8 L'),(9107,'Volkswagen','Jetta Sedan GLS 2.0 L'),(9108,'Volkswagen','Jetta Sedan GLS 2.0 L PZEV'),(9109,'Volkswagen','Jetta Sedan GLS TDI'),(9110,'Volkswagen','Jetta Sedan GLS TDI-PD'),(9111,'Volkswagen','Jetta Wagon GL 2.0'),(9112,'Volkswagen','Jetta Wagon GL TDI'),(9113,'Volkswagen','Jetta Wagon GLS 1.8 T'),(9114,'Volkswagen','Jetta Wagon GLS 2.0'),(9115,'Volkswagen','Jetta Wagon GLS TDI'),(9116,'Volkswagen','Kombi 1.9 TDi'),(9117,'Volkswagen','Kombi 2.5 TDi 4Motion'),(9118,'Volkswagen','Kombi 2.5 TDi Tiptronic'),(9119,'Volkswagen','LT 35 HR Panel Van'),(9120,'Volkswagen','Lupo'),(9121,'Volkswagen','Lupo 1.0'),(9122,'Volkswagen','Lupo 1.2 D'),(9123,'Volkswagen','Lupo 1.2 TDi'),(9124,'Volkswagen','Lupo 1.4'),(9125,'Volkswagen','Lupo 1.4 D'),(9126,'Volkswagen','Lupo 1.4 FSi'),(9127,'Volkswagen','Lupo 1.4 TDi'),(9128,'Volkswagen','Lupo 1.6'),(9129,'Volkswagen','Lupo 1.6 FSI'),(9130,'Volkswagen','Lupo 1.6 GTi'),(9131,'Volkswagen','Lupo 1.7 D'),(9132,'Volkswagen','Lupo 1.7 SDI'),(9133,'Volkswagen','Magellan'),(9134,'Volkswagen','Microbus'),(9135,'Volkswagen','Microbus 2.6 Active'),(9136,'Volkswagen','Multivan 1.9 TDI'),(9137,'Volkswagen','Multivan 1.9 TDI Comfortline'),(9138,'Volkswagen','Multivan 1.9 TDi Startline'),(9139,'Volkswagen','Multivan 2.0'),(9140,'Volkswagen','Multivan 2.0 Comfortline'),(9141,'Volkswagen','Multivan 2.0 Trendline'),(9142,'Volkswagen','Multivan 2.5 TDI'),(9143,'Volkswagen','Multivan 2.5 TDI 4Motion'),(9144,'Volkswagen','Multivan 2.5 TDI 4Motion Comfortline'),(9145,'Volkswagen','Multivan 2.5 TDI Comfortline'),(9146,'Volkswagen','Multivan 3.2 4Motion Comfortline'),(9147,'Volkswagen','Multivan 3.2 Comfortline'),(9148,'Volkswagen','Multivan 3.2 Comfortline Automatic'),(9149,'Volkswagen','New Beetle'),(9150,'Volkswagen','New Beetle 1.4'),(9151,'Volkswagen','New Beetle 1.4 Cabriolet'),(9152,'Volkswagen','New Beetle 1.6'),(9153,'Volkswagen','New Beetle 1.6 Cabriolet'),(9154,'Volkswagen','New Beetle 1.8'),(9155,'Volkswagen','New Beetle 1.8 5V'),(9156,'Volkswagen','New Beetle 1.8 Cabriolet'),(9157,'Volkswagen','New Beetle 1.8 T'),(9158,'Volkswagen','New Beetle 1.8 T Cabriolet'),(9159,'Volkswagen','New Beetle 1.8T'),(9160,'Volkswagen','New Beetle 1.9'),(9161,'Volkswagen','New Beetle 1.9 D'),(9162,'Volkswagen','New Beetle 1.9 TDI'),(9163,'Volkswagen','New Beetle 1.9 TDI Cabriolet'),(9164,'Volkswagen','New Beetle 2.0'),(9165,'Volkswagen','New Beetle 2.0 Cabriolet'),(9166,'Volkswagen','New Beetle 2.0 Highline'),(9167,'Volkswagen','New Beetle 2.0 Highline Automatic'),(9168,'Volkswagen','New Beetle 2.3'),(9169,'Volkswagen','New Beetle 2.3 V5'),(9170,'Volkswagen','New Beetle 2.5'),(9171,'Volkswagen','New Beetle 2.5 Convertible'),(9172,'Volkswagen','New Beetle 2.5 Convertible S'),(9173,'Volkswagen','New Beetle 2.5 S'),(9174,'Volkswagen','New Beetle 2.5 S PZEV'),(9175,'Volkswagen','New Beetle 2.5 SE'),(9176,'Volkswagen','New Beetle 2.5 SE PZEV'),(9177,'Volkswagen','New Beetle Cabriolet 1.4'),(9178,'Volkswagen','New Beetle Cabriolet 1.6'),(9179,'Volkswagen','New Beetle Cabriolet 1.8'),(9180,'Volkswagen','New Beetle Cabriolet 1.9 TDi'),(9181,'Volkswagen','New Beetle Convertible'),(9182,'Volkswagen','New Beetle Convertible 1.6'),(9183,'Volkswagen','New Beetle Convertible 2.0'),(9184,'Volkswagen','New Beetle Convertible 2.5'),(9185,'Volkswagen','New Beetle GL 1.8 L Convertible'),(9186,'Volkswagen','New Beetle GL 1.9 L TDI'),(9187,'Volkswagen','New Beetle GL 2.0 L Convertible'),(9188,'Volkswagen','New Beetle GLS 1.8 L'),(9189,'Volkswagen','New Beetle GLS 1.8 T'),(9190,'Volkswagen','New Beetle GLS 1.9 L TDI'),(9191,'Volkswagen','New Beetle GLS 2.0 L'),(9192,'Volkswagen','New Beetle GLS 2.0 L Convertible'),(9193,'Volkswagen','New Beetle S 1.8 L Turbo'),(9194,'Volkswagen','Parati'),(9195,'Volkswagen','Passat'),(9196,'Volkswagen','Passat 1.6'),(9197,'Volkswagen','Passat 1.6 FSI Trendline'),(9198,'Volkswagen','Passat 1.6 Trendline'),(9199,'Volkswagen','Passat 1.6 Variant'),(9200,'Volkswagen','Passat 1.8'),(9201,'Volkswagen','Passat 1.8 T'),(9202,'Volkswagen','Passat 1.8 T Variant'),(9203,'Volkswagen','Passat 1.8 TSI Comfortline'),(9204,'Volkswagen','Passat 1.8 TSI Comfortline Tiptronic'),(9205,'Volkswagen','Passat 1.8 TSI Highline'),(9206,'Volkswagen','Passat 1.8 Turbo'),(9207,'Volkswagen','Passat 1.8 Turbo Tiptronic'),(9208,'Volkswagen','Passat 1.8 Variant'),(9209,'Volkswagen','Passat 1.9'),(9210,'Volkswagen','Passat 1.9 Bluemotion'),(9211,'Volkswagen','Passat 1.9 D'),(9212,'Volkswagen','Passat 1.9 D Variant'),(9213,'Volkswagen','Passat 1.9 TD'),(9214,'Volkswagen','Passat 1.9 TDI'),(9215,'Volkswagen','Passat 1.9 TDI 4Motion'),(9216,'Volkswagen','Passat 1.9 TDI 4Motion Variant'),(9217,'Volkswagen','Passat 1.9 TDI Comfortline'),(9218,'Volkswagen','Passat 1.9 TDi DPF Comfortline'),(9219,'Volkswagen','Passat 1.9 TDi Trendline'),(9220,'Volkswagen','Passat 1.9 TDI Variant'),(9221,'Volkswagen','Passat 2.0'),(9222,'Volkswagen','Passat 2.0 4Motion'),(9223,'Volkswagen','Passat 2.0 4Motion Variant'),(9224,'Volkswagen','Passat 2.0 Automatic'),(9225,'Volkswagen','Passat 2.0 Comfort'),(9226,'Volkswagen','Passat 2.0 DSi Highline'),(9227,'Volkswagen','Passat 2.0 FSI Comfortline'),(9228,'Volkswagen','Passat 2.0 FSI Comfortline Tiptronic'),(9229,'Volkswagen','Passat 2.0 FSI Highline'),(9230,'Volkswagen','Passat 2.0 FSI Trendline'),(9231,'Volkswagen','Passat 2.0 Komfort'),(9232,'Volkswagen','Passat 2.0 Lux'),(9233,'Volkswagen','Passat 2.0 TDI'),(9234,'Volkswagen','Passat 2.0 TDI DSG'),(9235,'Volkswagen','Passat 2.0 TDI Highline'),(9236,'Volkswagen','Passat 2.0 TDI Highline DSG'),(9237,'Volkswagen','Passat 2.0 TDI Variant'),(9238,'Volkswagen','Passat 2.0 TFSI Comfortline'),(9239,'Volkswagen','Passat 2.0 Turbo'),(9240,'Volkswagen','Passat 2.0 Value Edition'),(9241,'Volkswagen','Passat 2.0 Variant'),(9242,'Volkswagen','Passat 2.0T'),(9243,'Volkswagen','Passat 2.0T FSi Sportline Tiptronic'),(9244,'Volkswagen','Passat 2.0T Wolfsburg'),(9245,'Volkswagen','Passat 2.3'),(9246,'Volkswagen','Passat 2.5 4Motion'),(9247,'Volkswagen','Passat 2.5 D'),(9248,'Volkswagen','Passat 2.5 TDi 4Motion Comfortline'),(9249,'Volkswagen','Passat 2.5 TDi Comfortline'),(9250,'Volkswagen','Passat 2.5 TDI Variant Automatic'),(9251,'Volkswagen','Passat 2.5 V6 TDI 4Motion Comfortline'),(9252,'Volkswagen','Passat 2.5 V6 TDI Comfortline'),(9253,'Volkswagen','Passat 2.5 V6 TDI Comfortline Variant'),(9254,'Volkswagen','Passat 2.8'),(9255,'Volkswagen','Passat 2.8 4Motion Comfortline'),(9256,'Volkswagen','Passat 2.8 4Motion Comfortline Variant'),(9257,'Volkswagen','Passat 2.8 V6 4Motion Comfortline'),(9258,'Volkswagen','Passat 2.8 V6 4Motion Comfortline Variant'),(9259,'Volkswagen','Passat 2.8 V6 Tiptronic'),(9260,'Volkswagen','Passat 2.8 Variant'),(9261,'Volkswagen','Passat 2.9'),(9262,'Volkswagen','Passat 3.2 FSi 4Motion'),(9263,'Volkswagen','Passat 3.2 V6 FSI 4Motion'),(9264,'Volkswagen','Passat 3.2 V6 Sportline DSG'),(9265,'Volkswagen','Passat 3.6'),(9266,'Volkswagen','Passat 3.6 VR6 4Motion'),(9267,'Volkswagen','Passat 3.6 Wagon VR6 4Motion'),(9268,'Volkswagen','Passat 4.0 W8 4Motion'),(9269,'Volkswagen','Passat 4.0 W8 4Motion Variant'),(9270,'Volkswagen','Passat Break'),(9271,'Volkswagen','Passat CL 1.8 Estate'),(9272,'Volkswagen','Passat CL 1.9 TDi Estate'),(9273,'Volkswagen','Passat GL Sedan'),(9274,'Volkswagen','Passat GL TDI Wagon'),(9275,'Volkswagen','Passat GLS Sedan'),(9276,'Volkswagen','Passat GLS TDI Sedan'),(9277,'Volkswagen','Passat GLS TDI Wagon'),(9278,'Volkswagen','Passat GLS Wagon'),(9279,'Volkswagen','Passat GLX Wagon'),(9280,'Volkswagen','Passat GT G60 Syncro'),(9281,'Volkswagen','Passat GT G60 Syncro Variant'),(9282,'Volkswagen','Passat Sedan GL'),(9283,'Volkswagen','Passat Sedan GL TDI'),(9284,'Volkswagen','Passat Sedan GLS'),(9285,'Volkswagen','Passat Sedan GLS TDI'),(9286,'Volkswagen','Passat Sedan GLX'),(9287,'Volkswagen','Passat TDI'),(9288,'Volkswagen','Passat TDI Automatic'),(9289,'Volkswagen','Passat Variant'),(9290,'Volkswagen','Passat Variant 1.0 Bluemotion'),(9291,'Volkswagen','Passat Variant 1.6'),(9292,'Volkswagen','Passat Variant 1.6 FSI Trendline'),(9293,'Volkswagen','Passat Variant 1.6 Trendline'),(9294,'Volkswagen','Passat Variant 1.8 Turbo'),(9295,'Volkswagen','Passat Variant 1.9 TDi 4Motion'),(9296,'Volkswagen','Passat Variant 1.9 TDI Trendline'),(9297,'Volkswagen','Passat Variant 2.0 4Motion'),(9298,'Volkswagen','Passat Variant 2.0 FSI Trendline'),(9299,'Volkswagen','Passat Variant 2.0 TDi DPF'),(9300,'Volkswagen','Passat Variant 2.0 TDi Trendline'),(9301,'Volkswagen','Passat Variant 2.0 TFSI Comfortline'),(9302,'Volkswagen','Passat Variant 2.5 TDi'),(9303,'Volkswagen','Passat Variant 2.5 TDi 4Motion'),(9304,'Volkswagen','Passat Variant 3.2 FSi 4Motion'),(9305,'Volkswagen','Passat Variant 3.2 V6 FSI 4Motion'),(9306,'Volkswagen','Passat VR5'),(9307,'Volkswagen','Passat W8'),(9308,'Volkswagen','Passat W8 Wagon'),(9309,'Volkswagen','Passat Wagon GL'),(9310,'Volkswagen','Passat Wagon GL TDI'),(9311,'Volkswagen','Passat Wagon GLS'),(9312,'Volkswagen','Passat Wagon GLS TDI'),(9313,'Volkswagen','Passat Wagon GLX'),(9314,'Volkswagen','Phaeton'),(9315,'Volkswagen','Phaeton 3.0 TDi'),(9316,'Volkswagen','Phaeton 3.0 V6 TDI'),(9317,'Volkswagen','Phaeton 3.2'),(9318,'Volkswagen','Phaeton 3.2 Long'),(9319,'Volkswagen','Phaeton 3.2 V6'),(9320,'Volkswagen','Phaeton 3.2 V6 Long'),(9321,'Volkswagen','Phaeton 4.2'),(9322,'Volkswagen','Phaeton 4.2 Long'),(9323,'Volkswagen','Phaeton 4.2 V8'),(9324,'Volkswagen','Phaeton 4.2 V8 Long'),(9325,'Volkswagen','Phaeton 4.9 D'),(9326,'Volkswagen','Phaeton 5.0 TDI 4Motion'),(9327,'Volkswagen','Phaeton 5.0 TDI 4Motion Long'),(9328,'Volkswagen','Phaeton 5.0 V10 TDI'),(9329,'Volkswagen','Phaeton 5.0 V10 TDi Long'),(9330,'Volkswagen','Phaeton 6.0'),(9331,'Volkswagen','Phaeton 6.0 W12'),(9332,'Volkswagen','Phaeton 6.0 W12 Long'),(9333,'Volkswagen','Phaeton V10 Diesel Long'),(9334,'Volkswagen','Phaeton V6'),(9335,'Volkswagen','Phaeton V6 Automatic'),(9336,'Volkswagen','Phaeton V8'),(9337,'Volkswagen','Phaeton V8 LWB'),(9338,'Volkswagen','Phaeton W12'),(9339,'Volkswagen','Phaeton W12 4Motion'),(9340,'Volkswagen','Pickup 1.6'),(9341,'Volkswagen','Pickup 1.6 Club'),(9342,'Volkswagen','Pickup Sport 1.6'),(9343,'Volkswagen','Polo'),(9344,'Volkswagen','Polo 1.05 CL'),(9345,'Volkswagen','Polo 1.2'),(9346,'Volkswagen','Polo 1.2 Fun'),(9347,'Volkswagen','Polo 1.2 Highline'),(9348,'Volkswagen','Polo 1.2 Trendline'),(9349,'Volkswagen','Polo 1.4'),(9350,'Volkswagen','Polo 1.4 Comfortline'),(9351,'Volkswagen','Polo 1.4 FSI'),(9352,'Volkswagen','Polo 1.4 FSI Comfortline'),(9353,'Volkswagen','Polo 1.4 FSI Fun'),(9354,'Volkswagen','Polo 1.4 FSI GT'),(9355,'Volkswagen','Polo 1.4 FSi Highline'),(9356,'Volkswagen','Polo 1.4 Fun'),(9357,'Volkswagen','Polo 1.4 GT'),(9358,'Volkswagen','Polo 1.4 Highline'),(9359,'Volkswagen','Polo 1.4 Limousine'),(9360,'Volkswagen','Polo 1.4 Limousine Comfortline'),(9361,'Volkswagen','Polo 1.4 S Playa'),(9362,'Volkswagen','Polo 1.4 TDI'),(9363,'Volkswagen','Polo 1.4 TDI Classic Comfortline'),(9364,'Volkswagen','Polo 1.4 TDI Comfortline'),(9365,'Volkswagen','Polo 1.4 TDI Fun'),(9366,'Volkswagen','Polo 1.4 TDI GT'),(9367,'Volkswagen','Polo 1.4 TDI Highline'),(9368,'Volkswagen','Polo 1.4 TDI Trendline'),(9369,'Volkswagen','Polo 1.4 TDI-PD Limousine Comfortline'),(9370,'Volkswagen','Polo 1.4 Trendline'),(9371,'Volkswagen','Polo 1.4i'),(9372,'Volkswagen','Polo 1.4i Classici Trendline'),(9373,'Volkswagen','Polo 1.4i S Classic'),(9374,'Volkswagen','Polo 1.6'),(9375,'Volkswagen','Polo 1.6 Automatic'),(9376,'Volkswagen','Polo 1.6 Berline'),(9377,'Volkswagen','Polo 1.6 Comfortline'),(9378,'Volkswagen','Polo 1.6 Comfortline Automatic'),(9379,'Volkswagen','Polo 1.6 Trendline'),(9380,'Volkswagen','Polo 1.6i Classic Comfortline'),(9381,'Volkswagen','Polo 1.8 GTi'),(9382,'Volkswagen','Polo 1.8 GTi Cup Edition'),(9383,'Volkswagen','Polo 1.8T GTi'),(9384,'Volkswagen','Polo 1.9 D'),(9385,'Volkswagen','Polo 1.9 D Berline'),(9386,'Volkswagen','Polo 1.9 D Variant'),(9387,'Volkswagen','Polo 1.9 SDI'),(9388,'Volkswagen','Polo 1.9 SDI Comfortline'),(9389,'Volkswagen','Polo 1.9 SDI Highline'),(9390,'Volkswagen','Polo 1.9 SDI Limousine'),(9391,'Volkswagen','Polo 1.9 SDI Limousine Comfortline'),(9392,'Volkswagen','Polo 1.9 TDI'),(9393,'Volkswagen','Polo 1.9 TDI Comfortline'),(9394,'Volkswagen','Polo 1.9 TDi Cross'),(9395,'Volkswagen','Polo 1.9 TDI Fun'),(9396,'Volkswagen','Polo 1.9 TDI GT'),(9397,'Volkswagen','Polo 1.9 TDI Highline'),(9398,'Volkswagen','Polo 1.9 TDI Sportline'),(9399,'Volkswagen','Polo 1.9 TDI Trendline'),(9400,'Volkswagen','Polo 2.0 Highline'),(9401,'Volkswagen','Polo Berline'),(9402,'Volkswagen','Polo Classic 1.4'),(9403,'Volkswagen','Polo Classic 1.4 Comfortline'),(9404,'Volkswagen','Polo Classic 1.4 TDI Trendline'),(9405,'Volkswagen','Polo Classic 1.4 Trendline'),(9406,'Volkswagen','Polo Classic 1.6 Comfortline'),(9407,'Volkswagen','Polo Classic 1.6 Trendline'),(9408,'Volkswagen','Polo Classic 1.9 TDI Highline'),(9409,'Volkswagen','Polo Classic 2.0 Highline'), 
(9410,'Volkswagen','Polo GL 1.6'),(9411,'Volkswagen','Polo GT'),(9412,'Volkswagen','Polo GTI 1.8'),(9413,'Volkswagen','Polo GTI 1.8 T'),(9414,'Volkswagen','Polo Notchback'),(9415,'Volkswagen','Polo Variant'),(9416,'Volkswagen','Quantum'),(9417,'Volkswagen','R32'),(9418,'Volkswagen','R32 VR6'),(9419,'Volkswagen','Rabbit'),(9420,'Volkswagen','Rabbit S'),(9421,'Volkswagen','Routan S'),(9422,'Volkswagen','Routan S RSE'),(9423,'Volkswagen','Routan SE'),(9424,'Volkswagen','Sharan'),(9425,'Volkswagen','Sharan 1.8 T'),(9426,'Volkswagen','Sharan 1.8 T Automatic'),(9427,'Volkswagen','Sharan 1.8 Turbo'),(9428,'Volkswagen','Sharan 1.8 Turbo Trendline'),(9429,'Volkswagen','Sharan 1.9 D'),(9430,'Volkswagen','Sharan 1.9 TDI'),(9431,'Volkswagen','Sharan 1.9 TDI 4Motion'),(9432,'Volkswagen','Sharan 1.9 TDI 4Motion Trendline'),(9433,'Volkswagen','Sharan 1.9 TDI Automatic'),(9434,'Volkswagen','Sharan 1.9 TDI Special'),(9435,'Volkswagen','Sharan 1.9 TDI Trendline'),(9436,'Volkswagen','Sharan 2.0'),(9437,'Volkswagen','Sharan 2.0 Trendline'),(9438,'Volkswagen','Sharan 2.8'),(9439,'Volkswagen','Sharan 2.8 4Motion Comfortline'),(9440,'Volkswagen','Sharan 2.8 Comfortline'),(9441,'Volkswagen','Sharan 2.8 V6'),(9442,'Volkswagen','Sharan 2.8 V6 4Motion Comfortline'),(9443,'Volkswagen','Sharan 2.8 V6 Comfortline'),(9444,'Volkswagen','Sharan 2.8 V6 Tiptronic'),(9445,'Volkswagen','T5 Beach 1.9 TDi'),(9446,'Volkswagen','T5 Beach 1.9TDi'),(9447,'Volkswagen','T5 Beach 2.5TDi'),(9448,'Volkswagen','T5 Beach 2.5TDi 4Motion'),(9449,'Volkswagen','T5 California 2.5 TDi'),(9450,'Volkswagen','T5 California 2.5TDi'),(9451,'Volkswagen','T5 California 2.5TDi 4Motion'),(9452,'Volkswagen','T5 Kombi 1.9 TDi Long'),(9453,'Volkswagen','T5 Kombi 2.5 TDi Long'),(9454,'Volkswagen','Tiguan'),(9455,'Volkswagen','Tiguan 1.4 TSI'),(9456,'Volkswagen','Tiguan 2.0 S'),(9457,'Volkswagen','Tiguan 2.0 SE'),(9458,'Volkswagen','Tiguan 2.0 SEL'),(9459,'Volkswagen','Touareg'),(9460,'Volkswagen','Touareg 2.5'),(9461,'Volkswagen','Touareg 2.5 D'),(9462,'Volkswagen','Touareg 2.5 R5 TDi'),(9463,'Volkswagen','Touareg 2.5 R5 TDi Tiptronic'),(9464,'Volkswagen','Touareg 2.5 R5 TDi Triptronic'),(9465,'Volkswagen','Touareg 2.5 TDi Tiptronic'),(9466,'Volkswagen','Touareg 3.0 V6 TDI'),(9467,'Volkswagen','Touareg 3.0 V6 TDi Tiptronic'), (9468,'Volkswagen','Touareg 3.2'),(9469,'Volkswagen','Touareg 3.2 V6'),(9470,'Volkswagen','Touareg 3.6'),(9471,'Volkswagen','Touareg 3.6 FSi'),(9472,'Volkswagen','Touareg 3.6 V6'),(9473,'Volkswagen','Touareg 3.6 V6 FSi'),(9474,'Volkswagen','Touareg 3.6 V6 FSi Tiptronic'),(9475,'Volkswagen','Touareg 4.2'),(9476,'Volkswagen','Touareg 4.2 FSi'),(9477,'Volkswagen','Touareg 4.2 V8'),(9478,'Volkswagen','Touareg 4.2 V8 FSi'),(9479,'Volkswagen','Touareg 4.2 V8 Tiptronic'),(9480,'Volkswagen','Touareg 4.9 D'),(9481,'Volkswagen','Touareg 5.0 TDi'),(9482,'Volkswagen','Touareg 5.0 V10 TDI'),(9483,'Volkswagen','Touareg 5.0 V10 TDi Tiptronic'),(9484,'Volkswagen','Touareg 6.0 W12'),(9485,'Volkswagen','Touareg Competition'),(9486,'Volkswagen','Touareg R50'),(9487,'Volkswagen','Touareg V10 Diesel'),(9488,'Volkswagen','Touareg V10 TDI'),(9489,'Volkswagen','Touareg V6'),(9490,'Volkswagen','Touareg V6 Automatic'),(9491,'Volkswagen','Touareg V6 TDi'),(9492,'Volkswagen','Touareg V8'),(9493,'Volkswagen','Touareg W12 Sport'),(9494,'Volkswagen','Touran'),(9495,'Volkswagen','Touran 1.4 TSi'),(9496,'Volkswagen','Touran 1.6'),(9497,'Volkswagen','Touran 1.6 Conceptline'),(9498,'Volkswagen','Touran 1.6 FSI'),(9499,'Volkswagen','Touran 1.6 FSI Highline'),(9500,'Volkswagen','Touran 1.6 FSI Trendline'),(9501,'Volkswagen','Touran 1.6 Trendline'),(9502,'Volkswagen','Touran 1.9 TDI'),(9503,'Volkswagen','Touran 1.9 TDI Conceptline'),(9504,'Volkswagen','Touran 1.9 TDI DSG'),(9505,'Volkswagen','Touran 1.9 TDI DSG Highline'),(9506,'Volkswagen','Touran 1.9 TDI DSG Trendline'),(9507,'Volkswagen','Touran 1.9 TDI Highline'),(9508,'Volkswagen','Touran 1.9 TDI Trendline'),(9509,'Volkswagen','Touran 1.9 TDI Trendline DSG'),(9510,'Volkswagen','Touran 2.0 Ecofuel'),(9511,'Volkswagen','Touran 2.0 FSI Highline'),(9512,'Volkswagen','Touran 2.0 FSI Trendline'), (9513,'Volkswagen','Touran 2.0 TDi'),(9514,'Volkswagen','Touran 2.0 TDI Highline'),(9515,'Volkswagen','Touran 2.0 TDi Highline DSG'),(9516,'Volkswagen','Touran 2.0 TDI Trendline'),(9517,'Volkswagen','Touran 2.0 TSi'),(9518,'Volkswagen',
'Touran Trendline 2.0 FSI'),(9519,'Volkswagen','Transporter 1.9 Crew Bus'),(9520,'Volkswagen','Transporter 1.9 TDI'),(9521,'Volkswagen','Transporter 1.9 TDi Crew Bus'),(9522,'Volkswagen','Transporter 1.9 TDI Single Cab'),(9523,'Volkswagen','Transporter 2.5'),(9524,'Volkswagen','Transporter 2.5 TDi Crew Bus'),(9525,'Volkswagen','Transporter 2.5 TDi Crew Bus Tiptronic'),(9526,'Volkswagen','Transporter 2.5TDi'),
(9527,'Volkswagen','Transporter Panel Van 1.9 TDi'),(9528,'Volkswagen','Vento 1.6 CL'),(9529,'Volkswagen','Vento 1.8 GL'),(9530,'Volkswagen','Vento 1.9 Turbodiesel CL'),(9531,'Volkswagen','Vento 2.0 GT'),(9532,'Volkswagen','W12'),(9533,'Volkswagen','W12 Coupe'),(9534,'Volkswagen','W12 Roadster');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;