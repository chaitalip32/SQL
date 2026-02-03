create database product_sales;
use product_sales;

create table Products(
product_id int,
product_name varchar(100),
category varchar(50),
unit_price decimal(10,2)
);

alter table Products modify column product_id int primary key;

insert into Products(product_id, product_name, category, unit_price) values
(101, 'Laptop', 'Electronics', 500.00),
(102,'Smartphone','Electronics',300.00),
(103,'Headphones','Electronics',30.00),
(104,'Keyboard','Electronics',20.00),
(105,'Mouse','Electronics',15.00);

create table Sales(
sales_id int primary key,
product_id int,
quantity_sold int,
sale_date date,
total_price decimal(10,2),
foreign key (product_id) references Products(product_id)
);

insert into sales(sales_id, product_id,quantity_sold,sale_date,total_price) values
(1,101,5,'2024-01-01',2500.00),
(2,102,3,'2024-01-02',900.00),
(3,103,2,'2024-01-02',60.00),
(4,104,4,'2024-01-03',80.00),
(5,105,6,'2024-01-03',90.00);

select * from Sales;

select product_name, unit_price from Products;

alter table sales Rename column sales_id to sale_id; 
select sale_id, sale_date from Sales;

select * from Sales where total_price > 100;

select * from Products where category= 'Electronics';

select sale_id, total_price from Sales where sale_date='2024-01-03';

select product_id, product_name from Products where unit_price > 100;
select sum(total_price) as Total_revenue from sales;
select avg(unit_price) as avg_price from Products;
select sum(quantity_sold) as Total_quantity from sales;

select sale_date ,count(*) from sales
group by sale_date
order by sale_date desc;

select sale_date, count(*) from Sales
group by sale_date 
order by sale_date;

select  product_name, max(unit_price) 
from Products;

select product_name, unit_price from Products
order by unit_price desc;

select round(sum(total_price),2) as total_salesv from sales;

select avg(total_price) as avg_total_price from sales;

select sale_id, date_format(sale_date, '%Y-%m-%d') as formated_date from sales;

select sum(sales.total_price) as total_revenue from sales 
join Products 
on sales.product_id=Products.product_id
where category="Electronics";

select product_name, unit_price from Products 
where unit_price between 20 and 600;

select product_name, category from Products
order by category asc;

select sum(sales.quantity_sold) Total_quantity_sold
from Sales 
JOIN Products
on sales.product_id=products.product_id
where category='Electronics';