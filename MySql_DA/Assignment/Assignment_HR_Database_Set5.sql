---------------------------------- HR DATABASE SET_5-------------------------

USE HR;
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM hr.locations;

/*1. Write a query to display the last name and hire date of any employee in the same 
department as SALES. */
SELECT E.last_name,E.hire_date
FROM EMPLOYEES AS E
JOIN DEPARTMENTS AS D 
    ON E.department_id=D.depart_id
WHERE D.department_name='Sales';

/*2. Create a query to display the employee numbers and last names of all employees who 
earn more than the average salary. Sort the results in ascending order of salary.*/
SELECT employee_id,last_name
FROM EMPLOYEES
WHERE salary> (SELECT AVG(salary) FROM EMPLOYEES)
ORDER BY salary ;

/* 3. Write a query that displays the employee numbers and last names of all employees who 
work in a department with any employee whose last name contains a' u */
SELECT E.employee_id,E.last_name,D.department_name FROM EMPLOYEES AS E
JOIN DEPARTMENTS AS D   ON E.department_id=D.depart_id
WHERE D.department_name IN
      (SELECT DISTINCT D.department_name FROM EMPLOYEES
       JOIN DEPARTMENTS ON E.department_id=D.depart_id
       WHERE E.last_name LIKE 'A%' OR E.last_name LIKE '%A%' OR E.last_name LIKE '%A' OR 
       E.last_name LIKE 'U%' OR E.last_name LIKE '%U%' OR E.last_name LIKE '%U');
  
  /* 4. Display the last name, department number, and job ID of all employees whose 
department location is ATLANTA. */
SELECT E.last_name,D.depart_id,E.job_id FROM EMPLOYEES AS E
JOIN DEPARTMENTS AS D  
ON E.department_id=D.depart_id
JOIN locations AS L 
ON D.loc_id=L.Location_id
    WHERE L.City='Atlanta';
    
/*5. Display the last name and salary of every employee who reports to FILLMORE. */
SELECT last_name,salary
FROM EMPLOYEES
WHERE manager_name ='Priyanka' ;

/*6. Display the department number, last name, and job ID for every employee in the 
OPERATIONS department. */
SELECT E.last_name,E.job_id,D.depart_id
FROM EMPLOYEES AS E
JOIN DEPARTMENTS AS D  ON E.department_id=D.depart_id
WHERE D.department_name='Operations';

/* 7. Modify the above query to display the employee numbers, last names, and salaries of all 
employees who earn more than the average salary and who work in a department with any 
employee with a 'u'in their name. */
SELECT E.employee_id,E.last_name,E.salary,D.department_name
FROM EMPLOYEES AS E
JOIN DEPARTMENTS AS D  
ON E.department_id=D.depart_id
WHERE E.salary> (SELECT AVG(salary) FROM EMPLOYEES) AND D.department_name IN
	               (SELECT D.department_name FROM EMPLOYEES AS E JOIN DEPARTMENTS AS D  ON E.department_id=D.depart_id
                    WHERE E.first_name LIKE 'U%' OR E.first_name LIKE '%U%' OR E.first_name LIKE '%U');
     
/*8. Display the names of all employees whose job title is the same as anyone in the sales dept. */
SELECT E.first_name,E.job_title FROM EMPLOYEES AS E 
JOIN DEPARTMENTS AS D  ON E.department_id=D.depart_id
WHERE E.job_title IN (SELECT E.job_title FROM EMPLOYEES AS E 
        JOIN DEPARTMENTS AS D  ON E.department_id=D.depart_id
        WHERE D.department_name='Sales');
        
/* 9. Write a compound query to produce a list of employees showing raise percentages, 
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
given a 15% raise, and employees in department 6 are not given a raise.*/
SELECT E.employee_id, E.first_name,E.salary,
 CASE 
  WHEN D.department_name='Finance' OR D.department_name='Marketing' THEN '5%'
  WHEN D.department_name='Administration' THEN '10%'
  WHEN D.department_name='Human Resource' OR D.department_name='Sales' THEN '15%'
  WHEN D.department_name='Accounting' THEN 'no raise'
  ELSE "NA"
END AS '%Raise'
FROM EMPLOYEES AS E 
JOIN DEPARTMENTS AS D  ON E.department_id=D.depart_id
WHERE D.department_name IN ('Finance','Marketing','Administration','Human Resource','Sales','Accounting') ;

/*10. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
names and salaries. */
SELECT last_name,salary
FROM EMPLOYEES
ORDER BY salary DESC
LIMIT 3;

/* 11. Display the names of all employees with their salary and commission earned. Employees 
with a null commission should have O in the commission column */
SELECT first_name,salary,
 CASE
     WHEN commission_pct IS NULL THEN '0'
     ELSE commission_pct
END AS commission
FROM EMPLOYEES ;

/*12. Display the Managers (name) with top three salaries along with their salaries and 
department information.*/
SELECT E.manager_name,E.salary AS emp_salary,D.depart_id,D.department_name,D.manager_salary
FROM EMPLOYEES AS E 
JOIN DEPARTMENTS AS D ON E.department_id=D.depart_id
ORDER BY E.salary DESC
LIMIT 3;

