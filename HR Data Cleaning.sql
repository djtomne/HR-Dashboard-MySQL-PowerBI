USE HRprj;

SELECT * FROM hr;
DESCRIBE hr;

-- -----------------------------------DATA CLEANING------------------------------------------

-- Change column name
ALTER TABLE hr
CHANGE COLUMN id emp_id VARCHAR(20) NULL;

-- Change the date of birthdate
UPDATE hr 
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;
-- Change the datatype of column birthdate
ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

SELECT birthdate 
FROM hr;

-- Change the date of hire date
UPDATE hr 
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
END;
-- Change the datatype of column date
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

SELECT hire_date FROM hr;

-- Change termdate to date
UPDATE hr
SET termdate = DATE(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

UPDATE hr
SET termdate = NULL 
WHERE termdate = '';
-- change datatype of termdate
ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SELECT termdate FROM hr;

-- Add age column
ALTER TABLE hr
ADD COLUMN age INT;
-- Update data in age column
UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());
-- Check the incorrect value
SELECT emp_id, birthdate, age FROM hr
WHERE age < 0; -- Incorrect because change year from 19xx to 20xx
-- Update wrong birthdate 
UPDATE hr 
SET birthdate = DATE_SUB(birthdate, INTERVAL 100 YEAR)
WHERE YEAR(birthdate) > 2024;

-- Create find_employee procedure
DELIMITER $$
CREATE PROCEDURE find_employee(
	IN f_emp_id varchar(20),
    IN f_first_name text,
    IN f_last_name text
    )
BEGIN
	SELECT *
    FROM hr
    WHERE (f_emp_id IS NOT NULL AND emp_id = f_emp_id)
    OR (f_first_name IS NOT NULL AND first_name = f_first_name)
    OR (f_last_name IS NOT NULL AND last_name = f_last_name);
END$$
DELIMITER ;

CALL find_employee(NULL, NULL, 'Suff');

SELECT birthdate, age FROM hr;



 







-- -------------------------------------------------------------------------------------------