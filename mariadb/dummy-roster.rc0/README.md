# dummy-roster project

As for the database server, I initially considered four alternatives to get a comfortable development environment.
This means:
* the default package of MariaDB for the Linux distribution I use;
* a binary version downloaded from the MariaDB site;
* dockerized MariaDB;
* the environment Homestead of Laravel.
I opted for the second option considered, MariaDB version 5.5.68.
Therefore, I started by installing PHP version 8.0.27 from source.
I downloaded Composer in 2.5.2 version from official site.
Finally, after unpacking the archive containing MariaDB, I installed it with the following shell commands:

## scaffolding

```shell
composer create-project laravel/laravel dummy-roster.rc0
cd dummy-roster.rc0
php artisan serve
```
