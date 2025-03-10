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

-- 

SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT JOIN inventory ON
inventory.film_id = film.film_id

---

-- -- -- 9. JOIN Challenge Tasks

SELECT * FROM customer

--

SELECT * FROM address

--

SELECT * FROM address 
INNER JOIN customer
ON address.address_id = customer_id

--

SELECT district,email FROM address 
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California'

-- 

SELECT district,email FROM customer 
INNER JOIN address 
ON address.address_id = customer.address_id
WHERE district = 'California'

-- 

SELECT * FROM actor
INNER JOIN film_actor 
ON actor.actor_id = film_actor.actor_id

--

SELECT * FROM actor 
INNER JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
INNER JOIN film 
ON film_actor.film_id = film.film_id

-- 

SELECT title,first_name,last_name FROM actor 
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id

-- 

SELECT title,first_name,last_name FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND
last_name = 'Wahlberg'