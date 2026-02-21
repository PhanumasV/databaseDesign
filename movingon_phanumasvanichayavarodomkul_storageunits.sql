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
-- Table structure for table `storageunits`
--

DROP TABLE IF EXISTS `storageunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storageunits` (
  `ID` int NOT NULL,
  `UnitID` int NOT NULL,
  `UnitSize` varchar(30) DEFAULT NULL,
  `WarehouseID` varchar(5) NOT NULL,
  `Rent` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`UnitID`,`WarehouseID`),
  KEY `storageunits_ibfk_1` (`WarehouseID`),
  CONSTRAINT `storageunits_ibfk_1` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storageunits`
--

LOCK TABLES `storageunits` WRITE;
/*!40000 ALTER TABLE `storageunits` DISABLE KEYS */;
INSERT INTO `storageunits` VALUES (1,1,'8 x 8','OR-1',25.00),(2,1,'12 x 12','WA-1',35.00),(3,1,'12 x 12','WY-1',45.00),(4,2,'8 x 12','OR-1',30.00),(5,2,'12 x 12','WA-1',35.00),(6,2,'12 x 12','WY-1',45.00),(7,3,'8 x 8','OR-1',25.00),(8,3,'9 x 12','WA-1',30.00),(9,3,'12 x 12','WY-1',45.00),(10,4,'8 x 12','OR-1',30.00),(11,4,'9 x 12','WA-1',30.00),(12,4,'12 x 18','WY-1',70.00),(13,5,'8 x 8','OR-1',25.00),(14,5,'12 x 12','WA-1',85.00),(15,5,'12 x 18','WY-1',70.00),(16,6,'8 x 12','OR-1',30.00),(17,6,'12 x 12','WA-1',85.00),(18,6,'12 x 12','WY-1',45.00),(19,7,'8 x 10','OR-1',25.00),(20,7,'12 x 10','WA-1',80.00),(21,7,'12 x 12','WY-1',85.00),(22,8,'15 x 15','OR-1',95.00),(23,8,'12 x 10','WA-1',80.00),(24,8,'12 x 8','WY-1',35.00),(25,9,'15 x 15','OR-1',95.00),(26,9,'18 x 18','WA-1',115.00),(27,9,'15 x 15','WY-1',95.00),(28,10,'15 x 15','OR-1',95.00),(29,10,'18 x 18','WA-1',115.00),(30,10,'18 x 18','WY-1',115.00);
/*!40000 ALTER TABLE `storageunits` ENABLE KEYS */;
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
