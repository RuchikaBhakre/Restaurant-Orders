Create Database Restaurant_Orders;
use Restaurant_Orders;

-- Exploring menu_items table

-- Q1. View the menu_items table and write a query to find the number of items on the menu.

select * from menu_items;

SELECT 
    COUNT(item_name)
FROM
    menu_items;
    
  
  
  
  -- Q2. What are the least and most expensive items on the menu?
  
 SELECT 
    *
FROM
    menu_items
ORDER BY price DESC
LIMIT 1;                     --  most expensive
  
  SELECT 
    *
FROM
    menu_items
ORDER BY price
LIMIT 1;                       -- least expensive




-- Q3. How many Italian dishes are on the menu? 

SELECT 
    COUNT(item_name)
FROM
    menu_items
WHERE
    category = 'Italian';
    
    
    
-- Q4. What are the least and most expensive italian dishes on the menu?

SELECT 
    *
FROM
    menu_items
WHERE
    category = 'Italian'
ORDER BY price DESC
LIMIT 1;




-- Q5. How many dishes are in each category?

SELECT 
    category, COUNT(*) AS Total_dishes
FROM
    menu_items
GROUP BY category;



-- Q6. What is the average dish price within each category?

SELECT 
    category, ROUND(AVG(price), 2) AS Average_price
FROM
    menu_items
GROUP BY category;



-- Exploring the order_details table

-- Q1. View the order_details table. What is the date range of the table?

select * from order_details;

SELECT 
    MIN(order_date) AS Minimum_range,
    MAX(order_date) AS Maximum_range
FROM
    order_details;
    
    
    
    -- Q2. How many orders were made within this date range?
    
SELECT 
    order_date, COUNT(distinct order_id) AS Total_orders
FROM
    order_details
GROUP BY order_date;



-- Q3. How many items were ordered within this date range?

SELECT 
    order_date, COUNT(DISTINCT item_id) AS Number_of_items
FROM
    order_details
GROUP BY order_date;



-- Q4. Which orders had the most number of items?

SELECT 
    order_id, COUNT(item_id) AS maximum_items
FROM
    order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC;



-- Q5. How many orders had more than 12 items?

SELECT 
    COUNT(*)
FROM
    (SELECT 
        order_id, COUNT(item_id) AS total_items
    FROM
        order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12) AS number_of_orders;

    
    
    -- ANALYZING CUSTOMER BEHAVIOR
    
    -- Q1. Combine the menu_items and order_details tables into a single table.
    
    SELECT 
    *
FROM
    order_details
        LEFT JOIN
    menu_items ON order_details.item_id = menu_items.ï»¿menu_item_id;
    
    
    


-- Q2. What were the least and most ordered items?
-- What categories were they in?

SELECT 
    item_name,
    COUNT(ï»¿order_details_id) AS number_of_orders,
    category
FROM
    order_details
        LEFT JOIN
    menu_items ON order_details.item_id = menu_items.ï»¿menu_item_id
GROUP BY item_name , category
ORDER BY number_of_orders DESC
LIMIT 1;



SELECT 
    item_name,
    COUNT(ï»¿order_details_id) AS number_of_orders,
    category
FROM
    order_details
        LEFT JOIN
    menu_items ON order_details.item_id = menu_items.ï»¿menu_item_id
GROUP BY item_name , category
ORDER BY number_of_orders
LIMIT 1;




-- Q3. What were the top 5 orders that spent the most money?

SELECT 
    order_id, ROUND(SUM(price), 2) AS total_spend
FROM
    order_details
        LEFT JOIN
    menu_items ON order_details.item_id = menu_items.ï»¿menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;











  