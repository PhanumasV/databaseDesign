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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustID` int NOT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `ContactFirst` varchar(20) DEFAULT NULL,
  `ContactLast` varchar(30) DEFAULT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Balance` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`CustID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Piazza Real Estate','Terry','Ramadani','1897 Gary Ave','Spokane','WA','99204','(509) 324-8213',0.00),(2,'McDonald Construction','Terese','Spredemann','5976 14th Ave NW','Portland','OR','97233','(503) 798-5646',0.00),(3,'Douglas Law Firm','Susan','Suarez','375 56th St','Spokane','WA','99245','(509) 857-2465',0.00),(4,'','Felicia','Pursifull','61 Virginian Ln','Jackson Hole','WY','83001','(307) 224-9633',0.00),(5,'','Rebecca','Leighty','1803 Nora Ave W','Spokane','WA','99202','(509) 546-3133',0.00),(6,'Woodman Furniture','Jeff','Booker','156 Fourth St SW','Seattle','WA','98145','(206) 354-6785',0.00),(7,'','Zarra','Thomas','9390 Marilu Rd','Jackson Hole','WY','83001','(307) 555-6547',0.00),(8,'','Deidre','Haferson','201 North River Dr W','Spokane','WA','99201','(509) 648-3132',0.00),(9,'Limited Partners','Yeon','Wung','14588 25th St NW','Spokane','WA','99203','(509) 487-3574',0.00),(10,'Brody & Karnall, PC','Darla','Barbar','6755 Forestview Dr W','Portland','OR','97215','(503) 546-5465',0.00),(11,'','Brandy','Jonaitis','955 Simon Ln','Jackson Hole','WY','83003','(307) 541-2216',0.00),(12,'Partners in Health','Josephine','Miazga','6133 Highland Park','Spokane','WA','99203','(509) 324-6542',0.00),(13,'County Booksellers','Roselina','Smith','655 Ponderosa Dr','Jackson Hole','WY','83005','(307) 685-3211',0.00),(14,'','Mary','Pyo','8534 Klondike Lane NW','Seattle','WA','98152','(206) 345-7122',0.00),(15,'Jenkins Publishing Company','Teresa','Scott','604 Sound Ave W','Spokane','WA','99209','(509) 374-2154',0.00),(16,'','Walter','Garth','78 Beloit Ave','Spokane','WA','99210','(509) 324-9213',0.00),(17,'Physical Therapy Group','Martha','Fordahl','11040 Dayton Pike','Jackson Hole','WY','83002','(307) 551-2341',0.00),(18,'County Hospital','Angela','Areba','6308 24th Ave NW','Seattle','WA','98001','(206) 574-2111',0.00),(19,'','Melissa','Doezal','15607 Timberwood Ct N','Spokane','WA','99205','(509) 232-4682',0.00),(20,'Ruby Booksellers','Nora','Rittmeyer','3122 Mountain View Rd','Seattle','WA','98102','(206) 334-6564',0.00),(21,'','Paul','Rabideaux','10024 Colfax Rd N','Spokane','WA','99203','(509) 432-3546',0.00),(22,'Hannah\'s Antiques','Marcia','Harrison','14228 S US Highway 191','Jackson Hole','WY','83001','(307) 541-2231',0.00),(23,'Buck\'s Bikes','Melinda','Harper','5259 Mithun Pl NE','Seattle','WA','98012','(206) 467-8885',0.00),(24,'','Robert','Soorbine','2467 Fifth St','Spokane','WA','99204','(509) 352-5635',0.00),(25,'','Andrea','Franklin','8978 Fullerton Rd','Jackson Hole','WY','83001','(307) 841-2300',0.00),(26,'','Judy','Boehme','5690 Riceville Rd','Portland','OR','97201','(503) 465-7955',0.00),(27,'Houseman Realtors','Angela','Sokovich','638 25th Ave E','Spokane','WA','99216','(509) 642-1115',0.00),(28,'','Scott','Cooperstein','523 Mansfield Ave W','Spokane','WA','99262','(509) 365-4683',0.00),(29,'','Laura','Young','2925 N Aspen Wood Ln','Jackson Hole','WY','83004','(307) 542-1346',0.00),(30,'','Dora','Castillo','6308 24th Ave NW','Seattle','WA','98016','(206) 345-1145',0.00),(31,'Johnson Fleet Service','Sherry','Carter','806 Powderhorn Ln','Jackson Hole','WY','83005','(307) 547-1321',0.00),(32,'Boat Storage Systems','Oswald','Coates','620 Olympic Pl W','Seattle','WA','98048','(206) 452-1352',0.00),(33,'','Jerry','Murillo','4789 E. G Street','Jackson Hole','WY','83002','(307) 249-5555',0.00),(34,'','Garth','Ferraro','5314 Sunset Hwy W','Spokane','WA','99201','(509) 345-1247',0.00),(35,'Vanway Accounting','Charlene','Leong','2172 Corner Creek Ln','Jackson Hole','WY','83001','(307) 274-9233',0.00),(36,'','Rinn','Rucker','7420 Rambling Rd','Portland','OR','97212','(503) 541-3338',0.00),(37,'','Irene','Stakline','7200 Riverbrook Lane','Spokane','WA','99215','(509) 654-1246',0.00),(38,'Squeaky Clean Carwash','Rosa','Fernando','923 Mountain Pass','Jackson Hole','WY','83001','(307) 951-1124',0.00);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
