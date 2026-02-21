-- Drivers Table --
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
  `MileageRate` decimal(19,4) DEFAULT NULL,
  `Review` datetime DEFAULT NULL,
  `DrivingRecord` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SHOW INDEX FROM drivers;

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

Select * From drivers;