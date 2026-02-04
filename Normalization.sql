create database BOOKs;

CREATE TABLE book_orders (
    order_id INT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_address VARCHAR(255),
    book_isbn VARCHAR(20),
    book_title VARCHAR(200),
    book_author VARCHAR(100),
    book_price DECIMAL(10,2),
    order_date DATE,
    quantity INT,
    total_price DECIMAL(10,2)
);

select * from book_orders;

INSERT INTO book_orders VALUES
(1, 'John Smith', 'john@example.com', '123 Main St, Anytown',
 '978-0141439518', 'Pride and Prejudice', 'Jane Austen', 9.99,
 '2023-01-15', 1, 9.99),

(2, 'John Smith', 'john@example.com', '123 Main St, Anytown',
 '978-0451524935', '1984', 'George Orwell', 12.99,
 '2023-01-15', 2, 25.98),

(3, 'Mary Johnson', 'mary@example.com', '456 Oak Ave, Somewhere',
 '978-0061120084', 'To Kill a Mockingbird', 'Harper Lee', 14.99,
 '2023-01-20', 1, 14.99),

(4, 'Robert Brown', 'robert@example.com', '789 Pine Rd, Nowhere',
 '978-0141439518', 'Pride and Prejudice', 'Jane Austen', 9.99,
 '2023-01-25', 1, 9.99);

 -- 1 NF
 CREATE TABLE book_orders_1nf (
    order_id INT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_address VARCHAR(255),
    book_isbn VARCHAR(20),
    book_title VARCHAR(200),
    book_author VARCHAR(100),
    book_price DECIMAL(10,2),
    order_date DATE,
    quantity INT,
    total_price DECIMAL(10,2),
    primary key(order_id,book_isbn)
);

-- 2NF
create table orders_2nf(
    order_id INT primary key,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_address VARCHAR(255),
    order_date DATE,
);

create table books_2nf(
    book_isbn VARCHAR(20) primary key,
    book_title VARCHAR(200),
    book_author VARCHAR(100),
    book_price DECIMAL(10,2),
);

create table order_items(
    order_id INT,
    book_isbn VARCHAR(20),
    quantity INT,
    total_price DECIMAL(10,2),
    primary key(order_id,book_isbn),
    foreign key(order_id) references orders_2nf( order_id),
    foreign key(book_isbn) references books_2nf(book_isbn)
);


-- 3 NF
create table customers_3nf(
    customer_id int primary key,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_address VARCHAR(255),
)

create table orders_3nf(
    order_id int primary key,
    customer_id int, 
    order_date date,
    foreign key (customer_id) references customers_3nf(customer_id)
);

create table books_3nf(
    book_isbn VARCHAR(20) primary key,
    book_title VARCHAR(200),
    book_author VARCHAR(100),
    book_price DECIMAL(10,2),
);

create table  order_items_3nf(
    order_id INT,
    book_isbn varchar(20),
    quantity int,
    primary key (order_id,book_isbn),
    foreign key (order_id) references orders_3nf(order_id),
    foreign key (book_isbn) references books_3nf(book_isbn)
);