-- ch02_1a.sql
SET serveroutput ON;
DECLARE
 v_name          VARCHAR2(30);
 v_dob           DATE;
 v_us_citizen    BOOLEAN;
BEGIN
  dbms_output.put_line(coalesce(v_name, 'NO NAME') ||' born on '|| coalesce(v_dob,SYSDATE));
END;

--NO NAME born on 07-6ÔÂ -20
