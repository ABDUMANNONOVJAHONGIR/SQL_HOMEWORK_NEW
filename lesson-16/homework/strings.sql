-- 1. Create a numbers table using a recursive query from 1 to 1000.
WITH RECURSIVE Numbers AS (
    SELECT 1 AS Number
    UNION ALL
    SELECT Number + 1 FROM Numbers WHERE Number < 1000
)
SELECT * FROM Numbers;

-- 2. Find the total sales per employee using a derived table.
SELECT e.id, e.name, SUM(s.amount) AS total_sales
FROM Employees e
JOIN (SELECT employee_id, amount FROM Sales) s ON e.id = s.employee_id
GROUP BY e.id, e.name;

-- 3. Create a CTE to find the average salary of employees.
WITH AvgSalary AS (
    SELECT AVG(salary) AS average_salary FROM Employees
)
SELECT * FROM AvgSalary;

-- 4. Find the highest sales for each product using a derived table.
SELECT p.product_name, MAX(s.amount) AS highest_sales
FROM Products p
JOIN (SELECT product_id, amount FROM Sales) s ON p.id = s.product_id
GROUP BY p.product_name;

-- 5. Write a statement to double the number for each record, the max value should be less than 1000000.
WITH Numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num * 2 FROM Numbers WHERE num * 2 < 1000000
)
SELECT * FROM Numbers;

-- 6. Use a CTE to get the names of employees who have made more than 5 sales.
WITH SalesCount AS (
    SELECT employee_id, COUNT(*) AS sales_count
    FROM Sales
    GROUP BY employee_id
)
SELECT e.name
FROM Employees e
JOIN SalesCount sc ON e.id = sc.employee_id
WHERE sc.sales_count > 5;

-- 7. Write a query using a CTE to find all products with sales greater than $500.
WITH SalesAbove500 AS (
    SELECT product_id, SUM(amount) AS total_sales
    FROM Sales
    GROUP BY product_id
    HAVING SUM(amount) > 500
)
SELECT p.product_name
FROM Products p
JOIN SalesAbove500 sa ON p.id = sa.product_id;

-- 8. Create a CTE to find employees with salaries above the average salary.
WITH AvgSalary AS (
    SELECT AVG(salary) AS average_salary FROM Employees
)
SELECT e.name, e.salary
FROM Employees e, AvgSalary
WHERE e.salary > AvgSalary.average_salary;

-- Medium Tasks

-- 9. Find the top 5 employees by the number of orders made using a derived table.
SELECT e.name, COUNT(s.order_id) AS orders_count
FROM Employees e
JOIN (SELECT employee_id, order_id FROM Sales) s ON e.id = s.employee_id
GROUP BY e.name
ORDER BY orders_count DESC
LIMIT 5;

-- 10. Find the sales per product category using a derived table.
SELECT p.category_id, SUM(s.amount) AS total_sales
FROM Products p
JOIN (SELECT product_id, amount FROM Sales) s ON p.id = s.product_id
GROUP BY p.category_id;

-- 11. Script to return the factorial of each value next to it.
WITH RECURSIVE Factorial(n, fact) AS (
    SELECT 1 AS n, 1 AS fact
    UNION ALL
    SELECT n + 1, fact * (n + 1)
    FROM Factorial
    WHERE n < 10  -- you can adjust the limit as needed
)
SELECT n, fact FROM Factorial;

-- 12. Script using recursion to split a string into rows of substrings for each character.
WITH RECURSIVE SplitString(str, pos, char) AS (
    SELECT SUBSTRING('Example', 1, 1), 1, SUBSTRING('Example', 1, 1)
    UNION ALL
    SELECT SUBSTRING('Example', pos + 1, 1), pos + 1, SUBSTRING('Example', pos + 1, 1)
    FROM SplitString
    WHERE pos < LENGTH('Example')
)
SELECT char FROM SplitString;

-- 13. Use a CTE to calculate the sales difference between the current month and the previous month.
WITH MonthlySales AS (
    SELECT 
        product_id, 
        SUM(amount) AS total_sales, 
        MONTH(sale_date) AS sale_month
    FROM Sales
    GROUP BY product_id, MONTH(sale_date)
)
SELECT 
    current.product_id,
    current.sale_month,
    current.total_sales - COALESCE(previous.total_sales, 0) AS sales_diff
FROM MonthlySales current
LEFT JOIN MonthlySales previous
    ON current.product_id = previous.product_id
    AND current.sale_month = previous.sale_month + 1;

-- 14. Create a derived table to find employees with sales over $45000 in each quarter.
SELECT e.name, SUM(s.amount) AS total_sales
FROM Employees e
JOIN (SELECT employee_id, amount, QUARTER(sale_date) AS quarter
      FROM Sales) s ON e.id = s.employee_id
GROUP BY e.name, s.quarter
HAVING SUM(s.amount) > 45000;

-- Difficult Tasks

-- 15. Script to calculate Fibonacci numbers using recursion.
WITH RECURSIVE Fibonacci(n, fib) AS (
    SELECT 1, 0
    UNION ALL
    SELECT n + 1, fib + (SELECT fib FROM Fibonacci WHERE n = Fibonacci.n - 1)
    FROM Fibonacci
    WHERE n < 10
)
SELECT n, fib FROM Fibonacci;

-- 16. Find a string where all characters are the same and the length is greater than 1.
SELECT str
FROM (SELECT 'aaaa' AS str UNION SELECT 'bbb' UNION SELECT 'c' UNION SELECT 'dd') AS strings
WHERE LENGTH(str) > 1 AND LENGTH(str) = LENGTH(REPLACE(str, SUBSTRING(str, 1, 1), ''));

-- 17. Create a numbers table that shows all numbers 1 through n and their order gradually increasing by the next number in the sequence.
WITH RECURSIVE Numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT CONCAT(num, num + 1)
    FROM Numbers
    WHERE num < 5  -- change the value of n as needed
)
SELECT * FROM Numbers;

-- 18. Find employees who have made the most sales in the last 6 months using a derived table.
SELECT e.name, COUNT(s.order_id) AS sales_count
FROM Employees e
JOIN (SELECT employee_id, order_id, sale_date FROM Sales WHERE sale_date > DATE_SUB(CURDATE(), INTERVAL 6 MONTH)) s
    ON e.id = s.employee_id
GROUP BY e.name
ORDER BY sales_count DESC
LIMIT 1;

-- 19. Write a T-SQL query to remove the duplicate integer values present in the string column.
WITH RemoveDuplicates AS (
    SELECT DISTINCT value FROM STRING_SPLIT('1,2,3,2,3,4,5,6', ',')
)
SELECT value FROM RemoveDuplicates;

-- 20. Create a Numbers1 table.
CREATE TABLE Numbers1(Number INT);
