-- MySQL Script generated by MySQL Workbench
-- Fri Dec  2 04:30:43 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clog` DEFAULT CHARACTER SET utf8 ;
USE `clog` ;

-- -----------------------------------------------------
-- Table `clog`.`service_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clog`.`service_log` ;

CREATE TABLE IF NOT EXISTS `clog`.`service_log` (
  `id` VARCHAR(25) NOT NULL,
  `svc_name` VARCHAR(50) NOT NULL,
  `svc_parent` VARCHAR(50) NULL,
  `message` VARCHAR(100) NULL,
  `severity` VARCHAR(10) NOT NULL COMMENT 'types:\n- info\n- warning\n- error',
  `path` VARCHAR(1000) NOT NULL,
  `function` VARCHAR(100) NOT NULL,
  `req_header` TEXT NULL,
  `req_body` TEXT NULL,
  `req_par` TEXT NULL,
  `res_data` TEXT NULL,
  `res_code` INT NULL,
  `data` TEXT NULL,
  `error` VARCHAR(200) NULL,
  `stack_trace` TEXT NULL,
  `duration_ms` INT NOT NULL,
  `start_at` TIMESTAMP(3) NOT NULL,
  `finish_at` TIMESTAMP(3) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`, `svc_name`))
ENGINE = InnoDB;

CREATE INDEX `service_log_idx_svcName_message` ON `clog`.`service_log` (`svc_name` ASC, `message` ASC) VISIBLE;

CREATE INDEX `service_log_idx_svcName_severity` ON `clog`.`service_log` (`svc_name` ASC, `severity` ASC) VISIBLE;

CREATE INDEX `service_log_idx_svcName_severity_message` ON `clog`.`service_log` (`svc_name` ASC, `severity` ASC, `message` ASC) VISIBLE;

CREATE INDEX `service_log_idx_svcName_resCode` ON `clog`.`service_log` (`svc_name` ASC, `res_code` ASC) VISIBLE;

CREATE INDEX `service_log_idx_svcName_createdAt` ON `clog`.`service_log` (`svc_name` ASC, `created_at` ASC) VISIBLE;

CREATE INDEX `service_log_idx_durationMs` ON `clog`.`service_log` (`duration_ms` ASC) VISIBLE;

CREATE INDEX `service_log_idx_createdAt` ON `clog`.`service_log` (`created_at` ASC) VISIBLE;

CREATE INDEX `service_log_idx_svcName` ON `clog`.`service_log` (`svc_name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `clog`.`info_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clog`.`info_log` ;

CREATE TABLE IF NOT EXISTS `clog`.`info_log` (
  `id` VARCHAR(25) NOT NULL,
  `svc_name` VARCHAR(50) NOT NULL,
  `svc_parent` VARCHAR(50) NULL,
  `message` VARCHAR(100) NOT NULL,
  `severity` VARCHAR(10) NOT NULL COMMENT 'types:\n- info\n- warning\n- error',
  `path` VARCHAR(1000) NOT NULL,
  `function` VARCHAR(100) NOT NULL,
  `data` TEXT NULL,
  `created_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`, `svc_name`))
ENGINE = InnoDB;

CREATE INDEX `info_log_idx_svcName` ON `clog`.`info_log` (`svc_name` ASC) VISIBLE;

CREATE INDEX `info_log_idx_svcName_message` ON `clog`.`info_log` (`svc_name` ASC, `message` ASC) VISIBLE;

CREATE INDEX `info_log_idx_svcName_severity` ON `clog`.`info_log` (`svc_name` ASC, `severity` ASC) VISIBLE;

CREATE INDEX `info_log_idx_svcName_createdAt` ON `clog`.`info_log` (`svc_name` ASC, `created_at` ASC) VISIBLE;

CREATE INDEX `info_log_idx_createdAt` ON `clog`.`info_log` (`created_at` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
