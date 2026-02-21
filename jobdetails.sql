-- Job Details --
CREATE TABLE `jobdetails` (
  `JobID` int NOT NULL,
  `VehicleID` varchar(10) NOT NULL,
  `DriverID` int NOT NULL,
  `MileageActual` int DEFAULT NULL,
  `WeightActual` int DEFAULT NULL,
  PRIMARY KEY (`JobID`,`VehicleID`,`DriverID`),
  KEY `VehicleID` (`VehicleID`),
  KEY `DriverID` (`DriverID`),
  CONSTRAINT `jobdetails_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `joborders` (`JobID`),
  CONSTRAINT `jobdetails_ibfk_2` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`VehicleID`),
  CONSTRAINT `jobdetails_ibfk_3` FOREIGN KEY (`DriverID`) REFERENCES `employees` (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SHOW INDEX FROM jobdetails;

INSERT INTO `jobdetails` (`JobID`, `VehicleID`, `DriverID`, `MileageActual`, `WeightActual`) VALUES
(2, 'TRK-003', 4, 68, 1300);
INSERT INTO `jobdetails` (`JobID`, `VehicleID`, `DriverID`, `MileageActual`, `WeightActual`) VALUES
(3, 'TRK-002', 3, 18, 2260);
INSERT INTO `jobdetails` (`JobID`, `VehicleID`, `DriverID`, `MileageActual`, `WeightActual`) VALUES
(4, 'TRK-002', 3, 115, 1175);
INSERT INTO `jobdetails` (`JobID`, `VehicleID`, `DriverID`, `MileageActual`, `WeightActual`) VALUES
(5, 'TRK-003', 4, 129, 5675),
(6, 'TRK-003', 4, 56, 5575),
(7, 'TRK-004', 1, 225, 5286),
(8, 'TRK-006', 1, 356, 3275),
(9, 'TRK-007', 1, 220, 6000),
(10, 'TRK-005', 2, 138, 4275),
(11, 'TRK-005', 2, 115, 4257);

ALTER TABLE `jobdetails` DROP FOREIGN KEY `jobdetails_ibfk_3`;

ALTER TABLE `jobdetails`
  ADD CONSTRAINT `jobdetails_ibfk_3` FOREIGN KEY (`DriverID`) REFERENCES `drivers` (`DriverID`);



Select * From jobdetails;