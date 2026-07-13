-- Q1 Display all customers from customers table
SELECT * FROM customers;

-- Q2 Display only customer name and city
SELECT first_name, last_name, city FROM customers;

-- Q3 Find all unique cities where customers are located
SELECT DISTINCT city FROM customers;

-- Q4 Display all completed orders
SELECT * FROM orders
WHERE order_status = 'Completed';

-- Q5 Find employees with salary greater than 50000
SELECT employee_name,designation,salary FROM employees
WHERE salary>50000;

-- Q6 Sort employees by highest salary
SELECT employee_name, designation, salary FROM employees
ORDER BY salary DESC;

-- Q7 Display top 5 highest-paid employees
SELECT employee_name, designation, salary FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Q8 Find orders paid using UPI
SELECT order_id, customer_id, total_amount FROM orders
WHERE payment_method = 'UPI';

-- Q9 Find employees who are Sales Executive and have salary greater than 30000
SELECT employee_name, designation, salary FROM employees
WHERE designation = 'Sales Executive' AND salary > 30000;

-- Q10 Find employees who are either Store Manager or Inventory Manager
SELECT employee_name, designation, salary FROM employees
WHERE designation = 'Store Manager' OR designation = 'Inventory Manager';

-- Q11 Find products with selling price between 1000 and 5000
SELECT product_name, selling_price FROM products
WHERE selling_price BETWEEN 1000 AND 5000;

-- Q12 Find customers from Bhopal, Delhi, or Mumbai
SELECT first_name, last_name, city FROM customers
WHERE city IN ('Bhopal', 'Delhi', 'Mumbai');

-- Q13 Display products where category_id is 1, 2, or 3
SELECT product_name, category_id FROM products
WHERE category_id IN (1,2,3);

-- Q14 Find customers whose first name starts with 'A'
SELECT * FROM customers
WHERE first_name LIKE 'A%';

-- Q15 Find employees whose name contains 'Sharma'
SELECT * FROM employees
WHERE employee_name LIKE '%Sharma%';

-- Q16 Find orders without promotion
SELECT * FROM orders
WHERE promotion_id IS NULL;

-- Q17 Display orders placed after 1 May 2026
SELECT order_id, order_date, total_amount FROM orders
WHERE order_date > '2026-05-01';

-- Q18 Display product name and selling price column as product_price
SELECT product_name, selling_price AS product_price FROM products;

-- Q19 Calculate discounted selling price of products by reducing 10%
SELECT product_name, selling_price, selling_price - (selling_price * 0.10) AS discounted_price FROM products;

-- Q20 Display full customer names
SELECT CONCAT(first_name, ' ', last_name) AS full_name, city FROM customers;

-- Q21 Convert employee names to uppercase
SELECT UPPER(employee_name) AS employee_name FROM employees;

-- Q22 Find number of characters in customer names
 SELECT first_name, CHAR_LENGTH(first_name) AS number_of_characters FROM customers;

-- Q23 Display employee joining year
 SELECT employee_name, YEAR(hire_date) AS joining_year FROM employees;
 
-- Q24 Display employees hired after 1 January 2025
SELECT employee_name, hire_date FROM employees
WHERE hire_date > '2025-01-01';

-- Q25 Find completed orders paid using UPI with amount greater than 10000
SELECT order_id, payment_method, total_amount FROM orders
WHERE order_status = 'Completed' AND payment_method = 'UPI' AND total_amount > 10000;

-- Q26 Sort employees by designation and then salary
SELECT employee_name, designation, salary FROM employees
ORDER BY designation ASC, salary DESC; 
