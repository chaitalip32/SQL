select * from Employees;

--1. WHERE + ORDER BY
--Find the names and salaries of employees who work in the IT department and have a salary greater than ₹60,000. Display the highest salary first.
SELECT Name, Salary, Department
from Employees 
Where Department='IT' and Salary>60000
order by Salary DESC;

--2. COUNT + GROUP BY
--Find the number of employees in each department.
select Department, count(*) as Total_Employees
from Employees
GROUP BY Department;

--3. AVG + GROUP BY
--Find the average salary of employees in each city.
select City, avg(Salary) as Average_Salary
from Employees
group by City;

--4. MAX + GROUP BY
--Find the highest salary in each department.
select Department,max(Salary) as Max_Salary
from Employees
group by Department;

--5. TOP / LIMIT + ORDER BY
--Find the top 3 highest-paid employees, displaying their name, department, and salary.
select TOP 3 Name,Department,Salary
from Employees 
order by Salary DESC;