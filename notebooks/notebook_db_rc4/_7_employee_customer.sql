/*markdown
# Hobby Horse - notebook for pivot table employee_customer
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
## I create the pivot table employee_customer
*/

DROP TABLE IF EXISTS `employee_customer`;
CREATE TABLE `employee_customer` (
  `employee_id` BIGINT(20) UNSIGNED NOT NULL,
  `customer_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`employee_id`,`customer_id`),
  CONSTRAINT `employee_customer_to_employees_fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `employee_customer_to_customers_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;