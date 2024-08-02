-- Join the tables to find the total quantity of each pizza category ordered

SELECT 
    pizza_sales.pizza_types.category,
    SUM(pizza_sales.order_details.quantity) AS quantity
FROM
    pizza_sales.pizza_types
        JOIN
    pizza_sales.pizzas ON pizza_sales.pizza_types.pizza_type_id = pizza_sales.pizzas.pizza_type_id
        JOIN
    pizza_sales.order_details ON pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id
GROUP BY pizza_sales.pizza_types.category
ORDER BY quantity DESC;