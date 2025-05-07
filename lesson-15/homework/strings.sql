-- 1. Find Employees with Minimum Salary
SELECT name, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- 2. Find Products Above Average Price
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 3. Find Employees in Sales Department
SELECT e.name
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE d.department_name = 'Sales';

-- 4. Find Customers with No Orders
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 5. Find Products with Max Price in Each Category
SELECT p.product_name, p.price, p.category_id
FROM products p
WHERE p.price = (SELECT MAX(price) FROM products WHERE category_id = p.category_id);

-- 6. Find Employees in Department with Highest Average Salary
SELECT e.name
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE e.salary = (SELECT MAX(avg_salary) FROM 
                  (SELECT AVG(salary) AS avg_salary FROM employees GROUP BY department_id) AS avg_salaries);

-- 7. Find Employees Earning Above Department Average
SELECT e.name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);

-- 8. Find Students with Highest Grade per Course
SELECT s.name, g.course_id, g.grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE g.grade = (SELECT MAX(grade) FROM grades WHERE course_id = g.course_id);

-- 9. Find Third-Highest Price per Category
SELECT product_name, price, category_id
FROM (
    SELECT product_name, price, category_id,
           DENSE_RANK() OVER (PARTITION BY category_id ORDER BY price DESC) AS rank
    FROM products
) AS ranked
WHERE rank = 3;

-- 10. Find Employees whose Salary is Between Company Average and Department Max Salary
SELECT e.name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees)
  AND e.salary < (SELECT MAX(salary) FROM employees WHERE department_id = e.department_id);
