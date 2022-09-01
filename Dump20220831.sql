-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id_course` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  `courses_id_professor` int NOT NULL,
  PRIMARY KEY (`id_course`),
  UNIQUE KEY `id_course_UNIQUE` (`id_course`),
  UNIQUE KEY `course_name_UNIQUE` (`course_name`),
  KEY `fk_courses_professors_idx` (`courses_id_professor`),
  CONSTRAINT `fk_courses_professors` FOREIGN KEY (`courses_id_professor`) REFERENCES `professors` (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Marketing',1),(2,'Literature',2),(3,'Technology',3);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `id_grade` int NOT NULL AUTO_INCREMENT,
  `grade` float NOT NULL,
  `grades_id_student` int NOT NULL,
  `grades_id_professor` int NOT NULL,
  `grades_id_course` int NOT NULL,
  PRIMARY KEY (`id_grade`),
  UNIQUE KEY `id_grade_UNIQUE` (`id_grade`),
  KEY `fk_grades_students1_idx` (`grades_id_student`),
  KEY `fk_grades_professors1_idx` (`grades_id_professor`),
  KEY `fk_grades_courses1_idx` (`grades_id_course`),
  CONSTRAINT `fk_grades_courses1` FOREIGN KEY (`grades_id_course`) REFERENCES `courses` (`id_course`),
  CONSTRAINT `fk_grades_professors1` FOREIGN KEY (`grades_id_professor`) REFERENCES `professors` (`id_professor`),
  CONSTRAINT `fk_grades_students1` FOREIGN KEY (`grades_id_student`) REFERENCES `students` (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,8.1,1,1,1),(2,5,1,2,2),(3,7.5,1,3,3),(4,4.5,2,1,1),(5,7.1,2,2,2),(6,6.2,2,3,3),(7,5.1,3,1,1),(8,8.6,3,2,2),(9,5.7,3,3,3),(10,5.9,4,1,1),(11,9.7,4,2,2),(14,6.4,6,1,1),(15,5,6,2,2),(16,6.7,6,3,3),(17,8.4,7,2,2),(18,7.2,5,1,1),(19,7.9,5,2,2);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `id_professor` int NOT NULL AUTO_INCREMENT,
  `professor_name` varchar(60) NOT NULL,
  `professor_email` varchar(60) NOT NULL,
  PRIMARY KEY (`id_professor`),
  UNIQUE KEY `id_professor_UNIQUE` (`id_professor`),
  UNIQUE KEY `professor_email_UNIQUE` (`professor_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES (1,'Kurt Desender','kurt.desender@university.com'),(2,'Silvina Rubio','silv.rubio@university.com'),(3,'Plácido Sierra','placido.sh@university.com');
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id_student` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(60) NOT NULL,
  `student_email` varchar(60) NOT NULL,
  PRIMARY KEY (`id_student`),
  UNIQUE KEY `id_student_UNIQUE` (`id_student`),
  UNIQUE KEY `student_email_UNIQUE` (`student_email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Nerea Corrales','nereacorr@university.com'),(2,'John White','j.white@university.com'),(3,'Margaret Clayton','margaret_clayton@university.com'),(4,'Mary Watson','marywatson@university.com'),(5,'Emma Kerr','emkerr@university.com'),(6,'Marta Martínez','mmartinez@university.com'),(7,'Miriam Hernández','miriam.hdz@university.com');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_has_courses`
--

DROP TABLE IF EXISTS `students_has_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_has_courses` (
  `students_id_student` int NOT NULL,
  `courses_id_course` int NOT NULL,
  PRIMARY KEY (`students_id_student`,`courses_id_course`),
  KEY `fk_students_has_courses_courses1_idx` (`courses_id_course`),
  KEY `fk_students_has_courses_students1_idx` (`students_id_student`),
  CONSTRAINT `fk_students_has_courses_courses1` FOREIGN KEY (`courses_id_course`) REFERENCES `courses` (`id_course`),
  CONSTRAINT `fk_students_has_courses_students1` FOREIGN KEY (`students_id_student`) REFERENCES `students` (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_has_courses`
--

LOCK TABLES `students_has_courses` WRITE;
/*!40000 ALTER TABLE `students_has_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_has_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_has_professors`
--

DROP TABLE IF EXISTS `students_has_professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_has_professors` (
  `students_id_student` int NOT NULL,
  `professors_id_professor` int NOT NULL,
  PRIMARY KEY (`students_id_student`,`professors_id_professor`),
  KEY `fk_students_has_professors_professors1_idx` (`professors_id_professor`),
  KEY `fk_students_has_professors_students1_idx` (`students_id_student`),
  CONSTRAINT `fk_students_has_professors_professors1` FOREIGN KEY (`professors_id_professor`) REFERENCES `professors` (`id_professor`),
  CONSTRAINT `fk_students_has_professors_students1` FOREIGN KEY (`students_id_student`) REFERENCES `students` (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_has_professors`
--

LOCK TABLES `students_has_professors` WRITE;
/*!40000 ALTER TABLE `students_has_professors` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_has_professors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-31 21:05:42
