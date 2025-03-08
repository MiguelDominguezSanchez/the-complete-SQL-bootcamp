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