DECLARE
   v_num1 NUMBER := 5;
   v_num2 NUMBER := 3;
   v_temp NUMBER;
BEGIN
   -- if v_num1 is greater than v_num2 rearrange their values
   IF v_num1 > v_num2 THEN
      v_temp := v_num1;
      v_num1 := v_num2;
      v_num2 := v_temp;
   END IF;
   
   -- display the values of v_num1 and v_num2
   DBMS_OUTPUT.PUT_LINE ('v_num1 = '||v_num1);
   DBMS_OUTPUT.PUT_LINE ('v_num2 = '||v_num2);
END;

/**
v_num1 = 3
v_num2 = 5
PL/SQL procedure successfully completed.
**/


DECLARE
   v_num NUMBER := &sv_user_num;
BEGIN
   -- test if the number provided by the user is even
   IF MOD(v_num,2) = 0  THEN
      DBMS_OUTPUT.PUT_LINE (v_num||' is even number');
   ELSE
      DBMS_OUTPUT.PUT_LINE (v_num||' is odd number');
   END IF;
   DBMS_OUTPUT.PUT_LINE ('Done');
END;

/**
Enter value for v_user_num: 24
old   2:    v_num  NUMBER := &v_user_num;
new   2:    v_num  NUMBER := 24;
24 is even number
Done
PL/SQL procedure successfully completed.
**/

DECLARE
   v_num1 NUMBER := 0;
   v_num2 NUMBER;
BEGIN
   IF v_num1 = v_num2 THEN
      DBMS_OUTPUT.PUT_LINE ('v_num1 = v_num2');
   ELSE
      DBMS_OUTPUT.PUT_LINE ('v_num1 != v_num2');
  END IF;
END;

/**
v_num1 != v_num2

PL/SQL 过程已成功完成。
**/



-- ch04_1a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
   v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
   v_day  VARCHAR2(15); 
BEGIN
   v_day := RTRIM(TO_CHAR(v_date, 'DAY'));
   
   IF v_day IN ('SATURDAY', 'SUNDAY') THEN
      DBMS_OUTPUT.PUT_LINE (v_date||' falls on weekend'); 
   END IF; 
   
   -- control resumes here
   DBMS_OUTPUT.PUT_LINE ('Done…');
END;

/**
输入 sv_user_date 的值:  09-JAN-2007
原值    2:    v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
新值    2:    v_date DATE := TO_DATE('09-JAN-2007', 'DD-MON-YYYY');
Done…

PL/SQL 过程已成功完成。

输入 sv_user_date 的值:  07-JUN-2020
原值    2:    v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
新值    2:    v_date DATE := TO_DATE('07-JUN-2020', 'DD-MON-YYYY');
07-JUN-20 falls on weekend
Done…

PL/SQL 过程已成功完成。
**/













