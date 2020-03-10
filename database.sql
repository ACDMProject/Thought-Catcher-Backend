-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: si2t-rds.cqnzctks4m73.eu-west-2.rds.amazonaws.com    Database: ThoughtCatcher
-- ------------------------------------------------------
-- Server version	5.7.22

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
-- Table structure for table `Distortions`
--

DROP TABLE IF EXISTS `Distortions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Distortions` (
  `Distortion` varchar(150) DEFAULT NULL,
  `Distortion_Index` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Distortions`
--

LOCK TABLES `Distortions` WRITE;
/*!40000 ALTER TABLE `Distortions` DISABLE KEYS */;
INSERT INTO `Distortions` VALUES ('All or Nothing',1),('Jumping to Conclusions',2),('Overgeneralisation',3),('Catastrophising',4),('Mental filtering',5),('Disqualifying the Positive',6),('Personalisation',7),('Shoulds and Oughts',8),('Emotional Reasoning',9),('Labelling',10);
/*!40000 ALTER TABLE `Distortions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mood_table`
--

DROP TABLE IF EXISTS `Mood_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mood_table` (
  `uuid` varchar(50) DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL,
  `Mood` varchar(50) DEFAULT NULL,
  `Mood_Index` int(25) DEFAULT NULL,
  `Thoughts` varchar(150) DEFAULT NULL,
  `Distortion` varchar(150) DEFAULT NULL,
  `Distortion_Index` int(25) DEFAULT NULL,
  `Response` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mood_table`
--

LOCK TABLES `Mood_table` WRITE;
/*!40000 ALTER TABLE `Mood_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mood_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Moods`
--

DROP TABLE IF EXISTS `Moods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Moods` (
  `Mood` varchar(50) DEFAULT NULL,
  `Mood_Index` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Moods`
--

LOCK TABLES `Moods` WRITE;
/*!40000 ALTER TABLE `Moods` DISABLE KEYS */;
INSERT INTO `Moods` VALUES ('Happy',1),('Inspired',2),('Excited',3),('Neutral',4),('Anxious',5),('Exhausted',6),('Sad',7),('Overwhelmed',8),('Stressed',9),('Angry',10);
/*!40000 ALTER TABLE `Moods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-10 21:15:20
