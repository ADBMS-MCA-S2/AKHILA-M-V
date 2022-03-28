CREATE DATABASE EMPLOYEES;

USE EMPLOYEES;

CREATE TABLE EMPLOYEE(
EMPNO char(4) not null,
    EMPNAME varchar(30) not null,
    DEPT varchar(30) not null,
    SALARY int(8) not null,
    DOJ date not null,
    BRANCH varchar(20) not null,
    PRIMARY KEY(EMPNO)
);

INSERT INTO EMPLOYEE(EMPNO,EMPNAME,DEPT,SALARY,DOJ,BRANCH) VALUES("E101","Amit","Production",45000,"2000-03-12","Banglore");
INSERT INTO EMPLOYEE(EMPNO,EMPNAME,DEPT,SALARY,DOJ,BRANCH) VALUES("E102","Amit","HR",70000,"2002-07-03","Banglore");
INSERT INTO EMPLOYEE(EMPNO,EMPNAME,DEPT,SALARY,DOJ,BRANCH) VALUES("E103","Sunitha","Management",120000,"2001-01-11","Mysore");
INSERT INTO EMPLOYEE(EMPNO,EMPNAME,DEPT,SALARY,DOJ,BRANCH) VALUES("E105","Sunitha","IT",67000,"2001-08-01","Mysore");
INSERT INTO EMPLOYEE(EMPNO,EMPNAME,DEPT,SALARY,DOJ,BRANCH) VALUES("E106","Mahesh","Civil",145000,"2003-09-20","Mumbai");

SELECT * FROM EMPLOYEE;

SELECT EMPNO,SALARY FROM EMPLOYEE;

SELECT AVG(SALARY) FROM EMPLOYEE;

SELECT COUNT(*) FROM EMPLOYEE;

SELECT DISTINCT EMPNO FROM EMPLOYEE;

SELECT SUM(SALARY),EMPNAME,COUNT(EMPNAME) AS OCCURENCE FROM EMPLOYEE GROUP BY EMPNAME;

SELECT SUM(SALARY) FROM EMPLOYEE WHERE SALARY>120000;

SELECT EMPNAME FROM EMPLOYEE ORDER BY EMPNAME DESC;

SELECT * FROM EMPLOYEE WHERE EMPNAME="Amit" AND SALARY>50000;

