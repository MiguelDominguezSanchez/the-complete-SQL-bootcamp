SELECT COUNT(*) AS num_transactions
FROM payment

--

SELECT customer_id,SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id

-- 

SELECT customer_id,SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100

-- 

SELECT customer_id,SUM(amount) AS total_spent
FROM payment 
GROUP BY customer_id
HAVING SUM(amount) > 100

--

SELECT customer_id,amount
FROM payment
WHERE amount > 2

-- 

SELECT customer_id,amount AS new_name
FROM payment
WHERE amount > 2

-- -- -- 

-- -- -- 4. Inner Joins

SELECT * 
FROM payment

--

SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id

-- 

SELECT payment_id,payment.customer_id,first_name
FROM payment
INNER JOIN customer 
ON payment.customer_id = customer.customer_id

--

SELECT payment_id,payment.customer_id,first_name
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null

--

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null

-- 

SELECT COUNT(DISTINCT customer_id) FROM customer