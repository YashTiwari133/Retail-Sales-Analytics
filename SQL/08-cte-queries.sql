-- Q1 Display employees earning above the average salary
WITH avg_salary AS
(
    SELECT AVG(salary) AS avg_sal
    FROM employees
)
SELECT
    employee_name,
    salary
FROM employees
WHERE salary >
(
    SELECT avg_sal
    FROM avg_salary
);
-- Q2 Find stores with sales above average
WITH store_sales AS
(
    SELECT
        store_id,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY store_id
)
SELECT
    store_id,
    total_sales
FROM store_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM store_sales
);
-- Q3 Find the highest-paid employee in each store
WITH highest_salary AS
(
    SELECT
        store_id,
        MAX(salary) AS max_salary
    FROM employees
    GROUP BY store_id
)
SELECT
    e.employee_name,
    e.store_id,
    e.salary
FROM employees e
JOIN highest_salary h
ON e.store_id = h.store_id
AND e.salary = h.max_salary;
-- Q4 Display total quantity sold for each product
WITH product_sales AS
(
    SELECT
        product_id,
        SUM(quantity) AS total_quantity
    FROM order_items
    GROUP BY product_id
)
SELECT * FROM product_sales;
-- Q5 Find products sold more than 10 units
WITH product_sales AS
(
    SELECT
        product_id,
        SUM(quantity) AS total_quantity
    FROM order_items
    GROUP BY product_id
)
SELECT product_id, total_quantity FROM product_sales
WHERE total_quantity > 10;
-- Q6 Calculate revenue for each product
WITH product_revenue AS
(
    SELECT
        product_id,
        SUM((quantity * unit_price) - discount) AS revenue
    FROM order_items
    GROUP BY product_id
)
SELECT * FROM product_revenue;
-- Q7 Find completed orders only
WITH completed_orders AS
(
    SELECT *
    FROM orders
    WHERE order_status = 'Completed'
)
SELECT * FROM completed_orders;
-- Q8 Find average salary by designation
WITH designation_salary AS
(
    SELECT
        designation,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY designation
)
SELECT * FROM designation_salary;
-- Q9 Find employees earning above their designation average
WITH designation_avg AS
(
    SELECT
        designation,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY designation
)
SELECT e.employee_name, e.designation, e.salary
FROM employees e
JOIN designation_avg d
ON e.designation = d.designation
WHERE e.salary > d.avg_salary;
-- Q10 Calculate total sales for each store
WITH store_sales AS
(
    SELECT
        store_id,
        SUM(total_amount) AS total_sales
    FROM orders
    WHERE order_status = 'Completed'
    GROUP BY store_id
)
SELECT store_id, total_sales FROM store_sales;
-- Q10 Display store name along with total completed sales
WITH store_sales AS
(
    SELECT
        store_id,
        SUM(total_amount) AS total_sales
    FROM orders
    WHERE order_status = 'Completed'
    GROUP BY store_id
)
SELECT s.store_name, ss.total_sales
FROM stores s
JOIN store_sales ss
ON s.store_id = ss.store_id;
-- Q11 Display employee name and store name
WITH employee_store AS
(
    SELECT
        employee_name,
        store_id
    FROM employees
)
SELECT es.employee_name, s.store_name
FROM employee_store es
JOIN stores s
ON es.store_id = s.store_id;
-- Q12 Find the salary rank of every employee
WITH employee_rank AS
(
    SELECT
        employee_name,
        designation,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT * FROM employee_rank;
