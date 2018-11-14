CREATE DATABASE endulza_tu_mundo;

CREATE TABLE `endulza_tu_mundo`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idpersona`));
INSERT INTO `endulza_tu_mundo`.`persona` (`nombre`, `direccion`, `telefono`) VALUES ('Stefania', 'calle101#24-31', '5094746');
INSERT INTO `endulza_tu_mundo`.`persona` (`nombre`, `direccion`, `telefono`) VALUES ('Geraldine', 'calle101C#76A53', '5098287');
INSERT INTO `endulza_tu_mundo`.`persona` (`nombre`, `direccion`, `telefono`) VALUES ('Maria clara Gutierrez Bedoya', 'Cra74B#98-74', '5084888');
INSERT INTO `endulza_tu_mundo`.`persona` (`nombre`, `direccion`, `telefono`) VALUES ('Anyi Molina', 'calle101A#84-87', '2378507');
INSERT INTO `endulza_tu_mundo`.`persona` (`nombre`, `direccion`, `telefono`) VALUES ('vanessa Borja', 'Calle99#74B17', '5057406');

CREATE TABLE `endulza_tu_mundo`.`opciones` (
  `idopciones` INT NOT NULL AUTO_INCREMENT,
  `opciones` VARCHAR(45) NULL,
  PRIMARY KEY (`idopciones`));
INSERT INTO `endulza_tu_mundo`.`opciones` (`opciones`) VALUES ('postre');
INSERT INTO `endulza_tu_mundo`.`opciones` (`opciones`) VALUES ('seco');
INSERT INTO `endulza_tu_mundo`.`opciones` (`opciones`) VALUES ('refrigerado');

  CREATE TABLE `endulza_tu_mundo`.`sabor` (
  `idsabor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idsabor`));
INSERT INTO `endulza_tu_mundo`.`sabor` (`nombre`) VALUES ('fresa');
INSERT INTO `endulza_tu_mundo`.`sabor` (`nombre`) VALUES ('fresa con chocolate');
INSERT INTO `endulza_tu_mundo`.`sabor` (`nombre`) VALUES ('chocolate');
INSERT INTO `endulza_tu_mundo`.`sabor` (`nombre`) VALUES ('vainilla');
INSERT INTO `endulza_tu_mundo`.`sabor` (`nombre`) VALUES ('arequipe');
INSERT INTO `endulza_tu_mundo`.`sabor` (`nombre`) VALUES ('tres leches');
INSERT INTO `endulza_tu_mundo`.`sabor` (`nombre`) VALUES ('bateado de mora');
INSERT INTO `endulza_tu_mundo`.`sabor` (`nombre`) VALUES ('brownie');

CREATE TABLE `endulza_tu_mundo`.`pedido` (
  `idpedido` INT NOT NULL AUTO_INCREMENT,
  `relleno` VARCHAR(45) NULL,
  PRIMARY KEY (`idpedido`));
ALTER TABLE `endulza_tu_mundo`.`pedido` 
ADD COLUMN `persona` INT(11) NULL AFTER `relleno`,
ADD COLUMN `opcion` INT(11) NULL AFTER `persona`,
ADD COLUMN `sabor` INT(11) NULL AFTER `opcion`,
ADD COLUMN `molde` INT(11) NULL AFTER `sabor`,
ADD COLUMN `porciones` INT(11) NULL AFTER `molde`;

INSERT INTO `endulza_tu_mundo`.`pedido` (`relleno`) VALUES ('chocolate');
INSERT INTO `endulza_tu_mundo`.`pedido` (`relleno`) VALUES ('fresa');
INSERT INTO `endulza_tu_mundo`.`pedido` (`relleno`) VALUES ('vainilla');
INSERT INTO `endulza_tu_mundo`.`pedido` (`relleno`) VALUES ('tres leches');
INSERT INTO `endulza_tu_mundo`.`pedido` (`relleno`) VALUES ('lecherita');
INSERT INTO `endulza_tu_mundo`.`pedido` (`relleno`) VALUES ('arequipe');
INSERT INTO `endulza_tu_mundo`.`pedido` (`relleno`) VALUES ('mora');
INSERT INTO `endulza_tu_mundo`.`pedido` (`relleno`) VALUES ('maracuya');

CREATE TABLE `endulza_tu_mundo`.`molde` (
  `idmolde` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idmolde`));

INSERT INTO `endulza_tu_mundo`.`molde` (`tipo`) VALUES ('redondo');
INSERT INTO `endulza_tu_mundo`.`molde` (`tipo`) VALUES ('triangular');
INSERT INTO `endulza_tu_mundo`.`molde` (`tipo`) VALUES ('cuadrada');
INSERT INTO `endulza_tu_mundo`.`molde` (`tipo`) VALUES ('espiral');

