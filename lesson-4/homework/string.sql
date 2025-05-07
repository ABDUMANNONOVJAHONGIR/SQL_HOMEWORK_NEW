lesson-4 

================================================================

Easy-Level Tasks (10)

=================================================================
--1  Write a query to select the top 5 employees from the Employees table.

select * from employees 
drop table employees 

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE
);
--2. Insert 40 Rows into Employees Table
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, HireDate) VALUES
(1, 'John Doe', 1, 55000.00, '2020-01-01'),
(2, 'Jane Smith', 2, 65000.00, '2019-03-15'),
(3, 'Mary Johnson', 3, 45000.00, '2021-05-10'),
(4, 'James Brown', 1, 60000.00, '2018-07-22'),
(5, 'Patricia Davis', 4, 70000.00, '2017-08-30'),
(6, 'Michael Miller', 2, 75000.00, '2020-12-12'),
(7, 'Linda Wilson', 3, 48000.00, '2016-11-02'),
(8, 'David Moore', 4, 85000.00, '2021-09-01'),
(9, 'Elizabeth Taylor', 1, 60000.00, '2019-05-18'),
(10, 'William Anderson', 2, 64000.00, '2020-04-10'),
(11, 'Susan Thomas', 3, 47000.00, '2017-01-25'),
(12, 'Joseph Jackson', 4, 78000.00, '2016-09-30'),
(13, 'Karen White', 1, 59000.00, '2018-06-10'),
(14, 'Steven Harris', 2, 71000.00, '2021-07-15'),
(15, 'Nancy Clark', 3, 45000.00, '2020-02-20'),
(16, 'George Lewis', 4, 80000.00, '2019-11-10'),
(17, 'Betty Lee', 1, 55000.00, '2017-04-05'),
(18, 'Samuel Walker', 2, 72000.00, '2021-03-22'),
(19, 'Helen Hall', 3, 49000.00, '2018-10-16'),
(20, 'Charles Allen', 4, 90000.00, '2015-08-11'),
(21, 'Betty Young', 1, 53000.00, '2020-05-17'),
(22, 'Frank King', 2, 67000.00, '2021-02-02'),
(23, 'Deborah Scott', 3, 47000.00, '2019-07-09'),
(24, 'Matthew Green', 4, 76000.00, '2021-01-15'),
(25, 'Sandra Adams', 1, 54000.00, '2020-06-21'),
(26, 'Paul Nelson', 2, 71000.00, '2018-12-03'),
(27, 'Margaret Carter', 3, 46000.00, '2020-08-19'),
(28, 'Anthony Mitchell', 4, 82000.00, '2021-04-10'),
(29, 'Lisa Perez', 1, 60000.00, '2021-03-05'),
(30, 'Christopher Roberts', 2, 69000.00, '2019-09-24'),
(31, 'Jessica Gonzalez', 3, 47000.00, '2017-12-13'),
(32, 'Brian Moore', 4, 85000.00, '2018-11-05'),
(33, 'Dorothy Evans', 1, 59000.00, '2019-06-11'),
(34, 'Matthew Carter', 2, 70000.00, '2020-01-29'),
(35, 'Rachel Martinez', 3, 51000.00, '2021-06-06'),
(36, 'Daniel Perez', 4, 83000.00, '2021-07-01'),
(37, 'Catherine Roberts', 1, 60000.00, '2020-09-19'),
(38, 'Ronald Murphy', 2, 68000.00, '2017-02-04'),
(39, 'Angela Jenkins', 3, 52000.00, '2018-04-23'),
(40, 'Gary Wright', 4, 87000.00, '2021-01-10');

select top 5 * from employees

--2 Use SELECT DISTINCT to select unique ProductName values from the Products table.
select distinct Name from Products 

select * from Products 

--3 Write a query that filters the Products table to show products with Price > 100.
select * from Products 
where Price > 100

--4 Write a query to select all CustomerName values that start with 'A' using the LIKE operator.
select * from Products 
where name like 'A%'

