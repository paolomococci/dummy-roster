# dummy-roster project

## scaffolding

```shell
composer create-project laravel/laravel dummy-roster.rc3
cd dummy-roster.rc3
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

## add Laravel Breeze

```shell
composer require laravel/breeze --dev
php artisan breeze:install
npm install
npm run dev
php artisan serve
```

## make models

```shell
php artisan make:model Address -mcrs
php artisan make:model Carrier -mcrs
php artisan make:model Category -mcrs
php artisan make:model Credential -mcrs
php artisan make:model Customer -mcrs
php artisan make:model Employee -mcrs
php artisan make:model Form -mcrs
php artisan make:model Invoice -mcrs
php artisan make:model Product -mcrs
php artisan make:model Supplier -mcrs
php artisan migrate --pretend
php artisan migrate
php artisan schema:dump
```

## use database tables as models

```shell
php artisan migrate:fresh
```
