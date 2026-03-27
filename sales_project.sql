-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS sales_project;
USE sales_project;

-- Step 2: Create Table
DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    invoice_id              VARCHAR(20),
    branch                  VARCHAR(5),
    city                    VARCHAR(20),
    customer_type           VARCHAR(20),
    gender                  VARCHAR(10),
    product_line            VARCHAR(50),
    unit_price              DECIMAL(10,2),
    quantity                INT,
    tax_5                   DECIMAL(10,4),
    total                   DECIMAL(10,4),
    date                    VARCHAR(20),
    time                    VARCHAR(20),
    payment                 VARCHAR(20),
    cogs                    DECIMAL(10,2),
    gross_margin_percentage DECIMAL(20,10),
    gross_income            DECIMAL(10,4),
    rating                  DECIMAL(3,1),
    month                   VARCHAR(20),
    day                     VARCHAR(20)
);

-- Step 3: Import CSV
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/supermarket_cleaned.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Step 4: Verify Import
SELECT COUNT(*) FROM sales;
SELECT * FROM sales LIMIT 5;

-- Step 5: Analysis Queries

-- Query 1: Top Product Lines (GROUP BY)
SELECT product_line,
       COUNT(*) AS total_orders,
       ROUND(SUM(total), 2) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- Query 2: Top Branch by Revenue (CTE)
WITH branch_sales AS (
    SELECT branch,
           ROUND(SUM(total), 2) AS revenue
    FROM sales
    GROUP BY branch
)
SELECT * FROM branch_sales
ORDER BY revenue DESC;

-- Query 3: Product Line Rankings (Window Function)
SELECT product_line,
       ROUND(SUM(total), 2) AS total_revenue,
       RANK() OVER (ORDER BY SUM(total) DESC) AS revenue_rank
FROM sales
GROUP BY product_line;

-- Query 4: Customer Purchase Patterns
SELECT customer_type,
       gender,
       ROUND(AVG(total), 2) AS avg_spend,
       COUNT(*) AS visits
FROM sales
GROUP BY customer_type, gender
ORDER BY avg_spend DESC;