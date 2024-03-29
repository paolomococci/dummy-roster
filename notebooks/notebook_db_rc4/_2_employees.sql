/*markdown
# Hobby Horse - notebook for table employees
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
## I create the table employees
*/

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `hired` DATE DEFAULT NULL,
  `salary` DECIMAL(10,2) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `email_uc` UNIQUE (`email`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `employees`;

/*markdown
### I select all records in table employees
*/

SELECT * FROM `employees` ORDER BY `email`;

/*markdown
## Now I select each employee by showing the office they belong to
*/

/*markdown
### using the 'INNER JOIN' statement
*/

SELECT 
    e.name AS e_name, e.salary, 
    o.name AS o_name
FROM employee_office eo 
INNER JOIN offices o ON eo.office_id = o.id 
INNER JOIN employees e ON eo.employee_id = e.id 
ORDER BY e.salary DESC;