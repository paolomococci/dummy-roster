-- dummyroster.sql for SQLite

-- drop tables if exists

DROP TABLE IF EXISTS "Customer";
DROP TABLE IF EXISTS "Category";
DROP TABLE IF EXISTS "Product";
DROP TABLE IF EXISTS "Supplier";
DROP TABLE IF EXISTS "Employee";
DROP TABLE IF EXISTS "Form";
DROP TABLE IF EXISTS "Invoice";
DROP TABLE IF EXISTS "Carrier";

-- Customer table
CREATE TABLE "Customer" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL,
  "Contact" varchar(32) NULL,
  "Role" varchar(32) NULL,
  "Address" varchar(64) NULL,
  "City" varchar(16) NULL,
  "District" varchar(16) NULL,
  "Postcode" varchar(8) NULL,
  "Country" varchar(16) NULL,
  "Email" varchar(48) NULL,
  "Phone" varchar(24) NULL,
  "Fax" varchar(24) NULL,
  CONSTRAINT "PK_Customer" PRIMARY KEY ("Id")
);
CREATE INDEX "CustomerName" ON "Customer"("Name");
CREATE INDEX "CustomerCity" ON "Customer"("City");
CREATE INDEX "CustomerDistrict" ON "Customer"("District");
CREATE INDEX "CustomerPostcode" ON "Customer"("Postcode");

-- Supplier table
CREATE TABLE "Supplier" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL,
  "Contact" varchar(32) NULL,
  "Role" varchar(32) NULL,
  "Address" varchar(64) NULL,
  "City" varchar(16) NULL,
  "District" varchar(16) NULL,
  "Postcode" varchar(8) NULL,
  "Country" varchar(16) NULL,
  "Email" varchar(48) NULL,
  "Phone" varchar(24) NULL,
  "Fax" varchar(24) NULL,
  CONSTRAINT "PK_Supplier" PRIMARY KEY ("Id")
);
CREATE INDEX "SupplierName" ON "Supplier"("Name");
CREATE INDEX "SupplierCity" ON "Supplier"("City");
CREATE INDEX "SupplierDistrict" ON "Supplier"("District");
CREATE INDEX "SupplierPostcode" ON "Supplier"("Postcode");

-- Employee table
CREATE TABLE "Employee" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL,
  "Role" varchar(32) NULL,
  "Address" varchar(64) NULL,
  "City" varchar(16) NULL,
  "District" varchar(16) NULL,
  "Postcode" varchar(8) NULL,
  "Country" varchar(16) NULL,
  "Email" varchar(48) NULL,
  "Phone" varchar(24) NULL,
  "Fax" varchar(24) NULL,
  CONSTRAINT "PK_Employee" PRIMARY KEY ("Id")
);
CREATE INDEX "EmployeeName" ON "Employee"("Name");
CREATE INDEX "EmployeeCity" ON "Employee"("City");
CREATE INDEX "EmployeeDistrict" ON "Employee"("District");
CREATE INDEX "EmployeePostcode" ON "Employee"("Postcode");

-- Carrier table
CREATE TABLE "Carrier" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL,
  "Contact" varchar(32) NULL,
  "Role" varchar(32) NULL,
  "Address" varchar(64) NULL,
  "City" varchar(16) NULL,
  "District" varchar(16) NULL,
  "Postcode" varchar(8) NULL,
  "Country" varchar(16) NULL,
  "Email" varchar(48) NULL,
  "Phone" varchar(24) NULL,
  "Fax" varchar(24) NULL,
  CONSTRAINT "PK_Carrier" PRIMARY KEY ("Id")
);
CREATE INDEX "CarrierName" ON "Carrier"("Name");
CREATE INDEX "CarrierCity" ON "Carrier"("City");
CREATE INDEX "CarrierDistrict" ON "Carrier"("District");
CREATE INDEX "CarrierPostcode" ON "Carrier"("Postcode");

-- Category table
CREATE TABLE "Category" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL,
  CONSTRAINT "PK_Category" PRIMARY KEY ("Id")
);
CREATE INDEX "CategoryName" ON "Category"("Name");

-- Product table
CREATE TABLE "Product" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL,
  "CategoryId" BIGINT NULL,
  CONSTRAINT "PK_Product" PRIMARY KEY ("Id")
);
CREATE INDEX "ProductName" ON "Product"("Name");

-- Form table
CREATE TABLE "Form" (
  "Id" char(8) NOT NULL,
  "Description" TEXT NULL,
  CONSTRAINT "PK_Form" PRIMARY KEY ("Id")
);
CREATE INDEX "FormId" ON "Form"("Id");

-- Invoice table
CREATE TABLE "Invoice" (
  "Id" char(8) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL,
  CONSTRAINT "PK_Invoice" PRIMARY KEY ("Id")
);
CREATE INDEX "InvoiceId" ON "Invoice"("Id");
