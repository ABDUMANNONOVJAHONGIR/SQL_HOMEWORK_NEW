-- 1. Rename ProductName as Name
SELECT ProductName AS Name FROM Products;

-- 2. Rename Customers table as Client
SELECT * FROM Customers AS Client;

-- 3. UNION of ProductName from Products and Products_Discounted
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

-- 4. INTERSECT of ProductName from Products and Products_Discounted
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;

-- 5. Select distinct customer names and their Country
SELECT DISTINCT CustomerName, Country FROM Customers;

-- 6. CASE to create column 'High' if Price > 1000, else 'Low'
SELECT ProductName, 
       CASE 
           WHEN Price > 1000 THEN 'High'
           ELSE 'Low'
       END AS PriceCategory
FROM Products;

-- 7. IIF to show 'Yes' if Stock > 100, else 'No'
SELECT ProductName, 
       IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;

-- 8. UNION for medium-level task (same as 3)
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

-- 9. EXCEPT to find difference between Products and Products_Discounted
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;

-- 10. IIF to show 'Expensive' if Price > 1000, else 'Affordable'
SELECT ProductName, 
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceLevel
FROM Products;

-- 11. Employees with Age < 25 or Salary > 60000
SELECT * FROM Employees
WHERE Age < 25 OR Salary > 60000;

-- 12. Update salary: +10% if in HR or EmployeeID = 5
UPDATE Employees
SET Salary = Salary * 1.1
WHERE Department = 'HR' OR EmployeeID = 5;

-- 13. CASE to assign tier based on SaleAmount
SELECT SaleID, SaleAmount,
       CASE 
           WHEN SaleAmount > 500 THEN 'Top Tier'
           WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
           ELSE 'Low Tier'
       END AS SaleTier
FROM Sales;

-- 14. EXCEPT to find CustomerIDs who placed orders but not in Sales
SELECT CustomerID FROM Orders
EXCEPT
SELECT CustomerID FROM Sales;

-- 15. CASE for discount percentage based on quantity
SELECT CustomerID, Quantity,
       CASE 
           WHEN Quantity = 1 THEN '3%'
           WHEN Quantity BETWEEN 1 AND 3 THEN '5%'
           ELSE '7%'
       END AS DiscountPercentage
FROM Orders;
