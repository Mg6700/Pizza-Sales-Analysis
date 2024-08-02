-- Join relevant table to find the category-wise distribution of pizzas

SELECT 
    category, COUNT(name)
FROM
    pizza_sales.pizza_types
GROUP BY category;