--use sql_modul2_homeworks
--go

--drop table Departments

--Lesson 2: DDL and DML Commands
--1. Create Employees Table
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
-------------------------------------------------------------------------------------------------
---------3. Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
--4. Insert 40 Rows into Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'Human Resources'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Finance'),
(6, 'Legal'),
(7, 'Operations'),
(8, 'Research & Development'),
(9, 'Customer Support'),
(10, 'Procurement'),
(11, 'Supply Chain'),
(12, 'Logistics'),
(13, 'Design'),
(14, 'Product Management'),
(15, 'Public Relations'),
(16, 'Business Development'),
(17, 'Quality Assurance'),
(18, 'Data Analytics'),
(19, 'Software Engineering'),
(20, 'Compliance'),
(21, 'Audit'),
(22, 'Product Design'),
(23, 'Health & Safety'),
(24, 'Training & Development'),
(25, 'Accounting'),
(26, 'IT Security'),
(27, 'Market Research'),
(28, 'Customer Success'),
(29, 'Talent Acquisition'),
(30, 'Communications'),
(31, 'Sales Support'),
(32, 'Business Intelligence'),
(33, 'Project Management'),
(34, 'Legal Affairs'),
(35, 'Creative Services'),
(36, 'Information Systems'),
(37, 'Corporate Strategy'),
(38, 'Change Management'),
(39, 'Investor Relations'),
(40, 'Employee Relations');
--------------------------------------------------------------------
go
drop table employees 

Basic-Level Tasks (10)--------------------------------------------------------------------------------------
--1
create table Employees (EmpId int,Name varchar(50),Salary decimal(10,2))
--2
insert into Employees values(1,'George',1000)
insert into Employees values(2,'John',2000)
insert into Employees values(3,'Jim',3000)
insert into Employees values(4,'Jerry',4000)
--3
update employees 
set salary = 1500
where EmpId = 1 

select * from employees
--4
delete from employees 
where EmpId = 2
--5
DELETE — faqat ma’lumotlarni o‘chiradi, jadval o‘zgarishsiz qoladi
TRUNCATE — jadvaldagi barcha ma’lumotlarni o‘chiradi, lekin strukturani saqlaydi
DROP — jadvalni butunlay o‘chiradi, ma’lumot ham, strukturasi ham yo‘qoladi
--6
alter table employees 
alter column Name varchar(100)
--7
alter table employees 
add Department varchar(50) 
--8
alter table employees 
alter column salary float 
select * from employees 
--9
drop table Departments
create table Departments (DepartmentID int primary key,DepartmentName varchar(50))
--10
truncate table employees 

select * from Departments
------------------------------------------------------------------------------------------------------
Intermediate-Level Tasks (6)

-----------------------------
select * from Employees 
select * from Departments
use sql_modul2_homeworks

alter table employees 
drop column department 

drop table employees 
drop table departments 

alter table departments
drop constraint [PK__Departme__B2079BCD7ED2EF2B]

--11
insert into departments (DepartmentID)
select top 5 DepartmentID from employees 

select * from departments 
select * from employees 

--12
update employees 
set Department = 'Management' 
where salary > 5000

--13
truncate table employees 
--14
alter table employees 
drop column DepartmentID

--15
EXEC sp_rename 'Employees', 'StaffMembers';

select * from StaffMembers

--16
drop table Departments 

=====================================================================================================================

Advanced-Level Tasks (9)
========================
--17
drop table Products 
create table Products (
	ProductID int primary key,
	ProductName varchar(50),
	Category varchar(50),
	Price decimal(10,2)
)
insert into Products values (1,'kitob','cans',10000),
	(2,'daftar','cans',3000),
	(3,'ruchka','cans',2000),
	(4,'qalam','cans',1000),
	(5,'chigich','cans',4000)


select * from Products 

alter table Products 
drop constraint [PK__Products__B40CC6EDE213C7B2]

alter table Orders 
drop constraint [FK__Orders__ProductI__3C69FB99]


--18

alter table Products 
add constraint chk_price check (price > 0)

select * from Products 

--19
alter table products 
add StockQuantity int default (50)


--20
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

--21
insert into Products values (6, 'Mouse',  'Accessories', 1200,10),
	(7, 'Chair',  'Furniture', 8000,20),
	(8, 'Desk',  'Furniture', 7500,30),
	(9, 'Pen',  'Stationery', 3000,40),
	(10, 'Notebook',  'Stationery', 5000,50)

select * from products 

--22
select * into Products_Backup
from Products


select * from Products_Backup

--23
exec sp_rename 'Products', 'Inventory'

--24 
alter table Inventory 
--drop constraint chk_price
alter column Price float 

select * from Inventory 

--25
alter table Inventory 
add ProductCode int identity(1000,5)

-=============================================================================================================



















































	









































