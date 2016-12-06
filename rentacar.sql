-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: rentacar
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_lots`
--

DROP TABLE IF EXISTS `parking_lots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_lots` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_slovenian_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_slovenian_ci NOT NULL,
  `city` varchar(30) COLLATE utf8_slovenian_ci NOT NULL,
  `country` varchar(30) COLLATE utf8_slovenian_ci NOT NULL,
  `capacity` int(3) NOT NULL,
  `spaces_available` int(3) NOT NULL,
  `lng` decimal(9,6) NOT NULL,
  `lat` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_lots`
--

LOCK TABLES `parking_lots` WRITE;
/*!40000 ALTER TABLE `parking_lots` DISABLE KEYS */;
INSERT INTO `parking_lots` VALUES (1,'Parking Lot 1','Kampus Univerziteta u Sarajevu, Zmaja od Bosne bb','Sarajevo','Bosnia and Herzegovina',50,50,18.397159,43.856678),(2,'Parking Lot 2','Ulica Halida Kajtaza 13','Sarajevo','Bosnia and Herzegovina',30,30,18.400208,43.860122),(3,'Parking Lot 3','Ulica Kotromanića, Marijin dvor','Sarajevo','Bosnia and Herzegovina',100,100,18.407301,43.853757);
/*!40000 ALTER TABLE `parking_lots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `vehicle_id` int(10) NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,1,1,'2016-12-22 00:00:00'),(2,2,7,'2016-12-22 00:00:00'),(3,1,8,'2016-12-29 00:00:00'),(4,1,9,'2016-12-26 00:00:00');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `operator` int(1) NOT NULL DEFAULT '0',
  `status` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'active',
  `reputation` decimal(3,1) NOT NULL DEFAULT '20.0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nino','nino.corovic@gmail.com','1','$2y$10$R8dYV/QXAUlpuLYOkJZg0uYM90oRuw/b83F3rfITgHYJwJMd.XO9a','gROjjdSBhCEB6qSEIwU2pIpseLr0Ade5CSjZEiikthrSTgJwmGJiTbXvuRCK','2016-10-30 17:14:40','2016-12-05 19:35:50',0,'Active',20.0),(2,'Amir','amir.sabanovic@gmail.com','2','$2y$10$bNVToDYPgP4kmgENAy8nm.Z4lQbpp9B01G2S0LiI8tLi3c2WeGnki','pJIQAgMAeQo3Fikq86kn8zXUht8Jq5LvTU4Pxbrf9wzLmFehCx0SKAK5UpI1','2016-10-30 19:59:29','2016-11-07 21:31:29',0,'Active',20.0),(3,'sadsad','sadsadka@gmail.com','3','$2y$10$2ItmdEi.AtUTb2tdwpWzS.zU4fqyAIQhXzAOSpgX01OJ.3m5d3Oiq',NULL,'2016-10-30 20:36:13','2016-10-30 20:36:13',0,'Active',20.0),(4,'ksladka','novi@email.adresa','4','$2y$10$gXMb.XpKHwib3g.R4jrTZ.PG4VtlCHY65owNyqmehUbX5wr9U73aO',NULL,'2016-10-30 20:51:26','2016-10-30 20:51:26',0,'Active',20.0),(5,'nono','sada@sada.sada','5','$2y$10$k7OOZsI22/mVkJtU3ldQauUEk00sh5My/Aq.A7OsVZokRsVXnc4fm','ibKOhQrIuEXOclUv5KLl4zTki1UFpED0tZhYC1pYigTleqs2TbEcm6QnJP9d','2016-10-30 20:53:51','2016-10-31 06:24:33',0,'Active',20.0),(6,'opp','opp@opp.opp','6','$2y$10$8kRFNFTP13djMCSgf9nUGeQpWTjHagoUd2nnjfErIU6.wVxIAEcum','W5iIZHdxauDuDfYyl0OV2ol5m8jdtjzCN4CpugZYP522Y7JIxYEufqwpKUto','2016-10-31 06:45:11','2016-12-05 19:47:43',1,'Active',20.0),(21,'Nino','nino.corovic@gmail2.com','7','$2y$10$RWVn9qP0vDJUu8B4mdD1EeYXHnA.YrgLtkOK/.ihCFgpaTBODUHpK',NULL,'2016-11-01 13:23:46','2016-11-01 13:23:46',0,'active',20.0),(22,'Nino','nino.corovic@gmai2l.com','sadsa','$2y$10$24MuiqYG2JFurd.7UFP8dO/EHCe9v/HTPMFeTd1j1q2v8GmVM0/P2',NULL,'2016-11-01 13:46:36','2016-11-01 13:46:36',0,'active',20.0),(23,'nmnm','nmnm@nmnm.nmnm','nmnm','$2y$10$1yqeJXBl1ukraw19hxoB9.4.4YHx0CMxcwIVV4skpRgpack/ytWRi',NULL,'2016-11-01 20:00:48','2016-11-01 20:00:48',0,'active',20.0),(24,'Amir Sabanovic','asabanovic3@gmail.com','amirsabanovic','$2y$10$Py9.bzQnNG82cg6ymPRDneMMhAzlNvtRp7TGn1vkYQixAkm557VMO','VqPMJUQ6yGOgjB5dfrGoD6G611jC3qLdoIVvJlb4W0SssqyjYVuBz7KpjI0K','2016-11-07 21:04:25','2016-11-13 16:35:35',0,'active',20.0),(26,'qwqw','qwqw@qw.qw','qwqw','$2y$10$JvOmr9i.odho2/aQM.XFQ.hXmrO7/PVFK4jtBqaLrbpyCSJbZK7Ua',NULL,'2016-11-12 23:49:46','2016-11-12 23:49:46',1,'active',20.0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(25) CHARACTER SET utf16 DEFAULT NULL,
  `model` varchar(30) CHARACTER SET utf16 DEFAULT NULL,
  `production_year` int(4) DEFAULT NULL,
  `color` varchar(20) CHARACTER SET utf16 DEFAULT NULL,
  `form_factor` varchar(25) CHARACTER SET utf16 DEFAULT NULL,
  `automatic` int(1) DEFAULT NULL,
  `air_conditioning` int(1) DEFAULT NULL,
  `passengers` int(1) DEFAULT NULL,
  `bags` int(1) DEFAULT NULL,
  `doors` int(1) DEFAULT NULL,
  `available` int(1) DEFAULT NULL,
  `current_parking_lot` int(10) NOT NULL,
  `price_per_hour` int(3) DEFAULT NULL,
  `fuel_consumption` decimal(3,1) DEFAULT NULL,
  `image1` varchar(150) CHARACTER SET utf16 DEFAULT NULL,
  `image2` varchar(150) CHARACTER SET utf16 DEFAULT NULL,
  `image3` varchar(150) CHARACTER SET utf16 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `current_parking_lot` (`current_parking_lot`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`current_parking_lot`) REFERENCES `parking_lots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'Mercedes-Benz','CLS 63 AMG',2016,'Metallic Gray','Standard',1,1,5,3,4,1,1,100,12.0,'http://buyersguide.caranddriver.com/media/assets/submodel/7415.jpg','http://buyersguide.caranddriver.com/media/assets/submodel/7415.jpg','http://buyersguide.caranddriver.com/media/assets/submodel/7415.jpg','2016-11-01 20:23:29','2016-11-01 20:23:29'),(2,'BMW','M4',2003,'White','Intermediate',1,1,5,3,2,1,3,300,8.0,'http://o.aolcdn.com/commerce/autodata/images/USC50BMC641A021001.jpg','https://laracasts.com/discuss/channels/general-discussion/url-validation','https://laracasts.com/discuss/channels/general-discussion/url-validation','2016-11-02 16:43:46','2016-11-02 16:43:46'),(7,'Porsche','911 GT3',2015,'White','Luxury',1,1,2,2,2,1,2,200,15.0,'http://media.caranddriver.com/images/media/638444/porsche-911-gt3-photo-640539-s-original.jpg','http://media.caranddriver.com/images/media/638444/porsche-911-gt3-photo-640539-s-original.jpg','http://media.caranddriver.com/images/media/638444/porsche-911-gt3-photo-640539-s-original.jpg','2016-11-08 00:27:44','2016-11-08 00:27:44'),(8,'Ferrari','LaFerrari',2015,'Red','Luxury',1,1,2,2,2,1,2,220,3.0,'http://buyersguide.caranddriver.com/media/assets/submodel/6912.jpg','http://buyersguide.caranddriver.com/media/assets/submodel/6912.jpg','http://buyersguide.caranddriver.com/media/assets/submodel/6912.jpg','2016-11-08 00:30:28','2016-11-08 00:30:28'),(9,'Chevrolet','Impala',2016,'Blue','Intermediate',0,0,5,4,4,1,3,120,5.0,'http://buyersguide.caranddriver.com/media/assets/submodel/7673.jpg','http://buyersguide.caranddriver.com/media/assets/submodel/7673.jpg','http://buyersguide.caranddriver.com/media/assets/submodel/7673.jpg','2016-11-08 13:20:55','2016-11-08 13:20:55'),(10,'Chrysler','300 SRT',2015,'White','Standard',1,1,5,3,4,1,3,500,10.0,'http://buyersguide.caranddriver.com/media/assets/submodel/5651.jpg','http://buyersguide.caranddriver.com/media/assets/submodel/5651.jpg','http://buyersguide.caranddriver.com/media/assets/submodel/5651.jpg','2016-11-08 13:24:19','2016-11-08 13:24:19'),(11,'Lotus','Exige S Club',2016,'Orange','Luxury',1,1,2,2,2,1,2,200,9.0,'http://blog.caranddriver.com/wp-content/uploads/2015/03/Lotus-Exige-S-Club-Racer-NEW-PLACEMENT.jpg','http://blog.caranddriver.com/wp-content/uploads/2015/03/Lotus-Exige-S-Club-Racer-NEW-PLACEMENT.jpg','http://blog.caranddriver.com/wp-content/uploads/2015/03/Lotus-Exige-S-Club-Racer-NEW-PLACEMENT.jpg','2016-11-08 13:54:41','2016-11-08 13:54:41'),(13,'Nissan','Skyline R34',2005,'White','Luxury',1,1,2,2,2,1,2,200,12.0,'http://www.abload.de/img/img_2926zuff.jpg','http://www.abload.de/img/img_2926zuff.jpg','http://www.abload.de/img/img_2926zuff.jpg','2016-11-13 00:06:07','2016-11-13 00:06:07');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-06 10:41:06
