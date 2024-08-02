-- Identify the highest priced pizza

SELECT 
    pizza_sales.pizza_types.name, pizza_sales.pizzas.price
FROM
    pizza_sales.pizza_types
        JOIN
    pizza_sales.pizzas ON pizza_sales.pizza_types.pizza_type_id = pizza_sales.pizzas.pizza_type_id
ORDER BY pizza_sales.pizzas.price DESC
LIMIT 1;