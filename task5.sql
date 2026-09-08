CREATE DATABASE PaymentDB;
USE PaymentDB;

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Customer_ID INT,
    Amount DECIMAL(10,2),
    Payment_Mode VARCHAR(30),
    Payment_Date DATE,
    Payment_Status VARCHAR(20),
    Transaction_Ref VARCHAR(50)
);

INSERT INTO Payment VALUES
(101, 1, 2500.00, 'UPI', '2026-08-20', 'Successful', 'TXN1001'),
(102, 2, 1500.00, 'Card', '2026-08-20', 'Successful', 'TXN1002'),
(103, 3, 3000.00, 'Net Banking', '2026-08-21', 'Failed', 'TXN1003'),
(104, 4, 1200.00, 'UPI', '2026-08-21', 'Successful', 'TXN1004'),
(105, 5, 5000.00, 'Card', '2026-08-22', 'Pending', 'TXN1005'),
(106, 6, 1800.00, 'UPI', '2026-08-22', 'Successful', 'TXN1006'),
(107, 7, 2200.00, 'Cash', '2026-08-23', 'Successful', 'TXN1007'),
(108, 8, 3500.00, 'Card', '2026-08-23', 'Failed', 'TXN1008');

SELECT * FROM Payment;

SELECT *
FROM Payment
WHERE Payment_Status = 'Successful';

SELECT *
FROM Payment
WHERE Payment_Status = 'Failed';

SELECT *
FROM Payment
WHERE Payment_Status = 'Pending';

SELECT Payment_Mode, COUNT(*) AS Total_Transactions
FROM Payment
GROUP BY Payment_Mode;

SELECT Payment_Mode, SUM(Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Mode;

SELECT Payment_Mode, COUNT(*) AS Usage_Count
FROM Payment
GROUP BY Payment_Mode
ORDER BY Usage_Count DESC;

SELECT COUNT(*) AS Total_Transactions
FROM Payment;

SELECT SUM(Amount) AS Successful_Amount
FROM Payment
WHERE Payment_Status = 'Successful';

SELECT COUNT(*) AS Failed_Transactions
FROM Payment
WHERE Payment_Status = 'Failed';

SELECT
    Payment_ID,
    Customer_ID,
    Amount,
    Payment_Mode,
    Payment_Date,
    Payment_Status,
    Transaction_Ref
FROM Payment
ORDER BY Payment_Date;