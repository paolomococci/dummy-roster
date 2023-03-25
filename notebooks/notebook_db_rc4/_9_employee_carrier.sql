/*markdown
# Hobby Horse - notebook for pivot table employee_carrier
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
## I create the pivot table employee_carrier
*/

DROP TABLE IF EXISTS `employee_carrier`;
CREATE TABLE `employee_carrier` (
  `employee_id` BIGINT(20) UNSIGNED NOT NULL,
  `carrier_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`employee_id`,`carrier_id`),
  CONSTRAINT `employee_carrier_to_employees_fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `employee_carrier_to_carriers_fk` FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `employee_carrier`;