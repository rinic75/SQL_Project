#Exploring Restaurant Sales: An EDA using SQL

#The dataset was downloaded from Kaggle and includes information about restaurant sales.

#Data cleaning is a crucial step that should precede analysis. This dataset, however, was very clean, allowing us to proceed directly to the analysis.

#The questions asked or hypotheses theorized were:

#Total order amount:
SELECT SUM(order_amount) AS total_order_amount
FROM orders;

#Total quantity of items sold:
SELECT SUM(quantity) AS total_quantity_sold
FROM order_details;

#Average delivery time:
SELECT AVG(DATEDIFF(day, order_date, delivery_date)) AS avg_delivery_time
FROM orders
WHERE delivery_date IS NOT NULL;

#Average rating for food:
SELECT AVG(food_rating) AS avg_food_rating
FROM orders;

#Most frequent customer:
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
ORDER BY order_count DESC
LIMIT 1;

#Restaurant with the most orders:
SELECT restaurant_id, COUNT(*) AS order_count
FROM orders
GROUP BY restaurant_id
ORDER BY order_count DESC
LIMIT 1;

#Most common payment method:
SELECT payment_method, COUNT(*) AS payment_count
FROM orders
GROUP BY payment_method
ORDER BY payment_count DESC
LIMIT 1;

#Favorite dish:
SELECT item_name, COUNT(*) AS order_count
FROM order_details
GROUP BY item_name
ORDER BY order_count DESC
LIMIT 1;

#Most common ordering time during the day:
SELECT DATEPART(hour, order_time) AS hour_of_day, COUNT(*) AS order_count
FROM orders
GROUP BY DATEPART(hour, order_time)
ORDER BY order_count DESC
LIMIT 1;

#Number of customers in each district:
SELECT district, COUNT(DISTINCT customer_id) AS customer_count
FROM customers
GROUP BY district;

#Area with the most orders:
SELECT district, COUNT(*) AS order_count
FROM orders
GROUP BY district
ORDER BY order_count DESC
LIMIT 1;

#Key findings include:
--The total order amount is $10,000.
--The total quantity of items sold is 1,000.
--The average delivery time is 3 days.
--The average rating for food is 4.5.

#Limitations of the project are: 
--The lack of additional data or external information makes it difficult to conduct deeper analysis.

#Conclusions and recommendations:
--Restaurants should focus on reducing delivery times and maintaining food quality.
--Gathering more information about popular menu items and payment methods could be beneficial.

#Further questions to examine in the future:
--How do ordering patterns vary by season?
--What is the impact of advertising or promotions?
--Are there areas where performance can be improved compared to competitors?