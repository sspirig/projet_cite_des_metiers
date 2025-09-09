/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: chatbot_cfpt
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `mot_clef`
--

DROP TABLE IF EXISTS `mot_clef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mot_clef` (
  `idMotClef` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `motClef` varchar(100) NOT NULL,
  PRIMARY KEY (`idMotClef`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mot_clef`
--

LOCK TABLES `mot_clef` WRITE;
/*!40000 ALTER TABLE `mot_clef` DISABLE KEYS */;
/*!40000 ALTER TABLE `mot_clef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `idQuestion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `idReponse` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idQuestion`),
  KEY `questions_reponses_FK` (`idReponse`),
  CONSTRAINT `questions_reponses_FK` FOREIGN KEY (`idReponse`) REFERENCES `reponses` (`idReponse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_mot_clef`
--

DROP TABLE IF EXISTS `questions_mot_clef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions_mot_clef` (
  `idQuestion` int(10) unsigned NOT NULL,
  `idMotClef` int(10) unsigned NOT NULL,
  KEY `questions_mot_clef_mot_clef_FK` (`idMotClef`),
  KEY `questions_mot_clef_questions_FK` (`idQuestion`),
  CONSTRAINT `questions_mot_clef_mot_clef_FK` FOREIGN KEY (`idMotClef`) REFERENCES `mot_clef` (`idMotClef`),
  CONSTRAINT `questions_mot_clef_questions_FK` FOREIGN KEY (`idQuestion`) REFERENCES `questions` (`idQuestion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_mot_clef`
--

LOCK TABLES `questions_mot_clef` WRITE;
/*!40000 ALTER TABLE `questions_mot_clef` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions_mot_clef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reponses`
--

DROP TABLE IF EXISTS `reponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reponses` (
  `idReponse` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reponse` varchar(200) NOT NULL,
  PRIMARY KEY (`idReponse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reponses`
--

LOCK TABLES `reponses` WRITE;
/*!40000 ALTER TABLE `reponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `reponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'chatbot_cfpt'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-09-02 10:59:55
