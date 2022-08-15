# This query filter the data as follows:


# run a query that only shows a title that contains "uptown"
SELECT film_id,
 title,
 description
FROM film
WHERE title LIKE '%Uptown%' 

# runs a query in which rental rate price is > 120 and > 2.99
SELECT film_id,
 title,
 description
FROM film
WHERE length > 120 AND rental_rate > 2.99

# runs a query which rental duration is > 3 and < 7 days. Order this by Ascending

SELECT film_id,
 title,
 description
FROM film
WHERE rental_duration > 3 AND rental_duration < 7
ORDER BY rental_duration ASC 

# runs a query that shows a replacement cost of a film < than 14.99
SELECT film_id,
 title,
 description
FROM film
WHERE replacement_cost < 14.99 

# runs a query that counts the minimun and max rental duration based on the rating
SELECT rating,
 COUNT (film_id) AS count_of_movie,
 AVG (rental_rate) AS average_rental_rate,
 MAX (rental_duration) AS maximum_rental_duration,
 MIN (rental_duration) AS minimum_rental_duration
FROM film
WHERE rating = 'PG' OR rating = 'G'
GROUP BY rating
