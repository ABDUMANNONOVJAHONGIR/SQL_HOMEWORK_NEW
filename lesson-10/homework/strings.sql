-- 1. Employees with salary > 50000 and department names
SELECT e.EmployeeName, e.Salary, d.DeptName AS DepartmentName
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
WHERE e.Salary > 50000;

-- 2. Customers and orders from 2023
SELECT c.FirstName, c.LastName, o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2023;

-- 3. All employees and their departments (include unmatched)
SELECT e.EmployeeName, d.DeptName AS DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID;

-- 4. All suppliers and their products (include unmatched)
SELECT s.SupplierName, p.ProductName
FROM Suppliers s
LEFT JOIN Products p ON s.SupplierID = p.SupplierID;

-- 5. All orders and their payments (include unmatched both ways)
SELECT o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
FROM Orders o
FULL OUTER JOIN Payments p ON o.OrderID = p.OrderID;

-- 6. Employees and their managers
SELECT e.EmployeeName, m.EmployeeName AS ManagerName
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;

-- 7. Students enrolled in 'Math 101'
SELECT s.StudentName, c.CourseName
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Math 101';

-- 8. Customers with order quantity > 3
SELECT c.FirstName, c.LastName, o.Quantity
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.Quantity > 3;

-- 9. Employees in 'Human Resources'
SELECT e.EmployeeName, d.DeptName AS DepartmentName
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
WHERE d.DeptName = 'Human Resources';
