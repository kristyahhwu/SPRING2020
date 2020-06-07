-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `photopath` varchar(4096) NOT NULL,
  `thumbnail` varchar(4096) NOT NULL,
  `active` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `fk_userid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `posts to users_idx` (`fk_userid`),
  CONSTRAINT `posts to users` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'test tile1','test test tiletile123123','images/test.png','images/thumbnails/test.png',0,'2020-05-19 22:21:54',6),(2,'test tile11','test test tiletsfile123123','images/test1.png','images/thumbnails/test1.png',0,'2020-05-19 22:24:32',1),(3,'test tile51','test test tiletsfi123le123123','images/test5.png','images/thumbnails/test5.png',0,'2020-05-19 22:24:46',6),(5,'test tile7','test test ti227723123','images/test7.png','images/thumbnails/test7.png',0,'2020-05-19 22:25:16',7);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `usertype` int NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'testuser1','fake1@mail.com','sdjofajd',0,0,'2020-05-19 22:07:19'),(3,'testuser11','fake11@mail.com','sdjof123ajd',0,0,'2020-05-19 22:09:05'),(4,'testuser111','fake111@mail.com','sdjof12133ajd',0,0,'2020-05-19 22:09:12'),(5,'testuser1111','fake1111@mail.com','sdjof12312133ajd',0,0,'2020-05-19 22:10:03'),(6,'testuser2','fake2@mail.com','sdjof1231212312133ajd',0,0,'2020-05-19 22:10:16'),(7,'testuser22','fake22@mail.com','sdjof112231212312133ajd',0,0,'2020-05-19 22:12:08'),(8,'testuser222','fake222@mail.com','sdjof133ajd',0,0,'2020-05-19 22:12:15'),(9,'testuser2222','fake2222@mail.com','sdjof123133ajd',0,0,'2020-05-19 22:12:19'),(10,'testuser22222','fake22222@mail.com','sdjof123123133ajd',0,0,'2020-05-19 22:12:23'),(12,'testuser3333','fake3333@mail.com','sdjof1231232133ajd',0,0,'2020-05-19 22:55:33'),(13,'testuser3','fake3@mail.com','sdjof12ajd',0,0,'2020-05-19 22:55:40'),(14,'testuser33','fake33@mail.com','sdj33of12ajd',0,0,'2020-05-19 22:55:44'),(15,'testuser44','fake44@mail.com','sdj44of12ajd',0,0,'2020-05-19 22:55:52'),(16,'testuser4','fake4@mail.com','sdj4of12ajd',0,0,'2020-05-19 22:55:56'),(17,'testuser14','fake14@mail.com','sdj41of12ajd',0,0,'2020-05-19 22:56:03'),(18,'testuser114','fake114@mail.com','sdj141of12ajd',0,0,'2020-05-19 22:56:06'),(19,'testuser1114','fake1114@mail.com','sdj1141of12ajd',0,0,'2020-05-19 22:56:13'),(20,'testuser111114','fake111114@mail.com','sdj111141of12ajd',0,0,'2020-05-19 22:56:19'),(23,'testuser24','fake24@mail.com','sdj241of12ajd',0,0,'2020-05-19 23:15:25'),(24,'testuser34','fake34@mail.com','sdj341of12ajd',0,0,'2020-05-19 23:15:32'),(25,'testuser1314','fake1314@mail.com','sdj13141of12ajd',0,0,'2020-05-19 23:15:40'),(26,'testuser11314','fake11314@mail.com','sdj131141of12ajd',0,0,'2020-05-19 23:15:43'),(27,'testuser111314','fake111314@mail.com','sdj1311141of12ajd',0,0,'2020-05-19 23:15:48');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-20 16:43:17
