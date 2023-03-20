SHOW DATABASES;

USE `notebook_db_rc0`;

SHOW TABLES;

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `civic` varchar(16) DEFAULT NULL,
  `city` varchar(16) DEFAULT NULL,
  `district` varchar(16) DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  `country` varchar(16) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_address_name` (`name`),
  KEY `idx_address_city` (`city`),
  KEY `idx_address_district` (`district`),
  KEY `idx_address_postcode` (`postcode`),
  KEY `idx_address_country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;