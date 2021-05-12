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
-- Table structure for table `gborder`
--

DROP TABLE IF EXISTS `gborder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gborder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `shipment_date` datetime DEFAULT NULL,
  `delivery_type` varchar(255) DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `order_date` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9o6m2xo8qv09wd5lrcboqgexa` (`group_id`),
  KEY `FKfmjdcted2e98fomklp3tq2a9j` (`supplier_id`),
  KEY `FK16sb6aom9t1duhwrpnqaqtk5r` (`user_id`),
  CONSTRAINT `FK16sb6aom9t1duhwrpnqaqtk5r` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK9o6m2xo8qv09wd5lrcboqgexa` FOREIGN KEY (`group_id`) REFERENCES `gbgroup` (`id`),
  CONSTRAINT `FKfmjdcted2e98fomklp3tq2a9j` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gborder`
--

LOCK TABLES `gborder` WRITE;
/*!40000 ALTER TABLE `gborder` DISABLE KEYS */;
INSERT INTO `gborder` VALUES (12,2,1,NULL,NULL,2,'2020-05-14 14:20:57','Ordine','b198d576-caf6-4d84-822a-409a2f01e701','SENT',1),(13,10,1,NULL,NULL,2,'2020-05-14 16:46:59','fdasfsads','cc1ea0ae-d858-44f9-a625-5ca8ff0b8f7d','SENT',1),(21,0,3,NULL,NULL,2,'2020-05-15 22:47:27','Ordine',NULL,NULL,1),(22,0,3,NULL,NULL,2,'2020-05-15 22:48:30','Ordine',NULL,NULL,1),(23,0,3,NULL,NULL,2,'2020-05-15 22:49:13','Ordine',NULL,NULL,1),(24,0,3,NULL,NULL,2,'2020-05-15 22:56:07','Ordine',NULL,NULL,1),(25,0,1,NULL,NULL,2,'2020-05-15 23:51:27','test','8b213faf-fab4-4fe7-baf9-79abce3f5853','ACCEPTED',1),(26,0,1,NULL,NULL,2,'2020-05-15 23:52:39','Descrizione ordine','d20ca733-d3b2-42bc-86e3-bbe453a5bb66','DELIVERED',1),(27,0,1,NULL,NULL,2,'2020-10-28 17:33:09','Frutta e verdura','fe32b532-2cb5-4a46-a099-63138cce9fc2','REJECTED',1),(28,1,1,NULL,NULL,2,'2020-11-11 17:15:04','descrizione','419b9bec-b358-4b29-bb89-e56881b72e5b','SENT',1),(29,1,1,NULL,NULL,512,'2020-12-29 16:42:47','Ordine di prova','5af2c3b1-6d5b-495b-a39b-a1ee66e3f950','SENT',1),(30,0,1,NULL,NULL,544,'2020-12-29 16:52:34','Test nuovo','ad2765b4-b5dc-4ab2-8c7c-b8470f3cd075','ACTIVE',1),(31,0,1,NULL,NULL,512,'2020-12-29 16:58:00','ordine vuoto','a194815d-f1e1-45b2-afdb-07d6e7f8dc3f','ACTIVE',1),(32,0,1,NULL,NULL,544,'2020-12-29 18:08:51','nuova prova','f1b0dca8-6e45-4cd7-92f0-d03a0bca41ff','ACTIVE',1),(33,1,1,NULL,NULL,512,'2020-12-29 18:41:03','test','b5574946-3a60-40b5-b7e1-7e29f57ee93a','SENT',1),(34,1,1,NULL,NULL,258,'2020-12-29 19:55:10','asfadag','11f71393-9fc9-404d-b1a8-b77c1f25115d','SENT',1),(37,0,1,NULL,NULL,367,'2020-12-29 20:13:57','ultima prova','695a6a9a-ddb0-44a4-96b3-033beb599ed0','ACTIVE',1),(38,1,2,NULL,NULL,206,'2020-12-30 18:38:04','Mountaing bike','edf83413-b8ce-40de-9906-b44124d46aae','SENT',1),(39,0,1,NULL,NULL,260,'2021-01-03 23:43:31','Test per email','1bc6b39b-54c4-477e-8f49-b8b1673f927b','ACTIVE',1),(40,0,1,NULL,NULL,260,'2021-01-03 23:43:31','Test per email','85f09eef-68f7-4378-b5da-f503114539d7','ACTIVE',1),(41,0,1,NULL,NULL,512,'2021-01-27 10:08:53','Test order 1','4e2b5284-f259-423f-8b7f-59da3f0d255a','ACTIVE',1),(42,0,1,NULL,NULL,513,'2021-01-27 10:16:39','Test order 2','1dc28fc1-c9c5-4958-83d3-4c4db371ae3c','ACTIVE',1),(43,0,1,NULL,NULL,513,'2021-01-27 10:19:45','Test order 3','626cf29c-c6cd-48dd-b18f-5958e946ef82','ACTIVE',1),(44,0,1,NULL,NULL,512,'2021-01-27 10:24:23','Test order 4','a461244f-809d-4d63-a40e-a130aff4c80b','ACTIVE',1),(45,0,1,NULL,NULL,259,'2021-01-27 10:31:26','Test order 4','d46c3de0-a78f-47a5-9adc-5f7c3969c1b1','ACTIVE',1),(46,0,4,NULL,NULL,273,'2021-01-27 14:06:22','Test group select 1','784e7769-a05e-48d6-8cf4-390141928c99','ACTIVE',1),(47,1,2,NULL,NULL,273,'2021-01-27 14:28:15','llllll','0491868b-68a9-44b0-9ad8-e3a1b0b7eacc','SENT',1),(48,1,5,NULL,NULL,273,'2021-01-27 14:51:34','gghhghghghg','0aeb3e75-bf80-4afc-a880-d2bce21efe34','SENT',1),(49,0,1,NULL,NULL,533,'2021-01-27 16:38:08','Nessuna descrizione','2b3bb7f5-e0a3-4188-bbd8-8c0e6dc43596','ACTIVE',4),(50,1,9,NULL,NULL,334,'2021-01-27 16:48:06','prova','b7607921-abac-42ad-b8fa-df1bbb1db304','SENT',4),(51,1,1,NULL,NULL,282,'2021-02-10 18:18:18','Descrizione','fe9d8e9f-140c-4278-897c-d367be0924c8','SENT',1),(52,0,4,NULL,NULL,327,'2021-02-17 16:30:58','Ordine per cartoleria Imperato','a982d5e7-3a4a-47d5-bded-5a5ff9e8ab37','ACTIVE',1),(53,1,5,NULL,NULL,517,'2021-02-17 16:33:36','Ordine per Ottica Vinci','dc1c5636-25c4-45f7-b403-30e3fa0fca87','SENT',1),(54,0,1,NULL,NULL,655,'2021-02-24 16:57:29','Ordine per Lm specialfood market enoteca','db624678-6ac0-4c82-96ab-1745706580f1','ACTIVE',1),(55,1,5,NULL,NULL,275,'2021-02-24 16:58:44','Ordine per CilentAmi','64f53bd3-d927-469b-9842-d5e2ca2b231e','SENT',1),(56,1,1,NULL,NULL,655,'2021-02-24 17:03:25','Ordine per Lm specialfood market enoteca','d89644aa-f1e2-4ff8-b517-5f73df4394ff','SENT',1),(57,1,5,NULL,NULL,440,'2021-02-24 17:05:43','Ordine per CARTOLERIA','df082955-ff90-4dc4-ad9f-ecb76f8a0764','SENT',1),(59,1,1,NULL,NULL,282,'2021-02-24 17:35:09','Ordine per Cartolibreria Nuvole di carta','8a8a0148-2c29-4811-b1bc-1ff0204356db','SENT',1),(60,0,1,NULL,NULL,655,'2021-03-24 17:03:49','Ordine per Lm specialfood market enoteca','2e1e1f92-939a-42b2-89fa-687bcd0806fa','ACTIVE',21);
/*!40000 ALTER TABLE `gborder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-08  9:53:34
