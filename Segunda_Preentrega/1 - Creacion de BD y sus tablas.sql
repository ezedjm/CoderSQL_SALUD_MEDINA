
-- En la 2da entrega habilitada el 18/03 agrego cinco tablas mas, dos LOG de auditoria y las tabla de Prescriptions y medications
DROP SCHEMA IF EXISTS `DB_SALUD_MEDINA`;
-- Creo mi base de datos
CREATE SCHEMA IF NOT EXISTS `DB_SALUD_MEDINA`;
USE `DB_SALUD_MEDINA` ;

-- -----------------------------------------------------
-- Creo Table `mydb`.`Specialities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DB_SALUD_MEDINA`.`Specialities` ;

CREATE TABLE IF NOT EXISTS `DB_SALUD_MEDINA`.`Specialities` (
  `idSpecialities` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Treatment` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSpecialities`))
ENGINE = InnoDB;

ALTER TABLE Specialities MODIFY COLUMN Treatment VARCHAR(100);



-- -----------------------------------------------------
-- Creo Table `DB_SALUD_MEDINA`.`Med_Center`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DB_SALUD_MEDINA`.`Med_Center` ;

CREATE TABLE IF NOT EXISTS `DB_SALUD_MEDINA`.`Med_Center` (
  `idMed_Center` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Specialities_idSpecialities` INT NOT NULL,
  PRIMARY KEY (`idMed_Center`, `Specialities_idSpecialities`),
  INDEX `fk_Med_Center_Specialities1_idx` (`Specialities_idSpecialities` ASC) VISIBLE,
  CONSTRAINT `fk_Med_Center_Specialities1`
    FOREIGN KEY (`Specialities_idSpecialities`)
    REFERENCES `DB_SALUD_MEDINA`.`Specialities` (`idSpecialities`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Creo Table `DB_SALUD_MEDINA`.`Doctors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DB_SALUD_MEDINA`.`Doctors` ;

CREATE TABLE IF NOT EXISTS `DB_SALUD_MEDINA`.`Doctors` (
  `DNI` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Mobile` VARCHAR(45) NOT NULL,
  `Med_Center_idMed_Center` INT NOT NULL,
  `Specialities_idSpecialities` INT NOT NULL,
  PRIMARY KEY (`DNI`, `Med_Center_idMed_Center`, `Specialities_idSpecialities`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  INDEX `fk_Doctors_Med_Center_idx` (`Med_Center_idMed_Center` ASC) VISIBLE,
  INDEX `fk_Doctors_Specialities1_idx` (`Specialities_idSpecialities` ASC) VISIBLE,
  CONSTRAINT `fk_Doctors_Med_Center`
    FOREIGN KEY (`Med_Center_idMed_Center`)
    REFERENCES `DB_SALUD_MEDINA`.`Med_Center` (`idMed_Center`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctors_Specialities1`
    FOREIGN KEY (`Specialities_idSpecialities`)
    REFERENCES `DB_SALUD_MEDINA`.`Specialities` (`idSpecialities`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Creo Table `DB_SALUD_MEDINA`.`Diseases`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DB_SALUD_MEDINA`.`Diseases` ;

CREATE TABLE IF NOT EXISTS `DB_SALUD_MEDINA`.`Diseases` (
  `idDiseases` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Treatable` CHAR(1) BINARY NOT NULL,
  `Specialities_idSpecialities` INT NOT NULL,
  PRIMARY KEY (`idDiseases`, `Specialities_idSpecialities`),
  INDEX `fk_Diseases_Specialities1_idx` (`Specialities_idSpecialities` ASC) VISIBLE,
  CONSTRAINT `fk_Diseases_Specialities1`
    FOREIGN KEY (`Specialities_idSpecialities`)
    REFERENCES `DB_SALUD_MEDINA`.`Specialities` (`idSpecialities`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Creo Table `DB_SALUD_MEDINA`.`Patients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DB_SALUD_MEDINA`.`Patients` ;

CREATE TABLE IF NOT EXISTS `DB_SALUD_MEDINA`.`Patients` (
  `idPatients` INT NOT NULL AUTO_INCREMENT,
  `DNI` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Age` INT NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Birth` DATE NOT NULL,
  `Diseases_idDiseases` INT NOT NULL,
  PRIMARY KEY (`idPatients`, `Diseases_idDiseases`),
  INDEX `fk_Patients_Diseases1_idx` (`Diseases_idDiseases` ASC) VISIBLE,
  CONSTRAINT `fk_Patients_Diseases1`
    FOREIGN KEY (`Diseases_idDiseases`)
    REFERENCES `DB_SALUD_MEDINA`.`Diseases` (`idDiseases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `DB_SALUD_MEDINA`.`Patients` ADD INDEX `idx_DNI` (`DNI`);

ALTER TABLE `DB_SALUD_MEDINA`.`Patients`
MODIFY COLUMN `idPatients` INT NOT NULL AUTO_INCREMENT;


-- -----------------------------------------------------
-- Creo Table `DB_SALUD_MEDINA`.`Medications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Medications (
    idMedication INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Composition VARCHAR(255),
    Instructions VARCHAR(255),
    Side_Effects VARCHAR(255),
    Contraindications VARCHAR(255)
);


-- -----------------------------------------------------
-- Creo Table `DB_SALUD_MEDINA`.`Prescriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Prescriptions (
    idPrescription INT AUTO_INCREMENT PRIMARY KEY,
    Doctor_DNI INT,
    Patient_DNI INT,
    Date DATE,
    Medication_idMedication INT,
    Dosage VARCHAR(50),
    FOREIGN KEY (Doctor_DNI) REFERENCES Doctors(DNI),
    FOREIGN KEY (Patient_DNI) REFERENCES Patients(DNI),
    FOREIGN KEY (Medication_idMedication) REFERENCES Medications(idMedication)
);

-- -----------------------------------------------------
-- Para los logs elegi las 2 tablas que supondrian mayores cambios, la de doctores y la de pacientes 
-- -----------------------------------------------------
-- Creo Table `DB_SALUD_MEDINA`.`log_doctors` 
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `DB_SALUD_MEDINA`.`log_doctors` (
  `id_log_doc` INT NOT NULL AUTO_INCREMENT,
  `nombre_accion` VARCHAR(10) NOT NULL,
  `usuario` VARCHAR(100),
  `valorAnterior_valorNuevo` VARCHAR(100),
  `fecha` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log_doc`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Creo Table `DB_SALUD_MEDINA`.`log_patients` 
-- -----------------------------------------------------
-- DROP TABLE `DB_SALUD_MEDINA`.`log_patients`;
CREATE TABLE IF NOT EXISTS `DB_SALUD_MEDINA`.`log_patients` (
 `id_log_patients` INT NOT NULL AUTO_INCREMENT,
  `nombre_accion` VARCHAR(10) NOT NULL,
  `usuario` VARCHAR(100),
  `valorAnterior_valorNuevo` VARCHAR(100),
  `fecha` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log_patients`)
)
ENGINE = InnoDB;

