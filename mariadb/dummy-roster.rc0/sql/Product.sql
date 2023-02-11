-- dummy_roster_rc0.Product definition

CREATE TABLE `Product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Description` text DEFAULT NULL,
  `Belonging` varchar(8) DEFAULT NULL,
  `Picture` blob DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SupplierId` int(11) DEFAULT NULL,
  `QuantityPerUnit` varchar(24) DEFAULT NULL,
  `UnitPrice` decimal(10,0) DEFAULT 0 CHECK (`UnitPrice` >= 0),
  `UnitsInStock` smallint(6) DEFAULT 0 CHECK (`UnitsInStock` >= 0),
  `UnitsOnOrder` smallint(6) DEFAULT 0 CHECK (`UnitsOnOrder` >= 0),
  `ReorderLevel` smallint(6) DEFAULT 0 CHECK (`ReorderLevel` >= 0),
  `Discontinued` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `IDX_ProductName` (`Name`),
  KEY `IDX_CategoryId` (`CategoryId`),
  KEY `IDX_ProductBelongingCategory` (`CategoryId`),
  KEY `IDX_SupplierId` (`SupplierId`),
  KEY `IDX_ProductSuppliedBy` (`SupplierId`),
  CONSTRAINT `FK_Product_Category` FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Product_Supplier` FOREIGN KEY (`SupplierId`) REFERENCES `Supplier` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
