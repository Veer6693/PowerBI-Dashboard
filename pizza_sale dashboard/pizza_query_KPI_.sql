select * from pizza_sales ;


select SUM(total_price) as revenue from pizza_sales ;

select SUM(total_price)/COUNT(DISTINCT order_id) as avg_order_value from pizza_sales ;

select SUM(quantity) as total_pizza from pizza_sales ;

select COUNT(DISTINCT order_id) as Total_Order from pizza_sales;

select CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ CAST(COUNT(DISTINCT order_id)AS DECIMAL(10,2)) AS DECIMAL(10,2)) as Average_pizza_per_order from pizza_sales;