
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ludo_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `match_id` varchar(100) NOT NULL,
  `match_time` int NOT NULL,
  `match_type` enum('two','three','four') NOT NULL,
  `price_pool` decimal(10,2) NOT NULL,
  `match_status` enum('waiting','started','completed') DEFAULT 'waiting',
  `date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `match_id` (`match_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (200,'20250525175152-ng-QC',10,'two',20000.00,'waiting','2025-05-25 23:21:52'),(201,'20250525175220-mPhZr',10,'three',20000.00,'waiting','2025-05-25 23:22:20'),(202,'20250525175245-pu50O',10,'four',20000.00,'waiting','2025-05-25 23:22:45');
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `match_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` enum('red','green','yellow','blue') NOT NULL,
  `score` int DEFAULT '0',
  `winner` enum('first','second','third','fourth') DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (416,'20250525175152-ng-QC','user1','ko','yellow',0,NULL,NULL),(417,'20250525175152-ng-QC','user2','ko','red',0,NULL,NULL),(418,'20250525175220-mPhZr','user1','ko','blue',0,NULL,NULL),(419,'20250525175220-mPhZr','user2','ko','green',0,NULL,NULL),(420,'20250525175220-mPhZr','user3','ko','red',0,NULL,NULL),(421,'20250525175245-pu50O','user1','ko','red',0,NULL,NULL),(422,'20250525175245-pu50O','user2','ko','blue',0,NULL,NULL),(423,'20250525175245-pu50O','user3','ko','green',0,NULL,NULL),(424,'20250525175245-pu50O','user4','ko','yellow',0,NULL,NULL);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-25 23:26:52
