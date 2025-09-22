-- 02_create_materialized_view.sql
CREATE MATERIALIZED VIEW mv_customer_order_summary
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
SELECT 
    r.customer_id,
    COUNT(r.order_id)      AS total_orders,
    SUM(r.amount)          AS total_amount,
    ROUND(AVG(r.amount),2) AS avg_amount,
    MAX(r.amount)          AS max_order_amount,
    MAX(r.order_date)      AS last_order_date
FROM order_reports r
GROUP BY r.customer_id;
