create database emp;
use emp;
drop table employee;
show tables;

select dept_name,max(salary) as max_salary from employee
group by dept_name;

select e.* , max(salary) over(partition by dept_name)  as max_salary
from employee e;

select e.*, row_number() over(partition by dept_name) as RN
from employee e;

select e.*, row_number() over(partition by dept_name) as RN
from employee e;

truncate table employee;
rollback;

select * from employee;

INSERT INTO employee (emp_id, emp_name, dept_name, salary) VALUES
(105, 'Aarav', 'HR', 45000),
(12, 'Bhavya', 'HR', 52000),
(78, 'Charan', 'HR', 52000),
(301, 'Diya', 'HR', 60000),
(56, 'Esha', 'HR', 68000),

(210, 'Farhan', 'IT', 55000),
(89, 'Gaurav', 'IT', 62000),
(450, 'Harish', 'IT', 62000),
(17, 'Isha', 'IT', 75000),
(999, 'Jay', 'IT', 90000),

(63, 'Karan', 'Finance', 48000),
(402, 'Leena', 'Finance', 53000),
(9, 'Manav', 'Finance', 53000),
(188, 'Neha', 'Finance', 70000),
(720, 'Omkar', 'Finance', 82000),

(34, 'Pooja', 'Sales', 40000),
(501, 'Quasar', 'Sales', 45000),
(115, 'Ritika', 'Sales', 50000),
(77, 'Sahil', 'Sales', 65000),
(640, 'Tanvi', 'Sales', 72000),

(92, 'Uday', 'Marketing', 46000),
(333, 'Vaishnavi', 'Marketing', 46000),
(18, 'Wasim', 'Marketing', 54000),
(808, 'Xavier', 'Marketing', 60000),
(271, 'Yamini', 'Marketing', 75000),

(66, 'Zara', 'IT', 88000),
(142, 'Amit', 'HR', 47000),
(590, 'Babita', 'Finance', 76000),
(404, 'Chetan', 'Sales', 68000),
(901, 'Deepak', 'Marketing', 82000);

select e.*, row_number() over(partition by dept_name order by emp_id) as RN
from employee e;

select e.*, 
rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over(partition by dept_name order by salary desc) as dense_rnk,
row_number() over(partition by dept_name order by salary desc) as rn, 
percent_rank() over(partition by dept_name order by salary desc) as per_rn 
from employee e;

select e.*, first_value(salary) over(order by salary desc) as	 "first value"
from employee e; 


select e.*, last_value(salary) over(order by salary) as "last value"
from employee e; 

select e.*,
dense_rank() over(partition by dept_name order by salary desc) as dense_rnk,
lag(salary) over(partition by dept_name order by emp_id) as previous_emp_salary,
case when e.salary>lag(salary) over(partition by dept_name order by emp_id) then 'Higher than previous salary'
	 when e.salary<lag(salary) over(partition by dept_name order by emp_id) then 'Less than previous salary'
     when e.salary= lag(salary) over(partition by dept_name order by emp_id) then 'Same as previous salary'
end sal_range
from employee e;