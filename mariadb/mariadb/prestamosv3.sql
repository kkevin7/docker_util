CREATE DATABASE  IF NOT EXISTS `prestamos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `prestamos`;
-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: prestamos
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.9-MariaDB-10.2.9+maria~jessie

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cuenta` varchar(45) NOT NULL,
  `monto` double NOT NULL,
  PRIMARY KEY (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance`
--

LOCK TABLES `balance` WRITE;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` text NOT NULL,
  PRIMARY KEY (`id_bitacora`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,1,'2017-11-30 03:53:35','El usuario inicio Sesión'),(2,1,'2017-11-30 04:20:39','Se creo el cliente con dui :48434374-3'),(3,1,'2017-11-30 04:21:38','Se creo el cliente con dui :87389328-3'),(4,1,'2017-11-30 04:25:13','Se creo el cliente con dui :43894334-8'),(5,1,'2017-11-30 04:32:39','Se creo el cliente con dui :98098980-9'),(6,1,'2017-11-30 04:35:33','Se creo el cliente con dui :43344334-3'),(7,1,'2017-11-30 04:38:22','Se creo el cliente con dui :35454554-5'),(8,1,'2017-11-30 04:41:47','Se creo el cliente con dui :88955656-5'),(9,1,'2017-11-30 04:51:36','Genero un prestamos para el cliente con el dui : 35454554-5'),(10,1,'2017-11-30 04:52:16','Genero un prestamos para el cliente con el dui : 43894334-8'),(11,1,'2017-11-30 05:00:50','Genero un prestamos para el cliente con el dui : 48434374-3'),(12,1,'2017-11-30 05:01:15','Registró un pago para el prestamo con id : '),(13,1,'2017-11-30 08:44:05','El usuario inicio Sesión'),(14,1,'2017-11-30 08:44:42','El usuario termino sesíon'),(15,1,'2017-11-30 08:50:33','El usuario inicio Sesión'),(16,1,'2017-11-30 08:57:33','El usuario termino sesíon'),(17,1,'2017-11-30 08:58:12','El usuario inicio Sesión'),(18,1,'2017-11-30 09:03:36','El usuario termino sesíon'),(19,1,'2017-11-30 09:04:17','El usuario inicio Sesión'),(20,1,'2017-11-30 09:05:32','El usuario termino sesíon'),(21,1,'2017-11-30 09:06:18','El usuario inicio Sesión'),(22,1,'2017-11-30 09:08:59','Se creo el cliente con dui :84389389-5'),(23,1,'2017-11-30 09:10:51','Se elimino el cliente con el dui : 84389389-5'),(24,1,'2017-11-30 09:13:06','Se creo el cliente con dui :32894378-9'),(25,1,'2017-11-30 09:16:03','Se elimino el cliente con el dui : 32894378-9'),(26,1,'2017-11-30 09:18:17','Genero un prestamos para el cliente con el dui : 98098980-9'),(27,1,'2017-11-30 09:18:34','Elimino un prestamos para el cliente con el dui : 35454554-5'),(28,1,'2017-11-30 09:20:45','Registró un pago para el prestamo con id : '),(29,1,'2017-11-30 09:27:01','EL usuario creo el siguiente usuario : carlas con el id 0'),(30,1,'2017-11-30 09:30:25','Registró un pago para el prestamo con id : ');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `dui` char(10) NOT NULL,
  `nit` char(17) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `sexo` char(1) CHARACTER SET big5 NOT NULL,
  `direccion` text NOT NULL,
  `telefonos` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `observaciones` text DEFAULT NULL,
  `profesion` varchar(45) NOT NULL,
  PRIMARY KEY (`dui`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('35454554-5','1454-544848-485-6','Walter Ernesto','Ramirez Castillo','M','en una casa de barro','7996-6626','1997-06-11','','Ing. en Sistemas'),('43344334-3','5445-344343-423-3','Kevin Vicente','Martinez Ayala','M','en una casa','7986-1854','1995-04-09','','Ing. en Sistemas'),('43894334-8','9343-490943-340-4','Cristian Yonavy','Chavez Barrera','M','en casa cerca de la U','7995-2333','1995-11-24','','Ing. en Sistemas'),('48434374-3','7437-437497-943-4','Andrea Sofía','Hernandez Cruz','F','cerca de la U','7896-5656','1996-05-09','','Ing. en Sistemas'),('87389328-3','8488-947848-943-3','Javier Null','Santo Bonilla','M','en una casa','7959-9536','1995-02-09','','Ing. en Sistemas'),('88955656-5','4848-484848-484-6','Ricardo Alberto','Barrientos Alegria','M','en una casa','7659-5655','1995-04-11','','Ing. en SIstemas'),('98098980-9','8789-778723-732-3','Henri Leonel','Jacobo Lopez','M','en una casa','7945-4545','1996-05-11','','Arquitecto');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuota`
--

DROP TABLE IF EXISTS `cuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuota` (
  `id_prestamo` int(11) NOT NULL,
  `num_cuota` int(11) NOT NULL,
  `valor` double NOT NULL,
  `interes` double NOT NULL,
  `fecha` date NOT NULL,
  `capital` double NOT NULL,
  `saldo_anterior` double NOT NULL,
  `saldo_actualizado` double NOT NULL,
  `mora` double DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`,`num_cuota`),
  CONSTRAINT `fk_cuota_prestamo` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuota`
--

LOCK TABLES `cuota` WRITE;
/*!40000 ALTER TABLE `cuota` DISABLE KEYS */;
INSERT INTO `cuota` VALUES (3,1,60,1.87,'2017-11-30',58.13,350,291.87,0),(4,1,60,0,'2017-11-30',60,250,190,0);
/*!40000 ALTER TABLE `cuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `dui` char(10) NOT NULL,
  `correlativo` int(11) NOT NULL,
  `nombre_archivo` text NOT NULL,
  `archivo` longblob NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`dui`,`correlativo`),
  CONSTRAINT `fk_documentos_cliente1` FOREIGN KEY (`dui`) REFERENCES `cliente` (`dui`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_resultados`
--

DROP TABLE IF EXISTS `estado_resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_resultados` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cuenta` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_resultados`
--

LOCK TABLES `estado_resultados` WRITE;
/*!40000 ALTER TABLE `estado_resultados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_er`
--

DROP TABLE IF EXISTS `movimientos_er`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos_er` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `monto` double NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  CONSTRAINT `id_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `estado_resultados` (`id_cuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_er`
--

LOCK TABLES `movimientos_er` WRITE;
/*!40000 ALTER TABLE `movimientos_er` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_er` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro`
--

DROP TABLE IF EXISTS `parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametro` (
  `id_parametro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `valor` varchar(100) NOT NULL,
  PRIMARY KEY (`id_parametro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro`
--

LOCK TABLES `parametro` WRITE;
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
INSERT INTO `parametro` VALUES (1,'interes_mensual','14.0'),(2,'interes_diaria','16.0'),(3,'mora','5.0');
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL AUTO_INCREMENT,
  `dui` char(10) NOT NULL,
  `monto` double NOT NULL,
  `valor_cuota` double NOT NULL,
  `tasa_interes` double NOT NULL,
  `cantidad_cuotas` int(3) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_ultimo_pago` date DEFAULT NULL,
  `saldo` double NOT NULL,
  `estado` char(1) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `capitalizacion` char(1) NOT NULL,
  `tasa_mora` double NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `fk_prestamo_cliente1_idx` (`dui`),
  CONSTRAINT `fk_prestamo_cliente1` FOREIGN KEY (`dui`) REFERENCES `cliente` (`dui`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (2,'43894334-8',250,40.8,15,18,'2017-11-29','2019-05-30','1111-11-11',250,'A','','M',5),(3,'48434374-3',350,52.85,16,36,'2017-11-29','2020-11-29','2017-11-30',291.87,'A','','D',5),(4,'98098980-9',250,38.86,15,24,'2017-11-30','2019-11-29','2017-11-30',190,'A','','M',5);
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `clave` char(32) NOT NULL,
  `rol` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'kkevin7','Kevin','Martinez','81069b209152545c2c3a86aa40f60699','a'),(2,'andy','Andrea','Hernandez','ddc88111e7c6437760bf9c1e7f267b47','a'),(3,'jssbonilla','Javier','Santos','573f6166bad88aa883a43615bcafcb37','a'),(4,'carlos1','carlas','menjivar','1a1dc91c907325c69271ddf0c944bc72','u');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-30  3:46:47
