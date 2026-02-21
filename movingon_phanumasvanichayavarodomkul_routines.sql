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
-- Temporary view structure for view `employeestatusview`
--

DROP TABLE IF EXISTS `employeestatusview`;
/*!50001 DROP VIEW IF EXISTS `employeestatusview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeestatusview` AS SELECT 
 1 AS `EmpID`,
 1 AS `EmpFirst`,
 1 AS `EmpLast`,
 1 AS `State`,
 1 AS `Phone`,
 1 AS `EndDate`,
 1 AS `Review`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employeeyearsofservice`
--

DROP TABLE IF EXISTS `employeeyearsofservice`;
/*!50001 DROP VIEW IF EXISTS `employeeyearsofservice`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeeyearsofservice` AS SELECT 
 1 AS `EmpID`,
 1 AS `EmpFirst`,
 1 AS `EmpLast`,
 1 AS `StartDate`,
 1 AS `EndDate`,
 1 AS `YearsOfService`,
 1 AS `VestedStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `employeestatusview`
--

/*!50001 DROP VIEW IF EXISTS `employeestatusview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeestatusview` AS select `employees`.`EmpID` AS `EmpID`,`employees`.`EmpFirst` AS `EmpFirst`,`employees`.`EmpLast` AS `EmpLast`,`employees`.`State` AS `State`,`employees`.`Phone` AS `Phone`,(case when (`employees`.`EndDate` is null) then NULL else `employees`.`EndDate` end) AS `EndDate`,(case when (`employees`.`EndDate` is null) then `employees`.`Review` else NULL end) AS `Review` from `employees` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeeyearsofservice`
--

/*!50001 DROP VIEW IF EXISTS `employeeyearsofservice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeeyearsofservice` AS select `employees`.`EmpID` AS `EmpID`,`employees`.`EmpFirst` AS `EmpFirst`,`employees`.`EmpLast` AS `EmpLast`,`employees`.`StartDate` AS `StartDate`,`employees`.`EndDate` AS `EndDate`,timestampdiff(YEAR,`employees`.`StartDate`,ifnull(`employees`.`EndDate`,curdate())) AS `YearsOfService`,(case when ((`employees`.`EndDate` is null) and (timestampdiff(YEAR,`employees`.`StartDate`,curdate()) >= 5)) then 'Fully Vested' else 'Not Vested' end) AS `VestedStatus` from `employees` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-03  3:35:22
