WITH cte AS(
SELECT p.product, p.category, p.brand, p.description,
p.sale_price, p.cost_price, p.image_url,
p.sale_price*s.units_sold AS revenue,
p.cost_price*units_sold AS total_cost,
s.date, s.customer_type, s.discount_band, s.units_sold,
TRIM(TO_CHAR(date, 'Month')) AS month,
TO_CHAR(date, 'YYYY') AS year
FROM products p
JOIN sales s
ON p.product_id = s.product)

SELECT *, (1 - (discount/100))*revenue AS discount_revenue
FROM cte c
JOIN discounts d
ON LOWER(TRIM(c.discount_band)) = LOWER(TRIM(d.discount_band))
AND TRIM(c.month) = TRIM(d.month)


