/*
 * Rank actors by how many films they appear in (most films first). Ties share a rank.
 *
 * HINT:
 * Join actor with film_actor.
 * Then use a window function with an appropriate ORDER BY clause (no PARTITION BY).
 */

SELECT
    actor_id,
    first_name,
    last_name,
    count(film_id) AS films,
    rank() OVER (ORDER BY count(film_id) DESC) AS rnk
FROM film_actor
JOIN actor USING (actor_id)
GROUP BY actor_id, first_name, last_name
ORDER BY rnk, actor_id;
