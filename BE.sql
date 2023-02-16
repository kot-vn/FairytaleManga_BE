-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: BE_development
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.22.04.1

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
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint NOT NULL,
  `blob_id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `service_name` varchar(255) NOT NULL,
  `byte_size` bigint NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_variant_records`
--

DROP TABLE IF EXISTS `active_storage_variant_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_variant_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blob_id` bigint NOT NULL,
  `variation_digest` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_variant_records_uniqueness` (`blob_id`,`variation_digest`),
  CONSTRAINT `fk_rails_993965df05` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_variant_records`
--

LOCK TABLES `active_storage_variant_records` WRITE;
/*!40000 ALTER TABLE `active_storage_variant_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_variant_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (3,'admin03@gmail.com','$2a$12$TRMmxFFcABxystjqOlKFkOTSrbgmirHNaxVZwsznx6vXfX5xVwFGu',NULL,'2022-09-26 04:05:40.379111','2022-09-29 09:07:17.298856','hashd'),(6,'admin02@gmail.com','$2a$12$4v0te7fwpEfSjiISjwtyT.NeJP9TQ6zH2i8dzg0aiyVGLF37Lpi3a',NULL,'2022-09-29 08:23:32.255653','2022-09-29 08:23:32.255653',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2022-09-26 02:33:53.263524','2022-09-26 02:33:53.263524');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'John Dole','he is talented author','2022-09-16 03:12:12.994047','2022-09-16 03:12:12.994047'),(2,'Lannie Price','Lannie Price là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.639621','2022-09-20 04:27:18.639621'),(3,'Mrs. Antoine Huel','Mrs. Antoine Huel là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.618156','2022-09-20 04:27:18.618156'),(4,'Mrs. Ryan Monahan','Mrs. Ryan Monahan là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.363703','2022-09-20 04:27:18.363703'),(5,'Loren Bogisich III','Loren Bogisich III là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.394075','2022-09-20 04:27:18.394075'),(6,'Deandra Sawayn','Deandra Sawayn là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.415008','2022-09-20 04:27:18.415008'),(7,'Junior Rempel','Junior Rempel là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.435111','2022-09-20 04:27:18.435111'),(8,'Loria Daugherty PhD','Loria Daugherty PhD là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.455490','2022-09-20 04:27:18.455490'),(9,'Miss Merlin Lindgren','Miss Merlin Lindgren là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.474545','2022-09-20 04:27:18.474545'),(10,'Dr. Kelsi Mohr','Dr. Kelsi Mohr là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.494905','2022-09-20 04:27:18.494905'),(11,'Kurt Breitenberg','Kurt Breitenberg là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.514226','2022-09-20 04:27:18.514226'),(12,'Penelope Wisoky','Penelope Wisoky là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.535802','2022-09-20 04:27:18.535802'),(13,'Thelma Ward DDS','Thelma Ward DDS là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.556250','2022-09-20 04:27:18.556250'),(14,'Amie Pouros V','Amie Pouros V là 1 tác giả đầy tài năng và tâm huyết','2022-09-20 04:27:18.575947','2022-09-20 04:27:18.575947');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Adventure','Truyện tranh phiêu lưu, kể về hành trình của main chính','2022-09-16 03:19:24.310419','2022-09-16 03:19:24.310419'),(2,'Sports','Truyện tranh thể thao .','2022-09-16 03:25:04.722601','2022-09-16 03:25:04.722601'),(3,'Doujinshi','Ngoại truyện do fan hoặc tác giả khác với truyện gốc viết lại câu chuyện theo sở thích của bản thân','2022-09-16 03:21:37.980599','2022-09-16 03:21:37.980599'),(4,'Drama','Thể loại mang đến cho người xem những cảm xúc khác nhau: buồn bã, căng thẳng thậm chí là bi phẫn.','2022-09-16 03:22:08.658790','2022-09-16 03:22:08.658790'),(5,'One shot','Thể loại truyện ngắn 1 chapter.','2022-09-16 03:25:04.722601','2022-09-16 03:25:04.722601'),(6,'Romance','Thể loại lãng mạn.','2022-09-16 03:25:04.722601','2022-09-16 03:25:04.722601'),(7,'Shounen','Nội dung của những bộ này thường liên quan đến đánh nhau và/hoặc bạo lực ','2022-09-16 03:25:04.722601','2022-09-16 03:25:04.722601'),(8,'Harem','Truyện nhiều nhân vật nữ thích main chính','2022-09-16 03:25:50.546882','2022-09-16 03:25:50.546882'),(9,'School Life','Thể loại mà ngữ cảnh diễn biến câu chuyện chủ yếu ở trường học.','2022-09-16 03:25:04.722601','2022-09-16 03:25:04.722601'),(10,'Sci-fi','Chủ đề khoa học viễn tưởng.','2022-09-16 03:25:04.722601','2022-09-16 03:25:04.722601'),(11,'Slice of Life','Nói về cuộc sống đời thường của mọi người','2022-09-16 03:25:04.722601','2022-09-16 03:25:04.722601'),(12,'Manhua','Truyện có nguồn gốc từ Trung Quốc.','2022-09-16 03:25:04.722601','2022-09-16 03:25:04.722601'),(13,'Manhwa','Truyện tranh xuất phát Hàn quốc .','2022-09-16 03:25:04.722601','2022-09-16 03:25:04.722601'),(14,'Truyện kinh dị','Truyện có nội dung chết chóc, kinh dị gây ám ảnh cho người xem','2022-09-16 03:25:04.722601','2022-09-16 03:25:04.722601');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_story`
--

DROP TABLE IF EXISTS `category_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_story` (
  `category_id` bigint NOT NULL,
  `story_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  KEY `index_category_story_on_category_id` (`category_id`),
  KEY `index_category_story_on_story_id` (`story_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_story`
--

LOCK TABLES `category_story` WRITE;
/*!40000 ALTER TABLE `category_story` DISABLE KEYS */;
INSERT INTO `category_story` VALUES (1,1,'2022-09-29 03:56:16.572457','2022-09-29 03:56:16.572457'),(4,20,'2022-09-29 04:07:30.079090','2022-09-29 04:07:30.079090'),(14,1,'2022-09-29 07:30:39.251748','2022-09-29 07:30:39.251748'),(1,52,'2022-09-29 07:30:53.509010','2022-09-29 07:30:53.509010'),(1,71,'2022-09-29 07:50:20.261436','2022-09-29 07:50:20.261436'),(2,71,'2022-09-29 07:50:20.292596','2022-09-29 07:50:20.292596'),(6,71,'2022-09-29 07:50:20.328663','2022-09-29 07:50:20.328663'),(1,72,'2022-09-29 07:50:43.728091','2022-09-29 07:50:43.728091'),(2,72,'2022-09-29 07:50:43.767199','2022-09-29 07:50:43.767199'),(6,72,'2022-09-29 07:50:43.803697','2022-09-29 07:50:43.803697');
/*!40000 ALTER TABLE `category_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `story_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_chapters_on_story_id` (`story_id`),
  CONSTRAINT `fk_rails_b9159ed6aa` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `reader_id` bigint NOT NULL,
  `cmt_in` varchar(255) NOT NULL,
  `id_where_cmt` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_reader_id` (`reader_id`),
  CONSTRAINT `fk_rails_715847c280` FOREIGN KEY (`reader_id`) REFERENCES `readers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_reader`
--

DROP TABLE IF EXISTS `gift_reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift_reader` (
  `reader_id` bigint NOT NULL,
  `gift_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  KEY `index_gift_reader_on_reader_id` (`reader_id`),
  KEY `index_gift_reader_on_gift_id` (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_reader`
--

LOCK TABLES `gift_reader` WRITE;
/*!40000 ALTER TABLE `gift_reader` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gifts`
--

DROP TABLE IF EXISTS `gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gifts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `score` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gifts`
--

LOCK TABLES `gifts` WRITE;
/*!40000 ALTER TABLE `gifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader_story`
--

DROP TABLE IF EXISTS `reader_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reader_story` (
  `reader_id` bigint NOT NULL,
  `story_id` bigint NOT NULL,
  `chap` int DEFAULT NULL,
  `reader_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  KEY `index_reader_story_on_reader_id` (`reader_id`),
  KEY `index_reader_story_on_story_id` (`story_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader_story`
--

LOCK TABLES `reader_story` WRITE;
/*!40000 ALTER TABLE `reader_story` DISABLE KEYS */;
/*!40000 ALTER TABLE `reader_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `age` int NOT NULL DEFAULT '0',
  `gender` tinyint(1) DEFAULT NULL,
  `phonenumber` varchar(255) NOT NULL DEFAULT '',
  `ban` tinyint(1) DEFAULT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `score` int DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `activation_digest` varchar(255) DEFAULT NULL,
  `activated` tinyint(1) DEFAULT '0',
  `activated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_readers_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES (1,'hoang@gmail.com','$2a$12$cyY/geQAzSHRBMew37pWJeZDlnc8fUttBYEFH7yUxUYDQ3Oz/EdNq','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:35:45.518780','2022-09-28 02:35:45.518780','$2a$12$GzZJ52u0Ha1S31FJnoKfYe5h.5fAsuWR.9vR3p5uAmzg1MLr3BsSu',0,NULL),(3,'hoanag@gmail.com','$2a$12$eLxB0fRg4SwPxxP1UnXyz.ynOx7fcqab4.S/iAOoTpVxSDONRJucy','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:37:18.725936','2022-09-28 02:37:18.725936','$2a$12$1zi83VZZ9jJu6K78Lb.aOu7SGRNMZXhi4.Yr5387FUl9ykd6DvNce',0,NULL),(4,'hoaag@gmail.com','$2a$12$CT8sdY0OCBneIx8IbWlF0ORDDsQzmKwgAjsfe.GkTjWpf.1Js5j32','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:37:53.555848','2022-09-28 02:37:53.555848','$2a$12$zdAZ5eBbn2Dc4iolNxTfju1bdKKgBt9fGoaurRsP/09laU0x2fJo2',0,NULL),(5,'hoaag@sgmail.com','$2a$12$NHWxjqHyM5TQpsbuKTdE..FaKLbZczn7RQSvls2f20s0g5BmxWzZS','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:38:30.305157','2022-09-28 02:38:30.305157','$2a$12$D5CwmtaRWlxj7wfHzcJaK.ziENHGMx/cEf1JBX5yVVbMXOnlJBep6',0,NULL),(7,'hoaagasd@sgmail.com','$2a$12$GtrYMNNA2jgxK7rAmhtGLeLhvlpnbl7alWkxYB6s9N4px6xRuyvbK','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:39:57.004117','2022-09-28 02:39:57.004117','$2a$12$Vr0p0nFSNGNApqSsbmkEJOFl3qjAJJxRbp0I9dZTUx8yhT8U6JL6y',0,NULL),(8,'hoaagasd@sgmadil.com','$2a$12$6ZMMtnpJz//pwGjjEaWFXOblzpFnTBOHByTN.YIA2FoOmGd.UfjCC','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:45:14.203080','2022-09-28 02:45:14.203080','$2a$12$dD42Pa5zwV8dD4Mo5cMeBOf0dOmjmJhLxhUJi8y7G1Yh/mTb3Y5Qu',0,NULL),(9,'hoaagassd@sgmadil.com','$2a$12$Itm8dNS6qEZAFxuB8S7XzOWqgcfgtVoKGOLgRJ/qP.IK/zEsYS3qm','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:45:39.137830','2022-09-28 02:45:39.137830','$2a$12$Q7VhzEfbLGWEGzoq8aBS/.ZE4yX6PLPKMCua4WwCldrVUJWa3o5kS',0,NULL),(10,'hoaagassds@sgmadil.com','$2a$12$2OpDokOo7UAPi97wsAsfPeG.ZD5qD2KyOYLdYp51bsj7dT0V4Kzbu','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:48:44.935672','2022-09-28 02:48:44.935672','$2a$12$D6wQdAMw4Sy/dcInM7LyaO49h7aY5rlnGg6db.VgccREWS4mXuwqe',0,NULL),(11,'hoaagassds@sgmadisl.com','$2a$12$kBiBnU/eb12M4wgXC.pRv.6ckKdiNdxGV4lOOnPC5Q8koIJSbb70O','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:51:08.051032','2022-09-28 02:51:08.051032','$2a$12$5Mqpb0mKc4ovSRL0HCTUTefbGwjD7J9n3XsA4wowt1xwxksBaFEXm',0,NULL),(12,'hoaagassdsds@sgmadisl.com','$2a$12$4SCb6F5xdqm/PNDdrHaJ1O4r6z/9.P/RzPdACWFxSvfZNvO/XjwCS','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:52:32.958501','2022-09-28 02:52:32.958501','$2a$12$QXkcya6j0RFKDszbtqRmqeWsTqah8vZakFHQ92y073QZvj29BDF5m',0,NULL),(13,'hoaaagassdsds@sgmadisl.com','$2a$12$fjIuyrneQ3XixTO1gjE4NO37hGH7gRcipEmKcvzlUajxGIFXchZVW','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 02:52:56.112098','2022-09-28 02:52:56.112098','$2a$12$zy2z2qD0iGKaJNIKa9vnZeBOpRQ3Ad.P0YS.hEbfGLynz5gGDqBhm',0,NULL),(14,'hoaaagassdsds@sgmadsisl.com','$2a$12$m0twncCZC6stzFTsUQNWQ.VzHnkNzQku5yjb8Cz3wLrMdI5g0NhAu','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 03:01:23.088040','2022-09-28 03:01:29.255972','$2a$12$t1xGxaPXfSeEGM/fUO7e2OLsZpvn0m9p1k3LM2csLPGdjyvf7iwue',1,'2022-09-28 03:01:29'),(15,'hoaaagassdsds@sgmadsisl.cosm','$2a$12$iokIZoHUsDF/RimONOeRf.tTqyFGEmVRYiEIN2nPSYbP4D1reQN26','hoang',19,0,'0867558467',NULL,'sajkdasdhwiur',0,'2022-09-28 03:02:48.880920','2022-09-28 03:02:53.654647','$2a$12$vqTT8O.RvHJQEb9h4PSm2OSE8oq7PSk.8cu94nE99Vo0TdunYNj8S',1,'2022-09-28 03:02:53'),(16,'sknd@gmail.com','$2a$12$OF0XTWRc8LEgZEuEK4fxUODmAYcdyZF.ZFYss6hlZmxaLn9tJwEy2','hoangvietng',13,0,'0865412397',NULL,'dong anh ha noi',0,'2022-09-30 02:11:48.562193','2022-09-30 02:11:48.562193','$2a$12$mJP3o1qnuxhfbWwhNdgipefgUz9jofjOaaZpi.nvhfeZTaaHcocMm',0,NULL),(18,'sknud@gmail.com','$2a$12$W0aZmAal2NmNZ5TcGKzdouSy4SSA9931ZCe2ZaN5IXbo65wq2vZOW','hoangvietng',13,0,'0865412397',NULL,'dong anh ha noi',0,'2022-09-30 02:12:38.479981','2022-09-30 02:12:46.415185','$2a$12$4eqjGMZhUFlTCCTBKTK4u.sg8/gWayAiody.y4VWc39.VRVMWqkNW',1,'2022-09-30 02:12:46'),(19,'sknudun@gmail.com','$2a$12$gyX16EpaHKhKO46b23ZUEukQsVsf8JEjFUolsM59Xm4cmFwyPTWf2','hoangvietnguyen',13,0,'0865412397',NULL,'dong anh ha noi',0,'2022-09-30 09:22:24.034776','2022-09-30 09:22:24.034776','$2a$12$1NfPisgv1.wwdG1xOmgFXunixKZy.hYq4kktf/BRPQoE7YqoSx2iq',0,NULL);
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20220926022842'),('20220926092107'),('20220926143714'),('20220926145407'),('20220927015210'),('20220927021214'),('20220927021935'),('20220927022808'),('20220927023752'),('20220927032116'),('20220927033049'),('20220927091119'),('20220928020455'),('20220928082547'),('20220928103157');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `author_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `end` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stories_on_author_id` (`author_id`),
  CONSTRAINT `fk_rails_4883088c94` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stories`
--

LOCK TABLES `stories` WRITE;
/*!40000 ALTER TABLE `stories` DISABLE KEYS */;
INSERT INTO `stories` VALUES (1,'jksad',12,'2022-09-29 02:30:15.791807','2022-09-29 02:30:15.791807',NULL),(2,'jksad',12,'2022-09-29 02:30:51.405070','2022-09-29 02:30:51.405070',NULL),(3,'hoangvietng',12,'2022-09-29 02:31:31.305472','2022-10-03 03:16:27.467748',NULL),(4,'jksad',12,'2022-09-29 02:41:31.757326','2022-09-29 02:41:31.757326',NULL),(5,'jksad',12,'2022-09-29 02:43:40.079400','2022-09-29 02:43:40.079400',NULL),(6,'jksad',12,'2022-09-29 02:46:57.993102','2022-09-29 02:46:57.993102',NULL),(7,'jksad',12,'2022-09-29 02:47:26.612638','2022-09-29 02:47:26.612638',NULL),(8,'jksad',12,'2022-09-29 02:47:36.529367','2022-09-29 02:47:36.529367',NULL),(9,'jksad',12,'2022-09-29 02:47:49.006554','2022-09-29 02:47:49.006554',NULL),(10,'jksad',12,'2022-09-29 02:49:12.486076','2022-09-29 02:49:12.486076',NULL),(11,'jksad',12,'2022-09-29 04:01:34.917056','2022-09-29 04:01:34.917056',NULL),(12,'jksad',12,'2022-09-29 04:02:56.378667','2022-09-29 04:02:56.378667',NULL),(13,'jksad',12,'2022-09-29 04:03:44.208549','2022-09-29 04:03:44.208549',NULL),(14,'jksad',12,'2022-09-29 04:04:46.817093','2022-09-29 04:04:46.817093',NULL),(15,'jksad',12,'2022-09-29 04:05:05.896900','2022-09-29 04:05:05.896900',NULL),(16,'jksad',12,'2022-09-29 04:05:21.148010','2022-09-29 04:05:21.148010',NULL),(17,'jksad',12,'2022-09-29 04:05:34.066095','2022-09-29 04:05:34.066095',NULL),(18,'jksad',12,'2022-09-29 04:06:02.085689','2022-09-29 04:06:02.085689',NULL),(19,'jksad',12,'2022-09-29 04:06:28.618181','2022-09-29 04:06:28.618181',NULL),(20,'jksad',12,'2022-09-29 04:07:29.941187','2022-09-29 04:07:29.941187',NULL),(21,'jksad',12,'2022-09-29 04:08:19.711782','2022-09-29 04:08:19.711782',NULL),(22,'jksad',12,'2022-09-29 04:08:48.077164','2022-09-29 04:08:48.077164',NULL),(23,'jksad',12,'2022-09-29 04:10:45.115945','2022-09-29 04:10:45.115945',NULL),(24,'jksad',12,'2022-09-29 04:11:34.509579','2022-09-29 04:11:34.509579',NULL),(25,'jksad',12,'2022-09-29 04:12:02.606873','2022-09-29 04:12:02.606873',NULL),(26,'jksad',12,'2022-09-29 04:12:23.099030','2022-09-29 04:12:23.099030',NULL),(27,'jksad',12,'2022-09-29 04:13:11.613256','2022-09-29 04:13:11.613256',NULL),(28,'jksad',12,'2022-09-29 04:14:32.960882','2022-09-29 04:14:32.960882',NULL),(29,'jksad',12,'2022-09-29 04:14:45.956417','2022-09-29 04:14:45.956417',NULL),(30,'jksad',12,'2022-09-29 04:15:02.138495','2022-09-29 04:15:02.138495',NULL),(31,'jksad',12,'2022-09-29 04:15:31.028169','2022-09-29 04:15:31.028169',NULL),(32,'jksad',12,'2022-09-29 04:16:43.951493','2022-09-29 04:16:43.951493',NULL),(33,'jksad',12,'2022-09-29 04:19:37.396497','2022-09-29 04:19:37.396497',NULL),(34,'jksad',12,'2022-09-29 04:20:01.070358','2022-09-29 04:20:01.070358',NULL),(35,'jksad',12,'2022-09-29 07:04:04.592479','2022-09-29 07:04:04.592479',NULL),(36,'jksad',12,'2022-09-29 07:04:26.217059','2022-09-29 07:04:26.217059',NULL),(37,'jksad',12,'2022-09-29 07:04:46.799659','2022-09-29 07:04:46.799659',NULL),(38,'dcmvj',12,'2022-09-29 07:05:33.523377','2022-09-29 07:05:33.523377',NULL),(39,'dcmvj',12,'2022-09-29 07:07:37.012988','2022-09-29 07:07:37.012988',NULL),(40,'dcmvj',12,'2022-09-29 07:14:22.295224','2022-09-29 07:14:22.295224',NULL),(41,'dcmvj',12,'2022-09-29 07:17:21.023485','2022-09-29 07:17:21.023485',NULL),(42,'dcmvj',12,'2022-09-29 07:18:12.543593','2022-09-29 07:18:12.543593',NULL),(43,'dcmvj',12,'2022-09-29 07:18:26.635909','2022-09-29 07:18:26.635909',NULL),(44,'dcmvj',12,'2022-09-29 07:19:00.652517','2022-09-29 07:19:00.652517',NULL),(45,'dcmvj',12,'2022-09-29 07:19:21.196155','2022-09-29 07:19:21.196155',NULL),(46,'dcmvj',12,'2022-09-29 07:20:50.686946','2022-09-29 07:20:50.686946',NULL),(47,'dcmvj',12,'2022-09-29 07:22:04.948807','2022-09-29 07:22:04.948807',NULL),(48,'dcmvj',12,'2022-09-29 07:22:22.700123','2022-09-29 07:22:22.700123',NULL),(49,'dcmvj',12,'2022-09-29 07:26:01.881342','2022-09-29 07:26:01.881342',NULL),(50,'dcmvj',12,'2022-09-29 07:27:25.200223','2022-09-29 07:27:25.200223',NULL),(51,'dcmvj',12,'2022-09-29 07:27:39.476323','2022-09-29 07:27:39.476323',NULL),(52,'dcmvj',12,'2022-09-29 07:30:53.365927','2022-09-29 07:30:53.365927',NULL),(53,'dcmvj',12,'2022-09-29 07:32:27.512669','2022-09-29 07:32:27.512669',NULL),(54,'dcmvj',12,'2022-09-29 07:32:36.002635','2022-09-29 07:32:36.002635',NULL),(55,'dcmvj',12,'2022-09-29 07:38:43.441200','2022-09-29 07:38:43.441200',NULL),(56,'dcmvj',12,'2022-09-29 07:39:08.199911','2022-09-29 07:39:08.199911',NULL),(57,'dcmvj',12,'2022-09-29 07:39:15.911148','2022-09-29 07:39:15.911148',NULL),(58,'dcmvj',12,'2022-09-29 07:39:40.875073','2022-09-29 07:39:40.875073',NULL),(59,'dcmvj',12,'2022-09-29 07:40:08.970859','2022-09-29 07:40:08.970859',NULL),(60,'dcmvj',12,'2022-09-29 07:40:21.591052','2022-09-29 07:40:21.591052',NULL),(61,'dcmvj',12,'2022-09-29 07:41:46.928103','2022-09-29 07:41:46.928103',NULL),(62,'dcmvj',12,'2022-09-29 07:42:06.760996','2022-09-29 07:42:06.760996',NULL),(63,'dcmvj',12,'2022-09-29 07:42:57.250175','2022-09-29 07:42:57.250175',NULL),(64,'dcmvj',12,'2022-09-29 07:45:03.507903','2022-09-29 07:45:03.507903',NULL),(65,'dcmvj',12,'2022-09-29 07:45:38.580959','2022-09-29 07:45:38.580959',NULL),(66,'dcmvj',12,'2022-09-29 07:47:20.612296','2022-09-29 07:47:20.612296',NULL),(67,'dcmvj',12,'2022-09-29 07:47:33.992912','2022-09-29 07:47:33.992912',NULL),(68,'dcmvj',12,'2022-09-29 07:47:55.715778','2022-09-29 07:47:55.715778',NULL),(69,'dcmvj',12,'2022-09-29 07:48:15.107763','2022-09-29 07:48:15.107763',NULL),(70,'dcmvj',12,'2022-09-29 07:50:04.988884','2022-09-29 07:50:04.988884',NULL),(71,'dcmvj',12,'2022-09-29 07:50:20.122572','2022-09-29 07:50:20.122572',NULL),(72,'dcmvj',12,'2022-09-29 07:50:43.672683','2022-09-29 07:50:43.672683',NULL);
/*!40000 ALTER TABLE `stories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03 11:02:54
