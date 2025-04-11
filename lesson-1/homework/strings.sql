--go
EASY:----------------------------------------------------------------------------------------------------------



Question-1
A relational database is a type of database that organizes data into rows and columns,
which collectively form a table where the data points are related to each other.

Data is defined as raw facts or figures that have no meaning on their own but can be
processed to generate useful information.

A database is an organized collection of data that can be easily accessed, managed, and updated.

Table is a structure used to store data in a database. It organizes data into rows and columns,
similar to an Excel spreadsheet.

Question-2
SQL Server Database Engine
Analysis Services	
Reporting Services	
Integration Services	
Master Data Services	

Question-3 
	There are two possible modes: Windows Authentication mode and mixed mode. 
Windows Authentication mode enables Windows Authentication and disables 
SQL Server Authentication.
	Mixed mode enables both Windows Authentication
and SQL Server Authentication.

MEDIUM:--------------------------------------------------------------------------------------------------------------




Question-1 
create database SchoolDB 
Question-2 
create table Students (StudentId int primary key ,Name varchar(50), Age int)
Question-3 
SQL Server is the software that handles the database and the tables. 
SQL Server Management Studio is the interface between the user and the database. 
If you do an UPDATE statement in SSMS,this will communicate to SQL Server the 
required action on the database and tables.

HARD:-------------------------------------------------------------------------------------------------------
Question-1 

1. DQL (Data Query Language)
Used to retrieve data from a database.
Example:
SELECT * FROM Students;

2. DML (Data Manipulation Language)
Used to modify data in the database (insert, update, delete).
Examples:
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Ali', 16);
DELETE FROM Students WHERE StudentID = 1;

3. DDL (Data Definition Language)
Used to define or modify the database structure.
Examples:
ALTER TABLE Students ADD Grade CHAR(1);
DROP TABLE Students;

4. DCL (Data Control Language)
Used to control access to data (permissions).
Examples:
GRANT SELECT ON Students TO User1;

5. TCL (Transaction Control Language)
Used to manage transactions in a database.
Examples:
UPDATE Students SET Age = 18 WHERE StudentID = 2;


Question-2 
insert into Students values 
	(1,'John',12), 
	(2,'Jony',13), 
	(3,'George',14)

Question-3 
SchoolDB Ma'lumotlar Bazasi Zaxirasini Yaratish Bosqichlari------------------------------

SQL Server Management Studio (SSMS) dasturini ochamiz;

Object Explorer panelida Databases bo'limiga kiramiz:

SchoolDB nomli ma'lumotlar bazasiga o'ng tugmasini bosing → Tasks → Back Up... tanlaymiz:

Back Up Database oynasida:

Database qismida SchoolDB ni tanlaymiz:

Backup Type bo'limida Full tanlaymiz:

Destination bo'limida:

Standart manzilni qoldirishimiz mumkin;

BAJARILDI--------------------------------------------------------------------------------------


