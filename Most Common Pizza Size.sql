-- Identify the most common pizza size ordered

SELECT 
    pizza_sales.pizzas.size,
    COUNT(pizza_sales.order_details.order_details_id) AS order_count
FROM
    pizza_sales.pizzas
        JOIN
    pizza_sales.order_details ON pizza_sales.pizzas.pizza_id = pizza_sales.order_details.pizza_id
GROUP BY pizza_sales.pizzas.size
ORDER BY order_count DESC
LIMIT 1;