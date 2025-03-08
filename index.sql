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

--

-- 9. SELECT WHERE - Part One
-- -- SELECT and WHERE are the most fundamental SQL
-- -- statements and you will dfind yourself using them often!
--
-- -- The where statement allows us to specify
-- -- conditions on columns for the rows to be returned.

-- Basic syntax example:
-- -- SELECT column1, column2
-- -- FROM table
-- -- WHERE conditions;

-- -- The WHERE clause appears immediately
-- -- after the FROM clause of the SELECT statement

-- -- The conditions are used to filter the rows
-- -- returned from the SELECT statement.

-- -- PostgreSQL provides a variaty of standard
-- -- operators to construct the conditions.

-- Comparison Operators
-- -- Compare a column value to something.
-- -- -- Is the price greater than $3.00?
-- -- -- Is the pet's name equal to "Sam"

-- -- -- -- = Equal
-- -- -- -- > Greater than
-- -- -- -- < Less than
-- -- -- -- >= Greater than or equal to
-- -- -- -- <= Less than or equal to
-- -- -- -- <> or != Not equal to

-- Logical Operators
-- -- Allow us to combine multiple comparison operators
-- -- -- AND
-- -- -- OR
-- -- -- NOT

-- SELECT name,choice FROM table
-- Now let's get only the people named David

-- SELECT name FROM table 
-- WHERE name = 'DAVID'

-- SELECT name,choice FROM table
-- WHERE name = 'David' AND choice='Red'

-- 10. SELECT WHERE - Part Two
SELECT * FROM customer;

SELECT * FROM customer
WHERE first_name = 'Jared';

SELECT * FROM film;

SELECT * FROM film
WHERE rental_rate > 4;

SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99;

SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

SELECT COUNT(title) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

SELECT COUNT(*) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

SELECT COUNT(*) FROM film
WHERE rating = 'R' OR rating = 'PG-13';

SELECT COUNT(*) FROM film
WHERE rating != 'R';

SELECT * FROM film 
WHERE rating != 'R';

-- 11. Challenge SELECT WHERE
-- -- --  Challenge No. 1
-- -- -- -- A customer forgot thier wallet at our store!
-- -- -- -- We need to track down their email to inform them.
-- -- -- -- What is the email for the customer with 
-- -- -- -- the name Nancy Thomas?

-- -- Hints for Challenge No. 1
-- -- -- Use the customer table
-- -- -- Make sure the capitalization and spelling
-- -- -- of the names si correct
-- -- -- Use single quotes around the 'string'

SELECT email FROM customer 
WHERE first_name = 'Nancy'
AND last_name = 'Thomas'; 

-- -- -- Challenge No. 2
-- -- -- -- A customer wants to know what the 
-- -- -- -- movie "Outlaw Hanky" is about.
-- -- -- -- Could you give them the description for 
-- -- -- -- the movie "Outlaw Hanky"?

-- -- Hints for Challenge No. 2
-- -- -- Use the film table
-- -- -- Make sure the capitalization and spelling 
-- -- -- of the movie name is correct 
-- -- -- Use single quotes around the 'string'

SELECT description FROM film 
WHERE title = 'Outlaw Hanky';

-- -- -- Challenge No. 3
-- -- -- -- A customer is late on their movie return,
-- -- -- -- and we've mailed them a letter to their
-- -- -- -- address at '259 Ipoh Drive'. 
-- -- -- -- We should also call them on the phone to let them know.
-- -- -- -- Can you get the phone number for the
-- -- -- -- customer who lives at '259 Ipoh Drive'? 

-- -- Hints for Challenge No. 3
-- -- -- -- Use the address table
-- -- -- -- Make sure the capitalization and spelling 
-- -- -- -- of the address is correct
-- -- -- -- Use single quotes around the 'string'

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

-- 12. ORDER BY
-- -- -- Basic syntax for ORDER BY
-- -- -- -- SELECT column_1,column_2
-- -- -- -- FROM table
-- -- -- -- ORDER BY column_1 ASC/DESC
-- -- -- -- Use ASC to sort in ascending order 
-- -- -- -- Use DESC to sort in descending order 
-- -- -- -- If you leave it blank, ORDER BY uses ASC by default.

SELECT * FROM customer;

SELECT * FROM customer
ORDER BY first_name ASC;

SELECT * FROM customer
ORDER BY first_name DESC;

SELECT * FROM customer 
ORDER BY store_id;

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id;

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id,first_name;

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id DESC, first_name ASC;

-- 13. LIMIT
-- -- -- The LIMIT command allows us to limit the 
-- -- -- number of rows returned for a query.
-- -- -- Useful for not wanting to return every single row in a table,
-- -- -- but only view the top few rows to get an idea of the table layout.
-- -- -- LIMIT also becomes useful in combination with ORDER BY.
-- -- -- LIMIT goes at the very end of a query
-- -- -- request and is the last command to be executed.
-- -- -- Let's learn the basic syntax of LIMIT
-- -- -- through some examples.

SELECT * FROM payment
ORDER BY payment_date;

SELECT * FROM payment
ORDER BY payment_date ASC;

SELECT * FROM payment
ORDER BY payment_date DESC
LIMIT 5;

SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

SELECT * FROM payment
LIMIT 1;

-- 14. Challenge ORDER BY
-- -- -- Challenge Task
-- -- -- -- We want to reward our first 10 paying customer.
-- -- -- -- What are the customer ids of the first 10 
-- -- -- -- customers who created a payment?

-- -- Hints
-- -- -- Use the payment table
-- -- -- You will need to use both ORDER BY and LIMIT
-- -- -- Remember you may need to specify ASC or DESC.

SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

-- -- -- Challenge Task
-- -- -- -- A customer wants to quickly rent a video to 
-- -- -- -- video to watch over their short lunch break.
-- -- -- -- What are the titles of the 5 shortest (in length of runtime) movies?

-- -- Hints
-- -- -- Use the film table
-- -- -- Take a look the length column
-- -- -- You can use ORDER BY and LIMIT
-- -- -- Remember to use ASC or DESC to get desired results

SELECT title,length FROM film
ORDER BY length ASC
LIMIT 5;

-- -- -- Challenge Task
-- -- -- -- Quick Bonus Question
-- -- -- -- -- If the previous customer can watch any
-- -- -- -- -- movie that is 50 minutes or less in run
-- -- -- -- -- time, how many options does she have? 

SELECT COUNT(title) FROM film
WHERE length <= 50;

-- 15. BETWEEN
-- -- -- The BETWEEN operator is the same as:
-- -- -- value >= low AND value <= high 
-- -- -- value BETWEEN low AND high

-- -- -- You can also combine BETWEEN with the NOT logical operator:
-- -- -- -- value NOT BETWEEN low AND high

-- -- -- The NOT BETWEEN operator is the same as:
-- -- -- -- value < low OR value > high
-- -- -- -- value NOT BETWEEN low AND high

-- -- -- The BETWEEN operator can also be used
-- -- -- with dates. Note that you need to format
-- -- -- dates in the ISO 8601 standard format,
-- -- -- YYYY-MM-DD
-- -- -- -- AND '2007-02-01'

-- -- -- -- When using BETWEEN operator with dates
-- -- -- -- that also include timestamp information,
-- -- -- -- pay careful attention to using BETWEEN
-- -- -- -- versus <=,>= comparison operators, due to 
-- -- -- -- the fact a datetime starts at 0:00.
--
-- -- -- -- Later on we will study more specific 
-- -- -- -- methods for datetime information types

SELECT * FROM payment
LIMIT 2;

SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment 
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT * FROM payment 
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';