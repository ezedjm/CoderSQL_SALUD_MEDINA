-- Populacion de la base de datos


-- -----------------------------------------------------
--  Tabla Specialities con 12 registros ficticios
-- ----------------------------------------------------- 
INSERT INTO Specialities (idSpecialities, Name, Treatment)
VALUES
    (1, 'Medicina General', 'Tratamiento general de enfermedades'),
    (2, 'Cardiología', 'Tratamiento de enfermedades del corazón'),
    (3, 'Neurología', 'Tratamiento de enfermedades del sistema nervioso'),
    (4, 'Reumatología', 'Tratamiento de enfermedades de los tejidos blandos y articulaciones'),
    (5, 'Psiquiatría', 'Tratamiento de trastornos mentales'),
    (6, 'Oncología', 'Tratamiento de cáncer'),
    (7, 'Dermatología', 'Tratamiento de enfermedades de la piel'),
    (8, 'Geriatría', 'Atención médica a personas mayores'),
    (9, 'Nefrología', 'Tratamiento de enfermedades del riñón'),
    (10, 'Hematología', 'Tratamiento de enfermedades de la sangre'),
    (11, 'Gastroenterología', 'Tratamiento de enfermedades del sistema digestivo'),
    (12, 'Endocrinología', 'Tratamiento de trastornos hormonales');


-- -----------------------------------------------------
--  Tabla Med_Center con 10 registros ficticios
-- -----------------------------------------------------    
INSERT INTO Med_Center (idMed_Center, Name, Address, Specialities_idSpecialities)
VALUES
    (1, 'Hospital Central', 'Calle Principal 123', 1),
    (2, 'Clínica San José', 'Avenida Libertad 456', 2),
    (3, 'Centro Médico Santa María', 'Calle Salud 789', 3),
    (4, 'Hospital Universitario', 'Avenida San Martín 1011', 4),
    (5, 'Clínica Los Ángeles', 'Calle Flores 1213', 5),
    (6, 'Centro Médico San Lucas', 'Avenida Primavera 1415', 6),
    (7, 'Hospital San Rafael', 'Calle Esperanza 1617', 7),
    (8, 'Clínica Santa Rosa', 'Avenida Paz 1819', 8),
    (9, 'Centro de Salud Municipal', 'Calle Amistad 2021', 9),
    (10, 'Hospital General', 'Avenida Revolución 2223', 10);
    
    
-- -----------------------------------------------------
--  Tabla Doctors con 25 registros ficticios
-- -----------------------------------------------------
INSERT INTO Doctors (DNI, Name, Password, email, Mobile, Med_Center_idMed_Center, Specialities_idSpecialities)
VALUES
    (100000001, 'Juan García', 'password1', 'juangarcia@example.com', '123456789', 1, 1),
    (100000002, 'María Rodríguez', 'password2', 'mariarodriguez@example.com', '987654321', 2, 2),
    (100000003, 'José Martínez', 'password3', 'josemartinez@example.com', '567890123', 3, 3),
    (100000004, 'Ana Pérez', 'password4', 'anaperez@example.com', '456789012', 4, 4),
    (100000005, 'Luis González', 'password5', 'luisgonzalez@example.com', '234567890', 5, 5),
    (100000006, 'Laura López', 'password6', 'lauralopez@example.com', '890123456', 6, 6),
    (100000007, 'Carlos Sánchez', 'password7', 'carlossanchez@example.com', '678901234', 7, 7),
    (100000008, 'Sofía Ramírez', 'password8', 'sofiaramirez@example.com', '345678901', 8, 8),
    (100000009, 'Pablo Fernández', 'password9', 'pablofernandez@example.com', '012345678', 9, 9),
    (100000010, 'Lucía Moreno', 'password10', 'luciamoreno@example.com', '901234567', 10, 10),
    (100000011, 'Diego Jiménez', 'password11', 'diegojimenez@example.com', '789012345', 1, 11),
    (100000012, 'Elena Gómez', 'password12', 'elenagomez@example.com', '567890123', 2, 12),
    (100000013, 'Manuel Díaz', 'password13', 'manueldiaz@example.com', '345678901', 3, 1),
    (100000014, 'Marta Vázquez', 'password14', 'martavazquez@example.com', '123456789', 4, 2),
    (100000015, 'Javier Ruiz', 'password15', 'javierruiz@example.com', '901234567', 5, 3),
    (100000016, 'Carmen Torres', 'password16', 'carmentorres@example.com', '789012345', 6, 4),
    (100000017, 'Pedro Castro', 'password17', 'pedrocastro@example.com', '567890123', 7, 5),
    (100000018, 'Isabel Navarro', 'password18', 'isabelnavarro@example.com', '345678901', 8, 6),
    (100000019, 'Antonio Soto', 'password19', 'antoniosoto@example.com', '123456789', 9, 7),
    (100000020, 'Sara Iglesias', 'password20', 'saraiglesias@example.com', '901234567', 10, 8),
    (100000021, 'Alberto Ortega', 'password21', 'albertoortega@example.com', '789012345', 1, 9),
    (100000022, 'Paula Cáceres', 'password22', 'paulacaceres@example.com', '567890123', 2, 10),
    (100000023, 'Raúl Molina', 'password23', 'raulmolina@example.com', '345678901', 3, 11),
    (100000024, 'Eva Ruiz', 'password24', 'evaruiz@example.com', '123456789', 4, 12),
    (100000025, 'Mario Medina', 'password25', 'mariomedina@example.com', '901234567', 5, 1);
    
    
