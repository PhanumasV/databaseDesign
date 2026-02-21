-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: movingon_phanumasvanichayavarodomkul
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
-- Table structure for table `unitrentals`
--

DROP TABLE IF EXISTS `unitrentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unitrentals` (
  `CustID` int NOT NULL,
  `WarehouseID` varchar(5) NOT NULL,
  `UnitID` int NOT NULL,
  `DateIn` datetime DEFAULT NULL,
  `DateOut` datetime DEFAULT NULL,
  PRIMARY KEY (`CustID`,`UnitID`,`WarehouseID`),
  KEY `unitrentals_ibfk_2` (`WarehouseID`),
  KEY `unitrentals_ibfk_3` (`UnitID`,`WarehouseID`),
  CONSTRAINT `unitrentals_ibfk_1` FOREIGN KEY (`CustID`) REFERENCES `customers` (`CustID`),
  CONSTRAINT `unitrentals_ibfk_2` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`),
  CONSTRAINT `unitrentals_ibfk_3` FOREIGN KEY (`UnitID`, `WarehouseID`) REFERENCES `storageunits` (`UnitID`, `WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitrentals`
--

LOCK TABLES `unitrentals` WRITE;
/*!40000 ALTER TABLE `unitrentals` DISABLE KEYS */;
INSERT INTO `unitrentals` VALUES (2,'OR-1',4,'2016-01-04 00:00:00',NULL),(2,'OR-1',5,'2016-01-04 00:00:00',NULL),(4,'WY-1',3,'2016-02-15 00:00:00',NULL),(6,'WA-1',5,'2016-01-01 00:00:00',NULL),(7,'WY-1',6,'2016-01-15 00:00:00',NULL),(9,'WA-1',10,'2016-02-15 00:00:00',NULL),(10,'OR-1',6,'2016-02-01 00:00:00',NULL),(10,'OR-1',7,'2016-02-01 00:00:00',NULL),(10,'OR-1',8,'2016-02-15 00:00:00',NULL),(11,'WY-1',2,'2016-01-15 00:00:00',NULL),(12,'WA-1',2,'2016-02-15 00:00:00',NULL),(12,'WA-1',6,'2016-02-01 00:00:00',NULL),(13,'WY-1',4,'2016-02-01 00:00:00',NULL),(13,'WY-1',5,'2016-02-01 00:00:00',NULL),(14,'WA-1',4,'2016-02-15 00:00:00',NULL),(15,'WA-1',3,'2016-02-20 00:00:00',NULL),(17,'WY-1',9,'2016-02-01 00:00:00',NULL),(18,'WA-1',7,'2016-02-01 00:00:00',NULL),(20,'WA-1',6,'2016-01-15 00:00:00',NULL),(26,'OR-1',2,'2016-02-01 00:00:00',NULL),(27,'WA-1',8,'2016-02-01 00:00:00',NULL),(31,'WY-1',8,'2016-02-20 00:00:00',NULL),(32,'WA-1',9,'2016-01-05 00:00:00',NULL),(36,'OR-1',10,'2016-02-15 00:00:00',NULL),(38,'WY-1',10,'2016-01-15 00:00:00',NULL);
/*!40000 ALTER TABLE `unitrentals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-03  3:35:22
