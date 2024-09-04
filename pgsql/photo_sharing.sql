-- Photo Sharing application database

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(50),
	email VARCHAR(50)
	CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z]{2,}$')
);

-- this is case insensititve regex matching (~*)
-- serial is auto increment int of pgsql


INSERT INTO users (username, email)

VALUES 

	('piyusht29', 'piyush@example.com'),
	('rishika30', 'rishika@example.com'),
	('mayank307', 'mayank@example.com'),
	('swapnil', 'swappyboi619@example.com'),
	('zaid2808', 'zaid@example.com');

SELECT * from users;

-- trying to add invalid email value

INSERT INTO users (username, email) VALUES ('invalid', 'invalid');

-- error message: 
-- new row for relation "users" violates check constraint "users_email_check"
