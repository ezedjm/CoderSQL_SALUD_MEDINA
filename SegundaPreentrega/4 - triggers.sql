-- TRIGGERS BEFORE DE DNI DE DOCTORS
-- insert
DELIMITER //
CREATE TRIGGER before_insert_doctor
BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('INSERT', USER(), CONCAT('N/A', ' -> ', NEW.DNI));
END;
//
DELIMITER ;

-- update
DELIMITER //
CREATE TRIGGER before_update_doctor
BEFORE UPDATE ON Doctors
FOR EACH ROW
BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('UPDATE', USER(), CONCAT(OLD.DNI, ' -> ', NEW.DNI));
END;
//
DELIMITER ;

-- delete
DELIMITER //
CREATE TRIGGER before_delete_doctor
BEFORE DELETE ON Doctors
FOR EACH ROW
BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('DELETE', USER(), CONCAT(OLD.DNI, ' ->', 'N/A'));
END;
//
DELIMITER ;


-- TRIGGERS AFTER DE DOCTORS
-- insert
DELIMITER //
CREATE TRIGGER after_insert_doctor
AFTER INSERT ON Doctors
FOR EACH ROW
BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('INSERT', USER(), CONCAT('N/A', ' -> ', NEW.DNI));
END;
//
DELIMITER ;

-- update
DELIMITER //
CREATE TRIGGER after_update_doctor
AFTER UPDATE ON Doctors
FOR EACH ROW
BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('UPDATE', USER(), CONCAT(OLD.DNI, ' -> ', NEW.DNI));
END;
//
DELIMITER ;

-- delete
DELIMITER //
CREATE TRIGGER after_delete_doctor
AFTER DELETE ON Doctors
FOR EACH ROW
BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('DELETE', USER(), CONCAT(OLD.DNI, ' -> ', 'N/A'));
END;
//
DELIMITER ;


-- TRIGGERS BEFORE DE PATIENTS
-- insert
DELIMITER //
CREATE TRIGGER before_insert_patient
BEFORE INSERT ON Patients
FOR EACH ROW
BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('INSERT', USER(), CONCAT('N/A', ' -> ', NEW.DNI));
END;
//
DELIMITER ;

-- update
DELIMITER //
CREATE TRIGGER before_update_patient
BEFORE UPDATE ON Patients
FOR EACH ROW
BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('UPDATE', USER(), CONCAT(OLD.DNI, ' -> ', NEW.DNI));
END;
//
DELIMITER ;

-- delete
DELIMITER //
CREATE TRIGGER before_delete_patient
BEFORE DELETE ON Patients
FOR EACH ROW
BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('DELETE', USER(), CONCAT(OLD.DNI, ' -> ', 'N/A'));
END;
//
DELIMITER ;



-- TRIGGERS AFTER DE PATIENTS
-- insert
DELIMITER //
CREATE TRIGGER after_insert_patient
AFTER INSERT ON Patients
FOR EACH ROW
BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('INSERT', USER(), CONCAT('N/A', ' -> ', NEW.DNI));
END;
//
DELIMITER ;



-- update
DELIMITER //
CREATE TRIGGER after_update_patient
AFTER UPDATE ON Patients
FOR EACH ROW
BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('UPDATE', USER(), CONCAT(OLD.DNI, ' -> ', NEW.DNI));
END;
//
DELIMITER ;



-- delete
DELIMITER //
CREATE TRIGGER after_delete_patient
AFTER DELETE ON Patients
FOR EACH ROW
BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('DELETE', USER(), CONCAT(OLD.DNI, ' -> ', 'N/A'));
END;
//
DELIMITER ;


-- pruebas

INSERT INTO Doctors (DNI, Name, Password, email, Mobile, Med_Center_idMed_Center, Specialities_idSpecialities)
VALUES (100000028, 'jaja ksks', 'password1', 'juangarcia@example.com', '65262652', 1, 1);
select * from doctors; 
select * from log_doctors;




UPDATE Doctors SET DNI = 100000050 WHERE DNI = 100000028;
select * from doctors;
select * from log_doctors;

DELETE FROM Doctors WHERE DNI = 100000050;
select * from doctors;
select * from log_doctors;