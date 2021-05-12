-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: ptah07.seeweb.it    Database: gb_prod
-- ------------------------------------------------------
-- Server version	5.7.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gbgroup`
--

DROP TABLE IF EXISTS `gbgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gbgroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `creation_date` datetime NOT NULL,
  `description` varchar(200) NOT NULL,
  `delivery_address_address1` varchar(35) NOT NULL,
  `delivery_address_country_code` varchar(2) NOT NULL,
  `delivery_address_postal_code` varchar(5) NOT NULL,
  `delivery_address_address2` varchar(35) DEFAULT NULL,
  `delivery_address_city` varchar(35) NOT NULL,
  `delivery_address_district` varchar(200) NOT NULL,
  `public_group` bit(1) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `delivery_address_lat_old` bigint(20) DEFAULT NULL,
  `delivery_address_lon_old` bigint(20) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `slack` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `delivery_address_lat` double DEFAULT NULL,
  `delivery_address_lon` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_egrpyebc0vog1h5o4urwlglo6` (`name`),
  KEY `FKk9rxpho6clon9vawqm4lqun83` (`owner_id`),
  KEY `FKrealyhqhiyqd92xpgeu2e02sx` (`category_id`),
  CONSTRAINT `FKk9rxpho6clon9vawqm4lqun83` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrealyhqhiyqd92xpgeu2e02sx` FOREIGN KEY (`category_id`) REFERENCES `group_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gbgroup`
--

LOCK TABLES `gbgroup` WRITE;
/*!40000 ALTER TABLE `gbgroup` DISABLE KEYS */;
INSERT INTO `gbgroup` VALUES (1,51,'Gruppo di test',2,'2020-05-07 11:45:13','Questo è il gruppo di test','Viale Cirene','IT','20135',NULL,'Milano','Mi',_binary '',1,454538165,92110762,'ecoverso','c/UCU136M5FaSTpGz8N_HrSMAg','gruppoacquistoibrido','UmmCU136M5iuiEz8N_HAg','wegoecoverso','blablabla','company/hjhjhjhjhhj',NULL,NULL,45.4527157,9.2140021),(2,35,'sdfda',2,'2020-06-09 00:16:40','sdfda','Via 1','IT','20100','Via 2','dsgda','mi',_binary '\0',2,45,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.3066813000734,10.1921377325252),(3,1,'Gruppo LZ',4,'2020-05-13 17:10:01','Descrizione','Viale 1','IT','20100','Viale 2','Milano','Mi',_binary '\0',3,46,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45.7551726764108,10.8494772257717),(4,24,'gruppo mio++',1,'2020-07-18 19:32:25','gruppo con aggiunta utenti','Viale Cirene','IT','20135',NULL,'Milano','Mi',_binary '\0',4,45,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41.8933203,12.4829321),(5,4,'CIAOCIAO',3,'2020-05-26 16:39:28','gruppo per testare la subscribe','via roma 23','IT','20100',NULL,'milano','mi',_binary '\0',5,45,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48.0088425128415,10.3996698808385),(6,5,'gruppo27.05',2,'2020-05-27 23:23:13','gruppo prova ancora','via verdi','IT','20100',NULL,'milano','mi',_binary '\0',6,45,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45.5896696067106,10.4719019252364),(7,4,'Prodotti per animali',1,'2020-06-28 18:31:54','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra fringilla lacus, eget egestas tellus consectetur vel. Duis porta tellus ut elit faucibus semper non quis nisl. In viverra porttit','Piazzale Libia 4','IT','20135',NULL,'Milano','MI',_binary '\0',7,45,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46.8159462563988,9.97929567662923),(8,0,'Test group',3,'2020-07-28 22:31:54','Desc....','Address...','IT','23032',NULL,'ywtrywty','wt',_binary '\0',8,45,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46.2940775200044,11.043021412284),(9,3,'Nuovo gruppo di Luigi',1,'2020-12-29 18:40:04','Non ho una descrizione valida','Viale Umbria, 49','IT','20135',NULL,'Milano','MI',_binary '\0',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45.4525446,9.214136),(10,2,'Gruppo',1,'2020-12-30 14:38:25','Test perché in test non va.','Viale Umbria 49','IT','20135',NULL,'milano','MI',_binary '\0',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45.4538165,9.2110762),(13,1,'test Aòlimentari',1,'2021-03-04 14:42:16','desxcrizione gruppo','Viale Cirene','IT','20135',NULL,'Milano','Milano',_binary '\0',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45.4538165,9.2110762),(14,1,'test Alimentari',1,'2021-03-04 14:43:25','desxcrizione gruppo','Viale Cirene','IT','20135',NULL,'Milano','Milano',_binary '\0',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45.4538165,9.2110762),(15,1,'test Alimentari membro',1,'2021-03-04 14:43:46','desxcrizione gruppo','Viale Cirene','IT','20135',NULL,'Milano','Milano',_binary '\0',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45.4538165,9.2110762),(16,1,'test Alimentari membro 1',2,'2021-03-04 14:50:33','desxcrizione gruppo 2','Viale Cirene','IT','20135',NULL,'Milano','Milano',_binary '\0',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45.4538165,9.2110762),(17,1,'nuome',1,'2021-03-04 16:54:19','edfddsfdsg','Viale Umbria 41','IT','20100',NULL,'Milano','mi',_binary '\0',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45.462196,9.2172396);
/*!40000 ALTER TABLE `gbgroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-08  9:53:47
