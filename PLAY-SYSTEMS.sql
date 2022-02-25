CREATE DATABASE  IF NOT EXISTS `heroku_17d9f263de3e5e0` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `heroku_17d9f263de3e5e0`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: eu-cdbr-west-02.cleardb.net    Database: heroku_17d9f263de3e5e0
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Id_Grupo` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Grupo` (`Id_Grupo`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`Id_Grupo`) REFERENCES `grupo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Id_Juego` int(10) unsigned DEFAULT NULL,
  `Modo_de_Juego` enum('Coop','PvP','PvE') DEFAULT NULL,
  `Dimension` int(10) unsigned DEFAULT '2',
  `Descripcion` varchar(500) DEFAULT NULL,
  `Juego_nuevo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Juego` (`Id_Juego`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`Id_Juego`) REFERENCES `juego` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Imagen` mediumblob,
  `Genero` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego`
--

LOCK TABLES `juego` WRITE;
/*!40000 ALTER TABLE `juego` DISABLE KEYS */;
/*!40000 ALTER TABLE `juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensaje` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Id_Chat` int(10) unsigned DEFAULT NULL,
  `Usuario` varchar(20) DEFAULT NULL,
  `Contenido` varchar(500) DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Chat` (`Id_Chat`),
  KEY `Usuario` (`Usuario`),
  CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`Id_Chat`) REFERENCES `chat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mensaje_ibfk_2` FOREIGN KEY (`Usuario`) REFERENCES `usuario` (`Nombre_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_une`
--

DROP TABLE IF EXISTS `se_une`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_une` (
  `Id_Grupo` int(10) unsigned NOT NULL DEFAULT '0',
  `Nombre_Usuario` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id_Grupo`,`Nombre_Usuario`),
  KEY `Nombre_Usuario` (`Nombre_Usuario`),
  CONSTRAINT `se_une_ibfk_1` FOREIGN KEY (`Id_Grupo`) REFERENCES `grupo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `se_une_ibfk_2` FOREIGN KEY (`Nombre_Usuario`) REFERENCES `usuario` (`Nombre_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_une`
--

LOCK TABLES `se_une` WRITE;
/*!40000 ALTER TABLE `se_une` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_une` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Nombre_Usuario` varchar(20) NOT NULL,
  `Nombe` varchar(20) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Palabra_clave` varchar(100) NOT NULL,
  `Foto_perfil` mediumblob,
  `Usuario_Steam` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Nombre_Usuario`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
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

-- Dump completed on 2022-02-25 13:23:36