-- -----------------------------------------------------
--  Tabla Diseases con 20 registros ficticios
-- -----------------------------------------------------
INSERT INTO Diseases (idDiseases, Name, Treatable, Specialities_idSpecialities)
VALUES
    (1, 'Resfriado', 'Y', 1),
    (2, 'Gripe', 'Y', 1),
    (3, 'Bronquitis', 'Y', 2),
    (4, 'Asma', 'Y', 2),
    (5, 'Diabetes', 'Y', 3),
    (6, 'Hipertensión', 'Y', 3),
    (7, 'Artritis', 'Y', 4),
    (8, 'Osteoporosis', 'Y', 4),
    (9, 'Depresión', 'Y', 5),
    (10, 'Ansiedad', 'Y', 5),
    (11, 'Cáncer de mama', 'Y', 6),
    (12, 'Cáncer de próstata', 'Y', 6),
    (13, 'Dermatitis', 'Y', 7),
    (14, 'Psoriasis', 'Y', 7),
    (15, 'Enfermedad de Alzheimer', 'Y', 8),
    (16, 'Enfermedad de Parkinson', 'Y', 8),
    (17, 'Insuficiencia renal', 'Y', 9),
    (18, 'Cálculos renales', 'Y', 9),
    (19, 'Anemia', 'Y', 10),
    (20, 'Leucemia', 'Y', 10),
    (21, 'Migrana', 'N', 11),
    (22, 'Fibromialgia', 'N', 12),
    (23, 'Esquizofrenia', 'N', 10),
    (24, 'Autismo', 'N', 11),
    (25, 'Parálisis cerebral', 'N', 12);
    
    
    
