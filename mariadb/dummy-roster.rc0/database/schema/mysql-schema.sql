/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `Carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Description` text DEFAULT NULL,
  `Belonging` varchar(8) DEFAULT NULL,
  `Picture` blob DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IDX_CategoryName` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `Credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Credential` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(48) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IDX_CredentialEmail` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
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
  KEY `FK_Customer_Employee` (`Contact`),
  KEY `FK_Customer_Address` (`Loc`),
  KEY `FK_Customer_Credential` (`Ref`),
  KEY `IDX_CustomerName` (`Name`),
  CONSTRAINT `FK_Customer_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Customer_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Customer_Employee` FOREIGN KEY (`Contact`) REFERENCES `Employee` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(16) NOT NULL,
  `Surname` varchar(16) NOT NULL,
  `Nickname` varchar(16) DEFAULT NULL,
  `Username` varchar(32) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Picture` blob DEFAULT NULL,
  `Role` varchar(32) DEFAULT NULL,
  `Belonging` varchar(8) DEFAULT NULL,
  `Loc` int(11) DEFAULT NULL,
  `Ref` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Employee_Address` (`Loc`),
  KEY `FK_Employee_Credential` (`Ref`),
  KEY `IDX_EmployeeName` (`Name`),
  CONSTRAINT `FK_Employee_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Employee_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `Form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier` (
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
  KEY `FK_Supplier_Employee` (`Contact`),
  KEY `FK_Supplier_Address` (`Loc`),
  KEY `FK_Supplier_Credential` (`Ref`),
  KEY `IDX_SupplierName` (`Name`),
  CONSTRAINT `FK_Supplier_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Supplier_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Supplier_Employee` FOREIGN KEY (`Contact`) REFERENCES `Employee` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` VALUES (2,'2014_10_12_100000_create_password_resets_table',1);
INSERT INTO `migrations` VALUES (3,'2019_08_19_000000_create_failed_jobs_table',1);
INSERT INTO `migrations` VALUES (4,'2019_12_14_000001_create_personal_access_tokens_table',1);
INSERT INTO `migrations` VALUES (5,'2023_02_13_061223_migration_v_0',1);
