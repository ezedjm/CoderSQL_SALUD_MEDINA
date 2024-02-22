
CREATE SCHEMA IF NOT EXISTS `DB_SALUD_MEDINA`;
USE `DB_SALUD_MEDINA` ;

-- -----------------------------------------------------
-- Table `mydb`.`Specialities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DB_SALUD_MEDINA`.`Specialities` ;

CREATE TABLE IF NOT EXISTS `DB_SALUD_MEDINA`.`Specialities` (
  `idSpecialities` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Treatment` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSpecialities`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_SALUD_MEDINA`.`Med_Center`
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
-- Table `DB_SALUD_MEDINA`.`Doctors`
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
-- Table `DB_SALUD_MEDINA`.`Diseases`
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
-- Table `DB_SALUD_MEDINA`.`Patients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DB_SALUD_MEDINA`.`Patients` ;

CREATE TABLE IF NOT EXISTS `DB_SALUD_MEDINA`.`Patients` (
  `idPatients` INT ,
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


