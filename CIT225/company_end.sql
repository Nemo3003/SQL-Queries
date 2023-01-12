-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema company_end
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema company_end
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `company_end` DEFAULT CHARACTER SET utf8mb4 ;
USE `company_end` ;

-- -----------------------------------------------------
-- Table `company_end`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company_end`.`company` (
  `company_id` INT NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `company_location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company_end`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company_end`.`employee` (
  `employee_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  `salary` DOUBLE NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `company_id`),
  CONSTRAINT `fk_employee_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company_end`.`company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employee_company1_idx` ON `company_end`.`employee` (`company_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `company_end`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company_end`.`projects` (
  `projects_id` INT NOT NULL,
  `project_title` VARCHAR(45) NOT NULL,
  `project_start_date` VARCHAR(45) NOT NULL,
  `project_deadline` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`projects_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company_end`.`technologies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company_end`.`technologies` (
  `technologies_id` INT NOT NULL,
  `stack` VARCHAR(45) NOT NULL,
  `languages` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`technologies_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company_end`.`internal_projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company_end`.`internal_projects` (
  `internal_projects_id` INT NOT NULL,
  `internal_p_name` VARCHAR(45) NOT NULL,
  `start_date` DATE NULL,
  `company_id` INT NOT NULL,
  `technologies_id` INT NOT NULL,
  PRIMARY KEY (`internal_projects_id`, `company_id`, `technologies_id`),
  CONSTRAINT `fk_internal_projects_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company_end`.`company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_internal_projects_technologies1`
    FOREIGN KEY (`technologies_id`)
    REFERENCES `company_end`.`technologies` (`technologies_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_internal_projects_company1_idx` ON `company_end`.`internal_projects` (`company_id` ASC) VISIBLE;

CREATE INDEX `fk_internal_projects_technologies1_idx` ON `company_end`.`internal_projects` (`technologies_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `company_end`.`contractors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company_end`.`contractors` (
  `contractors_id` INT NOT NULL,
  `contractors_name` VARCHAR(45) NOT NULL,
  `contractors_priority` ENUM('high', 'medium', 'low') NOT NULL,
  PRIMARY KEY (`contractors_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company_end`.`employee_has_projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company_end`.`employee_has_projects` (
  `employee_id` INT NOT NULL,
  `projects_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `projects_id`),
  CONSTRAINT `fk_employee_has_projects_employee`
    FOREIGN KEY (`employee_id`)
    REFERENCES `company_end`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_projects_projects1`
    FOREIGN KEY (`projects_id`)
    REFERENCES `company_end`.`projects` (`projects_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employee_has_projects_projects1_idx` ON `company_end`.`employee_has_projects` (`projects_id` ASC) VISIBLE;

CREATE INDEX `fk_employee_has_projects_employee_idx` ON `company_end`.`employee_has_projects` (`employee_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `company_end`.`employee_has_technologies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company_end`.`employee_has_technologies` (
  `employee_id` INT NOT NULL,
  `technologies_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `technologies_id`),
  CONSTRAINT `fk_employee_has_technologies_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `company_end`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_technologies_technologies1`
    FOREIGN KEY (`technologies_id`)
    REFERENCES `company_end`.`technologies` (`technologies_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employee_has_technologies_technologies1_idx` ON `company_end`.`employee_has_technologies` (`technologies_id` ASC) VISIBLE;

CREATE INDEX `fk_employee_has_technologies_employee1_idx` ON `company_end`.`employee_has_technologies` (`employee_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `company_end`.`contractors_has_projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company_end`.`contractors_has_projects` (
  `contractors_id` INT NOT NULL,
  `projects_id` INT NOT NULL,
  PRIMARY KEY (`contractors_id`, `projects_id`),
  CONSTRAINT `fk_contractors_has_projects_contractors1`
    FOREIGN KEY (`contractors_id`)
    REFERENCES `company_end`.`contractors` (`contractors_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contractors_has_projects_projects1`
    FOREIGN KEY (`projects_id`)
    REFERENCES `company_end`.`projects` (`projects_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_contractors_has_projects_projects1_idx` ON `company_end`.`contractors_has_projects` (`projects_id` ASC) VISIBLE;

CREATE INDEX `fk_contractors_has_projects_contractors1_idx` ON `company_end`.`contractors_has_projects` (`contractors_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `company_end`.`employee_has_internal_projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company_end`.`employee_has_internal_projects` (
  `employee_id` INT NOT NULL,
  `internal_projects_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `internal_projects_id`, `company_id`),
  CONSTRAINT `fk_employee_has_internal_projects_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `company_end`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_internal_projects_internal_projects1`
    FOREIGN KEY (`internal_projects_id` , `company_id`)
    REFERENCES `company_end`.`internal_projects` (`internal_projects_id` , `company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employee_has_internal_projects_internal_projects1_idx` ON `company_end`.`employee_has_internal_projects` (`internal_projects_id` ASC, `company_id` ASC) VISIBLE;

CREATE INDEX `fk_employee_has_internal_projects_employee1_idx` ON `company_end`.`employee_has_internal_projects` (`employee_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

