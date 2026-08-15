/*
===========================================================
SQL PRACTICE - DAY 01
===========================================================

Tables Used:

Employees
---------
EmployeeID
Name
DepartmentID
Salary
JoiningDate

Departments
-----------
DepartmentID
DepartmentName

Projects
--------
ProjectID
ProjectName
EmployeeID
Budget

===========================================================
*/


/*
-----------------------------------------------------------
QUESTION 1
-----------------------------------------------------------
Find all employees whose salary is between 50,000 and 80,000.

Expected Output:
Name | Salary
-----------------------------------------------------------
*/

SELECT 
    Name,
    Salary
FROM Employees
WHERE Salary BETWEEN 50000 AND 80000;


/*
-----------------------------------------------------------
QUESTION 2
-----------------------------------------------------------
Find the 5 highest-paid employees.

Expected Output:
Name | Salary
-----------------------------------------------------------
*/

SELECT TOP 5
    Name,
    Salary
FROM Employees
ORDER BY Salary DESC;


/*
-----------------------------------------------------------
QUESTION 3
-----------------------------------------------------------
Find the maximum salary in each department.

Expected Output:
DepartmentID | MaximumSalary
-----------------------------------------------------------
*/

SELECT
    DepartmentID,
    MAX(Salary) AS MaximumSalary
FROM Employees
GROUP BY DepartmentID;


/*
-----------------------------------------------------------
QUESTION 4
-----------------------------------------------------------
Display the names of all employees who work in the IT department.

Expected Output:
Name | DepartmentName
-----------------------------------------------------------
*/

SELECT
    e.Name,
    d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';


/*
-----------------------------------------------------------
QUESTION 5
-----------------------------------------------------------
Find departments where the average employee salary
is greater than 60,000.

Expected Output:
DepartmentID | DepartmentName | AverageSalary
-----------------------------------------------------------
*/

SELECT
    d.DepartmentID,
    d.DepartmentName,
    AVG(e.Salary) AS AverageSalary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
GROUP BY
    d.DepartmentID,
    d.DepartmentName
HAVING AVG(e.Salary) > 60000;
