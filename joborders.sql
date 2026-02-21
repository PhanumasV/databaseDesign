-- Job Orders --
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

CREATE INDEX idx_joborders_MoveDate ON joborders(MoveDate);
SHOW INDEX FROM joborders;

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

Select * From joborders;