# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: tienda
# Generation Time: 2019-01-13 18:03:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `slug`, `parent`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'Ropa','ropa',NULL,'categories/ropa.jpeg','2018-12-19 15:29:30','2018-12-19 15:29:30'),
	(2,'Carteras','carteras',NULL,'categories/carteras.jpeg','2018-12-19 15:36:40','2018-12-19 15:43:56'),
	(4,'Accesorios','accesorios',NULL,'categories/accesorios.jpeg','2018-12-19 15:44:19','2019-01-03 22:31:43');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(6,'2016_06_01_000004_create_oauth_clients_table',1),
	(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(8,'2018_12_19_122002_create_categories_table',2),
	(9,'2018_12_19_122006_create_stores_table',2),
	(10,'2018_12_26_203859_create_products_table',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

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

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('065939055227fe5bfefab89aea07c7e4ea8dc105ad5dcf659439be3041af88b7990fc24066cb820c',2,2,NULL,'[\"*\"]',0,'2019-01-13 17:46:01','2019-01-13 17:46:01','2020-01-13 17:46:01'),
	('624c6d45f550b19df344a706783808da567c4e62216b8630c1e628dba70966d08ef765f3c8538bba',1,2,NULL,'[\"*\"]',0,'2019-01-13 14:10:59','2019-01-13 14:10:59','2020-01-13 14:10:59'),
	('722998639cbd70bacf8032e2723939e7f141422c91bd6fd1b37dbdacebfcebd76a59a37df0a57fbe',3,2,NULL,'[\"*\"]',0,'2018-12-19 16:32:32','2018-12-19 16:32:32','2019-12-19 16:32:32'),
	('838f7658387466d92e3a8a3eded657668ed8f89369a521bbd4d412fc55c840b1a6c99179cac5ed1a',1,2,NULL,'[\"*\"]',0,'2018-12-19 08:42:25','2018-12-19 08:42:25','2019-12-19 08:42:25'),
	('83c941e567885edb5a60067015759372597592a54aef6c157dcd4b918c8e2be06370b9b54b3d8c33',1,2,NULL,'[\"*\"]',0,'2019-01-13 17:55:33','2019-01-13 17:55:33','2020-01-13 17:55:33'),
	('85c71d335bc9a8e29e61a00d668ed0701a46bd6c1557b26a52a11be27d1029fe9f196814e4ae4d94',2,2,NULL,'[\"*\"]',0,'2019-01-13 17:56:11','2019-01-13 17:56:11','2020-01-13 17:56:11'),
	('8c9908a59865eb4e03c49b27189b14f687abf1af6625e2eab40fe770e66288f12ebe5219c6405f3c',2,2,NULL,'[\"*\"]',0,'2018-12-19 18:30:58','2018-12-19 18:30:58','2019-12-19 18:30:58'),
	('960ac72a4a0b01c88bab36f2e68437e679fe03098f3943a1f13cee791781bb2aa9f0f4895199a116',1,2,NULL,'[\"*\"]',0,'2019-01-13 03:06:30','2019-01-13 03:06:30','2020-01-13 03:06:30'),
	('9a11abf594e4926ac6ae96d83aec99fff05c02a197c1d2b974b1b9e94b3907fc3fbc79ae521fa85b',1,2,NULL,'[\"*\"]',0,'2018-12-19 18:30:39','2018-12-19 18:30:39','2019-12-19 18:30:39'),
	('9f8b0286127fb5a1c41ae20d0742317e624f14900b4e4c94ff3076174debcf5673759c6f1b3656be',1,2,NULL,'[\"*\"]',0,'2018-12-19 07:29:18','2018-12-19 07:29:18','2019-12-19 07:29:18'),
	('a0c2782d2fbbef6d899c1528e0107d54fd962f19b4c1f6a2069c07f2f1eac777befce8f7ca0b391f',1,2,NULL,'[\"*\"]',0,'2018-12-19 06:42:55','2018-12-19 06:42:55','2019-12-19 06:42:55'),
	('a3e63ac3677a679effba1e9bb7d8ebe5590387eb31565c758218636ba9dba6335bea1b8746c47f12',2,2,NULL,'[\"*\"]',0,'2018-12-19 16:11:40','2018-12-19 16:11:40','2019-12-19 16:11:40'),
	('b0963b56eda9f84fcba7120628619e17acb2c1a734d357b48f9f44925423d0fcf36cbcb0b47766b6',1,2,NULL,'[\"*\"]',0,'2019-01-02 17:14:03','2019-01-02 17:14:03','2020-01-02 17:14:03'),
	('b3e30e0f7ac0e2c4831883c7fbbd510fc4782797a834795efd23d09c754c6bf9f1246beff0845322',1,2,NULL,'[\"*\"]',0,'2019-01-13 18:01:36','2019-01-13 18:01:36','2020-01-13 18:01:36'),
	('bd542212c19e32db4a80f9442b9b04091bec35faab592ae8b8adf183b6796fa19183ca2926fc26e6',1,2,NULL,'[\"*\"]',0,'2018-12-19 07:55:26','2018-12-19 07:55:26','2019-12-19 07:55:26'),
	('c0910f41f01c52a269eda2d6ee521e7c2770e51a25cc7698e86866caccafb7a2195cb56f2eac8931',1,2,NULL,'[\"*\"]',0,'2018-12-19 16:04:16','2018-12-19 16:04:16','2019-12-19 16:04:16'),
	('c5c39334fd6b29883295fed5ed0fd96ba5fb95e7ecfba013bbcf7e8873f0a92c76ef92a2be6e0281',1,2,NULL,'[\"*\"]',0,'2019-01-13 03:05:24','2019-01-13 03:05:24','2020-01-13 03:05:24'),
	('c86bc296d7e6943be1d399e56719a54fb2ba15f46000e371430f56bb96d7bfab693dc25143d678d0',1,2,NULL,'[\"*\"]',0,'2018-12-19 20:50:58','2018-12-19 20:50:58','2019-12-19 20:50:58'),
	('dfc0f3ab4df08abc477533745d423ba18228c4d25e3bad168e4ceef50772cbc0058ff82ef48f9225',1,2,NULL,'[\"*\"]',0,'2018-12-19 16:12:37','2018-12-19 16:12:37','2019-12-19 16:12:37'),
	('e38e85bd1eb2dbf13531ea09389501ed0ea02725a570f6cb5968f348a53dd8f8ed6c1ca1f0b51b37',1,2,NULL,'[\"*\"]',0,'2018-12-19 08:55:35','2018-12-19 08:55:35','2019-12-19 08:55:35'),
	('e9947ad7467bac05e2052297de71faa1a85fcf5d7159febe72fc688a6a8af15095d087adbbc8cbea',3,2,NULL,'[\"*\"]',0,'2018-12-19 17:41:38','2018-12-19 17:41:38','2019-12-19 17:41:38'),
	('e9c86b1af15fdac208b6be26b35b613f7ca464e233a0eb8d93307f75d80f4fdda995beb7ba76b24b',1,2,NULL,'[\"*\"]',0,'2019-01-13 03:06:44','2019-01-13 03:06:44','2020-01-13 03:06:44'),
	('f8ae00b5ad5a4838fe508350c9e23656848e697e33cfd48400720fb24f0c5e827040eae2d23d21fa',1,2,NULL,'[\"*\"]',0,'2019-01-13 17:55:50','2019-01-13 17:55:50','2020-01-13 17:55:50');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Laravel Personal Access Client','pTNStBRK4PHrOZJIbOxocE8auvkoOZ8WJ1sHZCBj','http://localhost',1,0,0,'2018-12-19 06:24:46','2018-12-19 06:24:46'),
	(2,NULL,'Laravel Password Grant Client','fMX0XYhAK4WjrT4CqGewSbXeOUujS0ozfKgWzNCo','http://localhost',0,1,0,'2018-12-19 06:24:46','2018-12-19 06:24:46');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2018-12-19 06:24:46','2018-12-19 06:24:46');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`)
VALUES
	('047b9281202f024bb8bd422502091fbf5a9a7bd77318553222538c1310ffd69e50fd89d8058aff8e','e9947ad7467bac05e2052297de71faa1a85fcf5d7159febe72fc688a6a8af15095d087adbbc8cbea',0,'2019-12-19 17:41:38'),
	('079171c6d4fac1a43db1caa4947bcca72579f2d3bb86204e3c9bbdd68e5b097d8f3145287afd736d','b0963b56eda9f84fcba7120628619e17acb2c1a734d357b48f9f44925423d0fcf36cbcb0b47766b6',0,'2020-01-02 17:14:03'),
	('2052fca600789f6206f7929e8ea6466f9badff37544429c0793442cb2deb4314ce55b8add37ac214','065939055227fe5bfefab89aea07c7e4ea8dc105ad5dcf659439be3041af88b7990fc24066cb820c',0,'2020-01-13 17:46:01'),
	('2e6c38c3e6591e9c721dcc5cff913b250c42301331b71302c96310a0d65e6d882e28cc5ea467f5f2','f8ae00b5ad5a4838fe508350c9e23656848e697e33cfd48400720fb24f0c5e827040eae2d23d21fa',0,'2020-01-13 17:55:50'),
	('3e6aa8d34916c23ecb16ddcfc95ed64b0dbb857137594db32d7064f0bd69008cfea74119e32b2d41','e9c86b1af15fdac208b6be26b35b613f7ca464e233a0eb8d93307f75d80f4fdda995beb7ba76b24b',0,'2020-01-13 03:06:44'),
	('3f2202eb36a7d6fc1c4bca8edb3f3305717c0aa974604e78ec0d79e330156aee25f3b17f852aa829','85c71d335bc9a8e29e61a00d668ed0701a46bd6c1557b26a52a11be27d1029fe9f196814e4ae4d94',0,'2020-01-13 17:56:11'),
	('45c0642c9d78572d60a088e15d7731c0b99ee039691667d8f45c934cc2c9c75242030597817f7d50','c86bc296d7e6943be1d399e56719a54fb2ba15f46000e371430f56bb96d7bfab693dc25143d678d0',0,'2019-12-19 20:50:58'),
	('5431f14bc9642d1339d1b02378f67e0a2ae9a4d6e7e61c58d0f604676d26e2c5383a2b7877cd18ec','960ac72a4a0b01c88bab36f2e68437e679fe03098f3943a1f13cee791781bb2aa9f0f4895199a116',0,'2020-01-13 03:06:30'),
	('5f696cf9b5284a03631687db009cae729cdd314ba88fcf780c8a7ca187a36b57ea23f6899db9afec','83c941e567885edb5a60067015759372597592a54aef6c157dcd4b918c8e2be06370b9b54b3d8c33',0,'2020-01-13 17:55:33'),
	('767eb81201631daa3a803083807383793937a769e830e4285ee20c6e2d0133dc84e9e152308d599c','a0c2782d2fbbef6d899c1528e0107d54fd962f19b4c1f6a2069c07f2f1eac777befce8f7ca0b391f',0,'2019-12-19 06:42:55'),
	('806fafb09891cc1f1b5dbd418d9aa31e05a07a00be37641c6ba39f237b8011f50f85eb8250a7d72e','722998639cbd70bacf8032e2723939e7f141422c91bd6fd1b37dbdacebfcebd76a59a37df0a57fbe',0,'2019-12-19 16:32:32'),
	('80ac1c05983fb2649757d57e8dcf89c30d78eb12423f29eaf8b7754e2860faa3659ae3800a7b03db','9f8b0286127fb5a1c41ae20d0742317e624f14900b4e4c94ff3076174debcf5673759c6f1b3656be',0,'2019-12-19 07:29:18'),
	('81ef179a441efd5f5ddd71da846f6ab5e213d4a7b462b5bdef15e055832373447b2ed7feb1cb1add','c0910f41f01c52a269eda2d6ee521e7c2770e51a25cc7698e86866caccafb7a2195cb56f2eac8931',0,'2019-12-19 16:04:16'),
	('8c0a62b48c4c79ad7388058e23b0ce466e80d3c9039c3f8dd489823b8171181fcefe603f50cb793e','624c6d45f550b19df344a706783808da567c4e62216b8630c1e628dba70966d08ef765f3c8538bba',0,'2020-01-13 14:10:59'),
	('906989eebf0d2a5a82a095c2feac3b85a32200f463597c4e61a82450d89d2ca33b43150b071186ab','dfc0f3ab4df08abc477533745d423ba18228c4d25e3bad168e4ceef50772cbc0058ff82ef48f9225',0,'2019-12-19 16:12:37'),
	('96e94af02736d9cbe69dc59d691120ef3adc62c2345d630ccadb949a8bfbf3832481f3ae1e48762c','e38e85bd1eb2dbf13531ea09389501ed0ea02725a570f6cb5968f348a53dd8f8ed6c1ca1f0b51b37',0,'2019-12-19 08:55:35'),
	('b038da00af37123e679744129b76362b3b5c98d53628c6bdbc324cf8fb8e782cf18dbd438650fa8e','b3e30e0f7ac0e2c4831883c7fbbd510fc4782797a834795efd23d09c754c6bf9f1246beff0845322',0,'2020-01-13 18:01:36'),
	('bf64d4c593ebe9ec44e4a629ef3b813ca1ef6b413f58cf3447fbd5340034a6ff6b1efa443c465025','9a11abf594e4926ac6ae96d83aec99fff05c02a197c1d2b974b1b9e94b3907fc3fbc79ae521fa85b',0,'2019-12-19 18:30:39'),
	('d205ba0f70e50345c54460f63b05f6817a75d70f26da72a9a305fe9e38be11e38f91eb5005eb780c','8c9908a59865eb4e03c49b27189b14f687abf1af6625e2eab40fe770e66288f12ebe5219c6405f3c',0,'2019-12-19 18:30:58'),
	('dd28be059b6d0f3c7e3bae6e370faf12b7cf5bf38a9b371e486780d94dc83068cbdc9c5a6d5e950b','bd542212c19e32db4a80f9442b9b04091bec35faab592ae8b8adf183b6796fa19183ca2926fc26e6',0,'2019-12-19 07:55:26'),
	('e2932aa4b9bd11636dfe72cd7ccf7b96652da84b20596b4ac8e72c791e5ed5bfb6521dca34509692','838f7658387466d92e3a8a3eded657668ed8f89369a521bbd4d412fc55c840b1a6c99179cac5ed1a',0,'2019-12-19 08:42:25'),
	('f42816877163ef92bdf6fbe9d0b2caaaee66e14ca8823514aff52e6c735a714db6ec3ac77e242bb3','c5c39334fd6b29883295fed5ed0fd96ba5fb95e7ecfba013bbcf7e8873f0a92c76ef92a2be6e0281',0,'2020-01-13 03:05:24'),
	('fb0971bec771a139866970748b16ddac61ef804c49046316923c19e7a61c16bd17fb200430daac46','a3e63ac3677a679effba1e9bb7d8ebe5590387eb31565c758218636ba9dba6335bea1b8746c47f12',0,'2019-12-19 16:11:40');

/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `returns` text COLLATE utf8mb4_unicode_ci,
  `warranty` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `image`, `name`, `slug`, `category_id`, `price`, `discount`, `summary`, `body`, `stock`, `condition`, `address`, `province`, `free`, `over18`, `returns`, `warranty`, `status`, `approved`, `created_at`, `updated_at`, `variations`, `store_id`)
VALUES
	(1,'products/producto1.jpeg','Producto1','producto1',1,10.00,0.00,'Our classic low-top sneaker with Gucci\'s iconic gold embroidered bee against our Web. White leather with green and red Web grosgrain side detail with gold bee embroidery.','Our classic low-top sneaker with Gucci\'s iconic gold embroidered bee against our Web. White leather with green and red Web grosgrain side detail with gold bee embroidery. Red layers snake detail on the back of one shoe and green layers snake detail on the back of the other shoe. Rubber sole. Made in Italy.\n\nSize & Fit\n\nSole height: 2 cm\nHeel: 4.5 cm\n\nComposition & Care\n\nOuter Composition: Leather 100%\nLining Composition: Leather 100%\nSole Composition: Rubber 100%',20,0,1,0,0,1,'Politicas','Garantia',1,1,'2018-12-28 21:34:03','2019-01-13 17:08:47','[{\"model\":\"Talla L\",\"color\":\"Rojo\",\"gender\":\"Hombre\",\"stock\":\"35\",\"index\":\"0\",\"image\":\"variations\\/producto1-1.png\"},{\"model\":\"Talla XL\",\"color\":\"Azul\",\"gender\":\"Unisex\",\"stock\":\"27\",\"image\":\"variations\\/producto1-1.jpeg\"}]',0),
	(3,'products/producto-de-proveedo.jpeg','Producto de Proveedo','producto-de-proveedo',1,20.00,0.00,'Resumen','Detlla',290,1,0,0,0,0,NULL,NULL,1,1,'2019-01-13 17:54:14','2019-01-13 17:55:40','[]',1);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stores`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;

INSERT INTO `stores` (`id`, `slug`, `name`, `commercial_name`, `ruc`, `contact`, `phone`, `mobile`, `email`, `person`, `dni`, `bank`, `cci`, `status`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,'linio-sac','Linio SAC','Linio','123456789','Rafael Berrospi','12345678','12345689','berrospi@gmail.com','Rafael Berrospi','12345789','BCP','12312312312312',0,2,'2018-12-19 17:30:25','2019-01-13 14:34:42'),
	(3,'tienda-1-sac','Tienda 1 SAC','Tienda 1','12342323','Sara Montaño','123456789','12345698','sara@montanog.com','Sara Montaño','79434343','IBK','12313123123',0,0,'2018-12-19 18:21:00','2018-12-19 18:21:06'),
	(4,'razon-social','Razon Social','NOmbre Comercial','70433354','Persona de Contacto','12345678','12345678','ddiestras67@gmail.com','Persona Responsable','1234567','BCP','23232323223',0,0,'2019-01-13 14:13:30','2019-01-13 14:13:30');

/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `lastname`, `role`, `status`, `email`, `phone`, `mobile`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Diego','Diestra','admin',1,'ddiestras@gmail.com',NULL,'990880969',NULL,NULL,'$2y$10$sGuqY/KvqsMUkppFpmWhTu0zLhNB6Ocg1MRkCKrRIPiBGsDvRpk.e',NULL,NULL,NULL),
	(2,'Rafael','Berrospi','owner',1,'rberrospi@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$ow.BOXf/f4hZIyat54YJr.3B4BBIrqVc5GpD0uv5ur5feha8fZLka',NULL,'2018-12-19 16:11:40','2019-01-13 17:45:42'),
	(3,'Usuario 2','Apellido2','user',1,'ddiestras3@gmail.com',NULL,NULL,NULL,NULL,'$2y$10$QS.Hty0rLDsxEa0ov1hUOe8/THLPm8REDBPyNIoRAvD8DA8wX2Oj2',NULL,'2018-12-19 16:32:05','2018-12-19 17:43:29'),
	(4,'Usuario3','Apellido 3','user',1,'ddiestra43@gmail.com',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
