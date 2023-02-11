-- dummy_roster_rc0.Credential definition

CREATE TABLE `Credential` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(48) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IDX_CredentialEmail` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
