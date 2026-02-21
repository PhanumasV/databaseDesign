/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `customers`;
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

DROP TABLE IF EXISTS `drivers`;
CREATE TABLE `drivers` (
  `DriverID` int NOT NULL,
  `DriverFirst` varchar(30) DEFAULT NULL,
  `DriverLast` varchar(30) DEFAULT NULL,
  `SSN` varchar(9) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Cell` varchar(15) DEFAULT NULL,
  `MileageRate` decimal(19,2) DEFAULT NULL,
  `Review` datetime DEFAULT NULL,
  `DrivingRecord` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `EmpID` int NOT NULL,
  `EmpFirst` varchar(30) DEFAULT NULL,
  `EmpLast` varchar(30) DEFAULT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Cell` varchar(15) DEFAULT NULL,
  `SSN` varchar(9) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `PositionID` int DEFAULT NULL,
  `Salary` decimal(19,2) DEFAULT NULL,
  `HourlyRate` decimal(19,2) DEFAULT NULL,
  `Review` datetime DEFAULT NULL,
  `Memo` longtext,
  `WarehouseID` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`EmpID`),
  KEY `WarehouseID` (`WarehouseID`),
  KEY `PositionID` (`PositionID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`PositionID`) REFERENCES `positions` (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `jobdetails`;
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

DROP TABLE IF EXISTS `joborders`;
CREATE TABLE `joborders` (
  `JobID` int NOT NULL,
  `CustID` int DEFAULT NULL,
  `MoveDate` datetime DEFAULT NULL,
  `FromAddress` varchar(30) DEFAULT NULL,
  `FromCity` varchar(30) DEFAULT NULL,
  `FromState` varchar(2) DEFAULT NULL,
  `ToAddress` varchar(30) DEFAULT NULL,
  `ToCity` varchar(30) DEFAULT NULL,
  `ToState` varchar(2) DEFAULT NULL,
  `DistanceEst` int DEFAULT NULL,
  `WeightEst` int DEFAULT NULL,
  `Packing` tinyint(1) DEFAULT NULL,
  `Heavy` tinyint(1) DEFAULT NULL,
  `Storage` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`JobID`),
  KEY `CustID` (`CustID`),
  CONSTRAINT `joborders_ibfk_1` FOREIGN KEY (`CustID`) REFERENCES `customers` (`CustID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `PositionID` int NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `storageunits`;
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

DROP TABLE IF EXISTS `unitrentals`;
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

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `VehicleID` varchar(10) NOT NULL,
  `LicensePlateNum` varchar(7) DEFAULT NULL,
  `Axle` int DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`VehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE `warehouses` (
  `WarehouseID` varchar(5) NOT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Zip` varchar(15) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `ClimateControl` tinyint(1) DEFAULT NULL,
  `SecurityCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `customers` (`CustID`, `CompanyName`, `ContactFirst`, `ContactLast`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Balance`) VALUES
