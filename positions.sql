-- Positions Table --
CREATE TABLE `positions` (
  `PositionID` int NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE INDEX idx_positions_Title ON positions(Title);

SHOW INDEX FROM positions;


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

UPDATE positions 
SET Title = 'Warehouse Manager' 
WHERE PositionID = 2;


Select * From positions;