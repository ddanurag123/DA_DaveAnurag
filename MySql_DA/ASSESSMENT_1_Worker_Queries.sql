-- Assessment 1:
CREATE DATABASE ASSESSMENT;
USE ASSESSMENT;

CREATE TABLE WORKER
(WORKER_ID INT primary KEY NOT NULL,
FIRST_NAME varchar(20),
LAST_NAME varchar(20),
SALARY INT,
JOINING_DATE datetime,
DEPARTMENT varchar(20));

SELECT * FROM ASSESSMENT.WORKER;

/*1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME
Ascending and DEPARTMENT Descending */
SELECT * FROM WORKER
ORDER BY FIRST_NAME ASC , DEPARTMENT  DESC;

/*2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”
from the Worker table*/
SELECT * FROM WORKER
WHERE FIRST_NAME ="VIPUL" OR FIRST_NAME="SATISH";

/* 3.Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and
contains six alphabets. */
SELECT * FROM WORKER
WHERE FIRST_NAME LIKE "_____H";

/*4. Write an SQL query to print details of the Workers whose SALARY lies between 1. */
SELECT * FROM WORKER
WHERE SALARY BETWEEN 100000 AND 500000;

/* 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. */
SELECT FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT,COUNT(*) FROM WORKER
GROUP BY FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT
HAVING COUNT(*)>1;

/* 6. Write an SQL query to show the top 6 records of a table.  */
SELECT * FROM WORKER 
LIMIT 6;

/* 7. Write an SQL query to fetch the departments that have less than five people in them.  */
SELECT  DEPARTMENT, COUNT(FIRST_NAME) AS TOT_PEOPLE FROM WORKER
GROUP BY DEPARTMENT
HAVING COUNT(FIRST_NAME)<5;
 
/* 8. Write an SQL query to show all departments along with the number of people in there. */
SELECT  DEPARTMENT, COUNT(FIRST_NAME) AS TOT_PEOPLE FROM WORKER
GROUP BY DEPARTMENT;

/* 9. Write an SQL query to print the name of employees having the highest salary in each
department.  */
SELECT concat_ws(" ",FIRST_NAME,LAST_NAME) AS NAME, DEPARTMENT,SALARY
FROM WORKER
WHERE SALARY IN(SELECT MAX(SALARY) FROM WORKER group by DEPARTMENT);








 







