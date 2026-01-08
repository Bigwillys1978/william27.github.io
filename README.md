# Project 1

**Title:** [Sales Performance Analysis](https://github.com/Bigwillys1978/william27.github.io/blob/main/Sales%20Performance%20Data.xlsx)

**Tools Used:** Microsoft Excel, Pivot Tables, Pivot Charts (Column, Line),Conditional Formatting,Basic data cleaning & sorting,slicers,Date-based aggregation (Month, Quarter, Year)

**Project Description:** This project analyses a 2003 sales dataset containing customer orders across multiple countries and territories. The dataset includes detailed transactional information such as order numbers, quantities ordered, unit prices, total sales values, order dates, product lines, customer locations, and deal sizes.

**The purpose of the analysis is to:**

Evaluate overall sales performance.

Identify high-value customers and regions.

Understand monthly and quarterly sales trends.

Support data-driven business decisions using Excel dashboards.

**Key finding:** 

Classic Cars, Vintage Cars and Motorcycles are the product lines that generates consistent sales across all months.

October and November record the highest sales volumes, indicating strong Q4 performance.

Medium deal sizes contribute more revenue than Small deals, despite fewer transactions.

USA, Spain, France, Australia and UK are the top-performing countries by total sales.

Customers such as Euro Shopping Channel and Mini Gifts Distributed Ltd generate higher average order values and sales.

**Dashboard Overview:** The Excel dashboard provides an interactive overview of sales performance using Pivot Tables and charts, including:

Total Sales KPI
Displays overall revenue generated.

Sales by Month (Line Chart)
Shows monthly sales trends to identify peak periods.

Sales by Country (Funnel Chart)
Compares revenue contribution across countries.

Sales by Deal Size (Pie Chart)
Visualises revenue distribution by Small and Medium deals.

Top Customers (Column Chart)
Highlights customers with the highest total sales.

Slicers were used for:
Countries.
Months.
This allows users to dynamically filter and explore sales performance

![Salesperformance](Salesperformance.jpg)

# Project 2

**Title** Pizza Sales Report

**SQL Codes:** [Pizza Database-SQL Codes](https://github.com/Bigwillys1978/william27.github.io/blob/main/Pizza%20Sales%20.SQL)

**Total Revenue:** The sum of the total price of all pizza orders.

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

**Average order value:** The average amount spent per order, calculated by dividing the total revenue by the total number of orders.

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

**Total pizza sold:** The sum of the quantities of all pizza sold.

   SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

**Total orders:** Total number of orders placed

   SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

**Average pizza per order:** The average number of pizzas sold per order, calculated by dividing the total number of pizza sold by total number of orders

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

**CHARTS REQUIREMENT**  

We would like to visualize various aspects of our pizza sales data to gain insights and understand key trends. We have identified the following requirement for creating charts.

**Daily trend for total orders:** Create a bar chart that displays the daily trends of total orders over a specific period. This charts will help us identify any patterns or fluctuations in order volumes daily.

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
Output:

**Monthly trend for total orders:** Create a line chart that illustrates the hourly trend of total orders throughout the day. This chart will allow us to identify peak hours or periods of high order activity.

select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)

**Percentage of sales by pizza category:** create a pie chart that shows the distribution of sales across different pizza categories. This chart will provide insight into the popularity of various pizza categories and their distribution to overall sales.
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

**Percentage of sales by pizza size:** Generate a pie chart that represents the percentage of sales attributed to different sizes. This chart will help us understand customer preferences for pizza sizes and their impact on sales.

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

**Total pizza sold by pizza category:** Create a funnel chart that represents the total number of pizza's sold for each pizza category. This chart will allow us to compare the sales performance of different pizza categories.

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

**Top five best sellers by revenue, total quantity and total orders:** Creates a bar chart highlighting the top five best-selling pizza based on the revenue, total quantity, total orders. This chart will help us identify the most popular pizza options.

**Top 5 Pizzas by Revenue**
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

**Top 5 Pizzas by Quantity**
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

**Top 5 Pizzas by Total Orders**
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
 
**Bottom 5 best sellers by revenue total quantity and total orders:** Create a bar chart showcasing the bottom 5 worst- selling pizza based on the revenue, total quantity, total orders. This chart will enable us to identify underperforming or less

**Bottom 5 Pizzas by Revenue**
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
 
**Bottom 5 Pizzas by Quantity**
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
Output

**Bottom 5 Pizzas by Total Orders**
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC

**SQL Skills Used:** 

**Data Retrieval (SELECT):** Queried and extracted specific information from the database.

**Data Aggregation (SUM, COUNT, AVG):** Calculated totals, such as sales and quantities, and counted records to analyze data trends.Aggregate functions.

**Data Filtering (WHERE, BETWEEN, IN, AND):** Applied filters to select relevant data, including filtering by ranges and lists.

**Data Source Specification (FROM):** Specified the tables used as data sources for retrieval

GROUP BY, ORDER BY

Date functions (YEAR, MONTH)

Time-based analysis

Aliasing

**Project Description:** This project analyses pizza sales transaction data to understand customer purchasing behaviour, revenue performance, and product popularity. The dataset contains detailed order-level information including pizza types, categories, sizes, quantities sold, prices, and order timestamps.
The objective of this project is to:

**Total Revenue:** The sum of the total price of all pizza orders.

**Average order value:** The average amount spent per order, calculated by dividing the total revenue by the total number of orders.

**Total pizza sold:** The sum of the quantities of all pizza sold.

**Total orders:** Total number of orders placed

**Average pizza per order:** The average number of pizzas sold per order, calculated by dividing the total number of pizza sold by total number of orders


**Technology Used:** SQL Server, SQL Server Management Studio (SSMS)






