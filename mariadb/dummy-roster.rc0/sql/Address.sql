-- dummy_roster_rc0.Address definition

CREATE TABLE `Address` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) DEFAULT NULL,
  `Civic` varchar(16) DEFAULT NULL,
  `City` varchar(16) DEFAULT NULL,
  `District` varchar(16) DEFAULT NULL,
  `Postcode` varchar(8) DEFAULT NULL,
  `Country` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IDX_AddressName` (`Name`),
  KEY `IDX_AddressCity` (`City`),
  KEY `IDX_AddressDistrict` (`District`),
  KEY `IDX_AddressPostcode` (`Postcode`),
  KEY `IDX_AddressCountry` (`Country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
