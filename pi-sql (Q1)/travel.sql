CREATE DEFINER=`root`@`localhost` FUNCTION `travel`(novaccine INT) RETURNS varchar(20) CHARSET utf8mb4
BEGIN
IF(novaccine=2)
THEN
RETURN ("ALIGIBLE FOR GOING ABORD");
ELSE 
RETURN ("NOT ALIGIBLE FOR GOING ABORD");
END IF;
END