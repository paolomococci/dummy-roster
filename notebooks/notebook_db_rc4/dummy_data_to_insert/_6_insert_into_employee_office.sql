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

SELECT * FROM `offices` ORDER BY `id`;

/*markdown
### I select all records in table employees
*/

SELECT * FROM `employees` ORDER BY `salary` DESC;

/*markdown
## I add the references that connect each employee to their office
*/

INSERT INTO `employee_office` (`employee_id`, `office_id`)
VALUES (
        
    );