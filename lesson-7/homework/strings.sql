-- 🟢 Easy-Level Tasks

-- 1. Find minimum price from Products table
SELECT MIN(Price) AS MinPrice FROM Products;

-- 2. Find maximum salary from Employees table
SELECT MAX(Salary) AS MaxSalary FROM Employees;

-- 3. Count number of rows in Customers table
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- 4. Count number of unique product categories
SELECT COUNT(DISTINCT Category) AS UniqueCategories FROM Products;

-- 5. Total sales amount for product with ID 7
SELECT SUM(SaleAmount) AS TotalSales FROM Sales WHERE ProductID = 7;

-- 6. Average age of employees
SELECT AVG(Age) AS AverageAge FROM Employees;

-- 7. Count number of employees in each department
SELECT DeptID, COUNT(*) AS EmployeeCount FROM Employees GROUP BY DeptID;

-- 8. Minimum and maximum price grouped by category
SELECT Category, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice 
FROM Products 
GROUP BY Category;

-- 9. Total sales per customer
SELECT CustomerID, SUM(SaleAmount) AS TotalSales 
FROM Sales 
GROUP BY CustomerID;

-- 10. Departments having more than 5 employees
SELECT DeptID 
FROM Employees 
GROUP BY DeptID 
HAVING COUNT(*) > 5;

-- 🟠 Medium-Level Tasks

-- 11. Total and average sales for each product category
SELECT Category, SUM(SaleAmount) AS TotalSales, AVG(SaleAmount) AS AvgSales 
FROM Sales 
GROUP BY Category;

-- 12. Count employees in HR department
SELECT COUNT(*) AS HREmployees 
FROM Employees 
WHERE Department = 'HR';

-- 13. Highest and lowest salary by department
SELECT DeptID, MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary 
FROM Employees 
GROUP BY DeptID;

-- 14. Average salary per department
SELECT DeptID, AVG(Salary) AS AvgSalary 
FROM Employees 
GROUP BY DeptID;

-- 15. AVG salary and COUNT of employees per department
SELECT DeptID, AVG(Salary) AS AvgSalary, COUNT(*) AS EmployeeCount 
FROM Employees 
GROUP BY DeptID;

-- 16. Product categories with avg price > 400
SELECT Category 
FROM Products 
GROUP BY Category 
HAVING AVG(Price) > 400;

-- 17. Total sales per year
SELECT YEAR(SaleDate) AS Year, SUM(SaleAmount) AS TotalSales 
FROM Sales 
GROUP BY YEAR(SaleDate);

-- 18. Customers who placed at least 3 orders
SELECT CustomerID 
FROM Orders 
GROUP BY CustomerID 
HAVING COUNT(*) >= 3;

-- 19. Departments with average salary > 60000
SELECT DeptID 
FROM Employees 
GROUP BY DeptID 
HAVING AVG(Salary) > 60000;

-- 🔴 Hard-Level Tasks

-- 20. Average price per category > 150
SELECT Category, AVG(Price) AS AvgPrice 
FROM Products 
GROUP BY Category 
HAVING AVG(Price) > 150;

-- 21. Total sales per customer with total > 1500
SELECT CustomerID, SUM(SaleAmount) AS TotalSales 
FROM Sales 
GROUP BY CustomerID 
HAVING SUM(SaleAmount) > 1500;

-- 22. Total and avg salary per department, only where avg salary > 65000
SELECT DeptID, SUM(Salary) AS TotalSalary, AVG(Salary) AS AvgSalary 
FROM Employees 
GROUP BY DeptID 
HAVING AVG(Salary) > 65000;

-- 23. Total sales > $50 per customer and their least purchase
SELECT CustomerID, 
       SUM(SaleAmount) AS TotalHighSales, 
       MIN(SaleAmount) AS LeastPurchase
FROM Sales
WHERE SaleAmount > 50
GROUP BY CustomerID;

-- 24. Total sales and count of unique products per month/year, filter months with at least 2 products sold
SELECT YEAR(OrderDate) AS OrderYear, 
       MONTH(OrderDate) AS OrderMonth, 
       SUM(SaleAmount) AS TotalSales, 
       COUNT(DISTINCT ProductID) AS UniqueProducts
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2;

-- 25. MIN and MAX order quantity per year
SELECT YEAR(OrderDate) AS OrderYear, 
       MIN(Quantity) AS MinQuantity, 
       MAX(Quantity) AS MaxQuantity
FROM Orders
GROUP BY YEAR(OrderDate);
