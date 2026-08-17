--select * from Employees;
--Day 3 — SQL Practice Questions

--1. DISTINCT
--Find all the unique departments in the Employees table.
select distinct Department from Employees;

--2. AVG + GROUP BY
--Find the average salary of employees in each department. Display the department and average salary.
select Department, avg(Salary) as Average_Salary
from Employees
group by Department;

--3. SUM + GROUP BY
--Find the total salary paid by each department. Display the department and total salary.
select Department, Sum(Salary) As Total_Salary
from Employees
group by Department;

--4. MIN + MAX
--Find the minimum and maximum salary in each department.
Select Department, min(Salary) as minimum_salary, max(Salary) as mximum_saary
from Employees
group by Department;

--5. GROUP BY + HAVING
--Find departments that have more than 3 employees.
select Department, count(*) as Total_employees
from Employees
group by Department
having count(*) > 3;

--6. AVG + HAVING
--Find departments where the average salary is greater than ₹60,000.
select Department, avg(Salary)
from Employees
group by Department
having avg(Salary) > 60000;

--7. COUNT + WHERE + GROUP BY
--Find the number of employees in each department who earn more than ₹50,000.
select Department, count(*) as Total_Employees
from Employees
where Salary>50000
group by Department;

--8. Salary Range
--Find the names, departments, and salaries of employees whose salary is between ₹50,000 and ₹80,000, 
--but only from the IT or HR departments.

--Sort the result by salary from highest to lowest.
select Name, Department, Salary 
from Employees
where Salary between 50000 AND 80000
AND Department in ('IT','HR')
order by Salary DESC;

--9. Multiple Conditions
--Find employees who:

--work in the IT department
--earn more than ₹60,000
--and have an employee name starting with 'A'
select Name, Salary
from Employees
where Department='IT' 
AND Salary>60000
AND Name like 'A%';

--10. Challenge — GROUP BY + HAVING ⭐
--Find the departments where:

--the number of employees is at least 2
--and the highest salary in that department is greater than ₹70,000

--Display:

--Department
--Number of Employees
--Highest Salary

--Sort by highest salary in descending order.
select Department, Count(*) as Total_Employees,MAX(Salary) as Highest_Salary
from Employees
group by Department
having MAX(Salary)>70000
AND count(*)>=2
order by MAX(Salary) desc;