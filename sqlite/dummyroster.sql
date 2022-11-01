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
  "Id" char(5) NOT NULL,
  "Name" varchar (40) NOT NULL
);

-- Category table
CREATE TABLE "Category" (
  "Id" char(5) NOT NULL,
  "Name" varchar (40) NOT NULL,
  "Description" TEXT NULL
);

-- Product table
CREATE TABLE "Product" (
  "Id" char(5) NOT NULL,
  "Name" varchar (40) NOT NULL
);

-- Supplier table
CREATE TABLE "Supplier" (
  "Id" char(5) NOT NULL,
  "Name" varchar (40) NOT NULL
);

-- Employee table
CREATE TABLE "Employee" (
  "Id" char(5) NOT NULL,
  "Name" varchar (40) NOT NULL
);

-- Form table
CREATE TABLE "Form" (
  "Id" char(5) NOT NULL,
  "Name" varchar (40) NOT NULL
);

-- Invoice table
CREATE TABLE "Invoice" (
  "Id" char(5) NOT NULL,
  "Name" varchar (40) NOT NULL
);

-- Carrier table
CREATE TABLE "Carrier" (
  "Id" char(5) NOT NULL,
  "Name" varchar (40) NOT NULL
);
