# dummy-roster project

## scaffolding

```shell
composer create-project laravel/laravel dummy-roster.rc1
cd dummy-roster.rc1
php artisan serve
```

## migrate

```shell
php artisan migrate --pretend
php artisan migrate
php artisan schema:dump
```
