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
-- Table structure for table `ava`
--

DROP TABLE IF EXISTS `ava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Content` varchar(256) NOT NULL,
  `Sender` varchar(20) NOT NULL,
  `SendingTime` timestamp NOT NULL,
  `CommentOn` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Sender` (`Sender`),
  KEY `CommentOn` (`CommentOn`),
  CONSTRAINT `ava_ibfk_1` FOREIGN KEY (`Sender`) REFERENCES `user` (`Username`),
  CONSTRAINT `ava_ibfk_2` FOREIGN KEY (`CommentOn`) REFERENCES `ava` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ava`
--

LOCK TABLES `ava` WRITE;
/*!40000 ALTER TABLE `ava` DISABLE KEYS */;
INSERT INTO `ava` VALUES (13,'Hello i am mohammad javad zandiyeh','MJZandiyeh','2021-07-12 09:36:56',NULL),(14,'Have good day boys #Hello','MJZandiyeh','2021-07-12 09:41:36',NULL),(15,'Iran and US!!!! #gdbye #havyy #monky','FR','2021-07-12 09:48:50',NULL),(16,'why did you sent this ava????? #havyy #monky','poorya','2021-07-12 09:50:41',13),(17,'Have a nice day:) #fadfd','MJZandiyeh','2021-07-12 09:51:51',15),(18,':))))) #fadfd','AT','2021-07-12 09:52:23',15);
/*!40000 ALTER TABLE `ava` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_send_ava` AFTER INSERT ON `ava` FOR EACH ROW begin
	insert into ava_log values(new.id, new.Sender, new.SendingTime);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_send_ava_for_hashtag` AFTER INSERT ON `ava` FOR EACH ROW begin
	
    declare txt varchar(256);
	declare current_position int;
    declare hashtag char(6);
    
    set txt = new.Content;
    set current_position = 1;
    set txt = new.Content;
    
    loop_label : loop
		select locate("#", txt, current_position) into current_position;
        if current_position = 0 then
			leave loop_label;
		end if;
        
        select substring(txt, current_position, 6) into hashtag;
		
        insert into hashtag (Content, NumberOfUsage)
		select hashtag, 1
		on duplicate key update NumberOfUsage = NumberOfUsage + 1;
        
        insert ignore into hashtagOfEachAva (id, Content)
		select new.id, hashtag;
        
		set current_position = current_position + 6;
    end loop;
end */;;
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

-- Dump completed on 2021-07-12 15:58:13
