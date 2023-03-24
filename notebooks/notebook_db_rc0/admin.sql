/*markdown
# Simple scripts that can be used to administer an RDBMS
*/

/*markdown
## Create Database
*/

CREATE DATABASE notebook_db_rcn;
GRANT ALL PRIVILEGES ON notebook_db_rcn.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'username'@'localhost';