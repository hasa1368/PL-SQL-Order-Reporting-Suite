-- 03_create_package_spec.pks
CREATE OR REPLACE PACKAGE order_pkg_v2 AS
    PROCEDURE add_order(
        p_order_id    IN NUMBER,
        p_customer_id IN NUMBER,
        p_amount      IN NUMBER
    );
    FUNCTION get_customer_total(p_customer_id IN NUMBER) RETURN NUMBER;
    PROCEDURE show_customer_orders(p_customer_id IN NUMBER);
    PROCEDURE refresh_summary_mv;
END order_pkg_v2;
/