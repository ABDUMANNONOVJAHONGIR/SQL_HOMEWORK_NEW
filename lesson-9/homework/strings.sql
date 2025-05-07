-- 🟢 Easy-Level Tasks

-- 1. All combinations of product and supplier names
SELECT p.ProductName, s.SupplierName 
FROM Products p 
CROSS JOIN Suppliers s;

-- 2. All combinations of departments and employees
SELECT d.DeptName, e.EmployeeName 
FROM Departments d 
CROSS JOIN Employees e;

-- 3. Combinations where supplier supplies the product
SELECT s.SupplierName, p.ProductName 
FROM Products p 
JOIN Suppliers s ON p.SupplierID = s.SupplierID;

-- 4. Customer names and their order IDs
SELECT c.CustomerName, o.OrderID 
FROM Orders o 
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 5. All combinations of students and courses
SELECT s.StudentName, c.CourseName 
FROM Students s 
CROSS JOIN Courses c;

-- 6. Product names and matching orders
SELECT p.ProductName, o.OrderID 
FROM Products p 
JOIN Orders o ON p.ProductID = o.ProductID;

-- 7. Employees with matching DepartmentID
SELECT e.EmployeeName, d.DeptName 
FROM Employees e 
JOIN Departments d ON e.DeptID = d.DeptID;

-- 8. Student names and enrolled course IDs
SELECT s.StudentName, e.CourseID 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID;

-- 9. Orders with matching payments
SELECT o.OrderID, p.PaymentID 
FROM Orders o 
JOIN Payments p ON o.OrderID = p.OrderID;

-- 10. Orders where product price > 100
SELECT o.OrderID, p.ProductName, p.Price 
FROM Orders o 
JOIN Products p ON o.ProductID = p.ProductID 
WHERE p.Price > 100;

-- 🟡 Medium-Level Tasks

-- 11. Employee and department names where IDs do not match
SELECT e.EmployeeName, d.DeptName 
FROM Employees e 
JOIN Departments d ON e.DeptID <> d.DeptID;

-- 12. Orders where ordered quantity > stock quantity
SELECT o.OrderID, p.ProductName, o.Quantity, p.Quantity AS Stock 
FROM Orders o 
JOIN Products p ON o.ProductID = p.ProductID 
WHERE o
