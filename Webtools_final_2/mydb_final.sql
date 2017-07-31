-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.19-MariaDB

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `catergory_name` varchar(45) NOT NULL,
  PRIMARY KEY (`catergory_name`),
  UNIQUE KEY `catergory_name_UNIQUE` (`catergory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('Finance'),('Food'),('Literary'),('Science'),('UAVs'),('Utility'),('Vehicles');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `paymentamount` double NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mode_of_payment` varchar(45) DEFAULT NULL,
  `CardNumber` varchar(45) DEFAULT NULL,
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceid` int(11) DEFAULT NULL,
  `proj_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `service_fk_idx` (`serviceid`),
  KEY `user_fk_idx` (`user_id`),
  CONSTRAINT `service_fk` FOREIGN KEY (`serviceid`) REFERENCES `projservice` (`service`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (100,NULL,'Credit','0000',1,NULL,NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projservice`
--

DROP TABLE IF EXISTS `projservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projservice` (
  `service` int(11) NOT NULL AUTO_INCREMENT,
  `servicename` varchar(45) DEFAULT NULL,
  `cost` varchar(45) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `project_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`service`),
  KEY `proj_fk_idx` (`project_id`,`project_name`),
  CONSTRAINT `proj_fk` FOREIGN KEY (`project_id`, `project_name`) REFERENCES `user_project` (`user_id`, `name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projservice`
--

LOCK TABLES `projservice` WRITE;
/*!40000 ALTER TABLE `projservice` DISABLE KEYS */;
INSERT INTO `projservice` VALUES (1,'QuadCopter','100',104,'uh'),(2,'Soda','400',106,'Develop Your Own Soda Pop Recipe'),(3,'Book','401',108,'Fahrenheit 451'),(4,'Drone','402',109,'DroneCode'),(5,'Lamp','403',110,'Interior design'),(6,'Free ride','404',111,'REBOOT '),(7,'Relief Quad','405',112,'Quads In Disaster Relief'),(10,'ATV','100',113,'ATVM'),(11,'GearBix','100',113,'ATVM'),(12,'Bike','100',113,'ATVM'),(13,'Bike','100',113,'ATVM');
/*!40000 ALTER TABLE `projservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `USER_NAME` varchar(30) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `AGE` datetime DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE` varchar(45) NOT NULL,
  `TITLE` varchar(45) DEFAULT NULL,
  `LOCATION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_NAME_UNIQUE` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES ('admin','admin','pass',NULL,74,'admin',NULL,NULL),('T','TT','T',NULL,104,'User',NULL,NULL),('pt','tt','t','2017-04-25 00:00:00',106,'User','Mr',NULL),('rt','rtrt','rt','2017-04-06 00:00:00',108,'User','Ms',NULL),('ro','rtrt','rt','2017-04-06 00:00:00',109,'User','Ms',NULL),('e','ee','e','2017-04-06 00:00:00',110,'User','Mr',NULL),('e11','ee','e','2017-04-06 00:00:00',111,'User','Mr',NULL),('e12','ee','e','2017-04-06 00:00:00',112,'User','Mr',NULL),('e13','ee','e','2017-04-06 00:00:00',113,'User','Mr',NULL),('asdf','jjkhjkjhjkhjk','paasdf','2017-12-31 00:00:00',114,'Backer','Ms',NULL),('YU','YUYU','YU','2017-04-12 00:00:00',115,'Backer','Miss',NULL),('yt','yuyu','yu','2017-04-13 00:00:00',117,'User','Ms',NULL),('nim','nimnim','nim','2017-04-11 00:00:00',118,'Backer','Miss',NULL),('poi','oiooiioio','poi','2017-04-10 00:00:00',119,'Backer','Miss',NULL),('taru1991','TaranginiSarathy','taru1991','2017-04-17 00:00:00',120,'Backer','Ms',NULL),('muthiah.m','MeenaM','wo2DHPzleCEdJuw1UU6q9A==','2017-04-06 00:00:00',121,'admin','Ms',NULL),('y','yy','dU4wHMdZzX0=','2017-04-05 00:00:00',122,'User','Ms',NULL),('tara','tararara',NULL,'2017-04-04 00:00:00',123,'User','Ms',NULL),('yub','yubyu','T/B5rwUI87s=','2017-04-10 00:00:00',124,'User','Mr',NULL);
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_information`
--

DROP TABLE IF EXISTS `user_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_information` (
  `user_id` int(11) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_name_fk` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_information`
--

LOCK TABLES `user_information` WRITE;
/*!40000 ALTER TABLE `user_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_project`
--

DROP TABLE IF EXISTS `user_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_project` (
  `user_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `categoryName` varchar(45) DEFAULT NULL,
  `Backers` double DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `Amount_Required` double DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `Funding_Duration` varchar(45) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `Amount_Reached` double DEFAULT NULL,
  PRIMARY KEY (`user_id`,`name`),
  KEY `user_proj_category_idx` (`categoryName`),
  CONSTRAINT `user_proj_category` FOREIGN KEY (`categoryName`) REFERENCES `category` (`catergory_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_project_fk_1` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_project`
--

LOCK TABLES `user_project` WRITE;
/*!40000 ALTER TABLE `user_project` DISABLE KEYS */;
INSERT INTO `user_project` VALUES (104,'uh','huu','Food',NULL,'invalid',90000,'New York','90','2017-04-04',90000),(106,'Develop Your Own Soda Pop Recipe','Develop Your Own Soda Pop Recipe','Food',5,'valid',87600,'New York','91','2017-04-05',75000),(108,'Fahrenheit 451','Have students pose with a favorite book','Literary',6,'Pending',87601,'New York','92','2017-04-06',75001),(109,'DroneCode','From improving agriculture to improving search and rescue','UAVs',7,'valid',87602,'Jersey','93','2017-04-07',75002),(110,'Interior design','Feasibility, interior space, furniture & identity.','Utility',8,'invalid',87603,'Jersey','94','2017-04-08',75003),(111,'REBOOT ','?A new JK would be great, but that price tag just about sends you into a cost coma','Vehicles',9,'valid',87604,'Boston','95','2017-04-09',75004),(112,'Quads In Disaster Relief','?A new JK would be great, but that price tag just about sends you into a cost coma','UAVs',10,'valid',87605,'Boston','96','2017-04-10',75005),(113,'ATVM','Advanced Technology Vehicles Manufacturing (ATVM) loan program has played a key role in helping the ','Vehicles',11,'valid',87606,'Boston','97','2017-04-11',75006),(113,'Fast Cars','Fast Cars','Vehicles',NULL,NULL,10000,NULL,'90','2017-04-19',NULL),(113,'Food Fest','Foodgasm','Food',NULL,NULL,90000,NULL,'90','2017-04-03',NULL),(113,'Food for All','Food for All','Food',NULL,NULL,90000,NULL,'90','2017-04-05',NULL);
/*!40000 ALTER TABLE `user_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-27  7:19:35
