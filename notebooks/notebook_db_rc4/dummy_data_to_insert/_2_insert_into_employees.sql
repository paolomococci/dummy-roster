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
        'Janie Doe', 'janie.doe@example.local', '2020-03-07', 1360.00
    ), (
        'Joe Bloggs', 'joe.bloggs@example.local', '2020-04-19', 1670.00
    ), (
        'John Smith', 'john.smith@example.local', '2021-01-12', 1750.00
    ), (
        'Baby Doe', 'baby.doe@example.local', '2022-05-12', 1650.00
    ), (
        'Fred Bloggs', 'fred.bloggs@example.local', '2021-12-20',1450.00
    ), (
        'Bill Taylor', 'bill.taylor@example.local', '2020-11-19', 1680.00
    ), (
        'Joe Average', 'joe.average@example.local', '2021-10-10', 1700.00
    ), (
        'Richard Roe', 'richard.roe@example.local', '2019-10-09', 1600.00
    ), (
        'Joe Citizen', 'joe.citizen@example.local', '2020-10-20', 1500.00
    );

/*markdown
### I clear table employees of all previously entered data
*/

DELETE FROM `employees`;