-- MySQL Script generated by MySQL Workbench
-- Fri Nov 20 23:39:09 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`compte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compte` (
  `pseudo` VARCHAR(45) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `statut` TINYINT NOT NULL DEFAULT 0,
  `type` VARCHAR(45) NOT NULL DEFAULT 'SIMPLE',
  PRIMARY KEY (`pseudo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`site`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`site` (
  `nom` VARCHAR(45) NOT NULL,
  `numero_libelle_voie` VARCHAR(60) NOT NULL,
  `code_postal` INT NOT NULL,
  `ville` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`nom`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`service` (
  `nom` INT NOT NULL,
  `mission` VARCHAR(255) NULL,
  `site_nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nom`),
  INDEX `fk_service_site1_idx` (`site_nom` ASC) VISIBLE,
  CONSTRAINT `fk_service_site1`
    FOREIGN KEY (`site_nom`)
    REFERENCES `mydb`.`site` (`nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employe` (
  `reference` INT NOT NULL,
  `prenom` VARCHAR(60) NOT NULL,
  `nom` VARCHAR(60) NOT NULL,
  `poste` VARCHAR(255) NOT NULL,
  `description` LONGTEXT NULL,
  `telephone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `date_adhesion` DATE NULL,
  `compte_pseudo` VARCHAR(45) NOT NULL,
  `service_nom` INT NOT NULL,
  PRIMARY KEY (`reference`),
  INDEX `fk_employe_compte_idx` (`compte_pseudo` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_employe_service1_idx` (`service_nom` ASC) VISIBLE,
  CONSTRAINT `fk_employe_compte`
    FOREIGN KEY (`compte_pseudo`)
    REFERENCES `mydb`.`compte` (`pseudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employe_service1`
    FOREIGN KEY (`service_nom`)
    REFERENCES `mydb`.`service` (`nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`centre_interet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`centre_interet` (
  `id` INT NOT NULL,
  `libelle` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`media` (
  `chemin` VARCHAR(255) NOT NULL,
  `compte_pseudo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`chemin`),
  INDEX `fk_media_compte1_idx` (`compte_pseudo` ASC) VISIBLE,
  CONSTRAINT `fk_media_compte1`
    FOREIGN KEY (`compte_pseudo`)
    REFERENCES `mydb`.`compte` (`pseudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`compte_has_centre_interet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compte_has_centre_interet` (
  `compte_pseudo` VARCHAR(45) NOT NULL,
  `centre_interet_id` INT NOT NULL,
  PRIMARY KEY (`compte_pseudo`, `centre_interet_id`),
  INDEX `fk_compte_has_centre_interet_centre_interet1_idx` (`centre_interet_id` ASC) VISIBLE,
  INDEX `fk_compte_has_centre_interet_compte1_idx` (`compte_pseudo` ASC) VISIBLE,
  CONSTRAINT `fk_compte_has_centre_interet_compte1`
    FOREIGN KEY (`compte_pseudo`)
    REFERENCES `mydb`.`compte` (`pseudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compte_has_centre_interet_centre_interet1`
    FOREIGN KEY (`centre_interet_id`)
    REFERENCES `mydb`.`centre_interet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
