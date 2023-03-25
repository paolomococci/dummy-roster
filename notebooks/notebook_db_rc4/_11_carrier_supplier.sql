/*markdown
# Hobby Horse - notebook for pivot table carrier_supplier
*/

/*markdown
## set and info
*/

USE `notebook_db_rc4`;

SHOW TABLES;

/*markdown
## I create the pivot table carrier_supplier
*/

DROP TABLE IF EXISTS `carrier_supplier`;
CREATE TABLE `carrier_supplier` (
  `carrier_id` BIGINT(20) UNSIGNED NOT NULL,
  `supplier_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`carrier_id`,`supplier_id`),
  CONSTRAINT `carrier_supplier_to_carriers_fk` FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carrier_supplier_to_suppliers_fk` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `carrier_supplier`;