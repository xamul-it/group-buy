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
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `subscription_date` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL,
  `members_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpy45r2qx8a2vqafo7rste49c` (`user_id`),
  KEY `FKeh2nyghso5scfx6ml9home9mf` (`group_id`),
  CONSTRAINT `FKeh2nyghso5scfx6ml9home9mf` FOREIGN KEY (`group_id`) REFERENCES `gbgroup` (`id`),
  CONSTRAINT `FKpy45r2qx8a2vqafo7rste49c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_member`
--

LOCK TABLES `group_member` WRITE;
/*!40000 ALTER TABLE `group_member` DISABLE KEYS */;
INSERT INTO `group_member` VALUES (1,18,1,17,'2020-10-05 23:21:29','CANCELLED','2021-03-04 16:04:40',0),(2,43,2,1,'2020-10-05 23:28:43','ACTIVE','2020-10-09 19:07:28',0),(3,0,2,1,'2020-10-06 23:28:43','PENDING','2020-10-06 23:28:43',1),(4,9,3,1,'2020-10-07 23:28:43','ACTIVE','2021-02-24 17:51:05',2),(5,1,4,1,'2020-10-08 23:28:43','ACTIVE','2021-01-27 16:42:06',3),(6,8,1,5,'2020-10-21 16:08:53','ACTIVE','2020-12-29 16:40:33',0),(7,1,1,2,'2020-12-30 18:37:48','ACTIVE','2020-12-30 18:37:49',0),(8,1,4,2,'2021-01-27 16:43:40','ACTIVE','2021-01-27 16:43:40',1),(9,1,4,5,'2021-01-27 16:44:07','ACTIVE','2021-01-27 16:44:07',1),(10,1,4,9,'2021-01-27 16:47:21','ACTIVE','2021-01-27 16:47:21',0),(11,1,1,6,'2021-01-28 12:50:45','ACTIVE','2021-01-28 12:50:45',0),(12,5,3,9,'2021-02-09 21:25:08','ACTIVE','2021-02-24 18:06:09',1),(13,10,3,10,'2021-02-09 21:25:33','CANCELLED','2021-02-24 18:01:43',1),(14,1,3,2,'2021-02-24 18:05:13','ACTIVE','2021-02-24 18:05:13',2),(15,1,2,1,'2021-03-04 16:13:08','ACTIVE','2021-03-04 16:13:08',4),(16,1,21,1,'2021-03-24 17:00:30','ACTIVE','2021-03-24 17:00:31',5),(17,5,21,2,'2021-03-24 17:01:03','ACTIVE','2021-03-24 17:03:16',3),(18,3,21,5,'2021-03-24 17:02:51','ACTIVE','2021-03-24 17:03:12',2);
/*!40000 ALTER TABLE `group_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-08  9:53:38