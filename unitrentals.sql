-- Unit Rentals Table --
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


CREATE INDEX idx_unitrentals_DateIn ON unitrentals(DateIn);
CREATE INDEX idx_unitrentals_DateOut ON unitrentals(DateOut);

SHOW INDEX FROM unitrentals;

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

Select * From unitrentals;

-- Additional questions
-- 1. How many storage units did the company rent last year? 
-- If it counts only Year 2024 then the answer is 0 units
SELECT COUNT(*) AS UnitsRentedLastYear
FROM unitrentals
WHERE DateIn >= '2024-01-01' AND DateIn <= '2024-12-31';

-- If it counts from year started on or before 2024 (last year = 2024) then the answer is 25 units
SELECT COUNT(*) AS UnitsRentedLastYear
FROM unitrentals
LEFT JOIN customers c ON unitrentals.CustID = c.CustID
WHERE DateOut IS NULL
  AND YEAR(DateIn) <= YEAR(CURDATE()) - 1;



-- 2. What percentage of customers have rented at least one unit?
-- percentage = (Cutomers who rented units divides by total number of customers) x 100

-- We have total number of customers
SELECT COUNT(*) AS TotalCustomers
FROM customers;

-- Next, number of customers who rented at least one unit
SELECT COUNT(DISTINCT CustID) AS CustomersWhoRented
FROM unitrentals;

-- Then, the answer is 52.63%
SELECT 
  ROUND(
    (SELECT COUNT(DISTINCT CustID) FROM unitrentals) * 100.0 /
    (SELECT COUNT(*) FROM customers),
  2) AS RentalCustomerPercentage;
  
  -- Now, include every columns to show all details
  SELECT
  (SELECT COUNT(*) FROM customers) AS TotalCustomers,
  (SELECT COUNT(DISTINCT CustID) FROM unitrentals) AS CustomersWhoRented,
  ROUND((SELECT COUNT(DISTINCT CustID) FROM unitrentals) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS RentalCustomerPercentage;
  
  
  -- 3. What was the greatest number of rents by an individual? Answer is 3
SELECT
  c.CustID,
  c.CompanyName,
  c.ContactFirst,
  c.ContactLast,
  COUNT(ur.UnitID) AS RentalsCount  -- Count how many units they’ve rented, it gives the total number of unit rentals per customer.
  
 -- Performs an inner join between customers and unitrentals so we only include customers who have made at least one rental.
FROM
  customers c
JOIN
  unitrentals ur ON c.CustID = ur.CustID
GROUP BY 
  c.CustID, c.CompanyName, c.ContactFirst, c.ContactLast   -- It groups the data by each unique customer to ensure that the count is per individual.
ORDER BY
  RentalsCount DESC     -- It orders the results in descending order (DESC = descending) based on RentalsCount, so the customer with the most rentals is at the top.
LIMIT 1;   -- Only the top result (the customer with the highest count of unit rentals) is returned.


-- 4. What is the average length of a rental period?
-- CTE: Calculates the average number of years between DateIn and DateOut for all rentals, which IFNULL(DateOut, NOW()) means until current date.
WITH AverageRentalYears AS (
    SELECT 
        'Average Rental Period' AS WarehouseID,
        NULL AS RenterName,
        FORMAT(AVG(DATEDIFF(
            IFNULL(unitrentals.DateOut, NOW()), unitrentals.DateIn) / 365.0), 2) AS YearsRented  -- Calculates average days between DateIn and DateOut (or NOW) and converts to years
    FROM unitrentals
    WHERE unitrentals.DateIn IS NOT NULL
)

-- Get renter details with years rented for each renter
SELECT 
    unitrentals.WarehouseID,
    CONCAT(customers.ContactLast, ', ', customers.ContactFirst) AS RenterName,
    FORMAT(DATEDIFF(IFNULL(unitrentals.DateOut, NOW()), unitrentals.DateIn) / 365.0, 1) AS YearsRented  -- Calculates the rental duration (in years)
FROM unitrentals
JOIN customers 
  ON unitrentals.CustID = customers.CustID
JOIN storageunits 
  ON unitrentals.UnitID = storageunits.UnitID 
 AND unitrentals.WarehouseID = storageunits.WarehouseID

UNION ALL

-- Add average rental period row to the list to combine using UNION ALL
SELECT 
    WarehouseID,
    RenterName,
    YearsRented
FROM AverageRentalYears

-- Sorts the result to appear at the bottom
ORDER BY 
    CASE 
        WHEN WarehouseID = 'Average Rental Period' THEN 1 
        ELSE 0 
    END,
    WarehouseID,
    RenterName;
    
-- 5. What are the company's peak rental months? Answer: 2 (February) has 17 rents.
SELECT 
    YEAR(DateIn) AS RentalYear,
    MONTH(DateIn) AS RentalMonth,
    COUNT(*) AS RentalCount  -- Count the total number of rentals per year and month
FROM 
    unitrentals
GROUP BY 
    YEAR(DateIn), MONTH(DateIn)  -- Groups rentals by both year and month to get one row per year-month pair.
ORDER BY 
    RentalCount DESC;  -- Show the descending result at the top

    





