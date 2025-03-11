-- -- -- 2. Timestamps and Extract - Part One
-- -- -- -- TIME - Contains only time
-- -- -- -- DATE - Contains only date
-- -- -- -- TIMESTAMP - Contains date and time
-- -- -- -- TIMESTAMPTZ - Contains date, time, and timezone 
--
-- -- -- Functions and operations related to these specific data types:
-- -- -- -- TIMEZONE
-- -- -- -- NOW
-- -- -- -- TIMEOFDAY
-- -- -- -- CURRENT_TIME
-- -- -- -- CURRENT_DATE

--

SHOW ALL 

-- 

SHOW TIMEZONE

--

SELECT NOW()

--

SELECT TIMEOFDAY() 

--

SELECT CURRENT_TIME

--

SELECT CURRENT_DATE

-- 

-- -- -- 3. Timestamps and Extract - Part Two

-- -- -- -- EXTRACT()
-- -- -- -- AGE()
-- -- -- -- TO_CHAR()

-- -- -- -- -- EXTRACT()
-- -- -- Allows you to "extract" ot obtain a 
-- -- -- sub-component of a date value
-- -- -- -- YEAR
-- -- -- -- MONTH
-- -- -- -- DAY
-- -- -- -- WEEK
-- -- -- -- QUARTER

-- -- -- Allows you to "extract" or obtain a 
-- -- -- sub-component of a date value
-- -- -- -- EXTRACT(YEAR FROM date_col)

-- -- -- AGE()
-- -- -- -- Calculates and return the current age 
-- -- -- -- given a timestamp
--
-- -- -- -- Useage:
-- -- -- -- -- AGE(date_col)
--
-- -- -- -- Returns
-- -- -- -- -- 13 yeears 1 mon 5 days 01:34:13.003423

-- -- -- TO_CHAR()
-- -- -- -- General function to convert data types to text
-- -- -- -- Useful for timestamp formating
-- -- -- -- Usage 
-- -- -- -- -- TO_CHAR(date_col, 'mm-dd-yyyy')

SELECT * FROM payment

--

SELECT EXTRACT(YEAR FROM payment_date)
FROM payment

--

SELECT EXTRACT(YEAR FROM payment_date) AS year 
FROM payment

-- 

SELECT EXTRACT(MONTH FROM payment_date) AS pay_month
FROM payment

--

SELECT EXTRACT(QUARTER FROM payment_date)
AS pay_month
FROM payment

-- 

SELECT payment_date
FROM payment

--

SELECT AGE(payment_date)
FROM payment

--

SELECT TO_CHAR(payment_date,'MONTH-YYYY')
FROM payment

-- 

SELECT TO_CHAR(payment_date,'MONTH   YYYY')
FROM payment

-- 

SELECT TO_CHAR(payment_date,'mon/dd/YYYY')
FROM payment

--

SELECT TO_CHAR(payment_date/'MM/dd/YYYY')
FROM payment

-- 

SELECT TO_CHAR(payment_date,'MM-dd-YYYY')
FROM payment

--

SELECT TO_CHAR(payment_date,'dd-MM-YYYY')
FROM payment

--

SELECT TO_CHAR(payment_date,'dd/MM/YYYY')
FROM payment

--

-- -- -- 5. Timestamps and Extract - Challenge Tasks

-- -- -- During which months did payments occur?
-- -- -- Format your answer to return back the full month name.

-- Hints
-- -- -- You do not need to use EXTRACT for this query.

SELECT DISTINCT(TO_CHAR(payment_date,'MONTH'))
FROM payment

-- -- -- How many payments occurred on a Monday?
-- -- -- NOTE: We didn't show you exactly how to 
-- -- -- do this, but use the documentation or 
-- -- -- Google to figure this out!

-- Hints
-- -- -- Use EXTRACT
-- -- -- Review the dow keyword 
-- -- -- PostgreSQL considers Sunday the start of
-- -- -- a week (indexed at 0)

SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date)=1 

-- -- -- 

-- -- -- 6. Mathematical Functions and Operators

-- -- -- 

SELECT * FROM film

-- -- -- 

SELECT ROUND(rental_rate/replacement_cost,2) FROM film

-- -- --

SELECT ROUND(rental_rate/replacement_cost,2)*100 FROM film

-- -- --

SELECT ROUND(rental_rate/replacement_cost,4)*100 AS percent_cost
FROM film

-- -- --

SELECT 0.1 * replacement_cost AS deposit 
FROM film

-- -- -- 

-- -- -- 7. String Functions and Operators

-- -- -- 

SELECT * FROM customer

-- 

SELECT LENGTH(first_name) FROM customer

-- 

SELECT first_name || last_name 
FROM customer

--

SELECT first_name || ' ' || last_name
FROM customer

-- 

SELECT first_name || '--' || last_name
FROM customer

-- 

SELECT first_name || ' ' || last_name AS full_name
FROM customer

-- 

SELECT upper(first_name) || ' ' || upper(last_name) AS full_name
FROM customer

--

SELECT * 
FROM customer

--

SELECT LEFT(first_name,1) || last_name || '@gmail.com'
FROM customer 

--

SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gmail.com'
AS customer_email
FROM customer

-- -- -- 

-- -- -- 8. SubQuery

-- -- -- 

SELECT AVG(rental_rate) FROM film

--

SELECT title,rental_rate
FROM film
WHERE rental_rate > 
(SELECT AVG(rental_rate) FROM film)

--

SELECT * FROM rental 

-- 

SELECT * FROM inventory

--

SELECT * FROM rental 
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30'

-- 

SELECT inventory.film_id 
FROM rental
INNER JOIN inventory ON inventory ON inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30'

--

SELECT film_id,title
FROM film
WHERE film_id IN
(SELECT inventory.film_id)
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30'
ORDER BY title

--

SELECT first_name,last_name 
FROM customer AS c
WHERE EXISTS
(SELECT * FROM payment as p
WHERE p.customer_id = c.customer_id
AND amount > 11)

-- 

SELECT first_name,last_name
FROM customer AS c
WHERE NOT EXISTS 
(SELECT * FROM payment as p 
WHERE p.customer_id = c.customer_id
AND amount > 11)

-- 

-- -- -- 9. Self-Join

-- A self-join is a query in which a table is joined to itself
-- Self-joins are useful for comparing values 
-- in a column of rows within the same table.

-- The self join can be viewed as a join of two
-- copies of the same table.
--
-- The table is not actually copied, but SQL 
-- performs the command as though it were.
-- its simply standard JOIN syntax with the same table in both parts.

-- However, when using a self join it is 
-- necessary to use an alias for the table,
-- otherwise the table names would be ambiguous.
--
-- Let's see a syntax example of this.

-- Syntax 
-- -- -- SELECT tableA.col, tableB.col 
-- -- -- FROM table AS tableA
-- -- -- JOIN table AS tableB ON 
-- -- -- tableA.some_col = tableB.other_col

--

SELECT emp.name, report.name AS rep 
FROM employees AS emp 
JOIN employees AS report ON 
emp.emp_id = report.report_id

-- 

SELECT * FROM film

--

SELECT title,length FROM film 
WHERE length = 117 

--

SELECT title,length 
FROM film 

--

SELECT f1.title, f2.title, f1.length 
FROM film

--

SELECT f1.title, f2.title, f1.length 
FROM film AS f1 
INNER JOIN film AS f2 ON 
f1.film_id != f2.film_id 
AND f1.length = f2.length