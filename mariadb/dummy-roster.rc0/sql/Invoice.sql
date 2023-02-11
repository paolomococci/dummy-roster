-- dummy_roster_rc0.Invoice definition

CREATE TABLE `Invoice` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FormId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `IssuingDate` datetime DEFAULT NULL,
  `Note` text DEFAULT NULL,
  `UnitPrice` decimal(10,0) NOT NULL DEFAULT 0 CHECK (`UnitPrice` >= 0),
  `Quantity` smallint(6) NOT NULL DEFAULT 1 CHECK (`Quantity` > 0),
  `PriceCut` decimal(10,0) NOT NULL DEFAULT 0 CHECK (`PriceCut` >= 0 and `PriceCut` < 0.3),
  PRIMARY KEY (`Id`),
  KEY `FK_Form_Details` (`FormId`),
  KEY `FK_Product_Details` (`ProductId`),
  KEY `IDX_InvoiceId` (`Id`),
  CONSTRAINT `FK_Form_Details` FOREIGN KEY (`FormId`) REFERENCES `Form` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Product_Details` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
