-- MySQL dump 10.11
--
-- Host: localhost    Database: r_d
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt

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
-- Table structure for table `alloted`
--

DROP TABLE IF EXISTS `alloted`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `alloted` (
  `aid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL,
  `turfid` int(11) NOT NULL,
  `adate` date default NULL,
  `no_of_slots` int(11) default NULL,
  PRIMARY KEY  (`aid`),
  KEY `fk_cid` (`cid`),
  KEY `fk_turfid` (`turfid`),
  CONSTRAINT `fk_cid` FOREIGN KEY (`cid`) REFERENCES `custinfo` (`cid`),
  CONSTRAINT `fk_turfid` FOREIGN KEY (`turfid`) REFERENCES `turf` (`turfid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `alloted`
--

LOCK TABLES `alloted` WRITE;
/*!40000 ALTER TABLE `alloted` DISABLE KEYS */;
INSERT INTO `alloted` VALUES (1,3,2,'2019-10-03',2),(2,3,1,'2019-10-08',2),(3,3,1,'2019-10-09',2),(4,3,2,'2019-10-06',3),(5,3,2,'2019-10-06',2),(6,3,1,'2019-08-30',3),(7,2,7,'2019-09-25',3),(8,2,3,'2019-09-29',3),(9,2,7,'2019-09-13',2),(10,2,3,'2019-09-26',1),(11,3,7,'2019-10-01',3),(12,3,7,'2019-10-01',2),(13,3,3,'2019-09-30',2),(14,3,2,'2019-09-26',1),(15,2,8,'2019-09-29',2);
/*!40000 ALTER TABLE `alloted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alloteddetails`
--

DROP TABLE IF EXISTS `alloteddetails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `alloteddetails` (
  `adid` int(11) NOT NULL auto_increment,
  `aid` int(11) default NULL,
  `sid` int(11) default NULL,
  PRIMARY KEY  (`adid`),
  KEY `fk_sid` (`sid`),
  KEY `fk_adaid` (`aid`),
  CONSTRAINT `fk_adaid` FOREIGN KEY (`aid`) REFERENCES `alloted` (`aid`),
  CONSTRAINT `fk_sid` FOREIGN KEY (`sid`) REFERENCES `slot` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `alloteddetails`
--

LOCK TABLES `alloteddetails` WRITE;
/*!40000 ALTER TABLE `alloteddetails` DISABLE KEYS */;
INSERT INTO `alloteddetails` VALUES (1,1,1),(2,1,2),(3,2,2),(4,2,3),(5,3,2),(6,3,3),(7,4,1),(8,4,2),(9,4,4),(10,5,3),(11,5,5),(12,6,1),(13,6,2),(14,6,3),(15,7,8),(16,7,9),(17,7,10),(18,8,12),(19,8,13),(20,8,11),(21,9,5),(22,9,8),(23,10,13),(24,11,11),(25,11,13),(26,11,12),(27,12,8),(28,12,9),(29,13,13),(30,13,14),(31,14,6),(32,15,11),(33,15,12);
/*!40000 ALTER TABLE `alloteddetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `bill` (
  `billid` int(11) NOT NULL auto_increment,
  `bdate` date default NULL,
  `aid` int(11) default NULL,
  `amt` int(11) default NULL,
  PRIMARY KEY  (`billid`),
  KEY `fk_aid` (`aid`),
  CONSTRAINT `fk_aid` FOREIGN KEY (`aid`) REFERENCES `alloted` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'2019-08-29',1,2200),(2,'2019-08-29',2,1400),(3,'2019-08-29',3,1400),(4,'2019-08-29',4,6300),(5,'2019-08-30',5,4200),(6,'2019-08-30',6,2100),(7,'2019-09-10',7,1800),(8,'2019-09-12',8,3600),(9,'2019-09-13',9,1200),(10,'2019-09-14',13,2400),(11,'2019-09-09',10,1200),(12,'2019-09-15',11,1800),(13,'2019-09-06',12,1200),(14,'2019-09-16',14,2100),(15,'2019-09-17',15,3000);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custinfo`
--

DROP TABLE IF EXISTS `custinfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `custinfo` (
  `cid` int(11) NOT NULL auto_increment,
  `cname` varchar(40) default NULL,
  `cemail` varchar(30) default NULL,
  `cphn` bigint(20) default NULL,
  `cpass` varchar(10) default NULL,
  PRIMARY KEY  (`cid`),
  UNIQUE KEY `cemail` (`cemail`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `custinfo`
--

LOCK TABLES `custinfo` WRITE;
/*!40000 ALTER TABLE `custinfo` DISABLE KEYS */;
INSERT INTO `custinfo` VALUES (1,'farh','ff@gnanaj.com',9988888888,'asdfghjkl'),(2,'zainab Pip','zain@gmail.com',9876543234,'zx'),(3,'dheeraj','dheerajj161@gmail.com',9819627502,'rdx'),(4,'nidhi','nidhitiwari884@gmail.com',9284729265,'Nidhu');
/*!40000 ALTER TABLE `custinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot`
--

DROP TABLE IF EXISTS `slot`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `slot` (
  `sid` int(11) NOT NULL auto_increment,
  `slots` varchar(10) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `slot`
--

LOCK TABLES `slot` WRITE;
/*!40000 ALTER TABLE `slot` DISABLE KEYS */;
INSERT INTO `slot` VALUES (1,'10-11'),(2,'11-12'),(3,'12-1'),(4,'1-2'),(5,'2-3'),(6,'3-4'),(7,'4-5'),(8,'5-6'),(9,'6-7'),(10,'7-8'),(11,'8-9'),(12,'9-10'),(13,'10-11'),(14,'11-12');
/*!40000 ALTER TABLE `slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turf`
--

DROP TABLE IF EXISTS `turf`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `turf` (
  `turfid` int(11) NOT NULL auto_increment,
  `tname` varchar(40) default NULL,
  `tprice` int(11) default NULL,
  `tcap` int(5) default NULL,
  `location` varchar(30) default NULL,
  PRIMARY KEY  (`turfid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `turf`
--

LOCK TABLES `turf` WRITE;
/*!40000 ALTER TABLE `turf` DISABLE KEYS */;
INSERT INTO `turf` VALUES (1,'short pitch',700,5,'Bhayander(w) Maxus'),(2,'trick_shot',2100,11,'Bhayander(w) Flyover'),(3,'pg-vora',1200,9,'Mira road(E)'),(7,'A.P. Turf',600,5,'Mira road MIDC'),(8,'R7 Turf',1500,8,'Mira road Lodha rd'),(9,'India Rush',2000,10,'Mira rd Shanti vihar');
/*!40000 ALTER TABLE `turf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-26 19:41:14
