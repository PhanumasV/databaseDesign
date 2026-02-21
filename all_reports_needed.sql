-- All Reports Needed --

-- 1. WarehouseManagerReportLabels --
SELECT 
    e.EmpFirst AS ManagerFirstName,
    e.EmpLast AS ManagerLastName,
    e.WarehouseID,
    w.Address,
    w.City,
    w.State,
    w.Zip,
    w.Phone
FROM employees e
JOIN warehouses w ON e.WarehouseID = w.WarehouseID
JOIN positions p ON e.PositionID = p.PositionID
WHERE p.Title = 'Warehouse Manager'
ORDER BY e.WarehouseID;

-- 2. JobRevenueReport --
SELECT 
    j.JobID,
    j.MoveDate,
    CONCAT(d.DriverFirst, ' ', d.DriverLast) AS DriverName,
    d.MileageRate AS DriverRate,
    jd.MileageActual,
    jd.WeightActual,
    
    -- Calculate gross income from the job
    --   $0.70 per mile + $0.20 per pound moved
    FORMAT(jd.MileageActual * 0.7 + jd.WeightActual * 0.2, 2) AS Income,
    
     -- Calculate the driver's payment
    --   $50 base fee + (miles * driver's mileage rate)
    FORMAT(50 + (jd.MileageActual * d.MileageRate), 2) AS DriverPayment,
    
    -- Calculate net income (profit)
    --   Income - Driver Payment
    FORMAT((jd.MileageActual * 0.7 + jd.WeightActual * 0.2) - (50 + (jd.MileageActual * d.MileageRate)), 2) AS NetIncome
FROM joborders j
JOIN jobdetails jd ON j.JobID = jd.JobID
JOIN drivers d ON jd.DriverID = d.DriverID
ORDER BY j.MoveDate DESC;

-- Total Revenue & Costs (the total income, the total payments to drivers, and the total net income) --
SELECT 

	-- Total income: sum of revenue from all jobs
    --  $0.70 per mile + $0.20 per pound
    FORMAT(SUM(jd.MileageActual * 0.7 + jd.WeightActual * 0.2), 2) AS TotalIncome,
    
    -- Total payments to drivers: sum of all driver's payment
    --  $50 base fee + (miles * mileage rate)
    FORMAT(SUM(50 + (jd.MileageActual * d.MileageRate)), 2) AS TotalDriverPayments,
    
     -- Total net income (profit): total income minus total driver payments
    FORMAT(SUM((jd.MileageActual * 0.7 + jd.WeightActual * 0.2) - (50 + (jd.MileageActual * d.MileageRate))), 2) AS TotalNetIncome
FROM jobdetails jd
JOIN drivers d ON jd.DriverID = d.DriverID;


-- 3. StorageRevenueReport --

-- CTE #1: Calculate total rent per warehouse
WITH WarehouseTotals AS (
    SELECT 
        unitrentals.WarehouseID,
        -- Total rent for each warehouse formatted as $ currency
        CONCAT('$', FORMAT(SUM(storageunits.Rent), 2)) AS TotalRentPerWarehouse
    FROM unitrentals
    JOIN storageunits 
      ON unitrentals.UnitID = storageunits.UnitID 
     AND unitrentals.WarehouseID = storageunits.WarehouseID
    GROUP BY unitrentals.WarehouseID
),

-- CTE #2: Calculate the grand total of all rents from all warehouses
GrandTotal AS (
    SELECT 
        'Grand Total' AS WarehouseID, 
        NULL AS RenterName, 
        NULL AS RentPerUnit, 
        NULL AS YearsRented, 
        NULL AS TotalRentPerWarehouse,
         -- Grand total rent across all warehouses, formatted as $ currency
        CONCAT('$', FORMAT(SUM(storageunits.Rent), 2)) AS GrandTotalRent
    FROM unitrentals
    JOIN storageunits 
      ON unitrentals.UnitID = storageunits.UnitID 
     AND unitrentals.WarehouseID = storageunits.WarehouseID
)

-- First, select all renters' details (main query)
SELECT 
    unitrentals.WarehouseID,
    CONCAT(customers.ContactLast, ', ', customers.ContactFirst) AS RenterName,
       -- Format rent per unit as currency
    CONCAT('$', FORMAT(storageunits.Rent, 2)) AS RentPerUnit,
    -- Calculate number of years rented (difference between DateIn and DateOut or NOW if still rented)
    FORMAT(DATEDIFF(IFNULL(unitrentals.DateOut, NOW()), unitrentals.DateIn) / 365.0, 1) AS YearsRented,
    NULL AS TotalRentPerWarehouse,  -- Warehouse totals will come later
    NULL AS GrandTotalRent         -- Grand total will come last
FROM unitrentals
JOIN customers 
  ON unitrentals.CustID = customers.CustID
JOIN storageunits 
  ON unitrentals.UnitID = storageunits.UnitID 
 AND unitrentals.WarehouseID = storageunits.WarehouseID

UNION ALL  

-- Next, select the warehouse summary after the renter details to report
SELECT 
    WarehouseTotals.WarehouseID,
    NULL AS RenterName,
    NULL AS RentPerUnit,
    NULL AS YearsRented,
    WarehouseTotals.TotalRentPerWarehouse,  -- Total rent per warehouse
    NULL AS GrandTotalRent    -- Grand total will appear at the end
FROM WarehouseTotals

UNION ALL  

-- Finally, select the grand total for all warehouses at the end
SELECT 
    GrandTotal.WarehouseID, 
    GrandTotal.RenterName, 
    GrandTotal.RentPerUnit, 
    GrandTotal.YearsRented, 
    GrandTotal.TotalRentPerWarehouse, 
    GrandTotal.GrandTotalRent
FROM GrandTotal

-- Group by warehouse and renter name
ORDER BY 
    CASE WHEN WarehouseID = 'Grand Total' THEN 1 ELSE 0 END, 
    WarehouseID, 
    RenterName;
















