-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: db_usuarios_salud_medina
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `db_usuarios_salud_medina`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_usuarios_salud_medina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_usuarios_salud_medina`;

--
-- Temporary view structure for view `vista_doctors_in_speciality_1`
--

DROP TABLE IF EXISTS `vista_doctors_in_speciality_1`;
/*!50001 DROP VIEW IF EXISTS `vista_doctors_in_speciality_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_doctors_in_speciality_1` AS SELECT 
 1 AS `Doctor_DNI`,
 1 AS `Doctor_Name`,
 1 AS `Doctor_Email`,
 1 AS `Doctor_Mobile`,
 1 AS `Med_Center_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_hospital_and_doctor_for_disease_15`
--

DROP TABLE IF EXISTS `vista_hospital_and_doctor_for_disease_15`;
/*!50001 DROP VIEW IF EXISTS `vista_hospital_and_doctor_for_disease_15`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_hospital_and_doctor_for_disease_15` AS SELECT 
 1 AS `Patient_Name`,
 1 AS `Patient_City`,
 1 AS `Hospital_Name`,
 1 AS `Hospital_Address`,
 1 AS `Doctor_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pacientes_hospital_general`
--

DROP TABLE IF EXISTS `vista_pacientes_hospital_general`;
/*!50001 DROP VIEW IF EXISTS `vista_pacientes_hospital_general`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pacientes_hospital_general` AS SELECT 
 1 AS `idPatients`,
 1 AS `DNI`,
 1 AS `Name`,
 1 AS `Age`,
 1 AS `City`,
 1 AS `Birth`,
 1 AS `Diseases_idDiseases`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_patient_info`
--

DROP TABLE IF EXISTS `vista_patient_info`;
/*!50001 DROP VIEW IF EXISTS `vista_patient_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_patient_info` AS SELECT 
 1 AS `Patient_DNI`,
 1 AS `Patient_Name`,
 1 AS `Patient_Age`,
 1 AS `Patient_City`,
 1 AS `Patient_Birth`,
 1 AS `Doctor_Name`,
 1 AS `Doctor_Email`,
 1 AS `Doctor_Mobile`,
 1 AS `Med_Center_Name`,
 1 AS `Speciality_Name`,
 1 AS `Disease_Name`,
 1 AS `Medication_Name`,
 1 AS `Medication_Composition`,
 1 AS `Medication_Instructions`,
 1 AS `Medication_Side_Effects`,
 1 AS `Medication_Contraindications`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_promedio_edad_gripe`
--

DROP TABLE IF EXISTS `vista_promedio_edad_gripe`;
/*!50001 DROP VIEW IF EXISTS `vista_promedio_edad_gripe`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_promedio_edad_gripe` AS SELECT 
 1 AS `Promedio_Edad_Gripe`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_usuarios_salud_medina'
--

--
-- Dumping routines for database 'db_usuarios_salud_medina'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_GetPatientInfoByDNI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetPatientInfoByDNI`(IN param_patientDNI INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `db_salud_medina`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_salud_medina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_salud_medina`;

--
-- Table structure for table `bkp_doctors1`
--

DROP TABLE IF EXISTS `bkp_doctors1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bkp_doctors1` (
  `DNI` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `Mobile` varchar(45) NOT NULL,
  `Med_Center_idMed_Center` int NOT NULL,
  `Specialities_idSpecialities` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bkp_doctors1`
--

LOCK TABLES `bkp_doctors1` WRITE;
/*!40000 ALTER TABLE `bkp_doctors1` DISABLE KEYS */;
/*!40000 ALTER TABLE `bkp_doctors1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bkp_doctors2`
--

DROP TABLE IF EXISTS `bkp_doctors2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bkp_doctors2` (
  `DNI` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `Mobile` varchar(45) NOT NULL,
  `Med_Center_idMed_Center` int NOT NULL,
  `Specialities_idSpecialities` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bkp_doctors2`
--

LOCK TABLES `bkp_doctors2` WRITE;
/*!40000 ALTER TABLE `bkp_doctors2` DISABLE KEYS */;
INSERT INTO `bkp_doctors2` VALUES (100000001,'Juan García','password1','juangarcia@example.com','123456789',1,1),(100000002,'María Rodríguez','password2','mariarodriguez@example.com','987654321',2,2),(100000003,'José Martínez','password3','josemartinez@example.com','567890123',3,3),(100000004,'Ana Pérez','password4','anaperez@example.com','456789012',4,4),(100000005,'Luis González','password5','luisgonzalez@example.com','234567890',5,5),(100000006,'Laura López','password6','lauralopez@example.com','890123456',6,6),(100000007,'Carlos Sánchez','password7','carlossanchez@example.com','678901234',7,7),(100000008,'Sofía Ramírez','password8','sofiaramirez@example.com','345678901',8,8),(100000009,'Pablo Fernández','password9','pablofernandez@example.com','012345678',9,9),(100000010,'Lucía Moreno','password10','luciamoreno@example.com','901234567',10,10),(100000011,'Diego Jiménez','password11','diegojimenez@example.com','789012345',1,11),(100000012,'Elena Gómez','password12','elenagomez@example.com','567890123',2,12),(100000013,'Manuel Díaz','password13','manueldiaz@example.com','345678901',3,1),(100000014,'Marta Vázquez','password14','martavazquez@example.com','123456789',4,2),(100000015,'Javier Ruiz','password15','javierruiz@example.com','901234567',5,3),(100000016,'Carmen Torres','password16','carmentorres@example.com','789012345',6,4),(100000017,'Pedro Castro','password17','pedrocastro@example.com','567890123',7,5),(100000018,'Isabel Navarro','password18','isabelnavarro@example.com','345678901',8,6),(100000019,'Antonio Soto','password19','antoniosoto@example.com','123456789',9,7),(100000020,'Sara Iglesias','password20','saraiglesias@example.com','901234567',10,8),(100000021,'Alberto Ortega','password21','albertoortega@example.com','789012345',1,9),(100000022,'Paula Cáceres','password22','paulacaceres@example.com','567890123',2,10),(100000023,'Raúl Molina','password23','raulmolina@example.com','345678901',3,11),(100000024,'Eva Ruiz','password24','evaruiz@example.com','123456789',4,12),(100000025,'Mario Medina','password25','mariomedina@example.com','901234567',5,1),(100000028,'jaja ksks','password1','juangarcia@example.com','65262652',1,1);
/*!40000 ALTER TABLE `bkp_doctors2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `idDiseases` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Treatable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Specialities_idSpecialities` int NOT NULL,
  PRIMARY KEY (`idDiseases`,`Specialities_idSpecialities`),
  KEY `fk_Diseases_Specialities1_idx` (`Specialities_idSpecialities`),
  CONSTRAINT `fk_Diseases_Specialities1` FOREIGN KEY (`Specialities_idSpecialities`) REFERENCES `specialities` (`idSpecialities`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
INSERT INTO `diseases` VALUES (1,'Resfriado','Y',1),(2,'Gripe','Y',1),(3,'Bronquitis','Y',2),(4,'Asma','Y',2),(5,'Diabetes','Y',3),(6,'Hipertensión','Y',3),(7,'Artritis','Y',4),(8,'Osteoporosis','Y',4),(9,'Depresión','Y',5),(10,'Ansiedad','Y',5),(11,'Cáncer de mama','Y',6),(12,'Cáncer de próstata','Y',6),(13,'Dermatitis','Y',7),(14,'Psoriasis','Y',7),(15,'Enfermedad de Alzheimer','Y',8),(16,'Enfermedad de Parkinson','Y',8),(17,'Insuficiencia renal','Y',9),(18,'Cálculos renales','Y',9),(19,'Anemia','Y',10),(20,'Leucemia','Y',10),(21,'Migrana','N',11),(22,'Fibromialgia','N',12),(23,'Esquizofrenia','N',10),(24,'Autismo','N',11),(25,'Parálisis cerebral','N',12);
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `DNI` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `Mobile` varchar(45) NOT NULL,
  `Med_Center_idMed_Center` int NOT NULL,
  `Specialities_idSpecialities` int NOT NULL,
  PRIMARY KEY (`DNI`,`Med_Center_idMed_Center`,`Specialities_idSpecialities`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  KEY `fk_Doctors_Med_Center_idx` (`Med_Center_idMed_Center`),
  KEY `fk_Doctors_Specialities1_idx` (`Specialities_idSpecialities`),
  CONSTRAINT `fk_Doctors_Med_Center` FOREIGN KEY (`Med_Center_idMed_Center`) REFERENCES `med_center` (`idMed_Center`),
  CONSTRAINT `fk_Doctors_Specialities1` FOREIGN KEY (`Specialities_idSpecialities`) REFERENCES `specialities` (`idSpecialities`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (100000001,'Juan García','password1','juangarcia@example.com','123456789',1,1),(100000002,'María Rodríguez','password2','mariarodriguez@example.com','987654321',2,2),(100000003,'José Martínez','password3','josemartinez@example.com','567890123',3,3),(100000004,'Ana Pérez','password4','anaperez@example.com','456789012',4,4),(100000005,'Luis González','password5','luisgonzalez@example.com','234567890',5,5),(100000006,'Laura López','password6','lauralopez@example.com','890123456',6,6),(100000007,'Carlos Sánchez','password7','carlossanchez@example.com','678901234',7,7),(100000008,'Sofía Ramírez','password8','sofiaramirez@example.com','345678901',8,8),(100000009,'Pablo Fernández','password9','pablofernandez@example.com','012345678',9,9),(100000010,'Lucía Moreno','password10','luciamoreno@example.com','901234567',10,10),(100000011,'Diego Jiménez','password11','diegojimenez@example.com','789012345',1,11),(100000012,'Elena Gómez','password12','elenagomez@example.com','567890123',2,12),(100000013,'Manuel Díaz','password13','manueldiaz@example.com','345678901',3,1),(100000014,'Marta Vázquez','password14','martavazquez@example.com','123456789',4,2),(100000015,'Javier Ruiz','password15','javierruiz@example.com','901234567',5,3),(100000016,'Carmen Torres','password16','carmentorres@example.com','789012345',6,4),(100000017,'Pedro Castro','password17','pedrocastro@example.com','567890123',7,5),(100000018,'Isabel Navarro','password18','isabelnavarro@example.com','345678901',8,6),(100000019,'Antonio Soto','password19','antoniosoto@example.com','123456789',9,7),(100000020,'Sara Iglesias','password20','saraiglesias@example.com','901234567',10,8),(100000021,'Alberto Ortega','password21','albertoortega@example.com','789012345',1,9),(100000022,'Paula Cáceres','password22','paulacaceres@example.com','567890123',2,10),(100000023,'Raúl Molina','password23','raulmolina@example.com','345678901',3,11),(100000024,'Eva Ruiz','password24','evaruiz@example.com','123456789',4,12),(100000025,'Mario Medina','password25','mariomedina@example.com','901234567',5,1),(100000028,'jaja ksks','password1','juangarcia@example.com','65262652',1,1);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_doctor` BEFORE INSERT ON `doctors` FOR EACH ROW BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('INSERT', USER(), CONCAT('N/A', ' -> ', NEW.DNI));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_doctor` AFTER INSERT ON `doctors` FOR EACH ROW BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('INSERT', USER(), CONCAT('N/A', ' -> ', NEW.DNI));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_doctor` BEFORE UPDATE ON `doctors` FOR EACH ROW BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('UPDATE', USER(), CONCAT(OLD.DNI, ' -> ', NEW.DNI));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_doctor` AFTER UPDATE ON `doctors` FOR EACH ROW BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('UPDATE', USER(), CONCAT(OLD.DNI, ' -> ', NEW.DNI));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_doctor` BEFORE DELETE ON `doctors` FOR EACH ROW BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('DELETE', USER(), CONCAT(OLD.DNI, ' ->', 'N/A'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delete_doctor` AFTER DELETE ON `doctors` FOR EACH ROW BEGIN
    INSERT INTO log_doctors (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('DELETE', USER(), CONCAT(OLD.DNI, ' -> ', 'N/A'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_doctors`
--

DROP TABLE IF EXISTS `log_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_doctors` (
  `id_log_doc` int NOT NULL AUTO_INCREMENT,
  `nombre_accion` varchar(10) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `valorAnterior_valorNuevo` varchar(100) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log_doc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_doctors`
--

LOCK TABLES `log_doctors` WRITE;
/*!40000 ALTER TABLE `log_doctors` DISABLE KEYS */;
INSERT INTO `log_doctors` VALUES (1,'INSERT','root@localhost','N/A -> 100000026','2024-03-20 05:04:05'),(2,'INSERT','root@localhost','N/A -> 100000028','2024-03-20 05:13:34'),(3,'UPDATE','root@localhost','100000028 -> 100000050','2024-03-20 05:14:13'),(4,'DELETE','root@localhost','100000050 ->N/A','2024-03-20 05:14:45'),(5,'INSERT','root@localhost','N/A -> 100000028','2024-03-20 05:16:07'),(6,'INSERT','root@localhost','N/A -> 100000028','2024-03-20 05:16:07');
/*!40000 ALTER TABLE `log_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_patients`
--

DROP TABLE IF EXISTS `log_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_patients` (
  `id_log_patients` int NOT NULL AUTO_INCREMENT,
  `nombre_accion` varchar(10) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `valorAnterior_valorNuevo` varchar(100) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log_patients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_patients`
--

LOCK TABLES `log_patients` WRITE;
/*!40000 ALTER TABLE `log_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_center`
--

DROP TABLE IF EXISTS `med_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `med_center` (
  `idMed_Center` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Specialities_idSpecialities` int NOT NULL,
  PRIMARY KEY (`idMed_Center`,`Specialities_idSpecialities`),
  KEY `fk_Med_Center_Specialities1_idx` (`Specialities_idSpecialities`),
  CONSTRAINT `fk_Med_Center_Specialities1` FOREIGN KEY (`Specialities_idSpecialities`) REFERENCES `specialities` (`idSpecialities`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_center`
--

LOCK TABLES `med_center` WRITE;
/*!40000 ALTER TABLE `med_center` DISABLE KEYS */;
INSERT INTO `med_center` VALUES (1,'Hospital Central','Calle Principal 123',1),(2,'Clínica San José','Avenida Libertad 456',2),(3,'Centro Médico Santa María','Calle Salud 789',3),(4,'Hospital Universitario','Avenida San Martín 1011',4),(5,'Clínica Los Ángeles','Calle Flores 1213',5),(6,'Centro Médico San Lucas','Avenida Primavera 1415',6),(7,'Hospital San Rafael','Calle Esperanza 1617',7),(8,'Clínica Santa Rosa','Avenida Paz 1819',8),(9,'Centro de Salud Municipal','Calle Amistad 2021',9),(10,'Hospital General','Avenida Revolución 2223',10);
/*!40000 ALTER TABLE `med_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_appointments`
--

DROP TABLE IF EXISTS `medical_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_appointments` (
  `Appointment_ID` int NOT NULL AUTO_INCREMENT,
  `Patient_DNI` int NOT NULL,
  `Doctor_DNI` int NOT NULL,
  `Appointment_Date` date NOT NULL,
  `Appointment_Time` time NOT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Appointment_ID`),
  KEY `fk_medical_appointments_patient_idx` (`Patient_DNI`),
  KEY `fk_medical_appointments_doctor_idx` (`Doctor_DNI`),
  CONSTRAINT `fk_medical_appointments_doctor` FOREIGN KEY (`Doctor_DNI`) REFERENCES `doctors` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_medical_appointments_patient` FOREIGN KEY (`Patient_DNI`) REFERENCES `patients` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_appointments`
--

LOCK TABLES `medical_appointments` WRITE;
/*!40000 ALTER TABLE `medical_appointments` DISABLE KEYS */;
INSERT INTO `medical_appointments` VALUES (1,200000024,100000001,'2024-03-20','10:15:00','Consulta de seguimiento'),(2,200000025,100000001,'2024-03-20','10:15:00','Consulta de seguimiento'),(3,200000025,100000001,'2024-03-20','10:15:00','Consulta de seguimiento'),(4,200000025,100000007,'2024-03-20','10:15:00','Consulta de seguimiento');
/*!40000 ALTER TABLE `medical_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `idMedication` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Composition` varchar(255) DEFAULT NULL,
  `Instructions` varchar(255) DEFAULT NULL,
  `Side_Effects` varchar(255) DEFAULT NULL,
  `Contraindications` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idMedication`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (1,'Paracetamol','Medicamento analgésico y antipirético','Tomar 1 tableta cada 6 horas con alimentos','Puede causar náuseas y reacciones alérgicas','No se recomienda en personas con problemas hepáticos'),(2,'Ibuprofeno','Medicamento antiinflamatorio no esteroideo (AINE)','Tomar 1 tableta cada 8 horas con agua','Puede causar irritación gástrica y problemas renales','No se recomienda en personas con úlceras estomacales'),(3,'Amoxicilina','Medicamento antibiótico','Tomar 1 cápsula cada 12 horas con alimentos','Puede causar diarrea y erupciones cutáneas','No se recomienda en personas alérgicas a la penicilina'),(4,'Lisinopril','Medicamento antihipertensivo','Tomar 1 tableta diaria en la mañana','Puede causar tos seca y mareos','No se recomienda en mujeres embarazadas'),(5,'Simvastatina','Medicamento hipolipemiante','Tomar 1 tableta diaria en la noche','Puede causar dolor muscular y aumento de las transaminasas','No se recomienda en personas con enfermedad hepática'),(6,'Omeprazol','Inhibidor de la bomba de protones (IBP)','Tomar 1 cápsula diaria antes del desayuno','Puede causar dolor de cabeza y diarrea','No se recomienda en personas con hipersensibilidad al omeprazol'),(7,'Metformina','Medicamento antidiabético','Tomar 1 tableta dos veces al día con las comidas','Puede causar malestar estomacal y diarrea','No se recomienda en personas con insuficiencia renal'),(8,'Atorvastatina','Medicamento hipolipemiante','Tomar 1 tableta diaria en la noche','Puede causar dolor muscular y mareos','No se recomienda en mujeres embarazadas'),(9,'Amlodipino','Bloqueador de los canales de calcio (BCC)','Tomar 1 tableta diaria con o sin alimentos','Puede causar edema y palpitaciones','No se recomienda en personas con hipotensión'),(10,'Hidroclorotiazida','Medicamento diurético','Tomar 1 tableta diaria en la mañana','Puede causar deshidratación y aumento de la sensibilidad a la luz solar','No se recomienda en personas con insuficiencia renal'),(11,'Albuterol','Broncodilatador','Inhalar 2 puff cada 4 horas según sea necesario','Puede causar temblores y taquicardia','No se recomienda en personas con antecedentes de cardiopatía'),(12,'Warfarina','Anticoagulante','Tomar según las indicaciones del médico','Puede causar hemorragias y moretones','No se recomienda en personas con trastornos de la coagulación'),(13,'Metoprolol','Betabloqueante','Tomar 1 tableta dos veces al día','Puede causar fatiga y bradicardia','No se recomienda en personas con insuficiencia cardíaca'),(14,'Citalopram','Antidepresivo','Tomar 1 tableta diaria en la mañana','Puede causar insomnio y disminución del deseo sexual','No se recomienda en personas con antecedentes de convulsiones'),(15,'Levotiroxina','Hormona tiroidea','Tomar 1 tableta diaria en ayunas','Puede causar palpitaciones y pérdida de peso','No se recomienda en personas con hipertiroidismo no controlado'),(16,'Prednisona','Corticosteroide','Tomar según las indicaciones del médico','Puede causar aumento de peso y cambios de humor','No se recomienda en personas con infecciones sistémicas'),(17,'Montelukast','Antagonista de los receptores de leucotrienos','Tomar 1 tableta diaria en la noche','Puede causar dolor abdominal y dolor de cabeza','No se recomienda en personas con asma aguda'),(18,'Fluoxetina','Inhibidor selectivo de la recaptación de serotonina (ISRS)','Tomar 1 cápsula diaria en la mañana','Puede causar nerviosismo y disminución del apetito','No se recomienda en personas con antecedentes de convulsiones'),(19,'Ciprofloxacina','Antibiótico fluoroquinolona','Tomar según las indicaciones del médico','Puede causar náuseas y diarrea','No se recomienda en personas menores de 18 años'),(20,'Diazepam','Benzodiacepina','Tomar 1 tableta según sea necesario para la ansiedad','Puede causar somnolencia y deterioro cognitivo','No se recomienda en personas con glaucoma');
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `idPatients` int NOT NULL AUTO_INCREMENT,
  `DNI` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `City` varchar(45) NOT NULL,
  `Birth` date NOT NULL,
  `Diseases_idDiseases` int NOT NULL,
  PRIMARY KEY (`idPatients`,`Diseases_idDiseases`),
  KEY `fk_Patients_Diseases1_idx` (`Diseases_idDiseases`),
  KEY `idx_DNI` (`DNI`),
  CONSTRAINT `fk_Patients_Diseases1` FOREIGN KEY (`Diseases_idDiseases`) REFERENCES `diseases` (`idDiseases`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,200000001,'Ana Martínez',35,'Ciudad A','1989-05-15',1),(2,200000002,'Pedro López',45,'Ciudad B','1979-08-23',2),(3,200000003,'Laura García',25,'Ciudad C','1999-02-10',3),(4,200000004,'David Rodríguez',32,'Ciudad D','1986-11-30',4),(5,200000005,'María Pérez',50,'Ciudad E','1974-04-18',5),(6,200000006,'Jorge González',28,'Ciudad F','1996-07-05',6),(7,200000007,'Sofía Fernández',40,'Ciudad G','1982-09-20',7),(8,200000008,'Manuel Gutiérrez',60,'Ciudad H','1962-12-25',8),(9,200000009,'Carla Díaz',22,'Ciudad I','2000-03-12',9),(10,200000010,'Francisco Ruiz',38,'Ciudad J','1984-06-28',10),(11,200000011,'Elena Sánchez',48,'Ciudad K','1974-10-05',11),(12,200000012,'Alejandro Castro',33,'Ciudad L','1989-01-22',12),(13,200000013,'Paula López',27,'Ciudad M','1997-08-17',13),(14,200000014,'Miguel Martínez',55,'Ciudad N','1969-02-08',14),(15,200000015,'Lucía García',42,'Ciudad O','1971-05-25',15),(16,200000016,'Diego Rodríguez',30,'Ciudad P','1992-11-12',16),(17,200000017,'Andrea Pérez',20,'Ciudad Q','2002-04-03',17),(18,200000018,'Juan González',36,'Ciudad R','1986-07-19',18),(19,200000019,'Ana Fernández',47,'Ciudad S','1975-09-07',19),(20,200000020,'Pedro Gutiérrez',25,'Ciudad T','1999-01-30',20),(21,200000021,'Laura Díaz',53,'Ciudad U','1969-06-14',21),(22,200000022,'David Ruiz',29,'Ciudad V','1995-10-01',22),(23,200000023,'María Sánchez',39,'Ciudad W','1983-03-24',23),(24,200000024,'Jorge Castro',49,'Ciudad X','1973-12-10',24),(25,200000025,'Sofía López',26,'Ciudad Y','1998-07-27',25),(26,200000026,'Manuel Martínez',41,'Ciudad Z','1981-02-19',1),(27,200000027,'Carla González',31,'Ciudad A','1991-05-03',2),(28,200000028,'Francisco Pérez',44,'Ciudad B','1978-08-21',3),(29,200000029,'Elena Fernández',24,'Ciudad C','2000-01-16',4),(30,200000030,'Alejandro Gutiérrez',37,'Ciudad D','1985-06-08',5),(31,200000031,'Paula Díaz',51,'Ciudad E','1971-11-29',6),(32,200000032,'Miguel Ruiz',29,'Ciudad F','1995-04-14',7),(33,200000033,'Lucía Castro',43,'Ciudad G','1979-07-02',8),(34,200000034,'Diego Martínez',21,'Ciudad H','2003-02-27',9),(35,200000035,'Andrea García',34,'Ciudad I','1988-05-10',10),(36,200000036,'Juan Rodríguez',46,'Ciudad J','1976-10-26',11),(37,200000037,'Ana Pérez',56,'Ciudad K','1966-01-18',12),(38,200000038,'Pedro González',23,'Ciudad L','1999-04-07',13),(39,200000039,'Laura Martínez',32,'Ciudad M','1990-08-31',14),(40,200000040,'David Fernández',52,'Ciudad N','1970-12-20',15),(41,200000041,'María Gutiérrez',33,'Ciudad O','1988-03-13',16),(42,200000042,'Jorge Díaz',28,'Ciudad P','1996-06-01',17),(43,200000043,'Sofía Ruiz',45,'Ciudad Q','1977-09-22',18),(44,200000044,'Manuel Castro',27,'Ciudad R','1997-02-09',19),(45,200000045,'Carla Martínez',38,'Ciudad S','1984-05-04',20),(46,200000046,'Francisco Fernández',48,'Ciudad T','1974-10-17',21),(47,200000047,'Elena Gutiérrez',26,'Ciudad U','1998-01-05',22),(48,200000048,'Alejandro Díaz',42,'Ciudad V','1980-04-25',23),(49,200000049,'Paula Ruiz',55,'Ciudad W','1967-09-14',24),(50,200000050,'Miguel Castro',30,'Ciudad X','1992-12-03',25);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_patient` BEFORE INSERT ON `patients` FOR EACH ROW BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('INSERT', USER(), CONCAT('N/A', ' -> ', NEW.DNI));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_patient` AFTER INSERT ON `patients` FOR EACH ROW BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('INSERT', USER(), CONCAT('N/A', ' -> ', NEW.DNI));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_patient` BEFORE UPDATE ON `patients` FOR EACH ROW BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('UPDATE', USER(), CONCAT(OLD.DNI, ' -> ', NEW.DNI));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_patient` AFTER UPDATE ON `patients` FOR EACH ROW BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('UPDATE', USER(), CONCAT(OLD.DNI, ' -> ', NEW.DNI));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_patient` BEFORE DELETE ON `patients` FOR EACH ROW BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('DELETE', USER(), CONCAT(OLD.DNI, ' -> ', 'N/A'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delete_patient` AFTER DELETE ON `patients` FOR EACH ROW BEGIN
    INSERT INTO log_patients (nombre_accion, usuario, valorAnterior_valorNuevo)
    VALUES ('DELETE', USER(), CONCAT(OLD.DNI, ' -> ', 'N/A'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `idPrescription` int NOT NULL AUTO_INCREMENT,
  `Doctor_DNI` int DEFAULT NULL,
  `Patient_DNI` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Medication_idMedication` int DEFAULT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPrescription`),
  KEY `Doctor_DNI` (`Doctor_DNI`),
  KEY `Patient_DNI` (`Patient_DNI`),
  KEY `Medication_idMedication` (`Medication_idMedication`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`Doctor_DNI`) REFERENCES `doctors` (`DNI`),
  CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`Patient_DNI`) REFERENCES `patients` (`DNI`),
  CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`Medication_idMedication`) REFERENCES `medications` (`idMedication`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (101,100000001,200000001,'2024-01-01',1,'1 comprimido cada 8 horas'),(102,100000002,200000002,'2024-01-02',2,'1 cápsula cada 12 horas'),(103,100000003,200000003,'2024-01-03',3,'2 tabletas al día'),(104,100000004,200000004,'2024-01-04',4,'1 comprimido cada 6 horas'),(105,100000005,200000005,'2024-01-05',5,'1 tableta cada noche'),(106,100000006,200000006,'2024-01-06',6,'1 pastilla cada mañana'),(107,100000007,200000007,'2024-01-07',7,'1 pastilla cada 8 horas'),(108,100000008,200000008,'2024-01-08',8,'1 comprimido cada 24 horas'),(109,100000009,200000009,'2024-01-09',9,'1 pastilla cada noche'),(110,100000010,200000010,'2024-01-10',10,'1 tableta cada 12 horas'),(111,100000011,200000011,'2024-01-11',11,'1 tableta cada 6 horas'),(112,100000012,200000012,'2024-01-12',12,'1 pastilla cada 8 horas'),(113,100000013,200000013,'2024-01-13',13,'1 comprimido cada 24 horas'),(114,100000014,200000014,'2024-01-14',14,'1 cápsula cada 12 horas'),(115,100000015,200000015,'2024-01-15',15,'1 tableta cada 8 horas'),(116,100000016,200000016,'2024-01-16',16,'1 tableta cada 12 horas'),(117,100000017,200000017,'2024-01-17',17,'1 pastilla cada 6 horas'),(118,100000018,200000018,'2024-01-18',18,'1 tableta cada 24 horas'),(119,100000019,200000019,'2024-01-19',19,'1 pastilla cada noche'),(120,100000020,200000020,'2024-01-20',20,'1 comprimido cada 8 horas'),(121,100000021,200000021,'2024-01-21',1,'1 comprimido cada 12 horas'),(122,100000022,200000022,'2024-01-22',2,'1 cápsula cada 6 horas'),(123,100000023,200000023,'2024-01-23',3,'1 pastilla cada 8 horas'),(124,100000024,200000024,'2024-01-24',4,'1 tableta cada 24 horas'),(125,100000025,200000025,'2024-01-25',5,'1 pastilla cada noche'),(126,100000001,200000026,'2024-01-26',1,'1 comprimido cada 8 horas'),(127,100000002,200000027,'2024-01-27',2,'1 cápsula cada 12 horas'),(128,100000003,200000028,'2024-01-28',3,'2 tabletas al día'),(129,100000004,200000029,'2024-01-29',4,'1 comprimido cada 6 horas'),(130,100000005,200000030,'2024-01-30',5,'1 tableta cada noche'),(131,100000006,200000031,'2024-01-31',6,'1 pastilla cada mañana'),(132,100000007,200000032,'2024-02-01',7,'1 pastilla cada 8 horas'),(133,100000008,200000033,'2024-02-02',8,'1 comprimido cada 24 horas'),(134,100000009,200000034,'2024-02-03',9,'1 pastilla cada noche'),(135,100000010,200000035,'2024-02-04',10,'1 tableta cada 12 horas'),(136,100000011,200000036,'2024-02-05',11,'1 tableta cada 6 horas'),(137,100000012,200000037,'2024-02-06',12,'1 pastilla cada 8 horas'),(138,100000013,200000038,'2024-02-07',13,'1 comprimido cada 24 horas'),(139,100000014,200000039,'2024-02-08',14,'1 cápsula cada 12 horas'),(140,100000015,200000040,'2024-02-09',15,'1 tableta cada 8 horas'),(141,100000016,200000041,'2024-02-10',16,'1 tableta cada 12 horas'),(142,100000017,200000042,'2024-02-11',17,'1 pastilla cada 6 horas'),(143,100000018,200000043,'2024-02-12',18,'1 tableta cada 24 horas'),(144,100000019,200000044,'2024-02-13',19,'1 pastilla cada noche'),(145,100000020,200000045,'2024-02-14',20,'1 comprimido cada 8 horas'),(146,100000021,200000046,'2024-02-15',1,'1 comprimido cada 12 horas'),(147,100000022,200000047,'2024-02-16',2,'1 cápsula cada 6 horas'),(148,100000023,200000048,'2024-02-17',3,'1 pastilla cada 8 horas'),(149,100000024,200000049,'2024-02-18',4,'1 tableta cada 24 horas'),(150,100000025,200000050,'2024-02-19',5,'1 pastilla cada noche');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialities`
--

DROP TABLE IF EXISTS `specialities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialities` (
  `idSpecialities` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Treatment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idSpecialities`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialities`
--

LOCK TABLES `specialities` WRITE;
/*!40000 ALTER TABLE `specialities` DISABLE KEYS */;
INSERT INTO `specialities` VALUES (1,'Medicina General','Tratamiento general de enfermedades'),(2,'Cardiología','Tratamiento de enfermedades del corazón'),(3,'Neurología','Tratamiento de enfermedades del sistema nervioso'),(4,'Reumatología','Tratamiento de enfermedades de los tejidos blandos y articulaciones'),(5,'Psiquiatría','Tratamiento de trastornos mentales'),(6,'Oncología','Tratamiento de cáncer'),(7,'Dermatología','Tratamiento de enfermedades de la piel'),(8,'Geriatría','Atención médica a personas mayores'),(9,'Nefrología','Tratamiento de enfermedades del riñón'),(10,'Hematología','Tratamiento de enfermedades de la sangre'),(11,'Gastroenterología','Tratamiento de enfermedades del sistema digestivo'),(12,'Endocrinología','Tratamiento de trastornos hormonales');
/*!40000 ALTER TABLE `specialities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_salud_medina'
--

--
-- Dumping routines for database 'db_salud_medina'
--
/*!50003 DROP FUNCTION IF EXISTS `f_FindPatientByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_FindPatientByName`(name VARCHAR(100)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE patientID INT;
    SELECT idPatients INTO patientID
    FROM Patients
    WHERE Name = name ;
    
    RETURN patientID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_FindPatientsByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_FindPatientsByName`(p_name VARCHAR(100)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE pID INT;
    SELECT idPatients INTO pID
    FROM Patients
    WHERE Name = p_name ;
    
    RETURN pID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_ValidateEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_ValidateEmail`(email VARCHAR(100)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE isValid BOOLEAN DEFAULT FALSE;
    SET email = TRIM(email);
    
    IF email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
        SET isValid = TRUE;
    END IF;
    
    RETURN isValid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateEmail`(email VARCHAR(100)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE isValid BOOLEAN DEFAULT FALSE;
    SET email = TRIM(email);
    
    IF email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
        SET isValid = TRUE;
    END IF;
    
    RETURN isValid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CreateMedicalAppointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CreateMedicalAppointment`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GetDiseaseStatistics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetDiseaseStatistics`(
    IN diseaseName VARCHAR(100),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT 
        COUNT(*) AS TotalCases,
        SUM(CASE WHEN pres.Date BETWEEN startDate AND endDate THEN 1 ELSE 0 END) AS CasesInRange,
        AVG(DATEDIFF(endDate, startDate)) AS AverageDuration
    FROM 
        Patients p
    JOIN 
        Diseases d ON p.Diseases_idDiseases = d.idDiseases
    JOIN 
        Prescriptions pres ON p.DNI = pres.Patient_DNI
    WHERE 
        d.Name = diseaseName
        AND pres.Date BETWEEN startDate AND endDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GetPatientInfoByDNI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetPatientInfoByDNI`(IN param_patientDNI INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `db_usuarios_salud_medina`
--

USE `db_usuarios_salud_medina`;

--
-- Final view structure for view `vista_doctors_in_speciality_1`
--

/*!50001 DROP VIEW IF EXISTS `vista_doctors_in_speciality_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_doctors_in_speciality_1` AS select `d`.`DNI` AS `Doctor_DNI`,`d`.`Name` AS `Doctor_Name`,`d`.`email` AS `Doctor_Email`,`d`.`Mobile` AS `Doctor_Mobile`,`m`.`Name` AS `Med_Center_Name` from (`db_salud_medina`.`doctors` `d` join `db_salud_medina`.`med_center` `m` on((`d`.`Med_Center_idMed_Center` = `m`.`idMed_Center`))) where (`d`.`Specialities_idSpecialities` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_hospital_and_doctor_for_disease_15`
--

/*!50001 DROP VIEW IF EXISTS `vista_hospital_and_doctor_for_disease_15`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_hospital_and_doctor_for_disease_15` AS select `p`.`Name` AS `Patient_Name`,`p`.`City` AS `Patient_City`,`m`.`Name` AS `Hospital_Name`,`m`.`Address` AS `Hospital_Address`,`d`.`Name` AS `Doctor_Name` from ((((`db_salud_medina`.`patients` `p` join `db_salud_medina`.`diseases` `dis` on((`p`.`Diseases_idDiseases` = `dis`.`idDiseases`))) join `db_salud_medina`.`specialities` `s` on((`dis`.`Specialities_idSpecialities` = `s`.`idSpecialities`))) join `db_salud_medina`.`med_center` `m` on((`s`.`idSpecialities` = `m`.`Specialities_idSpecialities`))) join `db_salud_medina`.`doctors` `d` on(((`m`.`idMed_Center` = `d`.`Med_Center_idMed_Center`) and (`s`.`idSpecialities` = `d`.`Specialities_idSpecialities`)))) where (`p`.`Diseases_idDiseases` = 15) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pacientes_hospital_general`
--

/*!50001 DROP VIEW IF EXISTS `vista_pacientes_hospital_general`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pacientes_hospital_general` AS select `db_salud_medina`.`patients`.`idPatients` AS `idPatients`,`db_salud_medina`.`patients`.`DNI` AS `DNI`,`db_salud_medina`.`patients`.`Name` AS `Name`,`db_salud_medina`.`patients`.`Age` AS `Age`,`db_salud_medina`.`patients`.`City` AS `City`,`db_salud_medina`.`patients`.`Birth` AS `Birth`,`db_salud_medina`.`patients`.`Diseases_idDiseases` AS `Diseases_idDiseases` from ((`db_salud_medina`.`patients` join `db_salud_medina`.`diseases` on((`db_salud_medina`.`patients`.`Diseases_idDiseases` = `db_salud_medina`.`diseases`.`idDiseases`))) join `db_salud_medina`.`specialities` on((`db_salud_medina`.`diseases`.`Specialities_idSpecialities` = `db_salud_medina`.`specialities`.`idSpecialities`))) where (`db_salud_medina`.`specialities`.`Name` = 'Medicina General') order by `db_salud_medina`.`patients`.`Age` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_patient_info`
--

/*!50001 DROP VIEW IF EXISTS `vista_patient_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_patient_info` AS select `p`.`DNI` AS `Patient_DNI`,`p`.`Name` AS `Patient_Name`,`p`.`Age` AS `Patient_Age`,`p`.`City` AS `Patient_City`,`p`.`Birth` AS `Patient_Birth`,`d`.`Name` AS `Doctor_Name`,`d`.`email` AS `Doctor_Email`,`d`.`Mobile` AS `Doctor_Mobile`,`m`.`Name` AS `Med_Center_Name`,`s`.`Name` AS `Speciality_Name`,`dis`.`Name` AS `Disease_Name`,`med`.`Name` AS `Medication_Name`,`med`.`Composition` AS `Medication_Composition`,`med`.`Instructions` AS `Medication_Instructions`,`med`.`Side_Effects` AS `Medication_Side_Effects`,`med`.`Contraindications` AS `Medication_Contraindications` from ((((((`db_salud_medina`.`patients` `p` join `db_salud_medina`.`diseases` `dis` on((`p`.`Diseases_idDiseases` = `dis`.`idDiseases`))) join `db_salud_medina`.`doctors` `d` on((`dis`.`Specialities_idSpecialities` = `d`.`Specialities_idSpecialities`))) join `db_salud_medina`.`med_center` `m` on((`d`.`Med_Center_idMed_Center` = `m`.`idMed_Center`))) join `db_salud_medina`.`specialities` `s` on((`dis`.`Specialities_idSpecialities` = `s`.`idSpecialities`))) join `db_salud_medina`.`prescriptions` `pres` on((`p`.`DNI` = `pres`.`Patient_DNI`))) join `db_salud_medina`.`medications` `med` on((`pres`.`Medication_idMedication` = `med`.`idMedication`))) where (`p`.`DNI` = 200000024) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_promedio_edad_gripe`
--

/*!50001 DROP VIEW IF EXISTS `vista_promedio_edad_gripe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_promedio_edad_gripe` AS select avg(`p`.`Age`) AS `Promedio_Edad_Gripe` from (`db_salud_medina`.`patients` `p` join `db_salud_medina`.`diseases` `d` on((`p`.`Diseases_idDiseases` = `d`.`idDiseases`))) where (`d`.`Name` = 'Gripe') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `db_salud_medina`
--

USE `db_salud_medina`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-30  1:47:17
