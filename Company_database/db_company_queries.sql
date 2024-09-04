USE Company;

-- find all employees
SELECT * FROM employee;
-- find all clients
SELECT * FROM client;
-- find all branches
SELECT * FROM branch;
-- find all suppliers;
SELECT * FROM branch_supplier;
-- find who works with whom
SELECT * FROM works_with;

-- order employee by salary
SELECT * from employee ORDER BY salary desc;

-- order by sex then name

SELECT * from employee ORDER by sex, first_name, last_name;

-- find first 2 employee on basis of desc salary

SELECT * from employee ORDER by salary limit 2;

-- change column names

SELECT first_name as name, last_name as surname from employee;

-- distinct keyword

SELECT distinct sex from employee;

-- SQL functions: 

-- find number of employees 
SELECT COUNT(emp_id) from employee;

-- find count of filtered something 
SELECT COUNT(emp_id) from employee WHERE sex = 'female' AND birthday > '1970-01-01';

-- group on basis of a particular field

SELECT COUNT(sex), sex from employee GROUP BY sex;

## WILDCARDS
-- % = any number of characters, _ = one character   

SELECT * from employee WHERE first_name LIKE 'JI%';

SELECT * from employee WHERE first_name LIKE '%J%';

-- % => 0 included.

## UNION operation

SELECT first_name FROM employee
UNION
SELECT branch_name from branch;

-- every select statement should have same number of columns and similar data_type 

## JOINS

-- INNER JOIN

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee 
JOIN branch 
ON employee.emp_id = branch.mgr_id;

-- LEFT JOIN

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee 
LEFT JOIN branch 
ON employee.emp_id = branch.mgr_id;

-- RIGHT JOIN

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee 
RIGHT JOIN branch 
ON employee.emp_id = branch.mgr_id;

## NESTED queries

 -- FIND list of all employees who have sold at least an amount x to a client
 
SELECT employee.emp_id, CONCAT(first_name," ", last_name) as name, total_sales
FROM employee LEFT JOIN works_with 
ON employee.emp_id = works_with.emp_id 
WHERE employee.emp_id 
IN (
	SELECT works_with.emp_id FROM works_with WHERE works_with.total_sales > 1000
);

SELECT client.client_name, client.branch_id 
FROM client
WHERE client.branch_id = (
	SELECT branch.branch_id 
    FROM branch
    WHERE branch.mgr_id = 1
);