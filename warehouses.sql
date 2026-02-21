-- Warehouses Table --
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

SHOW INDEX FROM warehouses;

INSERT INTO `warehouses` (`WarehouseID`, `Address`, `City`, `State`, `Zip`, `Phone`, `ClimateControl`, `SecurityCode`) VALUES
('OR-1', '4599 Newman Street', 'Portland', 'OR', '97201', '(503) 555-5678', 0, '4532');
INSERT INTO `warehouses` (`WarehouseID`, `Address`, `City`, `State`, `Zip`, `Phone`, `ClimateControl`, `SecurityCode`) VALUES
('WA-1', '6789 Wellington Street', 'Seattle', 'WA', '98101', '(206) 555-1234', 1, '8765');
INSERT INTO `warehouses` (`WarehouseID`, `Address`, `City`, `State`, `Zip`, `Phone`, `ClimateControl`, `SecurityCode`) VALUES
('WY-1', '2786 Green Street', 'Cheyenne', 'WY', '82001', '(307) 555-9102', 1, '3456');

Select * From warehouses;



