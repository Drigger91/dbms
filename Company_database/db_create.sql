CREATE DATABASE Company;
USE Company;

CREATE TABLE employee (
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    birthday DATE,
    sex VARCHAR(6) NOT NULL check (sex in ('male', 'female', 'others')),
    salary INT,
    super_id INT,
    branch_id INT
);

CREATE TABLE branch(
	branch_id INT PRIMARY KEY,
    branch_name VARCHAR(10),
    branch_code INT,
    mgr_id INT,
    mgr_start_date Date,
    FOREIGN KEY (mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

ALTER TABLE employee 
MODIFY sex VARCHAR(10) 
NOT NULL CHECK (sex IN ('male', 'female', 'others'));

CREATE TABLE client (
	client_id INT PRIMARY KEY,
    client_name VARCHAR (20),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with(
	emp_id INT,
    client_id INT,
    PRIMARY KEY (emp_id, client_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

ALTER TABLE works_with
ADD COLUMN total_sales INT;

##Error Code: 1830. Column 'emp_id' cannot be NOT NULL: needed in a foreign key constraint 'works_with_ibfk_1' SET NULL

CREATE TABLE branch_supplier(
	branch_id INT,
    supplier_name VARCHAR(15),
    supply_type VARCHAR(25),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE,
    PRIMARY KEY (branch_id, supplier_name)
);


INSERT INTO employee (emp_id, first_name, last_name, birthday, sex, salary, super_id, branch_id) VALUES
(1, 'John', 'Doe', '1980-01-01', 'male', 50000, NULL, NULL),
(2, 'Jane', 'Doe', '1985-02-01', 'female', 60000, 1, NULL),
(3, 'Jim', 'Beam', '1990-03-01', 'male', 55000, 1, NULL),
(4, 'Jill', 'Smith', '1987-04-01', 'female', 62000, 2, NULL);
INSERT INTO employee (emp_id, first_name, last_name, birthday, sex, salary, super_id, branch_id) VALUES
(100, 'Swapnil', 'Gupta', '1980-01-01', 'male', 50000, NULL, 1),
(200, 'Zaid', 'Hasan', '1985-02-01', 'male', 60000, 100, 1),
(300, 'Mayank', 'Ujawane', '1990-03-01', 'male', 55000, 100, 1),
(400, 'Piyush', 'Tiwari', '1987-04-01', 'male', 62000, 200, 1);

-- Insert dummy data into branch table
INSERT INTO branch (branch_id, branch_name, branch_code, mgr_id, mgr_start_date) VALUES
(1, 'North', 101, 1, '2020-01-01'),
(2, 'South', 102, 2, '2020-02-01'),
(3, 'East', 103, 3, '2020-03-01'),
(4, 'West', 104, 4, '2020-04-01');
##Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`company`.`branch`, CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`mgr_id`) REFERENCES `employee` (`emp_id`) ON DELETE SET NULL)
INSERT INTO branch (branch_id, branch_name, branch_code, mgr_id, mgr_start_date) VALUES
(5, 'Central', 1010, NULL, NULL);

-- Update employee table with branch_id values
UPDATE employee SET branch_id = 1 WHERE emp_id = 1;
UPDATE employee SET branch_id = 2 WHERE emp_id = 2;
UPDATE employee SET branch_id = 3 WHERE emp_id = 3;
UPDATE employee SET branch_id = 4 WHERE emp_id = 4;

-- Create the client table
CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(20),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

-- Insert dummy data into client table
INSERT INTO client (client_id, client_name, branch_id) VALUES
(1, 'Client A', 1),
(2, 'Client B', 2),
(3, 'Client C', 3),
(4, 'Client D', 4);

-- Create the works_with table
CREATE TABLE works_with(
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY (emp_id, client_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- Insert dummy data into works_with table
INSERT INTO works_with (emp_id, client_id, total_sales) VALUES
(1, 1, 1000),
(2, 2, 2000),
(3, 3, 1500),
(4, 4, 2500);

-- Create the branch_supplier table
CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(15),
    supply_type VARCHAR(25),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL,
    PRIMARY KEY (branch_id, supplier_name)
);

-- Insert dummy data into branch_supplier table
INSERT INTO branch_supplier (branch_id, supplier_name, supply_type) VALUES
(1, 'Supplier A', 'Type A'),
(2, 'Supplier B', 'Type B'),
(3, 'Supplier C', 'Type C'),
(4, 'Supplier D', 'Type D');