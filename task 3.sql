CREATE DATABASE SellerInventoryDB;

USE SellerInventoryDB;

CREATE TABLE Seller (
    Seller_ID INT PRIMARY KEY,
    Seller_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(200)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Seller_ID INT,
    Product_ID INT,
    Stock_Quantity INT NOT NULL,
    Stock_Status VARCHAR(20),
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);


INSERT INTO Seller VALUES
(1, 'ABC Traders', 'abc@gmail.com', '9876543210', 'Chennai'),
(2, 'Sri Stores', 'sri@gmail.com', '9876501234', 'Chengalpattu'),
(3, 'Global Mart', 'global@gmail.com', '9123456780', 'Tambaram');

INSERT INTO Product VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Keyboard', 'Accessories', 1200.00),
(103, 'Mouse', 'Accessories', 700.00),
(104, 'Monitor', 'Electronics', 12000.00);

INSERT INTO Inventory VALUES
(1, 1, 101, 15, 'Available'),
(2, 1, 102, 30, 'Available'),
(3, 2, 103, 0, 'Unavailable'),
(4, 2, 104, 10, 'Available'),
(5, 3, 101, 0, 'Unavailable');


SELECT 
    s.Seller_Name,
    p.Product_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM Inventory i
JOIN Seller s ON i.Seller_ID = s.Seller_ID
JOIN Product p ON i.Product_ID = p.Product_ID;

SELECT
    p.Product_Name,
    SUM(i.Stock_Quantity) AS Total_Stock,
    CASE
        WHEN SUM(i.Stock_Quantity) > 0 THEN 'Available'
        ELSE 'Unavailable'
    END AS Inventory_Status
FROM Inventory i
JOIN Product p ON i.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Product_Name;

SELECT 
    s.Seller_ID,
    s.Seller_Name,
    p.Product_ID,
    p.Product_Name,
    p.Category,
    p.Price,
    i.Stock_Quantity,
    i.Stock_Status
FROM Seller s
JOIN Inventory i ON s.Seller_ID = i.Seller_ID
JOIN Product p ON i.Product_ID = p.Product_ID;