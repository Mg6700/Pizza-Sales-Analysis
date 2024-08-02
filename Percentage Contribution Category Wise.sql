-- Calculate the percentage contribution of each pizza type to total revenue

SELECT 
    pizza_sales.pizza_types.category,
    ROUND(SUM(pizza_sales.order_details.quantity * pizza_sales.pizzas.price) / (SELECT 
                    ROUND(SUM(pizza_sales.order_details.quantity * pizzas.price),
                                0) AS revenue
                FROM
                    pizza_sales.order_details
                        JOIN
                    pizza_sales.pizzas ON pizza_sales.pizzas.pizza_id = pizza_sales.order_details.pizza_id) * 100,
            0) AS revenue
FROM
    pizza_sales.pizza_types
        JOIN
    pizza_sales.pizzas ON pizza_sales.pizza_types.pizza_type_id = pizza_sales.pizzas.pizza_type_id
        JOIN
    pizza_sales.order_details ON pizza_sales.order_details.pizza_id = pizza_sales.pizzas.pizza_id
GROUP BY pizza_sales.pizza_types.category
ORDER BY revenue DESC;