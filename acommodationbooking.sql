-- MySQL Script generated by MySQL Workbench
-- Tue Mar 22 21:12:55 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bscproject
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bscproject` ;

-- -----------------------------------------------------
-- Schema bscproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bscproject` DEFAULT CHARACTER SET latin1 ;
USE `bscproject` ;

-- -----------------------------------------------------
-- Table `bscproject`.`manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bscproject`.`manager` ;

CREATE TABLE IF NOT EXISTS `bscproject`.`manager` (
  `Manager Name` CHAR(1) NOT NULL,
  `Client Name` CHAR(1) CHARACTER SET 'ascii' NULL DEFAULT NULL,
  `Trailer Number` INT(11) NULL DEFAULT NULL,
  `Flats ID` INT(11) NOT NULL,
  `Rent Charge` DECIMAL(10,0) NULL DEFAULT NULL,
  `Rent Date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`Manager Name`, `Flats ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bscproject`.`agency client information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bscproject`.`agency client information` ;

CREATE TABLE IF NOT EXISTS `bscproject`.`agency client information` (
  `Client Address` CHAR(1) NULL DEFAULT NULL,
  `Client Name` CHAR(1) NULL DEFAULT NULL,
  `Client Money Spent` DECIMAL(10,0) NULL DEFAULT NULL,
  `Client Likes` TEXT NULL DEFAULT NULL,
  `Client Interest` TEXT NULL DEFAULT NULL,
  `Agency Employee ID` INT(11) NOT NULL,
  PRIMARY KEY (`Agency Employee ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bscproject`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bscproject`.`client` ;

CREATE TABLE IF NOT EXISTS `bscproject`.`client` (
  `Manager ID` INT(11) NOT NULL,
  `Client ID` INT(11) NOT NULL,
  `Client Name` CHAR(1) NULL DEFAULT NULL,
  `Trailer ID` INT(11) NULL DEFAULT NULL,
  `Flats ID` INT(11) NULL DEFAULT NULL,
  `Rent Charge` DECIMAL(10,0) NULL DEFAULT NULL,
  `Rent Date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`Client ID`, `Manager ID`),
  INDEX `cmm_idx` (`Manager ID` ASC) VISIBLE,
  CONSTRAINT `cmm`
    FOREIGN KEY (`Manager ID`)
    REFERENCES `bscproject`.`manager` (`Flats ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ags`
    FOREIGN KEY (`Manager ID`)
    REFERENCES `bscproject`.`agency client information` (`Agency Employee ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bscproject`.`trailer park`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bscproject`.`trailer park` ;

CREATE TABLE IF NOT EXISTS `bscproject`.`trailer park` (
  `TrailerPark Address` CHAR(1) NULL DEFAULT NULL,
  `TrailerPark ID` INT(11) NOT NULL,
  `Trailer Name` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`TrailerPark ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bscproject`.`accomodation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bscproject`.`accomodation` ;

CREATE TABLE IF NOT EXISTS `bscproject`.`accomodation` (
  `Accomodation ID` INT(11) NOT NULL,
  `Trailer ID` INT(11) NOT NULL,
  `Flats ID` INT(11) NULL DEFAULT NULL,
  `Rent Charge` DECIMAL(10,0) NULL DEFAULT NULL,
  `Rent Date` DATETIME NULL DEFAULT NULL,
  `trailer name` VARCHAR(45) NULL,
  PRIMARY KEY (`Accomodation ID`),
  CONSTRAINT `ac`
    FOREIGN KEY (`Accomodation ID`)
    REFERENCES `bscproject`.`client` (`Client ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `am`
    FOREIGN KEY ()
    REFERENCES `bscproject`.`manager` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tc`
    FOREIGN KEY ()
    REFERENCES `bscproject`.`trailer park` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
