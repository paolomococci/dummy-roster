-- dummy_roster_rc0.Category definition

CREATE TABLE `Category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Description` text DEFAULT NULL,
  `Belonging` varchar(8) DEFAULT NULL,
  `Picture` blob DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IDX_CategoryName` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
