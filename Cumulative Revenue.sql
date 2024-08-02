-- Analyze the cumulative revenue generated over time

select order_date,
sum(revenue) over(order by order_date) as cum_revenue
from
(select pizza_sales.orders.order_date,
round(sum(pizza_sales.order_details.quantity * pizza_sales.pizzas.price), 0) as revenue
from pizza_sales.order_details join pizza_sales.pizzas
on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id
join pizza_sales.orders
on pizza_sales.orders.order_id = pizza_sales.order_details.order_id
group by pizza_sales.orders.order_date) as revenue_per_day;