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
  CONSTRAINT `address_to_district_fk` FOREIGN KEY (`district_fk`) REFERENCES `district` (`id`) ON DELETE SET NULL
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*markdown
### I check the structure of the table addresses
*/

DESCRIBE `addresses`;