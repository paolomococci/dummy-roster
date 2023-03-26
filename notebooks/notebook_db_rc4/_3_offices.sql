/*markdown
# Hobby Horse - notebook for table offices
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
## I create the table offices
*/

DROP TABLE IF EXISTS `offices`;
CREATE TABLE `offices` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `email_uc` UNIQUE (`email`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `offices`;

/*markdown
### I select all records in table offices
*/

SELECT * FROM `offices` ORDER BY `email`;

/*markdown
## Now I select each office showing all the employees working there
*/

/*markdown
### using the 'INNER JOIN' statement
*/

SELECT 
    o.name AS office_names, o.email AS office_emails, o.description AS office_descriptions,
    e.name AS employee_names, e.email AS employee_emails, e.salary AS employee_salaries
FROM employee_office eo 
INNER JOIN offices o ON eo.office_id = o.id 
INNER JOIN employees e ON eo.employee_id = e.id 
ORDER BY e.salary DESC;

/*markdown
## How many employees does each office count?
*/

SELECT o.name AS office_names, count(e.id) AS number_of_employees_in_each_office
FROM employee_office eo 
INNER JOIN offices o ON eo.office_id = o.id 
INNER JOIN employees e ON eo.employee_id = e.id 
GROUP BY o.name;