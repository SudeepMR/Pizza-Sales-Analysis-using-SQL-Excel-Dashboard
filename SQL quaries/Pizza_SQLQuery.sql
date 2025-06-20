select *
from pizza_sales

----For KPI----

----1st query

select sum(total_price) Total_Revenue
from pizza_sales



----2ns query

select SUM(total_price)/COUNT(distinct order_id) as Avg_order_Value
from pizza_sales


----3rd query

select SUM(quantity) as pizza_sales
from pizza_sales


----4th query

select COUNT(distinct order_id) as Total_Orders
from pizza_sales


----5th query

select cast(cast(SUM(quantity) as decimal(10,2))/cast(COUNT(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_per_order
from pizza_sales


----For Dashboard


-----Daily Trend

select DATENAME(DW, order_date) as order_day, COUNT(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(DW, order_date)


----Hourly Trend

select datepart(hour, order_time) as order_hours, COUNT(distinct order_id) as total_orders
from pizza_sales
group by datepart(hour, order_time)
order by datepart(hour, order_time)


----sales by category in percentage

select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category


----percentage of sales by pizza size

select pizza_size, cast(SUM(total_price) as decimal(10,2)) as Total_sales, cast(SUM(total_price)*100/(select SUM(total_price) from pizza_sales) as decimal(10,2)) as PCT_size
from pizza_sales
group by pizza_size
order by pizza_size

----total pizza sold by category

select pizza_category, SUM(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_category


----top 5 best seller by total pizza sold

select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by sum(quantity) desc


----bottom 5 best seller by total pizza sold

select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by sum(quantity)