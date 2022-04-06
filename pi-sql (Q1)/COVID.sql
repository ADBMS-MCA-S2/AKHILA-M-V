CREATE DATABASE COVID;

USE COVID;

CREATE TABLE PERSON(
	pid INT NOT NULL,
    pname VARCHAR(20) NOT NULL,
    dob DATE NOT NULL,
    vaccine VARCHAR(20),
    novaccine INT NOT NULL,
    PRIMARY KEY(pid));

INSERT INTO PERSON VALUES(1,"Akhila","2000-09-13","COVISHEILD",2);
INSERT INTO PERSON VALUES(2,"Amal","2000-01-07","COVISHEILD",2);
INSERT INTO PERSON VALUES(3,"Aparna","1999-11-13","COVAXIN",1);
INSERT INTO PERSON VALUES(4,"Sreelakshmi","2003-06-06","COVAXIN",1);
INSERT INTO PERSON VALUES(5,"Clint","2001-10-23",NULL,0);

SELECT * FROM PERSON;

CREATE TABLE COVSTATUS(
	pid INT NOT NULL,
    pname VARCHAR(20) NOT NULL,
    vaccine VARCHAR(20),
    vstatus VARCHAR(20) NOT NULL);
    
    CALL vaccstatus(1,"Akhila","COVISHEILD",2);
    CALL vaccstatus(2,"Amal","COVISHEILD",2);
    CALL vaccstatus(3,"Aparna","COVAXIN",1);
    CALL vaccstatus(4,"Sreelakshmi","COVAXIN",1);
    CALL vaccstatus(5,"Clint",NULL,0);
    
    SELECT * FROM COVSTATUS;
    
    SELECT pid,pname,travel(novaccine) FROM PERSON;
    
    
    