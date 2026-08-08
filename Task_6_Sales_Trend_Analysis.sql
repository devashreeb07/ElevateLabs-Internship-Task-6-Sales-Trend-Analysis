CREATE DATABASE task6_sales;
USE task6_sales;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
(1001, '2025-01-05', 1200.00, 101),
(1002, '2025-01-12', 850.00, 102),
(1003, '2025-01-20', 1450.00, 103),
(1004, '2025-01-25', 700.00, 104),
(1005, '2025-01-30', 1100.00, 105),

(1006, '2025-02-03', 950.00, 101),
(1007, '2025-02-10', 1800.00, 106),
(1008, '2025-02-15', 1250.00, 102),
(1009, '2025-02-22', 900.00, 107),
(1010, '2025-02-27', 1600.00, 103),

(1011, '2025-03-04', 2100.00, 108),
(1012, '2025-03-11', 1350.00, 101),
(1013, '2025-03-18', 1750.00, 109),
(1014, '2025-03-24', 950.00, 104),
(1015, '2025-03-29', 2200.00, 110),

(1016, '2025-04-02', 1150.00, 102),
(1017, '2025-04-09', 2400.00, 106),
(1018, '2025-04-16', 1300.00, 103),
(1019, '2025-04-23', 1900.00, 108),
(1020, '2025-04-28', 1550.00, 105),

(1021, '2025-05-05', 2600.00, 101),
(1022, '2025-05-12', 1750.00, 107),
(1023, '2025-05-19', 2250.00, 109),
(1024, '2025-05-25', 1400.00, 104),
(1025, '2025-05-30', 2800.00, 110),

(1026, '2025-06-03', 1900.00, 103),
(1027, '2025-06-10', 2700.00, 106),
(1028, '2025-06-17', 1650.00, 102),
(1029, '2025-06-24', 3100.00, 108),
(1030, '2025-06-29', 2200.00, 105),

(1031, '2025-07-04', 3200.00, 101),
(1032, '2025-07-11', 2400.00, 107),
(1033, '2025-07-18', 2900.00, 109),
(1034, '2025-07-23', 1800.00, 104),
(1035, '2025-07-30', 3500.00, 110),

(1036, '2025-08-02', 2800.00, 103),
(1037, '2025-08-09', 3600.00, 106),
(1038, '2025-08-16', 2100.00, 102),
(1039, '2025-08-23', 3300.00, 108),
(1040, '2025-08-29', 2600.00, 105),

(1041, '2025-09-05', 3000.00, 101),
(1042, '2025-09-12', 2500.00, 107),
(1043, '2025-09-19', 3400.00, 109),
(1044, '2025-09-25', 2200.00, 104),
(1045, '2025-09-30', 3700.00, 110),

(1046, '2025-10-04', 3100.00, 103),
(1047, '2025-10-11', 4200.00, 106),
(1048, '2025-10-18', 2600.00, 102),
(1049, '2025-10-24', 3900.00, 108),
(1050, '2025-10-29', 2900.00, 105),

(1051, '2025-11-03', 4500.00, 101),
(1052, '2025-11-10', 3600.00, 107),
(1053, '2025-11-17', 4100.00, 109),
(1054, '2025-11-23', 3000.00, 104),
(1055, '2025-11-29', 4800.00, 110),

(1056, '2025-12-05', 3900.00, 103),
(1057, '2025-12-12', 5200.00, 106),
(1058, '2025-12-18', 3400.00, 102),
(1059, '2025-12-24', 4600.00, 108),
(1060, '2025-12-30', 5500.00, 105);

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT * FROM orders LIMIT 10;

# Monthly Revenue
SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, SUM(amount) AS monthly_revenue
FROM orders GROUP BY YEAR(order_date), MONTH(order_date) ORDER BY year, month;

# Monthly Order Volume
SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, COUNT(DISTINCT order_id) AS order_volume
FROM orders GROUP BY YEAR(order_date), MONTH(order_date) ORDER BY year, month;

# combine both analyses into one results table
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY year, month;

# Top 3 Months by Sales
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM orders GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY monthly_revenue DESC LIMIT 3;

# Analyze a Specific Time Period
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders WHERE order_date BETWEEN '2025-07-01' AND '2025-12-31'
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY year, month;

# Check NULL Values
SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS order_id_count,
    COUNT(order_date) AS order_date_count,
    COUNT(amount) AS amount_count,
    COUNT(product_id) AS product_id_count
FROM orders;

# calculate overall sales
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(amount) AS total_revenue,
    AVG(amount) AS average_order_value,
    MIN(amount) AS minimum_order_value,
    MAX(amount) AS maximum_order_value
FROM orders;