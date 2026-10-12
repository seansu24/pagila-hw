/*
 * Use a JOIN to order the countries by most profitable,
 * where the profit is the total amount that all customers from that country have payed.
 * Use tables payment, rental, customer, address, city, and country.
 * Order by country alphabetically.
 */

SELECT country.country, sum(payment.amount) as profit
FROM rental
JOIN payment USING (rental_id)
JOIN customer ON rental.customer_id = customer.customer_id
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
GROUP BY country.country
ORDER BY country.country;
