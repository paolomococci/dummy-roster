# dummy-roster project

As for the database server, I initially considered four alternatives to get a comfortable development environment.
This means:
* the default package of MariaDB for the Linux distribution I use;
* a binary version downloaded from the MariaDB site;
* dockerized MariaDB;
* the environment Homestead of Laravel.
I opted for the first option considered, MariaDB version 10.3.
Therefore, I started by installing PHP version 8.0.27 from source.
I downloaded Composer in 2.5.3 version from official site.
Finally, to reset root password of RDBMS, I typed the following commands in the system shell:

```shell
sudo systemctl stop mariadb
sudo systemctl set-environment MYSQLD_OPTS="--skip-grant-tables --skip-networking"
sudo systemctl start mariadb
sudo mysql -u root
```

and in the shell of the RDBMS:

```shell
ALTER USER 'root'@'localhost' IDENTIFIED BY 'some_password';
CREATE USER 'some_developer'@'localhost' IDENTIFIED BY 'some_password';
CREATE DATABASE dummy_roster_rc0;
SHOW DATABASES;
USE dummy_roster_rc0;
GRANT ALL PRIVILEGES ON dummy_roster_rc0.* TO 'some_developer'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'some_developer'@'localhost';
exit
```

## scaffolding of web application

```shell
composer create-project laravel/laravel dummy-roster.rc0
cd dummy-roster.rc0
php artisan serve
```
