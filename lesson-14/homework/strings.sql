-- 1. Split Name by comma into Name and Surname
SELECT 
  LEFT(Name, CHARINDEX(',', Name) - 1) AS Name,
  LTRIM(RIGHT(Name, LEN(Name) - CHARINDEX(',', Name))) AS Surname
FROM TestMultipleColumns;

-- 2. Find strings containing %
SELECT *
FROM TestPercent
WHERE StringColumn LIKE '%\%%' ESCAPE '\';

-- 3. Split string based on dot
SELECT 
  value AS SplitPart
FROM Splitter
CROSS APPLY STRING_SPLIT(StringColumn, '.');

-- 4. Replace all digits with 'X'
SELECT 
  TRANSLATE('1234ABC123456XYZ1234567890ADS', '0123456789', 'XXXXXXXXXX') AS MaskedString;

-- 5. Rows with more than two dots
SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;

-- 6. Count spaces in a string
SELECT LEN(StringColumn) - LEN(REPLACE(StringColumn, ' ', '')) AS SpaceCount
FROM CountSpaces;

-- 7. Employees earning more than managers
SELECT e.EmployeeID, e.FirstName, e.Salary
FROM Employee e
JOIN Employee m ON e.ManagerID = m.EmployeeID
WHERE e.Salary > m.Salary;

-- 8. Employees with 10–15 years of service
SELECT EmployeeID, FirstName, LastName, HireDate,
  DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsOfService
FROM Employees
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 10 AND 14;

-- 9. Separate integers and characters
SELECT 
  LEFT(MixedCol, PATINDEX('%[^0-9]%', MixedCol + 'X') - 1) AS IntegerPart,
  STUFF(MixedCol, 1, PATINDEX('%[^0-9]%', MixedCol + 'X') - 1, '') AS CharacterPart
FROM (SELECT 'rtcfvty34redt' AS MixedCol) t;

-- 10. Dates with higher temperature than previous day
SELECT w1.Id
FROM weather w1
JOIN weather w2 ON DATEDIFF(DAY, w2.Date, w1.Date) = 1
WHERE w1.Temperature > w2.Temperature;

-- 11. First login date per player
SELECT PlayerID, MIN(LoginDate) AS FirstLogin
FROM Activity
GROUP BY PlayerID;

-- 12. Third item from list
SELECT value
FROM STRING_SPLIT('apple,banana,cherry,grape', ',')
ORDER BY (SELECT NULL)
OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;

-- 13. Create table from characters of string
SELECT value AS Char
FROM STRING_SPLIT(REPLACE('sdgfhsdgfhs@121313131', '', ''), '');

-- 14. Join p1 and p2, replace 0 with p2.code
SELECT p1.id, 
  CASE WHEN p1.code = 0 THEN p2.code ELSE p1.code END AS FinalCode
FROM p1
JOIN p2 ON p1.id = p2.id;

-- 15. Determine employment stage
SELECT EmployeeID, HIRE_DATE,
  CASE 
    WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
    WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
    WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 6 AND 10 THEN 'Mid-Level'
    WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 11 AND 20 THEN 'Senior'
    ELSE 'Veteran'
  END AS EmploymentStage
FROM Employees;

-- 16. Extract starting integer from string
SELECT LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'X') - 1) AS StartInteger
FROM GetIntegers;

-- 17. Swap first two values in comma-separated string
SELECT 
  CONCAT(p2.value, ',', p1.value, ',', p3.value) AS Swapped
FROM MultipleVals
CROSS APPLY (SELECT value FROM STRING_SPLIT(StringColumn, ',') OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY) p1
CROSS APPLY (SELECT value FROM STRING_SPLIT(StringColumn, ',') OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY) p2
CROSS APPLY (SELECT value FROM STRING_SPLIT(StringColumn, ',') OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY) p3;

-- 18. First device logged in for each player
SELECT PlayerID, MIN(LoginDate) AS FirstLogin, Device
FROM Activity A
WHERE NOT EXISTS (
  SELECT 1 FROM Activity B
  WHERE A.PlayerID = B.PlayerID AND B.LoginDate < A.LoginDate
)
GROUP BY PlayerID, Device;

-- 19. Week-on-week % sales
WITH WeeklySales AS (
  SELECT Area, DATEPART(week, Date) AS WeekNum, SUM(Sales) AS TotalSales
  FROM WeekPercentagePuzzle
  GROUP BY Area, DATEPART(week, Date)
),
DailySales AS (
  SELECT Area, Date, DATEPART(week, Date) AS WeekNum, Sales
  FROM WeekPercentagePuzzle
)
SELECT d.Area, d.Date, 
  ROUND(CAST(d.Sales AS FLOAT) / ws.TotalSales * 100, 2) AS Percentage
FROM DailySales d
JOIN WeeklySales ws ON d.Area = ws.Area AND d.WeekNum = ws.WeekNum;
