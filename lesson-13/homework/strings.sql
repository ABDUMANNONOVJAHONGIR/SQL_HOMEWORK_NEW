-- 1. Output "100-Steven King"
SELECT CONCAT(emp_id, '-', first_name, ' ', last_name) AS Result
FROM employees
WHERE emp_id = 100;

-- 2. Replace '124' with '999' in phone_number
UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999');

-- 3. First name & its length for names starting with A, J, or M
SELECT first_name AS Name,
       LENGTH(first_name) AS NameLength
FROM employees
WHERE first_name LIKE 'A%' OR first_name LIKE 'J%' OR first_name LIKE 'M%'
ORDER BY first_name;

-- 4. Total salary for each manager ID
SELECT manager_id, SUM(salary) AS TotalSalary
FROM employees
GROUP BY manager_id;

-- 5. Year and highest value from Max1, Max2, Max3 (TestMax)
SELECT year,
       GREATEST(Max1, Max2, Max3) AS MaxValue
FROM TestMax;

-- 6. Odd-numbered movies with non-boring description (Cinema)
SELECT *
FROM cinema
WHERE id % 2 = 1 AND description != 'boring';

-- 7. Sort by Id but place 0 at the end (SingleOrder)
SELECT *
FROM SingleOrder
ORDER BY CASE WHEN id = 0 THEN 1 ELSE 0 END, id;

-- 8. Select first non-null from multiple columns (Person)
SELECT COALESCE(col1, col2, col3, col4) AS FirstNonNull
FROM person;
-- 1. Split FullName into first, middle, last name (Students)
SELECT 
  SUBSTRING_INDEX(FullName, ' ', 1) AS FirstName,
  SUBSTRING_INDEX(SUBSTRING_INDEX(FullName, ' ', -2), ' ', 1) AS MiddleName,
  SUBSTRING_INDEX(FullName, ' ', -1) AS LastName
FROM Students;

-- 2. Customer with delivery to CA; show TX orders
SELECT * 
FROM Orders
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    WHERE delivery_state = 'California'
)
AND delivery_state = 'Texas';

-- 3. Group concat values (DMLTable)
SELECT GROUP_CONCAT(column_name SEPARATOR ', ') AS Concatenated
FROM DMLTable;

-- 4. Employees with 3+ 'a' in full name
SELECT *
FROM employees
WHERE LENGTH(CONCAT(first_name, last_name)) 
     - LENGTH(REPLACE(CONCAT(first_name, last_name), 'a', '')) >= 3;

-- 5. Total employees in each department + % with 3+ years
SELECT department_id,
       COUNT(*) AS TotalEmployees,
       ROUND(100.0 * SUM(CASE WHEN years_with_company > 3 THEN 1 ELSE 0 END) / COUNT(*), 2) AS PercentOver3Years
FROM employees
GROUP BY department_id;

-- 6. Most and least experienced Spaceman ID by job (Personal)
SELECT job_description,
       MIN(experience_years) AS LeastExperience,
       MAX(experience_years) AS MostExperience
FROM Personal
GROUP BY job_description;
-- 1. Separate uppercase, lowercase, numbers, and symbols from 'tf56sd#%OqH'
SELECT 
  REGEXP_REPLACE('tf56sd#%OqH', '[^A-Z]', '') AS UppercaseLetters,
  REGEXP_REPLACE('tf56sd#%OqH', '[^a-z]', '') AS LowercaseLetters,
  REGEXP_REPLACE('tf56sd#%OqH', '[^0-9]', '') AS Numbers,
  REGEXP_REPLACE('tf56sd#%OqH', '[a-zA-Z0-9]', '') AS OtherCharacters;

-- 2. Replace each row with sum of its value + previous rows (Students)
SELECT s1.id,
       (SELECT SUM(s2.value)
        FROM Students s2
        WHERE s2.id <= s1.id) AS CumulativeValue
FROM Students s1;

-- 3. Sum mathematical equations (Equations)
-- Assuming format like '3+5*2', use EVAL-like expression
-- Note: Only supported in SQL engines that support expression evaluation (e.g., SQL Server via dynamic SQL, or custom UDFs in MySQL/SQLite)
-- Example (MySQL workaround using prepared statements, otherwise needs external script):
SELECT id, equation, 
       CAST(SUBSTRING_INDEX(equation, '+', 1) AS UNSIGNED) +
       CAST(SUBSTRING_INDEX(equation, '+', -1) AS UNSIGNED) AS Result
FROM Equations;

-- 4. Students sharing the same birthday
SELECT s1.StudentID, s1.StudentName, s1.Birthday
FROM Student s1
JOIN (
    SELECT Birthday
    FROM Student
    GROUP BY Birthday
    HAVING COUNT(*) > 1
) dup
ON s1.Birthday = dup.Birthday;

-- 5. Aggregate scores per unique player pair (PlayerScores)
SELECT 
  LEAST(PlayerA, PlayerB) AS Player1,
  GREATEST(PlayerA, PlayerB) AS Player2,
  SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY LEAST(PlayerA, PlayerB), GREATEST(PlayerA, PlayerB);
