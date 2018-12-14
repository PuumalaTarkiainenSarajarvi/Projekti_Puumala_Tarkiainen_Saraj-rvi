-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 10.4.1.142    Database: valvonta
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.23-MariaDB-9+deb9u1

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
-- Table structure for table `HourlyTemperature`
--

DROP TABLE IF EXISTS `HourlyTemperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HourlyTemperature` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Temperature` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HourlyTemperature`
--

LOCK TABLES `HourlyTemperature` WRITE;
/*!40000 ALTER TABLE `HourlyTemperature` DISABLE KEYS */;
INSERT INTO `HourlyTemperature` VALUES (1,22.4715),(2,22.5461),(3,22.6206),(4,22.5957),(5,22.6702),(6,22.8688),(7,22.695),(8,22.4964),(9,22.5957),(10,22.6454),(11,22.7199),(12,22.5461),(13,22.7695),(14,22.6702),(15,22.6206),(16,22.5461),(17,22.6702),(18,22.5957),(19,22.59),(20,23.8851),(21,23.9594),(22,23.7117),(23,23.9346),(24,23.4144);
/*!40000 ALTER TABLE `HourlyTemperature` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`t7sape02`@`%`*/ /*!50003 TRIGGER `valvonta`.`HourlyTemperature_BEFORE_INSERT` BEFORE INSERT ON `HourlyTemperature` FOR EACH ROW
BEGIN
UPDATE Laskuri SET Laskin = Laskin + 1;
IF ((SELECT Laskin FROM Laskuri) = 23) THEN
	 INSERT INTO Temperatureinfo(temperature12h, temperature24h, dt) VALUES((SELECT avg(Temperature) FROM HourlyTemperature WHERE ID > 12), (SELECT avg(Temperature) FROM HourlyTemperature),now());
	UPDATE Laskuri SET Laskin = 0;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Info`
--

DROP TABLE IF EXISTS `Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Info` (
  `PersonID` int(11) NOT NULL AUTO_INCREMENT,
  `dt` datetime DEFAULT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Info`
--

LOCK TABLES `Info` WRITE;
/*!40000 ALTER TABLE `Info` DISABLE KEYS */;
INSERT INTO `Info` VALUES (1,'2018-10-31 12:10:27'),(2,'2018-10-31 12:10:28'),(4,'2018-10-31 12:10:30'),(5,'2018-10-31 12:11:19'),(6,'2018-10-31 13:01:41'),(9,'2018-10-31 13:06:02'),(13,'2018-10-31 13:31:31'),(14,'2018-10-31 13:31:56'),(15,'2018-10-31 13:31:59'),(16,'2018-10-31 13:32:01'),(17,'2018-10-31 13:48:23'),(18,'2018-10-31 13:48:28'),(19,'2018-10-31 13:49:12'),(20,'2018-10-31 13:51:07'),(21,'2018-10-31 15:36:31'),(22,'2018-10-31 15:36:46'),(23,'2018-10-31 15:37:14'),(24,'2018-10-31 15:37:31'),(25,'2018-10-31 15:38:14'),(26,'2018-10-31 15:38:30'),(27,'2018-10-31 15:38:50'),(28,'2018-10-31 15:38:55'),(29,'2018-11-12 12:22:00'),(30,'2018-11-13 12:03:02'),(31,'2018-11-13 12:03:02'),(32,'2018-11-13 12:03:02'),(33,'2018-11-13 12:03:02'),(34,'2018-11-13 12:03:02'),(35,'2018-11-13 12:03:02'),(36,'2018-11-16 12:03:51'),(37,'2018-11-19 13:38:59'),(38,'2018-11-19 13:44:57'),(39,'2018-11-19 14:05:35'),(40,'2018-11-19 14:05:37'),(41,'2018-11-19 14:05:39'),(42,'2018-11-19 14:05:41'),(43,'2018-11-19 14:05:42'),(44,'2018-11-19 14:31:00'),(45,'2018-11-19 14:31:15'),(46,'2018-11-19 14:32:59'),(47,'2018-11-19 14:48:04'),(48,'2018-11-19 14:50:13'),(49,'2018-11-19 14:50:20'),(50,'2018-11-20 11:14:15'),(51,'2018-11-20 11:14:26'),(52,'2018-11-20 11:15:28'),(53,'2018-11-20 11:18:54'),(54,'2018-11-20 11:19:28'),(55,'2018-11-20 14:47:52'),(56,'2018-11-20 14:52:24'),(57,'2018-11-20 14:53:02'),(58,'2018-11-23 11:40:54'),(59,'2018-11-23 11:41:12'),(60,'2018-11-23 11:41:16'),(61,'2018-11-23 11:41:33'),(62,'2018-11-23 11:41:38'),(63,'2018-11-23 11:41:50'),(64,'2018-11-23 11:41:58'),(65,'2018-11-23 11:42:46'),(66,'2018-11-23 11:42:51'),(67,'2018-11-27 13:39:38'),(68,'2018-11-27 13:39:54'),(69,'2018-11-27 13:39:54'),(70,'2018-11-27 13:39:54'),(71,'2018-11-27 13:39:57'),(72,'2018-11-27 13:39:58'),(73,'2018-11-27 13:40:23'),(74,'2018-11-27 13:40:29'),(75,'2018-11-27 13:40:39'),(76,'2018-11-27 13:40:48'),(77,'2018-11-27 13:40:59'),(78,'2018-11-27 13:41:04'),(79,'2018-11-27 13:47:27'),(80,'2018-11-27 13:47:32'),(81,'2018-11-27 13:47:37'),(82,'2018-11-27 13:47:42'),(83,'2018-11-27 13:47:45'),(84,'2018-11-27 13:47:47'),(85,'2018-11-27 13:48:09'),(86,'2018-11-27 13:48:11'),(87,'2018-11-27 13:48:14'),(88,'2018-11-27 13:48:18'),(89,'2018-11-27 13:48:25'),(90,'2018-12-10 09:58:21'),(91,'2018-12-10 09:58:25'),(92,'2018-12-10 09:58:26'),(93,'2018-12-10 10:02:22'),(94,'2018-12-10 10:02:50'),(95,'2018-12-10 10:07:28'),(96,'2018-12-10 10:08:07'),(97,'2018-12-10 10:08:49'),(98,'2018-12-10 11:07:28'),(99,'2018-12-10 11:07:33'),(100,'2018-12-10 11:07:34'),(101,'2018-12-10 11:07:35'),(102,'2018-12-10 11:07:37'),(103,'2018-12-10 11:07:38'),(104,'2018-12-10 11:07:39'),(105,'2018-12-10 11:07:41'),(106,'2018-12-10 11:07:42'),(107,'2018-12-10 11:07:43'),(108,'2018-12-10 11:07:44'),(109,'2018-12-10 11:07:46'),(110,'2018-12-10 11:07:47'),(111,'2018-12-10 11:07:48'),(112,'2018-12-10 11:07:49'),(113,'2018-12-10 11:07:50'),(114,'2018-12-10 11:07:51'),(115,'2018-12-10 11:07:53'),(116,'2018-12-10 11:07:54'),(117,'2018-12-10 11:07:55'),(118,'2018-12-10 11:07:56'),(119,'2018-12-10 11:07:57'),(120,'2018-12-10 11:08:01'),(121,'2018-12-10 11:08:02'),(122,'2018-12-10 11:08:03'),(123,'2018-12-10 11:08:04'),(124,'2018-12-10 11:08:05'),(125,'2018-12-10 11:08:06'),(126,'2018-12-10 11:08:07'),(127,'2018-12-10 11:08:09'),(128,'2018-12-10 11:08:10'),(129,'2018-12-10 11:37:02'),(130,'2018-12-10 11:38:07'),(131,'2018-12-10 11:40:15'),(132,'2018-12-10 11:40:34'),(133,'2018-12-10 11:40:43'),(134,'2018-12-10 11:41:10'),(135,'2018-12-10 11:42:16'),(136,'2018-12-10 11:42:50'),(137,'2018-12-10 11:45:46'),(138,'2018-12-10 11:46:06'),(139,'2018-12-10 11:51:02'),(140,'2018-12-10 11:51:10'),(141,'2018-12-10 11:51:25'),(142,'2018-12-10 11:54:06'),(143,'2018-12-10 11:54:36'),(144,'2018-12-10 13:10:42'),(145,'2018-12-10 13:11:02'),(146,'2018-12-10 13:11:33'),(147,'2018-12-10 13:13:57'),(148,'2018-12-10 13:14:11'),(149,'2018-12-10 13:14:19'),(150,'2018-12-10 13:14:27'),(151,'2018-12-10 13:14:42'),(152,'2018-12-10 13:28:35'),(153,'2018-12-10 13:29:58'),(154,'2018-12-10 13:31:25'),(155,'2018-12-10 13:31:33'),(156,'2018-12-10 13:31:42'),(157,'2018-12-10 13:32:15'),(158,'2018-12-10 13:32:19'),(159,'2018-12-10 13:36:11'),(160,'2018-12-10 13:36:36'),(161,'2018-12-10 13:36:44'),(162,'2018-12-10 14:58:44'),(163,'2018-12-10 14:59:16'),(164,'2018-12-10 14:59:34'),(165,'2018-12-10 14:59:44'),(166,'2018-12-10 14:59:50'),(167,'2018-12-10 15:00:09'),(168,'2018-12-10 15:00:27'),(169,'2018-12-10 15:27:38'),(170,'2018-12-10 15:29:26'),(171,'2018-12-10 15:30:26'),(172,'2018-12-10 15:31:00'),(173,'2018-12-10 15:31:07'),(174,'2018-12-10 15:34:51'),(175,'2018-12-10 15:50:40'),(176,'2018-12-11 09:14:02'),(177,'2018-12-11 09:14:03'),(178,'2018-12-11 09:14:52'),(179,'2018-12-11 09:14:53'),(180,'2018-12-11 09:15:10'),(181,'2018-12-11 09:15:13'),(182,'2018-12-11 09:48:15'),(183,'2018-12-11 09:49:24'),(184,'2018-12-11 09:50:25'),(185,'2018-12-11 09:52:02'),(186,'2018-12-11 09:52:06'),(187,'2018-12-11 09:53:21'),(188,'2018-12-11 09:53:26'),(189,'2018-12-11 10:09:09'),(190,'2018-12-11 10:13:53'),(191,'2018-12-11 10:14:30'),(192,'2018-12-11 10:15:13'),(193,'2018-12-11 10:15:36'),(194,'2018-12-11 10:15:41'),(195,'2018-12-11 10:16:14'),(196,'2018-12-11 10:16:33'),(197,'2018-12-11 10:16:54'),(198,'2018-12-11 10:18:33'),(199,'2018-12-11 10:23:30'),(200,'2018-12-11 10:26:34'),(201,'2018-12-11 10:28:07'),(202,'2018-12-11 10:31:17'),(203,'2018-12-11 10:31:22'),(204,'2018-12-11 10:32:52'),(205,'2018-12-11 10:33:24'),(206,'2018-12-11 10:35:11'),(207,'2018-12-11 10:36:36'),(208,'2018-12-11 10:36:58'),(209,'2018-12-11 10:37:05'),(210,'2018-12-11 10:37:13'),(211,'2018-12-11 10:37:20'),(212,'2018-12-11 10:37:25'),(213,'2018-12-11 10:37:38'),(214,'2018-12-11 10:37:58'),(215,'2018-12-11 10:38:05'),(216,'2018-12-11 10:38:11'),(217,'2018-12-11 10:38:16'),(218,'2018-12-11 10:38:21'),(219,'2018-12-11 10:38:26'),(220,'2018-12-11 10:38:40'),(221,'2018-12-11 10:38:48'),(222,'2018-12-11 10:38:55'),(223,'2018-12-11 10:40:43'),(224,'2018-12-11 10:40:47'),(225,'2018-12-11 10:40:48'),(226,'2018-12-11 10:40:49'),(227,'2018-12-11 10:40:50'),(228,'2018-12-11 10:40:52'),(229,'2018-12-11 10:40:53'),(230,'2018-12-11 10:40:54'),(231,'2018-12-11 10:40:55'),(232,'2018-12-11 10:40:56'),(233,'2018-12-11 10:40:58'),(234,'2018-12-11 10:40:59'),(235,'2018-12-11 10:41:10'),(236,'2018-12-11 10:41:22'),(237,'2018-12-11 10:41:31'),(238,'2018-12-11 10:41:38'),(239,'2018-12-11 10:51:05'),(240,'2018-12-11 11:14:44'),(241,'2018-12-11 11:19:43'),(242,'2018-12-11 11:26:55'),(243,'2018-12-11 11:29:36'),(244,'2018-12-11 11:31:26'),(245,'2018-12-11 12:21:16'),(246,'2018-12-11 12:21:21'),(247,'2018-12-11 12:21:22'),(248,'2018-12-11 12:21:23'),(249,'2018-12-11 12:21:30'),(250,'2018-12-11 12:22:27'),(251,'2018-12-11 12:28:05'),(252,'2018-12-11 12:29:58'),(253,'2018-12-11 12:33:28'),(254,'2018-12-11 12:34:50'),(255,'2018-12-11 13:33:49'),(256,'2018-12-11 13:33:54'),(257,'2018-12-11 13:39:33'),(258,'2018-12-11 13:39:37'),(259,'2018-12-11 13:40:51'),(260,'2018-12-11 13:41:45'),(261,'2018-12-11 13:43:22'),(262,'2018-12-11 14:02:00'),(263,'2018-12-11 14:03:16'),(264,'2018-12-11 14:04:43'),(265,'2018-12-11 14:05:23'),(266,'2018-12-11 14:06:56'),(267,'2018-12-11 14:08:29'),(268,'2018-12-11 14:11:18'),(269,'2018-12-11 14:11:53'),(270,'2018-12-11 14:12:56'),(271,'2018-12-11 14:13:19'),(272,'2018-12-11 14:13:53'),(273,'2018-12-11 14:14:29'),(274,'2018-12-11 14:15:34'),(275,'2018-12-11 14:18:18'),(276,'2018-12-11 14:18:41'),(277,'2018-12-11 14:19:10'),(278,'2018-12-11 14:21:27'),(279,'2018-12-11 14:22:53'),(280,'2018-12-11 14:24:29'),(281,'2018-12-11 14:24:56'),(282,'2018-12-11 14:25:21'),(283,'2018-12-11 14:25:43'),(284,'2018-12-11 14:26:39'),(285,'2018-12-11 14:27:22'),(286,'2018-12-11 14:27:56'),(287,'2018-12-11 14:29:03'),(288,'2018-12-11 14:29:04'),(289,'2018-12-11 14:29:43'),(290,'2018-12-11 14:32:22'),(291,'2018-12-11 14:34:24'),(292,'2018-12-11 14:36:23'),(293,'2018-12-11 14:36:24'),(294,'2018-12-11 14:36:25'),(295,'2018-12-11 14:36:26'),(296,'2018-12-11 14:36:40'),(297,'2018-12-11 14:37:25'),(298,'2018-12-11 14:38:00'),(299,'2018-12-11 14:38:21'),(300,'2018-12-11 14:38:41'),(301,'2018-12-11 14:39:44'),(302,'2018-12-11 14:40:09'),(303,'2018-12-11 14:40:37'),(304,'2018-12-11 15:00:48'),(305,'2018-12-11 15:02:33'),(306,'2018-12-11 15:05:09'),(307,'2018-12-11 15:05:29'),(308,'2018-12-11 15:10:32'),(309,'2018-12-11 15:11:24'),(310,'2018-12-11 15:24:27'),(311,'2018-12-11 15:29:37'),(312,'2018-12-11 15:31:40'),(313,'2018-12-11 15:34:33'),(314,'2018-12-11 15:53:17'),(315,'2018-12-11 15:56:12'),(316,'2018-12-11 15:56:53'),(317,'2018-12-11 16:09:09'),(318,'2018-12-11 16:25:31'),(319,'2018-12-11 16:27:38'),(320,'2018-12-11 16:38:02'),(321,'2018-12-11 16:55:37'),(322,'2018-12-11 16:59:29'),(323,'2018-12-11 17:00:20'),(324,'2018-12-11 17:01:49'),(325,'2018-12-11 17:02:24'),(326,'2018-12-11 17:03:53'),(327,'2018-12-11 17:04:31'),(328,'2018-12-11 17:05:06'),(329,'2018-12-11 17:08:26'),(330,'2018-12-11 17:09:38'),(331,'2018-12-12 07:16:59'),(332,'2018-12-12 07:19:02'),(333,'2018-12-12 07:21:02'),(334,'2018-12-12 07:22:42'),(335,'2018-12-12 09:54:49'),(336,'2018-12-12 09:55:34'),(337,'2018-12-12 09:56:03'),(338,'2018-12-12 09:57:53'),(339,'2018-12-12 09:58:50'),(340,'2018-12-12 09:59:19'),(341,'2018-12-12 10:02:07'),(342,'2018-12-12 10:03:22'),(343,'2018-12-12 10:04:50'),(344,'2018-12-12 10:05:42'),(345,'2018-12-12 10:07:41'),(346,'2018-12-12 10:09:17'),(347,'2018-12-12 10:14:15'),(348,'2018-12-12 10:18:42'),(349,'2018-12-12 10:19:58'),(350,'2018-12-12 10:20:16'),(351,'2018-12-12 10:22:03'),(352,'2018-12-12 10:26:30'),(353,'2018-12-12 10:30:13'),(354,'2018-12-12 10:36:53'),(355,'2018-12-12 10:40:55'),(356,'2018-12-12 10:43:15'),(357,'2018-12-12 10:45:39'),(358,'2018-12-12 10:47:26'),(359,'2018-12-12 10:50:22'),(360,'2018-12-12 10:51:59'),(361,'2018-12-12 10:55:05'),(362,'2018-12-12 10:56:19'),(363,'2018-12-12 10:58:06'),(364,'2018-12-12 10:58:53'),(365,'2018-12-12 10:59:24'),(366,'2018-12-12 10:59:55'),(367,'2018-12-12 11:00:46'),(368,'2018-12-12 11:03:19'),(369,'2018-12-12 11:05:02'),(370,'2018-12-12 11:06:31'),(371,'2018-12-12 11:07:51'),(372,'2018-12-12 11:09:09'),(373,'2018-12-12 11:13:16'),(374,'2018-12-12 11:14:57'),(375,'2018-12-12 11:15:25'),(376,'2018-12-12 11:16:42'),(377,'2018-12-12 11:17:59'),(378,'2018-12-12 11:18:37'),(379,'2018-12-12 11:23:53'),(380,'2018-12-12 11:25:39'),(381,'2018-12-12 11:26:05'),(382,'2018-12-12 11:33:09'),(383,'2018-12-12 11:35:15'),(384,'2018-12-12 11:38:16'),(385,'2018-12-12 11:38:35'),(386,'2018-12-12 11:39:43'),(387,'2018-12-12 12:26:58'),(388,'2018-12-12 12:27:53'),(389,'2018-12-12 12:28:34'),(390,'2018-12-12 13:09:15'),(391,'2018-12-12 13:10:12'),(392,'2018-12-12 13:11:04'),(393,'2018-12-12 13:11:44'),(394,'2018-12-12 13:13:05'),(395,'2018-12-12 13:14:35'),(396,'2018-12-12 13:15:28'),(397,'2018-12-12 13:15:49'),(398,'2018-12-12 13:16:07'),(399,'2018-12-12 13:17:03'),(400,'2018-12-12 13:17:49'),(401,'2018-12-12 13:18:10'),(402,'2018-12-12 13:20:22'),(403,'2018-12-12 13:20:48'),(404,'2018-12-12 13:21:37'),(405,'2018-12-12 13:54:08'),(406,'2018-12-12 13:54:51'),(407,'2018-12-12 14:03:13'),(408,'2018-12-12 14:07:33'),(409,'2018-12-12 14:08:44'),(410,'2018-12-12 14:09:16'),(411,'2018-12-12 14:10:00'),(412,'2018-12-12 14:10:32'),(413,'2018-12-12 14:15:19'),(414,'2018-12-12 14:16:28'),(415,'2018-12-12 14:19:05'),(416,'2018-12-12 14:19:23'),(417,'2018-12-12 14:20:08'),(418,'2018-12-12 14:20:57'),(419,'2018-12-12 14:21:35'),(420,'2018-12-12 14:22:21'),(421,'2018-12-12 14:23:04'),(422,'2018-12-12 14:30:04'),(423,'2018-12-12 14:32:22'),(424,'2018-12-12 14:44:48'),(425,'2018-12-12 14:46:06'),(426,'2018-12-12 14:48:46'),(427,'2018-12-12 14:51:46'),(428,'2018-12-12 14:52:19'),(429,'2018-12-12 14:53:18'),(430,'2018-12-12 14:54:33'),(431,'2018-12-12 14:56:12'),(432,'2018-12-12 14:56:56'),(433,'2018-12-12 14:57:27'),(434,'2018-12-13 07:16:18'),(435,'2018-12-13 07:16:40'),(436,'2018-12-13 07:19:01'),(437,'2018-12-13 10:33:42'),(438,'2018-12-13 10:34:56'),(439,'2018-12-13 10:36:15'),(440,'2018-12-13 10:36:38'),(441,'2018-12-13 10:40:37'),(442,'2018-12-13 10:46:31'),(443,'2018-12-13 12:00:05'),(444,'2018-12-13 12:00:32'),(445,'2018-12-13 12:01:13'),(446,'2018-12-13 12:03:29'),(447,'2018-12-13 12:05:46'),(448,'2018-12-13 12:08:24'),(449,'2018-12-13 12:30:26'),(450,'2018-12-13 12:30:59'),(451,'2018-12-13 12:31:30'),(452,'2018-12-13 12:32:09'),(453,'2018-12-13 12:34:27'),(454,'2018-12-13 12:40:00'),(455,'2018-12-13 12:40:40'),(456,'2018-12-13 12:41:49'),(457,'2018-12-13 12:43:04'),(458,'2018-12-13 12:43:20'),(459,'2018-12-13 12:44:42'),(460,'2018-12-13 12:47:05'),(461,'2018-12-13 15:08:45'),(462,'2018-12-13 15:10:54'),(463,'2018-12-13 15:32:06'),(464,'2018-12-13 15:33:45'),(465,'2018-12-13 15:35:37'),(466,'2018-12-13 15:37:39'),(467,'2018-12-13 15:39:26'),(468,'2018-12-13 15:51:47'),(469,'2018-12-13 15:58:24'),(470,'2018-12-13 16:01:36'),(471,'2018-12-13 16:03:34'),(472,'2018-12-13 16:20:27'),(473,'2018-12-13 16:21:37'),(474,'2018-12-13 16:33:14'),(475,'2018-12-14 07:24:09'),(476,'2018-12-14 07:24:25'),(477,'2018-12-14 07:25:35'),(478,'2018-12-14 07:25:53'),(479,'2018-12-14 07:28:12'),(480,'2018-12-14 07:28:38'),(481,'2018-12-14 07:28:55'),(482,'2018-12-14 07:30:01'),(483,'2018-12-14 07:30:30'),(484,'2018-12-14 10:38:42'),(485,'2018-12-14 10:43:30'),(486,'2018-12-14 10:44:00'),(487,'2018-12-14 10:51:30'),(488,'2018-12-14 10:53:21'),(489,'2018-12-14 10:53:59'),(490,'2018-12-14 11:03:53'),(491,'2018-12-14 11:04:33'),(492,'2018-12-14 11:05:15'),(493,'2018-12-14 11:05:49'),(494,'2018-12-14 11:06:58'),(495,'2018-12-14 11:07:29'),(496,'2018-12-14 11:08:08'),(497,'2018-12-14 11:08:37'),(498,'2018-12-14 11:10:32'),(499,'2018-12-14 11:11:19'),(500,'2018-12-14 11:12:07'),(501,'2018-12-14 11:12:41'),(502,'2018-12-14 11:16:27'),(503,'2018-12-14 11:18:37'),(504,'2018-12-14 11:23:14'),(505,'2018-12-14 11:24:48'),(506,'2018-12-14 11:28:00'),(507,'2018-12-14 11:28:25'),(508,'2018-12-14 11:28:46'),(509,'2018-12-14 11:30:21'),(510,'2018-12-14 11:31:10'),(511,'2018-12-14 11:33:23'),(512,'2018-12-14 11:33:43'),(513,'2018-12-14 11:34:05'),(514,'2018-12-14 11:35:41'),(515,'2018-12-14 11:37:27'),(516,'2018-12-14 11:39:54'),(517,'2018-12-14 11:40:13'),(518,'2018-12-14 11:58:39'),(519,'2018-12-14 12:39:38'),(520,'2018-12-14 12:39:42'),(521,'2018-12-14 12:39:43'),(522,'2018-12-14 12:39:44'),(523,'2018-12-14 12:39:45'),(524,'2018-12-14 12:39:52'),(525,'2018-12-14 12:42:18'),(526,'2018-12-14 12:42:21'),(527,'2018-12-14 12:42:48'),(528,'2018-12-14 12:43:13'),(529,'2018-12-14 12:44:46'),(530,'2018-12-14 12:45:24'),(531,'2018-12-14 12:46:01'),(532,'2018-12-14 12:48:54'),(533,'2018-12-14 12:52:15'),(534,'2018-12-14 12:53:39'),(535,'2018-12-14 12:54:24'),(536,'2018-12-14 12:55:22'),(537,'2018-12-14 12:55:41'),(538,'2018-12-14 12:56:57'),(539,'2018-12-14 12:58:47'),(540,'2018-12-14 12:59:48'),(541,'2018-12-14 13:01:51'),(542,'2018-12-14 13:03:07'),(543,'2018-12-14 13:04:09'),(544,'2018-12-14 13:04:57'),(545,'2018-12-14 13:09:11'),(546,'2018-12-14 13:33:23'),(547,'2018-12-14 13:34:18'),(548,'2018-12-14 13:34:56'),(549,'2018-12-14 13:37:17'),(550,'2018-12-14 13:38:18'),(551,'2018-12-14 13:38:45'),(552,'2018-12-14 13:39:44'),(553,'2018-12-14 13:43:01'),(554,'2018-12-14 13:44:52'),(555,'2018-12-14 13:45:53');
/*!40000 ALTER TABLE `Info` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`t7sape02`@`%`*/ /*!50003 TRIGGER halytystilaOnOffCheck BEFORE INSERT ON Info
FOR EACH ROW
	IF((SELECT auto_on_off  FROM halytys) = TRUE OR (SELECT on_off FROM halytys) = TRUE) THEN
    UPDATE halytys 
    SET halytys.halytystila_on_off = TRUE WHERE halytysID = 1;
    
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Laskuri`
--

DROP TABLE IF EXISTS `Laskuri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Laskuri` (
  `ID` int(11) NOT NULL,
  `Laskin` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Laskuri`
--

LOCK TABLES `Laskuri` WRITE;
/*!40000 ALTER TABLE `Laskuri` DISABLE KEYS */;
INSERT INTO `Laskuri` VALUES (1,5);
/*!40000 ALTER TABLE `Laskuri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Temperatureinfo`
--

DROP TABLE IF EXISTS `Temperatureinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Temperatureinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `temperature12h` float DEFAULT NULL,
  `temperature24h` float DEFAULT NULL,
  `dt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Temperatureinfo`
--

LOCK TABLES `Temperatureinfo` WRITE;
/*!40000 ALTER TABLE `Temperatureinfo` DISABLE KEYS */;
INSERT INTO `Temperatureinfo` VALUES (10,22.7653,23.1689,'2018-12-12 12:20:38'),(11,22.8398,22.9018,'2018-12-13 11:20:39'),(12,22.6309,22.758,'2018-12-14 10:46:17');
/*!40000 ALTER TABLE `Temperatureinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halytys`
--

DROP TABLE IF EXISTS `halytys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `halytys` (
  `halytysID` int(11) DEFAULT NULL,
  `on_off` tinyint(1) DEFAULT NULL,
  `auto_on_off` tinyint(1) DEFAULT NULL,
  `verify` tinyint(1) DEFAULT NULL,
  `dt` time DEFAULT NULL,
  `dt2` time DEFAULT NULL,
  `ovi_onOff` tinyint(1) DEFAULT NULL,
  `halytystila_on_off` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halytys`
--

LOCK TABLES `halytys` WRITE;
/*!40000 ALTER TABLE `halytys` DISABLE KEYS */;
INSERT INTO `halytys` VALUES (1,0,0,0,'13:00:00','14:00:00',1,0);
/*!40000 ALTER TABLE `halytys` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`t7sape02`@`%`*/ /*!50003 TRIGGER kk BEFORE UPDATE ON halytys
FOR EACH ROW 
	IF(NEW.auto_on_off = TRUE && NEW.verify = FALSE) THEN
		SET NEW.auto_on_off = FALSE;
	ELSEIF (NEW.on_off = TRUE && NEW.auto_on_off = TRUE) THEN
		SET NEW.on_off = FALSE;
	ELSEIF(NEW.on_off = FALSE && NEW.auto_on_off = TRUE) THEN
		SET NEW.on_off = FALSE;
    
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `loggingInfo`
--

DROP TABLE IF EXISTS `loggingInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loggingInfo` (
  `ID` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `psw2` varchar(255) DEFAULT NULL,
  `Email` char(30) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loggingInfo`
--

LOCK TABLES `loggingInfo` WRITE;
/*!40000 ALTER TABLE `loggingInfo` DISABLE KEYS */;
INSERT INTO `loggingInfo` VALUES (1,'sapeee','$2y$10$3R/Bxt7TlAdtpTQlVXXIV.0r3wZNHQC5caShT76OZczCEwfCL3Y/K','dsdsds','t6puos00@students.oamk.fi','2018-10-31 15:22:06');
/*!40000 ALTER TABLE `loggingInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oviinfo`
--

DROP TABLE IF EXISTS `oviinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oviinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dt` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oviinfo`
--

LOCK TABLES `oviinfo` WRITE;
/*!40000 ALTER TABLE `oviinfo` DISABLE KEYS */;
INSERT INTO `oviinfo` VALUES (1,'2018-11-16 11:36:10'),(2,'2018-11-16 11:36:11'),(3,'2018-11-16 11:36:12'),(4,'2018-11-16 12:04:50'),(5,'2018-11-19 13:38:33'),(6,'2018-11-19 13:39:27'),(7,'2018-11-19 13:39:31'),(8,'2018-11-19 13:39:36'),(9,'2018-11-19 13:40:00'),(10,'2018-11-19 13:40:01'),(11,'2018-11-19 13:40:02'),(12,'2018-11-19 13:40:03'),(13,'2018-11-19 13:40:04'),(14,'2018-11-19 13:41:55'),(15,'2018-11-19 13:43:22'),(16,'2018-11-19 13:43:23'),(17,'2018-11-19 13:43:28'),(18,'2018-11-19 13:43:42'),(19,'2018-11-19 13:43:52'),(20,'2018-11-19 13:43:55'),(21,'2018-11-19 13:43:56'),(22,'2018-11-19 13:43:57'),(23,'2018-11-19 13:44:02'),(24,'2018-11-19 13:44:11'),(25,'2018-11-19 13:44:42'),(26,'2018-11-19 14:08:03'),(27,'2018-11-19 14:09:16'),(28,'2018-11-19 14:11:40'),(29,'2018-11-19 14:14:15'),(30,'2018-11-19 14:15:09'),(31,'2018-11-19 14:15:11'),(32,'2018-11-19 14:15:17'),(33,'2018-11-19 14:15:18'),(34,'2018-11-19 14:16:01'),(35,'2018-11-19 14:17:22'),(36,'2018-11-19 14:18:19'),(37,'2018-11-19 14:20:17'),(38,'2018-11-19 14:20:18'),(39,'2018-11-19 14:20:24'),(40,'2018-11-19 14:21:16'),(41,'2018-11-19 14:22:34'),(42,'2018-11-19 14:23:26'),(43,'2018-11-19 14:24:25'),(44,'2018-11-19 14:25:33'),(45,'2018-11-19 14:26:21'),(46,'2018-11-19 14:27:06'),(47,'2018-11-19 14:27:58'),(48,'2018-11-19 14:30:57'),(49,'2018-11-19 14:31:14'),(50,'2018-11-19 14:32:56'),(51,'2018-11-19 14:50:10'),(52,'2018-11-19 14:50:11'),(53,'2018-11-19 14:50:16'),(54,'2018-11-19 14:50:17'),(55,'2018-11-23 10:31:45'),(56,'2018-11-23 10:31:55'),(57,'2018-11-23 10:34:25'),(58,'2018-11-23 10:35:44'),(59,'2018-11-23 10:37:49'),(60,'2018-11-23 10:40:18'),(61,'2018-11-23 10:40:24'),(62,'2018-11-23 10:40:25'),(63,'2018-11-23 10:40:26'),(64,'2018-11-23 10:40:26'),(65,'2018-11-23 10:40:28'),(66,'2018-11-23 10:40:29'),(67,'2018-11-23 10:40:30'),(68,'2018-11-23 10:40:30'),(69,'2018-11-23 10:40:31'),(70,'2018-11-23 10:40:32'),(71,'2018-11-23 10:40:32'),(72,'2018-11-23 10:40:33'),(73,'2018-11-23 10:44:38'),(74,'2018-11-23 10:45:23'),(75,'2018-11-23 10:46:59'),(76,'2018-11-23 10:49:41'),(77,'2018-11-23 10:49:50'),(78,'2018-11-23 10:49:55'),(79,'2018-11-23 10:50:03'),(80,'2018-11-23 10:51:29'),(81,'2018-11-23 10:52:05'),(82,'2018-11-23 10:52:08'),(83,'2018-11-23 10:52:19'),(84,'2018-11-23 10:53:05'),(85,'2018-11-23 10:53:06'),(86,'2018-11-23 10:53:07'),(87,'2018-11-23 10:54:00'),(88,'2018-11-23 10:54:04'),(89,'2018-11-23 10:54:19'),(90,'2018-11-23 10:55:14'),(91,'2018-11-23 10:55:44'),(92,'2018-11-23 11:24:38'),(93,'2018-11-23 11:24:52'),(94,'2018-11-23 11:24:52'),(95,'2018-11-23 11:24:53'),(96,'2018-11-23 11:24:54'),(97,'2018-11-23 11:24:54'),(98,'2018-11-23 11:24:55'),(99,'2018-11-23 11:24:56'),(100,'2018-11-23 11:24:56'),(101,'2018-11-23 11:26:36'),(102,'2018-11-23 11:26:47'),(103,'2018-11-23 11:26:56'),(104,'2018-11-23 11:27:00'),(105,'2018-11-23 11:27:02'),(106,'2018-11-23 11:28:36'),(107,'2018-11-23 11:30:52'),(108,'2018-11-23 11:31:01'),(109,'2018-11-23 11:31:07'),(110,'2018-11-23 11:32:44'),(111,'2018-11-23 11:32:47'),(112,'2018-11-23 11:32:49'),(113,'2018-11-23 11:32:49'),(114,'2018-11-23 11:32:51'),(115,'2018-11-23 11:32:53'),(116,'2018-11-23 11:32:53'),(117,'2018-11-23 11:32:56'),(118,'2018-11-23 11:32:57'),(119,'2018-11-23 11:32:58'),(120,'2018-11-23 11:32:59'),(121,'2018-11-23 11:32:59'),(122,'2018-11-23 11:33:02'),(123,'2018-11-23 11:40:33'),(124,'2018-11-23 11:40:41'),(125,'2018-11-23 11:40:47'),(126,'2018-11-23 11:40:48'),(127,'2018-11-23 11:40:50'),(128,'2018-11-27 13:38:22'),(129,'2018-11-27 13:39:14'),(130,'2018-11-27 13:40:21'),(131,'2018-11-27 13:40:24'),(132,'2018-12-10 10:03:21'),(133,'2018-12-10 10:03:29'),(134,'2018-12-10 10:05:24'),(135,'2018-12-10 10:05:34'),(136,'2018-12-10 11:38:09'),(137,'2018-12-10 11:41:12'),(138,'2018-12-10 11:42:52'),(139,'2018-12-10 11:46:08'),(140,'2018-12-10 11:51:11'),(141,'2018-12-10 11:51:11'),(142,'2018-12-10 11:51:26'),(143,'2018-12-10 11:51:29'),(144,'2018-12-10 11:54:10'),(145,'2018-12-10 13:10:47'),(146,'2018-12-10 13:14:11'),(147,'2018-12-10 13:14:50'),(148,'2018-12-10 13:32:13'),(149,'2018-12-11 09:53:26'),(150,'2018-12-11 09:53:35'),(151,'2018-12-11 10:08:04'),(152,'2018-12-11 10:12:54'),(153,'2018-12-11 10:37:01'),(154,'2018-12-11 12:31:36'),(155,'2018-12-11 13:33:55'),(156,'2018-12-11 13:34:02'),(157,'2018-12-11 13:34:07'),(158,'2018-12-11 13:34:11'),(159,'2018-12-11 13:34:14'),(160,'2018-12-11 14:12:05'),(161,'2018-12-12 10:05:49'),(162,'2018-12-13 15:32:09'),(163,'2018-12-14 10:39:47'),(164,'2018-12-14 13:08:36'),(165,'2018-12-14 13:08:39'),(166,'2018-12-14 13:08:46'),(167,'2018-12-14 13:08:50'),(168,'2018-12-14 13:08:53'),(169,'2018-12-14 13:08:56'),(170,'2018-12-14 13:08:59'),(171,'2018-12-14 13:09:02'),(172,'2018-12-14 13:09:05'),(173,'2018-12-14 13:09:08'),(174,'2018-12-14 13:09:38'),(175,'2018-12-14 13:09:58'),(176,'2018-12-14 13:37:13'),(177,'2018-12-14 13:38:54'),(178,'2018-12-14 13:39:43'),(179,'2018-12-14 13:42:29');
/*!40000 ALTER TABLE `oviinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`t7sape02`@`%`*/ /*!50003 TRIGGER halytystilaOnOffCheckDoor BEFORE INSERT ON oviinfo
FOR EACH ROW
	IF((SELECT auto_on_off  FROM halytys) = TRUE OR (SELECT on_off FROM halytys) = TRUE) THEN
    UPDATE halytys 
    SET halytys.halytystila_on_off = TRUE WHERE halytysID = 1;
    
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'valvonta'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `autohalytarkistus` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`t7sape02`@`%`*/ /*!50106 EVENT `autohalytarkistus` ON SCHEDULE EVERY 1 SECOND STARTS '2018-12-10 13:34:34' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	IF((SELECT dt2 FROM halytys) < (SELECT dt FROM halytys)) THEN
		IF((SELECT dt FROM halytys)	< CURRENT_TIME() AND CURRENT_TIME() < STR_TO_DATE('23:59:00','%T' )) or (STR_TO_DATE('00:00:00','%T') < CURRENT_TIME() AND CURRENT_TIME() < (SELECT dt2 FROM halytys))
	THEN UPDATE halytys SET auto_on_off = true WHERE halytysID = 1;
    END IF;
		
	ELSEIF((SELECT dt FROM halytys) < CURRENT_TIME() AND CURRENT_TIME() < (SELECT dt2 FROM halytys)) THEN
		UPDATE halytys SET auto_on_off = true WHERE halytysID = 1;
	
	ELSE 
    UPDATE halytys SET auto_on_off = false WHERE halytysID = 1;
     END IF;
     
        END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `lampotilapaivitys` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`t7sape02`@`%`*/ /*!50106 EVENT `lampotilapaivitys` ON SCHEDULE EVERY 1 SECOND STARTS '2018-12-10 11:06:14' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
			if((SELECT COUNT(*) FROM HourlyTemperature) > 24) THEN
            DELETE FROM HourlyTemperature LIMIT 1;
            SET @count = 0;
			update HourlyTemperature set HourlyTemperature.ID = @count:= @count + 1;
            END IF;
           
		END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'valvonta'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetPersonIDTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetPersonIDTable`()
BEGIN
SELECT * FROM Info;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTemperatureTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`t7sape02`@`%` PROCEDURE `GetTemperatureTable`()
BEGIN
select dt, temperature12h, temperature24h from Temperatureinfo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PutInfoAndTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PutInfoAndTime`()
BEGIN
IF((SELECT auto_on_off FROM halytys) = TRUE OR (SELECT on_off FROM halytys) = TRUE) THEN
	INSERT INTO Info(dt) VALUES (now());
	ELSE DO NULL;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Put_door_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Put_door_info`()
BEGIN
IF((SELECT auto_on_off FROM halytys) = TRUE OR (SELECT on_off FROM halytys) = TRUE) THEN
		IF(SELECT ovi_onOff FROM halytys) = TRUE THEN
		INSERT INTO oviinfo(dt) VALUES (now());
    ELSE DO NULL;
		END IF;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Stop_alarm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Stop_alarm`()
BEGIN
UPDATE halytys
SET halytystila_on_off = FALSE
WHERE
halytysID = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_auto_off` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_auto_off`()
BEGIN
UPDATE halytys
SET
	auto_on_off = false
WHERE
	halytysID = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_auto_on` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_auto_on`()
BEGIN
UPDATE halytys
SET
	auto_on_off = true
WHERE
	halytysID = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_off` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_off`()
BEGIN
UPDATE halytys
SET
	on_off = false
WHERE
	halytysID = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_on` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_on`()
BEGIN
UPDATE halytys
SET
	on_off = true
WHERE
	halytysID = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ovi_off` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_ovi_off`()
BEGIN
UPDATE halytys
SET
ovi_onOff = FALSE
WHERE
halytysID = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ovi_on` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_ovi_on`()
BEGIN
UPDATE halytys
SET
ovi_onOff = TRUE
WHERE
halytysID = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_verify_off` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_verify_off`()
BEGIN
UPDATE halytys
SET
	verify = false
WHERE
	halytysID = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_verify_on` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_verify_on`()
BEGIN

UPDATE halytys
SET
	verify = true
WHERE
	halytysID = 1;

IF((SELECT dt2 FROM halytys) < (SELECT dt FROM halytys)) THEN
IF((SELECT dt FROM halytys)	< CURRENT_TIME() AND CURRENT_TIME() < STR_TO_DATE('23:59:00','%T' )) or (STR_TO_DATE('00:00:00','%T') < CURRENT_TIME() AND CURRENT_TIME() < (SELECT dt2 FROM halytys))
	THEN UPDATE halytys SET auto_on_off = true WHERE halytysID = 1;
END IF;
END IF;
IF((SELECT dt FROM halytys) < CURRENT_TIME() AND CURRENT_TIME() < (SELECT dt2 FROM halytys)) THEN
	UPDATE halytys SET auto_on_off = true WHERE halytysID = 1;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-14 13:51:57
