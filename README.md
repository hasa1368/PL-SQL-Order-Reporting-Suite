# PL/SQL Order Reporting System

**Customer Order Management and Reporting System using PL/SQL**, built with Oracle SQL/PLSQL.  
This project demonstrates modular PL/SQL development using **packages, triggers, materialized views, and scheduler jobs**, providing automated order logging and reporting.

---

## **Features**

- Modular PL/SQL project with separate `.sql` files:
  - Tables (`orders`, `order_reports`)
  - Package (`order_pkg_v2`) with procedures/functions
  - Trigger (`trg_orders_after_insert`) for automatic logging
  - Materialized view (`mv_customer_order_summary`) for summary reports
  - Scheduler job for daily refresh
- Add, view, and summarize customer orders
- Automated logging of orders into report table
- Retrieve total purchases per customer
- Ready-to-run sample usage scripts

---

## **File Structure**

PL-SQL-Order-Reporting-Suite/
├── 01_create_tables.sql
├── 02_create_materialized_view.sql
├── 03_create_package_spec.sql
├── 04_create_package_body.sql
├── 05_create_trigger.sql
├── 06_create_scheduler_job.sql
├── 07_sample_usage.sql
├── README.md

## **Setup Instructions**

1. Open **SQL Developer** or **SQL*Plus**.
2. Enable DBMS_OUTPUT to see messages:

```sql
SET SERVEROUTPUT ON;
Run the SQL scripts in order:

sql
Copy code
-- Create tables
@01_create_tables.sql

-- Create materialized view
@02_create_materialized_view.sql

-- Create package specification
@03_create_package_spec.sql

-- Create package body
@04_create_package_body.sql

-- Create trigger
@05_create_trigger.sql

-- Create scheduler job (optional)
@06_create_scheduler_job.sql

-- Run sample usage
@07_sample_usage.sql
Sample Outputs
DBMS_OUTPUT Messages
yaml
Copy code
Order 3001 added successfully.
Order 3002 added successfully.
Order 3003 added successfully.
Order: 3001 | Date: 22-SEP-25 | Amount: 1500
Order: 3002 | Date: 22-SEP-25 | Amount: 2500
Customer 400 total purchase: 4000
Orders Table
order_id	customer_id	order_date	amount
3001	400	22-SEP-25	1500
3002	400	22-SEP-25	2500
3003	401	22-SEP-25	3200

Order Reports Table
report_id	customer_id	order_id	order_date	amount	report_time
1	400	3001	22-SEP-25	1500	22-SEP-25
2	400	3002	22-SEP-25	2500	22-SEP-25
3	401	3003	22-SEP-25	3200	22-SEP-25

Materialized View Summary
customer_id	total_orders	total_amount	avg_amount	max_order_amount	last_order_date
400	2	4000	2000	2500	22-SEP-25
401	1	3200	3200	3200	22-SEP-25

Usage Notes
Ensure the DBMS_OUTPUT panel is enabled in SQL Developer to see messages.

The trigger automatically logs all new orders into order_reports.

Refresh the materialized view manually or rely on the scheduler job for automated daily updates.

You can extend the package with additional procedures/functions as needed.
plsql
oracle
sql
database
orders
order-management
reporting
materialized-view
trigger
package
scheduler
automation
customer-orders
order-logging
plsql-project
plsql-example

License
This project is free to use and modify.
Created by Hamed Sadeghi Firouzja