-- -----------------------------------------------------
--  Tabla Patients con 50 registros ficticios
-- -----------------------------------------------------
INSERT INTO Patients (DNI, Name, Age, City, Birth, Diseases_idDiseases)
VALUES
    (200000001, 'Ana Martínez', 35, 'Ciudad A', '1989-05-15', 1),
    (200000002, 'Pedro López', 45, 'Ciudad B', '1979-08-23', 2),
    (200000003, 'Laura García', 25, 'Ciudad C', '1999-02-10', 3),
    (200000004, 'David Rodríguez', 32, 'Ciudad D', '1986-11-30', 4),
    (200000005, 'María Pérez', 50, 'Ciudad E', '1974-04-18', 5),
    (200000006, 'Jorge González', 28, 'Ciudad F', '1996-07-05', 6),
    (200000007, 'Sofía Fernández', 40, 'Ciudad G', '1982-09-20', 7),
    (200000008, 'Manuel Gutiérrez', 60, 'Ciudad H', '1962-12-25', 8),
    (200000009, 'Carla Díaz', 22, 'Ciudad I', '2000-03-12', 9),
    (200000010, 'Francisco Ruiz', 38, 'Ciudad J', '1984-06-28', 10),
    (200000011, 'Elena Sánchez', 48, 'Ciudad K', '1974-10-05', 11),
    (200000012, 'Alejandro Castro', 33, 'Ciudad L', '1989-01-22', 12),
    (200000013, 'Paula López', 27, 'Ciudad M', '1997-08-17', 13),
    (200000014, 'Miguel Martínez', 55, 'Ciudad N', '1969-02-08', 14),
    (200000015, 'Lucía García', 42, 'Ciudad O', '1971-05-25', 15),
    (200000016, 'Diego Rodríguez', 30, 'Ciudad P', '1992-11-12', 16),
    (200000017, 'Andrea Pérez', 20, 'Ciudad Q', '2002-04-03', 17),
    (200000018, 'Juan González', 36, 'Ciudad R', '1986-07-19', 18),
    (200000019, 'Ana Fernández', 47, 'Ciudad S', '1975-09-07', 19),
    (200000020, 'Pedro Gutiérrez', 25, 'Ciudad T', '1999-01-30', 20),
    (200000021, 'Laura Díaz', 53, 'Ciudad U', '1969-06-14', 21),
    (200000022, 'David Ruiz', 29, 'Ciudad V', '1995-10-01', 22),
    (200000023, 'María Sánchez', 39, 'Ciudad W', '1983-03-24', 23),
    (200000024, 'Jorge Castro', 49, 'Ciudad X', '1973-12-10', 24),
    (200000025, 'Sofía López', 26, 'Ciudad Y', '1998-07-27', 25),
    (200000026, 'Manuel Martínez', 41, 'Ciudad Z', '1981-02-19', 1),
    (200000027, 'Carla González', 31, 'Ciudad A', '1991-05-03', 2),
    (200000028, 'Francisco Pérez', 44, 'Ciudad B', '1978-08-21', 3),
    (200000029, 'Elena Fernández', 24, 'Ciudad C', '2000-01-16', 4),
    (200000030, 'Alejandro Gutiérrez', 37, 'Ciudad D', '1985-06-08', 5),
    (200000031, 'Paula Díaz', 51, 'Ciudad E', '1971-11-29', 6),
    (200000032, 'Miguel Ruiz', 29, 'Ciudad F', '1995-04-14', 7),
    (200000033, 'Lucía Castro', 43, 'Ciudad G', '1979-07-02', 8),
    (200000034, 'Diego Martínez', 21, 'Ciudad H', '2003-02-27', 9),
    (200000035, 'Andrea García', 34, 'Ciudad I', '1988-05-10', 10),
    (200000036, 'Juan Rodríguez', 46, 'Ciudad J', '1976-10-26', 11),
    (200000037, 'Ana Pérez', 56, 'Ciudad K', '1966-01-18', 12),
    (200000038, 'Pedro González', 23, 'Ciudad L', '1999-04-07', 13),
    (200000039, 'Laura Martínez', 32, 'Ciudad M', '1990-08-31', 14),
    (200000040, 'David Fernández', 52, 'Ciudad N', '1970-12-20', 15),
    (200000041, 'María Gutiérrez', 33, 'Ciudad O', '1988-03-13', 16),
    (200000042, 'Jorge Díaz', 28, 'Ciudad P', '1996-06-01', 17),
    (200000043, 'Sofía Ruiz', 45, 'Ciudad Q', '1977-09-22', 18),
    (200000044, 'Manuel Castro', 27, 'Ciudad R', '1997-02-09', 19),
    (200000045, 'Carla Martínez', 38, 'Ciudad S', '1984-05-04', 20),
    (200000046, 'Francisco Fernández', 48, 'Ciudad T', '1974-10-17', 21),
    (200000047, 'Elena Gutiérrez', 26, 'Ciudad U', '1998-01-05', 22),
    (200000048, 'Alejandro Díaz', 42, 'Ciudad V', '1980-04-25', 23),
    (200000049, 'Paula Ruiz', 55, 'Ciudad W', '1967-09-14', 24),
    (200000050, 'Miguel Castro', 30, 'Ciudad X', '1992-12-03', 25);
    
        
    
