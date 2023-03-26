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
        19, 7
    ), (
        15, 7
    ), (
        17, 8
    ), (
        23, 9
    ), (
        16, 9
    ), (
        22, 9
    ), (
        18, 10
    ), (
        16, 10
    ), (
        20, 11
    ), (
        21, 11
    ), (
        24, 12
    ), (
        25, 12
    ), (
        21, 12
    );