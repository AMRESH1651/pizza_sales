--Retrieve the total number of orders placed.--
select * from orders ;
select count(order_id) from orders ;
select count(order_id) as total_orders from orders;
--Final query--
select count(order_id ) as total_orders from orders


--Calculate the total revenue generated from pizza sales.--
select * from pizzas ;
select sum(price) from pizzas ;
select sum(price) as total_revenue from pizzas ;

select order_details.quantity*pizzas.price
from order_details join pizzas
on pizzas.pizza_id=order_details.pizza_id



select (order_details.quantity*pizzas.price) as total_sales
from order_details join pizzas
on pizzas.pizza_id=order_details.pizza_id

select sum(order_details.quantity*pizzas.price) as total_sales
from order_details join pizzas
on pizzas.pizza_id=order_details.pizza_id

--Final query--
select round(sum(order_details.quantity*pizzas.price),2) as total_sales
from order_details join pizzas
on pizzas.pizza_id=order_details.pizza_id

--beautify the querry--
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_sales
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
    

--Identify the highest-priced pizza with name.--

select pizza_types.name,pizzas.price
from pizza_types join pizzas 
on pizza_types.pizza_type_id=pizzas.pizza_type_id

--Final query--

select pizza_types.name,pizzas.price
from pizza_types join pizzas 
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc
limit 1


--beautify the querry
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1

--Identify the most common pizza size ordered.

select quantity ,count(order_details_id)
from order_details 
group by quantity 

select pizzas.size,count(order_details.order_details_id)
from pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizzas.size
order by count;

--Final query--

select pizzas.size,count(order_details.order_details_id) as order_count
from pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizzas.size
order by order_count desc;

--beautify the querry

SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;

--List the top 5 most ordered pizza types along with their quantities.--

select pizza_types.name,order_details.quantity
from pizza_types 
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id

select pizza_types.name,sum(order_details.quantity)
from pizza_types 
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.name;

--Final query--

select pizza_types.name , sum(order_details.quantity) as quantity
from pizza_types 
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.name
order by quantity
limit 5;

--Determine the distribution of orders by hour of the day.

--Final query--

select hour(order_time) as hour, count(order_id) as order_count
from orders 
group by hour(order_time);

--beautify the querry

SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time);


--beautify the querry--
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_sales
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
    

--Identify the highest-priced pizza with name .--

select pizza_types.name,pizzas.price
from pizza_types join pizzas 
on pizza_types.pizza_type_id=pizzas.pizza_type_id

select pizza_types.name,pizzas.price
from pizza_types join pizzas 
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc
limit 1


--beautify the querry
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1

--Identify the most common pizza size ordered.

select quantity ,count(order_details_id)
from order_details 
group by quantity 

select pizzas.size,count(order_details.order_details_id)
from pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizzas.size
order by count;

select pizzas.size,count(order_details.order_details_id) as order_count
from pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizzas.size
order by order_count desc;

--beautify the querry--

SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;

--List the top 5 most ordered pizza types along with their quantities.

select pizza_types.name,order_details.quantity
from pizza_types 
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id

select pizza_types.name,sum(order_details.quantity)
from pizza_types 
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.name;

select pizza_types.name , sum(order_details.quantity) as quantity
from pizza_types 
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.name
order by quantity
limit 5;

--Determine the distribution of orders by hour of the day.

select hour(order_time) as hour, count(order_id) as order_count
from orders 
group by hour(order_time);

--beautify the querry

SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time);

--Join relevant tables to find the category-wise distribution of pizzas.

select category , count(name) from pizza_types
group by category;

--Join relevant tables to find the category-wise distribution of pizzas.--

select category , count(name) from pizza_types
group by category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.--

select orders.order_date, sum(order_details.quantity)
from orders join order_details
on orders.order_id=order_details.order_id
group by orders.order_date;

select avg(quantity) from 
(select orders.order_date, sum(order_details.quantity) as quantity
from orders join order_details
on orders.order_id=order_details.order_id
group by orders.order_date) as order_quantity;

select round(avg(quantity),0)from 
(select orders.order_date, sum(order_details.quantity) as quantity
from orders join order_details
on orders.order_id=order_details.order_id
group by orders.order_date) as order_quantity;

--beautify the querry--

SELECT 
    ROUND(AVG(quantity), 0)
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_quantity;


-- Analyze the cumulative revenue generated over time.--

select orders.order_date,
 sum(order_details.quantity*pizzas.price) as revenue
from order_details join pizzas
on order_details.pizza_id=pizzas.pizza_id
join orders
on orders.order_id=order_details.order_id
group by orders.order_date;


select order_date,sum(revenue) over(order by order_date) as revenue
from 
(select orders.order_date,
 sum(order_details.quantity*pizzas.price) as revenue
from order_details join pizzas
on order_details.pizza_id=pizzas.pizza_id
join orders
on orders.order_id=order_details.order_id
group by orders.order_date) as sales;


--Retrieve the total number of orders placed.--
select * from orders ;
select count(order_id) from orders ;
select count(order_id) as total_orders from orders;

--beautify the querry--
SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders