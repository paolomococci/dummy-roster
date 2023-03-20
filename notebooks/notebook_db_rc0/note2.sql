SHOW DATABASES;

USE `notebook_db_rc0`;

SHOW TABLES;

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) DEFAULT NULL,
  `civic` VARCHAR(16) DEFAULT NULL,
  `city` VARCHAR(16) DEFAULT NULL,
  `district` VARCHAR(16) DEFAULT NULL,
  `postcode` VARCHAR(8) DEFAULT NULL,
  `country` VARCHAR(16) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_address_name` (`name`),
  KEY `idx_address_city` (`city`),
  KEY `idx_address_district` (`district`),
  KEY `idx_address_postcode` (`postcode`),
  KEY `idx_address_country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `addresses`;

DROP TABLE IF EXISTS `credentials`;
CREATE TABLE `credentials` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(48) DEFAULT NULL,
  `phone` VARCHAR(24) DEFAULT NULL,
  `fax` VARCHAR(24) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_credential_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `credentials`;

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(16) NOT NULL,
  `surname` VARCHAR(16) NOT NULL,
  `nickname` VARCHAR(16) DEFAULT NULL,
  `username` VARCHAR(32) DEFAULT NULL,
  `birth_date` DATETIME DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `picture` BLOB DEFAULT NULL,
  `role` VARCHAR(32) DEFAULT NULL,
  `belonging` VARCHAR(8) DEFAULT NULL,
  `loc` BIGINT(20) UNSIGNED NULL,
  `ref` BIGINT(20) UNSIGNED NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_employee_address` (`loc`),
  KEY `fk_employee_credential` (`ref`),
  KEY `idx_employee_name` (`name`),
  CONSTRAINT `fk_employee_address` FOREIGN KEY (`loc`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_employee_credential` FOREIGN KEY (`ref`) REFERENCES `credentials` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `employees`;

DROP TABLE IF EXISTS `carriers`;
CREATE TABLE `carriers` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `foundation_date` DATETIME DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `picture` BLOB DEFAULT NULL,
  `belonging` VARCHAR(8) DEFAULT NULL,
  `contact` BIGINT(20) UNSIGNED NULL,
  `loc` BIGINT(20) UNSIGNED NULL,
  `ref` BIGINT(20) UNSIGNED NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_carrier_employee` (`contact`),
  KEY `fk_carrier_address` (`loc`),
  KEY `fk_carrier_credential` (`ref`),
  KEY `idx_carrier_name` (`name`),
  CONSTRAINT `fk_carrier_address` FOREIGN KEY (`loc`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_carrier_credential` FOREIGN KEY (`ref`) REFERENCES `credentials` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_carrier_employee` FOREIGN KEY (`contact`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `carriers`;

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `foundation_date` DATETIME DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `picture` BLOB DEFAULT NULL,
  `belonging` VARCHAR(8) DEFAULT NULL,
  `contact` BIGINT(20) UNSIGNED NULL,
  `loc` BIGINT(20) UNSIGNED NULL,
  `ref` BIGINT(20) UNSIGNED NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_customer_employee` (`contact`),
  KEY `fk_customer_address` (`loc`),
  KEY `fk_customer_credential` (`ref`),
  KEY `idx_customer_name` (`name`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`loc`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_customer_credential` FOREIGN KEY (`ref`) REFERENCES `credentials` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_customer_employee` FOREIGN KEY (`contact`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `customers`;

DROP TABLE IF EXISTS `forms`;
CREATE TABLE `forms` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` TEXT DEFAULT NULL,
  `customer_id` BIGINT(20) UNSIGNED NULL,
  `carrier_id` BIGINT(20) UNSIGNED NULL,
  `employee_id` BIGINT(20) UNSIGNED NULL,
  `formDate` DATETIME DEFAULT NULL,
  `required_date` DATETIME DEFAULT NULL,
  `promised_date` DATETIME DEFAULT NULL,
  `shipping_cost` DECIMAL(10,2) DEFAULT 0 CHECK (`shipping_cost` >= 0),
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_carrier_id` (`carrier_id`),
  KEY `idx_employee_id` (`employee_id`),
  KEY `idx_form_date` (`formDate`),
  KEY `idx_required_date` (`required_date`),
  KEY `idx_promised_date` (`promised_date`),
  CONSTRAINT `fk_form_carrier` FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_form_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_form_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `forms`;

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `foundation_date` DATETIME DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `picture` BLOB DEFAULT NULL,
  `belonging` VARCHAR(8) DEFAULT NULL,
  `contact` BIGINT(20) UNSIGNED NULL,
  `loc` BIGINT(20) UNSIGNED NULL,
  `ref` BIGINT(20) UNSIGNED NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_supplier_address` FOREIGN KEY (`loc`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_supplier_credential` FOREIGN KEY (`ref`) REFERENCES `credentials` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_supplier_employee` FOREIGN KEY (`contact`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `suppliers`;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `belonging` VARCHAR(8) DEFAULT NULL,
  `picture` BLOB DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `categories`;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `belonging` VARCHAR(8) DEFAULT NULL,
  `picture` BLOB DEFAULT NULL,
  `category_id` BIGINT(20) UNSIGNED NULL,
  `supplier_id` BIGINT(20) UNSIGNED NULL,
  `quantityPerUnit` VARCHAR(24) DEFAULT NULL,
  `unit_price` DECIMAL(10,2) DEFAULT 0 CHECK (`unit_price` >= 0),
  `unitsIn_stock` SMALLINT(6) DEFAULT 0 CHECK (`unitsIn_stock` >= 0),
  `units_on_order` SMALLINT(6) DEFAULT 0 CHECK (`units_on_order` >= 0),
  `reorder_level` SMALLINT(6) DEFAULT 0 CHECK (`reorder_level` >= 0),
  `discontinued` TINYINT(3) NOT NULL DEFAULT 0,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_product_name` (`name`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_product_belonging_category` (`category_id`),
  KEY `idx_supplier_id` (`supplier_id`),
  KEY `idx_product_supplied_by` (`supplier_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_product_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESCRIBE `products`;

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_id` BIGINT(20) UNSIGNED NULL,
  `product_id` BIGINT(20) UNSIGNED NULL,
  `issuing_date` DATETIME DEFAULT NULL,
  `note` TEXT DEFAULT NULL,
  `unit_price` DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (`unit_price` >= 0),
  `quantity` SMALLINT(6) NOT NULL DEFAULT 1 CHECK (`quantity` > 0),
  `price_cut` DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (`price_cut` >= 0 and `price_cut` < 0.3),
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_form_details` (`form_id`),
  KEY `fk_product_details` (`product_id`),
  KEY `idx_invoice_id` (`id`),
  CONSTRAINT `fk_form_details` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_product_details` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;