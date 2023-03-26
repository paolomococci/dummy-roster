/*markdown
# Hobby Horse - notebook for pivot table employee_office
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
## I create the pivot table employee_office
*/

DROP TABLE IF EXISTS `employee_office`;
CREATE TABLE `employee_office` (
  `employee_id` BIGINT(20) UNSIGNED NOT NULL,
  `office_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`employee_id`,`office_id`),
  CONSTRAINT `employee_office_to_employees_fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_office_to_offices_fk` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `employee_office`;

/*markdown
### I select all records in table employee_office
*/

SELECT * FROM `employee_office`;

/*markdown
### I delete all records in table employee_office
*/

DELETE FROM `employee_office`;