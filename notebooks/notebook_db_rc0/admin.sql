/*markdown
# Simple scripts that can be used to administer an RDBMS
*/

/*markdown
## Use notebook_db_rc0
*/

USE `notebook_db_rc0`;

/*markdown
## Show databases
*/

SHOW DATABASES;

/*markdown
## To create a new database and assign its privileges
*/

CREATE DATABASE notebook_db_rcn;
GRANT ALL PRIVILEGES ON notebook_db_rcn.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'username'@'localhost';