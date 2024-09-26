# Customer-Sales-database
In today’s data-driven world, managing customer data effectively is crucial for business success. In this blog, I’ll walk you through the steps to create a simple sales database using SQL. This database will help in tracking customers, products, sales orders, and regional information.

Project Overview: Customer Sales Database
The aim of this project is to create a comprehensive customer sales database that facilitates efficient data management, reporting, and analysis.
The database is designed to store key information about customers, products, sales orders, and regional data, allowing businesses to derive insights and make informed decisions.

Database Structure:
The database consists of five primary tables:

1. CUSTOMER_NAME: 
   - Stores customer information, including unique identifiers and customer names.

2. REGIONS: 
   - Contains data on various regions, including city and country details.

3. PRODUCTS: 
   - Holds product information, such as unique product identifiers and product names.

4. SALES_ORDER: 
   - Captures sales order details, including order numbers, dates, customer associations, product details, quantities, and revenue. It links to the other tables through foreign keys, ensuring data integrity.

5. AJ_CUST_SALES_V1: 
   - A view that combines data from the `SALES_ORDER`, `PRODUCTS`, `REGIONS`, and `CUSTOMER_NAME` tables, allowing for easy access to a comprehensive sales report.

Data Loading:
Data is imported into the tables from CSV files using the `LOAD DATA INFILE` command, ensuring efficient bulk data entry while maintaining the structure and relationships within the database.

Use Cases:
- Sales Performance Tracking : Businesses can analyze total sales revenue, identify top-selling products, and evaluate performance by region.
- Customer Insights : By examining customer purchasing patterns, companies can tailor marketing strategies and improve customer engagement.
- Inventory Management : Insights into product sales help optimize inventory levels and supply chain decisions.

Dashboard Explanation: Sales and Revenue Insights
This dashboard provides a comprehensive overview of the business’s sales and revenue performance, offering insights into key metrics, product performance, customer contributions, and order trends.

a. Revenue Overview
- Total Revenue Card: Displays the total revenue generated from all sales orders, providing a quick snapshot of overall business performance.
- Total Orders Card: Shows the total number of sales orders, giving an idea of the volume of transactions.
- Average Order Value Card: Represents the average revenue per order, helping evaluate the efficiency of each sale.

b. Revenue Breakdown
- Revenue by Region: Visualizes revenue distribution across cities and countries, offering geographic insights into where sales are performing best.
- Revenue by Product (Bar Chart): Shows which products contribute the most to total revenue, helping to identify top-performing items.

c. Customer Insights
- Top Customers by Revenue: Highlights the customers contributing the most revenue, enabling targeted strategies for high-value clients.

d. Product Performance 
- Sales Quantity by Product: Displays the total quantity sold per product, helping to understand demand and inventory needs.
- Total Revenue by Product: Visualizes total revenue generated per product, complementing the quantity chart to assess product profitability.

e. Order Insights
- Order Date Analysis: A line or column chart showing the number of orders over time, revealing trends in order frequency and seasonality.
- Orders by Channel (Pie Chart): Breaks down orders by sales channel (e.g., online, retail), giving a clear view of channel performance and customer preferences.

This dashboard helps business users make data-driven decisions, such as which regions to focus on, which products to promote, and which customers to prioritize. The clean and intuitive design ensures users can easily navigate and derive valuable insights.

Conclusion:
This customer sales database project demonstrates the power of structured data management in enabling effective decision-making and strategic business insights. 
By creating a relational database with a focus on data integrity and query efficiency, organizations can harness the potential of their data to drive growth and enhance operational efficiency.
