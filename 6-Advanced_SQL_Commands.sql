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
