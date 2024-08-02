-- Determine the top 3 most ordered pizza types based on revenue for each pizza category
select category, name, revenue from
(select category, name, revenue,
rank() over(partition by category order by revenue desc) as rn
from 
(select pizza_sales.pizza_types.category, pizza_sales.pizza_types.name,
round(sum((pizza_sales.order_details.quantity) * pizza_sales.pizzas.price), 0) as revenue
from pizza_sales.pizza_types join pizza_sales.pizzas
on pizza_sales.pizza_types.pizza_type_id = pizza_sales.pizzas.pizza_type_id
join pizza_sales.order_details
on pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id
group by pizza_sales.pizza_types.category, pizza_sales.pizza_types.name) as a) as b
where rn <=3;