-- -----------------------------------------------------
--  Tabla medications con 50 registros ficticios
-- -----------------------------------------------------
INSERT INTO medications (idMedication, Name, Composition, Instructions, Side_Effects, Contraindications)
VALUES
    (1, 'Paracetamol', 'Medicamento analgésico y antipirético', 'Tomar 1 tableta cada 6 horas con alimentos', 'Puede causar náuseas y reacciones alérgicas', 'No se recomienda en personas con problemas hepáticos'),
    (2, 'Ibuprofeno', 'Medicamento antiinflamatorio no esteroideo (AINE)', 'Tomar 1 tableta cada 8 horas con agua', 'Puede causar irritación gástrica y problemas renales', 'No se recomienda en personas con úlceras estomacales'),
    (3, 'Amoxicilina', 'Medicamento antibiótico', 'Tomar 1 cápsula cada 12 horas con alimentos', 'Puede causar diarrea y erupciones cutáneas', 'No se recomienda en personas alérgicas a la penicilina'),
    (4, 'Lisinopril', 'Medicamento antihipertensivo', 'Tomar 1 tableta diaria en la mañana', 'Puede causar tos seca y mareos', 'No se recomienda en mujeres embarazadas'),
    (5, 'Simvastatina', 'Medicamento hipolipemiante', 'Tomar 1 tableta diaria en la noche', 'Puede causar dolor muscular y aumento de las transaminasas', 'No se recomienda en personas con enfermedad hepática'),
    (6, 'Omeprazol', 'Inhibidor de la bomba de protones (IBP)', 'Tomar 1 cápsula diaria antes del desayuno', 'Puede causar dolor de cabeza y diarrea', 'No se recomienda en personas con hipersensibilidad al omeprazol'),
    (7, 'Metformina', 'Medicamento antidiabético', 'Tomar 1 tableta dos veces al día con las comidas', 'Puede causar malestar estomacal y diarrea', 'No se recomienda en personas con insuficiencia renal'),
    (8, 'Atorvastatina', 'Medicamento hipolipemiante', 'Tomar 1 tableta diaria en la noche', 'Puede causar dolor muscular y mareos', 'No se recomienda en mujeres embarazadas'),
    (9, 'Amlodipino', 'Bloqueador de los canales de calcio (BCC)', 'Tomar 1 tableta diaria con o sin alimentos', 'Puede causar edema y palpitaciones', 'No se recomienda en personas con hipotensión'),
    (10, 'Hidroclorotiazida', 'Medicamento diurético', 'Tomar 1 tableta diaria en la mañana', 'Puede causar deshidratación y aumento de la sensibilidad a la luz solar', 'No se recomienda en personas con insuficiencia renal'),
    (11, 'Albuterol', 'Broncodilatador', 'Inhalar 2 puff cada 4 horas según sea necesario', 'Puede causar temblores y taquicardia', 'No se recomienda en personas con antecedentes de cardiopatía'),
    (12, 'Warfarina', 'Anticoagulante', 'Tomar según las indicaciones del médico', 'Puede causar hemorragias y moretones', 'No se recomienda en personas con trastornos de la coagulación'),
    (13, 'Metoprolol', 'Betabloqueante', 'Tomar 1 tableta dos veces al día', 'Puede causar fatiga y bradicardia', 'No se recomienda en personas con insuficiencia cardíaca'),
    (14, 'Citalopram', 'Antidepresivo', 'Tomar 1 tableta diaria en la mañana', 'Puede causar insomnio y disminución del deseo sexual', 'No se recomienda en personas con antecedentes de convulsiones'),
    (15, 'Levotiroxina', 'Hormona tiroidea', 'Tomar 1 tableta diaria en ayunas', 'Puede causar palpitaciones y pérdida de peso', 'No se recomienda en personas con hipertiroidismo no controlado'),
    (16, 'Prednisona', 'Corticosteroide', 'Tomar según las indicaciones del médico', 'Puede causar aumento de peso y cambios de humor', 'No se recomienda en personas con infecciones sistémicas'),
    (17, 'Montelukast', 'Antagonista de los receptores de leucotrienos', 'Tomar 1 tableta diaria en la noche', 'Puede causar dolor abdominal y dolor de cabeza', 'No se recomienda en personas con asma aguda'),
    (18, 'Fluoxetina', 'Inhibidor selectivo de la recaptación de serotonina (ISRS)', 'Tomar 1 cápsula diaria en la mañana', 'Puede causar nerviosismo y disminución del apetito', 'No se recomienda en personas con antecedentes de convulsiones'),
    (19, 'Ciprofloxacina', 'Antibiótico fluoroquinolona', 'Tomar según las indicaciones del médico', 'Puede causar náuseas y diarrea', 'No se recomienda en personas menores de 18 años'),
    (20, 'Diazepam', 'Benzodiacepina', 'Tomar 1 tableta según sea necesario para la ansiedad', 'Puede causar somnolencia y deterioro cognitivo', 'No se recomienda en personas con glaucoma');
    
    
    
    
    
