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