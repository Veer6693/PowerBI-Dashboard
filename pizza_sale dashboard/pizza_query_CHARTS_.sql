show databases;

SELECT * FROM pizza_sales;

SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) as Total_orders 
from pizza_sales
GROUP BY DATENAME(DW, order_date) ;


SELECT DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_orders 
from pizza_sales
GROUP BY DATENAME(MONTH, order_date) ;

-- percentage of sales by pizza category
SELECT pizza_category, CAST (sum(total_price)AS DECIMAL(10,2)) as Total_Sale, sum(total_price)* 100/ (SELECT sum(total_price) from pizza_sales where MONTH(order_date) = 1 )as PCT
from pizza_sales
where MONTH(order_date) = 1  -- whenever i add month(order_date) = 1 that means it show data for january
group by pizza_category 
order by PCT desc;

-- percentage of sales by pizza size
SELECT pizza_size, CAST ( sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales where DATEPART (quarter , order_date) =1) AS DECIMAL(10,2) ) AS PCT,CAST (sum(total_price) AS DECIMAL(10,2)) as Total_sale
FROM pizza_sales
where DATEPART (quarter , order_date) =1
GROUP BY pizza_size
order by PCT desc; 

-- TOP 5 pizzas by sale
SELECT TOP 5 pizza_name, sum(total_price) as Total_Sale from pizza_sales 
group by pizza_name
order by Total_sale DESC;

-- BOTTOM 5 pizzas by sale
SELECT TOP 5 pizza_name, sum(total_price) as Total_Sale from pizza_sales 
group by pizza_name
order by Total_sale ASC;

-- TOP 5 pizzas by quantity
SELECT TOP 5 pizza_name, sum(quantity) as Total_Quantity from pizza_sales 
group by pizza_name
order by Total_Quantity DESC;

-- BOTTOM 5 pizzas by quantity
SELECT TOP 5 pizza_name, sum(quantity) as Total_Quantity from pizza_sales 
group by pizza_name
order by Total_Quantity ASC;

-- TOP 5 pizzas by order
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) as Total_Order from pizza_sales 
group by pizza_name
order by Total_Order DESC;

-- BOTTOM 5 pizzas by order
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) as Total_Order from pizza_sales 
group by pizza_name
order by Total_Order ASC;
