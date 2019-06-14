-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: fossildb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `class` (
  `CLASS` varchar(100) NOT NULL,
  `PHYLUM` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`CLASS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `family` (
  `FAMILY` varchar(100) NOT NULL,
  `ORDER` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FAMILY`),
  KEY `ORDER_idx` (`ORDER`),
  CONSTRAINT `ORDER` FOREIGN KEY (`ORDER`) REFERENCES `orderfs` (`ORDER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fossil`
--

DROP TABLE IF EXISTS `fossil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fossil` (
  `ImageID` int(11) NOT NULL,
  `GSID` varchar(7) DEFAULT NULL,
  `REFNO` int(11) DEFAULT NULL,
  `LOCNO` varchar(15) DEFAULT NULL,
  `TAXACODE` varchar(50) DEFAULT NULL,
  `PH_NUMBERS` varchar(35) DEFAULT NULL,
  `REFPGFIG` varchar(20) DEFAULT NULL,
  `RC` int(11) DEFAULT NULL,
  `XC` int(11) DEFAULT NULL,
  `txtImageName` varchar(100) DEFAULT NULL,
  `SIZE` varchar(20) DEFAULT NULL,
  `TYPE` varchar(200) DEFAULT NULL,
  `PRICE` varchar(20) DEFAULT NULL,
  `COMMON NAME` varchar(50) DEFAULT NULL,
  `SPECIAL` varchar(100) DEFAULT NULL,
  `PHOTO` varchar(100) DEFAULT NULL,
  `FIGURE` varchar(100) DEFAULT NULL,
  `NumSpecimen` varchar(20) DEFAULT NULL,
  `SET_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ImageID`),
  KEY `Loc-No_idx` (`LOCNO`),
  KEY `RefNo_idx` (`REFNO`),
  KEY `LOCNO` (`LOCNO`),
  KEY `REFNO` (`REFNO`),
  KEY `GS-ID_idx` (`GSID`),
  CONSTRAINT `GS-ID` FOREIGN KEY (`GSID`) REFERENCES `genus` (`GSID`),
  CONSTRAINT `LOCNO` FOREIGN KEY (`LOCNO`) REFERENCES `locality` (`LOCNO`),
  CONSTRAINT `REFNO` FOREIGN KEY (`REFNO`) REFERENCES `references` (`﻿REFNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fossil_author`
--

DROP TABLE IF EXISTS `fossil_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fossil_author` (
  `ImageID` int(11) NOT NULL,
  `AUTHOR` varchar(25) NOT NULL,
  PRIMARY KEY (`ImageID`,`AUTHOR`),
  CONSTRAINT `ImageID` FOREIGN KEY (`ImageID`) REFERENCES `fossil` (`ImageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genus`
--

DROP TABLE IF EXISTS `genus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genus` (
  `GSID` varchar(7) NOT NULL,
  `SPECIES` varchar(50) DEFAULT NULL,
  `GENUS` varchar(50) DEFAULT NULL,
  `FAMILY` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`GSID`),
  KEY `FAMILY_idx` (`FAMILY`),
  CONSTRAINT `FAMILY` FOREIGN KEY (`FAMILY`) REFERENCES `family` (`FAMILY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locality`
--

DROP TABLE IF EXISTS `locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `locality` (
  `LOCNO` varchar(15) NOT NULL,
  `REGION` varchar(10) DEFAULT NULL,
  `LNAME` varchar(35) DEFAULT NULL,
  `PERIOD` varchar(35) DEFAULT NULL,
  `LOCLABEL` varchar(50) DEFAULT NULL,
  `COUNTRY` varchar(35) DEFAULT NULL,
  `COUNTY` varchar(35) DEFAULT NULL,
  `SERIES` varchar(35) DEFAULT NULL,
  `STAGE` varchar(35) DEFAULT NULL,
  `GROUP` varchar(35) DEFAULT NULL,
  `FORMATION` varchar(35) DEFAULT NULL,
  `MEMBER` varchar(35) DEFAULT NULL,
  `UNCERTAIN LOC` varchar(35) DEFAULT NULL,
  `SPECIFIC LOC` varchar(35) DEFAULT NULL,
  `VISITED LOC` varchar(35) DEFAULT NULL,
  `LMAP` varchar(35) DEFAULT NULL,
  `GMAP` varchar(35) DEFAULT NULL,
  `MEMO` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`LOCNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderfs`
--

DROP TABLE IF EXISTS `orderfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderfs` (
  `ORDER` varchar(100) NOT NULL,
  `CLASS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ORDER`),
  KEY `CLASS_idx` (`CLASS`),
  CONSTRAINT `CLASS` FOREIGN KEY (`CLASS`) REFERENCES `class` (`CLASS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_author`
--

DROP TABLE IF EXISTS `ref_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ref_author` (
  `REFNO` int(11) NOT NULL,
  `AUTHOR_TEXT` varchar(25) NOT NULL,
  PRIMARY KEY (`REFNO`,`AUTHOR_TEXT`),
  CONSTRAINT `MyRef` FOREIGN KEY (`REFNO`) REFERENCES `references` (`﻿REFNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `references` (
  `﻿REFNO` int(11) NOT NULL,
  `DEWEY` varchar(20) DEFAULT NULL,
  `ORGCODE` varchar(10) DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `SUBJECT` varchar(35) DEFAULT NULL,
  `KEYWORDS` varchar(100) DEFAULT NULL,
  `AUTHOR_TEXT` varchar(100) DEFAULT NULL,
  `DATE` int(11) DEFAULT NULL,
  `PUBL` varchar(100) DEFAULT NULL,
  `PAGES` varchar(35) DEFAULT NULL,
  `SOURCE` varchar(35) DEFAULT NULL,
  `REFPRICE` double DEFAULT NULL,
  `REFMEMO` varchar(150) DEFAULT NULL,
  `REFTYPE` varchar(35) DEFAULT NULL,
  `ISBN` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`﻿REFNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'fossildb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-22 20:32:18
