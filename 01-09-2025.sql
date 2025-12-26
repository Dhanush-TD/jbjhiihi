CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Products
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Customers
INSERT INTO customers (name, email, city) VALUES
('Alice', 'alice@example.com', 'Delhi'),
('Bob', 'bob@example.com', 'Mumbai'),
('Charlie', 'charlie@example.com', 'Bangalore'),
('Diana', 'diana@example.com', 'Delhi'),
('Ethan', 'ethan@example.com', 'Chennai');

-- Products
INSERT INTO products (name, category, price) VALUES
('Laptop', 'Electronics', 60000),
('Phone', 'Electronics', 30000),
('Headphones', 'Accessories', 2000),
('Notebook', 'Stationery', 50),
('Pen', 'Stationery', 10);


-- Orders
INSERT INTO orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2025-09-01', 1),
(2, 2, '2025-09-01', 2),
(1, 3, '2025-09-02', 3),
(3, 4, '2025-09-03', 10),
(4, 5, '2025-09-04', 20),
(2, 1, '2025-09-05', 1),
(5, 2, '2025-09-06', 1),
(1, 5, '2025-09-06', 5),
(3, 2, '2025-09-07', 2),
(4, 3, '2025-09-07', 1);
show tables;
desc customers;
desc  orders;
desc products;
select count(order_id) as total_orders from orders;
select avg(price) as average from products;
select min(price) as min_price , max(price) as max_price from products;
select sum(quantity) as total_quantity from orders;
select customer_id, count(quantity) AS order_placed from orders group by customer_id;
select product_id,count(quantity) as total_quan from orders group by product_id;
select * from orders order by order_id limit 5;
select * from orders order by order_date limit 3;
select name,price from products order by price limit 2;
SELECT * FROM customers  
inner JOIN orders 
  ON customers.customer_id = orders.customer_id;
  
 SELECT *
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id;
 SELECT *
FROM customers c
RIGHT JOIN orders o
  ON c.customer_id = o.customer_id;





