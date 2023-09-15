use school;

CREATE TABLE STUDENT(
StdId INT PRIMARY KEY NOT NULL,
StdName VARCHAR(45) NOT NULL,
SEX VARCHAR(10),
Percentage INT,
Class INT,
Sec VARCHAR(5),
Stream varchar(10),
DOB DATE);

SELECT * FROM STUDENT;

/* 1 To display all the records form STUDENT table. SELECT * FROM student ; */
SELECT * FROM STUDENT;

/* 2. To display any name and date of birth from the table STUDENT. SELECT StdName, DOB
FROM student ; */
 SELECT StdName, DOB FROM student ;

/* 3. To display all students record where percentage is greater of equal to 80 FROM student table.
SELECT * FROM student WHERE percentage >= 80; */
SELECT * FROM student WHERE percentage >= 80;

/* 4. To display student name, stream and percentage where percentage of student is more than 80
SELECT StdName, Stream, Percentage WHERE percentage > 80;*/
SELECT StdName, Stream, Percentage 
FROM STUDENT WHERE percentage > 80;

/*5. To display all records of science students whose percentage is more than 75 form student table.
SELECT * FORM student WHERE stream = ‘Science’ AND percentage > 75; */
SELECT * FROM student WHERE stream = "Science" AND percentage > 75;
