#select the top 10 countries for Rockbuster in terms of customer numbers.

SELECT D.country,
COUNT(A.customer_id) AS customer_number
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_ID = D.country_ID
GROUP BY country
ORDER BY customer_number DESC
LIMIT 10

#The country information is stored in a table that is not directly connected to the customer table, so in
#order to join this information, customer information and the country needed to be joined via the address
#and city tables. Only an inner join is necessary here, as we are interested in the matching values in
#the customer and country tables. We are looking at the number of customer_id’s that have to be
#counted. The results can also be limited to the top 10 results of customer numbers, so they should be
#sorted in descending order and grouped by the countries.

# find the top 10 cities within the top 10 countries identified
SELECT C.city,
COUNT(A.customer_id) AS customer_number
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
WHERE country IN('India', 'China', 'United States', 'Japan', 'Mexico', 'Brazil', 'Russian Federation',
'Philippines', 'Turkey', 'Indonesia')
GROUP BY city
ORDER BY customer_number DESC
LIMIT 10 

#Looking for the cities in the top 10 countries identified earlier, limiting output to the top 10 after
#grouping by city and sorting by number of customers in each city 


# find the top 5 customers in the top 10 cities who have paid the highest total amounts to Rockbuster
SELECT A.customer_id,
A.first_name,
A.last_name,
C.city,
D.country,
SUM(E.amount) AS total_amount
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
INNER JOIN payment E ON A.customer_id = E.customer_id
WHERE city IN('Aurora', 'Shimoga', 'Aparecida de Goinia', 'Emeishan', 'Pontianak', 'Tarsus', 'Atlixco',
'Zalantun', 'Rio Claro', 'Tokat')
GROUP BY A.customer_id, C.city, D.country
ORDER BY total_amount DESC
LIMIT 5 
