-- Q1 Find employees earning more than the average salary
SELECT employee_name, designation, salary
FROM employees
WHERE salary >(SELECT AVG(salary) FROM employees );
-- Q2 Find products priced above the average product price
SELECT product_name, selling_price
FROM products
WHERE selling_price > (SELECT AVG(selling_price) FROM products);
-- Q3 Find employees with the highest salary
SELECT employee_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
-- Q4 Find products supplied by "TechWorld Suppliers"
SELECT product_name FROM products
WHERE supplier_id = (SELECT supplier_id FROM suppliers WHERE supplier_name = 'TechWorld Suppliers');
-- Q5 Find products belonging to the "Electronics" category
SELECT product_name, price FROM products
WHERE category_id = (SELECT category_id FROM categories WHERE category_name = 'Electronics');
-- Q6 Find orders whose total amount is greater than the average order amount
SELECT order_id, total_amount FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);
-- Q7 Find employees working in the same store as "Yash Tiwari"
SELECT employee_name, store_id FROM employees
WHERE store_id = (SELECT store_id FROM employees WHERE employee_name = 'Yash Tiwari');
-- Q8 Find customers who have placed orders
SELECT customer_id, first_name, last_name FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);
-- Q9 Find customers who have never placed an order
SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);
-- Q10 Find products that have been ordered
SELECT product_id, product_name FROM products
WHERE product_id IN (SELECT product_id FROM order_items);
-- Q11 Find employees earning more than the average salary of their designation
SELECT e1.employee_name, e1.designation, e1.salary
FROM employees e1
WHERE e1.salary >
(
	SELECT AVG(e2.salary) 
    FROM employees e2 
    WHERE e2.designation = e1.designation
);
-- Q12 Find the highest-paid employee in each store
SELECT employee_name, store_id, salary FROM employees e1
WHERE salary =
(
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.store_id = e1.store_id
);
-- Q13 Find the most expensive product in each category
SELECT product_name, category_id, price
FROM products p1
WHERE price =
(
	SELECT MAX(p2.price)
    FROM products p2
    WHERE p2.category_id = p1.category_id
);
-- Q14 Find customers whose total spending is above the average customer spending
SELECT
    customer_id,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) >
(
    SELECT AVG(total_spent)
    FROM
    (
        SELECT
            customer_id,
            SUM(total_amount) AS total_spent
        FROM orders
        GROUP BY customer_id
    ) AS customer_totals
);
-- Q15 Find customers who have placed at least one order
SELECT
    customer_id,
    first_name,
    last_name
FROM customers c
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
-- Q16 Find customers who have never placed an order
SELECT
    customer_id,
    first_name,
    last_name
FROM customers c
WHERE NOT EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
-- Q17 Find products that have never been ordered
SELECT
    product_id,
    product_name
FROM products p
WHERE NOT EXISTS
(
    SELECT 1
    FROM order_items oi
    WHERE oi.product_id = p.product_id
);
-- Q18 Find employees who handled at least one order
SELECT
    employee_id,
    employee_name
FROM employees e
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.employee_id = e.employee_id
);
-- Q19 Find stores that have at least one completed order
SELECT
    store_id,
    store_name
FROM stores s
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.store_id = s.store_id
      AND o.order_status = 'Completed'
);
