-- Q1 Display each order along with the customer's name
SELECT o.order_id, c.first_name, c.last_name, o.order_date, o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- Q2 Display each order with the employee who handled it
SELECT o.order_id, e.employee_name, e.designation, o.total_amount
FROM orders o
INNER JOIN employees e
ON o.employee_id = e.employee_id
ORDER BY order_id;

-- Q3 Display each order with its store name
SELECT o.order_id, s.store_name, o.order_date, o.total_amount
FROM orders o
INNER JOIN stores s
ON o.store_id = s.store_id
ORDER BY order_id;

-- Q4 Display every product with its category
SELECT p.product_name, c.category_name
FROM products p
INNER JOIN categories c
ON p.category_id = c.category_id;

-- Q5 Display every product with its supplier
SELECT p.product_name, s.supplier_name
FROM products p
INNER JOIN suppliers s
ON p.supplier_id = s.supplier_id;

-- Q6 Display order items along with product names
SELECT oi.order_item_id, p.product_name, oi.quantity, oi.unit_price
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id
ORDER BY order_item_id;

-- Q7 Display orders with promotion names
SELECT o.order_id, p.promotion_name, p.discount_percent, o.total_amount
FROM orders o
INNER JOIN promotions p
ON o.promotion_id = p.promotion_id
ORDER BY order_id;

-- Q8 Display employee name along with the store they work in
SELECT e.employee_name, s.store_name, e.designation
FROM employees e
INNER JOIN stores s
ON e.store_id = s.store_id;

-- Q9 Display customer names and their orders
SELECT c.first_name, c.last_name, o.order_id, o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- Q10 Display products purchased in each order
SELECT oi.order_id, p.product_name, oi.quantity, oi.unit_price
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id
ORDER BY order_id;

-- Q11 Display all customers and their orders
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.total_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Q12 Display all stores and employees
SELECT s.store_name, e.employee_name, e.designation
FROM stores s
LEFT JOIN employees e
ON s.store_id = e.store_id;

-- Q13 Display all promotions and the orders that used them
SELECT p.promotion_name, o.order_id, o.total_amount
FROM promotions p
LEFT JOIN orders o
ON p.promotion_id = o.promotion_id
ORDER BY order_id; 

-- Q14 Find customers who have never placed an order
SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q15 Find promotions that were never used
SELECT p.promotion_name
FROM promotions p
LEFT JOIN orders o
ON p.promotion_id = o.promotion_id
WHERE o.order_id IS NULL;

-- Q16 Generate every store–promotion combination
SELECT s.store_name, p.promotion_name
FROM stores s
CROSS JOIN promotions p;

-- Q17 Display completed orders with customer names
SELECT o.order_id, c.first_name, c.last_name, o.total_amount
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_status = 'Completed';

-- Q18 Display Store Managers with their store names
SELECT e.employee_name, s.store_name, e.salary
FROM employees e
JOIN stores s
ON e.store_id = s.store_id
WHERE e.designation = 'Store Manager';

-- Q19 Display order details with customer, employee, and store information
SELECT o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    e.employee_name, s.store_name, o.order_date, o.total_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN employees e
    ON o.employee_id = e.employee_id
JOIN stores s
    ON o.store_id = s.store_id;

-- Q20 Display order items with product details
SELECT oi.order_id, p.product_name, oi.quantity, oi.unit_price, oi.discount
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id;

-- Q21 Display product, category, and supplier details
SELECT p.product_name, c.category_name, s.supplier_name, p.selling_price
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN suppliers s
    ON p.supplier_id = s.supplier_id;

-- Q22 Display orders with promotion details
SELECT o.order_id, pr.promotion_name, pr.discount_percent, o.total_amount
FROM orders o
LEFT JOIN promotions pr
    ON o.promotion_id = pr.promotion_id;

-- Q23 Display employee and store location
SELECT e.employee_name, e.designation, s.store_name, s.city, s.state
FROM employees e
JOIN stores s
    ON e.store_id = s.store_id;

-- Q24 Display order revenue before discount
SELECT oi.order_id, p.product_name,
    (oi.quantity * oi.unit_price) AS gross_amount,
    oi.discount,
    ((oi.quantity * oi.unit_price) - oi.discount) AS net_amount
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id;

-- Q25 Display products sold with category
SELECT oi.order_id, p.product_name, c.category_name, oi.quantity
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id;
