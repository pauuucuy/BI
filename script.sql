-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema escuela_deportiva
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema escuela_deportiva
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escuela_deportiva` DEFAULT CHARACTER SET utf8mb4 ;
-- -----------------------------------------------------
-- Schema escueladeportiva
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema escueladeportiva
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escueladeportiva` DEFAULT CHARACTER SET utf8mb4 ;
USE `escuela_deportiva` ;

-- -----------------------------------------------------
-- Table `escuela_deportiva`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escuela_deportiva`.`usuario` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(50) NULL DEFAULT NULL,
  `correo` VARCHAR(100) NULL DEFAULT NULL,
  `rol` ENUM('alumno', 'profesor') NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `correo` (`correo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escuela_deportiva`.`sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escuela_deportiva`.`sede` (
  `id_sede` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_sede`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escuela_deportiva`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escuela_deportiva`.`alumno` (
  `id_alumno` INT(11) NOT NULL,
  `id_sede` INT(11) NOT NULL,
  PRIMARY KEY (`id_alumno`),
  INDEX `id_sede` (`id_sede` ASC) VISIBLE,
  CONSTRAINT `alumno_ibfk_1`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `escuela_deportiva`.`usuario` (`id_usuario`),
  CONSTRAINT `alumno_ibfk_2`
    FOREIGN KEY (`id_sede`)
    REFERENCES `escuela_deportiva`.`sede` (`id_sede`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escuela_deportiva`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escuela_deportiva`.`profesor` (
  `id_profesor` INT(11) NOT NULL,
  `especialidad` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_profesor`),
  CONSTRAINT `profesor_ibfk_1`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `escuela_deportiva`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escuela_deportiva`.`clase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escuela_deportiva`.`clase` (
  `id_clase` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_clase` VARCHAR(100) NOT NULL,
  `horario` VARCHAR(100) NULL DEFAULT NULL,
  `id_profesor` INT(11) NOT NULL,
  `id_sede` INT(11) NOT NULL,
  PRIMARY KEY (`id_clase`),
  INDEX `id_profesor` (`id_profesor` ASC),
  INDEX `id_sede` (`id_sede` ASC),
  CONSTRAINT `clase_ibfk_1`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `escuela_deportiva`.`profesor` (`id_profesor`),
  CONSTRAINT `clase_ibfk_2`
    FOREIGN KEY (`id_sede`)
    REFERENCES `escuela_deportiva`.`sede` (`id_sede`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escuela_deportiva`.`asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escuela_deportiva`.`asistencia` (
  `id_asistencia` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `id_alumno` INT(11) NOT NULL,
  `id_clase` INT(11) NOT NULL,
  PRIMARY KEY (`id_asistencia`),
  INDEX `id_alumno` (`id_alumno` ASC),
  INDEX `id_clase` (`id_clase` ASC),
  CONSTRAINT `asistencia_ibfk_1`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `escuela_deportiva`.`alumno` (`id_alumno`),
  CONSTRAINT `asistencia_ibfk_2`
    FOREIGN KEY (`id_clase`)
    REFERENCES `escuela_deportiva`.`clase` (`id_clase`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escuela_deportiva`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escuela_deportiva`.`matricula` (
  `id_matricula` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` DATE NULL DEFAULT NULL,
  `fecha_fin` DATE NULL DEFAULT NULL,
  `id_alumno` INT(11) NOT NULL,
  `id_clase` INT(11) NOT NULL,
  PRIMARY KEY (`id_matricula`),
  INDEX `id_alumno` (`id_alumno` ASC),
  INDEX `id_clase` (`id_clase` ASC),
  CONSTRAINT `matricula_ibfk_1`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `escuela_deportiva`.`alumno` (`id_alumno`),
  CONSTRAINT `matricula_ibfk_2`
    FOREIGN KEY (`id_clase`)
    REFERENCES `escuela_deportiva`.`clase` (`id_clase`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escuela_deportiva`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escuela_deportiva`.`pago` (
  `id_pago` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_pago` DATE NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `id_alumno` INT(11) NOT NULL,
  PRIMARY KEY (`id_pago`),
  INDEX `id_alumno` (`id_alumno` ASC),
  CONSTRAINT `pago_ibfk_1`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `escuela_deportiva`.`alumno` (`id_alumno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

USE `escueladeportiva` ;

-- -----------------------------------------------------
-- Table `escueladeportiva`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escueladeportiva`.`usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `fechaNacimiento` DATE NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(50) NULL DEFAULT NULL,
  `correo` VARCHAR(100) NULL DEFAULT NULL,
  `rol` ENUM('alumno', 'profesor') NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `correo` (`correo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escueladeportiva`.`sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escueladeportiva`.`sede` (
  `idSede` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idSede`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escueladeportiva`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escueladeportiva`.`alumno` (
  `idAlumno` INT(11) NOT NULL,
  `idSede` INT(11) NOT NULL,
  PRIMARY KEY (`idAlumno`),
  INDEX `idSede` (`idSede` ASC),
  CONSTRAINT `alumno_ibfk_1`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `escueladeportiva`.`usuario` (`idUsuario`),
  CONSTRAINT `alumno_ibfk_2`
    FOREIGN KEY (`idSede`)
    REFERENCES `escueladeportiva`.`sede` (`idSede`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escueladeportiva`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escueladeportiva`.`profesor` (
  `idProfesor` INT(11) NOT NULL,
  `especialidad` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idProfesor`),
  CONSTRAINT `profesor_ibfk_1`
    FOREIGN KEY (`idProfesor`)
    REFERENCES `escueladeportiva`.`usuario` (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escueladeportiva`.`clase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escueladeportiva`.`clase` (
  `idClase` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreClase` VARCHAR(100) NOT NULL,
  `horario` VARCHAR(100) NULL DEFAULT NULL,
  `idProfesor` INT(11) NOT NULL,
  `idSede` INT(11) NOT NULL,
  PRIMARY KEY (`idClase`),
  INDEX `idProfesor` (`idProfesor` ASC),
  INDEX `idSede` (`idSede` ASC),
  CONSTRAINT `clase_ibfk_1`
    FOREIGN KEY (`idProfesor`)
    REFERENCES `escueladeportiva`.`profesor` (`idProfesor`),
  CONSTRAINT `clase_ibfk_2`
    FOREIGN KEY (`idSede`)
    REFERENCES `escueladeportiva`.`sede` (`idSede`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escueladeportiva`.`asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escueladeportiva`.`asistencia` (
  `idAsistencia` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `idAlumno` INT(11) NOT NULL,
  `idClase` INT(11) NOT NULL,
  PRIMARY KEY (`idAsistencia`),
  INDEX `idAlumno` (`idAlumno` ASC),
  INDEX `idClase` (`idClase` ASC),
  CONSTRAINT `asistencia_ibfk_1`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `escueladeportiva`.`alumno` (`idAlumno`),
  CONSTRAINT `asistencia_ibfk_2`
    FOREIGN KEY (`idClase`)
    REFERENCES `escueladeportiva`.`clase` (`idClase`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escueladeportiva`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escueladeportiva`.`matricula` (
  `idMatricula` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` DATE NULL DEFAULT NULL,
  `fechaFin` DATE NULL DEFAULT NULL,
  `idAlumno` INT(11) NOT NULL,
  `idClase` INT(11) NOT NULL,
  PRIMARY KEY (`idMatricula`),
  INDEX `idAlumno` (`idAlumno` ASC),
  INDEX `idClase` (`idClase` ASC),
  CONSTRAINT `matricula_ibfk_1`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `escueladeportiva`.`alumno` (`idAlumno`),
  CONSTRAINT `matricula_ibfk_2`
    FOREIGN KEY (`idClase`)
    REFERENCES `escueladeportiva`.`clase` (`idClase`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `escueladeportiva`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escueladeportiva`.`pago` (
  `idPago` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaPago` DATE NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `idMatricula` INT(11) NOT NULL,
  PRIMARY KEY (`idPago`),
  INDEX `idMatricula` (`idMatricula` ASC),
  CONSTRAINT `pago_ibfk_1`
    FOREIGN KEY (`idMatricula`)
    REFERENCES `escueladeportiva`.`matricula` (`idMatricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
