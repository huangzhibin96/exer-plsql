SELECT TABLESPACE_NAME FROM DBA_TABLESPACES ORDER BY TABLESPACE_NAME;

CREATE USER student IDENTIFIED by learn
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE TO student;


--�ٲ��������һ�����ݺ󱨴�:ORA-01843: ��Ч���·�

--ԭ�������TO_DATE��Format�еġ�MON����ʽ�����쳣�����������ʽ��ȫ����Oracle�ĸ�ʽҪ��
--�ٲ鿴nls_date_language�����������������ֵΪNULL
SELECT * FROM v$parameter WHERE name = 'nls_date_language';

--��Ϊ�����ĵĻ����������Ҫ����������ĳ�AMERICAN
ALTER SESSION SET NLS_DATE_LANGUAGE='AMERICAN';


