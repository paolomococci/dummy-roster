/*markdown
# ϰοσμοπολίτης (cosmopolitan)
Notebook dedicated to a hypothetical cosmopolitan tourism club.
*/

SHOW DATABASES;

USE `notebook_db_rc0`;

SHOW TABLES;

/*markdown
## driver_id_types table
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
## brand table
*/

DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `brands`;

LOCK TABLES `brands` WRITE;
INSERT INTO `brands` (`id`, `name`)
VALUES (
    1, 'Alpha'
), (
    2, 'Beta'
), (
    3, 'Gamma'
), (
    4, 'Delta'
), (
    5, 'Epsilon'
), (
    6, 'Zeta'
), (
    7, 'Eta'
), (
    8, 'Theta'
);
UNLOCK TABLES;

SELECT * FROM `brands`;

/*markdown
## countries table
*/

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `countries` WRITE;
INSERT INTO `countries` (`id`, `name`)
VALUES (
    1, 'Albania'
), (
    2, 'Algeria'
), (
    3, 'Andorra'
), (
    4, 'Argentina'
), (
    5, 'Australia'
), (
    6, 'Austria'
), (
    7, 'Belgium'
), (
    8, 'Bhutan'
), (
    9, 'Bosnia and Herzegovina'
), (
    10, 'Bulgaria'
), (
    11, 'Cambodia'
), (
    12, 'Canada'
), (
    13, 'Chile'
), (
    14, 'Colombia'
), (
    15, 'Croatia'
), (
    16, 'Cyprus'
), (
    17, 'Czech Republic'
), (
    18, 'Denmark'
), (
    19, 'Dominican Republic'
), (
    20, 'Ecuador'
), (
    21, 'Egypt'
), (
    22, 'Estonia'
), (
    23, 'Finland'
), (
    24, 'France'
), (
    25, 'Georgia'
), (
    26, 'Germany'
), (
    27, 'Greece'
), (
    28, 'Hungary'
), (
    29, 'Iceland'
), (
    30, 'India'
), (
    31, 'Indonesia'
), (
    32, 'Ireland'
), (
    33, 'Israel'
), (
    34, 'Italy'
), (
    35, 'Japan'
), (
    36, 'Jordan'
), (
    37, 'Latvia'
), (
    38, 'Lebanon'
), (
    39, 'Liechtenstein'
), (
    40, 'Lithuania'
), (
    41, 'Luxembourg'
), (
    42, 'Madagascar'
), (
    43, 'Malawi'
), (
    44, 'Malaysia'
), (
    45, 'Malta'
), (
    46, 'Mexico'
), (
    47, 'Monaco'
), (
    48, 'Mongolia'
), (
    49, 'Montenegro'
), (
    50, 'Morocco'
), (
    51, 'Mozambique'
), (
    52, 'Namibia'
), (
    53, 'Nepal'
), (
    54, 'Netherlands'
), (
    55, 'New Zealand'
), (
    56, 'North Macedonia'
), (
    57, 'Norway'
), (
    58, 'Paraguay'
), (
    59, 'Peru'
), (
    60, 'Philippines'
), (
    61, 'Poland'
), (
    62, 'Portugal'
), (
    63, 'Republic of Korea'
), (
    64, 'Republic of Moldova'
), (
    65, 'Romania'
), (
    66, 'Rwanda'
), (
    67, 'San Marino'
), (
    68, 'Saudi Arabia'
), (
    69, 'Senegal'
), (
    70, 'Serbia'
), (
    71, 'Singapore'
), (
    72, 'Slovakia'
), (
    73, 'Slovenia'
), (
    74, 'Spain'
), (
    75, 'Sweden'
), (
    76, 'Switzerland'
), (
    77, 'Taiwan'
), (
    78, 'Thailand'
), (
    79, 'Tunisia'
), (
    80, 'Turkey'
), (
    81, 'Ukraine'
), (
    82, 'United States of America'
), (
    83, 'Uruguay'
), (
    84, 'Zambia'
);
UNLOCK TABLES;

SELECT * FROM `countries`;

/*markdown
### vehicle_models table
*/

