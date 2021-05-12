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
-- Table structure for table `gbgroup_user`
--

DROP TABLE IF EXISTS `gbgroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gbgroup_user` (
  `group_members_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `members_idx` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `subscription_date` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL,
  KEY `FK97t57wviuvg8okq5winshr5qr` (`user_id`),
  CONSTRAINT `FK97t57wviuvg8okq5winshr5qr` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gbgroup_user`
--

LOCK TABLES `gbgroup_user` WRITE;
/*!40000 ALTER TABLE `gbgroup_user` DISABLE KEYS */;
INSERT INTO `gbgroup_user` VALUES (4,2,0,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(5,1,0,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(1,2,0,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(2,2,0,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(5,2,1,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(1,3,1,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(6,2,0,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(7,1,0,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(4,1,0,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(1,4,2,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(1,5,3,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(1,6,4,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(1,7,5,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(1,8,6,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00'),(1,9,7,0,0,0,'0000-00-00 00:00:00','','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `gbgroup_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-08  9:53:24
