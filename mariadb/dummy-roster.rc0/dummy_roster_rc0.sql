
--
-- Table structure for table `Address`
--

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

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carrier`
--

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
  `Contact` INT NULL,
  `Loc` INT NULL,
  `Ref` INT NULL,
  CONSTRAINT `FK_Carrier_Employee` FOREIGN KEY (`Contact`) REFERENCES `Employee` (`Id`),
  CONSTRAINT `FK_Carrier_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Carrier_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`),
  PRIMARY KEY (`Id`),
  KEY `IDX_CarrierName` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carrier`
--

LOCK TABLES `Carrier` WRITE;
/*!40000 ALTER TABLE `Carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `Carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

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

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Credential`
--

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

--
-- Dumping data for table `Credential`
--

LOCK TABLES `Credential` WRITE;
/*!40000 ALTER TABLE `Credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `Credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

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
  `Contact` INT NULL,
  `Loc` INT NULL,
  `Ref` INT NULL,
  CONSTRAINT `FK_Customer_Employee` FOREIGN KEY (`Contact`) REFERENCES `Employee` (`Id`),
  CONSTRAINT `FK_Customer_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Customer_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`),
  PRIMARY KEY (`Id`),
  KEY `IDX_CustomerName` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

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
  `Loc` INT NULL,
  `Ref` INT NULL,
  CONSTRAINT `FK_Employee_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Employee_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`),
  PRIMARY KEY (`Id`),
  KEY `IDX_EmployeeName` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Form`
--

DROP TABLE IF EXISTS `Form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Form` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Form`
--

LOCK TABLES `Form` WRITE;
/*!40000 ALTER TABLE `Form` DISABLE KEYS */;
/*!40000 ALTER TABLE `Form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FormId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `IssuingDate` datetime DEFAULT NULL,
  `Note` text DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IDX_InvoiceId` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Description` text DEFAULT NULL,
  `Belonging` varchar(8) DEFAULT NULL,
  `Picture` blob DEFAULT NULL,
  `QuantityPerUnit` varchar(24) DEFAULT NULL,
  `UnitPrice` NUMERIC NULL DEFAULT (0) CHECK (`UnitPrice`>=0),
  `UnitsInStock` SMALLINT NULL DEFAULT (0) CHECK (`UnitsInStock`>=0),
  PRIMARY KEY (`Id`),
  KEY `IDX_ProductName` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

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
  `Contact` INT NULL,
  `Loc` INT NULL,
  `Ref` INT NULL,
  CONSTRAINT `FK_Supplier_Employee` FOREIGN KEY (`Contact`) REFERENCES `Employee` (`Id`),
  CONSTRAINT `FK_Supplier_Address` FOREIGN KEY (`Loc`) REFERENCES `Address` (`Id`),
  CONSTRAINT `FK_Supplier_Credential` FOREIGN KEY (`Ref`) REFERENCES `Credential` (`Id`),
  PRIMARY KEY (`Id`),
  KEY `IDX_SupplierName` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;