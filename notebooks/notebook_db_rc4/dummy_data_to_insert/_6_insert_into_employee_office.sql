/*markdown
# employee_office - dummy data entry
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
### I select all records in table offices
*/

SELECT * FROM `offices` ORDER BY `email`;

/*markdown
### I select all records in table employees
*/

SELECT * FROM `employees` ORDER BY `email`;