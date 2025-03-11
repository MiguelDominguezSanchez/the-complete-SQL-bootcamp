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