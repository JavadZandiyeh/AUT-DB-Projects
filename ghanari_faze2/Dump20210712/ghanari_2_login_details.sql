-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: ghanari_2
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `Login` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Username` (`Username`),
  CONSTRAINT `login_details_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
INSERT INTO `login_details` VALUES (1,'MJZandiyeh','2021-07-10 15:29:58'),(2,'RahimRahim','2021-07-10 15:30:57'),(3,'Roshan Vali Khamosh','2021-07-10 15:32:32'),(4,'AT','2021-07-10 15:32:50'),(5,'poorya','2021-07-10 15:33:05'),(6,'FR','2021-07-10 15:33:21'),(7,'Roshan Vali Khamosh','2021-07-11 05:46:23'),(8,'poorya','2021-07-11 05:46:55'),(9,'RahimRahim','2021-07-11 05:47:12'),(10,'Roshan Vali Khamosh','2021-07-11 05:47:28'),(11,'MJZandiyeh','2021-07-11 05:47:50'),(12,'Roshan Vali Khamosh','2021-07-11 05:48:05'),(13,'AT','2021-07-11 05:48:29'),(14,'FR','2021-07-11 05:48:45'),(15,'AT','2021-07-11 05:53:45'),(16,'RahimRahim','2021-07-11 05:59:05'),(17,'MJZandiyeh','2021-07-11 05:59:59'),(18,'poorya','2021-07-11 06:00:24'),(19,'Roshan Vali Khamosh','2021-07-11 06:00:37'),(20,'Roshan Vali Khamosh','2021-07-11 06:00:48'),(21,'RahimRahim','2021-07-11 06:03:29'),(22,'MJZandiyeh','2021-07-11 06:26:30'),(23,'FR','2021-07-11 06:27:09'),(24,'poorya','2021-07-11 06:37:27'),(25,'MJZandiyeh','2021-07-11 06:38:04'),(26,'AT','2021-07-11 06:38:46'),(27,'Roshan Vali Khamosh','2021-07-11 06:39:22'),(28,'MJZandiyeh','2021-07-11 06:52:51'),(29,'MJZandiyeh','2021-07-12 07:31:53'),(30,'MJZandiyeh','2021-07-12 08:02:23'),(31,'MJZandiyeh','2021-07-12 09:36:52'),(32,'FR','2021-07-12 09:48:47'),(33,'poorya','2021-07-12 09:50:39'),(34,'MJZandiyeh','2021-07-12 09:51:48'),(35,'AT','2021-07-12 09:52:21'),(36,'FR','2021-07-12 10:00:13'),(37,'FR','2021-07-12 10:01:41'),(38,'MJZandiyeh','2021-07-12 10:01:52'),(39,'Roshan Vali Khamosh','2021-07-12 10:06:55'),(42,'MJZandiyeh','2021-07-12 10:08:41'),(43,'RahimRahim','2021-07-12 10:08:58'),(44,'AT','2021-07-12 10:13:35'),(45,'FR','2021-07-12 10:14:57'),(46,'RahimRahim','2021-07-12 10:15:08'),(47,'AT','2021-07-12 10:21:09'),(48,'Roshan Vali Khamosh','2021-07-12 10:22:07'),(49,'Roshan Vali Khamosh','2021-07-12 10:25:55'),(50,'MJZandiyeh','2021-07-12 10:30:59'),(51,'MJZandiyeh','2021-07-12 10:35:24'),(52,'Roshan Vali Khamosh','2021-07-12 10:35:51'),(53,'Roshan Vali Khamosh','2021-07-12 10:39:35'),(54,'Roshan Vali Khamosh','2021-07-12 10:44:07'),(55,'RahimRahim','2021-07-12 10:50:45'),(56,'AT','2021-07-12 10:52:29'),(57,'Roshan Vali Khamosh','2021-07-12 10:53:04'),(58,'RahimRahim','2021-07-12 10:53:57'),(59,'Roshan Vali Khamosh','2021-07-12 10:55:53'),(60,'Roshan Vali Khamosh','2021-07-12 10:56:41'),(61,'Roshan Vali Khamosh','2021-07-12 11:02:21'),(63,'Roshan Vali Khamosh','2021-07-12 11:08:25'),(64,'MJZandiyeh','2021-07-12 11:09:06'),(65,'FR','2021-07-12 11:12:15'),(66,'AT','2021-07-12 11:12:22'),(67,'RahimRahim','2021-07-12 11:12:34'),(68,'Roshan Vali Khamosh','2021-07-12 11:12:45');
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-12 15:58:11
