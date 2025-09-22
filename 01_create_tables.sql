-- 01_create_tables.sql
CREATE TABLE orders (
    order_id     NUMBER PRIMARY KEY,
    customer_id  NUMBER NOT NULL,
    order_date   DATE DEFAULT SYSDATE,
    amount       NUMBER(10,2)
);

CREATE TABLE order_reports (
    report_id    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id  NUMBER NOT NULL,
    order_id     NUMBER NOT NULL,
    order_date   DATE,
    amount       NUMBER(10,2),
    report_time  DATE DEFAULT SYSDATE
);
