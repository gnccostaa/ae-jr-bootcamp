-- 1) Receita total por dia
SELECT
  order_date,
  SUM(revenue) AS total_revenue
FROM orders
GROUP BY order_date
ORDER BY total_revenue DESC;

-- 2) Clientes com mais de 3 pedidos
SELECT
  customer_id,
  COUNT(*) AS total_orders,
  SUM(revenue) AS total_revenue
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 3
ORDER BY total_revenue DESC;

