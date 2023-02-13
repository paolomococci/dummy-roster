# dummy-roster project

## scaffolding

```shell
composer create-project laravel/laravel dummy-roster.rc2
cd dummy-roster.rc2
php artisan --version
php artisan --help
php artisan list
php artisan serve
```

## migrate

```shell
php artisan migrate
php artisan schema:dump
```

## todo

```shell
php artisan make:model Address --all
php artisan make:model Carrier --all
php artisan make:model Category --all
php artisan make:model Credential --all
php artisan make:model Customer --all
php artisan make:model Employee --all
php artisan make:model Form --all
php artisan make:model Invoice --all
php artisan make:model Product --all
php artisan make:model Supplier --all
php artisan migrate --pretend
```
