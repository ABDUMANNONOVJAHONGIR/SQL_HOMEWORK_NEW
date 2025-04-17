--lesson-3
=================================================================================================
--go 

--Create Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);
--4. Insert 40 Rows into Categories Table
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Sports & Outdoors'),
(5, 'Beauty & Personal Care'),
(6, 'Toys & Games'),
(7, 'Books'),
(8, 'Groceries'),
(9, 'Furniture'),
(10, 'Automotive'),
(11, 'Health & Wellness'),
(12, 'Pet Supplies'),
(13, 'Jewelry'),
(14, 'Baby Products'),
(15, 'Music'),
(16, 'Movies & TV Shows'),
(17, 'Office Supplies'),
(18, 'Tools & Home Improvement'),
(19, 'Garden & Outdoor'),
(20, 'Food & Beverages'),
(21, 'Software'),
(22, 'Art & Craft'),
(23, 'Travel Accessories'),
(24, 'Phone Accessories'),
(25, 'Luggage & Bags'),
(26, 'Gifts & Occasions'),
(27, 'Digital Products'),
(28, 'Gaming Consoles'),
(29, 'Cameras & Photography'),
(30, 'Smart Home'),
(31, 'Computers & Laptops'),
(32, 'Appliances'),
(33, 'Musical Instruments'),
(34, 'Party Supplies'),
(35, 'Watches'),
(36, 'Outdoor Gear'),
(37, 'Seasonal Products'),
(38, 'Luxury Goods'),
(39, 'Home Decor'),
(40, 'Art Supplies');
=============================
-- 2. Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    StockQuantity INT
);

-- Insert 40 rows into Products
INSERT INTO Products VALUES
(1, 'Laptop', 1200.00, 'Electronics', 30),
(2, 'Smartphone', 800.00, 'Electronics', 50),
(3, 'Tablet', 400.00, 'Electronics', 40),
(4, 'Monitor', 250.00, 'Electronics', 60),
(5, 'Keyboard', 50.00, 'Accessories', 100),
(6, 'Mouse', 30.00, 'Accessories', 120),
(7, 'Chair', 150.00, 'Furniture', 80),
(8, 'Desk', 200.00, 'Furniture', 75),
(9, 'Pen', 5.00, 'Stationery', 300),
(10, 'Notebook', 10.00, 'Stationery', 500),
(11, 'Printer', 180.00, 'Electronics', 25),
(12, 'Camera', 500.00, 'Electronics', 40),
(13, 'Flashlight', 25.00, 'Tools', 200),
(14, 'Shirt', 30.00, 'Clothing', 150),
(15, 'Jeans', 45.00, 'Clothing', 120),
(16, 'Jacket', 80.00, 'Clothing', 70),
(17, 'Shoes', 60.00, 'Clothing', 100),
(18, 'Hat', 20.00, 'Accessories', 50),
(19, 'Socks', 10.00, 'Clothing', 200),
(20, 'T-Shirt', 25.00, 'Clothing', 150),
(21, 'Lamp', 60.00, 'Furniture', 40),
(22, 'Coffee Table', 100.00, 'Furniture', 35),
(23, 'Book', 15.00, 'Stationery', 250),
(24, 'Rug', 90.00, 'Furniture', 60),
(25, 'Cup', 5.00, 'Accessories', 500),
(26, 'Bag', 25.00, 'Accessories', 300),
(27, 'Couch', 450.00, 'Furniture', 15),
(28, 'Fridge', 600.00, 'Electronics', 20),
(29, 'Stove', 500.00, 'Electronics', 15),
(30, 'Microwave', 120.00, 'Electronics', 25),
(31, 'Air Conditioner', 350.00, 'Electronics', 10),
(32, 'Washing Machine', 450.00, 'Electronics', 15),
(33, 'Dryer', 400.00, 'Electronics', 10),
(34, 'Hair Dryer', 30.00, 'Accessories', 100),
(35, 'Iron', 40.00, 'Electronics', 50),
(36, 'Coffee Maker', 50.00, 'Electronics', 60),
(37, 'Blender', 35.00, 'Electronics', 40),
(38, 'Juicer', 55.00, 'Electronics', 30),
(39, 'Toaster', 40.00, 'Electronics', 70),
(40, 'Dishwasher', 500.00, 'Electronics', 20);

=============================
 Easy-Level Tasks (10)
================================================
--1 Define and explain the purpose of BULK INSERT in SQL Server.

BULK INSERT — bu SQL Server da tashqi fayldan (odatda .txt, .csv, yoki
boshqa delimiterli fayl) ma’lumotlarni jadvalga tez va samarali yuklash
uchun ishlatiladigan Transact-SQL (T-SQL) buyrug‘idir.
--Misol 
----------------------------------
BULK INSERT Employees
FROM 'C:\data\employees.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
)
-----------------------------------
--2 List four file formats that can be imported into SQL Server.

1. CSV (Comma-Separated Values)
Eng keng tarqalgan format.
2. TXT (Plain Text)
Har qanday delimiter (masalan: tab, |, ;) bilan yozilgan fayl.
3. XML (eXtensible Markup Language)
Strukturaviy ma’lumotlar uchun ishlatiladi.
4. JSON (JavaScript Object Notation)
Engil, tuzilmali format.