--5 Order the results of a Products query by Price in ascending order.

select * from Products 
order by Price asc

--6 Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and Department = 'HR'.

select * from employees 
where Salary >= 60000 and Department = 'HR'

select * from employees 

--7 Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table
 
 select isnull(Email,noemail@example.com)
 from Employees 

--8 Write a query that shows all products with Price BETWEEN 50 AND 100.
select * from Products  
where Price between 50 and 100

--9 Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
select distinct Category,Name from Products 

--10 After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.

select distinct Category,name from Products 
	order by name desc 
===============================================================================

Medium-Level Tasks (10)

===============================================================================

--11 Write a query to select the top 10 products from the Products table, ordered by Price DESC.

select top 10 * from Products
	order by Price desc 

--12 Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.

select coalesce(FirstName,lastName)
from Employees 

select * from Employees 

--13 Write a query that selects distinct Category and Price from the Products table.
select distinct Category, Price  from Products

--14 Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.
select * from employees 
where Age (between 30 and 40) or Department = 'Marketing'


--15 Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
select * from Employees order by Salary desc 
offset 10 rows fetch next 10 rows only;

--16	Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.
select * from Products  
where Price <= 1000 and StockQuantity > 50
order by StockQuantity asc 

select * from Products

--17 Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
select * from Products 
where Name like '%e%'

--18 Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.

select * from employees 
where department in ('HR', 'IT', or 'Finance')

--19 Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.Use customers table
-- 1. Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    LoyaltyStatus VARCHAR(50)
);

-- Insert 40 rows into Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'New York', 'Gold'),
(2, 'Bob', 'California', 'Silver'),
(3, 'Charlie', 'Texas', 'Gold'),
(4, 'David', 'Florida', 'Platinum'),
(5, 'Eve', 'California', 'Gold'),
(6, 'Frank', 'Texas', 'Silver'),
(7, 'Grace', 'New York', 'Platinum'),
(8, 'Helen', 'Florida', 'Gold'),
(9, 'Ivan', 'California', 'Silver'),
(10, 'Jack', 'New York', 'Gold'),
(11, 'Kathy', 'Texas', 'Gold'),
(12, 'Leo', 'California', 'Platinum'),
(13, 'Mona', 'New York', 'Silver'),
(14, 'Nina', 'Florida', 'Gold'),
(15, 'Oscar', 'California', 'Silver'),
(16, 'Paul', 'Texas', 'Gold'),
(17, 'Quincy', 'New York', 'Platinum'),
(18, 'Rachel', 'Florida', 'Silver'),
(19, 'Sam', 'California', 'Gold'),
(20, 'Tom', 'Texas', 'Platinum'),
(21, 'Uma', 'New York', 'Gold'),
(22, 'Vera', 'California', 'Platinum'),
(23, 'Walter', 'Florida', 'Silver'),
(24, 'Xander', 'Texas', 'Gold'),
(25, 'Yara', 'New York', 'Silver'),
(26, 'Zoe', 'California', 'Platinum'),
(27, 'Aaron', 'Texas', 'Gold'),
(28, 'Bella', 'Florida', 'Platinum'),
(29, 'Caleb', 'California', 'Silver'),
(30, 'Diana', 'Texas', 'Gold'),
(31, 'Eva', 'New York', 'Silver'),
(32, 'Finn', 'Florida', 'Gold'),
(33, 'Gina', 'California', 'Platinum'),
(34, 'Hank', 'Texas', 'Silver'),
(35, 'Ivy', 'New York', 'Gold'),
(36, 'Jason', 'California', 'Silver'),
(37, 'Ken', 'Texas', 'Platinum'),
(38, 'Lia', 'Florida', 'Gold'),
(39, 'Mick', 'New York', 'Platinum'),
(40, 'Noah', 'California', 'Gold');

----19 Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.Use customers table

select * from customers 
order by City asc , PostalCode desc

select * from Customers 
==========================================================================
Hard-Level Tasks

=====================================

--20 Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC.

 




















































