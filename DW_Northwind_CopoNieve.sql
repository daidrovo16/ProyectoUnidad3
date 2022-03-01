--
-- File generated with SQLiteStudio v3.3.3 on sá. feb. 26 14:55:33 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: dim_categories
CREATE TABLE "dim_categories" (
	"CategoryID"	integer NOT NULL,
	"CategoryName"	varchar(20) NOT NULL,
	"Description"	text,
	PRIMARY KEY("CategoryID")
);

-- Table: dim_customers
CREATE TABLE "dim_customers" (
	"CustomerID"	integer NOT NULL,
	"Address"	varchar(60),
	"CompanyName"	varchar(60) NOT NULL,
	"ContactName"	varchar(60),
	"ContactTitle"	varchar(60),
	"Fax"	varchar(60),
	"Phone"	varchar(60),
	PRIMARY KEY("CustomerID")
);

-- Table: dim_employees
CREATE TABLE "dim_employees" (
	"EmployeeID"	integer NOT NULL,
	"LastName"	varchar(20) NOT NULL,
	"FirstName"	varchar(20) NOT NULL,
	"Title"	varchar(30),
	"TitleOfCoursey"	varchar(25),
	"BirthDate"	datetime,
	"HireDate"	datetime,
	"Address"	varchar(60),
	"HomePhone"	varchar(25),
	"Extension"	varchar(10),
	"Notes"	text,
	"ReportsTo"	integer,
	"PhotoPath"	varchar(250),
	PRIMARY KEY("EmployeeID")
);

-- Table: dim_employeeterritories
CREATE TABLE "dim_employeeterritories" (
	"EmployeeID"	integer NOT NULL,
	"TerritoryID"	integer NOT NULL,
	PRIMARY KEY("EmployeeID"),
	FOREIGN KEY("EmployeeID") REFERENCES "dim_employees"("EmployeeID")
);

-- Table: dim_location
CREATE TABLE "dim_location" (
	"LocationID"	integer NOT NULL,
	"City"	varchar(20),
	"Region"	varchar(20),
	"PostalCode"	varchar(20),
	"Country"	varchar(20),
	PRIMARY KEY("LocationID")
);

-- Table: dim_orders
CREATE TABLE "dim_orders" (
	"OrderID"	integer NOT NULL,
	"CustomerID"	varchar(5),
	"EmployeeID"	integer,
	"ProductID"	integer,
	"ShipperID"	integer,
	"TimeID"	INTEGER,
	"LocationID"	INTEGER,
	"Freight"	varchar,
	"ShipName"	varchar(40),
	"ShipAddress"	varchar(60),
	"ShipVia"	integer,
	PRIMARY KEY("OrderID"),
	FOREIGN KEY("CustomerID") REFERENCES "dim_customers"("CustomerID"),
	FOREIGN KEY("ShipperID") REFERENCES "dim_shippers"("ShipperID"),
	FOREIGN KEY("ProductID") REFERENCES "dim_products"("ProductID"),
	FOREIGN KEY("EmployeeID") REFERENCES "dim_employees"("EmployeeID")
);

-- Table: dim_products
CREATE TABLE "dim_products" (
	"ProductID"	integer NOT NULL,
	"CategoryID"	integer,
	"SupplierID"	integer,
	"ProductName"	varchar(40) NOT NULL,
	"QuantityPreUnit"	varchar(20),
	"UnitPrice"	varchar,
	"ReorderLevel"	smallint,
	"UnitsInStock"	smallint,
	"UnitsOnOrder"	smallint,
	"Discontinued"	bit,
	PRIMARY KEY("ProductID"),
	FOREIGN KEY("CategoryID") REFERENCES "dim_categories"("CategoryID"),
	FOREIGN KEY("SupplierID") REFERENCES "dim_suppliers"("SupplierID")
);

-- Table: dim_shippers
CREATE TABLE "dim_shippers" (
	"ShipperID"	integer NOT NULL,
	"ConmpanyName"	varchar(40) NOT NULL,
	"Phone"	varchar(40),
	PRIMARY KEY("ShipperID")
);

-- Table: dim_suppliers
CREATE TABLE "dim_suppliers" (
	"SupplierID"	integer NOT NULL,
	"Address"	varchar(60),
	"CompanyName"	varchar(40) NOT NULL,
	"ContactName"	varchar(40),
	"ContactTitle"	varchar(40),
	"Fax"	varchar(25),
	"HomePage"	text,
	"Phone"	varchar(15),
	PRIMARY KEY("SupplierID")
);

-- Table: dim_time
CREATE TABLE "dim_time" (
	"TimeID"	integer NOT NULL,
	"Date"	datetime,
	"Year"	integer,
	"MonthName"	varchar,
	"Month"	integer,
	"Quarter"	integer,
	"QuarterName"	varchar,
	"DayOfMonth"	integer,
	"DayofWeek"	integer,
	"DayName"	varchar,
	"Week"	integer,
	"Holiday"	integer,
	"MonthOfQuarter"	integer,
	"DayOfYear"	integer,
	PRIMARY KEY("TimeID")
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
