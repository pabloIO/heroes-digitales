-- MySQL Script generated by MySQL Workbench
-- Sun Aug 20 21:42:20 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema heroes_digitales
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema heroes_digitales
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `heroes_digitales` DEFAULT CHARACTER SET utf8 ;
USE `heroes_digitales` ;

-- -----------------------------------------------------
-- Table `heroes_digitales`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`ciudad` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`zona` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`genero` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`usuario` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `nombres` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `celular` INT(11) NULL DEFAULT NULL,
  `genero` VARCHAR(10) NULL DEFAULT NULL,
  `terminos_uso` TINYINT(1) NULL DEFAULT '0',
  `activo` TINYINT(1) NULL DEFAULT '0',
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_actualizacion` DATETIME NULL DEFAULT NULL,
  `ciudad_id` INT(10) NOT NULL,
  `zona_id` INT(10) NOT NULL,
  `genero_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_ciudad1_idx` (`ciudad_id` ASC),
  INDEX `fk_usuario_zona1_idx` (`zona_id` ASC),
  INDEX `fk_usuario_genero1_idx` (`genero_id` ASC),
  CONSTRAINT `fk_usuario_ciudad1`
    FOREIGN KEY (`ciudad_id`)
    REFERENCES `heroes_digitales`.`ciudad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_zona1`
    FOREIGN KEY (`zona_id`)
    REFERENCES `heroes_digitales`.`zona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_genero1`
    FOREIGN KEY (`genero_id`)
    REFERENCES `heroes_digitales`.`genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`admin` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_admin_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_admin_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`biografia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`biografia` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  `descripcion` VARCHAR(1000) NULL DEFAULT NULL,
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_actualizacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_biografia_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_biografia_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`categoria` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`colegio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`colegio` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`confirmacion_email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`confirmacion_email` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  `token` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_confirmacion_email_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_confirmacion_email_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`datos_profesionales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`datos_profesionales` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  `organizacion` VARCHAR(100) NULL DEFAULT NULL,
  `trabajo` VARCHAR(100) NULL DEFAULT NULL,
  `profesion` VARCHAR(60) NULL DEFAULT NULL,
  `cv` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_datos_profesionales_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_datos_profesionales_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`division`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`division` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(6) NULL DEFAULT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`equipo` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `ciudad_id` INT(10) NOT NULL,
  `division_id` INT(10) NOT NULL,
  `nombre_equipo` VARCHAR(45) NOT NULL,
  `nombre_proyecto` VARCHAR(100) NULL DEFAULT NULL,
  `descripcion` VARCHAR(200) NULL DEFAULT NULL,
  `modelo_negocio_archivo` VARCHAR(255) NOT NULL,
  `equipo_aprobado` TINYINT(1) NULL DEFAULT '0',
  `activo` TINYINT(1) NULL DEFAULT '1',
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_actualizacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_equipo_ciudad1_idx` (`ciudad_id` ASC),
  INDEX `fk_equipo_division1_idx` (`division_id` ASC),
  CONSTRAINT `fk_equipo_ciudad1`
    FOREIGN KEY (`ciudad_id`)
    REFERENCES `heroes_digitales`.`ciudad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_equipo_division1`
    FOREIGN KEY (`division_id`)
    REFERENCES `heroes_digitales`.`division` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`estudiante` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  `colegio_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_estudiante_usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_estudiante_colegio1_idx` (`colegio_id` ASC),
  CONSTRAINT `fk_estudiante_colegio1`
    FOREIGN KEY (`colegio_id`)
    REFERENCES `heroes_digitales`.`colegio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_estudiante_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`mentor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`mentor` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mentor_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_mentor_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`estudiante_mentor_tiene_equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`estudiante_mentor_tiene_equipo` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `equipo_id` INT(10) NOT NULL,
  `mentor_id` INT(10) NULL DEFAULT NULL,
  `estudiante_id` INT(10) NULL DEFAULT NULL,
  `lider_equipo` TINYINT(1) NULL DEFAULT NULL,
  `estudiante_aprobado` TINYINT(1) NULL DEFAULT NULL,
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_actualizacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_estudiante_mentor_tiene_equipo_equipo1_idx` (`equipo_id` ASC),
  INDEX `fk_estudiante_mentor_tiene_equipo_mentor1_idx` (`mentor_id` ASC),
  INDEX `fk_estudiante_mentor_tiene_equipo_estudiante1_idx` (`estudiante_id` ASC),
  CONSTRAINT `fk_estudiante_mentor_tiene_equipo_equipo1`
    FOREIGN KEY (`equipo_id`)
    REFERENCES `heroes_digitales`.`equipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_estudiante_mentor_tiene_equipo_estudiante1`
    FOREIGN KEY (`estudiante_id`)
    REFERENCES `heroes_digitales`.`estudiante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_estudiante_mentor_tiene_equipo_mentor1`
    FOREIGN KEY (`mentor_id`)
    REFERENCES `heroes_digitales`.`mentor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`experticia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`experticia` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`experto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`experto` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_experto_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_experto_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`habilidad` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`imagen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`imagen` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  `nombre_archivo` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_actualizacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_imagen_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_imagen_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`proyecto` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `equipo_id` INT(10) NOT NULL,
  `codigo_fuente_archivo` VARCHAR(255) NULL DEFAULT NULL,
  `plataforma` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_actualizacion` DATETIME NULL DEFAULT NULL,
  `categoria_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proyecto_equipo1_idx` (`equipo_id` ASC),
  INDEX `fk_proyecto_categoria1_idx` (`categoria_id` ASC),
  CONSTRAINT `fk_proyecto_equipo1`
    FOREIGN KEY (`equipo_id`)
    REFERENCES `heroes_digitales`.`equipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_proyecto_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `heroes_digitales`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`imagen_proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`imagen_proyecto` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `proyecto_id` INT(10) NOT NULL,
  `nombre_archivo` VARCHAR(255) NULL DEFAULT NULL,
  `es_banner` TINYINT(1) NULL DEFAULT '0',
  `es_screen` TINYINT(1) NULL DEFAULT '0',
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_actualizacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_imagen_equipo_proyecto1_idx` (`proyecto_id` ASC),
  CONSTRAINT `fk_imagen_equipo_proyecto1`
    FOREIGN KEY (`proyecto_id`)
    REFERENCES `heroes_digitales`.`proyecto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`juez`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`juez` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_juez_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_juez_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`mentor_tiene_habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`mentor_tiene_habilidad` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `experticia_id` INT(10) NOT NULL,
  `habilidad_id` INT(10) NOT NULL,
  `mentor_id` INT(10) NOT NULL,
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mentor_tiene_habilidad_experticia1_idx` (`experticia_id` ASC),
  INDEX `fk_mentor_tiene_habilidad_habilidad1_idx` (`habilidad_id` ASC),
  INDEX `fk_mentor_tiene_habilidad_mentor1_idx` (`mentor_id` ASC),
  CONSTRAINT `fk_mentor_tiene_habilidad_experticia1`
    FOREIGN KEY (`experticia_id`)
    REFERENCES `heroes_digitales`.`experticia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_mentor_tiene_habilidad_habilidad1`
    FOREIGN KEY (`habilidad_id`)
    REFERENCES `heroes_digitales`.`habilidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_mentor_tiene_habilidad_mentor1`
    FOREIGN KEY (`mentor_id`)
    REFERENCES `heroes_digitales`.`mentor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`reestablecer_password`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`reestablecer_password` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  `token` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_inicio` DATETIME NULL DEFAULT NULL,
  `fecha_fin` DATETIME NULL DEFAULT NULL,
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_actualizacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reestablecer_password_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_reestablecer_password_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`rol` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`usuario_tiene_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`usuario_tiene_rol` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(10) NOT NULL,
  `rol_id` INT(10) NOT NULL,
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_actualizacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_tiene_rol_usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_usuario_tiene_rol_rol1_idx` (`rol_id` ASC),
  CONSTRAINT `fk_usuario_tiene_rol_rol1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `heroes_digitales`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_tiene_rol_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `heroes_digitales`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`video_proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`video_proyecto` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `proyecto_id` INT(10) NOT NULL,
  `nombre_archivo` VARCHAR(255) NULL DEFAULT NULL,
  `es_pitch` TINYINT(1) NULL DEFAULT '0',
  `es_demo` TINYINT(1) NULL DEFAULT '0',
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_actualizacion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_video_proyecto_proyecto1_idx` (`proyecto_id` ASC),
  CONSTRAINT `fk_video_proyecto_proyecto1`
    FOREIGN KEY (`proyecto_id`)
    REFERENCES `heroes_digitales`.`proyecto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `heroes_digitales`.`responsable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroes_digitales`.`responsable` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `estudiante_id` INT(10) NOT NULL,
  `firma` VARCHAR(100) NULL,
  `fecha_creacion` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_responsable_estudiante1_idx` (`estudiante_id` ASC),
  CONSTRAINT `fk_responsable_estudiante1`
    FOREIGN KEY (`estudiante_id`)
    REFERENCES `heroes_digitales`.`estudiante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