DROP TABLE IF EXISTS `vehicle_models`;
CREATE TABLE `vehicle_models` (
    `id` INT(11) DEFAULT NULL,
    `model` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `vehicle_models` WRITE;
INSERT INTO `vehicle_models` (`id`, `model`)
VALUES (
    1, 'station wagon'
), (
    2, 'spartan'
), (
    3, 'young'
), (
    4, 'casual'
), (
    5, 'sporty'
), (
    6, 'race'
), (
    7, 'luxury sports'
), (
    8, 'luxury'
), (
    9, 'extra luxury'
), (
    10, 'off-road'
), (
    11, 'extreme off-road'
), (
    12, 'dunes'
), (
    13, 'amphibian'
), (
    14, 'armored'
), (
    15, 'cabriolet'
), (
    16, 'coupe'
), (
    17, 'pick-up'
), (
    18, 'suv'
);
UNLOCK TABLES;

SELECT * FROM `vehicle_models`;

/*markdown
### vehicle_types table
*/

DROP TABLE IF EXISTS `vehicle_types`;
CREATE TABLE `vehicle_types` (
    `id` INT(11) DEFAULT NULL,
    `type` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `vehicle_types` WRITE;
INSERT INTO `vehicle_types` (`id`, `type`)
VALUES (
    1, 'without-doors'
), (
    2, '2-door'
), (
    3, '3-door'
), (
    4, '4-door'
), (
    5, '5-door'
);
UNLOCK TABLES;

SELECT * FROM `vehicle_types`;

/*markdown
### vehicle_use_types table
*/

DROP TABLE IF EXISTS `vehicle_use_types`;
CREATE TABLE `vehicle_use_types` (
    `id` INT(11) DEFAULT NULL,
    `use` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `vehicle_use_types` WRITE;
INSERT INTO `vehicle_use_types` (`id`, `use`)
VALUES (
    1, 'private'
), (
    2, 'commercial'
), (
    3, 'mixed'
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
    `trimester` VARCHAR(30) DEFAULT NULL,
    `year` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `registrations` WRITE;
INSERT INTO `registrations` (`id`, `trimester`, `year`)
VALUES (
    1, 'I', '1980'
), (
    2, 'II', '1980'
), (
    3, 'III', '1980'
), (
    4, 'IV', '1980'
), (
    5, 'I', '1981'
), (
    6, 'II', '1981'
), (
    7, 'III', '1981'
), (
    8, 'IV', '1981'
), (
    9, 'I', '1982'
), (
    10, 'II', '1982'
), (
    11, 'III', '1982'
), (
    12, 'IV', '1982'
), (
    13, 'I', '1983'
), (
    14, 'II', '1983'
), (
    15, 'III', '1983'
), (
    16, 'IV', '1983'
), (
    17, 'I', '1984'
), (
    18, 'II', '1984'
), (
    19, 'III', '1984'
), (
    20, 'IV', '1984'
), (
    21, 'I', '1985'
), (
    22, 'II', '1985'
), (
    23, 'III', '1985'
), (
    24, 'IV', '1985'
), (
    25, 'I', '1985'
), (
    26, 'II', '1985'
), (
    27, 'III', '1985'
), (
    28, 'IV', '1985'
), (
    29, 'I', '1986'
), (
    30, 'II', '1986'
), (
    31, 'III', '1986'
), (
    32, 'IV', '1986'
), (
    33, 'I', '1987'
), (
    34, 'II', '1987'
), (
    35, 'III', '1987'
), (
    36, 'IV', '1987'
), (
    37, 'I', '1988'
), (
    38, 'II', '1988'
), (
    39, 'III', '1988'
), (
    40, 'IV', '1988'
), (
    41, 'I', '1989'
), (
    42, 'II', '1989'
), (
    43, 'III', '1989'
), (
    44, 'IV', '1989'
);
UNLOCK TABLES;

SELECT * FROM `registrations`;

/*markdown
### addresses table
*/

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
    `id` INT(11) DEFAULT NULL,
    `street` VARCHAR(30) DEFAULT NULL,
    `civic` VARCHAR(30) DEFAULT NULL,
    `town` VARCHAR(30) DEFAULT NULL,
    `post_code` VARCHAR(30) DEFAULT NULL,
    `state` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `addresses` WRITE;
INSERT INTO `addresses` (`id`, `street`, `civic`, `town`, `post_code`, `state`)
VALUES (
    1, '', '', '', '', ''
), (
    2, '', '', '', '', ''
), (
    3, '', '', '', '', ''
), (
    4, '', '', '', '', ''
), (
    5, '', '', '', '', ''
), (
    6, '', '', '', '', ''
), (
    7, '', '', '', '', ''
), (
    8, '', '', '', '', ''
), (
    9, '', '', '', '', ''
), (
    10, '', '', '', '', ''
), (
    11, '', '', '', '', ''
), (
    12, '', '', '', '', ''
), (
    13, '', '', '', '', ''
), (
    14, '', '', '', '', ''
), (
    15, '', '', '', '', ''
), (
    16, '', '', '', '', ''
), (
    17, '', '', '', '', ''
), (
    18, '', '', '', '', ''
), (
    19, '', '', '', '', ''
), (
    20, '', '', '', '', ''
), (
    21, '', '', '', '', ''
), (
    22, '', '', '', '', ''
), (
    23, '', '', '', '', ''
), (
    24, '', '', '', '', ''
), (
    25, '', '', '', '', ''
), (
    26, '', '', '', '', ''
), (
    27, '', '', '', '', ''
), (
    28, '', '', '', '', ''
), (
    29, '', '', '', '', ''
), (
    30, '', '', '', '', ''
), (
    31, '', '', '', '', ''
), (
    32, '', '', '', '', ''
), (
    33, '', '', '', '', ''
), (
    34, '', '', '', '', ''
), (
    35, '', '', '', '', ''
), (
    36, '', '', '', '', ''
), (
    37, '', '', '', '', ''
), (
    38, '', '', '', '', ''
), (
    39, '', '', '', '', ''
), (
    40, '', '', '', '', ''
), (
    41, '', '', '', '', ''
), (
    42, '', '', '', '', ''
), (
    43, '', '', '', '', ''
), (
    44, '', '', '', '', ''
), (
    45, '', '', '', '', ''
), (
    46, '', '', '', '', ''
), (
    47, '', '', '', '', ''
), (
    48, '', '', '', '', ''
), (
    49, '', '', '', '', ''
), (
    50, '', '', '', '', ''
), (
    51, '', '', '', '', ''
), (
    52, '', '', '', '', ''
), (
    53, '', '', '', '', ''
), (
    54, '', '', '', '', ''
), (
    55, '', '', '', '', ''
), (
    56, '', '', '', '', ''
), (
    57, '', '', '', '', ''
), (
    58, '', '', '', '', ''
), (
    59, '', '', '', '', ''
), (
    60, '', '', '', '', ''
), (
    61, '', '', '', '', ''
), (
    62, '', '', '', '', ''
), (
    63, '', '', '', '', ''
), (
    64, '', '', '', '', ''
), (
    65, '', '', '', '', ''
), (
    66, '', '', '', '', ''
), (
    67, '', '', '', '', ''
), (
    68, '', '', '', '', ''
), (
    69, '', '', '', '', ''
);
UNLOCK TABLES;

SELECT * FROM `addresses`;

/*markdown
### supporting_members table
*/

DROP TABLE IF EXISTS `supporting_members`;
CREATE TABLE `supporting_members` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `supporting_members` WRITE;
INSERT INTO `supporting_members` (`id`, `name`)
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

SELECT * FROM `supporting_members`;

/*markdown
### member_cards table
*/

DROP TABLE IF EXISTS `member_cards`;
CREATE TABLE `member_cards` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `member_cards` WRITE;
INSERT INTO `member_cards` (`id`, `name`)
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

SELECT * FROM `member_cards`;

/*markdown
### registered_vehicles table
*/

DROP TABLE IF EXISTS `registered_vehicles`;
CREATE TABLE `registered_vehicles` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `registered_vehicles` WRITE;
INSERT INTO `registered_vehicles` (`id`, `name`)
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

SELECT * FROM `registered_vehicles`;