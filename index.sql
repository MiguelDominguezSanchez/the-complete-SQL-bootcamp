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