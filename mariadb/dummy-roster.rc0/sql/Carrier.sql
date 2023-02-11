-- dummy_roster_rc0.Carrier definition

CREATE TABLE `Carrier` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `FoundationDate` datetime DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Picture` blob DEFAULT NULL,
  `Belonging` varchar(8) DEFAULT NULL,
  `Contact` int(11) DEFAULT NULL,
  `Loc` int(11) DEFAULT NULL,
  `Ref` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Carrier_Employee` (`Contact`),
  KEY `FK_Carrier_Address` (`Loc`),
  KEY `FK_Carrier_Credential` (`Ref`),
  KEY `IDX_CarrierName` (`Name`),
  CONSTRAINT `FK_Carrier_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Carrier_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Carrier_Employee` FOREIGN KEY (`Contact`) REFERENCES `Employee` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
