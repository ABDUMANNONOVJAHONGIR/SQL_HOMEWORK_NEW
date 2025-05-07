-- 🟢 Easy-Level Tasks

-- 1. Total number of products available in each category
SELECT Category, COUNT(*) AS TotalProducts 
FROM Products 
GROUP BY Category;

-- 2. Average price of products in the 'Electronics' category
SELECT AVG(Price) AS AvgElectronicsPrice 
FROM Products 
WHERE Category = 'Electronics';

-- 3. Customers from cities starting with 'L'
SELECT * 
FROM Customers 
WHERE City LIKE 'L%';

-- 4. Product names that end with 'er'
SELECT ProductName 
FROM Products 
WHERE ProductName LIKE '%er';

-- 5. Customers from countries ending in 'A'
SELECT * 
FROM Customers 
WHERE Country LIKE '%A';

-- 6. Highest price among all products
SELECT MAX(Price) AS HighestPrice 
FROM Products;

-- 7. Label stock based on quantity
SELECT ProductName, Quantity,
       CASE 
           WHEN Quantity < 30 THEN 'Low Stock'
           ELSE 'Sufficient'
       END AS StockStatus
FROM Products;

-- 8. Total number of customers in each country
SELECT Country, COUNT(*) AS TotalCustomers 
FROM Customers 
GROUP BY Country;

-- 9. Minimum and maximum quantity ordered
SELECT MIN(Quantity) AS MinQty, MAX(Quantity) AS MaxQty 
FROM Orders;

-- 🟠 Medium-Level Tasks

-- 10. Customers who placed orders in Jan 2023 but have no invoices
SELECT DISTINCT o.CustomerID 
FROM Orders o
WHERE YEAR(o.OrderDate) = 2023 AND MONTH(o.OrderDate) = 1
EXCEPT
SELECT DISTINCT CustomerID 
FROM Invoices;

-- 11. Combine all product names from both tables (with duplicates)
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

-- 12. Combine all product names without duplicates
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

-- 13. Average order amount by year
SELECT YEAR(OrderDate) AS OrderYear, 
       AVG(OrderAmount) AS AvgOrderAmount 
FROM Orders 
GROUP BY YEAR(OrderDate);

-- 14. Group products based on price
SELECT ProductName, 
       CASE 
           WHEN Price < 100 THEN 'Low'
           WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
           ELSE 'High'
       END AS PriceGroup
FROM Products;

-- 15. Pivot years into columns
SELECT * INTO Population_Each_Year
FROM (
    SELECT City, Year, Population FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;

-- 16. Total sales per ProductID
SELECT ProductID, SUM(SaleAmount) AS TotalSales 
FROM Sales 
GROUP BY ProductID;

-- 17. Products containing 'oo' in name
SELECT ProductName 
FROM Products 
WHERE ProductName LIKE '%oo%';

-- 18. Pivot cities into columns
SELECT * INTO Population_Each_City
FROM (
    SELECT City, Year, Population FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable;

-- 🔴 Hard-Level Tasks

-- 19. Top 3 customers by total invoice amount
SELECT TOP 3 CustomerID, SUM(InvoiceAmount) AS TotalSpent 
FROM Invoices 
GROUP BY CustomerID 
ORDER BY TotalSpent DESC;

-- 20. Unpivot Population_Each_Year to original format
SELECT City, '2012' AS Year, [2012] AS Population FROM Population_Each_Year
UNION ALL
SELECT City, '2013', [2013] FROM Population_Each_Year;

-- 21. Product names and how many times each sold
SELECT p.ProductName, COUNT(s.SaleID) AS TimesSold
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName;

-- 22. Unpivot Population_Each_City to original format
SELECT 'Bektemir' AS City, Year, [Bektemir] AS Population FROM Population_Each_City
UNION ALL
SELECT 'Chilonzor', Year, [Chilonzor] FROM Population_Each_City
UNION ALL
SELECT 'Yakkasaroy', Year, [Yakkasaroy] FROM Population_Each_City;
