-- dummy-roster.sql for MariaDB

-- Employee table
DROP TABLE IF EXISTS Employee;
CREATE TABLE IF NOT EXISTS Employee (
  `Id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(16) NOT NULL,
  `Surname` varchar(16) NOT NULL,
  `Nickname` varchar(16) NULL,
  `Username` varchar(32) NULL,
  `BirthDate` DATETIME NULL,
  `Description` TEXT NULL,
  `Picture` BLOB NULL,
  `Role` varchar(32) NULL,
  `Belonging` varchar(8) NULL,
  `Loc` INT NULL,
  `Ref` INT NULL,
  CONSTRAINT `FK_Employee_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Employee_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`)
);
CREATE INDEX `IDX_EmployeeName` ON `Employee`(`Name`);

-- Customer table
DROP TABLE IF EXISTS Customer;
CREATE TABLE IF NOT EXISTS Customer (
  `Id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `FoundationDate` DATETIME NULL,
  `Description` TEXT NULL,
  `Picture` BLOB NULL,
  `Belonging` varchar(8) NULL,
  `Contact` INT NULL,
  `Loc` INT NULL,
  `Ref` INT NULL,
  CONSTRAINT `FK_Customer_Employee` FOREIGN KEY (`Contact`) REFERENCES `Employee` (`Id`),
  CONSTRAINT `FK_Customer_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Customer_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`)
);
CREATE INDEX `IDX_CustomerName` ON `Customer`(`Name`);

-- Supplier table
DROP TABLE IF EXISTS Supplier;
CREATE TABLE IF NOT EXISTS Supplier (
  `Id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `FoundationDate` DATETIME NULL,
  `Description` TEXT NULL,
  `Picture` BLOB NULL,
  `Belonging` varchar(8) NULL,
  `Contact` INT NULL,
  `Loc` INT NULL,
  `Ref` INT NULL,
  CONSTRAINT `FK_Supplier_Employee` FOREIGN KEY (`Contact`) REFERENCES `Employee` (`Id`),
  CONSTRAINT `FK_Supplier_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Supplier_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`)
);
CREATE INDEX `IDX_SupplierName` ON `Supplier`(`Name`);

-- Carrier table
DROP TABLE IF EXISTS Carrier;
CREATE TABLE IF NOT EXISTS Carrier (
  `Id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `FoundationDate` DATETIME NULL,
  `Description` TEXT NULL,
  `Picture` BLOB NULL,
  `Belonging` varchar(8) NULL,
  `Contact` INT NULL,
  `Loc` INT NULL,
  `Ref` INT NULL,
  CONSTRAINT `FK_Carrier_Employee` FOREIGN KEY (`Contact`) REFERENCES `Employee` (`Id`),
  CONSTRAINT `FK_Carrier_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Carrier_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`)
);
CREATE INDEX `IDX_CarrierName` ON `Carrier`(`Name`);

