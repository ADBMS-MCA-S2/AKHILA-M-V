CREATE DATABASE Departments;

USE Departments;

CREATE TABLE Dept(
	DEPTNO int NOT NULL,
	DNAME varchar(30) NOT NULL,
	LOC varchar(30) NOT NULL
	);
   
SELECT * FROM dept;

SELECT * FROM department;

RENAME TABLE dept TO department;

ALTER TABLE department ADD COLUMN PINCODE int(6) NOT NULL;

ALTER TABLE department DROP COLUMN PINCODE;

ALTER TABLE department CHANGE DNAME DEPT_NAME varchar(30);

ALTER TABLE department MODIFY COLUMN LOC char(10);

DROP TABLE department;