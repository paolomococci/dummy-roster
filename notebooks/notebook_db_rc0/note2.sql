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
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(48) DEFAULT NULL,
  `phone` VARCHAR(24) DEFAULT NULL,
  `fax` VARCHAR(24) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_credential_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `credentials`;

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(16) NOT NULL,
  `surname` VARCHAR(16) NOT NULL,
  `nickname` VARCHAR(16) DEFAULT NULL,
  `username` VARCHAR(32) DEFAULT NULL,
  `birth_date` DATETIME DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `picture` blob DEFAULT NULL,
  `role` VARCHAR(32) DEFAULT NULL,
  `belonging` VARCHAR(8) DEFAULT NULL,
  `loc` BIGINT(20) UNSIGNED NULL,
  `ref` BIGINT(20) UNSIGNED NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_employee_address` (`loc`),
  KEY `fk_employee_credential` (`ref`),
  KEY `idx_employee_name` (`name`),
  CONSTRAINT `fk_employee_address` FOREIGN KEY (`loc`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_employee_credential` FOREIGN KEY (`ref`) REFERENCES `credentials` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `employees`;

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

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
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
  KEY `fk_customer_employee` (`contact`),
  KEY `fk_customer_address` (`loc`),
  KEY `fk_customer_credential` (`ref`),
  KEY `idx_customer_name` (`name`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`loc`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_customer_credential` FOREIGN KEY (`ref`) REFERENCES `credentials` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_customer_employee` FOREIGN KEY (`contact`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `customers`;

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `foundation_date` DATETIME DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `picture` blob DEFAULT NULL,
  `belonging` VARCHAR(8) DEFAULT NULL,
  `contact` BIGINT(20) unsigned NULL,
  `loc` BIGINT(20) unsigned NULL,
  `ref` BIGINT(20) unsigned NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_supplier_address` FOREIGN KEY (`loc`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_supplier_credential` FOREIGN KEY (`ref`) REFERENCES `credentials` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_supplier_employee` FOREIGN KEY (`contact`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `suppliers`;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `belonging` VARCHAR(8) DEFAULT NULL,
  `picture` blob DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `categories`;