-- -----------------------------------------------------
--  Tabla Prescriptions con 50 registros ficticios
-- ----------------------------------------------------- 
INSERT INTO Prescriptions (Doctor_DNI, Patient_DNI, Date, Medication_idMedication, Dosage)
VALUES
    (100000001, 200000001, '2024-01-01', 1, '1 comprimido cada 8 horas'),
    (100000002, 200000002, '2024-01-02', 2, '1 cápsula cada 12 horas'),
    (100000003, 200000003, '2024-01-03', 3, '2 tabletas al día'),
    (100000004, 200000004, '2024-01-04', 4, '1 comprimido cada 6 horas'),
    (100000005, 200000005, '2024-01-05', 5, '1 tableta cada noche'),
    (100000006, 200000006, '2024-01-06', 6, '1 pastilla cada mañana'),
    (100000007, 200000007, '2024-01-07', 7, '1 pastilla cada 8 horas'),
    (100000008, 200000008, '2024-01-08', 8, '1 comprimido cada 24 horas'),
    (100000009, 200000009, '2024-01-09', 9, '1 pastilla cada noche'),
    (100000010, 200000010, '2024-01-10', 10, '1 tableta cada 12 horas'),
    (100000011, 200000011, '2024-01-11', 11, '1 tableta cada 6 horas'),
    (100000012, 200000012, '2024-01-12', 12, '1 pastilla cada 8 horas'),
    (100000013, 200000013, '2024-01-13', 13, '1 comprimido cada 24 horas'),
    (100000014, 200000014, '2024-01-14', 14, '1 cápsula cada 12 horas'),
    (100000015, 200000015, '2024-01-15', 15, '1 tableta cada 8 horas'),
    (100000016, 200000016, '2024-01-16', 16, '1 tableta cada 12 horas'),
    (100000017, 200000017, '2024-01-17', 17, '1 pastilla cada 6 horas'),
    (100000018, 200000018, '2024-01-18', 18, '1 tableta cada 24 horas'),
    (100000019, 200000019, '2024-01-19', 19, '1 pastilla cada noche'),
    (100000020, 200000020, '2024-01-20', 20, '1 comprimido cada 8 horas'),
    (100000021, 200000021, '2024-01-21', 1, '1 comprimido cada 12 horas'),
    (100000022, 200000022, '2024-01-22', 2, '1 cápsula cada 6 horas'),
    (100000023, 200000023, '2024-01-23', 3, '1 pastilla cada 8 horas'),
    (100000024, 200000024, '2024-01-24', 4, '1 tableta cada 24 horas'),
    (100000025, 200000025, '2024-01-25', 5, '1 pastilla cada noche'),
    (100000001, 200000026, '2024-01-26', 1, '1 comprimido cada 8 horas'),
    (100000002, 200000027, '2024-01-27', 2, '1 cápsula cada 12 horas'),
    (100000003, 200000028, '2024-01-28', 3, '2 tabletas al día'),
    (100000004, 200000029, '2024-01-29', 4, '1 comprimido cada 6 horas'),
    (100000005, 200000030, '2024-01-30', 5, '1 tableta cada noche'),
    (100000006, 200000031, '2024-01-31', 6, '1 pastilla cada mañana'),
    (100000007, 200000032, '2024-02-01', 7, '1 pastilla cada 8 horas'),
    (100000008, 200000033, '2024-02-02', 8, '1 comprimido cada 24 horas'),
    (100000009, 200000034, '2024-02-03', 9, '1 pastilla cada noche'),
    (100000010, 200000035, '2024-02-04', 10, '1 tableta cada 12 horas'),
    (100000011, 200000036, '2024-02-05', 11, '1 tableta cada 6 horas'),
    (100000012, 200000037, '2024-02-06', 12, '1 pastilla cada 8 horas'),
    (100000013, 200000038, '2024-02-07', 13, '1 comprimido cada 24 horas'),
    (100000014, 200000039, '2024-02-08', 14, '1 cápsula cada 12 horas'),
    (100000015, 200000040, '2024-02-09', 15, '1 tableta cada 8 horas'),
    (100000016, 200000041, '2024-02-10', 16, '1 tableta cada 12 horas'),
    (100000017, 200000042, '2024-02-11', 17, '1 pastilla cada 6 horas'),
    (100000018, 200000043, '2024-02-12', 18, '1 tableta cada 24 horas'),
    (100000019, 200000044, '2024-02-13', 19, '1 pastilla cada noche'),
    (100000020, 200000045, '2024-02-14', 20, '1 comprimido cada 8 horas'),
    (100000021, 200000046, '2024-02-15', 1, '1 comprimido cada 12 horas'),
    (100000022, 200000047, '2024-02-16', 2, '1 cápsula cada 6 horas'),
    (100000023, 200000048, '2024-02-17', 3, '1 pastilla cada 8 horas'),
    (100000024, 200000049, '2024-02-18', 4, '1 tableta cada 24 horas'),
    (100000025, 200000050, '2024-02-19', 5, '1 pastilla cada noche');
    


