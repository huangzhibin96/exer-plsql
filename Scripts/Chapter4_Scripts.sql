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


-- ch04_1b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
   v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
   v_day  VARCHAR2(15); 
BEGIN
   v_day := TO_CHAR(v_date, 'DAY');
   
   IF v_day IN ('SATURDAY', 'SUNDAY') THEN
      DBMS_OUTPUT.PUT_LINE (v_date||' falls on weekend'); 
   END IF; 
   
   --- control resumes here
   DBMS_OUTPUT.PUT_LINE ('Done…');
END;
/**
输入 sv_user_date 的值:  13-JAN-2008
原值    2:    v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
新值    2:    v_date DATE := TO_DATE('13-JAN-2008', 'DD-MON-YYYY');
Done…

PL/SQL 过程已成功完成。
**/



-- ch04_1c.sql, version 3.0
SET SERVEROUTPUT ON
DECLARE
   v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
   v_day  VARCHAR2(15);
BEGIN
   v_day := RTRIM(TO_CHAR(v_date, 'DAY'));
   
   IF v_day LIKE 'S%' THEN
      DBMS_OUTPUT.PUT_LINE (v_date||' falls on weekend'); 
   END IF; 
   
   -- control resumes here
   DBMS_OUTPUT.PUT_LINE ('Done…');
END;
/**
输入 sv_user_date 的值:  13-JAN-2008
原值    2:    v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
新值    2:    v_date DATE := TO_DATE('13-JAN-2008', 'DD-MON-YYYY');
Done…

PL/SQL 过程已成功完成。
**/

-- ch04_1d.sql, version 4.0
SET SERVEROUTPUT ON
DECLARE
   v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
   v_day  VARCHAR2(15); 
BEGIN
   v_day := RTRIM(TO_CHAR(v_date, 'DAY'));
   
   IF v_day IN ('SATURDAY', 'SUNDAY') THEN
       DBMS_OUTPUT.PUT_LINE (v_date||' falls on weekend');
   ELSE
      DBMS_OUTPUT.PUT_LINE (v_date||' does not fall on the weekend'); 
   END IF; 
   
   -- control resumes here
   DBMS_OUTPUT.PUT_LINE('Done…');
END;
/**
输入 sv_user_date 的值:  13-JAN-2008
原值    2:    v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
新值    2:    v_date DATE := TO_DATE('13-JAN-2008', 'DD-MON-YYYY');
13-JAN-08 falls on weekend
Done…

PL/SQL 过程已成功完成。
**/



SELECT * FROM enrollment e;
SELECT * FROM SECTION;

-- ch04_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
   v_total NUMBER;
BEGIN
   SELECT COUNT(*)
     INTO v_total
     FROM enrollment e
     JOIN section s USING (section_id)
    WHERE s.course_no = 25
      AND s.section_no = 1;
   
   -- check if section 1 of course 25 is full   
   IF v_total >= 15 THEN
      DBMS_OUTPUT.PUT_LINE ('Section 1 of course 25 is full');
   ELSE
      DBMS_OUTPUT.PUT_LINE ('Section 1 of course 25 is not full');
   END IF;
   -- control resumes here
END;
/**
Section 1 of course 25 is not full

PL/SQL 过程已成功完成。
**/


SELECT * FROM course;

-- ch04_2b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
   v_total      NUMBER;
   v_course_no  CHAR(6) := '&sv_course_no';
   v_section_no NUMBER  := &sv_section_no;
BEGIN
   SELECT COUNT(*)
     INTO v_total
     FROM enrollment e
     JOIN section s USING (section_id)
   WHERE s.course_no = v_course_no
     AND s.section_no = v_section_no;
   
   -- check if a specific section of a course is full   
   IF v_total >= 15 THEN
      DBMS_OUTPUT.PUT_LINE ('Section 1 of course 25 is full');
   ELSE
      DBMS_OUTPUT.PUT_LINE ('Section 1 of course 25 is not full');
   END IF;
   -- control resumes here
END;
/**
输入 sv_course_no 的值:  120
原值    3:    v_course_no  CHAR(6) := '&sv_course_no';
新值    3:    v_course_no  CHAR(6) := '120';
输入 sv_section_no 的值:  3
原值    4:    v_section_no NUMBER  := &sv_section_no;
新值    4:    v_section_no NUMBER  := 3;
Section 1 of course 25 is not full

PL/SQL 过程已成功完成。
**/


-- ch04_2c.sql, version 3.0
SET SERVEROUTPUT ON
DECLARE
   v_total NUMBER;
   v_students NUMBER;
BEGIN
   SELECT COUNT(*)
     INTO v_total
     FROM enrollment e
     JOIN section s USING (section_id)
    WHERE s.course_no = 25
      AND s.section_no = 1;

   -- check if section 1 of course 25 is full   
   IF v_total >= 25 THEN 
      DBMS_OUTPUT.PUT_LINE ('Section 1 of course 25 is full');
   ELSE
      v_students := 25 - v_total; 
      DBMS_OUTPUT.PUT_LINE (v_students||' students can still enroll'||
                            ' into section 1 of course 25');
   END IF;
   -- control resumes here
END;
/**
20 students can still enroll into section 1 of course 25

PL/SQL 过程已成功完成。
**/


DECLARE
   v_num NUMBER := &sv_num;
BEGIN
   IF v_num < 0 THEN
      DBMS_OUTPUT.PUT_LINE (v_num||' is a negative number');
   ELSIF v_num = 0 THEN
      DBMS_OUTPUT.PUT_LINE (v_num||' is equal to zero');
   ELSE
      DBMS_OUTPUT.PUT_LINE (v_num||' is a positive number');
   END IF;
END;
/**
输入 sv_num 的值:  5
原值    2:    v_num NUMBER := &sv_num;
新值    2:    v_num NUMBER := 5;
5 is a positive number

PL/SQL 过程已成功完成。
**/




DECLARE
   v_num NUMBER := &sv_num;
BEGIN
   IF v_num < 0 THEN
      DBMS_OUTPUT.PUT_LINE (v_num||' is a negative number');
   ELSIF v_num > 0 THEN
      DBMS_OUTPUT.PUT_LINE (v_num||' is a positive number');
   END IF;
   DBMS_OUTPUT.PUT_LINE ('Done…');
END;

/**
输入 sv_num 的值:  0
原值    2:    v_num NUMBER := &sv_num;
新值    2:    v_num NUMBER := 0;
Done…

PL/SQL 过程已成功完成。
**/


















