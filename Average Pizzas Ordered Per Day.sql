-- Group the orders by date and calculate the average number of pizzas ordered per day

SELECT 
    ROUND(AVG(quantity), 0)
FROM
    (SELECT 
        pizza_sales.orders.order_date,
            SUM(pizza_sales.order_details.quantity) AS quantity
    FROM
        pizza_sales.orders
    JOIN pizza_sales.order_details ON pizza_sales.orders.order_id = pizza_sales.order_details.order_id
    GROUP BY pizza_sales.orders.order_date) AS order_quantity;