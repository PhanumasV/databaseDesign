-- Employees Table --
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

CREATE INDEX idx_employees_State ON employees(State);
CREATE INDEX idx_employees_StartDate ON employees(StartDate);
CREATE INDEX idx_employees_EndDate ON employees(EndDate);

SHOW INDEX FROM employees;

SELECT COUNT(*) FROM employees WHERE State = 'WA';
SELECT * FROM employees WHERE WarehouseID = 'WA-1';

Select * From employees;



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

Select * From employees;

-- Enhancements for Employees Table --

-- 1. Employee Years of Service and Vested Status
CREATE OR REPLACE VIEW EmployeeYearsOfService AS
SELECT 
    EmpID,
    EmpFirst,
    EmpLast,
    StartDate,
    EndDate,
    -- Calculate the number of full years between start date and end date (or today's date if still employed)
    TIMESTAMPDIFF(YEAR, StartDate, IFNULL(EndDate, CURDATE())) AS YearsOfService,
    
    -- If they are still employed (EndDate IS NULL) and have 5+ years of service then they're fully vested
    CASE 
        WHEN EndDate IS NULL AND TIMESTAMPDIFF(YEAR, StartDate, CURDATE()) >= 5 THEN 'Fully Vested'
        ELSE 'Not Vested'
    END AS VestedStatus
FROM employees;


 SELECT * FROM EmployeeYearsOfService;

-- 2. Validate Phone Area Codes Based on State
DELIMITER //
CREATE TRIGGER ValidatePhoneAreaCode
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	-- If the employee's state is Oregon (OR)
    IF NEW.State = 'OR' AND LEFT(NEW.Phone, 3) NOT IN ('541', '503', '971') THEN
		-- Raise an error and prevent the insert
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'OR phone area codes should be 541, 503, or 971';
    END IF;
    
     -- If the employee's state is Washington (WA)
    IF NEW.State = 'WA' AND LEFT(NEW.Phone, 3) NOT IN ('425', '360', '206', '509', '253') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'WA phone area codes should be 425, 360, 206, 509, or 253';
    END IF;
    
    -- If the employee's state is Wyoming (WY)
    IF NEW.State = 'WY' AND LEFT(NEW.Phone, 3) NOT IN ('307') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'WY phone area codes should be 307';
    END IF;
END;
//
DELIMITER ;

SHOW TRIGGERS WHERE `Trigger` = 'ValidatePhoneAreaCode';
SHOW CREATE TRIGGER ValidatePhoneAreaCode;

-- Test a valid data for OR as Oregon area
INSERT INTO employees (EmpID, EmpFirst, EmpLast, State, Phone)
VALUES (99, 'James', 'Bruce', 'OR', '5034445578');

-- Test an invalid data for OR as Oregon area
INSERT INTO employees (EmpID, EmpFirst, EmpLast, State, Phone)
VALUES (94, 'Jane', 'Smith', 'OR', '9721234887');

-- Test a valid data for WA as Washington area
INSERT INTO employees (EmpID, EmpFirst, EmpLast, State, Phone)
VALUES (97, 'Mike', 'Johnson', 'WA', '4259876543');

-- Test an invalid data for WA as Washington area
INSERT INTO employees (EmpID, EmpFirst, EmpLast, State, Phone)
VALUES (98, 'Marie', 'Park', 'WA', '9999415892');

-- Test a valid data for WY as Wyoming area
INSERT INTO employees (EmpID, EmpFirst, EmpLast, State, Phone)
VALUES (96, 'Anne', 'Kim', 'WY', '3077778564');

-- Test an invalid data for WY as Wyoming area
INSERT INTO employees (EmpID, EmpFirst, EmpLast, State, Phone)
VALUES (95, 'Michael', 'Wayne', 'WY', '9564237589');

DELETE FROM employees 
WHERE EmpID IN (99);


-- 3. Hide EndDate for Active Employees, Hide Review for Inactive Employees
CREATE OR REPLACE VIEW EmployeeStatusView AS
SELECT 
    EmpID,
    EmpFirst,
    EmpLast,
    State,
    Phone,
    
    -- If EndDate is NULL (meaning the employee is active), return NULL
    -- Otherwise, return the actual EndDate (inactive employee)
    CASE WHEN EndDate IS NULL THEN NULL ELSE EndDate END AS EndDate,
    
    -- If EndDate is NULL (active employee), show Review
    -- Otherwise (inactive employee), hide the Review by returning NULL
    CASE WHEN EndDate IS NULL THEN Review ELSE NULL END AS Review
FROM employees;


 SELECT * FROM EmployeeStatusView;


-- 4. Script to see Annual Earnings (Salary Returns Salary or Hourly Rate * 2080 for annual salary)

SELECT EmpID, 
       EmpFirst, 
       EmpLast, 
       Salary, 
       HourlyRate, 
       
       -- If the employee has a set Salary, use it directly
       -- If not, but they have an HourlyRate, calculate annual salary as HourlyRate * 2080 (standard work hours/year)
       CASE 
         WHEN Salary IS NOT NULL THEN Salary
         WHEN HourlyRate IS NOT NULL THEN HourlyRate * 2080 
         ELSE 0 
       END AS AnnualEarnings
       
FROM employees;



-- 5. Calculate Employees Age
DELIMITER //
CREATE FUNCTION CalculateEmployeeAge(empDOB DATE) RETURNS INT
DETERMINISTIC  -- The function's result is deterministic, meaning it will always return the same result for the same input (empDOB)
BEGIN
	-- Calculate the difference in years between the current date (CURDATE()) and the employee's date of birth (empDOB)
    -- It returns the result as the employee's age in full years.
    RETURN TIMESTAMPDIFF(YEAR, empDOB, CURDATE());
END;
//
DELIMITER ;


 SELECT EmpID, EmpFirst, EmpLast, DOB, CalculateEmployeeAge(DOB) AS Age FROM employees;

-- 6. Calculate Years of Service
DELIMITER //
CREATE FUNCTION CalculateYearsOfService(empStart DATE) RETURNS INT
DETERMINISTIC
BEGIN
	-- Calculate the number of full years between empStart and the current date (CURDATE())
    RETURN TIMESTAMPDIFF(YEAR, empStart, CURDATE());
END;
//
DELIMITER ;


 SELECT EmpID, EmpFirst, EmpLast, CalculateYearsOfService(StartDate) AS YearsOfService FROM employees;







