create database ORG;
SHOW DATABASES;
USE ORG;
create table Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY auto_increment,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(8),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
('John', 'Doe', 50000, '2023-01-15 09:00:00', 'IT'),
('Jane', 'Smith', 60000, '2022-05-20 10:30:00', 'HR'),
('Michael', 'Johnson', 55000, '2023-11-10 08:45:00', 'Finance'),
('Emily', 'Brown', 48000, '2024-02-05 11:15:00', 'Marketing'),
('David', 'Wilson', 52000, '2023-08-25 09:30:00', 'IT'),
('Sarah', 'Taylor', 58000, '2022-09-30 08:00:00', 'Finance'),
('Matthew', 'Anderson', 51000, '2023-03-12 10:45:00', 'HR'),
('Jessica', 'Martinez', 54000, '2023-07-18 11:00:00', 'Marketing'),
('Christopher', 'Hernandez', 59000, '2022-12-08 09:15:00', 'IT'),
('Amanda', 'Garcia', 47000, '2024-01-22 08:30:00', 'HR');

-- Insert without specifying column names

insert into Worker values 
(15, 'Sarah', 'Namdev', 158000, '2022-09-30 08:00:00', 'Finance');

SELECT * FROM Worker;

CREATE TABLE Bonus(
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(8),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) 
    REFERENCES Worker(WORKER_ID) 
    ON DELETE CASCADE
);
INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES 
(1, 2000, '2024-03-15 09:00:00'),
(2, 2500, '2024-03-20 10:30:00'),
(3, 2300, '2024-03-10 08:45:00'),
(4, 1800, '2024-03-05 11:15:00'),
(5, 2100, '2024-03-25 09:30:00'),
(6, 2700, '2024-03-30 08:00:00'),
(7, 2200, '2024-03-12 10:45:00'),
(8, 2400, '2024-03-18 11:00:00'),
(9, 2600, '2024-03-08 09:15:00'),
(10, 1900, '2024-03-22 08:30:00');

select * from Bonus;

CREATE TABLE Title(
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) 
    REFERENCES Worker(WORKER_ID) 
    ON DELETE CASCADE
);	
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES 
(1, 'Senior Developer', '2024-01-01 00:00:00'),
(2, 'HR Manager', '2024-01-01 00:00:00'),
(3, 'Financial Analyst', '2024-01-01 00:00:00'),
(4, 'Marketing Specialist', '2024-01-01 00:00:00'),
(5, 'Junior Developer', '2024-01-01 00:00:00'),
(6, 'Senior Financial Analyst', '2024-01-01 00:00:00'),
(7, 'HR Assistant', '2024-01-01 00:00:00'),
(8, 'Marketing Manager', '2024-01-01 00:00:00'),
(9, 'Lead Developer', '2024-01-01 00:00:00'),
(10, 'HR Coordinator', '2024-01-01 00:00:00');

select * from Title;

select FIRST_NAME as name from Worker where FIRST_NAME > 'JOHM'; 

-- Or statement simplified

select FIRST_NAME as name from Worker where FIRST_NAME in ('JOHN', 'EMILY');

-- Not statement 
select FIRST_NAME as name from Worker where FIRST_NAME not in ('JOHN', 'Emily');

-- pattern searching WildCard () % - any number of characters, _ --> only one character


-- this query will act as --anynumberofchars--l--anynumberofchars

SELECT FIRST_NAME as name from Worker where FIRST_NAME LIKE '%l%';

-- this query will act as '--anynumberofchars--l'

SELECT FIRST_NAME as name from Worker where FIRST_NAME LIKE '%l';

-- this query will give results where second char is 'h'

SELECT FIRST_NAME as name from Worker where FIRST_NAME LIKE '_h%';

--REGEX SELECTION
--name ending with vowels
select distinct city from station where city REGEXP '[aeiou]$'

--name starting with vowels
select distinct city from station where city REGEXP '^[aeiou]'

-- Sorting

select SALARY from Worker ORDER BY SALARY asc;

-- Distinct keyword

SELECT DISTINCT DEPARTMENT from Worker;

-- group by, aggregation function should be used while using group by otherwise it'll act as distinct

SELECT department from Worker GROUP BY department;

SELECT department, count(*) from Worker GROUP BY department;

-- Order By

SELECT * from Worker ORDER BY department;

-- Having. Having should only be used in case where group by is getting used. 

SELECT first_name, last_name, SALARY from Worker 
where department in 
(SELECT department from Worker GROUP BY department HAVING Avg(SALARY) > 55000 and count(department) > 2)

-- conditional aggegration

SELECT first_name, last_name, salary, department from Worker 
where department in 
(SELECT department from Worker GROUP BY department HAVING avg(salary) > 55000 and count(department) > 2)

