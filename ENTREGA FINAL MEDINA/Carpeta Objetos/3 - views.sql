-- -----------------------------------------------------
-- vista que traiga el promedio de edad de las personas 
-- que tengan gripe.
-- agrupa las tablas patients y diseases
-- -----------------------------------------------------

CREATE VIEW vista_promedio_edad_gripe AS
SELECT AVG(P.Age) AS Promedio_Edad_Gripe
FROM Patients P
JOIN Diseases D ON P.Diseases_idDiseases = D.idDiseases
WHERE D.Name = 'Gripe';

SELECT * FROM vista_promedio_edad_gripe;



-- -----------------------------------------------------
-- vista que me ordene los pacientes que se atienden 
-- en el hospital general, de manera desc por edad.
-- agrupa las tablas patients, diseases y specialities
-- -----------------------------------------------------
CREATE VIEW vista_pacientes_hospital_general AS
SELECT Patients.*
FROM Patients
INNER JOIN Diseases ON Patients.Diseases_idDiseases = Diseases.idDiseases
INNER JOIN Specialities ON Diseases.Specialities_idSpecialities = Specialities.idSpecialities
WHERE Specialities.Name = 'Medicina General'
ORDER BY Patients.Age DESC;

SELECT * FROM vista_pacientes_hospital_general;



-- -----------------------------------------------------
-- vista de donde y con que doctor se tienen que
-- atender los pacientes de la disease spec 15.
-- agrupa las tablas patients, diseases, specialities,
-- med_center y doctors
-- -----------------------------------------------------
-- DROP VIEW vista_Hospital_and_Doctor_For_Disease_15;

CREATE VIEW vista_Hospital_and_Doctor_For_Disease_15 AS
SELECT p.Name AS Patient_Name, p.City AS Patient_City, m.Name AS Hospital_Name, m.Address AS Hospital_Address, d.Name AS Doctor_Name
FROM Patients p
JOIN diseases dis ON p.Diseases_idDiseases = dis.idDiseases
JOIN specialities s ON dis.Specialities_idSpecialities = s.idSpecialities
JOIN Med_Center m ON s.idSpecialities = m.Specialities_idSpecialities
JOIN doctors d ON m.idMed_Center = d.Med_Center_idMed_Center AND s.idSpecialities = d.Specialities_idSpecialities
WHERE p.Diseases_idDiseases = 15;


SELECT * FROM vista_Hospital_and_Doctor_For_Disease_15;



-- -----------------------------------------------------
-- vista de los doctores que trabajan la especialidad 1
-- y el hospital donde trabajan
-- agrupa las tablas med_center y doctors
-- -----------------------------------------------------
-- DROP VIEW Doctors_in_Speciality_1;
CREATE VIEW vista_Doctors_in_Speciality_1 AS
SELECT d.DNI AS Doctor_DNI, d.Name AS Doctor_Name, d.email AS Doctor_Email, d.Mobile AS Doctor_Mobile, m.Name AS Med_Center_Name
FROM Doctors d
JOIN Med_Center m ON d.Med_Center_idMed_Center = m.idMed_Center
WHERE d.Specialities_idSpecialities = 1;

SELECT * FROM vista_Doctors_in_Speciality_1;



-- -----------------------------------------------------
-- vista del paciente con dni 200000024, donde diga sus datos, 
-- su enfermedad, el medico que lo trata segun la especialidad, 
-- en que hospital y que medicacion toma.
-- agrupa las tablas Patient, med_center, doctors,Specialities, 
-- Diseases, Prescriptions y medications. todas las tablas menos
-- las de LOGs

-- -----------------------------------------------------

CREATE VIEW vista_Patient_Info AS
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
WHERE p.DNI = 200000024;

SELECT * FROM vista_Patient_Info;