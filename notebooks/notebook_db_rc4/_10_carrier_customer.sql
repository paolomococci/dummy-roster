/*markdown
# Hobby Horse - notebook for pivot table carrier_customer
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
## I create the pivot table carrier_customer
*/

DROP TABLE IF EXISTS `carrier_customer`;
CREATE TABLE `carrier_customer` (
  `carrier_id` BIGINT(20) UNSIGNED NOT NULL,
  `customer_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`carrier_id`,`customer_id`),
  CONSTRAINT `carrier_customer_to_carriers_fk` FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`),
  CONSTRAINT `carrier_customer_to_customers_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `carrier_customer`;