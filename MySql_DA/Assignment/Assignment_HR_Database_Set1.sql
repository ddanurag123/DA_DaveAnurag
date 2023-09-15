/* CREATE DATABASE HR;
USE HR;

 CREATE TABLE departments (
	department_id INT  UNSIGNED NOT NULL,
	department_name VARCHAR(30) NOT NULL,
	manager_id INT  UNSIGNED,
    manager_name varchar(20),
	city VARCHAR(30) NOT NULL,
    country_name varchar(20) NOT NULL,
	PRIMARY KEY (department_id)
	);
    
CREATE TABLE employees (
	employee_id INT  UNSIGNED NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	hire_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
    job_title VARCHAR(35) NOT NULL,
	salary DECIMAL(8, 2) NOT NULL,
	commission_pct DECIMAL(2, 2),
	manager_id INT  UNSIGNED,
	department_id INT  UNSIGNED,
	PRIMARY KEY (employee_id),
    foreign key(department_id) REFERENCES Departments(department_id)); */
USE HR;
-- 1. Display all information in the tables EMP and DEPT.
    SELECT * FROM DEPARTMENTS;
    SELECT * FROM EMPLOYEES;
    
-- 2. Display only the hire date and employee name for each employee. 
    Select concat_ws(" ",first_name,last_name),hire_date
    FROM EMPLOYEES;
    
/* 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title */
    SELECT concat(first_name," ",last_name,", ",job_title) AS "Employee And Title"
    FROM EMPLOYEES;
    
/* 4. Display the hire date, name and department number for all clerks. */
   SELECT hire_date,concat_ws(" ",first_name,last_name),department_id
   FROM EMPLOYEES
   WHERE job_title='Clerk';
   
/*5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT  */
SELECT concat_ws(",",employee_id,first_name,last_name,hire_date,job_title,salary,commission_pct,department_id,manager_id) AS 'THE OUTPUT'
FROM EMPLOYEES;

/*6. Display the names and salaries of all employees with a salary greater than 30000.  */
SELECT concat_ws(" ",first_name,last_name),salary
FROM EMPLOYEES
WHERE salary>30000;

/*7. Display the names and dates of employees with the column headers "Name" and "Start Date"  */
SELECT concat_ws(" ",first_name,last_name) AS NAME,hire_date AS "Start Date"
FROM EMPLOYEES;

/*8. Display the names and hire dates of all employees in the order they were hired. */
SELECT concat_ws(" ",first_name,last_name) AS NAME,hire_date
FROM EMPLOYEES
ORDER BY hire_date;

/*9. Display the names and salaries of all employees in reverse salary order */
SELECT concat_ws(" ",first_name,last_name) AS NAME,salary
FROM EMPLOYEES
ORDER BY salary DESC;

/*10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order. */
SELECT concat_ws(" ",first_name,last_name) AS E_NAME,department_id AS DEPTNO,salary
FROM EMPLOYEES
WHERE commission_pct>0.00 ORDER BY salary DESC;

/*11. Display the last name and job title of all employees who do not have a manager  */
SELECT last_name,job_title FROM EMPLOYEES where manager_id is null;

/*12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,5000, $3,5000, or $5,0000 */
SELECT last_name,job_title,salary
FROM EMPLOYEES
WHERE salary NOT IN (25000,35000,50000) AND job_title IN ("clerk","sales");

