CREATE DATABASE order_management_db;

USE order_management_db;

CREATE TABLE ORDERS (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

CREATE TABLE ORDER_DETAILS (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    quantity INT,
    price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (order_id)
    REFERENCES ORDERS(order_id)
);

SHOW TABLES;

INSERT INTO ORDERS
(order_id, customer_id, order_date, total_amount)
VALUES
(101, 1, '2020-01-01', 500.00),
(102, 2, '2020-02-02', 600.00),
(103, 3, '2020-03-03', 900.00),
(104, 4, '2020-04-04', 400.00),
(105, 5, '2020-05-05', 1400.00);

INSERT INTO ORDER_DETAILS
(order_details_id, order_id, quantity, price, total_amount)
VALUES
(1, 101, 1, 500.00, 500.00),
(2, 102, 2, 300.00, 600.00),
(3, 103, 3, 300.00, 900.00),
(4, 104, 1, 400.00, 400.00),
(5, 105, 2, 700.00, 1400.00);

SELECT * FROM ORDERS;

SELECT * FROM ORDER_DETAILS;

DESC ORDERS;

DESC ORDER_DETAILS;

INSERT INTO ORDERS
(order_id, customer_id, order_date, total_amount)
VALUES
(106, 6, '2020-06-06', 800.00);

INSERT INTO ORDER_DETAILS
(order_details_id, order_id, quantity, price, total_amount)
VALUES
(6, 106, 2, 400.00, 800.00);

UPDATE ORDERS
SET total_amount = 550.00
WHERE order_id = 101;

UPDATE ORDER_DETAILS
SET quantity = 2,
    total_amount = 1000.00
WHERE order_details_id = 1;

UPDATE ORDERS
SET order_date = '2020-01-10'
WHERE order_id = 101;

SELECT *
FROM ORDERS
WHERE customer_id = 1;

SELECT *
FROM ORDERS
WHERE total_amount > 500;

SELECT *
FROM ORDERS
WHERE order_date
BETWEEN '2020-01-01' AND '2020-12-31';

SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    od.quantity,
    od.price,
    od.total_amount
FROM ORDERS o
JOIN ORDER_DETAILS od
ON o.order_id = od.order_id
ORDER BY o.customer_id;

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount AS order_total,
    od.order_details_id,
    od.quantity,
    od.price,
    od.total_amount AS detail_total
FROM ORDERS o
INNER JOIN ORDER_DETAILS od
ON o.order_id = od.order_id;

SELECT SUM(total_amount) AS total_order_amount
FROM ORDERS;

SELECT AVG(total_amount) AS average_order_amount
FROM ORDERS;

SELECT MAX(total_amount) AS highest_order_amount
FROM ORDERS;

SELECT MIN(total_amount) AS lowest_order_amount
FROM ORDERS;

SELECT COUNT(*) AS total_orders
FROM ORDERS;

SELECT
    customer_id,
    COUNT(order_id) AS number_of_orders,
    SUM(total_amount) AS total_amount
FROM ORDERS
GROUP BY customer_id;

DELETE FROM ORDER_DETAILS
WHERE order_id = 106;

DELETE FROM ORDERS
WHERE order_id = 106;

SELECT * FROM ORDERS;

SELECT * FROM ORDER_DETAILS;

SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    od.quantity,
    od.price,
    od.total_amount
FROM ORDERS o
INNER JOIN ORDER_DETAILS od
ON o.order_id = od.order_id
ORDER BY o.customer_id;