(1, 'Piazza Real Estate', 'Terry', 'Ramadani', '1897 Gary Ave', 'Spokane', 'WA', '99204', '(509) 324-8213', '0.00');
INSERT INTO `customers` (`CustID`, `CompanyName`, `ContactFirst`, `ContactLast`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Balance`) VALUES
(2, 'McDonald Construction', 'Terese', 'Spredemann', '5976 14th Ave NW', 'Portland', 'OR', '97233', '(503) 798-5646', '0.00');
INSERT INTO `customers` (`CustID`, `CompanyName`, `ContactFirst`, `ContactLast`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Balance`) VALUES
(3, 'Douglas Law Firm', 'Susan', 'Suarez', '375 56th St', 'Spokane', 'WA', '99245', '(509) 857-2465', '0.00');
INSERT INTO `customers` (`CustID`, `CompanyName`, `ContactFirst`, `ContactLast`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Balance`) VALUES
(4, '', 'Felicia', 'Pursifull', '61 Virginian Ln', 'Jackson Hole', 'WY', '83001', '(307) 224-9633', '0.00'),
(5, '', 'Rebecca', 'Leighty', '1803 Nora Ave W', 'Spokane', 'WA', '99202', '(509) 546-3133', '0.00'),
(6, 'Woodman Furniture', 'Jeff', 'Booker', '156 Fourth St SW', 'Seattle', 'WA', '98145', '(206) 354-6785', '0.00'),
(7, '', 'Zarra', 'Thomas', '9390 Marilu Rd', 'Jackson Hole', 'WY', '83001', '(307) 555-6547', '0.00'),
(8, '', 'Deidre', 'Haferson', '201 North River Dr W', 'Spokane', 'WA', '99201', '(509) 648-3132', '0.00'),
(9, 'Limited Partners', 'Yeon', 'Wung', '14588 25th St NW', 'Spokane', 'WA', '99203', '(509) 487-3574', '0.00'),
(10, 'Brody & Karnall, PC', 'Darla', 'Barbar', '6755 Forestview Dr W', 'Portland', 'OR', '97215', '(503) 546-5465', '0.00'),
(11, '', 'Brandy', 'Jonaitis', '955 Simon Ln', 'Jackson Hole', 'WY', '83003', '(307) 541-2216', '0.00'),
(12, 'Partners in Health', 'Josephine', 'Miazga', '6133 Highland Park', 'Spokane', 'WA', '99203', '(509) 324-6542', '0.00'),
(13, 'County Booksellers', 'Roselina', 'Smith', '655 Ponderosa Dr', 'Jackson Hole', 'WY', '83005', '(307) 685-3211', '0.00'),
(14, '', 'Mary', 'Pyo', '8534 Klondike Lane NW', 'Seattle', 'WA', '98152', '(206) 345-7122', '0.00'),
(15, 'Jenkins Publishing Company', 'Teresa', 'Scott', '604 Sound Ave W', 'Spokane', 'WA', '99209', '(509) 374-2154', '0.00'),
(16, '', 'Walter', 'Garth', '78 Beloit Ave', 'Spokane', 'WA', '99210', '(509) 324-9213', '0.00'),
(17, 'Physical Therapy Group', 'Martha', 'Fordahl', '11040 Dayton Pike', 'Jackson Hole', 'WY', '83002', '(307) 551-2341', '0.00'),
(18, 'County Hospital', 'Angela', 'Areba', '6308 24th Ave NW', 'Seattle', 'WA', '98001', '(206) 574-2111', '0.00'),
(19, '', 'Melissa', 'Doezal', '15607 Timberwood Ct N', 'Spokane', 'WA', '99205', '(509) 232-4682', '0.00'),
(20, 'Ruby Booksellers', 'Nora', 'Rittmeyer', '3122 Mountain View Rd', 'Seattle', 'WA', '98102', '(206) 334-6564', '0.00'),
(21, '', 'Paul', 'Rabideaux', '10024 Colfax Rd N', 'Spokane', 'WA', '99203', '(509) 432-3546', '0.00'),
(22, 'Hannah\'s Antiques', 'Marcia', 'Harrison', '14228 S US Highway 191', 'Jackson Hole', 'WY', '83001', '(307) 541-2231', '0.00'),
(23, 'Buck\'s Bikes', 'Melinda', 'Harper', '5259 Mithun Pl NE', 'Seattle', 'WA', '98012', '(206) 467-8885', '0.00'),
(24, '', 'Robert', 'Soorbine', '2467 Fifth St', 'Spokane', 'WA', '99204', '(509) 352-5635', '0.00'),
(25, '', 'Andrea', 'Franklin', '8978 Fullerton Rd', 'Jackson Hole', 'WY', '83001', '(307) 841-2300', '0.00'),
(26, '', 'Judy', 'Boehme', '5690 Riceville Rd', 'Portland', 'OR', '97201', '(503) 465-7955', '0.00'),
(27, 'Houseman Realtors', 'Angela', 'Sokovich', '638 25th Ave E', 'Spokane', 'WA', '99216', '(509) 642-1115', '0.00'),
(28, '', 'Scott', 'Cooperstein', '523 Mansfield Ave W', 'Spokane', 'WA', '99262', '(509) 365-4683', '0.00'),
(29, '', 'Laura', 'Young', '2925 N Aspen Wood Ln', 'Jackson Hole', 'WY', '83004', '(307) 542-1346', '0.00'),
(30, '', 'Dora', 'Castillo', '6308 24th Ave NW', 'Seattle', 'WA', '98016', '(206) 345-1145', '0.00'),
(31, 'Johnson Fleet Service', 'Sherry', 'Carter', '806 Powderhorn Ln', 'Jackson Hole', 'WY', '83005', '(307) 547-1321', '0.00'),
(32, 'Boat Storage Systems', 'Oswald', 'Coates', '620 Olympic Pl W', 'Seattle', 'WA', '98048', '(206) 452-1352', '0.00'),
(33, '', 'Jerry', 'Murillo', '4789 E. G Street', 'Jackson Hole', 'WY', '83002', '(307) 249-5555', '0.00'),
(34, '', 'Garth', 'Ferraro', '5314 Sunset Hwy W', 'Spokane', 'WA', '99201', '(509) 345-1247', '0.00'),
(35, 'Vanway Accounting', 'Charlene', 'Leong', '2172 Corner Creek Ln', 'Jackson Hole', 'WY', '83001', '(307) 274-9233', '0.00'),
(36, '', 'Rinn', 'Rucker', '7420 Rambling Rd', 'Portland', 'OR', '97212', '(503) 541-3338', '0.00'),
(37, '', 'Irene', 'Stakline', '7200 Riverbrook Lane', 'Spokane', 'WA', '99215', '(509) 654-1246', '0.00'),
(38, 'Squeaky Clean Carwash', 'Rosa', 'Fernando', '923 Mountain Pass', 'Jackson Hole', 'WY', '83001', '(307) 951-1124', '0.00');

INSERT INTO `drivers` (`DriverID`, `DriverFirst`, `DriverLast`, `SSN`, `DOB`, `StartDate`, `EndDate`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Cell`, `MileageRate`, `Review`, `DrivingRecord`) VALUES
(1, 'Jerry', 'Lo', '124002465', '1986-09-12 00:00:00', '2014-01-22 00:00:00', '2014-06-15 00:00:00', '600 East 22nd Street', 'Jackson Hole', 'WY', '83001', '3076435512', '3075745444', '0.3500', NULL, 'A');
INSERT INTO `drivers` (`DriverID`, `DriverFirst`, `DriverLast`, `SSN`, `DOB`, `StartDate`, `EndDate`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Cell`, `MileageRate`, `Review`, `DrivingRecord`) VALUES
(2, 'John', 'Samson', '725461340', '1984-12-16 00:00:00', '2015-11-22 00:00:00', NULL, '9708 Manchaca Road', 'Spokane', 'WA', '99213', '5095422212', '5095741115', '0.3000', '2015-05-20 00:00:00', 'A');
INSERT INTO `drivers` (`DriverID`, `DriverFirst`, `DriverLast`, `SSN`, `DOB`, `StartDate`, `EndDate`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Cell`, `MileageRate`, `Review`, `DrivingRecord`) VALUES
(3, 'Virginia', 'Spichalla', '728224333', '1986-10-24 00:00:00', '2014-10-21 00:00:00', NULL, '2120 53rd Street SW', 'Seattle', 'WA', '98102', '2067415132', '2064571544', '0.3500', '2014-08-16 00:00:00', 'B');
INSERT INTO `drivers` (`DriverID`, `DriverFirst`, `DriverLast`, `SSN`, `DOB`, `StartDate`, `EndDate`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Cell`, `MileageRate`, `Review`, `DrivingRecord`) VALUES
(4, 'Jonathan', 'Nabinger', '901543211', '1995-02-14 00:00:00', '2013-09-12 00:00:00', NULL, '11215 87th Avenue NE', 'Seattle', 'WA', '98103', '2065431542', '2064852461', '0.3500', '2013-01-05 00:00:00', 'C'),
(7, 'Byron', 'Snowden', '321560000', '1993-08-14 00:00:00', '2008-06-14 00:00:00', NULL, '300 Promontory Drive', 'Portland', 'OR', '97204', '5034514541', '5034875544', '0.3500', '2008-06-15 00:00:00', 'C'),
(8, 'Cindy', 'Solquim', '915424687', '1985-10-06 00:00:00', '2006-03-14 00:00:00', NULL, '755 Cherry Valley Drive', 'Jackson Hole', 'WY', '83002', '3075712241', '3078974541', '0.4000', '2007-10-01 00:00:00', 'A'),
(9, 'Manuel', 'Able', '987352000', '1995-11-24 00:00:00', '2011-04-05 00:00:00', NULL, '3010 W Anderson Lane', 'Portland', 'OR', '97201', '5032121574', '5034571544', '0.4000', '2012-11-01 00:00:00', 'B'),
(10, 'Jackie', 'Condon', '953102431', '1996-07-30 00:00:00', '2009-10-15 00:00:00', NULL, '620 East Empire Street', 'Spokane', 'WA', '99216', '5097415741', '5097842456', '0.4500', '2009-02-15 00:00:00', 'A'),
(11, 'Ned', 'Vandre', '908754641', '1997-04-05 00:00:00', '2016-09-10 00:00:00', '2017-03-22 00:00:00', '10611 Freidrich Lane SW', 'Seattle', 'WA', '98116', '2062487468', '2068745441', '0.4500', '2016-10-29 00:00:00', 'A'),
(12, 'Nathan', 'Lindsey', '983567899', '1996-12-31 00:00:00', '2016-02-24 00:00:00', NULL, '861 Loop 337 E', 'Portland', 'OR', '97207', '5034571541', '5037877771', '0.5000', '2016-03-01 00:00:00', 'A'),
(13, 'John', 'O\'Reilly', '724135755', '1984-07-04 00:00:00', '2015-01-29 00:00:00', NULL, '2520 Longview Drive E', 'Seattle', 'WA', '98127', '2065741241', '2063127489', '0.5000', '2015-03-15 00:00:00', 'A'),
(14, 'Charles', 'Mahata', '000267544', '1991-03-01 00:00:00', '2012-01-29 00:00:00', NULL, '101 Shady Lane', 'Jackson Hole', 'WY', '83004', '3079856455', '3078973544', '0.5000', '2012-11-15 00:00:00', 'A'),
(15, 'Victor', 'Strong', '721246721', '1992-04-24 00:00:00', '2014-08-14 00:00:00', NULL, '5421 Bee Cave Road', 'Spokane', 'WA', '99216', '5096451354', '5095473123', '0.4000', '2014-10-15 00:00:00', 'A'),
(16, 'Robert', 'Avalon', '704246572', '1984-04-10 00:00:00', '2014-10-29 00:00:00', NULL, '35741 Steck Avenue #498', 'Seattle', 'WA', '98108', '2064783457', '2064354132', '0.3500', '2014-10-15 00:00:00', 'B'),
(17, 'Abbie', 'Reingold', '724354544', '1987-06-21 00:00:00', '2013-11-24 00:00:00', '2013-02-02 00:00:00', '623 South Hampton Way', 'Portland', 'OR', '97204', '5035497241', '5063789855', '0.3000', '2013-12-10 00:00:00', 'D'),
(18, 'Luke', 'Smith', '701234900', '1987-09-28 00:00:00', '2010-06-14 00:00:00', NULL, '1322 Buckeye Trail NW', 'Portland', 'OR', '97207', '5035716575', '5039785432', '0.4000', '2010-06-15 00:00:00', 'C'),
(19, 'Alberto', 'Nicholson', '703264978', '1989-05-30 00:00:00', '2014-12-23 00:00:00', NULL, '707 W 21st Street #68', 'Portland', 'OR', '97215', '5035853589', '5037897124', '0.3500', '2014-01-15 00:00:00', 'A'),
(20, 'Roy', 'Nesson', '705364444', '1989-12-12 00:00:00', '2014-02-03 00:00:00', NULL, '105 Gattis School Road', 'Seattle', 'WA', '99217', '2064873245', '2067741445', '0.4500', '2014-09-10 00:00:00', 'B'),
(21, 'Turner', 'Donaldson', '812450000', '1988-10-14 00:00:00', '2015-06-30 00:00:00', NULL, '277 Woodway Drive', 'Jackson Hole', 'WY', '83010', '3075713575', '3078645732', '0.4000', '2015-09-01 00:00:00', 'B'),
(22, 'Dawson', 'Minton', '709531277', '1987-06-20 00:00:00', '2015-07-15 00:00:00', NULL, '780 North Loop #298', 'Seattle', 'WA', '99217', '2068745765', '2067843541', '0.3500', '2015-01-04 00:00:00', 'A');

INSERT INTO `employees` (`EmpID`, `EmpFirst`, `EmpLast`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Cell`, `SSN`, `DOB`, `StartDate`, `EndDate`, `PositionID`, `Salary`, `HourlyRate`, `Review`, `Memo`, `WarehouseID`) VALUES
(1, 'David', 'Bowers', '10124 Metropolitan Drive', 'Seattle', 'WA', '98117', '2062465132', '2065754321', '154003785', '1985-09-12 00:00:00', '1998-01-22 00:00:00', NULL, 1, '72000.00', NULL, NULL, '', 'WA-1');
INSERT INTO `employees` (`EmpID`, `EmpFirst`, `EmpLast`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Cell`, `SSN`, `DOB`, `StartDate`, `EndDate`, `PositionID`, `Salary`, `HourlyRate`, `Review`, `Memo`, `WarehouseID`) VALUES
(2, 'Robert', 'Iko', '698 Round Mountain', 'Seattle', 'WA', '98124', '2065472315', '2064875312', '705246513', '1994-12-16 00:00:00', '2006-12-15 00:00:00', NULL, 7, '59500.00', NULL, '2007-06-15 00:00:00', '', 'WA-1');
INSERT INTO `employees` (`EmpID`, `EmpFirst`, `EmpLast`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Cell`, `SSN`, `DOB`, `StartDate`, `EndDate`, `PositionID`, `Salary`, `HourlyRate`, `Review`, `Memo`, `WarehouseID`) VALUES
(3, 'Virginia', 'Sanchez', '201 River Road', 'Spokane', 'WA', '99215', '5093451687', '5096348732', '724568132', '1988-10-24 00:00:00', '2004-06-10 00:00:00', NULL, 2, '48500.00', NULL, '2007-12-15 00:00:00', 'Emergency contact for alarm company', 'WA-1');
INSERT INTO `employees` (`EmpID`, `EmpFirst`, `EmpLast`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Cell`, `SSN`, `DOB`, `StartDate`, `EndDate`, `PositionID`, `Salary`, `HourlyRate`, `Review`, `Memo`, `WarehouseID`) VALUES
(4, 'Eric', 'Behrens', '21 Adrian Way', 'Jackson Hole', 'WY', '83005', '3075461272', '3075763154', '956346120', '1995-02-14 00:00:00', '2005-09-12 00:00:00', '2006-02-15 00:00:00', 3, NULL, '12.50', NULL, '', 'WY-1'),
(7, 'Brian', 'Castillo', '52 Denton Drive #49', 'Portland', 'OR', '97205', '5035742742', '5035647154', '923546124', '1990-08-14 00:00:00', '2001-06-14 00:00:00', NULL, 3, NULL, '12.75', '2008-06-14 00:00:00', '', 'OR-1'),
(8, 'Cynthia', 'Cox', '1515 Patterson Road', 'Portland', 'OR', '97210', '5032412423', '5035496113', '854230000', '1985-10-06 00:00:00', '2006-12-30 00:00:00', NULL, 2, '50000.00', NULL, '2007-06-30 00:00:00', '', 'OR-1'),
(9, 'John', 'Maestas', '5506 Beach Street West', 'Spokane', 'WA', '99216', '5096741543', '5093782312', '487002468', '1995-11-24 00:00:00', '2001-11-15 00:00:00', NULL, 4, '42500.00', NULL, '2007-11-01 00:00:00', 'Speaks fluent Spanish', 'WA-1'),
(10, 'Mark', 'Cumberland', '16542 Angus Road #280', 'Portland', 'OR', '97206', '5032486453', '5032786424', '705435126', '1996-07-30 00:00:00', '2002-10-01 00:00:00', '2006-03-15 00:00:00', 6, NULL, '12.25', NULL, '', 'OR-1'),
(11, 'Darnell', 'Colmenero', '6000 Balcones Drive', 'Seattle', 'WA', '98113', '2063475354', '2063547215', '723549785', '1997-04-05 00:00:00', '2002-09-02 00:00:00', NULL, 3, NULL, '15.00', '2008-09-15 00:00:00', '', 'WA-1'),
(12, 'James', 'Lu', '5003 Mallard Avenue #587', 'Jackson Hole', 'WY', '83001', '3076784513', '3072468732', '709564321', '1999-12-31 00:00:00', '2005-02-24 00:00:00', NULL, 2, '48500.00', NULL, '2007-02-24 00:00:00', 'Speaks fluent Chinese', 'WY-1'),
(13, 'Barry', 'Orosco', '2001 Kenosha Pass', 'Spokane', 'WA', '99216', '5093451357', '5093575166', '723246875', '1989-07-04 00:00:00', '2006-03-21 00:00:00', '2006-05-15 00:00:00', 5, NULL, '9.75', NULL, '', 'WA-1'),
(14, 'Richard', 'Hargadon', '901 Great Oaks Cove', 'Seattle', 'WA', '98154', '2063547987', '2063541287', '984651372', '1991-03-01 00:00:00', '2006-07-15 00:00:00', NULL, 6, NULL, '10.50', '2007-08-15 00:00:00', '', 'WA-1'),
(15, 'John', 'Nader', '321 Sturgis', 'Jackson Hole', 'WY', '83001', '3075467135', '3072468731', '905346755', '1992-04-24 00:00:00', '2001-08-01 00:00:00', NULL, 3, NULL, '11.25', '2008-08-01 00:00:00', '', 'WY-1'),
(16, 'George', 'Medrano', '3987 NW 87th Street #8', 'Seattle', 'WA', '98124', '2063412024', '2063241200', '546570000', '1994-04-10 00:00:00', '2006-10-15 00:00:00', NULL, 6, NULL, '11.25', '2008-10-15 00:00:00', '', 'WA-1'),
(17, 'Rachel', 'Goodman', '9876 Parker Street', 'Portland', 'OR', '97204', '5032415756', '5032175613', '978451342', '1997-06-21 00:00:00', '2004-11-03 00:00:00', NULL, 5, NULL, '12.75', '2008-01-15 00:00:00', 'On maternity leave through 12/2008', 'OR-1'),
(18, 'Shayla', 'Anderson', '4321 Barton Cliff Drive', 'Seattle', 'WA', '98124', '2063214571', '2063218756', '926543210', '1988-09-28 00:00:00', '2003-09-24 00:00:00', NULL, 6, NULL, '12.50', '2008-09-15 00:00:00', '', 'WA-1'),
(19, 'Alfonso', 'Ozmun', '510 Immanuel Avenue', 'Seattle', 'WA', '98126', '2063124024', '2062497513', '946532100', '1990-05-30 00:00:00', '2005-06-15 00:00:00', NULL, 5, NULL, '12.00', '2008-02-28 00:00:00', '', 'WA-1'),
(20, 'Sophia', 'Nunis', '5471 Wyoming Springs Way', 'Spokane', 'WA', '99214', '5093478992', '5098973246', '987451372', '1989-12-12 00:00:00', '2006-10-20 00:00:00', NULL, 6, NULL, '12.00', '2008-01-15 00:00:00', '', 'WA-1'),
(21, 'Dora', 'Nettles', '24 Frontier Trail NE', 'Seattle', 'WA', '98123', '2067546512', '2065795462', '723246512', '1988-10-14 00:00:00', '2002-10-21 00:00:00', NULL, 3, NULL, '14.75', '2008-02-15 00:00:00', '', 'WA-1'),
(22, 'Kristina', 'Romano', '8 Anderson Loop', 'Seattle', 'WA', '98113', '2062449876', '2062748648', '704513547', '1997-06-20 00:00:00', '2001-05-20 00:00:00', NULL, 4, '45000.00', NULL, '2008-05-01 00:00:00', '', 'WA-1'),
(23, 'Doug', 'Hearne', '11 Lost Pine Trail', 'Portland', 'OR', '97204', '5032462465', '5037654354', '722154321', '1982-05-21 00:00:00', '2004-01-15 00:00:00', NULL, 6, NULL, '12.75', '2008-01-15 00:00:00', '', 'OR-1'),
(24, 'Tom', 'Murphy', '4007 James White Avenue', 'Portland', 'OR', '97214', '5032471355', '5037543257', '701543216', '1977-06-05 00:00:00', '2004-02-16 00:00:00', NULL, 6, NULL, '13.00', '2008-03-15 00:00:00', '', 'OR-1'),
(25, 'Felicia', 'Castro', '611 Montclaire Street', 'Portland', 'OR', '97226', '5037543871', '5034757135', '724216452', '1980-09-14 00:00:00', '2005-03-16 00:00:00', NULL, 6, NULL, '12.50', '2008-03-15 00:00:00', '', 'OR-1'),
(26, 'Gene', 'Chiles', '2506 Ferguson Lane #411', 'Portland', 'OR', '97215', '5032798246', '5032467835', '954321642', '1982-07-05 00:00:00', '2004-03-01 00:00:00', NULL, 6, NULL, '12.50', '2008-03-01 00:00:00', '', 'OR-1'),
(27, 'Kirby', 'Meyer', '110 Ponderosa', 'Portland', 'OR', '97209', '5032716579', '5032795132', '984651357', '1980-11-12 00:00:00', '2005-05-31 00:00:00', NULL, 4, '42500.00', NULL, '2007-12-15 00:00:00', '', 'OR-1'),
(28, 'Jim', 'Bostic', '1201 Chestnut Avenue #2', 'Portland', 'OR', '97211', '5032715496', '5032164573', '454006543', '1979-12-12 00:00:00', '2005-07-06 00:00:00', NULL, 6, NULL, '11.75', '2008-07-01 00:00:00', '', 'OR-1'),
(29, 'Leland', 'McKeeman', '79513 Airport Blvd.', 'Jackson Hole', 'WY', '83005', '3072462135', '3072462465', '963124672', '1978-11-01 00:00:00', '2004-09-25 00:00:00', NULL, 3, NULL, '14.50', '2008-09-01 00:00:00', '', 'WY-1'),
(30, 'Wade', 'Ragland', '9714 Circle Drive', 'Jackson Hole', 'WY', '83005', '3072749264', '3072243241', '706324675', '1980-03-01 00:00:00', '2004-09-25 00:00:00', NULL, 4, '43500.00', NULL, '2008-09-01 00:00:00', '', 'WY-1'),
(31, 'Cynthia', 'Zucker', '304 Ridgewood Drive #1', 'Jackson Hole', 'WY', '83002', '3075556432', '3072465796', '705315790', '1967-08-22 00:00:00', '2001-06-22 00:00:00', NULL, 6, NULL, '11.50', '2007-06-01 00:00:00', '', 'WY-1'),
(32, 'Lisa', 'Virr', '10086 Wells Parkway', 'Jackson Hole', 'WY', '83010', '3072746313', '3072154324', '421001579', '1980-11-28 00:00:00', '2006-11-16 00:00:00', NULL, 5, NULL, '11.50', '2007-11-15 00:00:00', '', 'WY-1'),
(33, 'Shane', 'Pichardo', '8301 Alvin High Blvd.', 'Jackson Hole', 'WY', '83011', '3075553216', '3072468763', '987465137', '1983-12-14 00:00:00', '2006-01-29 00:00:00', NULL, 6, NULL, '11.50', '2007-01-15 00:00:00', '', 'WY-1'),
(34, 'Richard', 'Pena', '5713 Mystic Street', 'Jackson Hole', 'WY', '83012', '3072456876', '3072132762', '716543272', '1981-02-24 00:00:00', '2006-04-26 00:00:00', NULL, 6, NULL, '11.75', '2007-11-25 00:00:00', '', 'WY-1'),
(35, 'Jason', 'Collins', '10275 Sam Bass Road', 'Jackson Hole', 'WY', '83012', '3072623546', '3072664533', '722165711', '1980-10-14 00:00:00', '2005-08-01 00:00:00', NULL, 6, NULL, '11.85', '2007-08-01 00:00:00', '', 'WY-1');

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

INSERT INTO `joborders` (`JobID`, `CustID`, `MoveDate`, `FromAddress`, `FromCity`, `FromState`, `ToAddress`, `ToCity`, `ToState`, `DistanceEst`, `WeightEst`, `Packing`, `Heavy`, `Storage`) VALUES
(2, 1, '2005-09-16 00:00:00', '1789 Eighth Avenue', 'Spokane', 'WA', '7899 Grandview Apt #5', 'Pullman', 'WA', 60, 1250, 1, 1, 0);
INSERT INTO `joborders` (`JobID`, `CustID`, `MoveDate`, `FromAddress`, `FromCity`, `FromState`, `ToAddress`, `ToCity`, `ToState`, `DistanceEst`, `WeightEst`, `Packing`, `Heavy`, `Storage`) VALUES
(3, 3, '2015-09-16 00:00:00', '4433 Grindstaff St', 'Kennewick', 'WA', '#3 Madison Ct', 'Richmond', 'WA', 10, 2000, 0, 0, 0);
INSERT INTO `joborders` (`JobID`, `CustID`, `MoveDate`, `FromAddress`, `FromCity`, `FromState`, `ToAddress`, `ToCity`, `ToState`, `DistanceEst`, `WeightEst`, `Packing`, `Heavy`, `Storage`) VALUES
(4, 3, '2020-09-16 00:00:00', '9000 Greely Pkwy', 'Seattle', 'WA', '6788 Fifth Avenue', 'Tacoma', 'WA', 15, 1200, 1, 1, 0);
INSERT INTO `joborders` (`JobID`, `CustID`, `MoveDate`, `FromAddress`, `FromCity`, `FromState`, `ToAddress`, `ToCity`, `ToState`, `DistanceEst`, `WeightEst`, `Packing`, `Heavy`, `Storage`) VALUES
(5, 9, '2030-09-16 00:00:00', '143 Faulkner Lane', 'Bellingham', 'WA', '6788 Carson Road', 'Tacoma', 'WA', 120, 5500, 1, 1, 0),
(6, 16, '2001-10-16 00:00:00', '7990 Bellington Road', 'Mount Vernon', 'WA', '78661 Davidson Drive', 'Marysville', 'WA', 35, 5500, 1, 1, 0),
(7, 13, '2005-10-16 00:00:00', '9000 Wayside Drive', 'Casper', 'WY', '8989 Franklin Street', 'Cody', 'WY', 214, 5000, 1, 1, 0),
(8, 7, '2005-10-16 00:00:00', '9001 Harvard Way', 'Cheyenne', 'WY', '78 Fortner Court', 'Sheridan', 'WY', 329, 2500, 1, 1, 0),
(9, 4, '2005-10-16 00:00:00', '89098 Jackson Street', 'Jackson', 'WY', '2009 Kinsington Place', 'Cody', 'WY', 178, 5500, 1, 1, 0),
(10, 4, '2020-10-16 00:00:00', '7890 Grapevine Court', 'Riverton', 'WY', '666 Grand Pead Drive', 'Casper', 'WY', 120, 2500, 0, 1, 0),
(11, 10, '2015-10-16 00:00:00', '9001 Shady Lane', 'Bend', 'OR', '9000 Smith Avenue', 'Eugene', 'OR', 115, 5500, 1, 1, 0),
(12, 10, '2018-10-16 00:00:00', '87998 McDonald Road', 'Eugene', 'OR', '78987 Garrison Way', 'Salem', 'OR', 65, 2000, 0, 0, 0),
(13, 26, '2015-10-16 00:00:00', '7899 Tindell St', 'Medford', 'OR', '3422 Victory Circle', 'John Day', 'OR', 330, 6500, 1, 1, 0),
(14, 36, '2008-10-16 00:00:00', '8900 Washington Street', 'Astoria', 'OR', '6755 Garrison Park Road', 'Pendleton', 'OR', 300, 7000, 1, 1, 0),
(15, 18, '2016-10-16 00:00:00', '7890 Eighth Ave', 'Tacoma', 'WA', '89 Fifth Avenue', 'Wenatchee', 'WA', 165, 5500, 1, 1, 0),
(16, 27, '2018-10-16 00:00:00', '#5 Mountain View Way', 'Spokane', 'WA', '4509 El Cajon Blvd', 'Yakima', 'WA', 200, 7200, 1, 1, 1),
(17, 32, '2015-10-16 00:00:00', '2344 Grandview St', 'Portland', 'OR', '309 Fifth Street S', 'Bremeton', 'WA', 175, 5500, 1, 1, 1),
(18, 17, '2014-10-16 00:00:00', '1290 Franklin Street', 'Rock Springs', 'WY', '3409 Greelee St', 'Cheyenne', 'WY', 260, 6000, 1, 1, 1),
(19, 17, '2022-10-16 00:00:00', '# 3 Madison Ct', 'Rock Springs', 'WY', '2456 Faulkner Road', 'Cheyenne', 'WY', 260, 5000, 1, 1, 0),
(20, 38, '2023-10-16 00:00:00', '9710 Homewood Circle', 'Jackson', 'WY', '1209 Grandview Court', 'Cody', 'WY', 180, 4000, 1, 0, 1),
(21, 31, '2024-10-16 00:00:00', '5789 Tinsdale Rd', 'Cody', 'WY', '2509 22nd Street', 'Riverton', 'WY', 140, 5500, 1, 1, 1),
(22, 13, '2030-10-16 00:00:00', '5690 McDonald Pkwy', 'Jackson', 'WY', '1098 Cheryl Lane', 'Rock Springs', 'WY', 180, 4500, 1, 0, 1),
(23, 22, '2005-11-16 00:00:00', '1200 Greenlee Way', 'Cheyenne', 'WY', '39098 Scotland Court', 'Jackson', 'WY', 436, 2000, 1, 1, 1),
(24, 22, '2015-11-16 00:00:00', '12900 Misty Lane', 'Cody', 'WY', '#3 Timbercreek Lane', 'Jackson', 'WY', 178, 2500, 0, 0, 0),
(25, 2, '2015-11-16 00:00:00', '1200 Haven Street', 'Salem', 'OR', '10928 Garrison Rd', 'Medford', 'OR', 225, 5000, 1, 1, 0),
(26, 2, '2015-11-16 00:00:00', '2099 Nature Walk Rd', 'Salem', 'OR', '8378 Eighth Ave S', 'Medford', 'OR', 225, 2000, 1, 0, 0),
(27, 2, '2015-11-16 00:00:00', '1200 College Street', 'Salem', 'OR', '7898 Gergory Court', 'Medford', 'OR', 225, 3500, 1, 0, 0),
(28, 10, '2018-11-16 00:00:00', '1098 Keystone St', 'Bend', 'OR', '8798 Hannah Way', 'Eugene', 'OR', 115, 3000, 1, 1, 0),
(29, 36, '2020-11-16 00:00:00', '20005 Perking Rd', 'Pendleton', 'OR', '8777 Austin Lea Road', 'Bend', 'OR', 243, 2500, 1, 0, 0);

INSERT INTO `positions` (`PositionID`, `Title`) VALUES
(1, 'CEO');
INSERT INTO `positions` (`PositionID`, `Title`) VALUES
(2, '	Project Manager');
INSERT INTO `positions` (`PositionID`, `Title`) VALUES
(3, 'Administrative Assistant');
INSERT INTO `positions` (`PositionID`, `Title`) VALUES
(4, 'Accountant'),
(5, '	Customer Service Representative'),
(6, 'Human Resources Manager'),
(7, 'Information Systems Specialist');

INSERT INTO `storageunits` (`ID`, `UnitID`, `UnitSize`, `WarehouseID`, `Rent`) VALUES
(1, 1, '8 x 8', 'OR-1', '25.00');
INSERT INTO `storageunits` (`ID`, `UnitID`, `UnitSize`, `WarehouseID`, `Rent`) VALUES
(2, 1, '12 x 12', 'WA-1', '35.00');
INSERT INTO `storageunits` (`ID`, `UnitID`, `UnitSize`, `WarehouseID`, `Rent`) VALUES
(3, 1, '12 x 12', 'WY-1', '45.00');
INSERT INTO `storageunits` (`ID`, `UnitID`, `UnitSize`, `WarehouseID`, `Rent`) VALUES
(4, 2, '8 x 12', 'OR-1', '30.00'),
(5, 2, '12 x 12', 'WA-1', '35.00'),
(6, 2, '12 x 12', 'WY-1', '45.00'),
(7, 3, '8 x 8', 'OR-1', '25.00'),
(8, 3, '9 x 12', 'WA-1', '30.00'),
(9, 3, '12 x 12', 'WY-1', '45.00'),
(10, 4, '8 x 12', 'OR-1', '30.00'),
(11, 4, '9 x 12', 'WA-1', '30.00'),
(12, 4, '12 x 18', 'WY-1', '70.00'),
(13, 5, '8 x 8', 'OR-1', '25.00'),
(14, 5, '12 x 12', 'WA-1', '85.00'),
(15, 5, '12 x 18', 'WY-1', '70.00'),
(16, 6, '8 x 12', 'OR-1', '30.00'),
(17, 6, '12 x 12', 'WA-1', '85.00'),
(18, 6, '12 x 12', 'WY-1', '45.00'),
(19, 7, '8 x 10', 'OR-1', '25.00'),
(20, 7, '12 x 10', 'WA-1', '80.00'),
(21, 7, '12 x 12', 'WY-1', '85.00'),
(22, 8, '15 x 15', 'OR-1', '95.00'),
(23, 8, '12 x 10', 'WA-1', '80.00'),
(24, 8, '12 x 8', 'WY-1', '35.00'),
(25, 9, '15 x 15', 'OR-1', '95.00'),
(26, 9, '18 x 18', 'WA-1', '115.00'),
(27, 9, '15 x 15', 'WY-1', '95.00'),
(28, 10, '15 x 15', 'OR-1', '95.00'),
(29, 10, '18 x 18', 'WA-1', '115.00'),
(30, 10, '18 x 18', 'WY-1', '115.00');

INSERT INTO `unitrentals` (`CustID`, `WarehouseID`, `UnitID`, `DateIn`, `DateOut`) VALUES
(2, 'OR-1', 4, '2016-01-04 00:00:00', NULL);
INSERT INTO `unitrentals` (`CustID`, `WarehouseID`, `UnitID`, `DateIn`, `DateOut`) VALUES
(2, 'OR-1', 5, '2016-01-04 00:00:00', NULL);
INSERT INTO `unitrentals` (`CustID`, `WarehouseID`, `UnitID`, `DateIn`, `DateOut`) VALUES
(4, 'WY-1', 3, '2016-02-15 00:00:00', NULL);
INSERT INTO `unitrentals` (`CustID`, `WarehouseID`, `UnitID`, `DateIn`, `DateOut`) VALUES
(6, 'WA-1', 5, '2016-01-01 00:00:00', NULL),
(7, 'WY-1', 6, '2016-01-15 00:00:00', NULL),
(9, 'WA-1', 10, '2016-02-15 00:00:00', NULL),
(10, 'OR-1', 6, '2016-02-01 00:00:00', NULL),
(10, 'OR-1', 7, '2016-02-01 00:00:00', NULL),
(10, 'OR-1', 8, '2016-02-15 00:00:00', NULL),
(11, 'WY-1', 2, '2016-01-15 00:00:00', NULL),
(12, 'WA-1', 2, '2016-02-15 00:00:00', NULL),
(12, 'WA-1', 6, '2016-02-01 00:00:00', NULL),
(13, 'WY-1', 4, '2016-02-01 00:00:00', NULL),
(13, 'WY-1', 5, '2016-02-01 00:00:00', NULL),
(14, 'WA-1', 4, '2016-02-15 00:00:00', NULL),
(15, 'WA-1', 3, '2016-02-20 00:00:00', NULL),
(17, 'WY-1', 9, '2016-02-01 00:00:00', NULL),
(18, 'WA-1', 7, '2016-02-01 00:00:00', NULL),
(20, 'WA-1', 6, '2016-01-15 00:00:00', NULL),
(26, 'OR-1', 2, '2016-02-01 00:00:00', NULL),
(27, 'WA-1', 8, '2016-02-01 00:00:00', NULL),
(31, 'WY-1', 8, '2016-02-20 00:00:00', NULL),
(32, 'WA-1', 9, '2016-01-05 00:00:00', NULL),
(36, 'OR-1', 10, '2016-02-15 00:00:00', NULL),
(38, 'WY-1', 10, '2016-01-15 00:00:00', NULL);

INSERT INTO `vehicles` (`VehicleID`, `LicensePlateNum`, `Axle`, `Color`) VALUES
('TRK-001', 'JFG 899', 4, 'Green');
INSERT INTO `vehicles` (`VehicleID`, `LicensePlateNum`, `Axle`, `Color`) VALUES
('TRK-002', 'KKL 900', 4, 'Blue');
INSERT INTO `vehicles` (`VehicleID`, `LicensePlateNum`, `Axle`, `Color`) VALUES
('TRK-003', 'YTT 899', 1, 'Blue');
INSERT INTO `vehicles` (`VehicleID`, `LicensePlateNum`, `Axle`, `Color`) VALUES
('TRK-004', 'RYH 900', 1, 'Red'),
('TRK-005', 'MLK 441', 4, 'Blue'),
('TRK-006', 'LNS 550', 2, 'Red'),
('TRK-007', 'KRN 001', 2, 'Blue'),
('TRK-008', 'KVV 879', 4, 'Red'),
('TRK-009', 'XXV 898', 4, 'Green'),
('TRK-010', 'LLO 689', 4, 'Blue'),
('TRK-011', 'LMN 899', 4, 'White'),
('VAN-001', 'KVJ 555', 2, 'White'),
('VAN-002', 'UJK 444', 2, 'White'),
('VAN-003', 'JKL 133', 2, 'White'),
('VAN-004', 'VNN 890', 2, 'White'),
('VAN-005', 'JKL 898', 2, 'White'),
('VAN-009', 'RLL 909', 2, 'White');

INSERT INTO `warehouses` (`WarehouseID`, `Address`, `City`, `State`, `Zip`, `Phone`, `ClimateControl`, `SecurityCode`) VALUES
('OR-1', '4599 Newman Street', 'Portland', 'OR', '97201', '(503) 555-5678', 0, '4532');
INSERT INTO `warehouses` (`WarehouseID`, `Address`, `City`, `State`, `Zip`, `Phone`, `ClimateControl`, `SecurityCode`) VALUES
('WA-1', '6789 Wellington Street', 'Seattle', 'WA', '98101', '(206) 555-1234', 1, '8765');
INSERT INTO `warehouses` (`WarehouseID`, `Address`, `City`, `State`, `Zip`, `Phone`, `ClimateControl`, `SecurityCode`) VALUES
('WY-1', '2786 Green Street', 'Cheyenne', 'WY', '82001', '(307) 555-9102', 1, '3456');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;