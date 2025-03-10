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