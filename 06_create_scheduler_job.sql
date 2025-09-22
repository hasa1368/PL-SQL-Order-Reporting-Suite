-- 06_create_scheduler_job.sql
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'refresh_mv_customer_order_summary_job',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN DBMS_MVIEW.REFRESH(''MV_CUSTOMER_ORDER_SUMMARY'', ''COMPLETE''); END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=0; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE,
        comments        => 'Daily refresh of mv_customer_order_summary materialized view'
    );
END;
/