-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bd-vision-digital
-- ------------------------------------------------------
-- Server version	5.7.38-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caracteristicas del equipo`
--

DROP TABLE IF EXISTS `caracteristicas del equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristicas del equipo` (
  `serial` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo de equipo` int(11) NOT NULL,
  `Tipo de CPU` varchar(255) NOT NULL,
  `Cantidad de memoria RAM` varchar(255) NOT NULL,
  `Perifericos` varchar(255) NOT NULL,
  `sistema operativo` varchar(255) NOT NULL,
  `Proveedor` int(11) NOT NULL,
  `Estado del equipo` varchar(255) NOT NULL,
  `Fecha de asignación` date NOT NULL,
  PRIMARY KEY (`serial`),
  KEY `tipo de equipo_idx` (`Tipo de equipo`),
  KEY `proveedor_idx` (`Proveedor`),
  CONSTRAINT `proveedor` FOREIGN KEY (`Proveedor`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipo de equipo` FOREIGN KEY (`Tipo de equipo`) REFERENCES `equipos de computo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas del equipo`
--

LOCK TABLES `caracteristicas del equipo` WRITE;
/*!40000 ALTER TABLE `caracteristicas del equipo` DISABLE KEYS */;
INSERT INTO `caracteristicas del equipo` VALUES (123,1,'intel','64GB','mouse, portatil','Windows',1,'Bien','2022-02-01');
/*!40000 ALTER TABLE `caracteristicas del equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencias`
--

DROP TABLE IF EXISTS `dependencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencias`
--

LOCK TABLES `dependencias` WRITE;
/*!40000 ALTER TABLE `dependencias` DISABLE KEYS */;
INSERT INTO `dependencias` VALUES (1,'desarrollo'),(2,'diseño'),(3,'comercial'),(4,'contabilidad'),(5,'logistica'),(6,'calidad'),(7,'recursos humanos'),(8,'marketing'),(9,'gerencia'),(10,'finanzas'),(11,'sistemas');
/*!40000 ALTER TABLE `dependencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos de computo`
--

DROP TABLE IF EXISTS `equipos de computo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos de computo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos de computo`
--

LOCK TABLES `equipos de computo` WRITE;
/*!40000 ALTER TABLE `equipos de computo` DISABLE KEYS */;
INSERT INTO `equipos de computo` VALUES (1,'PC'),(2,'portatil'),(3,'tablet'),(4,'iMAC'),(5,'servidor');
/*!40000 ALTER TABLE `equipos de computo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `dependencia` int(11) NOT NULL,
  `Equipo asignado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dependencia_idx` (`dependencia`),
  KEY `equipo asignado_idx` (`Equipo asignado`),
  CONSTRAINT `dependencia` FOREIGN KEY (`dependencia`) REFERENCES `dependencias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equipo asignado` FOREIGN KEY (`Equipo asignado`) REFERENCES `caracteristicas del equipo` (`serial`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (4,'juan sebastian','valderrama',1234567890,'desarrollador',1,123),(5,'John Alejandro ','cardenas',1234567890,'desarrollador',2,123),(6,'Yira María ','Andrae',1234567890,'desarrollo',3,123),(7,'Giovanni Villamil','Paloma',1234567890,'desarrollo',4,123),(8,'Jhon Jairo ','Rico',1234567890,'desarrollador',5,123);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'PCCOM'),(2,'MILENIO PC'),(3,'MIAMI SYSTEM'),(4,'SITECH DE COLOMBIA');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02 21:46:57
