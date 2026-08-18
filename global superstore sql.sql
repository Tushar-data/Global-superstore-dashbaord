create database global_superstore;

use global_superstore;

select * from `superstore`;

# top 10 profit products
select product_name, sum(profit) as total_profit
from superstore
group by product_name
order by total_profit desc
limit 10;

# top 10 customer by sales
select customer_name, sum(sales) as total_sales
from superstore
group by customer_name
order by total_sales desc
limit 10;

# region wise total sales
select region, sum(sales) as total_sales
from superstore
group by region;

# category wise average profit
select category, avg(profit) as average_profit
from superstore
group by category;

# highest discount category
select category, max(discount)as highest_discount
from superstore
group by category;

# order with negative profit
select order_id, product_name, category, sales, profit
from superstore
where profit<0;

# market wise revenue analysis
select market, sum(sales) as total_revenue
from superstore
group by market;

# top performing sub categories
select sub_category, sum(sales) as total_sales
from superstore
group by sub_category
order by total_sales desc
limit 10;

# ship mode usage analysis
select ship_mode, sum(sales) as total_sales
from superstore
group by ship_mode;

select order_date
from superstore
limit 5;

# monthly sales trend
select date_format(Str_to_date(order_date, '%d-%m-%y'), '%y-5m') as month,
sum(sales) as total_sales
from superstore
group by date_format(str_to_date(order_date, '%d-%m-%y'), '%y-%m')
order by month;

# sql insights
# which market generates the highest revenue 
select market, 
sum(sales) as total_revenue
from superstore
group by market
order by total_revenue desc
limit 1;
-- insights:
-- LATAM generated the highest total reevenue.

#  which shooping mode is most commonly used orders
select ship_mode,
count(*) as total_orders
from superstore
group by ship_mode
order by total_orders desc
limit 1;

-- insights
-- Standard class is the most frequently used for order.

# which category is least profitable
select category, 
avg(profit) as average_profit
from superstore
group by category
order by average_profit
limit 1 ;

-- insights:
-- furniture has lowest avg profit.

