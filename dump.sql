-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: Company
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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


DROP DATABASE IF EXISTS `IPL`;
CREATE SCHEMA `IPL`;
USE `IPL`;
DROP TABLE IF EXISTS `TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEAM` (
  `Team_ID` INT NOT NULL,
  `Team Name` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Owner` varchar(100) NOT NULL,
  `EstablishedYear` INT NOT NULL,
  PRIMARY KEY (`Team_ID`),
  UNIQUE KEY `Team Name` (`Team Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `TEAM` WRITE;
/*!40000 ALTER TABLE `TEAM` DISABLE KEYS */;
INSERT INTO `TEAM` VALUES
  (1, 'Mumbai Indians', 'Mumbai', 'Reliance Industries', 2008),
  (2, 'Chennai Super Kings', 'Chennai', 'India Cements', 2008),
  (3, 'Kolkata Knight Riders', 'Kolkata', 'Red Chillies Entertainment', 2008),
  (4, 'Royal Challengers Bangalore', 'Bangalore', 'United Spirits', 2008),
  (5, 'Delhi Capitals', 'Delhi', 'GMR Group', 2008),
  (6, 'Sunrisers Hyderabad', 'Hyderabad', 'Sun TV Network', 2013),
  (7, 'Rajasthan Royals', 'Jaipur', 'Emerging Media', 2008),
  (8, 'Punjab Kings', 'Mohali', 'Preity Zinta, Ness Wadia, Mohit Burman, Karan Paul', 2008),
  (9, 'Gujarat Titans', 'Ahmedabad', 'CVC Capital Partners', 2022),
  (10, 'Lucknow Super Giants', 'Lucknow', 'RPSG Group', 2022);
/*!40000 ALTER TABLE `TEAM` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `PLAYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLAYER` (
  `Player_ID` INT NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `Jersey no` INT NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Team Name` varchar(50) NOT NULL,
  `Nationality` varchar(50) NOT NULL,
  `BattingStyle` varchar(50) NOT NULL,
  `BowlingStyle` varchar(50) NOT NULL,
  `Total runs` INT NOT NULL,
  `Total wickets taken` INT NOT NULL,
  `Matches played` INT NOT NULL,
  `Captain_ID` INT NOT NULL,
  `Team_ID` INT NOT NULL,
  PRIMARY KEY (`Player_ID`),
  CONSTRAINT `PLAYER_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `TEAM` (`Team_ID`),
  CONSTRAINT `PLAYER_ibfk_2` FOREIGN KEY (`Captain_ID`) REFERENCES `PLAYER` (`Player_ID`),
  CONSTRAINT `PLAYER_ibfk_3` FOREIGN KEY (`Team Name`) REFERENCES `TEAM` (`Team Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `PLAYER` WRITE;
/*!40000 ALTER TABLE `PLAYER` DISABLE KEYS */;
INSERT INTO `PLAYER` VALUES 
  (1, 'Rohit Sharma', 45, 'Batsman', 'Mumbai Indians', 'India', 'Right-hand bat', 'Right-arm offbreak', 6000, 15, 200, 1, 1),
  (2, 'Virat Kohli', 18, 'Batsman', 'Royal Challengers Bangalore', 'India', 'Right-hand bat', 'Right-arm medium', 7000, 0, 220, 23, 4),
  (3, 'MS Dhoni', 7, 'Wicket-keeper Batter', 'Chennai Super Kings', 'India', 'Right-hand bat', 'Right-arm medium', 5000, 0, 200, 16, 2),
  (4, 'Jasprit Bumrah', 9, 'Bowler', 'Mumbai Indians', 'India', 'Right-hand bat', 'Right-arm fast-medium', 150, 150, 100, 0, 1),
  (5, 'Ravindra Jadeja', 8, 'All-rounder', 'Chennai Super Kings', 'India', 'Left-hand bat', 'Slow left-arm orthodox', 2500, 150, 200, 0, 2),
  (6, 'Andre Russell', 12, 'All-rounder', 'Kolkata Knight Riders', 'West Indies', 'Right-hand bat', 'Right-arm fast-medium', 2000, 100, 100, 0, 3),
  (7, 'Rashid Khan', 8, 'Bowler', 'Sunrisers Hyderabad', 'Afghanistan', 'Right-hand bat', 'Legbreak googly', 500, 250, 150, 0, 6),
  (8, 'KL Rahul', 1, 'Batsman', 'Lucknow Super Giants', 'India', 'Right-hand bat', 'Right-arm offbreak', 4000, 0, 150, 0, 10),
  (9, 'Hardik Pandya', 33, 'All-rounder', 'Mumbai Indians', 'India', 'Right-hand bat', 'Right-arm fast-medium', 2000, 50, 100, 0, 1),
  (10, 'Suryakumar Yadav', 18, 'Batsman', 'Mumbai Indians', 'India', 'Right-hand bat', 'Right-arm offbreak', 3000, 0, 100, 0, 1),
  (11, 'Shreyas Iyer', 41, 'Batsman', 'Delhi Capitals', 'India', 'Right-hand bat', 'Right-arm legbreak', 2500, 0, 100, 0, 5),
  (12, 'Rishabh Pant', 17, 'Wicket-keeper Batter', 'Delhi Capitals', 'India', 'Left-hand bat', 'Right-arm medium', 2000, 0, 100, 0, 5),
  (13, 'Kagiso Rabada', 25, 'Bowler', 'Delhi Capitals', 'South Africa', 'Left-hand bat', 'Right-arm fast', 150, 150, 80, 0, 5),
  (14, 'Bhuvneshwar Kumar', 15, 'Bowler', 'Sunrisers Hyderabad', 'India', 'Right-hand bat', 'Right-arm fast-medium', 120, 120, 120, 0, 6),
  (15, 'Yuzvendra Chahal', 3, 'Bowler', 'Royal Challengers Bangalore', 'India', 'Right-hand bat', 'Legbreak', 150, 150, 100, 0, 4),
  (16, 'Umran Malik', 11, 'Bowler', 'Sunrisers Hyderabad', 'India', 'Right-hand bat', 'Right-arm fast', 50, 50, 30, 0, 6),
  (17, 'Mohammed Shami', 11, 'Bowler', 'Gujarat Titans', 'India', 'Right-hand bat', 'Right-arm fast-medium', 50, 100, 80, 0, 9),
  (18, 'Mohammad Siraj', 9, 'Bowler', 'Royal Challengers Bangalore', 'India', 'Right-hand bat', 'Right-arm fast-medium', 20, 100, 80, 0, 4),
  (19, 'Trent Boult', 15, 'Bowler', 'Sunrisers Hyderabad', 'New Zealand', 'Left-hand bat', 'Left-arm fast', 10, 100, 80, 0, 6),
  (20, 'Jos Buttler', 18, 'Wicket-keeper Batter', 'Rajasthan Royals', 'England', 'Right-hand bat', 'Right-arm offbreak', 3000, 0, 100, 0, 7),
  (21, 'Sanju Samson', 18, 'Wicket-keeper Batter', 'Rajasthan Royals', 'India', 'Right-hand bat', 'Right-arm offbreak', 3000, 0, 100, 0, 7),
  (22, 'Faf du Plessis', 12, 'Batsman', 'Royal Challengers Bangalore', 'South Africa', 'Right-hand bat', 'Right-arm medium', 3000, 0, 100, 0, 4),
  (23, 'David Warner', 12, 'Batsman', 'Delhi Capitals', 'Australia', 'Left-hand bat', 'Legbreak', 4000, 0, 150, 0, 5),
  (24, 'Shikhar Dhawan', 25, 'Batsman', 'Punjab Kings', 'India', 'Left-hand bat', 'Right-arm offbreak', 4000, 0, 150, 0, 8),
  (25, 'Kane Williamson', 22, 'Batsman', 'Sunrisers Hyderabad', 'New Zealand', 'Right-hand bat', 'Right-arm offbreak', 2500, 0, 100, 0, 6),
  (26, 'Kieron Pollard', 55, 'All-rounder', 'Mumbai Indians', 'West Indies', 'Right-hand bat', 'Right-arm medium-fast', 2755, 56, 148, 8, 1),
  (27, 'Sunil Narine', 74, 'All-rounder', 'Kolkata Knight Riders', 'West Indies', 'Left-hand bat', 'Right-arm offbreak', 771, 122, 110, 12, 3),
  (28, 'Yashasvi Jaiswal', 30, 'Batsman', 'Rajasthan Royals', 'India', 'Left-hand bat', 'Slow left-arm orthodox', 1000, 0, 50, 0, 7),
  (29, 'Rinku Singh', 17, 'Batsman', 'Kolkata Knight Riders', 'India', 'Left-hand bat', 'Slow left-arm orthodox', 500, 0, 30, 0, 3),
  (30, 'Tilak Varma', 17, 'Batsman', 'Mumbai Indians', 'India', 'Left-hand bat', 'Slow left-arm orthodox', 500, 0, 30, 0, 1),
  (31, 'Mohsin Khan', 19, 'Bowler', 'Lucknow Super Giants', 'India', 'Right-hand bat', 'Left-arm medium-fast', 20, 20, 20, 0, 10),
  (32, 'Mark Wood', 15, 'Bowler', 'Lucknow Super Giants', 'England', 'Right-hand bat', 'Right-arm fast', 10, 20, 10, 0, 10);
/*!40000 ALTER TABLE `PLAYER` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `MATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATCH` (
  `Match_ID` INT NOT NULL,
  `Team1_ID` INT NOT NULL,
  `Team2_ID` INT NOT NULL,
  `Stadium_ID` INT NOT NULL,
  `MatchDate` date NOT NULL,
  `Result` varchar(50) NOT NULL,
  `Team_ID` INT NOT NULL,
  PRIMARY KEY (`Match_ID`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `MATCH` WRITE;
/*!40000 ALTER TABLE `MATCH` DISABLE KEYS */;
INSERT INTO `MATCH` VALUES 
  (1, 1, 2, 1, '2023-04-05', 'Mumbai Indians won by 5 wickets', 1),
  (2, 3, 4, 2, '2023-04-06', 'Kolkata Knight Riders won by 10 runs', 3),
  (3, 5, 6, 3, '2023-04-07', 'Delhi Capitals won by 8 wickets', 5),
  (4, 7, 8, 4, '2023-04-08', 'Rajasthan Royals won by 5 wickets', 7),
  (5, 2, 1, 5, '2023-04-09', 'Chennai Super Kings won by 10 runs', 2),
  (6, 4, 3, 6, '2023-04-10', 'Royal Challengers Bangalore won by 6 wickets', 4),
  (7, 8, 7, 7, '2023-04-11', 'Punjab Kings won by 12 runs', 8),
  (8, 6, 5, 8, '2023-04-12', 'Sunrisers Hyderabad won by 7 wickets', 6),
  (9, 1, 3, 1, '2023-04-13', 'Mumbai Indians won by 15 runs', 1),
  (10, 2, 4, 2, '2023-04-14', 'Chennai Super Kings won by 8 wickets', 2),
  (11, 5, 7, 3, '2023-04-15', 'Delhi Capitals won by 3 wickets', 5),
  (12, 6, 8, 4, '2023-04-16', 'Sunrisers Hyderabad won by 4 wickets', 6),
  (13, 1, 4, 5, '2023-04-17', 'Mumbai Indians won by 7 wickets', 1),
  (14, 2, 3, 6, '2023-04-18', 'Chennai Super Kings won by 5 wickets', 2),
  (15, 7, 6, 7, '2023-04-19', 'Rajasthan Royals won by 8 runs', 7),
  (16, 8, 5, 8, '2023-04-20', 'Punjab Kings won by 3 wickets', 8),
  (17, 3, 1, 1, '2023-04-21', 'Kolkata Knight Riders won by 6 wickets', 3),
  (18, 4, 2, 2, '2023-04-22', 'Royal Challengers Bangalore won by 4 wickets', 4),
  (19, 5, 8, 3, '2023-04-23', 'Delhi Capitals won by 7 wickets', 5),
  (20, 6, 7, 4, '2023-04-24', 'Sunrisers Hyderabad won by 10 runs', 6),
  (21, 1, 7, 5, '2023-04-25', 'Mumbai Indians won by 6 wickets', 1),
  (22, 2, 8, 6, '2023-04-26', 'Chennai Super Kings won by 8 wickets', 2),
  (23, 3, 5, 7, '2023-04-27', 'Kolkata Knight Riders won by 4 wickets', 3),
  (24, 4, 6, 8, '2023-04-28', 'Royal Challengers Bangalore won by 5 wickets', 4),
  (25, 7, 1, 1, '2023-04-29', 'Rajasthan Royals won by 3 wickets', 7),
  (26, 8, 2, 2, '2023-04-30', 'Punjab Kings won by 6 wickets', 8),
  (27, 5, 3, 3, '2023-05-01', 'Delhi Capitals won by 7 runs', 5),
  (28, 6, 4, 4, '2023-05-02', 'Sunrisers Hyderabad won by 9 wickets', 6),
  (29, 1, 8, 5, '2023-05-03', 'Mumbai Indians won by 5 wickets', 1),
  (30, 2, 7, 6, '2023-05-04', 'Chennai Super Kings won by 8 wickets', 2);
/*!40000 ALTER TABLE `MATCH` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `STADIUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STADIUM` (
  `Stadium_ID` INT NOT NULL,
  `StadiumName` varchar(50) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Capacity` INT NOT NULL,
  `BuiltYear` INT NOT NULL,
  PRIMARY KEY (`Stadium_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `STADIUM` WRITE;
/*!40000 ALTER TABLE `STADIUM` DISABLE KEYS */;
INSERT INTO `STADIUM` VALUES 
  (1, 'Wankhede Stadium', 'Mumbai', 33000, 1974),
  (2, 'M. A. Chidambaram Stadium', 'Chennai', 50000, 1916),
  (3, 'Eden Gardens', 'Kolkata', 68000, 1864),
  (4, 'Punjab Cricket Association IS Bindra Stadium', 'Mohali', 26000, 1993),
  (5, 'Sawai Mansingh Stadium', 'Jaipur', 30000, 1969),
  (6, 'M. Chinnaswamy Stadium', 'Bangalore', 40000, 1969),
  (7, 'Feroz Shah Kotla Ground', 'Delhi', 42000, 1883),
  (8, 'Narendra Modi Stadium', 'Ahmedabad', 132000, 2022),
  (9, 'B.R. Ambedkar Stadium', 'Kanpur', 30000, 1978),
  (10, 'Ekana Cricket Stadium', 'Lucknow', 50000, 2021);
/*!40000 ALTER TABLE `STADIUM` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `PLAYER_CONTRACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLAYER_CONTRACT` (
  `Player_ID` INT NOT NULL,
  `Team_ID` INT NOT NULL,
  `Contract start date` date NOT NULL,
  `Contract end date` date NOT NULL,
  `Salary` INT NOT NULL,
  PRIMARY KEY (`Player_ID`, `Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `PLAYER_CONTRACT` WRITE;
/*!40000 ALTER TABLE `PLAYER_CONTRACT` DISABLE KEYS */;
INSERT INTO `PLAYER_CONTRACT` VALUES 
  (1, 1, '2023-01-01', '2025-12-31', 16000000),
  (2, 4, '2022-11-01', '2024-10-31', 15000000),
  (3, 2, '2023-01-01', '2025-12-31', 12000000),
  (4, 1, '2023-01-01', '2025-12-31', 10000000),
  (5, 2, '2023-01-01', '2025-12-31', 8000000),
  (6, 3, '2023-01-01', '2025-12-31', 8000000),
  (7, 6, '2023-01-01', '2025-12-31', 6000000),
  (8, 10, '2023-01-01', '2025-12-31', 5000000),
  (9, 1, '2023-01-01', '2025-12-31', 4000000),
  (10, 1, '2023-01-01', '2025-12-31', 3000000),
  (11, 5, '2023-01-01', '2025-12-31', 2500000),
  (12, 5, '2023-01-01', '2025-12-31', 2000000),
  (13, 5, '2023-01-01', '2025-12-31', 1800000),
  (14, 6, '2023-01-01', '2025-12-31', 1500000),
  (15, 4, '2023-01-01', '2025-12-31', 1200000),
  (16, 6, '2023-01-01', '2025-12-31', 1000000),
  (17, 9, '2023-01-01', '2025-12-31', 8000000),
  (18, 4, '2023-01-01', '2025-12-31', 6000000),
  (19, 6, '2023-01-01', '2025-12-31', 5000000),
  (20, 7, '2023-01-01', '2025-12-31', 4000000),
  (21, 7, '2023-01-01', '2025-12-31', 3000000),
  (22, 4, '2023-01-01', '2025-12-31', 2500000),
  (23, 5, '2023-01-01', '2025-12-31', 2000000),
  (24, 8, '2023-01-01', '2025-12-31', 1800000),
  (25, 6, '2023-01-01', '2025-12-31', 1500000),
  (26, 1, '2023-01-01', '2025-12-31', 1200000),
  (27, 3, '2023-01-01', '2025-12-31', 1000000),
  (28, 7, '2023-01-01', '2025-12-31', 800000),
  (29, 3, '2023-01-01', '2025-12-31', 600000),
  (30, 1, '2023-01-01', '2025-12-31', 500000),
  (31, 10, '2023-01-01', '2025-12-31', 400000),
  (32, 10, '2023-01-01', '2025-12-31', 300000);
/*!40000 ALTER TABLE `PLAYER_CONTRACT` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `COACH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COACH` (
  `Coach_ID` INT NOT NULL,
  `Coach_name` varchar(50) NOT NULL,
  `C_Nationality` varchar(50) NOT NULL,
  `Coaching_specialty` varchar(50) NOT NULL,
  `Team_ID` INT NOT NULL,
  PRIMARY KEY (`Coach_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `COACH` WRITE;
/*!40000 ALTER TABLE `COACH` DISABLE KEYS */;
INSERT INTO `COACH` VALUES 
  (1, 'Mahela Jayawardene', 'Sri Lanka', 'Batting', 1),
  (2, 'Stephen Fleming', 'New Zealand', 'Batting', 2),
  (3, 'Jacques Kallis', 'South Africa', 'All-round', 3),
  (4, 'Sanjay Bangar', 'India', 'Batting', 4),
  (5, 'Ricky Ponting', 'Australia', 'Batting', 5),
  (6, 'Brian Lara', 'West Indies', 'Batting', 6),
  (7, 'Kumar Sangakkara', 'Sri Lanka', 'Batting', 7),
  (8, 'Trevor Bayliss', 'Australia', 'All-round', 8),
  (9, 'Gary Kirsten', 'South Africa', 'Batting', 9),
  (10, 'Andy Flower', 'Zimbabwe', 'Batting', 10);
/*!40000 ALTER TABLE `COACH` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS PLAYER_STATS;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLAYER_STATS` (
  `Player_ID` INT NOT NULL,
  `Match_ID` INT NOT NULL,
  `runs scored` INT NOT NULL,
  `balls faced` INT NOT NULL,
  `wicktes taken` INT NOT NULL,
  `balls bowled` INT NOT NULL,
  `runs given` INT NOT NULL,
  `catches taken` INT NOT NULL,
  PRIMARY KEY (`Player_ID`,`Match_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `PLAYER_STATS` WRITE;
/*!40000 ALTER TABLE `PLAYER_STATS` DISABLE KEYS */;
INSERT INTO `PLAYER_STATS` VALUES 
  (1, 1, 50, 35, 0, 0, 0, 1),
  (2, 1, 32, 25, 2, 24, 18, 0),
  (3, 2, 45, 30, 0, 0, 0, 2),
  (4, 2, 20, 15, 2, 18, 12, 0),
  (5, 3, 30, 20, 1, 24, 15, 0),
  (6, 3, 25, 18, 0, 0, 0, 1),
  (7, 4, 15, 10, 2, 12, 8, 0),
  (8, 4, 40, 30, 0, 0, 0, 2),
  (9, 5, 28, 22, 1, 20, 10, 0),
  (10, 5, 35, 28, 0, 0, 0, 1);
/*!40000 ALTER TABLE `PLAYER_STATS` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS INJURY;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INJURY` (
  `INJURY_ID` INT NOT NULL,
  `Player_ID` INT NOT NULL,
  `Injury_type` varchar(50) NOT NULL,
  `Duration` INT NOT NULL,
  PRIMARY KEY (`INJURY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `INJURY` WRITE;
/*!40000 ALTER TABLE `INJURY` DISABLE KEYS */;
INSERT INTO `INJURY` VALUES 
  (1, 1, 'Hamstring', 15),
  (2, 2, 'Back Strain', 10),
  (3, 3, 'Knee Injury', 20),
  (4, 4, 'Shoulder Injury', 12),
  (5, 5, 'Ankle Sprain', 7),
  (6, 6, 'Muscle Strain', 10),
  (7, 7, 'Finger Injury', 5),
  (8, 8, 'Groin Strain', 12),
  (9, 9, 'Back Strain', 10),
  (10, 10, 'Knee Injury', 15);
/*!40000 ALTER TABLE `INJURY` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS MATCH_STATS;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATCH_STATS` (
  `Match_ID` INT NOT NULL,
  `Team_ID` INT NOT NULL,
  `Team score` INT NOT NULL,
  `balls faced` INT NOT NULL,
  `wickets down` INT NOT NULL,
  `wickets taken` INT NOT NULL,
  `balls bowled` INT NOT NULL,
  `runs given` INT NOT NULL,
  PRIMARY KEY (`Match_ID`,`Team_ID`),
  CONSTRAINT `MATCH_STATS_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `TEAM` (`Team_ID`),
  CONSTRAINT `MATCH_STATS_ibfk_2` FOREIGN KEY (`Match_ID`) REFERENCES `MATCH` (`Match_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `MATCH_STATS` WRITE;
/*!40000 ALTER TABLE `MATCH_STATS` DISABLE KEYS */;
INSERT INTO MATCH_STATS VALUES
  (1, 1, 180, 120, 5, 10, 120, 174),
  (1, 2, 174, 115, 6, 8, 115, 180),
  (2, 3, 190, 125, 4, 12, 125, 185),
  (2, 4, 185, 120, 6, 10, 120, 190),
  (3, 5, 200, 130, 3, 15, 130, 180),
  (3, 6, 180, 120, 7, 10, 120, 200),
  (4, 7, 175, 115, 5, 12, 115, 160),
  (4, 8, 160, 110, 7, 10, 110, 175),
  (5, 2, 190, 125, 4, 12, 125, 180),
  (5, 1, 185, 120, 6, 10, 120, 190),
  (6, 4, 200, 130, 3, 15, 130, 180),
  (6, 3, 180, 120, 7, 10, 120, 200),
  (7, 8, 175, 115, 5, 12, 115, 160),
  (7, 7, 160, 110, 7, 10, 110, 175),
  (8, 6, 190, 125, 4, 12, 125, 185),
  (8, 5, 185, 120, 6, 10, 120, 190),
  (9, 1, 200, 130, 3, 15, 130, 180),
  (9, 3, 180, 120, 7, 10, 120, 200),
  (10, 2, 190, 125, 4, 12, 125, 185),
  (10, 4, 185, 120, 6, 10, 120, 190),
  (11, 5, 200, 130, 3, 15, 130, 185),
  (11, 7, 185, 120, 6, 10, 120, 200),
  (12, 6, 190, 125, 4, 12, 125, 180),
  (12, 8, 180, 120, 7, 10, 120, 190),
  (13, 1, 200, 130, 3, 15, 130, 185),
  (13, 4, 185, 120, 6, 10, 120, 200),
  (14, 2, 190, 125, 4, 12, 125, 180),
  (14, 3, 180, 120, 7, 10, 120, 190),
  (15, 7, 175, 115, 5, 12, 115, 165),
  (15, 6, 165, 110, 7, 10, 110, 175),
  (16, 8, 180, 120, 6, 10, 120, 177),
  (16, 5, 177, 115, 7, 12, 115, 180),
  (17, 3, 190, 125, 4, 12, 125, 185),
  (17, 1, 185, 120, 6, 10, 120, 190),
  (18, 4, 200, 130, 3, 15, 130, 180),
  (18, 2, 180, 120, 7, 10, 120, 200),
  (19, 5, 200, 130, 3, 15, 130, 185),
  (19, 8, 185, 120, 6, 10, 120, 200),
  (20, 6, 190, 125, 4, 12, 125, 180),
  (20, 7, 180, 120, 7, 10, 120, 190),
  (21, 1, 200, 130, 3, 15, 130, 185),
  (21, 7, 185, 120, 6, 10, 120, 200),
  (22, 2, 190, 125, 4, 12, 125, 180),
  (22, 8, 180, 120, 7, 10, 120, 190),
  (23, 3, 200, 130, 3, 15, 130, 185),
  (23, 5, 185, 120, 6, 10, 120, 200),
  (24, 4, 200, 130, 3, 15, 130, 180),
  (24, 6, 180, 120, 7, 10, 120, 200),
  (25, 7, 175, 115, 5, 12, 115, 170),
  (25, 1, 170, 110, 7, 10, 110, 175),
  (26, 8, 180, 120, 6, 10, 120, 174),
  (26, 2, 174, 115, 7, 12, 115, 180),
  (27, 5, 200, 130, 3, 15, 130, 185),
  (27, 3, 185, 120, 6, 10, 120, 200),
  (28, 6, 190, 125, 4, 12, 125, 180),
  (28, 4, 180, 120, 7, 10, 120, 190),
  (29, 1, 200, 130, 3, 15, 130, 185),
  (29, 8, 185, 120, 6, 10, 120, 200),
  (30, 2, 190, 125, 4, 12, 125, 180),
  (30, 7, 180, 120, 7, 10, 120, 190),
    (31, 5, 200, 130, 3, 15, 130, 185),
    (31, 6, 185, 120, 6, 10, 120, 200),
    (32, 4, 200, 130, 3, 15, 130, 180),
    (32, 8, 180, 120, 7, 10, 120, 200);
/*!40000 ALTER TABLE `MATCH_STATS` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS SUSTAINS;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUSTAINS` (
  `Player_ID` INT NOT NULL,
  `INJURY_ID` INT NOT NULL,
  PRIMARY KEY (`INJURY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SUSTAINS` WRITE;
/*!40000 ALTER TABLE `SUSTAINS` DISABLE KEYS */;
INSERT INTO `SUSTAINS` VALUES 
(01,01),
(02,02),
(03,03),
(04,04),
(05,05),
(06,06),
(07,07),
(08,08),
(09,09),
(10,10);
/*!40000 ALTER TABLE `SUSTAINS` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS WICKET;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WICKET` (
  `Batsman_ID` INT NOT NULL,
  `Bowler_ID` INT NOT NULL,
  `Match_ID` INT NOT NULL,
  `STADIUM_ID` INT NOT NULL,
  PRIMARY KEY (`Batsman_ID`,`Bowler_ID`,`Match_ID`,`STADIUM_ID`),
  CONSTRAINT `WICKET_ibfk_1` FOREIGN KEY (`Batsman_ID`) REFERENCES `PLAYER` (`Player_ID`),
  CONSTRAINT `WICKET_ibfk_2` FOREIGN KEY (`Bowler_ID`) REFERENCES `PLAYER` (`Player_ID`),
  CONSTRAINT `WICKET_ibfk_3` FOREIGN KEY (`Match_ID`) REFERENCES `MATCH` (`Match_ID`),
  CONSTRAINT `WICKET_ibfk_4` FOREIGN KEY (`STADIUM_ID`) REFERENCES `STADIUM` (`Stadium_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `WICKET` WRITE;
/*!40000 ALTER TABLE `WICKET` DISABLE KEYS */;
INSERT INTO `WICKET` VALUES 
(01,02,01,01),
(03,04,02,02),
(05,06,03,03),
(07,08,04,04),
(09,10,05,05),
(11,12,06,06),
(13,14,07,07),
(15,16,08,08),
(17,18,09,09),
(19,20,10,10),
(21,22,11,01),
(23,24,12,02),
(25,26,13,03),
(27,28,14,04),
(29,30,15,05),
(31,32,16,06),
(01,02,17,07),
(03,04,18,08),
(05,06,19,09),
(07,08,20,10),
(09,10,21,01),
(11,12,22,02),
(13,14,23,03),
(15,16,24,04),
(17,18,25,05),
(19,20,26,06),
(21,22,27,07),
(23,24,28,08),
(25,26,29,09),
(27,28,30,10),
(29,30,31,01),
(31,32,32,02);
/*!40000 ALTER TABLE `WICKET` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS TEAM_SocialMediaHandles;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEAM_SocialMediaHandles` (
  `Team_ID` INT NOT NULL,
  `Social media handles` varchar(100) NOT NULL,
  PRIMARY KEY (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `TEAM_SocialMediaHandles` WRITE;
/*!40000 ALTER TABLE `TEAM_SocialMediaHandles` DISABLE KEYS */;
INSERT INTO `TEAM_SocialMediaHandles` VALUES 
(1,'@mumbaiindians'),
(2,'@chennaisuperkings'),
(3,'@kolkataknightriders'),
(4,'@royalchallengersbangalore'),
(5,'@delhicapitals'),
(6,'@sunrisershyderabad'),
(7,'@rajasthanroyals'),
(8,'@punjabkings'),
(9,'@lucknowsupergiants'),
(10,'@mumbaiindians');
/*!40000 ALTER TABLE `TEAM_SocialMediaHandles` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;