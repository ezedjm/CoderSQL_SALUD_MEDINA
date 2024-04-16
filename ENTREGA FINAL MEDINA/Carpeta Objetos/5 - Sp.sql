-- -----------------------------------------------------
--  SP para mostrar historial de paciente por DNI
-- -----------------------------------------------------

DELIMITER //

CREATE PROCEDURE SP_GetPatientInfoByDNI (IN param_patientDNI INT)
BEGIN
    SELECT p.DNI AS Patient_DNI, p.Name AS Patient_Name, p.Age AS Patient_Age, p.City AS Patient_City, p.Birth AS Patient_Birth,
           d.Name AS Doctor_Name, d.email AS Doctor_Email, d.Mobile AS Doctor_Mobile,
           m.Name AS Med_Center_Name,
           s.Name AS Speciality_Name,
           dis.Name AS Disease_Name,
           med.Name AS Medication_Name, med.Composition AS Medication_Composition, med.Instructions AS Medication_Instructions,
           med.Side_Effects AS Medication_Side_Effects, med.Contraindications AS Medication_Contraindications
    FROM Patients p
    JOIN Diseases dis ON p.Diseases_idDiseases = dis.idDiseases
    JOIN Doctors d ON dis.Specialities_idSpecialities = d.Specialities_idSpecialities
    JOIN Med_Center m ON d.Med_Center_idMed_Center = m.idMed_Center
    JOIN Specialities s ON dis.Specialities_idSpecialities = s.idSpecialities
    JOIN Prescriptions pres ON p.DNI = pres.Patient_DNI
    JOIN medications med ON pres.Medication_idMedication = med.idMedication
    WHERE p.DNI = param_patientDNI;
END//

DELIMITER ;

CALL SP_GetPatientInfoByDNI(200000024);


-- -----------------------------------------------------
--  SP para generar citas medicas
-- -----------------------------------------------------
DELIMITER //

CREATE PROCEDURE SP_CreateMedicalAppointment(
    IN p_Patient_DNI INT,
    IN p_Doctor_DNI INT,
    IN p_Appointment_Date DATE,
    IN p_Appointment_Time TIME,
    IN p_Reason VARCHAR(255)
)
BEGIN
    DECLARE appointmentID INT;

    INSERT INTO Medical_Appointments (Patient_DNI, Doctor_DNI, Appointment_Date, Appointment_Time, Reason)
    VALUES (p_Patient_DNI, p_Doctor_DNI, p_Appointment_Date, p_Appointment_Time, p_Reason);

    SET appointmentID = LAST_INSERT_ID();
    SELECT CONCAT('Cita médica creada con el ID: ', appointmentID) AS Message;
END //

DELIMITER ;


CALL SP_CreateMedicalAppointment(200000024, 100000001, '2024-03-20', '10:15:00', 'Consulta de seguimiento');
Select * from Medical_Appointments;