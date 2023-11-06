
--Query for Task 1:
SELECT a.*, 
(SELECT Count(b.id) 
FROM  `Orders` b 
WHERE a.id = b.customer_id) AS Order_Count 
FROM `Customers` a 
ORDER BY Order_Count DESC; 


--Query for Task 2:
SELECT a.name AS Product_Name, SUM(b.quantity) AS Quantity, SUM(b.quantity * b.unit_price) AS Total_Amount
FROM `Products` a
INNER JOIN `Order_Items` b ON a.id = b.product_id
GROUP BY Product_Name, b.unit_price
ORDER BY b.order_id ASC;


--Query for Task 3:
SELECT a.name as Category_Name, Sum(product_total) AS Total_Revenue
FROM (
    SELECT b.category_id, Sum(c.quantity * c.unit_price) AS product_total 
    FROM `Products` b 
    INNER JOIN `Order_Items` c ON b.id = c.product_id 
    GROUP BY b.category_id
) AS subroutine 
INNER JOIN `Categories` a ON a.id = subroutine.category_id
GROUP BY Category_Name
ORDER BY Total_Revenue DESC;

--Query for Task 4:
SELECT a.name AS Customer_Name , Sum(cost_total) AS Total_Purchase_Amount 
FROM (SELECT b.customer_id, Sum(c.quantity* c.unit_price) AS Cost_Total
FROM `Orders` b 
INNER JOIN `Order_Items` c ON b.id = c.order_id
GROUP BY b.customer_id) AS subroutine
INNER JOIN `Customers` a ON a.id = subroutine.customer_id
GROUP BY Customer_Name
ORDER BY Total_Purchase_Amount DESC
LIMIT 5;