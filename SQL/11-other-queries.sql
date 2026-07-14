-- Q1 Create a view showing store-wise employee count
CREATE VIEW store_employee_count AS
SELECT store_id, COUNT(employee_id) AS total_employees
FROM employees
GROUP BY store_id;
-- Retrieving data from view
SELECT * FROM store_employee_count;

-- Q2 Create a view showing Employee name, Designation, Store name, City
CREATE VIEW employee_store_details AS
SELECT e.employee_name, e.designation, s.store_name, s.city
FROM employees e
JOIN stores s
ON e.store_id = s.store_id;
-- Retrieving data from view
SELECT * FROM employee_store_details;

-- Q3 Create a view showing Store ID, Total completed orders, Total sales amount
CREATE VIEW store_sales_summary AS
SELECT store_id,
	COUNT(order_id) AS completed_orders,
	SUM(total_amount) AS total_sales
FROM orders
WHERE order_status = 'Completed'
GROUP BY store_id;
-- Retrieving data from view
SELECT * FROM store_sales_summary;

-- Q4 Create a procedure that returns all employee details.
DELIMITER //
CREATE PROCEDURE get_all_employees()
BEGIN
    SELECT *
    FROM employees;
END //
DELIMITER ;
CALL get_all_employees();

-- Q5 Create a procedure that displays employees of a particular store.
DELIMITER //
CREATE PROCEDURE get_employees_by_store(IN store INT)
BEGIN
    SELECT employee_id,employee_name,designation,salary
	FROM employees
	WHERE store_id = store;
END //
DELIMITER ;
CALL get_employees_by_store(5);

-- Q6 Create a procedure to find total store sales
DELIMITER //
CREATE PROCEDURE store_total_sales(IN store INT)
BEGIN
SELECT store_id, SUM(total_amount) AS total_sales
FROM orders
WHERE store_id = store AND order_status = 'Completed'
GROUP BY store_id;
END //
DELIMITER ;
CALL store_total_sales(10);

-- Q7 Create procedure to find employees above a salary
DELIMITER //
CREATE PROCEDURE employees_above_salary(IN min_salary INT)
BEGIN
	SELECT employee_name, designation, salary
	FROM employees
	WHERE salary > min_salary;
END //
DELIMITER ;
CALL employees_above_salary(50000);

-- Q8 Create a function to return total number of employees
DELIMITER //
CREATE FUNCTION total_employee_count()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE total INT;
	SELECT COUNT(employee_id)
    INTO total
    FROM employees;
	RETURN total;
END //
DELIMITER ;
SELECT total_employee_count();

-- Q9 Transfer money between accounts
START TRANSACTION;
UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 1;
UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 2;
COMMIT;

-- Q10 Remove cancelled orders only if deletion is correct.
START TRANSACTION;
DELETE FROM orders
WHERE order_status = 'Cancelled';
SELECT * FROM orders;
ROLLBACK;

-- Q11 Whenever an employee salary is updated, automatically insert the old and new salary into audit table
DELIMITER //
CREATE TRIGGER salary_update_audit
AFTER UPDATE
ON employees
FOR EACH ROW
BEGIN
	INSERT INTO employee_audit
    (employee_id, old_salary, new_salary)
	VALUES
    (OLD.employee_id, OLD.salary, NEW.salary);
END //
DELIMITER ;

-- Q12 Whenever a new employee is added, automatically convert employee name into uppercase.
DELIMITER //
CREATE TRIGGER employee_name_uppercase
BEFORE INSERT
ON employees
FOR EACH ROW
BEGIN
    SET NEW.employee_name =
    UPPER(NEW.employee_name);
END //
DELIMITER ;

-- Q13 Whenever a new order is placed, automatically create an entry in order history
DELIMITER //
CREATE TRIGGER order_insert_history
AFTER INSERT
ON orders
FOR EACH ROW
BEGIN
INSERT INTO order_history
(order_id,status)
VALUES ( NEW.order_id,'New Order Created');
END //
DELIMITER ;

-- Q14 Before deleting an employee, store the employee details
CREATE TRIGGER employee_delete_backup
BEFORE DELETE
ON employees
FOR EACH ROW
BEGIN
INSERT INTO deleted_employee (employee_id, employee_name)
VALUES (OLD.employee_id, OLD.employee_name)
END //
DELIMITER ;

-- Q15 Create an index on employee name
CREATE INDEX idx_employee_name ON employees(employee_name);

-- Q16 Create a unique index
CREATE UNIQUE INDEX idx_unique_employee_id ON employees(employee_id);

-- Q17 Analyze query performance using EXPLAIN
EXPLAIN
SELECT * FROM employees
WHERE salary > 50000;
