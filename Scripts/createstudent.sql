SELECT TABLESPACE_NAME FROM DBA_TABLESPACES ORDER BY TABLESPACE_NAME;

CREATE USER student IDENTIFIED by learn
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE TO student;


--再插入下面的一条数据后报错:ORA-01843: 无效的月份

--原因是这个TO_DATE的Format中的“MON”格式出现异常，但是这个格式完全符合Oracle的格式要求。
--再查看nls_date_language参数，发现这个参数值为NULL
SELECT * FROM v$parameter WHERE name = 'nls_date_language';

--因为是中文的环境，因此需要把这个参数改成AMERICAN
ALTER SESSION SET NLS_DATE_LANGUAGE='AMERICAN';


