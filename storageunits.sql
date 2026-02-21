-- Storage Units Table --
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

CREATE INDEX idx_storageunits_Rent ON storageunits(Rent);

SHOW INDEX FROM storageunits;

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

Select * From storageunits;