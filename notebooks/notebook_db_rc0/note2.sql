SHOW DATABASES;

USE `notebook_db_rc0`;

SHOW TABLES;

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) DEFAULT NULL,
  `civic` VARCHAR(16) DEFAULT NULL,
  `city` VARCHAR(16) DEFAULT NULL,
  `district` VARCHAR(16) DEFAULT NULL,
  `postcode` VARCHAR(8) DEFAULT NULL,
  `country` VARCHAR(16) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_address_name` (`name`),
  KEY `idx_address_city` (`city`),
  KEY `idx_address_district` (`district`),
  KEY `idx_address_postcode` (`postcode`),
  KEY `idx_address_country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `addresses`;

DROP TABLE IF EXISTS `credentials`;
CREATE TABLE `credentials` (
  `id` BIGINT(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(48) DEFAULT NULL,
  `phone` VARCHAR(24) DEFAULT NULL,
  `fax` VARCHAR(24) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_credential_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `carriers`;
CREATE TABLE `carriers` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `foundation_date` DATETIME DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `picture` blob DEFAULT NULL,
  `belonging` VARCHAR(8) DEFAULT NULL,
  `contact` BIGINT(20) UNSIGNED NULL,
  `loc` BIGINT(20) UNSIGNED NULL,
  `ref` BIGINT(20) UNSIGNED NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_carrier_employee` (`contact`),
  KEY `fk_carrier_address` (`loc`),
  KEY `fk_carrier_credential` (`ref`),
  KEY `idx_carrier_name` (`name`),
  CONSTRAINT `fk_carrier_address` FOREIGN KEY (`loc`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_carrier_credential` FOREIGN KEY (`ref`) REFERENCES `credentials` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_carrier_employee` FOREIGN KEY (`contact`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `carriers`;