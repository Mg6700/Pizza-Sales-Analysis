-- List the top 5 most ordered pizza types along with their quantities

SELECT 
    pizza_sales.pizza_types.name, SUM(pizza_sales.order_details.quantity) AS quantity
FROM
    pizza_sales.pizza_types
        JOIN
    pizza_sales.pizzas ON pizza_sales.pizza_types.pizza_type_id = pizza_sales.pizzas.pizza_type_id
        JOIN
    pizza_sales.order_details ON pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id
GROUP BY pizza_sales.pizza_types.name
ORDER BY quantity DESC
LIMIT 5;