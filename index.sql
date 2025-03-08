-- SQL Statement Fundamentals
-- SELECT
-- -- SELECT column_name FROM table_name
SELECT * FROM actor;
SELECT first_name FROM actor;
SELECT first_name,last_name FROM actor;
SELECT last_name,first_name FROM actor;
select last_name,first_name from actor;
SELECT last_name,first_name FROM actor;
SELECT * FROM city;
-- 5. Challenge SELECT
-- Challenge Structures
-- -- Business Situation
-- -- -- We want to spend out a promotional email to our exiting customers!
-- -- Challenge question
-- -- Expected Answer
-- -- Hints
-- -- -- Use the customer table
-- -- -- You can use the table drop-down to view what columns are available
-- -- -- You could also use SELECT * FROM customer to see all the columns.
-- -- Solution
SELECT first_name,last_name,email FROM customer;

-- 6. SELECT DISTINCT
-- -- Sometimes a table contains a column that has duplicate values,
-- -- and you may find yourself in a situation where you only 
-- -- want to list the unique/distinct values.
--
-- -- The DISTINCT keyword can be used to
-- -- return only the distinct values in a column.
--
-- -- The DISTINCT keyword operates 'on' a column.
-- -- The syntax looks like this:
SELECT DISTINCT column FROM table;
-- -- It will work with or without parenthesis.
-- -- Later on when we learn about adding more
-- -- calls such as COUNT and DISTINCT 
-- -- together, the parenthesis will be necessary.
SELECT * FROM film;
SELECT DISTINCT release_year FROM film;
SELECT DISTINCT (release_year) FROM film;
SELECT DISTINCT (rental_rate) FROM film;
--

-- 7. Challenge SELECT DISTINCT 
-- -- Situation
-- -- -- An Australian visitor isn't familiar with
-- -- -- MPAA movie ratings (e.g PG, PG-13, R, etc...)
-- 
-- -- -- We want to know the types of ratings 
-- -- -- we have in our database.
--
-- -- -- What ratings do we have available?

-- SQL Challenge
-- -- Use what you`ve learned about SELECT DISTINCT
-- -- to retrieve the distinct rating
-- -- types our fims could have in our database.

-- Hints
-- -- Use the film table
-- -- Use SELECT * FROM film; 
-- -- to see what columns are available.
-- -- Or use drop down table menu in pgadmin.

-- Solution
SELECT DISTINCT rating FROM film;

-- 8. COUNT
-- -- The COUNT function returns the number of inputs rows 
-- -- that match a specific condition of a query.
-- 
-- -- We can apply COUNT on a specific column
-- -- or just pass COUNT(*), we will soon see 
-- -- this should return the samen result.

-- SELECT COUNT(name) FROM table;
-- SELECT COUNT(DISTINCT(name)) FROM table;

SELECT * FROM payment;
SELECT COUNT(*) FROM payment;
SELECT COUNT(amount) FROM payment;
SELECT amount FROM payment;
SELECT DISTINCT amount FROM payment;
SELECT COUNT (DISTINCT amount) FROM payment;
SELECT COUNT (DISTINCT (amount)) FROM payment;