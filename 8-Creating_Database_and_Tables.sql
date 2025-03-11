-- -- -- 2. Data types
-- -- -- 
-- -- -- Boolean
-- -- -- -- True or False
-- -- -- Character 
-- -- -- -- char, varchar, and text 
-- -- -- Numeric 
-- -- -- -- integer and floating-point number 
-- -- -- Temporal 
-- -- -- -- date, time, timestamp, and interval 

-- Not as common ones 

-- -- -- UUID 
-- -- -- -- Universal Unique Identifiers 
-- -- -- Array 
-- -- -- -- Stores an array of strings, numbers, etc.
-- -- -- JSON 
-- -- -- Hstore key-value pair 
-- -- -- Special types such as network address and geometric data.

-- -- -- When creating databases and tables, you 
-- -- -- should carefully consider which data types 
-- -- -- should be used for the data to be stored.
-- 
-- -- -- Review the documentation to see 
-- -- -- limitations of data types:
-- postgresql.org/docs/current/datatype.html

-- For example
-- -- Imagine we want to store a phone ...

-- -- -- 3. Primary Keys and Foreign Keys
-- -- -- 

SELECT * FROM payment

-- -- -- 4. Constraints

-- -- -- Constraints are the rules enforced ...

-- -- -- Constraints can be divided ...

-- -- -- The most common constraints used: 
-- -- -- -- NOT NULL Constraint 
-- -- -- -- -- Ensures that a column cannot have 
-- -- -- -- -- NULL value.
-- ...

-- -- -- Primary Key
-- -- -- -- Unique identifies ...

-- -- -- Check Constraint 
-- -- -- -- Ensures that all values in a column 
-- -- -- -- ...

-- -- -- The most common constraints used:
-- -- -- -- ...

-- -- -- Table Constraints 
-- -- -- -- CHECK (condition) 
-- -- -- -- -- to check ...

-- -- -- Table Constraints 
-- -- -- -- UNIQUE(column_list)
-- -- -- -- -- forcers the values stored in the columns ...

-- -- -- Now that we understand data type,
-- -- -- primary keys, foreign keys, and constraints ... 

-- -- -- 

-- -- -- 5. CREATE Table
-- 

-- -- -- Full General Syntax 
-- -- -- -- CREATE TABLE table_name (
-- -- -- -- -- column_name TYPE column_constraint,
-- -- -- -- -- column_name TYPE column_constraint,
-- -- -- -- -- );

-- -- -- SERIAL 
-- -- -- -- ...

-- -- -- It will create a sequence object and set 
-- -- -- the next value generated by the ...

-- -- -- If a row is later removed, the column with 
-- -- -- the SERIAL data type will not adjust,
-- -- -- marking the fact that a row was removed 
-- -- -- from the sequence ...

-- -- -- Example Syntax 
-- -- -- -- CREATE TABLE players(
-- -- -- -- player_id SERIAL PRIMARY KEY,
-- -- -- -- age ...)

-- -- -- 5. CREATE Table

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
)

-- -- -- 

CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	create_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)

-- -- -- 

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)

-- -- -- 

-- -- -- 6. INSERT

-- -- -- INSERT allows you to add in rows to a table.
-- ... 

-- Keep in mind, the inserted row values must 
-- match up for the ...

INSERT INTO account(username,password,email,create_on)
VALUES
('Jose','password','jose@mail.com',CURRENT_TIMESTAMP)

--

SELECT * FROM account 

--

INSERT INTO job(job_name)
VALUES
('Astronaut')

-- 

SELECT * FROM job

--

INSERT INTO job(job_name)
VALUES
('President')

--

SELECT * FROM job

--

INSERT INTO account_job(user_id,job_id,hire_date)
VALUES 
(1,1,CURRENT_TIMESTAMP)

--

SELECT * FROM account_job

--

INSERT INTO account_job(user_id,job_id,hire_date)
VALUES 
(10,10,CURRENT_TIMESTAMP)

-- -- -- 

-- -- -- 7. Update

-- -- -- 

SELECT * FROM account

-- -- -- 

UPDATE account 
SET last_login = created_on

-- -- -- 

SELECT * FROM account

-- -- -- 

SELECT * FROM job

--

SELECT * FROM account_job

-- 

UPDATE account_job
SET hire_date = account.create_on 
FROM account
WHERE account_job.user_id = account.user_id

--

SELECT * FROM account_job

--

SELECT * FROM account

--

UPDATE account_job 
SET hire_date = account.created_on
FROM account 
WHERE account_job.user_id = account.user_id

--

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email,created_on,last_login

--