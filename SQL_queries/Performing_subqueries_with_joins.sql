# find the average amount paid by the top 5 customers

SELECT round (AVG(total_paid),2) AS average
FROM (SELECT A.customer_id, A.first_name, A.last_name, E.country, B.city, SUM(C.amount) AS total_paid
    FROM customer A
    INNER JOIN address D ON A.address_id=D.address.id
    INNER JOIN city B ON D.city_id=B.city_id
    INNER JOIN country E ON B.country_id=E.country_id
    INNER JOIN payment C ON A.customer_id=C.customer_id
    WHERE B.city IN ('Aurora', 'Atlxico', 'Xintai', 'Adoni', 'Dhule', 'Kurashiki', 'Sivas', 'Celaya', 'Sao Leopoldo')
    GROUP BY A.customer_id, E.country, B.city
    ORDER BY total_paid DESC LIMIT 5) AS total_amount_paid; 
