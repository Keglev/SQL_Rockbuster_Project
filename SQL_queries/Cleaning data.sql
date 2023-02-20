# this query looks for duplicate values in the Database, expecially in the Film Database
# this query actualy DOES NOT erases values. It only filters them, according to the criteria.

SELECT title, release_year,
language_id,
rental_duration,
COUNT(*) FROM film
GROUP BY title,
release_year,
language_id,
rental_duration
HAVING COUNT(*) >1; 

# The following Query Select duplicate values by customer's name
SELECT first_name,
last_name,
address_id,
email,
active,
COUNT(*) FROM customer
 GROUP BY first_name,
Last_name,
address_id,
email, active
HAVING COUNT(*) >1; 

# this query selects the rental rate and duration.


SELECT COUNT(title) AS count_title,
COUNT(rental_duration) AS count_rental_duration,
 COUNT(rental_rate) AS count_rental_rate,
COUNT(length) AS count_length,
COUNT(replacement_cost) AS count_replacement_cost,
COUNT(*) AS count_rows
FROM film;

# this query selects the customer email and store that the customer used to rent the film. The store is based in the country, not by region.

SELECT COUNT(email) AS count_email,
COUNT(last_name) AS count_last_name,
COUNT(first_name) AS count_first_name,
COUNT(customer_id) AS count_customer_id,
COUNT(store_id) AS count_store_id,
COUNT(*) AS count_rows
FROM customer; 


# --descriptive statistics for numerical columns for customer table
# This selects the values based in min and max rentalrate and for wich film. This also selects the  language and the length of the movie, and also the film costs.

SELECT MIN(rental_rate) AS min_rental_rate,
MAX(rental_rate) AS max_rental_rate,
AVG(rental_rate) AS avg_rental_rate,
MIN(rental_duration) AS min_rental_duration,
MAX(rental_duration) AS max_rental_duration,
AVG(rental_duration) AS avg_rental_duration,
MIN(film_id) AS min_film,
MAX(film_id) AS max_film,
AVG(film_id) AS avg_film,
MIN(language_id) AS min_language,
MAX(language_id) AS max_language,
AVG(language_id) AS avg_language,
MIN(length) AS min_length,
MAX(length) AS max_length,
AVG(length) AS avg_length,
MIN(replacement_cost) AS min_replacement_cost,
MAX(replacement_cost) AS max_replacement_cost,
AVG(replacement_cost) AS avg_replacement_cost
FROM film
