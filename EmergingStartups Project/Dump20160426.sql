-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: business1
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `categorytable`
--

DROP TABLE IF EXISTS `categorytable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorytable` (
  `categoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorytable`
--

LOCK TABLES `categorytable` WRITE;
/*!40000 ALTER TABLE `categorytable` DISABLE KEYS */;
INSERT INTO `categorytable` VALUES ('Engineering'),('Manufacturing');
/*!40000 ALTER TABLE `categorytable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `userID` int(11) NOT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'aasthagrover91@gmail.com'),(2,'nikhil@gmail.com'),(3,'ashagrover@gmail.com'),(4,'saksham@gmail.com');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrepreneur`
--

DROP TABLE IF EXISTS `entrepreneur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrepreneur` (
  `entrepreneurContact` varchar(255) DEFAULT NULL,
  `entrepreneurName` varchar(255) DEFAULT NULL,
  `proposal` varchar(255) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `FKA3F7A599C3FB3CDB` (`userID`),
  CONSTRAINT `FKA3F7A599C3FB3CDB` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrepreneur`
--

LOCK TABLES `entrepreneur` WRITE;
/*!40000 ALTER TABLE `entrepreneur` DISABLE KEYS */;
INSERT INTO `entrepreneur` VALUES ('jbdjbc','Aastha','education',1),(NULL,NULL,NULL,4);
/*!40000 ALTER TABLE `entrepreneur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrepreneur_investor`
--

DROP TABLE IF EXISTS `entrepreneur_investor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrepreneur_investor` (
  `entrepreneur_investor_id` int(11) NOT NULL AUTO_INCREMENT,
  `selfInvestmentShare` varchar(255) DEFAULT NULL,
  `entrepreneurName` int(11) DEFAULT NULL,
  `investorName` int(11) DEFAULT NULL,
  PRIMARY KEY (`entrepreneur_investor_id`),
  KEY `FK6285CC7E930CE13D` (`entrepreneurName`),
  KEY `FK6285CC7E1ACEF53B` (`investorName`),
  CONSTRAINT `FK6285CC7E1ACEF53B` FOREIGN KEY (`investorName`) REFERENCES `investor` (`userID`),
  CONSTRAINT `FK6285CC7E930CE13D` FOREIGN KEY (`entrepreneurName`) REFERENCES `entrepreneur` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrepreneur_investor`
--

LOCK TABLES `entrepreneur_investor` WRITE;
/*!40000 ALTER TABLE `entrepreneur_investor` DISABLE KEYS */;
INSERT INTO `entrepreneur_investor` VALUES (1,'30%',1,2),(2,'50',1,3);
/*!40000 ALTER TABLE `entrepreneur_investor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert`
--

DROP TABLE IF EXISTS `expert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expert` (
  `expertcontact` varchar(255) DEFAULT NULL,
  `expertname` varchar(255) DEFAULT NULL,
  `expertise` varchar(255) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `FKB328EE2AC3FB3CDB` (`userID`),
  CONSTRAINT `FKB328EE2AC3FB3CDB` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert`
--

LOCK TABLES `expert` WRITE;
/*!40000 ALTER TABLE `expert` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investor`
--

DROP TABLE IF EXISTS `investor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investor` (
  `description` varchar(255) DEFAULT NULL,
  `investorContact` varchar(255) DEFAULT NULL,
  `investorName` varchar(255) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `FK256A0498C3FB3CDB` (`userID`),
  CONSTRAINT `FK256A0498C3FB3CDB` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investor`
--

LOCK TABLES `investor` WRITE;
/*!40000 ALTER TABLE `investor` DISABLE KEYS */;
INSERT INTO `investor` VALUES ('jbjm','abc','Nikhil',2),('nkfknjn','abcd','Asha',3);
/*!40000 ALTER TABLE `investor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `locationname` varchar(255) NOT NULL,
  PRIMARY KEY (`locationname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('Boston'),('Karnal');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertable`
--

DROP TABLE IF EXISTS `usertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertable` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roleType` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `category_categoryName` varchar(255) DEFAULT NULL,
  `location_locationname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID` (`userID`),
  KEY `FK155BF6E3FE5729A9` (`location_locationname`),
  KEY `FK155BF6E33E2E1912` (`category_categoryName`),
  CONSTRAINT `FK155BF6E33E2E1912` FOREIGN KEY (`category_categoryName`) REFERENCES `categorytable` (`categoryName`),
  CONSTRAINT `FK155BF6E3FE5729A9` FOREIGN KEY (`location_locationname`) REFERENCES `location` (`locationname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertable`
--

LOCK TABLES `usertable` WRITE;
/*!40000 ALTER TABLE `usertable` DISABLE KEYS */;
INSERT INTO `usertable` VALUES (1,'Aastha','Female','Grover','abc','Entrepreneur','aasthagrover','Manufacturing','Boston'),(2,'Nikhil','Male','Grover','abc','Investor','nikhilgrover','Manufacturing','Boston'),(3,'Asha','Female','Grover','abc','Investor','ashagrover','Manufacturing','Boston'),(4,'Saksham','Male','Grover','abc','Entrepreneur','sakshamgrover','Engineering','Karnal');
/*!40000 ALTER TABLE `usertable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-26  7:55:19
