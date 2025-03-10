SELECT MIN(replacement_cost) FROM film;
--
SELECT MAX(replacement_cost) FROM film;
--
SELECT MAX(replacement_cost), MIN(replacement_cost)
FROM film;
--
SELECT COUNT(*)
FROM film;
--
SELECT COUNT(film_id)
FROM film;
--
SELECT AVG(replacement_cost) FROM film;
--
SELECT ROUND(AVG(replacement_cost),2)
FROM film;
--
SELECT ROUND(AVG(replacement_cost),3)
FROM film;
--
SELECT ROUND(AVG(replacement_cost),4)
FROM film;
--
SELECT *
FROM film;
--
SELECT SUM(replacement_cost)
FROM film;d

-- -- -- 4. GROUP BY
SELECT * FROM payment;
--
SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id
--
SELECT customer_id,SUM(amount) FROM payment
GROUP BY customer_id
--
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC;
-- 
SELECT customer_id,staff_id,SUM(amount) FROM payment
GROUP BY staff_id,customer_id;
--
SELECT staff_id,customer_id,SUM(amount) FROM payment
GROUP BY staff_id,customer_id
ORDER BY customer_id
-- 
SELECT staff_id,customer_id,SUM(amount) FROM payment
GROUP BY staff_id,customer_id
ORDER BY staff_id,customer_id
--
SELECT staff_id,customer_id,SUM(amount) FROM payment
GROUP BY staff_id,customer_id
ORDER BY(amount)
--
SELECT DATE(payment_date) FROM payment
-- 
SELECT DATE(payment_date) FROM payment
GROUP BY DATE(payment_date)
--
SELECT DATE(payment_date),SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC

-- 5. GROUP BY - Challenge

-- -- -- We have two staff members, with Staff IDs 1 and 2.
-- -- -- We want to give a bonus to the
-- -- -- staff member that handled the most payments.
-- -- -- (Most in terms of number of payments processed, not total dollar amount)
-- -- -- 
-- -- -- How many payments did each staff
-- -- -- member handle and who gets the bonus?

-- Hints
-- -- -- Use the payment table
-- -- -- Undertand the different between COUNT and SUM

SELECT staff_id,COUNT(amount)
FROM payment
GROUP BY staff_id

--

-- -- -- Corporate HQ is conducting a study on the 
-- -- -- relantionship between replacement cost 
-- -- -- and a movie MPAA rating (e.g. G, PG, R, etc...).

--

-- -- -- What is the average replacement cost per 
-- -- -- MPAA rating?
-- -- -- -- Note: You may need to expand the AVG
-- -- -- -- column to view correct results.

-- Hints
-- -- -- Use the film table
-- -- -- Recall that AVG returns back many
-- -- -- significant digits, you can either stretch 
-- -- -- the column or use ROUND() to fox this issue.

SELECT rating,AVG(replacement_cost)
FROM film 
GROUP BY rating 

--

SELECT rating,
ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating

--

-- -- -- We are running a promotion to reward our 
-- -- -- top 5 customer with coupons.
-- -- --
-- -- -- What are the customer ids of the top 5 
-- -- -- customers by total spend?

-- Hints 
-- -- -- Use the payment table 
-- -- -- Use ORDER BY 
-- -- -- Recall you can order by the results of an 
-- -- -- aggregate function 
-- -- -- 
-- -- -- You may want to use LIMIT to view just the top 5

SELECT customer_id,SUM(amount)
FROM payment
GROUP BY customer_id 
ORDER BY SUM(amount) DESC
LIMIT 5

-- 

-- -- -- 6. HAVING

SELECT * FROM payment

--
SELECT customer_id,SUM(amount) FROM payment 
GROUP BY customer_id
--
SELECT customer_id,SUM(amount) FROM payment 
WHERE customer_id NOT IN (184,87,477)
GROUP BY customer_id
--
SELECT customer_id,SUM(amount) FROM payment 
GROUP BY customer_id 
HAVING SUM(amount) > 100
-- 
SELECT * FROM customer 
--
SELECT store_id,COUNT(customer_id) FROM customer 
GROUP BY store_id
--
SELECT store_id,COUNT(*) FROM customer 
GROUP BY store_id
--
SELECT store_id,COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300 
--

-- -- -- 7. HAVING - Challenge Tasks

-- Challenge
-- -- -- We are launching a platinum service for 
-- -- -- our most loyal customers. We will assign
-- -- -- platinum status to customers that have
-- -- -- had 40 or more transaction payments.
-- -- -- 
-- -- -- What customer_ids are eligible for 
-- -- -- platinum status?

-- Hints 
-- -- -- Use the payment table 
-- -- -- Recall any column can be passed into a
-- -- -- COUNT() call

SELECT customer_id,COUNT(*)
FROM payment
GROUP BY customer_id
HAVING COUNT(*)>=40;

-- Challenge
-- -- -- What are the customer ids of customers
-- -- -- who have spent more than $100 in 
-- -- -- payment transactions with our staff_id
-- -- -- member 2?

-- Hints
-- -- -- Use the payment table
-- -- -- Remember to use WHERE to first filter
-- -- -- based on the staff_id, then use the 
-- -- -- GROUP BY clause

SELECT customer_id,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount)>100

-- ASSESSMENT TEST 1

-- -- -- 1. Return the customer IDs of customers who have spent
-- -- -- at least $110 with the staff member who has an ID of 2.
-- -- -- The answer should be customer 187 and 148.

SELECT customer_id,SUM(amount)
FROM paymennt
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount)>110;

-- -- -- 2. How many films begin with the letter J?
-- -- -- The answer should be 20.

SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';

-- -- -- 3. What customer has the highest customer ID
-- -- -- number whose name starts with an 
-- -- -- 'E' and has an address ID
-- -- -- lower tha 500?
-- -- -- The answer is Eddie Tomlin

SELECT first_name,last_name FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

