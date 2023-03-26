/*markdown
# employees - dummy data entry
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
## I insert some data in the table employees
*/

INSERT INTO `employees` (`name`, `email`, `hired`, `salary`)
VALUES (
        'John Doe', 'john.doe@example.local', '2021-10-12', 1350.00
    ), (
        'Jane Doe', 'jane.doe@example.local', '2019-05-05', 1450.00
    ), (
        'Johnny Doe', 'johnny.doe@example.local', '2022-06-20', 1290.00
    ), (
        '', '@example.local', ''
    ), (
        '', '@example.local', ''
    ), (
        '', '@example.local', ''
    ), (
        '', '@example.local', ''
    ), (
        '', '@example.local', ''
    ), (
        '', '@example.local', ''
    ), (
        '', '@example.local', ''
    );

/*markdown
### I clear table employees of all previously entered data
*/

DELETE FROM `employees`;