-- Address table
DROP TABLE IF EXISTS Address;
CREATE TABLE IF NOT EXISTS Address (
  `Id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(32) NULL,
  `Civic` varchar(16) NULL,
  `City` varchar(16) NULL,
  `District` varchar(16) NULL,
  `Postcode` varchar(8) NULL,
  `Country` varchar(16) NULL
);
CREATE INDEX `IDX_AddressName` ON `Address`(`Name`);
CREATE INDEX `IDX_AddressCity` ON `Address`(`City`);
CREATE INDEX `IDX_AddressDistrict` ON `Address`(`District`);
CREATE INDEX `IDX_AddressPostcode` ON `Address`(`Postcode`);
CREATE INDEX `IDX_AddressCountry` ON `Address`(`Country`);

-- Credential table
DROP TABLE IF EXISTS Credential;
CREATE TABLE IF NOT EXISTS Credential (
  `Id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Email` varchar(48) NULL,
  `Phone` varchar(24) NULL,
  `Fax` varchar(24) NULL
);
CREATE INDEX `IDX_CredentialEmail` ON `Credential`(`Email`);

-- Category table
DROP TABLE IF EXISTS Category;
CREATE TABLE IF NOT EXISTS Category (
  `Id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Description` TEXT NULL,
  `Belonging` varchar(8) NULL,
  `Picture` BLOB NULL
);
CREATE INDEX `IDX_CategoryName` ON `Category`(`Name`);

-- Product table
DROP TABLE IF EXISTS Product;
CREATE TABLE IF NOT EXISTS Product (
  `Id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Description` TEXT NULL,
  `Belonging` varchar(8) NULL,
  `Picture` BLOB NULL,
  `CategoryId` INT NULL,
  `SupplierId` INT NULL,
  `QuantityPerUnit` varchar(24) NULL,
  `UnitPrice` NUMERIC NULL CONSTRAINT `DF_Product_UnitPrice` DEFAULT (0),
  `UnitsInStock` SMALLINT NULL CONSTRAINT `DF_Product_UnitsInStock` DEFAULT (0),
  `UnitsOnOrder` SMALLINT NULL CONSTRAINT `DF_Product_UnitsOnOrder` DEFAULT (0),
  `ReorderLevel` SMALLINT NULL CONSTRAINT `DF_Product_ReorderLevel` DEFAULT (0),
  `Discontinued` BOOLEAN NOT NULL CONSTRAINT `DF_Product_Discontinued` DEFAULT (0),
  CONSTRAINT `FK_Product_Category` FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`Id`),
  CONSTRAINT `FK_Product_Supplier` FOREIGN KEY (`SupplierId`) REFERENCES `Supplier` (`Id`),
  CONSTRAINT `CK_Product_UnitPrice` CHECK (UnitPrice >= 0),
  CONSTRAINT `CK_UnitsInStock` CHECK (UnitsInStock >= 0),
  CONSTRAINT `CK_UnitsOnOrder` CHECK (UnitsOnOrder >= 0),
  CONSTRAINT `CK_ReorderLevel` CHECK (ReorderLevel >= 0)
);
CREATE INDEX `IDX_ProductName` ON `Product`(`Name`);
CREATE INDEX `IDX_CategoryId` ON `Product`(`CategoryId`);
CREATE INDEX `IDX_ProductBelongingCategory` ON `Product`(`CategoryId`);
CREATE INDEX `IDX_SupplierId` ON `Product`(`SupplierId`);
CREATE INDEX `IDX_ProductSuppliedBy` ON `Product`(`SupplierId`);

-- Form table
DROP TABLE IF EXISTS Form;
CREATE TABLE IF NOT EXISTS Form (
  `Id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `Description` TEXT NULL,
  `CustomerId` INT NULL,
  `CarrierId` INT NULL,
  `EmployeeId` INT NULL,
  `FormDate` DATETIME NULL,
  `RequiredDate` DATETIME NULL,
  `PromisedDate` DATETIME NULL,
  `ShippingCost` NUMERIC NULL CONSTRAINT `DF_Form_ShippingCost` DEFAULT (0),
  CONSTRAINT `FK_Form_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`Id`),
  CONSTRAINT `FK_Form_Carrier` FOREIGN KEY (`CarrierId`) REFERENCES `Carrier` (`Id`),
  CONSTRAINT `FK_Form_Employee` FOREIGN KEY (`EmployeeId`) REFERENCES `Employee` (`Id`)
);
CREATE INDEX `IDX_FormId` ON `Form`(`Id`);
CREATE INDEX `IDX_CustomerId` ON `Form`(`CustomerId`);
CREATE INDEX `IDX_CarrierId` ON `Form`(`CarrierId`);
CREATE INDEX `IDX_EmployeeId` ON `Form`(`EmployeeId`);
CREATE INDEX `IDX_FormDate` ON `Form`(`FormDate`);
CREATE INDEX `IDX_RequiredDate` ON `Form`(`RequiredDate`);
CREATE INDEX `IDX_PromisedDate` ON `Form`(`PromisedDate`);

-- Invoice table
DROP TABLE IF EXISTS Invoice;
CREATE TABLE IF NOT EXISTS Invoice (
  `Id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `FormId` INT NULL,
  `ProductId` INT NULL,
  `IssuingDate` DATETIME NULL,
  `Note` TEXT NULL,
  `UnitPrice` NUMERIC NOT NULL CONSTRAINT `DF_Form_Details_UnitPrice` DEFAULT (0),
  `Quantity` SMALLINT NOT NULL CONSTRAINT `DF_Form_Details_Quantity` DEFAULT (1),
  `PriceCut` NUMERIC NOT NULL CONSTRAINT `DF_Form_Details_PriceCut` DEFAULT (0),
  CONSTRAINT `FK_Form_Details` FOREIGN KEY (`FormId`) REFERENCES `Form` (`Id`),
  CONSTRAINT `FK_Product_Details` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`),
  CONSTRAINT `CK_UnitPrice` CHECK (UnitPrice >= 0),
  CONSTRAINT `CK_Quantity` CHECK (Quantity > 0),
  CONSTRAINT `CK_PriceCut` CHECK (PriceCut >= 0 and PriceCut < 0.3)

);
CREATE INDEX `IDX_InvoiceId` ON `Invoice`(`Id`);
CREATE INDEX `IDX_ProductId` ON `Invoice`(`ProductId`);
