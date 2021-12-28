-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dt_booking_prices`
--

DROP TABLE IF EXISTS `dt_booking_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_booking_prices` (
  `nb_place` int NOT NULL,
  `total_price` int NOT NULL,
  `id_prices` int NOT NULL,
  `id_booking` char(36) NOT NULL,
  KEY `id_prices` (`id_prices`),
  KEY `id_booking` (`id_booking`),
  CONSTRAINT `dt_booking_prices_ibfk_1` FOREIGN KEY (`id_prices`) REFERENCES `dt_prices` (`id`),
  CONSTRAINT `dt_booking_prices_ibfk_2` FOREIGN KEY (`id_booking`) REFERENCES `dt_bookings` (`booking_id_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_booking_prices`
--

LOCK TABLES `dt_booking_prices` WRITE;
/*!40000 ALTER TABLE `dt_booking_prices` DISABLE KEYS */;
INSERT INTO `dt_booking_prices` VALUES (1,6,1,'6bd24c99-669f-11ec-a1fc-708bcd8a895a'),(2,13,4,'6bd24c99-669f-11ec-a1fc-708bcd8a895a'),(2,14,3,'6bd25156-669f-11ec-a1fc-708bcd8a895a'),(2,11,1,'6bd24765-669f-11ec-a1fc-708bcd8a895a'),(1,7,3,'6bd24765-669f-11ec-a1fc-708bcd8a895a');
/*!40000 ALTER TABLE `dt_booking_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_bookings`
--

DROP TABLE IF EXISTS `dt_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_bookings` (
  `booking_id_uuid` varchar(36) NOT NULL,
  `id_session` int NOT NULL,
  `id_users` char(36) DEFAULT NULL,
  `id_staff` char(36) DEFAULT NULL,
  PRIMARY KEY (`booking_id_uuid`),
  UNIQUE KEY `booking_id_uuid` (`booking_id_uuid`),
  KEY `id_session` (`id_session`),
  KEY `id_users` (`id_users`),
  KEY `id_staff` (`id_staff`),
  CONSTRAINT `dt_bookings_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `dt_session` (`id`),
  CONSTRAINT `dt_bookings_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `dt_users` (`user_id_uuid`),
  CONSTRAINT `dt_bookings_ibfk_3` FOREIGN KEY (`id_staff`) REFERENCES `dt_staff` (`staff_id_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_bookings`
--

LOCK TABLES `dt_bookings` WRITE;
/*!40000 ALTER TABLE `dt_bookings` DISABLE KEYS */;
INSERT INTO `dt_bookings` VALUES ('6bd24765-669f-11ec-a1fc-708bcd8a895a',1,NULL,'71101f90-669d-11ec-a1fc-708bcd8a895a'),('6bd24c99-669f-11ec-a1fc-708bcd8a895a',1,'67a25da7-669d-11ec-a1fc-708bcd8a895a',NULL),('6bd24ea8-669f-11ec-a1fc-708bcd8a895a',5,NULL,'71102111-669d-11ec-a1fc-708bcd8a895a'),('6bd25008-669f-11ec-a1fc-708bcd8a895a',4,'67a2675d-669d-11ec-a1fc-708bcd8a895a',NULL),('6bd25156-669f-11ec-a1fc-708bcd8a895a',3,NULL,'71102111-669d-11ec-a1fc-708bcd8a895a');
/*!40000 ALTER TABLE `dt_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_cinemalist`
--

DROP TABLE IF EXISTS `dt_cinemalist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_cinemalist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_cinemalist`
--

LOCK TABLES `dt_cinemalist` WRITE;
/*!40000 ALTER TABLE `dt_cinemalist` DISABLE KEYS */;
INSERT INTO `dt_cinemalist` VALUES (1,'Pathe Plan','Plan de Campagne 13600 CABRIES'),(2,'Pathe Gardanne','6 route de l\'olivier 13600 GARDANNE'),(3,'Pathe Salon de Provence','8 avenue des pietons 13600 SALON DE PROVENCE'),(4,'Pathe Aix','3 rue de la fontaine 13600 AIX EN PROVENCE');
/*!40000 ALTER TABLE `dt_cinemalist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_movies`
--

DROP TABLE IF EXISTS `dt_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `type1` varchar(20) NOT NULL,
  `type2` varchar(20) DEFAULT NULL,
  `type3` varchar(20) DEFAULT NULL,
  `length` time NOT NULL,
  `infos` text,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_movies`
--

LOCK TABLES `dt_movies` WRITE;
/*!40000 ALTER TABLE `dt_movies` DISABLE KEYS */;
INSERT INTO `dt_movies` VALUES (1,'Fight Club','Drame','','','02:19:00','Insomniaque, désillusionné par sa vie personnelle et professionnelle, un jeune cadre expert en assurances, mène une vie monotone et sans saveur. Face à la vacuité de son existence, son médecin lui conseille de suivre une thérapie afin de relativiser son mal-être. Lors d\'un voyage d\'affaires, il fait la connaissance de Tyler Durden, une sorte de gourou anarchiste et philosophe. Ensemble, ils fondent le Fight Club. Cercle très fermé, où ils organisent des combats clandestins et violents, destinés à évacuer l\'ordre établi.','1999-11-10'),(2,'Pulp Fiction','Gangster','Comédie','','02:34:00','L\'odyssée sanglante, burlesque et cocasse de petits malfrats dans la jungle de Hollywood à travers trois histoires qui s\'entremêlent.','1994-10-26'),(3,'Interstellar','Science-fiction','Drame','Aventure','02:49:00','Alors que la vie sur Terre touche à sa fin, un groupe d?explorateurs s?attelle à la mission la plus importante de l?histoire de l?humanité : franchir les limites de notre galaxie pour savoir si l?homme peut vivre sur une autre planète?','2014-11-05'),(4,'2001 : L\'Odyssée de l\'espace','Science-fiction','Aventure','','02:40:00','A l\'aube de l\'Humanité, dans le désert africain, une tribu de primates subit les assauts répétés d\'une bande rivale, qui lui dispute un point d\'eau.','1968-09-27'),(5,'Blade Runner','Science-fiction','Film Noir','Thriller','01:57:00','2019, Los Angeles. La Terre est surpeuplée et l?humanité est partie coloniser l?espace. Les nouveaux colons sont assistés de Replicants, androïdes que rien ne peut distinguer de l\'être humain. Conçus comme de nouveaux esclaves, certains parmi les plus évolués s?affranchissent de leurs chaînes et s?enfuient. Rick Deckard, un ancien Blade Runner, catégorie spéciale de policiers chargés de \"retirer\" ces replicants, accepte une nouvelle mission consistant à retrouver quatre de ces individus qui viennent de regagner la Terre après avoir volé une navette spatiale. Ces replicants sont des Nexus 6, derniers nés de la technologie développée par la Tyrell Corporation.','1982-09-15');
/*!40000 ALTER TABLE `dt_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_payment`
--

DROP TABLE IF EXISTS `dt_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_payment` (
  `payment_id_uuid` varchar(36) NOT NULL,
  `id_booking` varchar(36) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_id_uuid`),
  UNIQUE KEY `payment_id_uuid` (`payment_id_uuid`),
  KEY `id_booking` (`id_booking`),
  CONSTRAINT `dt_payment_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `dt_booking_prices` (`id_booking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_payment`
--

LOCK TABLES `dt_payment` WRITE;
/*!40000 ALTER TABLE `dt_payment` DISABLE KEYS */;
INSERT INTO `dt_payment` VALUES ('0721a902-66a5-11ec-a1fc-708bcd8a895a','6bd24c99-669f-11ec-a1fc-708bcd8a895a','Carte Bancaire','2021-12-27 00:39:11');
/*!40000 ALTER TABLE `dt_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_prices`
--

DROP TABLE IF EXISTS `dt_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `id_cinema` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cinema` (`id_cinema`),
  CONSTRAINT `dt_prices_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `dt_cinemalist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_prices`
