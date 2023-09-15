---------------------------------- HR DATABASE SET_4-------------------------

USE HR;
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM hr.locations;

/* 1. Write a query to display the last name, department number, department name for all employees.*/
SELECT E.last_name,E.department_id,D.department_name
FROM EMPLOYEES AS E
JOIN DEPARTMENTS AS D
 ON E.department_id=D.depart_id;

/* 2. Create a unique list of all jobs that are in department Finance. Include the location of the
department in the output.*/
SELECT E.job_title,l.Street_Address,l.City
FROM EMPLOYEES AS E
     JOIN DEPARTMENTS AS D
     ON E.department_id=D.depart_id
     JOIN locations AS l
     ON D.loc_id=l.Location_id
WHERE D.department_name='Finance';

/* 3. Write a query to display the employee last name,department name,location id and city of 
all employees who earn commission. */
SELECT E.last_name,D.department_name,l.Location_id,l.City
FROM EMPLOYEES AS E
 JOIN DEPARTMENTS AS D
 ON E.department_id=D.depart_id
 JOIN locations AS l
 ON D.loc_id=l.Location_id
WHERE E.commission_pct>0.00;

/*4. Display the employee last name and department name of all employees who have an 'a' 
in their last name*/
SELECT E.last_name,D.department_name
FROM EMPLOYEES AS E
JOIN DEPARTMENTS AS D
ON E.department_id=D.depart_id
WHERE E.last_name LIKE 'A%' OR E.last_name LIKE '%A%' OR E.last_name LIKE '%A';

/*5. Write a query to display the last name,job,department number and department name for 
all employees who work in ATLANTA. */
SELECT E.last_name,E.job_title,D.depart_id,D.department_name
FROM EMPLOYEES AS E
 JOIN DEPARTMENTS AS D
 ON E.department_id=D.depart_id
 JOIN locations AS l
 ON D.loc_id=l.Location_id
WHERE l.City='Atlanta';

/* 6. Display the employee last name and employee number along with their manager's last 
name and manager number. */
SELECT employee_id,last_name,manager_id,manager_name
FROM EMPLOYEES;

/* 7. Display the employee last name and employee number along with their manager's last 
name and manager number (including the employees who have no manager). */
SELECT employee_id,last_name,manager_id,manager_name
FROM EMPLOYEES;

/* 8. Create a query that displays employees last name,department number,and all the 
employees who work in the same department as a given employee. */
SELECT E.last_name,D.depart_id,D.department_name
FROM EMPLOYEES AS E
JOIN DEPARTMENTS AS D
ON E.department_id=D.depart_id;

/*9. Create a query that displays the name,job,department name,salary,grade for all 
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)*/
SELECT CONCAT_WS(" ",E.first_name,E.last_name) AS Full_Name,E.job_title,D.department_name,E.salary,
CASE 
    WHEN E.salary>=50000 THEN 'A'
    WHEN E.salary>=30000 THEN 'B'
    ELSE 'C'
END AS Grade
FROM EMPLOYEES AS E
JOIN DEPARTMENTS AS D
 ON E.department_id=D.depart_id;

/*10. Display the names and hire date for all employees who were hired before their 
managers along withe their manager names and hire date. Label the columns as Employee 
name, emp_hire_date,manager name,man_hire_date*/
SELECT CONCAT_WS(" ",E.first_name,E.last_name) AS 'Employee Name',E.hire_date AS emp_hire_date,
E.manager_name,D.manager_hiredate
FROM EMPLOYEES AS E
JOIN DEPARTMENTS AS D
ON E.department_id=D.depart_id
WHERE E.hire_date < D.manager_hiredate;