CREATE TABLE `endulza_tu_mundo`.`porciones` (
  `idporciones` INT NOT NULL AUTO_INCREMENT,
  `cantidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idporciones`));
  
INSERT INTO `endulza_tu_mundo`.`porciones` (`cantidad`) VALUES ('5-10');
INSERT INTO `endulza_tu_mundo`.`porciones` (`cantidad`) VALUES ('10-15');
INSERT INTO `endulza_tu_mundo`.`porciones` (`cantidad`) VALUES ('15-20');
INSERT INTO `endulza_tu_mundo`.`porciones` (`cantidad`) VALUES ('20-25');
INSERT INTO `endulza_tu_mundo`.`porciones` (`cantidad`) VALUES ('25-30');
INSERT INTO `endulza_tu_mundo`.`porciones` (`cantidad`) VALUES ('30-35');
INSERT INTO `endulza_tu_mundo`.`porciones` (`cantidad`) VALUES ('35-40');
INSERT INTO `endulza_tu_mundo`.`porciones` (`cantidad`) VALUES ('40-45');
INSERT INTO `endulza_tu_mundo`.`porciones` (`cantidad`) VALUES ('45-50');

UPDATE `endulza_tu_mundo`.`pedido` SET `persona`='3', `opcion`='3', `sabor`='4', `molde`='1', `porciones`='7' WHERE `idpedido`='1';

CREATE TABLE `endulza_tu_mundo`.`registro` (
  `idregistro` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(60) NULL,
  `correo` VARCHAR(90) NULL,
  `contrasena` VARCHAR(45) NULL,
  PRIMARY KEY (`idregistro`));
  
  INSERT INTO `endulza_tu_mundo`.`registro` (`nombre`, `apellido`, `correo`, `contrasena`) VALUES ('stefania', 'londoño', 'slondono004@gmail.com', 'stefania');
  
CREATE TABLE `endulza_tu_mundo`.`relleno` (
  `idRelleno` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idRelleno`));

INSERT INTO `endulza_tu_mundo`.`relleno` (`nombre`) VALUES ('chocolate');
INSERT INTO `endulza_tu_mundo`.`relleno` (`nombre`) VALUES ('fresa');
INSERT INTO `endulza_tu_mundo`.`relleno` (`nombre`) VALUES ('mora');
INSERT INTO `endulza_tu_mundo`.`relleno` (`nombre`) VALUES ('maracuya');
INSERT INTO `endulza_tu_mundo`.`relleno` (`nombre`) VALUES ('lecherita');
INSERT INTO `endulza_tu_mundo`.`relleno` (`nombre`) VALUES ('arequipe');


CREATE TABLE `endulza_tu_mundo`.`precio` (
  `idPrecio` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `precio` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idPrecio`)  COMMENT '');

INSERT INTO `endulza_tu_mundo`.`precio` (`idPrecio`, `precio`) VALUES ('1', '10000');
INSERT INTO `endulza_tu_mundo`.`precio` (`idPrecio`, `precio`) VALUES ('2', '20000');
INSERT INTO `endulza_tu_mundo`.`precio` (`idPrecio`, `precio`) VALUES ('3', '30000');
INSERT INTO `endulza_tu_mundo`.`precio` (`idPrecio`, `precio`) VALUES ('4', '40000');
INSERT INTO `endulza_tu_mundo`.`precio` (`idPrecio`, `precio`) VALUES ('5', '50000');
  
 CREATE TABLE `endulza_tu_mundo`.`codigos` (
  `idCodigos` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Codigos` INT NULL COMMENT '',
  PRIMARY KEY (`idCodigos`)  COMMENT '');
INSERT INTO `endulza_tu_mundo`.`codigos` (`idCodigos`, `Codigos`) VALUES ('1', '123');
INSERT INTO `endulza_tu_mundo`.`codigos` (`idCodigos`, `Codigos`) VALUES ('2', '456');
INSERT INTO `endulza_tu_mundo`.`codigos` (`idCodigos`, `Codigos`) VALUES ('3', '789');
INSERT INTO `endulza_tu_mundo`.`codigos` (`idCodigos`, `Codigos`) VALUES ('4', '1234');
INSERT INTO `endulza_tu_mundo`.`codigos` (`idCodigos`, `Codigos`) VALUES ('5', '5678');

CREATE TABLE `endulza_tu_mundo`.`producto` (
  `idproducto` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sabor` VARCHAR(45) NULL COMMENT '',
  `precio` INT NULL COMMENT '',
  `codigos` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idproducto`)  COMMENT '');