--

LOCK TABLES `dt_prices` WRITE;
/*!40000 ALTER TABLE `dt_prices` DISABLE KEYS */;
INSERT INTO `dt_prices` VALUES (1,'enfant',5.50,1),(2,'adulte',12.60,1),(3,'etudiant',7.20,1),(4,'senior',6.40,1),(5,'enfant',4.50,2),(6,'adulte',12.20,2),(7,'etudiant',6.90,2),(8,'senior',7.40,2),(9,'enfant',5.60,3),(10,'adulte',11.10,3),(11,'enfant',5.00,4),(12,'adulte',11.20,4),(13,'senior',6.15,4);
/*!40000 ALTER TABLE `dt_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_salles`
--

DROP TABLE IF EXISTS `dt_salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_salles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `nb_seats` int NOT NULL,
  `id_cinema` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cinema` (`id_cinema`),
  CONSTRAINT `dt_salles_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `dt_cinemalist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_salles`
--

LOCK TABLES `dt_salles` WRITE;
/*!40000 ALTER TABLE `dt_salles` DISABLE KEYS */;
INSERT INTO `dt_salles` VALUES (1,'Salle 1',80,1),(2,'Salle 2',120,1),(3,'Pathe +',200,1),(4,'Imax',254,1),(5,'Salle 1',85,2),(6,'Salle 2',140,2),(7,'Pathé +',198,2),(8,'4DX',350,2),(9,'Salle 1',95,3),(10,'Salle 2',245,3),(11,'Salle 3',168,3),(12,'Salle 1',187,4),(13,'Imax',354,4),(14,'Pathé +',254,4);
/*!40000 ALTER TABLE `dt_salles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_session`
--

DROP TABLE IF EXISTS `dt_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_salles` int NOT NULL,
  `id_movies` int NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_salles` (`id_salles`),
  KEY `id_movies` (`id_movies`),
  CONSTRAINT `dt_session_ibfk_1` FOREIGN KEY (`id_salles`) REFERENCES `dt_salles` (`id`),
  CONSTRAINT `dt_session_ibfk_2` FOREIGN KEY (`id_movies`) REFERENCES `dt_movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_session`
--

LOCK TABLES `dt_session` WRITE;
/*!40000 ALTER TABLE `dt_session` DISABLE KEYS */;
INSERT INTO `dt_session` VALUES (1,1,2,'2021-12-25 14:30:00'),(2,1,2,'2021-12-25 14:30:00'),(3,3,2,'2021-12-25 17:30:00'),(4,4,1,'2021-12-25 14:30:00'),(5,1,2,'2021-12-26 10:30:00'),(6,3,4,'2021-12-27 14:30:00'),(7,2,2,'2021-12-27 09:45:00');
/*!40000 ALTER TABLE `dt_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_staff`
--

DROP TABLE IF EXISTS `dt_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_staff` (
  `staff_id_uuid` varchar(36) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` varchar(5) NOT NULL DEFAULT 'staff',
  `id_cinema` int NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`staff_id_uuid`),
  UNIQUE KEY `staff_id_uuid` (`staff_id_uuid`),
  UNIQUE KEY `login` (`login`),
  KEY `id_cinema` (`id_cinema`),
  CONSTRAINT `dt_staff_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `dt_cinemalist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_staff`
--

LOCK TABLES `dt_staff` WRITE;
/*!40000 ALTER TABLE `dt_staff` DISABLE KEYS */;
INSERT INTO `dt_staff` VALUES ('71101b5b-669d-11ec-a1fc-708bcd8a895a','Paul','Lewis','PaulLewis','$2a$12$6H6g2WmTqwqOFAdPw/XGBeaxj3XJyR.yi2eZlgkRDIewJA0bPzoR2','staff',2,'2021-12-26 23:44:53'),('71101f90-669d-11ec-a1fc-708bcd8a895a','Jack','Gutierrez','JackJJ','$2a$12$tZQCvKVobYLKedrB6rhI2OtcGToIPh0lOglfbpf9SVD2UEclOBGya','staff',1,'2021-12-26 23:44:53'),('71102111-669d-11ec-a1fc-708bcd8a895a','Sharon','Richmond','RichSha','$2a$12$yKuQUm584UgqrrlWO0yF4ujSlIeyGGtMXvD4X0SlqI3MODxJS4Ku.','staff',4,'2021-12-26 23:44:53'),('711022a0-669d-11ec-a1fc-708bcd8a895a','Judy','McCary','JudyMc','$2a$12$sUPqf3HSlVT97OtvRRN0m.hhS1jSeb3Zp09422hZ0CJM63QS/mzES','staff',1,'2021-12-26 23:44:53'),('71102576-669d-11ec-a1fc-708bcd8a895a','Julie','Nash','JNash','$2a$12$2ZELOGla4UaS.IiDHFUf5.rCHQfR9ALZkw7FBeyEoFd/x4DRhz3TK','staff',3,'2021-12-26 23:44:53');
/*!40000 ALTER TABLE `dt_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_users`
--

DROP TABLE IF EXISTS `dt_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_users` (
  `user_id_uuid` varchar(36) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(150) NOT NULL,
  `birthday` date DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id_uuid`),
  UNIQUE KEY `user_id_uuid` (`user_id_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_users`
--

LOCK TABLES `dt_users` WRITE;
/*!40000 ALTER TABLE `dt_users` DISABLE KEYS */;
INSERT INTO `dt_users` VALUES ('67a25da7-669d-11ec-a1fc-708bcd8a895a','Jérémy','Grestom','j.grestom@gmail.com','1990-06-02','$2a$04$ZyUAvnGZvuSn3epYPoAAHuRGoR1G7ovuce1dacB1MWPD7Jq9Ho83q','2021-12-26 23:44:37'),('67a265a4-669d-11ec-a1fc-708bcd8a895a','Florian','Moni','flo.moni@gmail.com','1995-11-18','$2a$12$7NnJUmJ.6AXbUnYvOBx29.9iaI6bXUUYZvl.pcfK4EokJM8w6wi9.','2021-12-26 23:44:37'),('67a266c2-669d-11ec-a1fc-708bcd8a895a','Nathalie','Provin','nathalie.provin@yahoo.com','1974-04-14','$2a$12$0qultHdZzSLVGSTt3LqPWup9z3PhFiX/11claR5b1QF6fUX6YGwZK','2021-12-26 23:44:37'),('67a2675d-669d-11ec-a1fc-708bcd8a895a','Pierrine','Onila','p.onila@hotmail.fr','1990-06-02','$2a$12$Nx2DH2lMTqQ6JpTFkzFHxeueQeDAPQXhDFzViSeAAn4vBfayma5Yq','2021-12-26 23:44:37'),('67a267e9-669d-11ec-a1fc-708bcd8a895a','Karine','Nivel','karine.nivel@outlook.com','1985-03-25','$2a$12$ZSrRRmJO03XsrjMK6X7hzew0eZw3SDeAxFZOOix.qMQa4Iv3Kh202','2021-12-26 23:44:37');
/*!40000 ALTER TABLE `dt_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-27  0:46:31
