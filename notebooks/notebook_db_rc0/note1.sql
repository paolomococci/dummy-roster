DROP TABLE IF EXISTS `note_one`;
CREATE TABLE IF NOT EXISTS `note_one`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` CHAR(255) NOT NULL,
    `description` CHAR(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

SELECT * FROM `note_one`;

INSERT INTO `note_one` (`title`, `description`)
VALUES ('someone', 'some description of someone');