CREATE TEMPORARY TABLE IF NOT EXISTS `customers` (
    `customer_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_name` VARCHAR(64) NOT NULL,
    `contact_name` VARCHAR(64) DEFAULT NULL,
    `email` VARCHAR(64) UNIQUE NOT NULL,
    `phone` VARCHAR(64) DEFAULT NULL,
    `address` VARCHAR(64) DEFAULT NULL,
    `city` VARCHAR(64) DEFAULT NULL,
    `state` VARCHAR(64) DEFAULT NULL,
    `postal_code` VARCHAR(64) DEFAULT NULL,
    `country` VARCHAR(64) DEFAULT NULL,
    `sales` INT(11) DEFAULT NULL,
    `credit_limit` DECIMAL(10,2) DEFAULT NULL,
    `date_entered` DATETIME DEFAULT_CURRENT_TIMESTAMP,
    `modification_date` TIMESTAMP DEFAULT_CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY `sales` (`sales`),
    CONSTRAIN `fk_customer_employee` FOREIGN KEY (`sales`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TEMPORARY TABLE IF NOT EXISTS `payments` (
    `customer_id` INT(11) NOT NULL,
    `check_id` INT(11) NOT NULL,
    `payment_date` DATE NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `date_entered` DATETIME DEFAULT_CURRENT_TIMESTAMP,
    PRIMARY KEY (`customer_id`, `check_id`),
    CONSTRAINT `fk_payments` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TEMPORARY TABLE IF NOT EXISTS `products` (
    `product_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_name` VARCHAR(64) NOT NULL,
    `product_line_id` INT(11) NOT NULL,
    `product_supplier_name` VARCHAR(64) DEFAULT NULL,
    `product_description` TEXT DEFAULT NULL,
    `stock_quantity` SMALLINT(6) DEFAULT NULL,
    `buy_price` DECIMAL(10,2) DEFAULT NULL,
    `selling_price` DECIMAL(10,2) DEFAULT NULL,
    `date_entered` DATETIME DEFAULT_CURRENT_TIMESTAMP,
    `modification_date` TIMESTAMP DEFAULT_CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY `product_line_id` (`product_line_id`),
    CONSTRAINT `fk_product_line` FOREIGN KEY (`product_line_id` ) REFERENCES `product_lines` (`product_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TEMPORARY TABLE IF NOT EXISTS `product_lines` (
    `product_line_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `line_description` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TEMPORARY TABLE IF NOT EXISTS `orders` (
    `order_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_date` DATE NOT NULL,
    `required_date` DATE DEFAULT NULL,
    `shipped_date` DATE DEFAULT NULL,
    `status` VARCHAR(16) DEFAULT NULL,
    `comment` TEXT DEFAULT NULL,
    `customer_id` INT(11) DEFAULT NULL,
    KEY `customer_id` (`customer_id`),
    CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TEMPORARY TABLE IF NOT EXISTS `order_details` (
    `order_detail_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TEMPORARY TABLE IF NOT EXISTS `employees` (
    `employee_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TEMPORARY TABLE IF NOT EXISTS `offices` (
    `office_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
