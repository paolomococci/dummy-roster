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
    `type` VARCHAR(30) DEFAULT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
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
    `name` VARCHAR(30) DEFAULT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
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
    `name` VARCHAR(30) DEFAULT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `countries`;

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
## vehicle_models table
*/

DROP TABLE IF EXISTS `vehicle_models`;
CREATE TABLE `vehicle_models` (
    `id` INT(11) DEFAULT NULL,
    `model` VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `vehicle_models`;

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
## vehicle_types table
*/

DROP TABLE IF EXISTS `vehicle_types`;
CREATE TABLE `vehicle_types` (
    `id` INT(11) DEFAULT NULL,
    `type` VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `vehicle_types`;

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
## vehicle_use_types table
*/

DROP TABLE IF EXISTS `vehicle_use_types`;
CREATE TABLE `vehicle_use_types` (
    `id` INT(11) DEFAULT NULL,
    `use` VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `vehicle_use_types`;

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
## vehicle_variant_types table
*/

DROP TABLE IF EXISTS `vehicle_variant_types`;
CREATE TABLE `vehicle_variant_types` (
    `id` INT(11) DEFAULT NULL,
    `variant` VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `vehicle_variant_types`;

LOCK TABLES `vehicle_variant_types` WRITE;
INSERT INTO `vehicle_variant_types` (`id`, `variant`)
VALUES (
    1, 'regular'
), (
    2, 'improved'
), (
    3, 'customized'
), (
    4, 'strong customization'
), (
    5, 'decorated'
), (
    6, 'rude'
);
UNLOCK TABLES;

SELECT * FROM `vehicle_variant_types`;

/*markdown
## registrations table
*/

DROP TABLE IF EXISTS `registrations`;
CREATE TABLE `registrations` (
    `id` INT(11) DEFAULT NULL,
    `trimester` VARCHAR(30) DEFAULT NULL,
    `year` VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `registrations`;

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
## addresses table
*/

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
    `id` INT(11) DEFAULT NULL,
    `street` VARCHAR(30) DEFAULT NULL,
    `civic` VARCHAR(30) DEFAULT NULL,
    `town` VARCHAR(30) DEFAULT NULL,
    `post_code` VARCHAR(30) DEFAULT NULL,
    `country_id` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `country_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `addresses`;

LOCK TABLES `addresses` WRITE;
INSERT INTO `addresses` (`id`, `street`, `civic`, `town`, `post_code`, `country_id`)
VALUES (
    1, 'main road', '123', 'old town', '00123'
), (
    2, 'fleet street', '54', 'west city', '01010'
), (
    3, 'park avenue', '12', 'someone', '01025'
), (
    4, 'fleet street', '45', 'snow peak', '03154'
), (
    5, 'rose boulevard', '87', 'bay wind', '000512'
), (
    6, 'main road', '34', 'windward', '050114'
), (
    7, 'fleet street', '23', 'new town', '02035'
), (
    8, 'mill road', '74', 'old city', '01107'
), (
    9, 'main road', '1', 'downwind', '02035'
), (
    10, 'rose boulevard', '98', 'sun kiss', '02035'
), (
    11, 'fleet street', '4', 'flake pitch', '02035'
), (
    12, 'main road', '66', 'sun promontory', '05740'
), (
    13, 'park avenue', '51', 'flake bay', '06002'
), (
    14, 'fleet street', '12', 'egg bay', '02035'
), (
    15, 'mill road', '11', 'round mount', '02035'
), (
    16, 'rose boulevard', '53', 'twisted peak', '02035'
), (
    17, 'fleet street', '13', 'shaken valley', '02035'
), (
    18, 'park avenue', '3', 'comes down', '02035'
), (
    19, 'fleet street', '19', 'pale moon', '02205'
), (
    20, 'avenue of oleanders', '21', 'fresh dew', '01107'
), (
    21, 'main road', '62', 'horrendous heat', '05740'
), (
    22, 'rose boulevard', '91', 'bitter cold', '01107'
), (
    23, 'fleet street', '88', 'dummy view', '01597'
), (
    24, 'park avenue', '145', 'ruined tower', '01107'
), (
    25, 'avenue of oleanders', '111', 'green manure', '05740'
), (
    26, 'fleet street', '33', 'old tower', '03011'
), (
    27, 'rose boulevard', '55', 'new tower', '05740'
), (
    28, 'mill road', '87', 'new view', '04120'
), (
    29, 'main road', '72', 'seen above', '06002'
), (
    30, 'pin makers square', '99', 'someone new', '05740'
), (
    31, 'fleet street', '105', 'some tower', '05740'
), (
    32, 'park avenue', '202', 'five lakes', '05740'
), (
    33, 'avenue of oleanders', '27', 'three peaks', '05102'
), (
    34, 'main road', '32', 'cordillera', '05740'
), (
    35, 'rose boulevard', '93', 'enchanted', '05740'
), (
    36, 'fleet street', '101', 'broken stone', '05740'
), (
    37, 'mill road', '45', 'broken vase', '05102'
), (
    38, 'rose boulevard', '70', 'enchanted valley', '06002'
), (
    39, 'fleet street', '10', 'misty step', '06002'
), (
    40, 'avenue of oleanders', '41', 'fortress revealed', '06002'
), (
    41, 'main road', '21', 'closed valley', '05740'
), (
    42, 'park avenue', '75', 'over mount', '05102'
), (
    43, 'mill road', '85', 'under hill', '06002'
), (
    44, 'rose boulevard', '108', 'above hill', '05740'
), (
    45, 'fleet street', '16', 'jump lake', '02205'
), (
    46, 'avenue of oleanders', '201', 'summer mountain', '02205'
), (
    47, 'park avenue', '19', 'spring lake', '06002'
), (
    48, 'main road', '29', 'winter lake', '02205'
), (
    49, 'furnace road', '48', 'winter sea', '05740'
), (
    50, 'rose boulevard', '67', 'green sea', '05102'
), (
    51, 'fleet street', '56', 'wild apricot', '06002'
), (
    52, 'avenue of oleanders', '57', 'docile hill', '03011'
), (
    53, 'park avenue', '70', 'some fish', '02205'
), (
    54, 'mill road', '65', 'fanged boar', '05740'
), (
    55, 'main road', '50', 'striped bear', '04120'
), (
    56, 'rose boulevard', '68', 'golden cat', '03011'
), (
    57, 'furnace road', '102', 'gentle mountain', '02205'
), (
    58, 'park avenue', '145', 'ivory tower', '03011'
), (
    59, 'avenue of oleanders', '65', 'cheese', '02205'
), (
    60, 'fleet street', '88', 'angry lion', '04120'
), (
    61, 'pin makers square', '98', 'stormy waters', '05102'
), (
    62, 'park avenue', '41', 'silver fish', '03011'
), (
    63, 'mill road', '44', 'steel tower', '05740'
), (
    64, 'main road', '32', 'beech forest', '02205'
), (
    65, 'rose boulevard', '22', 'green peak', '02205'
), (
    66, 'avenue of oleanders', '10', 'poplar grove', '05102'
), (
    67, 'fleet street', '20', 'silver forest', '05102'
), (
    68, 'park avenue', '53', 'parent forest', '06002'
), (
    69, 'main road', '92', 'green ocean', '02205'
);
UNLOCK TABLES;

SELECT * FROM `addresses`;

/*markdown
## supporting_members table
*/

DROP TABLE IF EXISTS `supporting_members`;
CREATE TABLE `supporting_members` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `supporting_members`;

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
), (
    9, ''
),(
    10, ''
), (
    11, ''
), (
    12, ''
), (
    13, ''
), (
    14, ''
), (
    15, ''
), (
    16, ''
), (
    17, ''
), (
    18, ''
), (
    19, ''
),(
    20, ''
), (
    21, ''
), (
    22, ''
), (
    23, ''
), (
    24, ''
), (
    25, ''
), (
    26, ''
), (
    27, ''
), (
    28, ''
), (
    29, ''
),(
    30, ''
), (
    31, ''
), (
    32, ''
), (
    33, ''
), (
    34, ''
), (
    35, ''
), (
    36, ''
), (
    37, ''
), (
    38, ''
), (
    39, ''
),(
    40, ''
), (
    41, ''
), (
    42, ''
), (
    43, ''
), (
    44, ''
), (
    45, ''
), (
    46, ''
), (
    47, ''
), (
    48, ''
), (
    49, ''
);
UNLOCK TABLES;

SELECT * FROM `supporting_members`;

/*markdown
## member_cards table
*/

DROP TABLE IF EXISTS `member_cards`;
CREATE TABLE `member_cards` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `member_cards`;

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
## registered_vehicles table
*/

DROP TABLE IF EXISTS `registered_vehicles`;
CREATE TABLE `registered_vehicles` (
    `id` INT(11) DEFAULT NULL,
    `name` VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DESCRIBE `registered_vehicles`;

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