-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: tabel
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.23.04.1

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
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','text','Id',1,0,0,0,0,0,'{}',1),(24,4,'start_shift','time','Start Shift',1,1,1,1,1,1,'{}',4),(25,4,'end_shift','timestamp','End Shift',1,1,1,1,1,1,'{}',5),(26,4,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(27,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(29,4,'shift_belongsto_employee_relationship','relationship','employees',1,1,1,1,1,1,'{\"model\":\"App\\\\Employee\",\"table\":\"employees\",\"type\":\"belongsTo\",\"column\":\"employee_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}',2),(30,4,'employee_id','text','Employee Id',1,1,1,1,1,1,'{}',3),(31,5,'id','text','Id',1,0,0,0,0,0,'{}',1),(32,5,'name','text','Name',1,1,1,1,1,1,'{}',2),(33,5,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',3),(34,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(35,5,'employee_hasmany_shift_relationship','relationship','shifts',0,1,1,1,1,1,'{\"model\":\"App\\\\Shift\",\"table\":\"shifts\",\"type\":\"hasMany\",\"column\":\"employee_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":null}',5),(36,4,'obed','checkbox','Obed',1,1,1,1,1,1,'{}',7),(37,4,'comment','text','Comment',0,1,1,1,1,1,'{}',8);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2023-09-29 23:59:23','2023-09-29 23:59:23'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2023-09-29 23:59:23','2023-09-29 23:59:23'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2023-09-29 23:59:23','2023-09-29 23:59:23'),(4,'shifts','shifts','Смены','Смена',NULL,'App\\Shift',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2023-09-30 00:03:37','2023-10-05 06:21:34'),(5,'employees','employees','Сотрудник','Сотрудники',NULL,'App\\Employee',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2023-09-30 00:07:19','2023-09-30 00:07:19');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (10,'Долгополов Сергей',NULL,NULL),(11,'Борзых Дмитрий',NULL,NULL),(25,'Папенков Сергей',NULL,NULL),(26,'Петухов Денис',NULL,NULL),(27,'Пономарев Павел',NULL,NULL),(28,'Асначев Антон',NULL,NULL),(29,'Овсянников Константин',NULL,NULL),(30,'Таров Александр',NULL,NULL),(32,'Кузнецов Виталий',NULL,NULL),(33,'Сердюков Андрей',NULL,NULL),(34,'Заболотный Андрей',NULL,NULL),(36,'Рем Олег',NULL,NULL),(37,'Давыдов Артем',NULL,NULL),(41,'Тайбазаров Евгений',NULL,NULL),(42,'Сергеев Дмитрий',NULL,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2023-09-29 23:59:23','2023-09-29 23:59:23','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2023-09-29 23:59:28','2023-09-29 23:59:28','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2023-09-29 23:59:28','2023-09-29 23:59:28','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2023-09-29 23:59:28','2023-09-29 23:59:28','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2023-09-29 23:59:28','2023-09-29 23:59:28',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,10,'2023-09-29 23:59:28','2023-09-29 23:59:28','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,11,'2023-09-29 23:59:28','2023-09-29 23:59:28','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,12,'2023-09-29 23:59:28','2023-09-29 23:59:28','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2023-09-29 23:59:28','2023-09-29 23:59:28','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2023-09-29 23:59:28','2023-09-29 23:59:28','voyager.settings.index',NULL),(11,1,'Смена','','_self',NULL,NULL,NULL,15,'2023-09-30 00:03:37','2023-09-30 00:03:37','voyager.shifts.index',NULL),(12,1,'Сотрудники','','_self',NULL,NULL,NULL,16,'2023-09-30 00:07:19','2023-09-30 00:07:19','voyager.employees.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2023-09-29 23:59:23','2023-09-29 23:59:23');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2023-09-29 23:59:28','2023-09-29 23:59:28'),(2,'browse_bread',NULL,'2023-09-29 23:59:28','2023-09-29 23:59:28'),(3,'browse_database',NULL,'2023-09-29 23:59:28','2023-09-29 23:59:28'),(4,'browse_media',NULL,'2023-09-29 23:59:29','2023-09-29 23:59:29'),(5,'browse_compass',NULL,'2023-09-29 23:59:29','2023-09-29 23:59:29'),(6,'browse_menus','menus','2023-09-29 23:59:29','2023-09-29 23:59:29'),(7,'read_menus','menus','2023-09-29 23:59:29','2023-09-29 23:59:29'),(8,'edit_menus','menus','2023-09-29 23:59:29','2023-09-29 23:59:29'),(9,'add_menus','menus','2023-09-29 23:59:29','2023-09-29 23:59:29'),(10,'delete_menus','menus','2023-09-29 23:59:29','2023-09-29 23:59:29'),(11,'browse_roles','roles','2023-09-29 23:59:29','2023-09-29 23:59:29'),(12,'read_roles','roles','2023-09-29 23:59:29','2023-09-29 23:59:29'),(13,'edit_roles','roles','2023-09-29 23:59:29','2023-09-29 23:59:29'),(14,'add_roles','roles','2023-09-29 23:59:29','2023-09-29 23:59:29'),(15,'delete_roles','roles','2023-09-29 23:59:29','2023-09-29 23:59:29'),(16,'browse_users','users','2023-09-29 23:59:29','2023-09-29 23:59:29'),(17,'read_users','users','2023-09-29 23:59:29','2023-09-29 23:59:29'),(18,'edit_users','users','2023-09-29 23:59:29','2023-09-29 23:59:29'),(19,'add_users','users','2023-09-29 23:59:29','2023-09-29 23:59:29'),(20,'delete_users','users','2023-09-29 23:59:29','2023-09-29 23:59:29'),(21,'browse_settings','settings','2023-09-29 23:59:29','2023-09-29 23:59:29'),(22,'read_settings','settings','2023-09-29 23:59:29','2023-09-29 23:59:29'),(23,'edit_settings','settings','2023-09-29 23:59:29','2023-09-29 23:59:29'),(24,'add_settings','settings','2023-09-29 23:59:29','2023-09-29 23:59:29'),(25,'delete_settings','settings','2023-09-29 23:59:29','2023-09-29 23:59:29'),(26,'browse_shifts','shifts','2023-09-30 00:03:37','2023-09-30 00:03:37'),(27,'read_shifts','shifts','2023-09-30 00:03:37','2023-09-30 00:03:37'),(28,'edit_shifts','shifts','2023-09-30 00:03:37','2023-09-30 00:03:37'),(29,'add_shifts','shifts','2023-09-30 00:03:37','2023-09-30 00:03:37'),(30,'delete_shifts','shifts','2023-09-30 00:03:37','2023-09-30 00:03:37'),(31,'browse_employees','employees','2023-09-30 00:07:19','2023-09-30 00:07:19'),(32,'read_employees','employees','2023-09-30 00:07:19','2023-09-30 00:07:19'),(33,'edit_employees','employees','2023-09-30 00:07:19','2023-09-30 00:07:19'),(34,'add_employees','employees','2023-09-30 00:07:19','2023-09-30 00:07:19'),(35,'delete_employees','employees','2023-09-30 00:07:19','2023-09-30 00:07:19');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2023-09-29 23:59:28','2023-09-29 23:59:28'),(2,'user','Normal User','2023-09-29 23:59:28','2023-09-29 23:59:28');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `start_shift` datetime NOT NULL,
  `end_shift` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `obed` tinyint DEFAULT '0',
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `shifts_user_id_index` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,1,'2023-06-21 12:20:00','2023-06-21 14:20:00',NULL,NULL,0,''),(2,1,'2023-06-16 08:05:00','2023-06-16 22:05:00',NULL,NULL,0,''),(3,1,'2023-06-13 11:14:00','2023-06-13 23:15:00',NULL,NULL,0,''),(4,1,'2023-06-18 12:00:00','2023-06-19 03:00:00',NULL,NULL,0,''),(6,9,'2023-06-20 09:00:00','2023-06-20 21:00:00',NULL,NULL,0,''),(7,11,'2023-06-20 08:00:00','2023-06-20 21:50:00',NULL,NULL,0,''),(8,34,'2023-06-01 09:00:00','2023-06-01 19:00:00',NULL,NULL,0,NULL),(9,34,'2023-06-02 09:00:00','2023-06-02 20:35:00',NULL,NULL,0,NULL),(10,34,'2023-06-05 09:00:00','2023-06-05 19:00:00',NULL,NULL,0,NULL),(11,34,'2023-06-06 09:00:00','2023-06-06 19:00:00',NULL,NULL,0,NULL),(12,34,'2023-06-07 09:00:00','2023-06-07 18:15:00',NULL,NULL,0,NULL),(13,34,'2023-06-08 09:00:00','2023-06-08 18:00:00',NULL,NULL,0,NULL),(14,34,'2023-06-09 09:00:00','2023-06-09 18:45:00',NULL,NULL,0,NULL),(15,34,'2023-06-12 09:00:00','2023-06-12 18:25:00',NULL,NULL,0,NULL),(16,34,'2023-06-13 09:15:00','2023-06-13 18:00:00',NULL,NULL,0,NULL),(17,34,'2023-06-14 09:00:00','2023-06-14 19:45:00',NULL,NULL,0,NULL),(18,34,'2023-06-15 09:00:00','2023-06-15 19:35:00',NULL,NULL,0,NULL),(19,34,'2023-06-16 09:00:00','2023-06-16 18:00:00',NULL,NULL,0,NULL),(20,34,'2023-06-19 09:00:00','2023-06-19 19:00:00',NULL,NULL,0,NULL),(21,34,'2023-06-20 09:00:00','2023-06-20 18:00:00',NULL,NULL,0,NULL),(22,34,'2023-06-21 09:00:00','2023-06-21 19:00:00',NULL,NULL,0,NULL),(23,34,'2023-06-22 09:00:00','2023-06-22 18:00:00',NULL,NULL,0,NULL),(24,34,'2023-06-23 09:00:00','2023-06-23 18:30:00',NULL,NULL,0,NULL),(25,33,'2023-06-01 09:30:00','2023-06-01 19:45:00',NULL,NULL,0,NULL),(27,33,'2023-06-02 08:40:00','2023-06-02 20:40:00',NULL,NULL,0,NULL),(28,33,'2023-06-03 17:00:00','2023-06-03 18:00:00',NULL,NULL,0,NULL),(29,28,'2023-06-01 12:20:00','2023-06-01 20:00:00',NULL,NULL,0,NULL),(30,28,'2023-06-02 09:10:00','2023-06-02 21:00:00',NULL,NULL,0,NULL),(31,28,'2023-06-05 12:10:00','2023-06-27 21:00:00',NULL,NULL,0,''),(32,28,'2023-06-06 08:40:00','2023-06-06 18:00:00',NULL,NULL,0,NULL),(33,28,'2023-06-09 12:20:00','2023-06-09 19:00:00',NULL,NULL,0,NULL),(34,28,'2023-06-10 10:00:00','2023-06-10 16:00:00',NULL,NULL,0,NULL),(35,28,'2023-06-13 12:30:00','2023-06-13 20:30:00',NULL,NULL,0,NULL),(36,28,'2023-06-14 09:20:00','2023-06-14 19:40:00',NULL,NULL,0,NULL),(37,28,'2023-06-21 12:20:00','2023-06-21 23:00:00',NULL,NULL,0,NULL),(38,28,'2023-06-22 09:20:00','2023-06-23 02:00:00',NULL,NULL,0,NULL),(39,28,'2023-06-23 08:00:00','2023-06-23 12:40:00',NULL,NULL,0,NULL),(40,28,'2023-06-05 12:10:00','2023-06-05 21:00:00',NULL,NULL,0,NULL),(41,28,'2023-06-05 12:10:00','2023-06-05 21:00:00',NULL,NULL,0,NULL),(42,28,'2023-06-05 12:10:00','2023-06-05 21:00:00',NULL,NULL,0,NULL),(43,10,'2023-07-03 09:00:00','2023-07-03 20:00:00',NULL,NULL,1,''),(44,10,'2023-07-04 09:00:00','2023-07-04 21:00:00',NULL,NULL,1,''),(45,10,'2023-07-05 08:00:00','2023-07-05 22:00:00',NULL,NULL,1,''),(46,10,'2023-07-06 09:30:00','2023-07-06 20:30:00',NULL,NULL,1,''),(47,10,'2023-07-07 09:00:00','2023-07-07 20:00:00',NULL,NULL,1,''),(48,10,'2023-07-10 10:00:00','2023-07-10 21:30:00',NULL,NULL,1,''),(49,10,'2023-07-11 09:30:00','2023-07-11 20:30:00',NULL,NULL,1,''),(50,25,'2023-07-03 09:00:00','2023-07-03 18:00:00',NULL,NULL,0,''),(51,25,'2023-07-04 09:00:00','2023-07-04 19:00:00',NULL,NULL,0,''),(52,25,'2023-07-05 11:00:00','2023-07-05 18:00:00',NULL,NULL,0,''),(53,25,'2023-07-06 09:00:00','2023-07-06 18:00:00',NULL,NULL,0,''),(54,25,'2023-07-07 09:00:00','2023-07-07 18:00:00',NULL,NULL,0,''),(55,25,'2023-07-10 09:00:00','2023-07-10 19:30:00',NULL,NULL,0,''),(56,25,'2023-07-11 09:00:00','2023-07-11 19:30:00',NULL,NULL,0,''),(57,27,'2023-07-03 09:00:00','2023-07-03 19:00:00',NULL,NULL,0,''),(58,27,'2023-07-04 09:00:00','2023-07-04 21:00:00',NULL,NULL,0,''),(59,27,'2023-07-05 09:00:00','2023-07-05 22:00:00',NULL,NULL,0,''),(60,27,'2023-07-06 09:00:00','2023-07-06 20:00:00',NULL,NULL,0,''),(61,27,'2023-07-07 09:00:00','2023-07-07 19:00:00',NULL,NULL,0,''),(62,27,'2023-07-10 09:00:00','2023-07-10 21:00:00',NULL,NULL,0,''),(63,27,'2023-07-11 09:00:00','2023-07-11 20:30:00',NULL,NULL,0,''),(64,11,'2023-07-03 08:00:00','2023-07-03 22:00:00',NULL,NULL,1,''),(65,11,'2023-07-04 08:00:00','2023-07-04 21:00:00',NULL,NULL,1,''),(66,11,'2023-07-05 08:00:00','2023-07-05 22:00:00',NULL,NULL,1,''),(67,11,'2023-07-06 08:00:00','2023-07-06 20:20:00',NULL,NULL,1,''),(69,11,'2023-07-08 08:00:00','2023-07-08 16:00:00',NULL,NULL,0,''),(70,11,'2023-07-10 08:00:00','2023-07-10 21:30:00',NULL,NULL,1,''),(71,11,'2023-07-11 08:00:00','2023-07-11 20:30:00',NULL,NULL,1,''),(72,11,'2023-07-12 08:00:00','2023-07-12 19:40:00',NULL,NULL,1,''),(73,11,'2023-07-13 08:00:00','2023-07-13 20:00:00',NULL,NULL,1,''),(74,10,'2023-07-12 09:00:00','2023-07-12 20:00:00',NULL,NULL,1,''),(75,10,'2023-07-13 09:00:00','2023-07-13 20:00:00',NULL,NULL,1,''),(76,27,'2023-07-12 09:00:00','2023-07-12 20:30:00',NULL,NULL,1,''),(77,27,'2023-07-13 09:00:00','2023-07-13 20:00:00',NULL,NULL,1,''),(78,32,'2023-07-03 09:00:00','2023-07-03 18:00:00',NULL,NULL,1,''),(79,32,'2023-07-05 09:00:00','2023-07-05 18:00:00',NULL,NULL,1,''),(80,32,'2023-07-07 09:00:00','2023-07-07 18:00:00',NULL,NULL,1,''),(81,32,'2023-07-10 09:00:00','2023-07-10 18:00:00',NULL,NULL,1,''),(82,32,'2023-07-12 09:00:00','2023-07-12 18:00:00',NULL,NULL,1,''),(83,32,'2023-07-14 09:00:00','2023-07-14 17:40:00',NULL,NULL,1,''),(84,33,'2023-07-01 09:30:00','2023-07-01 16:30:00',NULL,NULL,1,''),(85,33,'2023-07-03 09:30:00','2023-07-03 19:00:00',NULL,NULL,1,''),(86,33,'2023-07-04 09:00:00','2023-07-04 19:30:00',NULL,NULL,1,''),(87,33,'2023-07-05 09:20:00','2023-07-05 19:00:00',NULL,NULL,1,''),(88,33,'2023-07-06 09:30:00','2023-07-06 18:40:00',NULL,NULL,1,''),(89,33,'2023-07-07 09:20:00','2023-07-07 20:10:00',NULL,NULL,1,''),(90,33,'2023-07-10 09:20:00','2023-07-10 20:20:00',NULL,NULL,1,''),(91,33,'2023-07-11 09:40:00','2023-07-11 19:40:00',NULL,NULL,1,''),(92,33,'2023-07-12 09:30:00','2023-07-12 19:40:00',NULL,NULL,1,''),(93,33,'2023-07-13 09:20:00','2023-07-13 19:30:00',NULL,NULL,1,''),(94,37,'2023-07-03 11:00:00','2023-07-03 20:00:00',NULL,NULL,1,''),(95,37,'2023-07-04 09:00:00','2023-07-04 19:30:00',NULL,NULL,1,''),(96,37,'2023-07-05 09:00:00','2023-07-05 21:30:00',NULL,NULL,1,''),(97,37,'2023-07-06 10:00:00','2023-07-06 19:00:00',NULL,NULL,1,''),(98,37,'2023-07-07 09:00:00','2023-07-07 19:00:00',NULL,NULL,1,''),(99,37,'2023-07-10 09:30:00','2023-07-10 19:00:00',NULL,NULL,1,''),(100,37,'2023-07-11 09:00:00','2023-07-11 18:00:00',NULL,NULL,1,''),(101,37,'2023-07-12 10:00:00','2023-07-12 19:00:00',NULL,NULL,1,''),(102,37,'2023-07-13 09:00:00','2023-07-13 20:00:00',NULL,NULL,1,''),(103,37,'2023-07-14 09:30:00','2023-07-14 18:00:00',NULL,NULL,1,''),(104,30,'2023-07-10 08:00:00','2023-07-10 18:30:00',NULL,NULL,1,''),(105,30,'2023-07-11 08:00:00','2023-07-11 19:00:00',NULL,NULL,1,''),(106,30,'2023-07-12 08:00:00','2023-07-12 18:00:00',NULL,NULL,1,''),(107,34,'2023-07-03 09:00:00','2023-07-03 19:10:00',NULL,NULL,1,''),(108,34,'2023-07-04 09:00:00','2023-07-04 19:00:00',NULL,NULL,1,''),(109,34,'2023-07-05 09:00:00','2023-07-05 18:00:00',NULL,NULL,1,''),(110,34,'2023-07-06 09:00:00','2023-07-06 18:00:00',NULL,NULL,1,''),(111,34,'2023-07-07 09:45:00','2023-07-07 18:00:00',NULL,NULL,1,''),(112,28,'2023-07-03 09:20:00','2023-07-03 22:00:00',NULL,NULL,1,''),(113,28,'2023-07-04 10:00:00','2023-07-04 20:00:00',NULL,NULL,1,''),(114,28,'2023-07-07 13:40:00','2023-07-07 20:40:00',NULL,NULL,0,''),(115,28,'2023-07-11 09:10:00','2023-07-11 19:30:00',NULL,NULL,1,''),(116,26,'2023-07-05 09:00:00','2023-07-05 18:00:00',NULL,NULL,1,''),(117,26,'2023-07-06 09:00:00','2023-07-06 18:00:00',NULL,NULL,1,''),(118,26,'2023-07-07 09:00:00','2023-07-07 18:00:00',NULL,NULL,1,''),(119,26,'2023-07-10 09:00:00','2023-07-10 18:00:00',NULL,NULL,1,''),(120,26,'2023-07-11 09:00:00','2023-07-11 12:00:00',NULL,NULL,0,''),(121,25,'2023-07-12 09:00:00','2023-07-12 17:00:00',NULL,NULL,1,''),(122,25,'2023-07-14 13:00:00','2023-07-14 15:00:00',NULL,NULL,0,''),(123,36,'2023-07-03 09:00:00','2023-07-03 19:10:00',NULL,NULL,1,''),(124,36,'2023-07-04 08:45:00','2023-07-04 19:00:00',NULL,NULL,0,''),(125,36,'2023-07-05 09:00:00','2023-07-05 17:00:00',NULL,NULL,0,''),(126,36,'2023-07-06 09:00:00','2023-07-06 19:00:00',NULL,NULL,0,''),(127,36,'2023-07-10 08:30:00','2023-07-10 20:30:00',NULL,NULL,0,''),(128,36,'2023-07-11 09:30:00','2023-07-11 17:30:00',NULL,NULL,0,''),(129,36,'2023-07-12 09:00:00','2023-07-12 20:00:00',NULL,NULL,0,''),(130,36,'2023-07-13 09:00:00','2023-07-13 17:30:00',NULL,NULL,0,''),(131,36,'2023-07-14 09:00:00','2023-07-14 19:00:00',NULL,NULL,0,''),(132,30,'2023-07-13 08:00:00','2023-07-13 19:30:00',NULL,NULL,1,''),(133,30,'2023-07-17 09:00:00','2023-07-17 18:30:00',NULL,NULL,1,''),(134,30,'2023-07-18 08:00:00','2023-07-18 19:40:00',NULL,NULL,1,''),(135,10,'2023-07-14 09:00:00','2023-07-14 18:00:00',NULL,NULL,1,''),(136,10,'2023-07-17 09:00:00','2023-07-17 21:00:00',NULL,NULL,1,''),(137,10,'2023-07-18 13:00:00','2023-07-18 21:00:00',NULL,NULL,0,''),(138,11,'2023-07-14 07:40:00','2023-07-14 19:40:00',NULL,NULL,1,''),(139,11,'2023-07-17 08:00:00','2023-07-17 19:30:00',NULL,NULL,1,''),(140,11,'2023-07-18 08:00:00','2023-07-18 19:40:00',NULL,NULL,1,''),(141,33,'2023-07-14 09:20:00','2023-07-14 19:00:00',NULL,NULL,1,''),(142,33,'2023-07-17 09:10:00','2023-07-17 19:30:00',NULL,NULL,1,''),(143,33,'2023-07-18 09:20:00','2023-07-18 19:40:00',NULL,NULL,1,''),(144,33,'2023-07-19 09:10:00','2023-07-19 20:00:00',NULL,NULL,1,''),(145,32,'2023-07-17 09:00:00','2023-07-17 18:30:00',NULL,NULL,1,''),(146,32,'2023-07-19 09:00:00','2023-07-19 19:00:00',NULL,NULL,1,''),(147,37,'2023-07-17 09:30:00','2023-07-17 18:30:00',NULL,NULL,1,''),(148,37,'2023-07-18 09:00:00','2023-07-18 18:00:00',NULL,NULL,1,''),(149,37,'2023-07-19 09:00:00','2023-07-19 19:00:00',NULL,NULL,1,''),(150,34,'2023-07-17 09:00:00','2023-07-17 18:00:00',NULL,NULL,1,''),(151,34,'2023-07-18 09:00:00','2023-07-18 18:00:00',NULL,NULL,1,''),(152,34,'2023-07-19 09:00:00','2023-07-19 17:30:00',NULL,NULL,1,''),(154,36,'2023-07-18 08:45:00','2023-07-18 18:00:00',NULL,NULL,0,''),(155,36,'2023-07-17 08:40:00','2023-07-17 20:30:00',NULL,NULL,0,''),(156,36,'2023-07-19 09:00:00','2023-07-19 17:00:00',NULL,NULL,0,''),(157,28,'2023-07-12 09:15:00','2023-07-12 21:00:00',NULL,NULL,1,''),(158,28,'2023-07-19 09:00:00','2023-07-19 20:30:00',NULL,NULL,1,''),(159,32,'2023-07-21 09:00:00','2023-07-21 19:30:00',NULL,NULL,1,''),(160,32,'2023-07-24 09:00:00','2023-07-24 18:10:00',NULL,NULL,1,''),(161,32,'2023-07-26 09:00:00','2023-07-26 18:00:00',NULL,NULL,1,''),(162,32,'2023-07-28 09:00:00','2023-07-28 18:00:00',NULL,NULL,1,''),(163,32,'2023-07-31 09:00:00','2023-07-31 18:30:00',NULL,NULL,1,''),(164,37,'2023-07-20 09:00:00','2023-07-20 20:00:00',NULL,NULL,1,''),(165,37,'2023-07-21 10:00:00','2023-07-21 19:00:00',NULL,NULL,1,''),(166,37,'2023-07-24 09:00:00','2023-07-24 18:00:00',NULL,NULL,1,''),(167,37,'2023-07-25 09:00:00','2023-07-25 19:30:00',NULL,NULL,1,''),(168,37,'2023-07-26 09:30:00','2023-07-26 18:30:00',NULL,NULL,1,''),(169,37,'2023-07-27 09:15:00','2023-07-27 19:15:00',NULL,NULL,1,''),(170,37,'2023-07-28 09:00:00','2023-07-28 18:00:00',NULL,NULL,1,''),(171,37,'2023-07-31 09:00:00','2023-07-31 18:30:00',NULL,NULL,1,''),(172,28,'2023-07-20 09:00:00','2023-07-20 20:20:00',NULL,NULL,1,''),(173,28,'2023-07-21 09:00:00','2023-07-21 19:00:00',NULL,NULL,0,''),(174,28,'2023-07-25 09:00:00','2023-07-25 18:00:00',NULL,NULL,1,''),(175,28,'2023-07-26 09:00:00','2023-07-26 19:20:00',NULL,NULL,1,''),(176,28,'2023-07-27 09:10:00','2023-07-27 19:20:00',NULL,NULL,1,''),(177,28,'2023-07-28 09:00:00','2023-07-28 20:00:00',NULL,NULL,1,''),(178,28,'2023-07-31 09:10:00','2023-07-31 19:20:00',NULL,NULL,1,''),(179,34,'2023-07-20 09:00:00','2023-07-20 16:00:00',NULL,NULL,1,''),(180,34,'2023-07-21 09:00:00','2023-07-21 19:00:00',NULL,NULL,1,''),(181,34,'2023-07-24 09:00:00','2023-07-24 19:00:00',NULL,NULL,1,''),(182,34,'2023-07-25 09:00:00','2023-07-25 18:30:00',NULL,NULL,1,''),(183,34,'2023-07-26 09:00:00','2023-07-26 19:00:00',NULL,NULL,1,''),(184,34,'2023-07-27 09:00:00','2023-07-27 18:30:00',NULL,NULL,1,''),(185,34,'2023-07-28 09:00:00','2023-07-28 14:30:00',NULL,NULL,1,''),(186,10,'2023-07-19 08:00:00','2023-07-19 20:30:00',NULL,NULL,1,''),(187,10,'2023-07-20 08:00:00','2023-07-20 20:30:00',NULL,NULL,1,''),(188,10,'2023-07-21 08:00:00','2023-07-21 20:00:00',NULL,NULL,1,''),(189,10,'2023-07-24 08:00:00','2023-07-24 20:00:00',NULL,NULL,1,''),(190,10,'2023-07-25 08:00:00','2023-07-25 20:00:00',NULL,NULL,1,''),(191,10,'2023-07-26 08:00:00','2023-07-26 20:00:00',NULL,NULL,1,''),(192,10,'2023-07-27 08:00:00','2023-07-27 20:00:00',NULL,NULL,1,''),(193,10,'2023-07-28 09:00:00','2023-07-28 20:00:00',NULL,NULL,1,''),(194,10,'2023-07-31 07:30:00','2023-07-31 19:30:00',NULL,NULL,1,''),(195,27,'2023-07-14 09:00:00','2023-07-14 18:00:00',NULL,NULL,1,''),(196,27,'2023-07-24 09:00:00','2023-07-24 20:00:00',NULL,NULL,1,''),(197,27,'2023-07-25 09:00:00','2023-07-25 20:00:00',NULL,NULL,1,''),(198,27,'2023-07-26 09:00:00','2023-07-26 19:30:00',NULL,NULL,1,''),(199,27,'2023-07-27 09:00:00','2023-07-27 20:00:00',NULL,NULL,1,''),(200,27,'2023-07-28 09:00:00','2023-07-28 20:00:00',NULL,NULL,1,''),(201,27,'2023-07-31 09:00:00','2023-07-31 19:30:00',NULL,NULL,1,''),(202,30,'2023-07-19 08:00:00','2023-07-19 20:00:00',NULL,NULL,1,''),(203,30,'2023-07-20 08:00:00','2023-07-20 20:00:00',NULL,NULL,1,''),(204,30,'2023-07-21 08:00:00','2023-07-21 18:30:00',NULL,NULL,1,''),(205,30,'2023-07-25 11:30:00','2023-07-25 20:00:00',NULL,NULL,1,''),(206,30,'2023-07-26 11:30:00','2023-07-26 20:30:00',NULL,NULL,1,''),(207,30,'2023-07-27 11:00:00','2023-07-27 18:00:00',NULL,NULL,1,''),(208,30,'2023-07-28 11:30:00','2023-07-28 19:00:00',NULL,NULL,1,''),(209,30,'2023-07-31 14:00:00','2023-07-31 19:30:00',NULL,NULL,0,''),(210,25,'2023-07-20 09:00:00','2023-07-20 20:20:00',NULL,NULL,1,''),(211,25,'2023-07-21 09:00:00','2023-07-21 18:30:00',NULL,NULL,1,''),(212,25,'2023-07-24 09:00:00','2023-07-24 18:00:00',NULL,NULL,1,''),(213,25,'2023-07-25 09:00:00','2023-07-25 18:30:00',NULL,NULL,1,''),(214,25,'2023-07-26 10:30:00','2023-07-26 18:30:00',NULL,NULL,1,''),(215,25,'2023-07-27 10:00:00','2023-07-27 17:00:00',NULL,NULL,1,''),(216,25,'2023-07-28 09:00:00','2023-07-28 20:00:00',NULL,NULL,1,''),(217,25,'2023-07-31 09:00:00','2023-07-31 18:00:00',NULL,NULL,1,''),(218,36,'2023-07-20 09:00:00','2023-07-20 19:00:00',NULL,NULL,0,''),(219,36,'2023-07-21 09:00:00','2023-07-21 17:00:00',NULL,NULL,0,''),(220,36,'2023-07-24 09:20:00','2023-07-24 18:30:00',NULL,NULL,0,''),(221,36,'2023-07-25 10:20:00','2023-07-25 18:20:00',NULL,NULL,0,''),(222,36,'2023-07-26 09:00:00','2023-07-26 17:00:00',NULL,NULL,0,''),(223,36,'2023-07-27 09:40:00','2023-07-27 18:35:00',NULL,NULL,0,''),(224,36,'2023-07-28 08:50:00','2023-07-28 17:10:00',NULL,NULL,0,''),(225,36,'2023-07-31 09:00:00','2023-07-31 18:00:00',NULL,NULL,0,''),(226,11,'2023-07-19 08:00:00','2023-07-19 20:00:00',NULL,NULL,1,''),(227,11,'2023-07-20 08:00:00','2023-07-20 20:00:00',NULL,NULL,1,''),(228,11,'2023-07-21 08:00:00','2023-07-21 19:20:00',NULL,NULL,1,''),(229,11,'2023-07-24 07:40:00','2023-07-24 20:00:00',NULL,NULL,1,''),(230,11,'2023-07-25 07:50:00','2023-07-25 20:00:00',NULL,NULL,1,''),(231,11,'2023-07-26 08:00:00','2023-07-26 20:00:00',NULL,NULL,1,''),(232,11,'2023-07-27 08:00:00','2023-07-27 19:30:00',NULL,NULL,1,''),(233,11,'2023-07-28 07:40:00','2023-07-28 19:00:00',NULL,NULL,1,''),(234,11,'2023-07-31 07:30:00','2023-07-31 19:30:00',NULL,NULL,1,''),(235,11,'2023-07-07 07:50:00','2023-07-07 19:00:00',NULL,NULL,1,''),(236,33,'2023-07-20 08:50:00','2023-07-20 19:10:00',NULL,NULL,1,''),(237,33,'2023-07-21 10:10:00','2023-07-21 19:40:00',NULL,NULL,1,''),(238,33,'2023-07-24 09:10:00','2023-07-24 20:00:00',NULL,NULL,1,''),(239,33,'2023-07-25 09:20:00','2023-07-25 19:40:00',NULL,NULL,1,''),(240,33,'2023-07-26 09:10:00','2023-07-26 19:40:00',NULL,NULL,1,''),(241,33,'2023-07-27 09:00:00','2023-07-27 20:10:00',NULL,NULL,1,''),(242,33,'2023-07-28 09:10:00','2023-07-28 19:10:00',NULL,NULL,1,''),(243,33,'2023-07-31 09:20:00','2023-07-31 20:40:00',NULL,NULL,1,''),(244,30,'2023-08-01 11:30:00','2023-08-01 19:00:00',NULL,NULL,1,''),(245,30,'2023-08-02 11:30:00','2023-08-02 19:00:00',NULL,NULL,1,''),(246,30,'2023-08-03 11:20:00','2023-08-03 19:00:00',NULL,NULL,1,''),(247,30,'2023-08-04 11:00:00','2023-08-04 18:40:00',NULL,NULL,1,''),(248,30,'2023-08-07 08:00:00','2023-08-07 18:30:00',NULL,NULL,1,''),(249,30,'2023-08-08 08:00:00','2023-08-08 19:30:00',NULL,NULL,1,''),(250,30,'2023-08-09 08:00:00','2023-08-09 22:00:00',NULL,NULL,0,''),(251,30,'2023-08-10 08:00:00','2023-08-10 18:00:00',NULL,NULL,1,''),(252,30,'2023-08-11 08:00:00','2023-08-11 18:00:00',NULL,NULL,1,''),(253,30,'2023-08-14 08:00:00','2023-08-14 18:00:00',NULL,NULL,1,''),(254,30,'2023-08-17 08:00:00','2023-08-17 18:30:00',NULL,NULL,1,''),(255,30,'2023-08-18 08:00:00','2023-08-18 17:00:00',NULL,NULL,1,''),(256,42,'2023-08-15 09:00:00','2023-08-15 18:00:00',NULL,NULL,1,''),(257,42,'2023-08-16 09:00:00','2023-08-16 23:59:00',NULL,NULL,1,'02.30 нужно отнять перерыв'),(259,42,'2023-08-17 09:00:00','2023-08-17 19:00:00',NULL,NULL,1,''),(260,42,'2023-08-18 09:00:00','2023-08-18 19:00:00',NULL,NULL,1,''),(261,42,'2023-08-21 09:00:00','2023-08-21 18:00:00',NULL,NULL,1,''),(262,42,'2023-08-22 08:30:00','2023-08-22 18:30:00',NULL,NULL,1,''),(263,42,'2023-08-23 08:30:00','2023-08-23 18:00:00',NULL,NULL,1,''),(264,34,'2023-08-02 11:00:00','2023-08-02 19:00:00',NULL,NULL,1,''),(265,34,'2023-08-03 09:00:00','2023-08-03 19:45:00',NULL,NULL,1,''),(266,34,'2023-08-04 09:00:00','2023-08-04 18:30:00',NULL,NULL,1,''),(267,34,'2023-08-05 15:00:00','2023-08-05 19:00:00',NULL,NULL,1,''),(268,34,'2023-08-07 09:00:00','2023-08-07 19:00:00',NULL,NULL,1,''),(269,34,'2023-08-08 09:00:00','2023-08-08 15:00:00',NULL,NULL,1,''),(270,34,'2023-08-09 09:00:00','2023-08-09 18:00:00',NULL,NULL,1,''),(271,34,'2023-08-10 09:00:00','2023-08-10 18:45:00',NULL,NULL,1,''),(272,34,'2023-08-11 09:00:00','2023-08-11 18:00:00',NULL,NULL,1,''),(273,34,'2023-08-15 10:00:00','2023-08-15 18:45:00',NULL,NULL,1,''),(274,34,'2023-08-16 09:00:00','2023-08-16 18:00:00',NULL,NULL,1,''),(275,34,'2023-08-17 09:00:00','2023-08-17 19:15:00',NULL,NULL,1,''),(276,34,'2023-08-18 09:00:00','2023-08-18 19:00:00',NULL,NULL,1,''),(277,34,'2023-08-22 09:00:00','2023-08-22 12:00:00',NULL,NULL,1,''),(278,27,'2023-08-01 09:00:00','2023-08-01 20:00:00',NULL,NULL,1,''),(279,27,'2023-08-02 09:00:00','2023-08-02 20:30:00',NULL,NULL,1,''),(280,27,'2023-08-03 09:00:00','2023-08-04 07:59:00',NULL,NULL,1,'добавить 4 часа'),(281,27,'2023-08-07 09:00:00','2023-08-08 05:00:00',NULL,NULL,1,''),(283,27,'2023-08-08 15:00:00','2023-08-08 20:00:00',NULL,NULL,1,''),(284,27,'2023-08-09 09:00:00','2023-08-09 22:00:00',NULL,NULL,1,''),(285,27,'2023-08-10 08:00:00','2023-08-10 18:00:00',NULL,NULL,1,''),(286,27,'2023-08-11 09:00:00','2023-08-11 19:00:00',NULL,NULL,1,''),(287,37,'2023-08-01 09:30:00','2023-08-01 18:00:00',NULL,NULL,1,''),(288,37,'2023-08-02 09:30:00','2023-08-02 18:30:00',NULL,NULL,1,''),(289,37,'2023-08-03 09:00:00','2023-08-04 07:59:00',NULL,NULL,1,'нужно отнять перерыв с 18.00 до 21.00'),(291,30,'2023-08-21 08:00:00','2023-08-21 18:00:00',NULL,NULL,1,''),(292,30,'2023-08-22 08:00:00','2023-08-22 22:30:00',NULL,NULL,1,''),(293,30,'2023-08-23 08:00:00','2023-08-23 17:00:00',NULL,NULL,1,''),(294,30,'2023-08-24 08:00:00','2023-08-24 17:20:00',NULL,NULL,1,''),(295,30,'2023-08-25 08:00:00','2023-08-25 20:00:00',NULL,NULL,1,''),(296,30,'2023-08-28 08:00:00','2023-08-28 22:30:00',NULL,NULL,1,''),(297,30,'2023-08-29 06:00:00','2023-08-29 10:30:00',NULL,NULL,0,''),(298,34,'2023-08-24 09:30:00','2023-08-24 19:00:00',NULL,NULL,1,''),(299,34,'2023-08-25 09:00:00','2023-08-25 18:00:00',NULL,NULL,1,''),(300,36,'2023-08-01 09:00:00','2023-08-01 17:30:00',NULL,NULL,0,''),(301,36,'2023-08-02 09:00:00','2023-08-02 19:00:00',NULL,NULL,0,''),(302,36,'2023-08-03 10:00:00','2023-08-03 18:30:00',NULL,NULL,0,''),(303,36,'2023-08-04 09:10:00','2023-08-04 20:10:00',NULL,NULL,0,''),(304,36,'2023-08-06 10:30:00','2023-08-06 17:00:00',NULL,NULL,0,''),(305,36,'2023-08-07 09:00:00','2023-08-07 18:30:00',NULL,NULL,0,''),(306,36,'2023-08-08 09:00:00','2023-08-08 20:45:00',NULL,NULL,0,''),(307,36,'2023-08-09 09:45:00','2023-08-09 18:15:00',NULL,NULL,0,''),(308,36,'2023-08-10 09:30:00','2023-08-10 18:00:00',NULL,NULL,0,''),(309,36,'2023-08-11 09:00:00','2023-08-11 18:00:00',NULL,NULL,0,''),(310,36,'2023-08-14 09:00:00','2023-08-14 17:30:00',NULL,NULL,0,''),(311,36,'2023-08-15 09:10:00','2023-08-15 17:30:00',NULL,NULL,0,''),(312,36,'2023-08-16 11:30:00','2023-08-16 17:30:00',NULL,NULL,0,''),(313,36,'2023-08-17 11:00:00','2023-08-17 17:30:00',NULL,NULL,0,''),(314,36,'2023-08-18 09:30:00','2023-08-18 18:30:00',NULL,NULL,0,''),(315,36,'2023-08-21 10:15:00','2023-08-21 18:15:00',NULL,NULL,0,''),(316,36,'2023-08-22 09:20:00','2023-08-22 18:20:00',NULL,NULL,0,''),(317,36,'2023-08-23 09:15:00','2023-08-23 18:10:00',NULL,NULL,0,''),(318,36,'2023-08-24 09:00:00','2023-08-24 18:30:00',NULL,NULL,0,''),(319,36,'2023-08-25 09:00:00','2023-08-25 21:30:00',NULL,NULL,0,''),(320,36,'2023-08-28 09:00:00','2023-08-28 19:00:00',NULL,NULL,0,''),(321,25,'2023-08-01 09:00:00','2023-08-01 18:30:00',NULL,NULL,1,''),(322,25,'2023-08-02 09:00:00','2023-08-02 19:00:00',NULL,NULL,1,''),(323,25,'2023-08-03 09:00:00','2023-08-03 20:00:00',NULL,NULL,1,''),(324,25,'2023-08-04 09:00:00','2023-08-04 19:00:00',NULL,NULL,1,''),(325,25,'2023-08-11 09:00:00','2023-08-11 21:00:00',NULL,NULL,1,''),(326,25,'2023-08-12 09:00:00','2023-08-12 16:00:00',NULL,NULL,1,''),(327,25,'2023-08-13 10:00:00','2023-08-13 16:00:00',NULL,NULL,1,''),(329,25,'2023-08-21 09:00:00','2023-08-21 18:00:00',NULL,NULL,1,''),(330,25,'2023-08-22 09:00:00','2023-08-22 18:00:00',NULL,NULL,1,''),(331,25,'2023-08-23 08:00:00','2023-08-23 21:00:00',NULL,NULL,1,''),(332,25,'2023-08-14 09:00:00','2023-08-15 05:00:00',NULL,NULL,1,'нужно отнять перерыв с 18.00 до 20.00'),(333,25,'2023-08-25 12:00:00','2023-08-25 19:00:00',NULL,NULL,0,''),(334,25,'2023-08-28 09:00:00','2023-08-28 21:00:00',NULL,NULL,1,''),(335,33,'2023-08-01 09:30:00','2023-08-01 20:30:00',NULL,NULL,1,''),(336,33,'2023-08-04 09:00:00','2023-08-04 20:30:00',NULL,NULL,1,''),(337,33,'2023-08-05 10:00:00','2023-08-05 18:00:00',NULL,NULL,1,''),(338,33,'2023-08-07 09:10:00','2023-08-07 20:10:00',NULL,NULL,1,''),(339,33,'2023-08-08 12:20:00','2023-08-08 20:00:00',NULL,NULL,1,''),(340,33,'2023-08-09 09:30:00','2023-08-09 19:40:00',NULL,NULL,1,''),(341,33,'2023-08-10 09:10:00','2023-08-10 20:00:00',NULL,NULL,1,''),(342,33,'2023-08-11 09:30:00','2023-08-11 21:30:00',NULL,NULL,1,''),(343,33,'2023-08-14 09:30:00','2023-08-14 20:00:00',NULL,NULL,1,''),(344,33,'2023-08-15 09:50:00','2023-08-15 20:40:00',NULL,NULL,1,''),(345,33,'2023-08-16 09:20:00','2023-08-16 20:40:00',NULL,NULL,1,''),(346,33,'2023-08-17 09:30:00','2023-08-17 19:30:00',NULL,NULL,1,''),(347,33,'2023-08-21 09:00:00','2023-08-21 19:40:00',NULL,NULL,1,''),(348,33,'2023-08-22 09:10:00','2023-08-22 20:00:00',NULL,NULL,1,''),(349,33,'2023-08-23 08:30:00','2023-08-23 21:00:00',NULL,NULL,1,''),(350,33,'2023-08-24 09:20:00','2023-08-24 16:40:00',NULL,NULL,1,''),(351,33,'2023-08-25 09:40:00','2023-08-25 19:00:00',NULL,NULL,1,''),(352,42,'2023-08-24 09:00:00','2023-08-24 19:00:00',NULL,NULL,1,''),(353,42,'2023-08-25 09:00:00','2023-08-25 18:00:00',NULL,NULL,1,''),(354,42,'2023-08-28 09:00:00','2023-08-28 22:30:00',NULL,NULL,1,''),(355,42,'2023-08-29 06:00:00','2023-08-29 18:00:00',NULL,NULL,1,''),(362,28,'2023-08-09 09:30:00','2023-08-09 23:30:00',NULL,NULL,1,''),(363,28,'2023-08-10 09:30:00','2023-08-10 23:30:00',NULL,NULL,1,''),(364,28,'2023-08-11 11:20:00','2023-08-11 21:00:00',NULL,NULL,1,''),(365,28,'2023-08-12 09:00:00','2023-08-12 16:00:00',NULL,NULL,1,''),(366,28,'2023-08-14 09:10:00','2023-08-15 06:00:00',NULL,NULL,1,''),(367,28,'2023-08-16 09:40:00','2023-08-16 23:59:00',NULL,NULL,1,''),(368,28,'2023-08-17 11:00:00','2023-08-17 19:00:00',NULL,NULL,1,''),(369,28,'2023-08-18 09:15:00','2023-08-18 19:00:00',NULL,NULL,1,''),(370,28,'2023-08-21 09:00:00','2023-08-22 07:30:00',NULL,NULL,1,''),(371,28,'2023-08-23 08:00:00','2023-08-23 20:00:00',NULL,NULL,1,''),(372,28,'2023-08-24 09:00:00','2023-08-25 01:30:00',NULL,NULL,1,'перерыв с 19.00 до 20.30'),(373,28,'2023-08-25 12:20:00','2023-08-25 19:00:00',NULL,NULL,1,''),(374,41,'2023-08-01 09:00:00','2023-08-01 20:00:00',NULL,NULL,1,''),(375,41,'2023-08-02 09:00:00','2023-08-02 20:30:00',NULL,NULL,1,''),(376,41,'2023-08-03 08:00:00','2023-08-04 07:59:00',NULL,NULL,1,''),(377,41,'2023-08-06 11:00:00','2023-08-06 18:00:00',NULL,NULL,1,''),(378,41,'2023-08-07 08:00:00','2023-08-08 05:00:00',NULL,NULL,1,''),(379,41,'2023-08-08 16:00:00','2023-08-08 20:00:00',NULL,NULL,1,''),(380,41,'2023-08-09 08:00:00','2023-08-09 23:30:00',NULL,NULL,1,''),(381,41,'2023-08-10 09:00:00','2023-08-10 19:00:00',NULL,NULL,1,''),(382,41,'2023-08-13 11:30:00','2023-08-13 17:00:00',NULL,NULL,1,''),(383,41,'2023-08-14 08:30:00','2023-08-15 06:00:00',NULL,NULL,1,''),(384,41,'2023-08-15 13:30:00','2023-08-15 21:00:00',NULL,NULL,0,''),(385,41,'2023-08-17 08:30:00','2023-08-17 19:30:00',NULL,NULL,1,''),(386,41,'2023-08-18 08:00:00','2023-08-18 21:00:00',NULL,NULL,1,''),(387,41,'2023-08-21 08:00:00','2023-08-22 07:30:00',NULL,NULL,1,''),(389,41,'2023-08-23 09:00:00','2023-08-23 22:00:00',NULL,NULL,1,''),(390,41,'2023-08-24 08:00:00','2023-08-24 18:00:00',NULL,NULL,0,''),(391,41,'2023-08-25 08:00:00','2023-08-26 04:30:00',NULL,NULL,1,''),(392,41,'2023-08-26 14:00:00','2023-08-26 18:00:00',NULL,NULL,1,''),(393,41,'2023-08-28 09:00:00','2023-08-28 18:30:00',NULL,NULL,1,''),(394,30,'2023-08-30 08:00:00','2023-08-30 20:30:00',NULL,NULL,1,''),(395,30,'2023-08-31 08:00:00','2023-08-31 18:00:00',NULL,NULL,1,''),(396,33,'2023-08-28 09:40:00','2023-08-28 20:00:00',NULL,NULL,1,''),(397,33,'2023-08-29 09:30:00','2023-08-29 19:40:00',NULL,NULL,1,''),(398,33,'2023-08-30 09:20:00','2023-08-30 19:20:00',NULL,NULL,1,''),(399,37,'2023-08-05 10:00:00','2023-08-05 20:00:00',NULL,NULL,1,''),(400,37,'2023-08-07 09:00:00','2023-08-07 19:30:00',NULL,NULL,1,''),(401,37,'2023-08-08 10:00:00','2023-08-08 23:59:00',NULL,NULL,1,'отнять перерыв с 19.30 до 21.30'),(402,37,'2023-08-09 10:00:00','2023-08-09 23:30:00',NULL,NULL,1,'отнять перерыв с 19.15 до 20.30'),(403,37,'2023-08-10 10:00:00','2023-08-10 23:30:00',NULL,NULL,1,''),(404,37,'2023-08-11 12:00:00','2023-08-11 21:00:00',NULL,NULL,1,''),(405,37,'2023-08-15 10:00:00','2023-08-15 18:00:00',NULL,NULL,1,''),(406,37,'2023-08-16 10:00:00','2023-08-16 19:00:00',NULL,NULL,1,''),(407,37,'2023-08-21 09:00:00','2023-08-21 19:00:00',NULL,NULL,1,''),(408,37,'2023-08-22 10:00:00','2023-08-22 18:30:00',NULL,NULL,1,''),(409,37,'2023-08-23 09:00:00','2023-08-23 19:00:00',NULL,NULL,1,''),(410,37,'2023-08-24 10:00:00','2023-08-24 19:00:00',NULL,NULL,1,''),(411,37,'2023-08-25 10:00:00','2023-08-25 20:00:00',NULL,NULL,1,''),(412,37,'2023-08-28 09:30:00','2023-08-28 22:00:00',NULL,NULL,1,''),(413,37,'2023-08-29 09:00:00','2023-08-29 18:00:00',NULL,NULL,1,''),(414,37,'2023-08-30 09:30:00','2023-08-30 18:00:00',NULL,NULL,1,''),(415,37,'2023-08-31 09:00:00','2023-08-31 19:30:00',NULL,NULL,1,''),(416,33,'2023-08-31 09:30:00','2023-08-31 20:00:00',NULL,NULL,1,''),(417,27,'2023-08-05 11:00:00','2023-08-05 20:00:00',NULL,NULL,1,''),(418,25,'2023-08-24 09:00:00','2023-08-25 01:30:00',NULL,NULL,1,'нужно отнять перерыв с 18.00 до 21.00'),(419,25,'2023-08-29 09:00:00','2023-09-29 18:00:00',NULL,NULL,1,''),(420,25,'2023-08-30 09:40:00','2023-08-30 18:00:00',NULL,NULL,1,''),(421,25,'2023-08-31 09:00:00','2023-08-31 18:00:00',NULL,NULL,1,''),(422,11,'2023-08-01 08:00:00','2023-08-01 20:00:00',NULL,NULL,1,''),(423,11,'2023-08-02 08:00:00','2023-08-02 20:30:00',NULL,NULL,1,''),(424,11,'2023-08-03 08:00:00','2023-08-04 07:30:00',NULL,NULL,1,''),(425,11,'2023-08-05 09:00:00','2023-08-05 20:00:00',NULL,NULL,1,''),(426,11,'2023-08-07 08:00:00','2023-08-07 20:00:00',NULL,NULL,1,''),(427,11,'2023-08-08 08:00:00','2023-08-08 19:30:00',NULL,NULL,1,''),(428,11,'2023-08-09 08:00:00','2023-08-09 20:30:00',NULL,NULL,1,''),(429,11,'2023-08-10 08:00:00','2023-08-10 18:30:00',NULL,NULL,1,''),(430,11,'2023-08-12 09:00:00','2023-08-12 20:00:00',NULL,NULL,0,''),(431,11,'2023-08-13 09:00:00','2023-08-13 17:00:00',NULL,NULL,0,''),(432,11,'2023-08-14 08:00:00','2023-08-15 06:00:00',NULL,NULL,1,''),(433,11,'2023-08-16 08:00:00','2023-08-16 19:00:00',NULL,NULL,1,''),(434,11,'2023-08-17 08:00:00','2023-08-17 19:00:00',NULL,NULL,1,''),(435,11,'2023-08-18 08:00:00','2023-08-18 21:00:00',NULL,NULL,1,''),(436,11,'2023-08-21 08:00:00','2023-08-22 07:30:00',NULL,NULL,1,''),(437,11,'2023-08-23 08:00:00','2023-08-23 22:00:00',NULL,NULL,1,''),(438,11,'2023-08-24 08:00:00','2023-08-24 21:00:00',NULL,NULL,1,''),(439,11,'2023-08-25 08:00:00','2023-08-26 04:30:00',NULL,NULL,1,''),(440,11,'2023-08-28 08:00:00','2023-08-28 22:30:00',NULL,NULL,1,''),(441,11,'2023-08-29 08:00:00','2023-08-29 19:30:00',NULL,NULL,1,''),(442,11,'2023-08-30 08:00:00','2023-08-30 18:00:00',NULL,NULL,1,''),(443,11,'2023-08-31 08:00:00','2023-08-31 19:00:00',NULL,NULL,1,''),(444,11,'2023-08-04 09:00:00','2023-08-04 13:00:00',NULL,NULL,1,''),(445,42,'2023-08-30 09:00:00','2023-08-30 18:00:00',NULL,NULL,1,''),(446,42,'2023-08-31 10:30:00','2023-08-31 18:10:00',NULL,NULL,1,''),(447,36,'2023-08-29 09:00:00','2023-08-29 17:00:00',NULL,NULL,0,''),(448,36,'2023-08-30 09:30:00','2023-08-30 17:30:00',NULL,NULL,0,''),(449,28,'2023-08-29 08:00:00','2023-08-29 19:20:00',NULL,NULL,1,''),(450,28,'2023-08-30 09:00:00','2023-08-30 20:30:00',NULL,NULL,1,''),(451,41,'2023-08-29 08:00:00','2023-08-29 19:30:00',NULL,NULL,0,''),(452,41,'2023-08-30 08:00:00','2023-08-30 20:00:00',NULL,NULL,1,''),(453,10,'2023-08-15 08:00:00','2023-08-15 21:00:00',NULL,NULL,1,''),(454,10,'2023-08-17 08:00:00','2023-08-17 19:00:00',NULL,NULL,0,''),(455,10,'2023-08-18 08:00:00','2023-08-18 21:00:00',NULL,NULL,1,''),(456,10,'2023-08-21 08:00:00','2023-08-22 07:30:00',NULL,NULL,1,''),(457,10,'2023-08-23 08:00:00','2023-08-23 21:00:00',NULL,NULL,1,''),(458,10,'2023-08-24 08:00:00','2023-08-24 21:00:00',NULL,NULL,1,''),(459,10,'2023-08-25 08:00:00','2023-08-26 04:30:00',NULL,NULL,1,''),(460,10,'2023-08-28 08:00:00','2023-08-28 22:30:00',NULL,NULL,1,''),(461,10,'2023-08-29 08:00:00','2023-08-29 19:30:00',NULL,NULL,0,''),(462,10,'2023-08-30 08:00:00','2023-08-30 19:00:00',NULL,NULL,1,''),(463,10,'2023-08-31 08:00:00','2023-08-31 19:00:00',NULL,NULL,1,''),(464,34,'2023-08-31 11:00:00','2023-08-31 18:00:00',NULL,NULL,1,''),(465,41,'2023-08-31 08:00:00','2023-08-31 20:00:00',NULL,NULL,1,''),(466,11,'2023-09-01 08:00:00','2023-09-01 18:00:00',NULL,NULL,1,''),(467,11,'2023-09-04 08:00:00','2023-09-04 19:30:00',NULL,NULL,1,''),(468,11,'2023-09-05 08:00:00','2023-09-05 19:10:00',NULL,NULL,1,''),(469,11,'2023-09-06 08:00:00','2023-09-06 19:00:00',NULL,NULL,1,''),(470,11,'2023-09-07 08:00:00','2023-09-07 20:00:00',NULL,NULL,1,''),(471,11,'2023-09-08 08:00:00','2023-09-08 23:59:00',NULL,NULL,0,''),(472,11,'2023-09-10 13:00:00','2023-09-10 14:00:00',NULL,NULL,0,''),(473,11,'2023-09-11 08:00:00','2023-09-11 18:40:00',NULL,NULL,1,''),(474,11,'2023-09-12 08:00:00','2023-09-12 19:00:00',NULL,NULL,1,''),(475,11,'2023-09-13 08:00:00','2023-09-13 18:00:00',NULL,NULL,1,''),(476,11,'2023-09-14 08:00:00','2023-09-14 20:30:00',NULL,NULL,1,''),(477,11,'2023-09-15 08:00:00','2023-09-15 21:00:00',NULL,NULL,1,''),(478,11,'2023-09-18 08:00:00','2023-09-18 19:40:00',NULL,NULL,1,''),(479,11,'2023-09-19 08:00:00','2023-09-19 21:00:00',NULL,NULL,1,''),(480,11,'2023-09-20 08:00:00','2023-09-20 20:20:00',NULL,NULL,1,''),(481,11,'2023-09-21 08:00:00','2023-09-21 23:59:00',NULL,NULL,1,'прибавить 01.30 ночных'),(482,11,'2023-09-22 09:00:00','2023-09-22 19:00:00',NULL,NULL,1,''),(483,11,'2023-09-25 08:00:00','2023-09-25 23:59:00',NULL,NULL,1,' прибавить 00.30 ночных'),(484,11,'2023-09-26 08:00:00','2023-09-26 23:59:00',NULL,NULL,1,''),(485,11,'2023-09-27 09:00:00','2023-09-27 18:00:00',NULL,NULL,1,''),(486,11,'2023-09-28 08:00:00','2023-09-28 19:30:00',NULL,NULL,1,'');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'qwerty','admin@email.com','users/default.png',NULL,'$2y$10$tnFmd24vOxtzLaCjt.7sG.LGbcbQtJ744rbOGCYFbWtXmZvHS9Fx2',NULL,'{\"locale\":\"ru\"}','2023-09-29 23:59:48','2023-09-30 00:02:50');
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

-- Dump completed on 2023-10-05 16:36:24
