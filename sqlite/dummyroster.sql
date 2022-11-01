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
  "Fax" varchar(24) NULL
);
CREATE INDEX "CustomerName" ON "Customer"("Name");

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
  "Fax" varchar(24) NULL
);
CREATE INDEX "SupplierName" ON "Supplier"("Name");

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
  "Fax" varchar(24) NULL
);
CREATE INDEX "EmployeeName" ON "Employee"("Name");

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
  "Fax" varchar(24) NULL
);
CREATE INDEX "CarrierName" ON "Carrier"("Name");

-- Category table
CREATE TABLE "Category" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL
);
CREATE INDEX "CategoryName" ON "Category"("Name");

-- Product table
CREATE TABLE "Product" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL
);
CREATE INDEX "ProductName" ON "Product"("Name");

-- Form table
CREATE TABLE "Form" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL
);
CREATE INDEX "FormName" ON "Form"("Name");

-- Invoice table
CREATE TABLE "Invoice" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL
);
CREATE INDEX "InvoiceName" ON "Invoice"("Name");
