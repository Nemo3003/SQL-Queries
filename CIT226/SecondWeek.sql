
USE SalesOrdersExample;

-- First Query
SELECT CONCAT(cus.CustFirstName,' ',cus.CustLastName), ord.OrderDate
FROM Orders ord
JOIN Customers cus
ON cus.CustomerID = ord.CustomerID
ORDER BY ord.OrderDate;

-- Second Query
SELECT CONCAT(emp.EmpFirstName,' ', emp.EmpLastName) AS 'Employees', 
CONCAT(cus.CustFirstName,' ',cus.CustLastName) AS 'Customers'
FROM Orders ord
JOIN Customers cus
ON cus.CustomerID = ord.CustomerID
JOIN Employees emp
ON emp.EmployeeID = ord.EmployeeID;

-- Third Query
SELECT ordd.OrderNumber, pro.ProductName, pro.RetailPrice
FROM Order_Details ordd
JOIN Products pro
ON ordd.ProductNumber = pro.ProductNumber
ORDER BY ordd.OrderNumber;

-- Fourth Query
SELECT v.VendName, pro.ProductName, pro.RetailPrice
FROM Product_Vendors pv
JOIN Vendors v
ON v.VendorID = pv.VendorID
JOIN Products pro
ON pro.ProductNumber = pv.ProductNumber
WHERE pro.RetailPrice < 100;

-- Fifth Query
SELECT CONCAT(cus.CustFirstName, ' ',cus.CustLastName) AS 'Customers', 
CONCAT(emp.EmpFirstName, ' ' ,emp.EmpLastName) AS 'Employees'
FROM Customers cus
JOIN Employees emp
ON cus.CustLastName = emp.EmpLastName;

-- Sixth Query
SELECT CONCAT(cus.CustFirstName, ' ',cus.CustLastName) AS 'Customers',
CONCAT(emp.EmpFirstName, ' ' ,emp.EmpLastName) AS 'Employees', cus.CustCity
FROM Customers cus
JOIN Employees emp
ON cus.CustCity = emp.EmpCity;

-- **********************************************************************************************************************************
USE BowlingLeagueExample;

-- First Query
SELECT t.TeamName, CONCAT(bo.BowlerFirstName,' ',bo.BowlerLastName) AS 'Team members'
FROM Bowlers bo
JOIN Teams t
ON t.TeamID = bo.TeamID
ORDER BY t.TeamID;

-- Second Query
SELECT CONCAT(bo.BowlerFirstName,' ',bo.BowlerLastName) AS 'Bowler', ma.MatchID, bow.RawScore
FROM Bowler_Scores bow
JOIN Bowlers bo
ON bo.BowlerID = bow.BowlerID
JOIN Match_Games ma
ON ma.MatchID = bow.MatchID;

-- Third Query
SELECT CONCAT(bo.BowlerFirstName,' ',bo.BowlerLastName) AS 'Bowler', bo.BowlerZip,
CONCAT(bow.BowlerFirstName,' ',bow.BowlerLastName) AS 'Bowler', bow.BowlerZip
FROM Bowlers bo
JOIN Bowlers bow
ON bow.BowlerZip = bo.BowlerZip
WHERE bow.BowlerFirstName <> bo.BowlerFirstName;