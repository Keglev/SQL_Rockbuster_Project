# These are just the queries that make them easy to read

# get the top 5 customers in the cities

EXPLAIN WITH cte_average(customer_id, first_name, last_name, city, country, amount) AS
(SELECT A.customer_id,
		A.first_name,
		A.last_name,
		C.city,
		D.country,
		SUM(E.amount) AS amount_per_customer
# Inner Join tables for answer the business question. What are the top customers by city? What are the top cities in the top 10 countries?
 FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D On C.country_ID = D.country_id
INNER JOIN payment E ON A.customer_id = E.customer_id
WHERE city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule', 'Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'Sao Leopoldo')
GROUP BY A.customer_id, C.city, D.country
ORDER BY amount_per_customer DESC
LIMIT 5)
SELECT AVG(amount)
FROM cte_average

/*Get customer count and total payment received against each country. What the average spent of the top customer in each city? */
SELECT country,
       COUNT(A.customer_id) AS customer_count,
       SUM(amount) AS total_payment
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_ID = D.country_ID
INNER JOIN payment E ON a.customer_id = E.customer_id
GROUP BY country

# get the total film revenue. F>ind the revenue of each filme and select the top 10. It also select the genre.
SELECT C.name AS genre, COUNT(A.film_id) AS count_of_films, SUM(E.amount) AS total_film_revenue			
FROM film A			
INNER JOIN film_category B ON A.film_id = B.film_id			
INNER JOIN category C ON B.category_id = C.category_id			
INNER JOIN inventory F ON A.film_id = F.film_id			
INNER JOIN rental D ON F.inventory_id = D.inventory_id			
INNER JOIN payment E ON D.rental_id = E.rental_id			
GROUP BY C.name			
ORDER BY total_film_revenue DESC;
