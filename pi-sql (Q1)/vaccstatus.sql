CREATE DEFINER=`root`@`localhost` PROCEDURE `vaccstatus`(pid INT,pname VARCHAR(20),vaccine VARCHAR(20),novaccine INT)
BEGIN
IF (novaccine=2)
THEN
INSERT INTO COVSTATUS VALUES(pid,pname,vaccine,"FULLY VACCINATED");
END IF;
IF (novaccine=1)
THEN
INSERT INTO COVSTATUS VALUES(pid,pname,vaccine,"PARTIALY VACCINATED");
END IF;
IF (novaccine=0)
THEN
INSERT INTO COVSTATUS VALUES(pid,pname,vaccine,"NOT VACCINATED");
END IF;
END