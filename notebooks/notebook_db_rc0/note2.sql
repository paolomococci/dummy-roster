USE DATABASE `notebook_db_rc0`;

CREATE TABLE IF NOT EXISTS `customers` (
    `customer_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_name` VARCHAR(64) NOT NULL,
    `contact_name` VARCHAR(64) DEFAULT NULL,
    `phone` VARCHAR(64) DEFAULT NULL,
    `address` VARCHAR(64) DEFAULT NULL,
    `city` VARCHAR(64) DEFAULT NULL,
    `state` VARCHAR(64) DEFAULT NULL,
    `postal_code` VARCHAR(64) DEFAULT NULL,
    `country` VARCHAR(64) DEFAULT NULL,
    `sales` INT(11) DEFAULT NULL,
    `credit_limit` DECIMAL(10,2) DEFAULT NULL,
    KEY `sales` (`sales`),
    CONSTRAIN `fk_customer_employee` FOREIGN KEY (`sales`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `payments` (
    `customer_id` INT(11) NOT NULL,
    `check_id` INT(11) NOT NULL,
    `payment_date` DATE NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (`customer_id`, `check_id`),
    CONSTRAINT `fk_payments` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `products` (
    `product_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `product_lines` (
    `product_line_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `orders` (
    `order_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `order_details` (
    `order_detail_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `employees` (
    `employee_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `offices` (
    `office_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
