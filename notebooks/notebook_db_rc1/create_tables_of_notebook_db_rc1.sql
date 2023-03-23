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