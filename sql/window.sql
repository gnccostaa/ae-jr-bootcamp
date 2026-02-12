-- Primeira compra de cada cliente
WITH ranked AS (
  SELECT
    customer_id,
    order_id,
    order_date,
    revenue,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
  FROM orders
)
SELECT
  customer_id,
  order_date AS first_order_date,
  revenue AS first_order_revenue
FROM ranked
WHERE rn = 1;

-- Receita acumulada por cliente
SELECT
  customer_id,
  order_date,
  revenue,
  SUM(revenue) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_revenue
FROM orders
ORDER BY customer_id, order_date;

