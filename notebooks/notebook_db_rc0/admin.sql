/*markdown
# Simple scripts that can be used to administer an RDBMS
*/

/*markdown
## Show databases
*/

USE `notebook_db_rc0`;
SHOW DATABASES;
SHOW TABLES;

/*markdown
## Create Database
*/

CREATE DATABASE notebook_db_rcn;
GRANT ALL PRIVILEGES ON notebook_db_rcn.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'username'@'localhost';