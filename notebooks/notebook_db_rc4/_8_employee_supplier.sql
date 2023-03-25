/*markdown
# Hobby Horse - notebook for pivot table employee_supplier
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
## I create the pivot table employee_supplier
*/

DROP TABLE IF EXISTS `employee_supplier`;
CREATE TABLE `employee_supplier` (
  `employee_id` BIGINT(20) UNSIGNED NOT NULL,
  `supplier_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`employee_id`,`supplier_id`),
  CONSTRAINT `employee_supplier_to_employees_fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_supplier_to_suppliers_fk` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `employee_supplier`;