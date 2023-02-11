-- dummy_roster_rc0.Form definition

CREATE TABLE `Form` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `CarrierId` int(11) DEFAULT NULL,
  `EmployeeId` int(11) DEFAULT NULL,
  `FormDate` datetime DEFAULT NULL,
  `RequiredDate` datetime DEFAULT NULL,
  `PromisedDate` datetime DEFAULT NULL,
  `ShippingCost` decimal(10,0) DEFAULT 0 CHECK (`ShippingCost` >= 0),
  PRIMARY KEY (`Id`),
  KEY `IDX_CustomerId` (`CustomerId`),
  KEY `IDX_CarrierId` (`CarrierId`),
  KEY `IDX_EmployeeId` (`EmployeeId`),
  KEY `IDX_FormDate` (`FormDate`),
  KEY `IDX_RequiredDate` (`RequiredDate`),
  KEY `IDX_PromisedDate` (`PromisedDate`),
  CONSTRAINT `FK_Form_Carrier` FOREIGN KEY (`CarrierId`) REFERENCES `Carrier` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Form_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Form_Employee` FOREIGN KEY (`EmployeeId`) REFERENCES `Employee` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
