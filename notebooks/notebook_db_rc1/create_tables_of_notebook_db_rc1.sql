/*markdown
# create the tables of a hypothetical movie store
*/

/*markdown
## preliminary commands
*/

SHOW DATABASES;

USE `notebook_db_rc1`;

SHOW TABLES;

/*markdown
## I create the table categories
*/

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of table categories
*/

DESCRIBE `categories`;

/*markdown
## I create the table contents
*/

DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(255) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of table contents
*/

DESCRIBE `contents`;

/*markdown
## I create the table iso3166
*/

DROP TABLE IF EXISTS `iso3166`;
CREATE TABLE `iso3166` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `code` INT(11) NOT NULL,
  `signature` VARCHAR(3) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UN` (`code`),
  UNIQUE KEY `signature_UN` (`signature`),
  FULLTEXT KEY `iso3166_signature_IDX` (`signature`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of table iso3166
*/

DESCRIBE `iso3166`;

/*markdown
## I create the table languages
*/

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
## I create the table players
*/

DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(100) NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of table languages
*/

DESCRIBE `languages`;

/*markdown
## I create the table countries
*/

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `iso3166_id` BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_to_iso3166_fk` (`iso3166_id`),
  CONSTRAINT `country_to_iso3166_fk` FOREIGN KEY (`iso3166_id`) REFERENCES `iso3166` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of table countries
*/

DESCRIBE `countries`;

/*markdown
## I create the table cities
*/

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_to_country_fk` (`country_fk`),
  CONSTRAINT `city_to_country_fk` FOREIGN KEY (`country_fk`) REFERENCES `countries` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of table cities
*/

DESCRIBE `cities`;

/*markdown
## I create the table districts
*/

DROP TABLE IF EXISTS `districts`;
CREATE TABLE `districts` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `code` VARCHAR(6) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `city_fk` BIGINT(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `district_to_city_fk` (`city_fk`),
  CONSTRAINT `district_to_city_fk` FOREIGN KEY (`city_fk`) REFERENCES `cities` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of the table districts
*/

DESCRIBE `districts`;

/*markdown
## I create the table addresses
*/

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `civic` VARCHAR(10) NOT NULL,
  `phone` VARCHAR(25) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` VARCHAR(255) DEFAULT NULL,
  `district_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_to_district_fk` (`district_fk`),
  CONSTRAINT `address_to_district_fk` FOREIGN KEY (`district_fk`) REFERENCES `districts` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of the table addresses
*/

DESCRIBE `addresses`;

/*markdown
## I create the table movies
*/

DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `subtitle` VARCHAR(100) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `preview` DATE NOT NULL,
  `duration` time NOT NULL,
  `cost` DECIMAL(10,2) NOT NULL,
  `rent` DECIMAL(10,2) NOT NULL,
  `rating` DECIMAL(10,2) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `language_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_to_language_fk` (`language_fk`),
  FULLTEXT KEY `movie_title_IDX` (`title`,`subtitle`),
  CONSTRAINT `movie_to_language_fk` FOREIGN KEY (`language_fk`) REFERENCES `languages` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of the table movies
*/

DESCRIBE `movies`;

/*markdown
## I create the table stores
*/

DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_name_IDX` (`name`) USING BTREE,
  KEY `store_to_address_fk` (`address_fk`),
  CONSTRAINT `store_to_address_fk` FOREIGN KEY (`address_fk`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of the table stores
*/

DESCRIBE `stores`;

/*markdown
## I create the table human_resources
*/

DROP TABLE IF EXISTS `human_resources`;
CREATE TABLE `human_resources` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(100) DEFAULT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `picture` blob DEFAULT NULL,
  `phone` VARCHAR(20) DEFAULT NULL,
  `mobile` VARCHAR(20) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  `store_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `human_resource_to_address_fk` (`address_fk`),
  KEY `human_resource_to_store_fk` (`store_fk`),
  CONSTRAINT `human_resource_to_address_fk` FOREIGN KEY (`address_fk`) REFERENCES `addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `human_resource_to_store_fk` FOREIGN KEY (`store_fk`) REFERENCES `stores` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of table human_resources
*/

DESCRIBE `human_resources`;

/*markdown
## I create the table inventories
*/

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE `inventories` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `store_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  `movie_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_to_store_fk` (`store_fk`),
  KEY `inventory_to_movie_fk` (`movie_fk`),
  CONSTRAINT `inventory_to_store_fk` FOREIGN KEY (`store_fk`) REFERENCES `stores` (`id`) ON DELETE SET NULL,
  CONSTRAINT `inventory_to_movie_fk` FOREIGN KEY (`movie_fk`) REFERENCES `movies` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of table inventories
*/

DESCRIBE `inventories`;

/*markdown
## I create the table customers
*/

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(100) DEFAULT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) DEFAULT NULL,
  `mobile` VARCHAR(20) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `birthday` DATE NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  `store_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_to_address_fk` (`address_fk`),
  KEY `customer_to_store_fk` (`store_fk`),
  CONSTRAINT `customer_to_address_fk` FOREIGN KEY (`address_fk`) REFERENCES `addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `customer_to_store_fk` FOREIGN KEY (`store_fk`) REFERENCES `stores` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of table customers
*/

DESCRIBE `customers`;

/*markdown
## I create the table rentals
*/

DROP TABLE IF EXISTS `rentals`;
CREATE TABLE `rentals` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rent` DATE NOT NULL,
  `back` DATE NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `inventory_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  `customer_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  `human_resource_fk` BIGINT(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rental_to_inventory_fk` (`inventory_fk`),
  KEY `rental_to_customer_fk` (`customer_fk`),
  KEY `rental_to_human_resource_fk` (`human_resource_fk`),
  CONSTRAINT `rental_to_customer_fk` FOREIGN KEY (`customer_fk`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `rental_to_inventory_fk` FOREIGN KEY (`inventory_fk`) REFERENCES `inventories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `rental_to_human_resource_fk` FOREIGN KEY (`human_resource_fk`) REFERENCES `human_resources` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;