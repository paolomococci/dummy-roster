DROP TABLE IF EXISTS `note_one`;

CREATE TABLE
    IF NOT EXISTS `note_one`(
        `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `title` CHAR(255) NOT NULL,
        `description` CHAR(255) DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DESCRIBE `note_one`;

SELECT * FROM `note_one` WHERE `description` IS NOT NULL;

INSERT INTO
    `note_one` (`title`, `description`)
VALUES (
        'someone',
        'some description of someone'
    );

TRUNCATE `note_one`;

INSERT INTO
    `note_one` (`title`, `description`)
VALUES ('title 1', 'description 1'), ('title 2', NULL), ('title 3', 'description 3'), ('title 4', NULL), ('title 5', 'description 5');