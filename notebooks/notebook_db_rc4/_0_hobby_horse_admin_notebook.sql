/*markdown
# Hobby Horse - admin notebook
*/

/*markdown
## select use the database notebook_db_rc4
*/

USE `notebook_db_rc1`;
SHOW TABLES;

SET FOREIGN_KEY_CHECKS = 0;
SET @tables = NULL;
SET GROUP_CONCAT_MAX_LEN = 32768;

/*markdown
### proceed with cleaning up the entire database
*/

SELECT GROUP_CONCAT('`', table_schema, '`.`', table_name, '`') INTO @tables
FROM information_schema.tables
WHERE table_schema = (
        SELECT DATABASE()
    );
SELECT IFNULL(@tables, '') INTO @tables;
SET @tables = CONCAT('DROP TABLE IF EXISTS ', @tables);
PREPARE cleaning_statement
FROM @tables;
EXECUTE cleaning_statement;
DEALLOCATE PREPARE cleaning_statement;
SET FOREIGN_KEY_CHECKS = 1;

SHOW TABLES;