-- 05_create_trigger.sql
CREATE OR REPLACE TRIGGER trg_orders_after_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_reports(customer_id, order_id, order_date, amount)
    VALUES(:NEW.customer_id, :NEW.order_id, :NEW.order_date, :NEW.amount);
END;
/