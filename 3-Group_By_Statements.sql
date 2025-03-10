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