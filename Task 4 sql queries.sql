select*from employee_data2
-- 1. List all employees in the 'IT' department, ordered by salary descending
SELECT employee_id, first_name, last_name, department, salary
FROM employee_data2
WHERE department = 'IT'
ORDER BY salary DESC;

-- 2. Count employees per department
SELECT department, COUNT(*) AS total_employees
FROM employee_data2
GROUP BY department;


-- Employees earning more than the average salary
SELECT employee_id, first_name, last_name, salary
FROM employee_data2
WHERE salary > (
    SELECT AVG(salary) FROM employee_data2
);


-- Total and average salary per department
SELECT department, SUM(salary) AS total_salary, AVG(salary) AS avg_salary
FROM employee_data2
GROUP BY department;



-- View for high earning employees
CREATE VIEW high_earners AS
SELECT employee_id, first_name, last_name, department, salary
FROM employee_data2
WHERE salary > 70000;



-- Create index on department for faster filtering
CREATE INDEX idx_department ON employee_data2(department);

-- Create index on salary for faster salary comparisons
CREATE INDEX idx_salary ON employee_data(salary);
select*from employee_data2


-- 1
SELECT *
FROM employee_data2
WHERE joining_date > '2023-01-01'
ORDER BY joining_date DESC;



-- 2
SELECT *
FROM employee_data2
WHERE department = 'Operations'
  AND salary > 60000
ORDER BY salary DESC;


-- 3
SELECT department, COUNT(*) AS total_employees
FROM employee_data2
GROUP BY department;

-- 4
SELECT department, AVG(salary) AS avg_salary
FROM employee_data
GROUP BY department;

-- 5
SELECT YEAR(order_date) AS order_year, SUM(total_amount) AS total_sales
FROM orders
GROUP BY YEAR(order_date);



-- Create Employee Table
CREATE TABLE employee_data (
    employee_id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    department NVARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    age INT
);

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2)
);
select*from orders


--INNER JOIN — Employees with Orders--
SELECT e.employee_id, e.first_name, e.last_name, e.department,
       o.order_id, o.order_date, o.total_amount
FROM employee_data2 e
INNER JOIN orders o
    ON e.employee_id =employee_id;


-- LEFT JOIN — All Employees (Orders if Available--
SELECT e.employee_id, e.first_name, e.last_name, e.department,
       o.order_id, o.total_amount
FROM employee_data2 e
LEFT JOIN orders o
    ON e.employee_id = employee_id;

--right join--
SELECT o.order_id, o.total_amount, o.order_date,
       e.first_name, e.last_name, e.department
FROM orders o
RIGHT JOIN employee_data2 e
    ON employee_id = employee_id;


---SELF JOIN — Employees in the Same Department--
SELECT e1.first_name AS emp1, e2.first_name AS emp2, e1.department
FROM employee_data2 e1
JOIN employee_data2 e2
    ON e1.department = e2.department
   AND e1.employee_id <> e2.employee_id;









