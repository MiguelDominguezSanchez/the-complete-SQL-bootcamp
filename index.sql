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

-- 16. IN
-- -- -- In certain cases you want to check for
-- -- -- multiple possible value options, for example, 
-- -- -- if a user's name shows up IN a list
-- -- -- of know names.
-- 
-- -- -- We can use the IN operator to create a
-- -- -- condition that checks to see if a value in included
-- -- -- in a list of multiple oprions.
--
-- -- -- The general syntax is:
-- -- -- -- value IN (oprion1,option2,...,option_n)

-- Example query:
-- -- -- SELECT color FROM table
-- -- -- WHERE color IN ('red','blue')
--
-- -- -- SELECT color FROM table
-- -- -- WHERE color IN ('red','blue','green')

-- -- -- SELECT color FROM table
-- -- -- WHERE color NOT IN ('red','blue')

SELECT * FROM payment
LIMIT 2;

SELECT DISTINCT(payment) FROM payment
LIMIT 2;

SELECT DISTINCT(amount) FROM payment
ORDER BY amount;

SELECT * FROM payment
WHERE amount IN (0.99,1.98,1.99)

SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99,1.98,1.99);

SELECT * FROM customer
WHERE first_name IN ('John','Jake','Julie');

-- 17. LIKE and ILIKE
-- -- -- We`ve already been able to perform direct comparison against strings,
-- -- -- such as:
-- -- -- -- WHERE first_name='John'
-- -- -- But what if we wnat to match against a general pattern in a string?
-- -- -- -- All emails ending in '@gmail.com'
-- -- -- -- All names that begin with an 'A' 

-- -- -- The LIKE operator allows us to perform
-- -- -- pattern matching against string data with 
-- -- -- the use of 'wildcard' characters:
-- -- -- -- Percent%
-- -- -- -- -- Matches any sequence of characters 
-- -- -- -- Underscore
-- -- -- -- -- Matches any single character

-- -- -- All names that begin with an 'A'
-- -- -- -- WHERE name LIKE 'A%'
-- -- -- All names that end with an 'a' 
-- -- -- -- WHERE name LIKE '%a'

-- -- -- Notice that LIKE is case-sentive, we can use 
-- -- -- LIKE wichh is case-insensitive

-- -- -- Using the underscore allows us to replace
-- -- -- just a single character
-- -- -- -- Get all Mission Impossible films
-- -- -- -- WHERE title LIKE 'Mission Impossible _'

-- -- -- You can use multiple underscores
-- -- -- Imagine we had version string codes in the
-- -- -- format 'Version#A4', 'Version#B7', etc...
-- -- -- -- WHERE value LIKE 'Version#__'

-- -- -- We can also combine pattern matching 
-- -- -- operators to create more complex patterns
-- -- -- -- WHERE name LIKE '_her%'
-- -- -- -- -- Cheryl
-- -- -- -- -- Theresa
-- -- -- -- -- Sherri

-- -- -- Here we just focus on LIKE and ILIKE for now,
-- -- -- but keep in mind PostgreSQL does support full regex capabilities:
-- -- -- -- https://www.postgresql.org/docs/12/functions-matching.html

SELECT * FROM customer
WHERE first_name LIKE 'J%';

SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

SELECT * FROM customer 
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

SELECT * FROM customer 
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%';

SELECT * FROM customer 
WHERE first_name LIKE '%er%';

SELECT * FROM customer
WHERE first_name LIKE '_her%';

SELECT * FROM customer
WHERE first_name LIKE 'A%'

SELECT * FROM customer
WHERE first_name LIKE 'A%'
ORDER BY last_name;

SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;

-- 18. General Challenge 1
-- -- -- How many payment transactions were greater than $5.00?
-- -- -- -- Hints
-- -- -- -- -- You will need to use the payment table 
-- -- -- -- -- You will also need to use COUNT and WHERE
-- -- -- -- -- along with some conparison operator

SELECT COUNT(amount) FROM payment
WHERE amount > 5;

-- -- -- How many actors have a first name that starts with the letter P?
-- -- -- -- Hints
-- -- -- -- -- You will need to use the actor table
-- -- -- -- -- You will also need to use LIKE and a wildcard operator, such as % or_

SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

-- -- -- How many unique districts are our customers from?
-- -- -- -- Hints
-- -- -- -- -- You will need to use the address table
-- -- -- -- -- You will also need to use COUNT and DISTINCT

SELECT COUNT(DISTINCT(district)) 
FROM address;

-- -- -- Retrieve the list of names for those distinct
-- -- -- districts from the previous question.

-- -- -- Hints 
-- -- -- -- You will again need to use the address table
-- -- -- -- This will be very similar to the previous
-- -- -- -- challenge

SELECT DISTINCT(district) FROM address;

-- -- -- How many films hace a rating of R and a 
-- -- -- replacement cost between $5 and $15?

-- -- -- Hints 
-- -- -- -- You will need to use the film table.
-- -- -- -- You may also need to use BETWEEN and a 
-- -- -- -- WHERE statement with a comparison operator.

SELECT COUNT(*) FROM film
WHERE rating = 'R' 
AND replacement_cost BETWEEN 5 AND < 15;

-- -- -- How many films have the word Truman
-- -- -- somewhere in the title?

-- -- -- Hints
-- -- -- -- You will need to use the film table
-- -- -- -- You will also need to use LIKE with a wildcard
-- -- -- operator.

SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';