-- ch02_1a.sql
SET serveroutput ON;
DECLARE
 v_name          VARCHAR2(30);
 v_dob           DATE;
 v_us_citizen    BOOLEAN;
BEGIN
  dbms_output.put_line(coalesce(v_name, 'NO NAME') ||' born on '|| coalesce(v_dob,SYSDATE));
END;

--NO NAME born on 07-6月 -20


SET serveroutput ON;
DECLARE
  v_var1 VARCHAR2(20);
  v_var2 VARCHAR2(6);
  v_var3 NUMBER(5,3);
BEGIN
  v_var1 := 'String literal';
  v_var2 := '12.345';
  v_var3 := 12.345;

  DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
  DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
  DBMS_OUTPUT.PUT_LINE('v_var3: '||v_var3);
END;

/**
v_var1: String literal
v_var2: 12.345
v_var3: 12.345
**/

SET serveroutput ON;
DECLARE
  v_var1 NUMBER(2) := 123;
  v_var2 NUMBER(3) := 123;
  v_var3 NUMBER(5,3) := 123456.123;
BEGIN
  DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
  DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
  DBMS_OUTPUT.PUT_LINE('v_var3: '||v_var3);
END;
/**
ORA-06502: PL/SQL: 数字或值错误 :  数值精度太高
ORA-06512: 在 line 2
**/



-- ch02_2a.sql
SET serveroutput ON;
DECLARE
   v_name student.first_name%TYPE;
   v_grade grade.numeric_grade%TYPE;
BEGIN
   DBMS_OUTPUT.PUT_LINE(NVL(v_name, 'No Name ')||' has grade of '||NVL(v_grade,0));
END;
/**
No Name  has grade of 0
**/



-- ch02_3a.sql
SET serveroutput ON;
DECLARE
   v_cookies_amt   NUMBER := 2;
   v_calories_per_cookie CONSTANT NUMBER := 300;
BEGIN
   DBMS_OUTPUT.PUT_LINE('I ate ' || v_cookies_amt || ' cookies with ' ||
   v_cookies_amt * v_calories_per_cookie || ' calories. ');
   
   v_cookies_amt := 3;
   DBMS_OUTPUT.PUT_LINE('I really ate ' || v_cookies_amt || ' cookies with ' ||
   v_cookies_amt * v_calories_per_cookie || ' calories. ');
   
   v_cookies_amt := v_cookies_amt + 5;
   DBMS_OUTPUT.PUT_LINE('The truth is, I actually ate ' || v_cookies_amt || ' cookies with ' ||
   v_cookies_amt * v_calories_per_cookie || ' calories. ');
END;
/**
I ate 2 cookies with 600 calories. 
I really ate 3 cookies with 900 calories. 
The truth is, I actually ate 8 cookies with 2400 calories. 
**/


--ch02_3b,sql, version 2.0
SET serveroutput ON
DECLARE
   v_lname   VARCHAR2(30);
   v_regdate DATE;
   v_pctincr CONSTANT NUMBER(4,2) := 1.50;
   v_counter NUMBER := 0;
   v_new_cost course.cost%TYPE;
   v_YorN    BOOLEAN := TRUE;
BEGIN
  v_counter := NVL(v_counter, 0) + 1;
  v_new_cost := 800 * v_pctincr;
  
  DBMS_OUTPUT.PUT_LINE(v_counter);
  DBMS_OUTPUT.PUT_LINE(v_new_cost);
  
  v_counter := ((v_counter + 5)*2) / 2;
  v_new_cost := (v_new_cost * v_counter)/4;
  
  DBMS_OUTPUT.PUT_LINE(v_counter);
  DBMS_OUTPUT.PUT_LINE(v_new_cost);
END;
/**
1
1200
6
1800
**/


-- ch02_4b.sql  无法执行 不懂问题出在哪里
SET serveroutput ON;
<<outer_block>>
DECLARE
   v_test NUMBER := 123;
BEGIN
   DBMS_OUTPUT.PUT_LINE('Outer Block, v_test: '|| v_test);
   <<inner_block>>
   DECLARE
      v_test NUMBER := 456;
   BEGIN
      DBMS_OUTPUT.PUT_LINE('Inner Block, v_test: '|| v_test);
      DBMS_OUTPUT.PUT_LINE('Inner Block, outer_block.v_test: '|| Outer_block.v_test);
   END inner_block;
END outer_block;

















