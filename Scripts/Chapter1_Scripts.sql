--命令行模式 开启
set serveroutput ON;
SELECT * FROM student;

DECLARE
   v_first_name VARCHAR2(35);
   v_last_name VARCHAR2(35);
BEGIN
   SELECT first_name, last_name
     INTO v_first_name, v_last_name
     FROM student
    WHERE student_id = 1234;
   
   DBMS_OUTPUT.PUT_LINE ('Student name: '||v_first_name||' '||v_last_name);
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE ('There is no student with '|| 'student id 123');
END;


--student_id = 123;
--Student name: Pierre Radicola
--student_id = 1234;
--There is no student with student id 123

SELECT * FROM SECTION;
SELECT * FROM INSTRUCTOR;

DECLARE 
   v_name  VARCHAR2(50);
   v_total NUMBER;
BEGIN
   SELECT i.first_name||' '||i.last_name, COUNT(*)
     INTO v_name, v_total
     FROM instructor i, section s
    WHERE i.instructor_id = s.instructor_id
      AND i.instructor_id = 102
   GROUP BY i.first_name||' '||i.last_name;
   
   DBMS_OUTPUT.PUT_LINE 
      ('Instructor '||v_name||' teaches '||v_total||' courses');

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE ('There is no such instructor');
END;

--替代变量
DECLARE
   v_student_id NUMBER := &sv_student_id;
   v_first_name VARCHAR2(35);
   v_last_name VARCHAR2(35);
BEGIN
   SELECT first_name, last_name
     INTO v_first_name, v_last_name
     FROM student
    WHERE student_id = v_student_id;
   
   DBMS_OUTPUT.PUT_LINE ('Student name: '||v_first_name||' '||v_last_name);
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE ('There is no such student');
END;


BEGIN
   DBMS_OUTPUT.PUT_LINE ('Today is '||'&sv_day');
   DBMS_OUTPUT.PUT_LINE ('Tomorrow will be '||'&sv_day');
END;

Enter value for sv_day: Monday
old   2:    DBMS_OUTPUT.PUT_LINE ('Today is '||'&sv_day');
new   2:    DBMS_OUTPUT.PUT_LINE ('Today is '||'Monday');
Enter value for sv_day: Tuesday
 old   3:    DBMS_OUTPUT.PUT_LINE ('Tomorrow will be '||'&sv_day');
 new   3:    DBMS_OUTPUT.PUT_LINE ('Tomorrow will be ¬'||'Tuesday');
Today is Monday
Tomorrow will be Tuesday

PL/SQL procedure successfully completed.

SET VERIFY OFF;

Enter value for sv_day: Monday
Enter value for sv_day: Tuesday
Today is Monday
Tomorrow will be Tuesday

PL/SQL procedure successfully completed. 


-- ch01_1a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
   v_num NUMBER := &sv_num;
   v_result NUMBER;
BEGIN
   v_result := POWER(v_num, 2); 
    DBMS_OUTPUT.PUT_LINE ('The value of v_result is: '||
   v_result);
END;

Enter value for v_num: 10
old   2:    v_num    NUMBER := &sv_num;
new   2:    v_num    NUMBER := 10;
The value of v_result is: 100


-- ch01_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
   v_day VARCHAR2(20);
BEGIN
   v_day := TO_CHAR(SYSDATE, 'Day'); 
   DBMS_OUTPUT.PUT_LINE ('Today is '||v_day);
END;

Today is Friday
PL/SQL procedure successfully completed.


-- ch01_2b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
   v_day VARCHAR2(20);
BEGIN
   v_day := TO_CHAR(SYSDATE, 'Day, HH24:MI'); 
   DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;

Today is 星期日, 11:22
PL/SQL procedure successfully completed.
























