/*
 * For each payment, show the customer's total amount paid overall.
 *
 * HINT:
 * Use a window function with a PARTITION BY (but no ORDER BY).
 */

SELECT
    customer_id,
    first_name,
    last_name,
    payment_id,
    amount,
    SUM(amount) OVER (PARTITION BY customer_id) AS customer_total
FROM payment
JOIN customer USING (customer_id)
ORDER BY customer_id, payment_id; 
