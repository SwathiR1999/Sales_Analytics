
-- 1. Total Rentals per Customer
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_rentals DESC;

-- 2. Monthly Revenue
SELECT 
    DATE_TRUNC('month', p.payment_date) AS month,
    SUM(p.amount) AS total_revenue
FROM payment p
GROUP BY month
ORDER BY month;

-- 3. Most Rented Movies
SELECT 
    f.title,
    COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 10;

-- 4. Revenue by Customer
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(p.amount) AS total_revenue
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_revenue DESC;

-- 5. Rentals by Category
SELECT 
    cat.name AS category,
    COUNT(r.rental_id) AS total_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category cat ON cat.category_id = fc.category_id
GROUP BY cat.name
ORDER BY total_rentals DESC;
