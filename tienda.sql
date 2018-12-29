-- MySQL dump 10.13  Distrib 5.7.21, for osx10.13 (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ropa','ropa',NULL,'categories/ropa.jpeg','2018-12-19 20:29:30','2018-12-19 20:29:30'),(2,'Carteras','carteras',NULL,'categories/carteras.jpeg','2018-12-19 20:36:40','2018-12-19 20:43:56'),(4,'Accesorios','accesorios',NULL,NULL,'2018-12-19 20:44:19','2018-12-19 20:44:19');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2018_12_19_122002_create_categories_table',2),(9,'2018_12_19_122006_create_stores_table',2),(10,'2018_12_26_203859_create_products_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('722998639cbd70bacf8032e2723939e7f141422c91bd6fd1b37dbdacebfcebd76a59a37df0a57fbe',3,2,NULL,'[\"*\"]',0,'2018-12-19 21:32:32','2018-12-19 21:32:32','2019-12-19 16:32:32'),('838f7658387466d92e3a8a3eded657668ed8f89369a521bbd4d412fc55c840b1a6c99179cac5ed1a',1,2,NULL,'[\"*\"]',0,'2018-12-19 13:42:25','2018-12-19 13:42:25','2019-12-19 08:42:25'),('8c9908a59865eb4e03c49b27189b14f687abf1af6625e2eab40fe770e66288f12ebe5219c6405f3c',2,2,NULL,'[\"*\"]',0,'2018-12-19 23:30:58','2018-12-19 23:30:58','2019-12-19 18:30:58'),('9a11abf594e4926ac6ae96d83aec99fff05c02a197c1d2b974b1b9e94b3907fc3fbc79ae521fa85b',1,2,NULL,'[\"*\"]',0,'2018-12-19 23:30:39','2018-12-19 23:30:39','2019-12-19 18:30:39'),('9f8b0286127fb5a1c41ae20d0742317e624f14900b4e4c94ff3076174debcf5673759c6f1b3656be',1,2,NULL,'[\"*\"]',0,'2018-12-19 12:29:18','2018-12-19 12:29:18','2019-12-19 07:29:18'),('a0c2782d2fbbef6d899c1528e0107d54fd962f19b4c1f6a2069c07f2f1eac777befce8f7ca0b391f',1,2,NULL,'[\"*\"]',0,'2018-12-19 11:42:55','2018-12-19 11:42:55','2019-12-19 06:42:55'),('a3e63ac3677a679effba1e9bb7d8ebe5590387eb31565c758218636ba9dba6335bea1b8746c47f12',2,2,NULL,'[\"*\"]',0,'2018-12-19 21:11:40','2018-12-19 21:11:40','2019-12-19 16:11:40'),('bd542212c19e32db4a80f9442b9b04091bec35faab592ae8b8adf183b6796fa19183ca2926fc26e6',1,2,NULL,'[\"*\"]',0,'2018-12-19 12:55:26','2018-12-19 12:55:26','2019-12-19 07:55:26'),('c0910f41f01c52a269eda2d6ee521e7c2770e51a25cc7698e86866caccafb7a2195cb56f2eac8931',1,2,NULL,'[\"*\"]',0,'2018-12-19 21:04:16','2018-12-19 21:04:16','2019-12-19 16:04:16'),('c86bc296d7e6943be1d399e56719a54fb2ba15f46000e371430f56bb96d7bfab693dc25143d678d0',1,2,NULL,'[\"*\"]',0,'2018-12-20 01:50:58','2018-12-20 01:50:58','2019-12-19 20:50:58'),('dfc0f3ab4df08abc477533745d423ba18228c4d25e3bad168e4ceef50772cbc0058ff82ef48f9225',1,2,NULL,'[\"*\"]',0,'2018-12-19 21:12:37','2018-12-19 21:12:37','2019-12-19 16:12:37'),('e38e85bd1eb2dbf13531ea09389501ed0ea02725a570f6cb5968f348a53dd8f8ed6c1ca1f0b51b37',1,2,NULL,'[\"*\"]',0,'2018-12-19 13:55:35','2018-12-19 13:55:35','2019-12-19 08:55:35'),('e9947ad7467bac05e2052297de71faa1a85fcf5d7159febe72fc688a6a8af15095d087adbbc8cbea',3,2,NULL,'[\"*\"]',0,'2018-12-19 22:41:38','2018-12-19 22:41:38','2019-12-19 17:41:38');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','pTNStBRK4PHrOZJIbOxocE8auvkoOZ8WJ1sHZCBj','http://localhost',1,0,0,'2018-12-19 11:24:46','2018-12-19 11:24:46'),(2,NULL,'Laravel Password Grant Client','fMX0XYhAK4WjrT4CqGewSbXeOUujS0ozfKgWzNCo','http://localhost',0,1,0,'2018-12-19 11:24:46','2018-12-19 11:24:46');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2018-12-19 11:24:46','2018-12-19 11:24:46');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('047b9281202f024bb8bd422502091fbf5a9a7bd77318553222538c1310ffd69e50fd89d8058aff8e','e9947ad7467bac05e2052297de71faa1a85fcf5d7159febe72fc688a6a8af15095d087adbbc8cbea',0,'2019-12-19 17:41:38'),('45c0642c9d78572d60a088e15d7731c0b99ee039691667d8f45c934cc2c9c75242030597817f7d50','c86bc296d7e6943be1d399e56719a54fb2ba15f46000e371430f56bb96d7bfab693dc25143d678d0',0,'2019-12-19 20:50:58'),('767eb81201631daa3a803083807383793937a769e830e4285ee20c6e2d0133dc84e9e152308d599c','a0c2782d2fbbef6d899c1528e0107d54fd962f19b4c1f6a2069c07f2f1eac777befce8f7ca0b391f',0,'2019-12-19 06:42:55'),('806fafb09891cc1f1b5dbd418d9aa31e05a07a00be37641c6ba39f237b8011f50f85eb8250a7d72e','722998639cbd70bacf8032e2723939e7f141422c91bd6fd1b37dbdacebfcebd76a59a37df0a57fbe',0,'2019-12-19 16:32:32'),('80ac1c05983fb2649757d57e8dcf89c30d78eb12423f29eaf8b7754e2860faa3659ae3800a7b03db','9f8b0286127fb5a1c41ae20d0742317e624f14900b4e4c94ff3076174debcf5673759c6f1b3656be',0,'2019-12-19 07:29:18'),('81ef179a441efd5f5ddd71da846f6ab5e213d4a7b462b5bdef15e055832373447b2ed7feb1cb1add','c0910f41f01c52a269eda2d6ee521e7c2770e51a25cc7698e86866caccafb7a2195cb56f2eac8931',0,'2019-12-19 16:04:16'),('906989eebf0d2a5a82a095c2feac3b85a32200f463597c4e61a82450d89d2ca33b43150b071186ab','dfc0f3ab4df08abc477533745d423ba18228c4d25e3bad168e4ceef50772cbc0058ff82ef48f9225',0,'2019-12-19 16:12:37'),('96e94af02736d9cbe69dc59d691120ef3adc62c2345d630ccadb949a8bfbf3832481f3ae1e48762c','e38e85bd1eb2dbf13531ea09389501ed0ea02725a570f6cb5968f348a53dd8f8ed6c1ca1f0b51b37',0,'2019-12-19 08:55:35'),('bf64d4c593ebe9ec44e4a629ef3b813ca1ef6b413f58cf3447fbd5340034a6ff6b1efa443c465025','9a11abf594e4926ac6ae96d83aec99fff05c02a197c1d2b974b1b9e94b3907fc3fbc79ae521fa85b',0,'2019-12-19 18:30:39'),('d205ba0f70e50345c54460f63b05f6817a75d70f26da72a9a305fe9e38be11e38f91eb5005eb780c','8c9908a59865eb4e03c49b27189b14f687abf1af6625e2eab40fe770e66288f12ebe5219c6405f3c',0,'2019-12-19 18:30:58'),('dd28be059b6d0f3c7e3bae6e370faf12b7cf5bf38a9b371e486780d94dc83068cbdc9c5a6d5e950b','bd542212c19e32db4a80f9442b9b04091bec35faab592ae8b8adf183b6796fa19183ca2926fc26e6',0,'2019-12-19 07:55:26'),('e2932aa4b9bd11636dfe72cd7ccf7b96652da84b20596b4ac8e72c791e5ed5bfb6521dca34509692','838f7658387466d92e3a8a3eded657668ed8f89369a521bbd4d412fc55c840b1a6c99179cac5ed1a',0,'2019-12-19 08:42:25'),('fb0971bec771a139866970748b16ddac61ef804c49046316923c19e7a61c16bd17fb200430daac46','a3e63ac3677a679effba1e9bb7d8ebe5590387eb31565c758218636ba9dba6335bea1b8746c47f12',0,'2019-12-19 16:11:40');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT '0',
  `condition` tinyint(1) NOT NULL DEFAULT '0',
  `address` tinyint(1) NOT NULL DEFAULT '0',
  `province` tinyint(1) NOT NULL DEFAULT '0',
  `free` tinyint(1) NOT NULL DEFAULT '0',
  `over18` tinyint(1) NOT NULL DEFAULT '0',
  `returns` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `warranty` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Producto1','producto1',1,10.00,0.00,'Our classic low-top sneaker with Gucci\'s iconic gold embroidered bee against our Web. White leather with green and red Web grosgrain side detail with gold bee embroidery.','Our classic low-top sneaker with Gucci\'s iconic gold embroidered bee against our Web. White leather with green and red Web grosgrain side detail with gold bee embroidery. Red layers snake detail on the back of one shoe and green layers snake detail on the back of the other shoe. Rubber sole. Made in Italy.\n\nSize & Fit\n\nSole height: 2 cm\nHeel: 4.5 cm\n\nComposition & Care\n\nOuter Composition: Leather 100%\nLining Composition: Leather 100%\nSole Composition: Rubber 100%',20,0,1,0,0,1,'Politicas','Garantia',1,1,'2018-12-29 02:34:03','2018-12-29 03:43:25');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commercial_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cci` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(10) unsigned NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'linio-sac','Linio SAC','Linio','123456789','Rafael Berrospi','12345678','12345689','berrospi@gmail.com','Rafael Berrospi','12345789','BCP','12312312312312',1,2,'2018-12-19 22:30:25','2018-12-19 23:14:22'),(3,'tienda-1-sac','Tienda 1 SAC','Tienda 1','12342323','Sara Montaño','123456789','12345698','sara@montanog.com','Sara Montaño','79434343','IBK','12313123123',0,0,'2018-12-19 23:21:00','2018-12-19 23:21:06');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Diego','Diestra','admin',1,'ddiestras@gmail.com',NULL,'990880969',NULL,NULL,'$2y$10$sGuqY/KvqsMUkppFpmWhTu0zLhNB6Ocg1MRkCKrRIPiBGsDvRpk.e',NULL,NULL,NULL),(2,'Rafael','Berrospi','owner',1,'rberrospi@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$3X6YDI2VKJCEHoTNiJ0Qp.r0/6UecjrEpVKyu2ouWFsYu45m58MPS',NULL,'2018-12-19 21:11:40','2018-12-19 23:30:49'),(3,'Usuario 2','Apellido2','user',1,'ddiestras3@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$QS.Hty0rLDsxEa0ov1hUOe8/THLPm8REDBPyNIoRAvD8DA8wX2Oj2',NULL,'2018-12-19 21:32:05','2018-12-19 22:43:29');
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

-- Dump completed on 2018-12-28 19:00:26
