
USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett'
SELECT first_name
	, last_name
FROM actor
WHERE first_name LIKE "Scarlett";

-- 2. How many physical copies of movies are available for rent in the store's inventory? 
SELECT COUNT(inventory_id)
FROM inventory;

-- How many unique movie titles are available?
SELECT COUNT(DISTINCT title)
FROM film;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MIN(length) as min_duration
	, MAX(length) as max_duration
FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT avg(length)
     ,concat(AVG(length) / 60, ' hours',', ', ROUND(AVG(length) % 60,0), ' minutes') as avg_movie_duration
FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)
FROM sakila.actor;

-- 6. How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT DATEDIFF( MAX(rental_date), MIN(rental_date))
FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *
	, date_format(rental_date, '%m') as rental_month
	, WEEKDAY(rental_date) as rental_weekday
FROM sakila.rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
	-- use case when
SELECT *
	, date_format(rental_date, '%m') as rental_month
	, WEEKDAY(rental_date) as rental_weekday
    , CASE
		WHEN WEEKDAY(rental_date) < '5' THEN "workday"
		ELSE "weekend"
	END as day_type
FROM sakila.rental
LIMIT 20;

-- 9. Get release years.
SELECT DISTINCT release_year
FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT title
FROM sakila.film
WHERE title LIKE "%ARMAGEDDON%";

-- 11. Get all films which title ends with APOLLO.
SELECT title
FROM sakila.film
WHERE title LIKE "%APOLLO";

-- 12. Get 10 the longest films.
SELECT title
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT COUNT(DISTINCT film_id)
FROM sakila.film
WHERE special_features = "Behind the Scenes";