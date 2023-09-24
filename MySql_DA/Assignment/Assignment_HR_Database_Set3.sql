---------------------------------- HR DATABASE SET_3-------------------------

USE HR;
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM hr.locations;

/* 1. Write a query that displays the employee's last names only from the string's 2-5th 
position with the first letter capitalized and all other letters lowercase, Give each column an 
appropriate label. */
SELECT last_name, CONCAT(UCASE(SUBSTR(last_name,2,1)),LCASE(substr(last_name,3,3)))
FROM EMPLOYEES;

/* 2. Write a query that displays the employee's first name and last name along with a " in 
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month on which the employee has joined.*/
SELECT first_name,last_name,CONCAT_WS("-",first_name,last_name) AS EMP_NAME,DATE_FORMAT(hire_date,"%M") AS Hire_Month
FROM EMPLOYEES;

/*3. Write a query to display the employee's last name and if half of the salary is greater than 
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label. */
SELECT first_name,last_name,
CASE 
    WHEN salary/2 >10000 THEN 1.1*salary
    ELSE 1.115*salary+1500
END AS Updated_Salary
FROM EMPLOYEES;

/*4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
department id, salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with '$! */
SELECT employee_id,CONCAT(INSERT(employee_id,2,0,"00"),"E") AS Emp_idd,department_id,salary,UCASE(manager_name) AS manager,
CASE 
    WHEN manager_name LIKE 'Z%' THEN '$!'
    WHEN manager_name LIKE '%Z%' THEN '$!'
    WHEN manager_name LIKE '%Z' THEN '$!'
    ELSE manager_name
END AS MANGER_EDITED
FROM EMPLOYEES;

/* 5. Write a query that displays the employee's last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name 
starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
employees' last names */
SELECT CONCAT(UCASE(SUBSTR(last_name,1,1)),LCASE(SUBSTR(last_name,2))) AS Sur_Name,LENGTH(last_name) AS Char_Length
FROM EMPLOYEES
WHERE last_name LIKE 'A%' OR last_name LIKE 'J%' OR last_name LIKE 'M%'
ORDER BY last_name;

/*6. Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY */
SELECT last_name,salary,CONCAT('$'," ",(FORMAT(salary,15))) AS Emp_Salary
FROM EMPLOYEES;

/*7. Display the employee's name if it is a palindrome */
SELECT first_name FROM EMPLOYEES
WHERE first_name=REVERSE(first_name);

/*8. Display First names of all employees with initcaps.*/
SELECT  CONCAT(UCASE(SUBSTR(first_name,1,1)),LCASE(SUBSTR(first_name,2))) AS INITCAP_NAME FROM EMPLOYEES;

/*9. From LOCATIONS table, extract the word between first and second space from the 
STREET ADDRESS column. */
select Street_Address,;

/*10. Extract first letter from First Name column and append it with the Last Name. Also add 
"@systechusa.com" at the end. Name the column as e-mail address. All characters should 
be in lower case. Display this along with their First Name. */
SELECT first_name,last_name,LCASE(CONCAT(SUBSTR(first_name,1,1),last_name,"@systechusa.com")) AS Email_address
FROM EMPLOYEES;

/*11. Display the names and job titles of all employees with the same job as Trenna. */
SELECT CONCAT_WS(" ",first_name,last_name) AS Full_Name,job_title 
FROM EMPLOYEES
WHERE job_title IN 
(SELECT job_title FROM EMPLOYEES WHERE first_name ='Trenna');

/*12. Display the names and department name of all employees working in the same city as Trenna. */
SELECT CONCAT_WS(" ",EMPLOYEES.first_name,EMPLOYEES.last_name) AS Full_Name,
DEPARTMENTS.department_name,locations.City 
FROM EMPLOYEES JOIN DEPARTMENTS ON EMPLOYEES.department_id=DEPARTMENTS.depart_id
JOIN locations ON DEPARTMENTS.loc_id=locations.Location_id
WHERE locations.City IN 
   (SELECT locations.City FROM EMPLOYEES 
    JOIN DEPARTMENTS ON EMPLOYEES.department_id=DEPARTMENTS.depart_id
    JOIN locations ON DEPARTMENTS.loc_id=locations.Location_id
	WHERE first_name ='Trenna');
    
/* 13. Display the name of the employee whose salary is the lowest. */
SELECT CONCAT_WS(" ",first_name,last_name) AS Full_Name
FROM EMPLOYEES
WHERE salary IN (SELECT MIN(salary) FROM EMPLOYEES);

/*14. Display the names of all employees except the lowest paid.*/
SELECT CONCAT_WS(" ",first_name,last_name) AS Full_Name
FROM EMPLOYEES
WHERE salary NOT IN (SELECT MIN(salary) FROM EMPLOYEES);



