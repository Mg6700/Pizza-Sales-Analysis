-- Calculate the total revenue generated from pizza sales

SELECT 
    ROUND(SUM(pizza_sales.order_details.quantity * pizzas.price),
            0) AS revenue
FROM
    pizza_sales.order_details
        JOIN
    pizza_sales.pizzas ON pizza_sales.pizzas.pizza_id = pizza_sales.order_details.pizza_id;