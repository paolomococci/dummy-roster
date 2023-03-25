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
    );