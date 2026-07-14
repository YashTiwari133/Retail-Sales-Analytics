-- Q1 Assign a row number to every employee
SELECT employee_id, employee_name, designation, salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;
-- Q2 Rank employees by salary
SELECT employee_id, employee_name, salary,
    RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;
-- Q3 Rank employees within each designation
SELECT employee_name, designation, salary,
    RANK() OVER(PARTITION BY designation ORDER BY salary DESC) AS designation_rank
FROM employees;
-- Q4 Compare ROW_NUMBER(), RANK(), and DENSE_RANK()
SELECT employee_name, salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num,
    RANK() OVER(ORDER BY salary DESC) AS rank_num,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM employees;
-- Q5 Show each employee along with the salary of the previous employee (ordered by salary).
SELECT employee_name, salary,
    LAG(salary) OVER(ORDER BY salary) AS previous_salary
FROM employees;
-- Q6 Next employee's salary
SELECT employee_name, salary,
    LEAD(salary) OVER(ORDER BY salary) AS next_salary
FROM employees;
-- Q7 Running Total of Employee Salaries
SELECT employee_name, salary,
    SUM(salary) OVER(ORDER BY employee_id) AS running_total
FROM employees;
-- Q8 Average Salary by Designation
SELECT employee_name, designation, salary,
    ROUND(AVG(salary) OVER(PARTITION BY designation),2) AS avg_designation_salary
FROM employees;
-- Q9 Highest Salary in Each Store
SELECT employee_name, store_id, salary,
    MAX(salary) OVER(PARTITION BY store_id) AS highest_store_salary
FROM employees;
-- Q10 Find the highest paid employee in each designation using FIRST_VALUE()
SELECT employee_name, designation, salary,
    FIRST_VALUE(employee_name) OVER(PARTITION BY designation ORDER BY salary DESC) AS highest_paid_employee
FROM employees;
-- Q11 Find lowest salary employee in each designation using LAST_VALUE()
SELECT employee_name, designation, salary,
LAST_VALUE(employee_name) OVER(PARTITION BY designation ORDER BY salary DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lowest_paid_employee
FROM employees;
-- Q12 Divide employees into salary groups using NTILE()
SELECT employee_name, salary, NTILE(4) OVER(ORDER BY salary DESC) AS salary_group
FROM employees;
-- Q13 Compare employee salary with store average salary
SELECT employee_name, store_id, salary,
    ROUND(AVG(salary) OVER(PARTITION BY store_id),2) AS store_avg_salary,
	ROUND(salary - AVG(salary) OVER(PARTITION BY store_id),2) AS salary_difference
FROM employees;
-- Q14 Running total of store sales
SELECT store_id, order_id, order_date, total_amount,
SUM(total_amount) OVER(
        PARTITION BY store_id
        ORDER BY order_date
    ) AS running_sales
FROM orders
WHERE order_status = 'Completed';
-- Q15 Find difference between current and previous order amount
SELECT order_id, order_date, total_amount,
LAG(total_amount) OVER(
        ORDER BY order_date
    ) AS previous_order_amount,
total_amount -
    LAG(total_amount) OVER(
        ORDER BY order_date
    ) AS amount_difference
FROM orders;
-- Q16 Find top 3 highest-value orders
SELECT order_id, customer_id, total_amount,
DENSE_RANK() OVER(ORDER BY total_amount DESC) AS 'rank'
FROM orders
WHERE 'rank' <=3;
