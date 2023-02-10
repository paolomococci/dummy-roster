# dummy-roster project

As for the database server, I initially considered four alternatives to get a comfortable development environment.
This means:
* the default package of MariaDB for the Linux distribution I use;
* a binary version downloaded from the MariaDB site;
* dockerized MariaDB;
* the environment Homestead of Laravel.
I opted for the first option considered, MariaDB version 10.3.
Therefore, I started by installing PHP version 8.0.27 from source.
I downloaded Composer in 2.5.2 version from official site.
Finally, I typed the following shell commands:

```shell
mysql -u root -p

mysqladmin -u root -p shutdown
```

## scaffolding

```shell
composer create-project laravel/laravel dummy-roster.rc0
cd dummy-roster.rc0
php artisan serve
```
