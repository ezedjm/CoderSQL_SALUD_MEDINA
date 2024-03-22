-- -----------------------------------------------------
-- Function para validar mails, da T o F si es correcto 
-- el formato o no
-- -----------------------------------------------------
DELIMITER //
CREATE FUNCTION f_ValidateEmail(email VARCHAR(100)) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE isValid BOOLEAN DEFAULT FALSE;
    -- recorto los vacios del campo email ingresado 
    SET email = TRIM(email); 
    -- expresión para validar direcciones de correo electrónico
    IF email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
        SET isValid = TRUE;
    END IF;
    
    RETURN isValid;
END //
DELIMITER ;

-- prueba
SELECT f_ValidateEmail('correo@ejemplo+.com.');




-- -----------------------------------------------------
--  Function para encontrar pacientes por nombre y apellido
-- -----------------------------------------------------
DELIMITER //
CREATE FUNCTION f_FindPatientsByName(p_name VARCHAR(100)) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE pID INT;
    SELECT idPatients INTO pID
    FROM Patients
    WHERE Name = p_name ;
    
    RETURN pID;
END //
DELIMITER ;

-- prueba
SELECT count(f_FindPatientsByName('Laura García'));
SELECT f_FindPatientsByName('Laura García');


