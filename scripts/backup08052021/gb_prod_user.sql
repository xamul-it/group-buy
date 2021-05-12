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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,2,_binary '\0','admin@admin.it',_binary '\0','{bcrypt}$2a$10$T4iu.k3sFy1ruYHFt2pAtOsVpMBG/U5hZQ9UVMeQKIvGybw8.MRBa',_binary '\0',_binary '','aaa@aa.it'),(2,1,_binary '\0','lucia',_binary '\0','{bcrypt}$2a$10$x1canedGagW0LGGGrTVvTuPvqfDZrg5888riV0uIxb2TkD3zmEwGi',_binary '\0',_binary '','lucia@lucia.it'),(3,0,_binary '\0','test@test.it',_binary '\0','{bcrypt}$2a$10$kLYeTOZBctpsbJUU7twZIe2Tu0XbzKqBy46DC7SRCj4iRP5pX3p9a',_binary '\0',_binary '','test@test.it'),(4,0,_binary '\0','test@test.aa',_binary '\0','{bcrypt}$2a$10$j8j2rZSl7B3WvB1e/qan6uxU2MBfLkTs82M1ZlcPPDhlwktZ91mBS',_binary '\0',_binary '','test@test.aa'),(5,0,_binary '\0','test@test.bb',_binary '\0','{bcrypt}$2a$10$fbcRCyTmx.Hf1vn.laOd8uGork0wSji7NY.52cl0VLiepaWQ9JXcW',_binary '\0',_binary '','test@test.bb'),(6,1,_binary '\0','test',_binary '\0','{bcrypt}$2a$10$rLHToxpcLDkR5pGuPcxe0OT58JLpRmDzsIxG8ehDjFo7a4LsOI5V2',_binary '\0',_binary '','test@test.au'),(7,1,_binary '\0','pippo',_binary '\0','{bcrypt}$2a$10$eSEhXyHhh.qWxrU.pgKnJO6FQn.hNUycE6UYiWZTGh9cfTKtQWUma',_binary '\0',_binary '','pippo@aaa.it'),(8,1,_binary '\0','ALE1',_binary '\0','{bcrypt}$2a$10$ERqE9dEn9JJOjkk2vS7bgODi6Z8rboxeGt16NAwHANtDsMepYfypG',_binary '\0',_binary '','ale@nomail.dev'),(9,1,_binary '\0','User Test 1',_binary '\0','{bcrypt}$2a$10$oMIwfFm86EJ8k9Udig1sfu7otOAkK9PLXEur82j6wI6cJf1KB6v.y',_binary '\0',_binary '','test@user1.com'),(10,0,_binary '\0','qwerty',_binary '','{bcrypt}$2a$10$jfykzhpR.pHYk1lqODbOGucbTnyBLcK6elaxXBILH9dLZgOMLaQb.',_binary '\0',_binary '','pipp@pluto.pap'),(11,0,_binary '\0','qwertyy',_binary '','{bcrypt}$2a$10$N/jd7yDM2aZ2lr3X8tGyOOeZ.fUxlvnOjiaDqqL84qtBVmlAkZG8e',_binary '\0',_binary '','qwerty1@tin.it'),(12,1,_binary '\0','qwerty2',_binary '\0','{bcrypt}$2a$10$4KleDKrM7yuSroqXCHoqt.VVl0Jowq5GwfqTICX9.rc6PINnyLWRO',_binary '\0',_binary '','qwerty2@tin.it'),(13,1,_binary '\0','admin@admin.com',_binary '\0','{bcrypt}$2a$10$A6e0Mh6D4gxeab6HT.eEBeo1W8fYWNEljKRxCgceQBIg2PPYYCsIi',_binary '\0',_binary '','aaa@aa.it'),(14,0,_binary '\0','pippopippo',_binary '','{bcrypt}$2a$10$33mE6ED5889SUFYUSl/xT.SRiLyQL789IZGILKhXxC5gJvXFV133O',_binary '\0',_binary '','pippo@peppa.com'),(15,0,_binary '\0','peppe',_binary '','{bcrypt}$2a$10$AqoKvXVxHz5jeRwI6KK5keKnrv4r2770IUDg29/Zy2pXsBcjag9gi',_binary '\0',_binary '','peppe@peppo.com'),(16,0,_binary '\0','linolino',_binary '','{bcrypt}$2a$10$Ij0xaWDS2Sskik13JJrUDu704Pj8YGdkBviys83lF2BSd2KKPWeXW',_binary '\0',_binary '','lino@li.no'),(17,0,_binary '\0','rinorino',_binary '','{bcrypt}$2a$10$P/5xHEOYOpZrv2Msf09Df.qKY9.wLyNsnpi3tuOmxiNuTs206LFXy',_binary '\0',_binary '','rino@ri.no'),(18,0,_binary '\0','rinolino',_binary '','{bcrypt}$2a$10$TUFUCtIRU4HyJkGYDGZA7uZZw4qxfJupFsr44dfSPFYRbqxAWxGFe',_binary '\0',_binary '','rino@li.no'),(19,0,_binary '\0','ginonino',_binary '','{bcrypt}$2a$10$.TyU2OVnLaz96qQQ.eGBveqNxe/8b4h6RVWq72L.pfeChmKd9Xiqq',_binary '\0',_binary '','gino@ni.no'),(20,0,_binary '\0','rinopino',_binary '','{bcrypt}$2a$10$Jqk8Ra398xclhbtuZoPDT.KPYeQmEr6Qq/cf6s.HMZrLlyLFZ2Hdy',_binary '\0',_binary '','rino@pi.no'),(21,1,_binary '\0','zande',_binary '\0','{bcrypt}$2a$10$OcNT7.poV5mCdlrDlbRHAun3y0AgCE..rgN9c2NXstrhqgoaYxN.a',_binary '\0',_binary '','luigi.zanderighi@gmail.com'),(22,1,_binary '\0','luigi.zanderighi@gmail.com',_binary '\0','{bcrypt}$2a$10$1SwZYOsev1MeeX9Tsf.U0.9ShkBXjOd2czwGmwuI31fVsbt4/e5KC',_binary '\0',_binary '','luigi.zanderighi@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-08  9:53:30
