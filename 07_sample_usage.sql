-- 07_sample_usage.sql
-- Sample usage of order_pkg_v2

-- Add new orders
BEGIN
    order_pkg_v2.add_order(3001, 400, 1500);
    order_pkg_v2.add_order(3002, 400, 2500);
    order_pkg_v2.add_order(3003, 401, 3200);
END;
/

--  Display orders for customer 400 using package procedure
BEGIN
    order_pkg_v2.show_customer_orders(400);
END;
/

-- Get total purchase for customer 400
DECLARE
    v_total NUMBER;
BEGIN
    v_total := order_pkg_v2.get_customer_total(400);
    DBMS_OUTPUT.PUT_LINE('💰 Customer 400 total purchase: ' || v_total);
END;
/

-- Refresh materialized view manually (optional)
BEGIN
    order_pkg_v2.refresh_summary_mv;
END;
/

-- Query data directly from tables
-- a) Orders table
SELECT * FROM orders ORDER BY order_date;

-- b) Order reports table
SELECT * FROM order_reports ORDER BY report_time;

-- c) Materialized view summary
SELECT * FROM mv_customer_order_summary ORDER BY customer_id;
