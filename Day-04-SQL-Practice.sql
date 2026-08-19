--Departments

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES
(101, 'IT', 'Mumbai'),
(102, 'HR', 'Pune'),
(103, 'Finance', 'Nashik'),
(104, 'Marketing', 'Mumbai'),
(105, 'Sales', 'Pune');

--Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, JoiningDate)
VALUES
(1, 'Amit', 101, 65000, '2023-01-15'),
(2, 'Priya', 102, 55000, '2022-06-20'),
(3, 'Rahul', 101, 75000, '2021-08-10'),
(4, 'Sneha', 103, 60000, '2023-03-12'),
(5, 'Neha', 102, 70000, '2020-11-05'),
(6, 'Rohan', 104, 50000, '2024-01-18'),
(7, 'Anjali', 101, 85000, '2019-07-25'),
(8, 'Vikas', 105, 72000, '2022-09-14'),
(9, 'Pooja', 103, 68000, '2021-04-30'),
(10, 'Karan', 105, 58000, '2024-02-10'),
(11, 'Aisha', 104, 62000, '2023-11-01'),
(12, 'Sahil', 101, 55000, '2024-05-15');

SELECT * FROM Departments;

SELECT * FROM Employees;

--Day 4 — SQL JOIN Practice
--1. INNER JOIN — Easy

--Display the employee name and department name for every employee.
Select e.Name,d.DepartmentName
from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID

--2. INNER JOIN + Salary

--Display:

--Employee Name
--Department Name
--Salary
--for employees whose salary is greater than ₹60,000.
Select e.Name,d.DepartmentName, e.Salary
from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID
where e.Salary>60000

--3. INNER JOIN + WHERE

--Find all employees who work in the IT department.

--Display:

--Name
--Salary
--Department Name
Select e.Name,e.Salary,d.DepartmentName
from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID
where DepartmentName='IT';

--4. INNER JOIN + ORDER BY

--Display every employee along with their department name.

--Sort employees by salary from highest to lowest.

Select e.Name, d.DepartmentName, e.Salary
from Employees e
inner join Departments d
on e.DepartmentId=d.DepartmentId
order by e.Salary desc

--5. JOIN + GROUP BY

--Find the number of employees in each department.

--Display:

--Department Name
--Total Employees

select d.DepartmentName,count(*) as Total_Employees
from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID
group by DepartmentName

--6. JOIN + AVG

--Find the average salary of employees in each department.

--Display:

--Department Name
--Average Salary

select d.DepartmentName,avg(e.Salary) as avg_salary
from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID
group by DepartmentName
--7. JOIN + MAX

--Find the highest salary in each department.

--Display:

--Department Name
--Highest Salary
select d.DepartmentName, max(e.Salary) as MAX_Salary
from Departments d
inner join Employees e
on d.DepartmentID=e.DepartmentID
group by DepartmentName

--8. JOIN + SUM

--Find the total salary paid by each department.
--Display:
--Department Name
--Total Salary

--Sort by total salary from highest to lowest.

Select d.DepartmentName, sum(e.Salary) as Total_Salary
from Departments d
inner join Employees e
on d.DepartmentID=e.DepartmentID
group by d.DepartmentName
order by Total_Salary desc


--9. JOIN + GROUP BY + HAVING
--Find departments having more than 2 employees.
--Display:
--Department Name
--Employee Count

Select d.DepartmentName, count(*) as Total_Employees
from Departments d
inner join Employees e
on d.DepartmentID=e.DepartmentID
group by d.DepartmentName
having count(*)>2;

--10. JOIN + HAVING ⭐

--Find departments where the average salary is greater than ₹65,000.

--Display:
--Department Name
--Average Salary
select d.DepartmentName, avg(e.Salary) as Avg_Salary
from Departments d
inner join Employees e
on d.DepartmentId=e.DepartmentID
group by d.DepartmentName
having avg(e.Salary)>65000;

--LEFT JOIN Practice

--11. LEFT JOIN
--Display all departments and their employees.
--Even if a department has no employees, that department should still appear.
--Display:
--Department Name
--Employee Name
select d.DepartmentName, e.Name
from Departments d
left join Employees e
on d.DepartmentID=e.DepartmentID

--12. LEFT JOIN + COUNT ⭐

--Find the number of employees in every department, including departments that have zero employees.
--Display:
--Department Name
--Employee Count
select d.DepartmentName, count(e.EmployeeID) as Total_Employees
from Departments d
left join Employees e
on d.DepartmentID=e.DepartmentID
group by d.DepartmentName;

--13. Find Departments With No Employees ⭐
--Display the departments that currently have no employees.
--Hint:
--LEFT JOIN
--and check for NULL.
--Challenge Questions 🔥
select d.DepartmentName , count(e.EmployeeID) as Total_Employees
from Departments d
left join Employees e
on d.DepartmentID=e.DepartmentID
group by DepartmentName
having COUNT(e.EmployeeID) = 0;

--14. Highest Paid Employee
--Find the employee with the highest salary in the company.
--Display:
--Employee Name
--Department Name
--Salary
select e.Name, d.DepartmentName, e.Salary
from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID
where e.Salary=(select max(Salary) from Employees);

--15. Highest Salary Per Department
--Find the highest-paid employee in each department.
--Display:
--Department Name
--Employee Name
--Salary

SELECT d.DepartmentName,
       e.Name AS EmployeeName,
       e.Salary
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
    SELECT MAX(e2.Salary)
    FROM Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
);

--16. Above Department Average 🔥
--Find employees whose salary is greater than the average salary of their own department.
--Display:
--Employee Name
--Department Name
--Salary
select e.Name, d.DepartmentName , e.Salary
from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID
where e.Salary > (Select avg(e2.Salary) 
                from Employees e2
                where e2.DepartmentID=e.DepartmentID); 

--17. Department Salary Analysis 🔥
--Display each department along with:
--Department Name
--Number of Employees
--Minimum Salary
--Maximum Salary
--Average Salary
--Total Salary
select d.DepartmentName, count(e.EmployeeID) as Total_Employees, min(e.Salary) as min_salary, max(e.Salary) as max_salary, avg(e.Salary) as Avg_Salary, sum(e.Salary) as Total_Salary
from Departments d
left join Employees e
on d.DepartmentID=e.DepartmentID
group by d.DepartmentName;

--18. Interview Challenge 🔥🔥
--Find the second-highest salary in each department.
--Display:

--Department Name
--Employee Name
--Salary
select DepartmentName, Name, Salary
from(
    select d.DepartmentName,e.Name,e.Salary,
        DENSE_RANK() over(
            partition by d.DepartmentID
            order by e.Salary DESC
        ) AS SalaryRank
    from Employees e
    inner join Departments d
         on e.DepartmentID=d.DepartmentID
) AS RankedEmployees
where SalaryRank=2;

