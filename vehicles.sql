-- Vehicles Table --
CREATE TABLE `vehicles` (
  `VehicleID` varchar(10) NOT NULL,
  `LicensePlateNum` varchar(7) DEFAULT NULL,
  `Axle` int DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`VehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SHOW INDEX FROM vehicles;

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

Select * From vehicles;
