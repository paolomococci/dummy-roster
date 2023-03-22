/*markdown
# ϰοσμοπολίτης (cosmopolitan)
Notebook dedicated to a hypothetical cosmopolitan tourism club.
*/

SHOW DATABASES;

USE `notebook_db_rc0`;

SHOW TABLES;

/*markdown
### driver_id_types table
*/

DROP TABLE IF EXISTS `driver_id_types`;
CREATE TABLE `driver_id_types` (
    `id` INT(11) DEFAULT NULL,
    `type` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `driver_id_types`;

LOCK TABLES `driver_id_types` WRITE;
INSERT INTO `driver_id_types` (`id`, `type`)
VALUES (
    1, 'mopeds'
), (
    2, 'motorcycles'
), (
    3, 'cars'
), (
    4, 'light trucks'
), (
    5, 'heavy trucks'
), (
    6, 'trucks with trailers'
), (
    7, 'bus'
), (
    8, 'bus with trailer'
);
UNLOCK TABLES;

SELECT * FROM `driver_id_types`;

/*markdown
### brand table
*/

DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `brands` WRITE;
INSERT INTO `brands` (`id`, `name`)
VALUES (
    1, ''
), (
    2, ''
), (
    3, ''
), (
    4, ''
), (
    5, ''
), (
    6, ''
), (
    7, ''
), (
    8, ''
);
UNLOCK TABLES;

SELECT * FROM `brands`;

/*markdown
### countries table
*/

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `countries` WRITE;
INSERT INTO `countries` (`id`, `name`)
VALUES (
    1, ''
), (
    2, ''
), (
    3, ''
), (
    4, ''
), (
    5, ''
), (
    6, ''
), (
    7, ''
), (
    8, ''
);
UNLOCK TABLES;

SELECT * FROM `countries`;

/*markdown
### vehicle_models table
*/

DROP TABLE IF EXISTS `vehicle_models`;
CREATE TABLE `vehicle_models` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `vehicle_models` WRITE;
INSERT INTO `vehicle_models` (`id`, `name`)
VALUES (
    1, ''
), (
    2, ''
), (
    3, ''
), (
    4, ''
), (
    5, ''
), (
    6, ''
), (
    7, ''
), (
    8, ''
);
UNLOCK TABLES;

SELECT * FROM `vehicle_models`;


/*markdown
### vehicle_types table
*/

DROP TABLE IF EXISTS `vehicle_types`;
CREATE TABLE `vehicle_types` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `vehicle_types` WRITE;
INSERT INTO `vehicle_types` (`id`, `name`)
VALUES (
    1, ''
), (
    2, ''
), (
    3, ''
), (
    4, ''
), (
    5, ''
), (
    6, ''
), (
    7, ''
), (
    8, ''
);
UNLOCK TABLES;

SELECT * FROM `vehicle_types`;


/*markdown
### vehicle_use_types table
*/

DROP TABLE IF EXISTS `vehicle_use_types`;
CREATE TABLE `vehicle_use_types` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `vehicle_use_types` WRITE;
INSERT INTO `vehicle_use_types` (`id`, `name`)
VALUES (
    1, ''
), (
    2, ''
), (
    3, ''
), (
    4, ''
), (
    5, ''
), (
    6, ''
), (
    7, ''
), (
    8, ''
);
UNLOCK TABLES;

SELECT * FROM `vehicle_use_types`;


/*markdown
### vehicle_variant_types table
*/

DROP TABLE IF EXISTS `vehicle_variant_types`;
CREATE TABLE `vehicle_variant_types` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `vehicle_variant_types` WRITE;
INSERT INTO `vehicle_variant_types` (`id`, `name`)
VALUES (
    1, ''
), (
    2, ''
), (
    3, ''
), (
    4, ''
), (
    5, ''
), (
    6, ''
), (
    7, ''
), (
    8, ''
);
UNLOCK TABLES;

SELECT * FROM `vehicle_variant_types`;


/*markdown
### registrations table
*/

DROP TABLE IF EXISTS `registrations`;
CREATE TABLE `registrations` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `registrations` WRITE;
INSERT INTO `registrations` (`id`, `name`)
VALUES (
    1, ''
), (
    2, ''
), (
    3, ''
), (
    4, ''
), (
    5, ''
), (
    6, ''
), (
    7, ''
), (
    8, ''
);
UNLOCK TABLES;

SELECT * FROM `registrations`;