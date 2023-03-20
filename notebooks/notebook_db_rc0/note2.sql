CREATE TABLE IF NOT EXISTS `customers` (
    `customer_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `payments` (
    `payment_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