---------------------------------------------------------------------------------
--3 Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
create table Products (ProductID int primary key,ProductName varchar(50),Price decimal(10,2))
select * from Products 

-----------------------------------------------------------

--4 Insert three records into the Products table using INSERT INTO.
insert into Products values (1,'kitob',1000),(2,'daftar',1500),(3,'ruchka',2000)

----------------------------------------------------------

--5 Explain the difference between NULL and NOT NULL with examples.
In SQL, NULL and NOT NULL define whether a column can or cannot contain missing (unknown or empty) values.

NULL – No Value (Missing or Unknown)
A column that is NULL can be left empty.
Misol:
CREATE TABLE Students (
    ID INT,
    Name VARCHAR(100),
    Email VARCHAR(100) NULL  -- Email may be empty
);

NOT NULL – Must Have a Value
A column with NOT NULL must always have a value.\
MIsol:
CREATE TABLE Employees (
    ID INT,
    Name VARCHAR(100) NOT NULL,  -- Name is required
    Department VARCHAR(50)
);
------------------------------------------------------------------------
--6 Add a UNIQUE constraint to the ProductName column in the Products table.

alter table Products 
add constraint UK_ProductName unique(ProductName)
 
 ------------------------------------------
 --7 Write a comment in a SQL query explaining its purpose.

-- UNIQUE key is a constraint that ensures all values in a column (or combination of columns)
--re different — no duplicates allowed.

-----------------------------------------------
--8 Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
 create table Categories (CategoryID int primary key ,CategoryName varchar(50) unique )

 ---------------------------------------------
 --9 Explain the purpose of the IDENTITY column in SQL Server.

 The IDENTITY column in SQL Server is used to automatically generate unique numbers for a column —
 typically used for primary keys.

 Misol;
 CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50)
);
=====================================================================================================================

Medium-Level Tasks (10)

=======================================

--10 Use BULK INSERT to import data from a text file into the Products table.

BULK INSERT Products
FROM 'C:\Users\Home\Downloads\Telegram Desktop\HR(2).txt'
WITH (
    FIELDTERMINATOR = ',',     
    ROWTERMINATOR = '\n',      
    FIRSTROW = 2               
);

--11 Create a FOREIGN KEY in the Products table that references the Categories table.

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

--select * from Products 
--drop table Products 

--12 Explain the differences between PRIMARY KEY and UNIQUE KEY with examples.

The PRIMARY KEY and UNIQUE KEY constraints in SQL are both used to enforce uniqueness in a table, 
but they have some key differences in behavior and usage.

PRIMARY KEY-Ensures that each value in the column(s) is unique and NOT NULL.
A table can have only one primary key.
It is often used to identify each record uniquely in the table.

example:CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

UNIQUE KEY-Also ensures that all values in a column (or combination of columns) are unique.
But unlike PRIMARY KEY, UNIQUE columns can contain NULLs (depending on the DBMS).
A table can have multiple UNIQUE keys.

EXAMPLE:CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20) UNIQUE
);

--13 Add a CHECK constraint to the Products table ensuring Price > 0.

select * from Products 

alter table Products 
add constraint ch_price check( price > 0 )


--14 Modify the Products table to add a column Stock (INT, NOT NULL).

alter table Products 
add Stock int not null

--15 Use the ISNULL function to replace NULL values in a column with a default value.
isnull(Price,1000)

--16 Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.

Foreign key-A FOREIGN KEY constraint is used to enforce referential integrity 
between two tables in a relational database. It ensures that the value in a column (or group of columns)
in one table matches the value in a column of another table (usually the primary key of the referenced table).

example:
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


====================================================================================

Hard-Level Tasks (10)

====================================================================================

--17 Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.

create table Cuctomers (
	CustomerID int,
	Name varchar(50),
	Age int check(Age >= 18)
)

--18 Create a table with an IDENTITY column starting at 100 and incrementing by 10.

create table orders (OrderID int identity(100,10),
	name varchar(50)
)

drop table orders 

--19 Write a query to create a composite PRIMARY KEY in a new table OrderDetails.

create table Orderdetails (OrderID int primary key,
	name varchar(50)
)

--20 Explain with examples the use of COALESCE and ISNULL functions for handling NULL values.
Both COALESCE and ISNULL are used to handle NULL values 
in SQL by providing a default replacement, but they have some differences in
behavior and usage depending on the SQL dialect.

SELECT 
    ProductName,
    ISNULL(Description, 'No description') AS Description
FROM Products;

SELECT 
    ProductName,
    COALESCE(Description, ShortDescription, 'No info available') AS Description
FROM Products;

--21 Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.

create table Employees (EmpID int primary key, 
	email varchar(200) unique 
);

--22 Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
 create table Orders (
	OrderID int primary key,
	OrderDate date,
	CustomerID int,
	foreign key (CustomerID)
		references Customers(CustomerID)
		on update cascade 
		on delete cascade 
);
 
select * from orders
 

 =============================================================================================================
 
 
 )
















































































































