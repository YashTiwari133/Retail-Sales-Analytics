-- Q1 Create salary categories:
-- Salary >= 50000 → High Salary
-- Salary between 30000 and 49999 → Medium Salary
-- Below 30000 → Low Salary
SELECT employee_name, designation, salary,
	CASE
        WHEN salary >= 50000 THEN 'High Salary'
        WHEN salary BETWEEN 30000 AND 49999 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employees;
-- Q2 Find whether an order used a promotion or not.
SELECT order_id, promotion_id,
	CASE
        WHEN promotion_id IS NULL THEN 'No Promotion'
        ELSE 'Promotion Applied'
    END AS promotion_status
FROM orders
ORDER BY order_id;
-- Q3 Count completed and cancelled orders using CA
SELECT store_id,
	COUNT(
        CASE 
            WHEN order_status = 'Completed' 
            THEN order_id 
        END
    ) AS completed_orders,

    COUNT(
        CASE 
            WHEN order_status = 'Cancelled' 
            THEN order_id 
        END
    ) AS cancelled_orders
FROM orders
GROUP BY store_id;
-- Q4 Display "No Promotion" instead of NULL.
SELECT order_id, IFNULL(promotion_id, 'No Promotion') AS promotion
FROM orders;
-- Q5 Replace NULL values using COALESCE()
SELECT order_id, 
COALESCE(promotion_id, 0) AS promotion_id 
FROM orders;
-- Q6 Display employee information with missing designation handling
SELECT employee_name,
COALESCE(designation,'Not Assigned')  AS designation
FROM employees;
-- Q7 Find employee experience in years
SELECT employee_name, hire_date,
TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS experience_years
FROM employees;
-- Q8 Find orders between two dates
SELECT order_id, order_date, total_amount  FROM orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-02-01';
-- Q9 Calculate days between order date and current date
SELECT order_id, order_date,
DATEDIFF(CURDATE(), order_date) AS days_passed
FROM orders;
-- Q10 Find number of orders per year and month
SELECT YEAR(order_date) AS year,
	MONTH(order_date) AS month,
	COUNT(order_id) AS total_orders
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
