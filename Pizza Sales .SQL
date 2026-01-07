**PROBLEM STATEMENT**
KPI STATEMENT
We need to analyse key indicators for the pizza sales to gain insights into the business performance. Specifically, we want to calculate the ff. metrics:
1.	Total Revenue: The sum of the total price of all pizza orders.
2.	Average order value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
3.	Total pizza sold: The sum of the quantities of all pizza sold.
4.	Total orders: Total number of orders placed
5.	Average pizza per order: The average number of pizzas sold per order, calculated by dividing the total number of pizza sold by total number of orders

CHARTS REQUIREMENT  
We would like to visualize various aspects of our pizza sales data to gain insights and understand key trends. We have identified the following requirement for creating charts.
1.	Daily trend for total orders: Create a bar chart that displays the daily trends of total orders over a specific period. This charts will help us identify any patterns or fluctuations in order volumes daily.
2.	Monthly trend for total orders: Create a line chart that illustrates the hourly trend of total orders throughout the day. This chart will allow us to identify peak hours or periods of high order activity.
3.	Percentage of sales by pizza category: create a pie chart that shows the distribution of sales across different pizza categories. This chart will provide insight into the popularity of various pizza categories and their distribution to overall sales.
4.	 Percentage of sales by pizza size: Generate a pie chart that represents the percentage of sales attributed to different sizes. This chart will help us understand customer preferences for pizza sizes and their impact on sales.
5.	Total pizza sold by pizza category: Create a funnel chart that represents the total number of pizza's sold for each pizza category. This chart will allow us to compare the sales performance of different pizza categories.
6.	Top five best sellers by revenue, total quantity and total orders: Creates a bar chart highlighting the top five best-selling pizza based on the revenue, total quantity, total orders. This chart will help us identify the most popular pizza options.
7.	Bottom 5 best sellers by revenue total quantity and total orders: Create a bar chart showcasing the bottom 5 worst- selling pizza based on the revenue, total quantity, total orders. This chart will enable us to identify underperforming or less popular pizza options.
SOFTWARE USED:
Microsoft Excel
SQL
POWER BI

PIZZA SALES SQL QUERIES
A. KPI’s
1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
 
2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales
 
3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales
 
4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
 
5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales
 
B. Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

 C. Monthly Trend for Orders
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)Output
 
D. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category
Output
 
E. % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

 F. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

 G. Top 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
 
H. Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
 
I. Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

 J. Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

 K. Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
 
L. Bottom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
 

