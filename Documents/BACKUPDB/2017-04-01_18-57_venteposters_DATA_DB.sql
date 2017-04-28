-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: venteposters
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Current Database: `venteposters`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `venteposters` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `venteposters`;

--
-- Table structure for table `posters`
--

DROP TABLE IF EXISTS `posters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posters` (
  `posterID` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `auteur` varchar(255) DEFAULT NULL,
  `prix_unitaire` decimal(10,0) DEFAULT NULL,
  `lienposter` varchar(500) DEFAULT NULL,
  `actif` int(1) DEFAULT NULL,
  `theme` varchar(500) DEFAULT NULL,
  `orientation` int(1) DEFAULT NULL,
  `couleur` int(1) DEFAULT NULL,
  PRIMARY KEY (`posterID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posters`
--

LOCK TABLES `posters` WRITE;
/*!40000 ALTER TABLE `posters` DISABLE KEYS */;
INSERT INTO `posters` VALUES (1,'This is it','Jackson Mikael',12000,NULL,1,'personne',0,1);
/*!40000 ALTER TABLE `posters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateurs` (
  `utilisateur` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `actif` int(1) DEFAULT NULL,
  `rue1` varchar(255) DEFAULT NULL,
  `rue2` varchar(255) DEFAULT NULL,
  `pays` varchar(45) DEFAULT NULL,
  `codepost` varchar(45) DEFAULT NULL,
  `localite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`utilisateur`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES ('admin','admin','Administrateur','Administrateur',1,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vente_details`
--

DROP TABLE IF EXISTS `vente_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vente_details` (
  `idvente_detail` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) DEFAULT NULL,
  `prix_unitaire` decimal(10,0) DEFAULT NULL,
  `vente_idvente` int(11) NOT NULL,
  `posterID` int(11) NOT NULL,
  PRIMARY KEY (`idvente_detail`,`vente_idvente`),
  KEY `fk_vente_detail_livres1_idx` (`posterID`),
  KEY `fk_vente_detail_vente1_idx` (`vente_idvente`),
  CONSTRAINT `fk_vente_detail_livres1` FOREIGN KEY (`posterID`) REFERENCES `posters` (`posterID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vente_detail_vente1` FOREIGN KEY (`vente_idvente`) REFERENCES `ventes` (`idvente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vente_details`
--

LOCK TABLES `vente_details` WRITE;
/*!40000 ALTER TABLE `vente_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `vente_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventes` (
  `idvente` int(11) NOT NULL AUTO_INCREMENT,
  `datevente` int(11) DEFAULT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `utilisateurs_utilisateur` varchar(255) NOT NULL,
  PRIMARY KEY (`idvente`,`utilisateurs_utilisateur`),
  KEY `fk_vente_utilisateurs_idx` (`utilisateurs_utilisateur`),
  CONSTRAINT `fk_vente_utilisateurs` FOREIGN KEY (`utilisateurs_utilisateur`) REFERENCES `utilisateurs` (`utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventes`
--

LOCK TABLES `ventes` WRITE;
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-28 18:57:32
