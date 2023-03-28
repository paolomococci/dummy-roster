/*markdown
# offices - dummy data entry
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
## I insert some data in the table offices
*/

INSERT INTO `offices` (`name`, `email`, `description`)
VALUES (
        'management', 'management@example.local', 'some description of management office'
    ), (
        'human resources', 'human.resources@example.local', 'some description of human resources office'
    ), (
        'research and development', 'research.development@example.local', 'some description of research and development office'
    ), (
        'purchases', 'purchases@example.local', 'some description of purchases office'
    ), (
        'shipments', 'shipments@example.local', 'some description of shipments office'
    ), (
        'marketing', 'marketing@example.local', 'some description of marketing office'
    );

/*markdown
### I clear table offices of all previously entered data
*/

DELETE FROM `offices`;