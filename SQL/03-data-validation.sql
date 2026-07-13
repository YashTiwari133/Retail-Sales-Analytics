-- Checking that all data from csv file is successfully imported in our table by counting number of rows of each table

SELECT COUNT(*) AS total_entries_categories
FROM categories;
SELECT COUNT(*) AS total_entries_suppliers
FROM suppliers;
SELECT COUNT(*) AS total_entries_stores
FROM stores;
SELECT COUNT(*) AS total_entries_customers
FROM customers;
SELECT COUNT(*) AS total_entries_employees
FROM employees;
SELECT COUNT(*) AS total_entries_products
FROM products;
SELECT COUNT(*) AS total_entries_promotions
FROM promotions;
SELECT COUNT(*) AS total_entries_orders
FROM orders;
SELECT COUNT(*) AS total_entries_order_items
FROM order_items;
