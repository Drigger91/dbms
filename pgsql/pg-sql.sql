-- Create a table
CREATE TABLE cities(
	name varchar(50),
	country varchar(50),
	population INTEGER,
	area INTEGER
);

INSERT INTO cities VALUES ('Tokyo', 'Japan', 384504000, 8832);

INSERT INTO cities VALUES
('Delhi', 'India', 224504000, 8872),
('Shaghai', 'China', 204504000, 8892),
('Sao Paolo', 'Brazil', 174504000, 8802);

SELECT * FROM cities;
SELECT name, country from cities;

-- Manipulate data while quering the db

SELECT name, population / area as population_density FROM cities;
-- join string

SELECT name || ', ' || country as joint_string_name FROM cities;

SELECT CONCAT(UPPER(name), ', 1 ', LOWER(country)) as joint_string_name FROM cities;

-- get length of a string

SELECT name, LENGTH(name) as name_length FROM cities;


-- WHERE clause example : 

SELECT name FROM cities WHERE LENGTH(name) > 5;

SELECT name, area FROM cities WHERE cities.area > 8802;

SELECT name, country FROM cities WHERE (population / area) > 20000;


-- Update data

UPDATE cities SET population = (39 * 1000000) WHERE name = 'Tokyo';

UPDATE cities SET population = (population / 10) WHERE name != 'Tokyo';

SELECT * from cities;

INSERT into cities VALUES ('temp_city', 'temp_country', 100, 100);

DELETE FROM cities WHERE name = 'temp_city'

SELECT * from cities;

