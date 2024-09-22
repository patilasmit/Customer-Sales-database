create database Customer_data;
use Customer_data;

CREATE TABLE CUSTOMER_NAME(
Customer_Index int PRIMARY KEY,
CustomerNames varchar(40));

CREATE  TABLE REGIONS
(
RegionIndex int PRIMARY KEY,
City varchar(40),
Country varchar(40));

CREATE TABLE PRODUCTS
(
ProductIndex int PRIMARY KEY,
Product_Name varchar(40));

CREATE TABLE SALES_ORDER (
    ORDERNUMBER VARCHAR(15),
    ORDERDATE VARCHAR(20),
    CUSTOMER_INDEX INT NOT NULL PRIMARY KEY,
    `CHANNEL` VARCHAR(15),
    WAREHOUSE_CODE VARCHAR(15),
    DELIVERY_REGION_INDEX INT NOT NULL,
    PRODUCT_INDEX INT,
    ORDER_QTY INT,
    UNIT_PRICE_USD DECIMAL(7,2),
    TOTAL_REVENUE_USD DECIMAL(7,2),
    FOREIGN KEY (PRODUCT_INDEX) REFERENCES PRODUCTS(ProductIndex)
);

select * from sales_order;
select * from customer_name;
select * from regions;
select * from products;

LOAD DATA INFILE  "D:\customer.csv"
INTO TABLE CUSTOMER_NAME
FIELDS TERMINATED BY ','
enclosed by '"'
LINES terminated by '\n'
ignore 1 rows;

LOAD DATA INFILE "D:\products.csv"
INTO TABLE PRODUCTS
FIELDS TERMINATED BY ','
enclosed by '"'
LINES terminated by '\n'
ignore 1 rows;

LOAD DATA INFILE "D:\\regions.csv"
INTO TABLE REGIONS
FIELDS TERMINATED BY ','
enclosed by '"'
LINES terminated by '\n'
ignore 1 rows;

LOAD DATA INFILE "D:\sales_order.csv"
INTO TABLE SALES_ORDER
FIELDS TERMINATED BY ','
enclosed by '"'
LINES terminated by '\n'
ignore 1 rows;

select * from sales_order;
select * from customer_name;
select * from regions;
select * from products;
SELECT * FROM  AJ_CUST_SALES_V 
---Here we are creating a master table with required tables to perform queries fastly 

CREATE VIEW AJ_CUST_SALES_V1 AS
	SELECT A.* , B.ProductIndex, C.City, C.Country, D.CustomerNames FROM sales_order A
    LEFT OUTER JOIN products B ON A.PRODUCT_INDEX = B.ProductIndex
    LEFT OUTER JOIN regions C ON A.DELIVERY_REGION_INDEX = C.RegionIndex
    LEFT OUTER JOIN customer_name D ON A.CUSTOMER_INDEX = D.Customer_Index;
    
    
--- 1. How many customers are in the CUSTOMER_NAME table?
SELECT 
    COUNT(*)
FROM
    CUSTOMER_NAME;

--- 2. What are the names of all customers from a USA country?
SELECT 
    CustomerNames
FROM
    CUSTOMER_NAME
WHERE
    Customer_Index IN (SELECT 
            Customer_Index
        FROM
            sales_order
        WHERE
            DELIVERY_REGION_INDEX = (SELECT 
                    REGIONINDEX
                FROM
                    REGIONS
                WHERE
                    COUNTRY = 'USA'));

--- 3. What is the total number of sales orders placed?
SELECT 
    COUNT(ORDERNUMBER)
FROM
    AJ_CUST_SALES_V;

--- 4. What is the total revenue generated from sales?
SELECT 
    SUM(TOTAL_REVENUE_USD) AS TOTAL_REVENUE
FROM
    AJ_CUST_SALES_V;

--- 5.Which products have been sold and how many times?
SELECT 
    B.PRODUCT_NAME, COUNT(A.ORDERNUMBER) AS TIMESOLD
FROM
    SALES_ORDER A
        JOIN
    PRODUCTS B ON E.PRODUCT_INDEX = B.PRODUCTINDEX
GROUP BY B.PRODUCTINDEX
ORDER BY TIMESOLD DESC;

--- 6. What are the total sales revenue by region?
SELECT 
    C.City, C.Country, SUM(A.TOTAL_REVENUE_USD) AS TotalSales
FROM
    SALES_ORDER A
        JOIN
    REGIONS C ON A.DELIVERY_REGION_INDEX = C.RegionIndex
GROUP BY C.City , C.Country;

--- 7. How many orders were delivered to a specific city?
SELECT 
    COUNT(*)
FROM
    SALES_ORDER A
        JOIN
    REGIONS C ON A.DELIVERY_REGION_INDEX = C.RegionIndex
WHERE
    C.City = 'Specific City';
    
--- 8. Which product generated the highest revenue?
SELECT 
    B.Product_Name, SUM(A.TOTAL_REVENUE_USD) AS TotalRevenue
FROM
    SALES_ORDER A
        JOIN
    PRODUCTS B ON A.PRODUCT_INDEX = B.ProductIndex
GROUP BY B.Product_Name
ORDER BY TotalRevenue DESC
LIMIT 1;

--- 9. List all orders placed by a specific customer along with product details
SELECT 
    A.ORDERNUMBER,
    B.Product_Name,
    A.ORDER_QTY,
    A.UNIT_PRICE_USD,
    A.TOTAL_REVENUE_USD
FROM
    SALES_ORDER A
        JOIN
    PRODUCTS B ON A.PRODUCT_INDEX = B.ProductIndex
WHERE
    A.CUSTOMER_INDEX = (SELECT 
            Customer_Index
        FROM
            CUSTOMER_NAME
        WHERE
            CustomerNames = 'Specific Customer');-


