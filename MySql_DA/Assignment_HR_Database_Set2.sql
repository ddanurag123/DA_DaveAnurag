---------------------------------- HR DATABASE SET_2-------------------------

USE HR;
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

/*1) Display the maximum, minimum and average salary and commission earned.  */
SELECT MAX(salary) AS MAX_SALARY,MIN(salary) AS MIN_SALARY,AVG(salary) AS AVG_SALARY
FROM EMPLOYEES;

/*2) Display the department number, total salary payout and total commission payout for each department.  */
SELECT DISTINCT department_id,SUM(salary),SUM(commission_pct)
FROM EMPLOYEES
GROUP BY department_id ;

/*3) Display the department number and number of employees in each department.  */
SELECT department_id,Count(employee_id)
FROM EMPLOYEES
GROUP BY department_id;

/*4) Display the department number and total salary of employees in each department. */
SELECT department_name,SUM(salary)
FROM EMPLOYEES
JOIN DEPARTMENTS ON EMPLOYEES.department_id=DEPARTMENTS.depart_id
GROUP BY DEPARTMENTS.department_name;

/*5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name  */
SELECT concat_ws(" ",first_name,last_name) AS E_NAME
FROM EMPLOYEES
WHERE commission_pct=0.00;

/*6) Display the employees name, department id and commission. If an Employee doesn't 
earn the commission, then display as 'No commission'. Name the columns appropriately */
SELECT concat_ws(" ",first_name,last_name) AS E_NAME,department_id,
CASE 
    WHEN commission_pct=0.00 THEN 'No Commission'
    ELSE commission_pct
END AS Commission_pct
 FROM EMPLOYEES;


/*7) Display the employee's name, salary and commission multiplied by 2. If an Employee 
doesn't earn the commission, then display as 'No commission. Name the columns appropriately */
SELECT concat_ws(" ",first_name,last_name) AS E_NAME,salary,
CASE 
    WHEN commission_pct=0.00 THEN 'No Commission'
    ELSE 2*commission_pct
END AS Commission_pct
 FROM EMPLOYEES;
 
 /* 8) Display the employee's name, department id who have the first name same as another 
employee in the same department. */
SELECT EMPLOYEES.first_name,EMPLOYEES.department_id,DEPARTMENTS.department_name,COUNT(*)
FROM EMPLOYEES
JOIN DEPARTMENTS ON EMPLOYEES.department_id=DEPARTMENTS.depart_id
GROUP BY EMPLOYEES.first_name,EMPLOYEES.department_id,DEPARTMENTS.department_name
HAVING COUNT(*)>1;

/*9) Display the sum of salaries of the employees working under each Manager. */
SELECT manager_id, SUM(salary)
FROM EMPLOYEES
GROUP BY manager_id;

/* 10) Select the Managers name, the count of employees working under and the department 
ID of the manager.*/
SELECT manager_name,COUNT(employee_id) AS total_emp,department_id
FROM EMPLOYEES
GROUP BY manager_name,department_id;

/* 11) Select the employee name, department id, and the salary. Group the result with the 
manager name and the employee last name should have second letter 'a! */
SELECT first_name,department_id,salary,manager_name
FROM EMPLOYEES
WHERE last_name LIKE '%a';

/*12) Display the average of sum of the salaries and group the result with the department id. 
Order the result with the department id. */
SELECT department_id,AVG(salary) AS Avg_salary
FROM EMPLOYEES
GROUP BY department_id
ORDER BY department_id;

/* 13) Select the maximum salary of each department along with the department id */
SELECT EMPLOYEES.department_id,DEPARTMENTS.department_name,MAX(EMPLOYEES.salary)
FROM EMPLOYEES
JOIN DEPARTMENTS ON EMPLOYEES.department_id=DEPARTMENTS.depart_id
GROUP BY EMPLOYEES.department_id,DEPARTMENTS.department_name;

/* 14) Display the commission, if not null display 10% of salary, if null display a default value 1 */
SELECT employee_id,commission_pct,
CASE 
	WHEN commission_pct = 0.00 THEN '1'
    ELSE 0.10*salary
END AS Salary
FROM EMPLOYEES;
