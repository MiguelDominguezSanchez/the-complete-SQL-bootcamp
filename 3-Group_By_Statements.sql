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
FROM film;