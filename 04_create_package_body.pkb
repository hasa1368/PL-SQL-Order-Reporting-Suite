-- 04_create_package_body.pkb
CREATE OR REPLACE PACKAGE BODY order_pkg_v2 AS
    PROCEDURE add_order(
        p_order_id    IN NUMBER,
        p_customer_id IN NUMBER,
        p_amount      IN NUMBER
    ) AS
    BEGIN
        INSERT INTO orders(order_id, customer_id, amount)
        VALUES(p_order_id, p_customer_id, p_amount);
        DBMS_OUTPUT.PUT_LINE('Order ' || p_order_id || ' added successfully.');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Error: Order ID ' || p_order_id || ' already exists.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Unknown error: ' || SQLERRM);
    END add_order;

    FUNCTION get_customer_total(p_customer_id IN NUMBER) RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT NVL(SUM(amount),0) INTO v_total
        FROM orders
        WHERE customer_id = p_customer_id;
        RETURN v_total;
    END get_customer_total;

    PROCEDURE show_customer_orders(p_customer_id IN NUMBER) AS
        CURSOR c_orders IS
            SELECT order_id, order_date, amount
            FROM orders
            WHERE customer_id = p_customer_id
            ORDER BY order_date;
        v_order_id   orders.order_id%TYPE;
        v_order_date orders.order_date%TYPE;
        v_amount     orders.amount%TYPE;
    BEGIN
        OPEN c_orders;
        LOOP
            FETCH c_orders INTO v_order_id, v_order_date, v_amount;
            EXIT WHEN c_orders%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Order: ' || v_order_id || 
                                 ' | Date: ' || TO_CHAR(v_order_date,'YYYY-MM-DD') ||
                                 ' | Amount: ' || v_amount);
            INSERT INTO order_reports(customer_id, order_id, order_date, amount)
            VALUES(p_customer_id, v_order_id, v_order_date, v_amount);
        END LOOP;
        CLOSE c_orders;
    END show_customer_orders;

    PROCEDURE refresh_summary_mv AS
    BEGIN
        DBMS_MVIEW.REFRESH('MV_CUSTOMER_ORDER_SUMMARY','COMPLETE');
    END refresh_summary_mv;

END order_pkg_v2;
/