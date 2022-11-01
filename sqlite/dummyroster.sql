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
  "Address" varchar(64) NULL
);

-- Category table
CREATE TABLE "Category" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL
);

-- Product table
CREATE TABLE "Product" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL
);

-- Supplier table
CREATE TABLE "Supplier" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL,
  "Contact" varchar(32) NULL,
  "Role" varchar(32) NULL,
  "Address" varchar(64) NULL
);

-- Employee table
CREATE TABLE "Employee" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL,
  "Role" varchar(32) NULL,
  "Address" varchar(64) NULL
);

-- Form table
CREATE TABLE "Form" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL
);

-- Invoice table
CREATE TABLE "Invoice" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL
);

-- Carrier table
CREATE TABLE "Carrier" (
  "Id" char(8) NOT NULL,
  "Name" varchar(32) NOT NULL,
  "Description" TEXT NULL,
  "Picture" BLOB NULL,
  "Contact" varchar(32) NULL,
  "Role" varchar(32) NULL,
  "Address" varchar(64) NULL
);
