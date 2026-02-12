-- Receita por cliente (JOIN com customers)
SELECT
  c.customer_id,
  c.signup_date,
  COUNT(o.order_id) AS total_orders,
  SUM(o.revenue) AS total_revenue
FROM customers c
LEFT JOIN orders o
  ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.signup_date
ORDER BY total_revenue DESC;

