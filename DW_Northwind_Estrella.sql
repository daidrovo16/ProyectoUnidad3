--
-- File generated with SQLiteStudio v3.3.3 on sá. feb. 26 14:09:40 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: dim_customer
CREATE TABLE dim_customer ( 
	CustomerID           integer NOT NULL  PRIMARY KEY  ,
	CompanyName          varchar(40)     ,
	ContactName          varchar(40)     ,
	Address              varchar(40)     ,
	Phone                varchar(15)     ,
	Fax                  varchar(25)     ,
	LocationID           integer     
 );

-- Table: dim_employee
CREATE TABLE dim_employee ( 
	EmployeeID           integer NOT NULL  PRIMARY KEY  ,
	LocationID           integer     ,
	LastName             varchar(40)     ,
	FirstName            varchar(40)     ,
	Title                varchar(40)     ,
	TitleOfCourtesy      varchar(40)     ,
	BirthDate            datetime     ,
	HireDate             datetime     ,
	Address              varchar(50)     ,
	HomePhone            varchar(40)     ,
	Extension            varchar(10)     ,
	ReportsTo            integer     
 );

-- Table: dim_location
CREATE TABLE dim_location ( 
	LocationID           integer NOT NULL  PRIMARY KEY  ,
	City                 varchar(20)     ,
	Region               varchar(20)     ,
	PostalCode           varchar(20)     ,
	Country              varchar(20)     
 );

-- Table: dim_product
CREATE TABLE dim_product ( 
	ProductID            integer NOT NULL  PRIMARY KEY  ,
	SupplierID           integer     ,
	ProdcutName          varchar(40)     ,
	QuantityPerUnit      varchar(40)     ,
	UnitPrice            varchar     ,
	UnitsInStock         smallint     ,
	UnitsOnOrder         smallint     ,
	ReorderLevel         smallint     ,
	Discontinued         bit     ,
	CategoryName         varchar(40)     ,
	Description          text     
 );

-- Table: dim_shipper
CREATE TABLE dim_shipper ( 
	ShipperID            integer NOT NULL  PRIMARY KEY  ,
	CompanyName          varchar(60)     ,
	Phone                varchar(15)     
 );

-- Table: dim_supplier
CREATE TABLE dim_supplier ( 
	SupplierID           integer NOT NULL  PRIMARY KEY  ,
	CompanyName          varchar(40)     ,
	ContactName          varchar(40)     ,
	Address              varchar(60)     ,
	Phone                varchar(15)     ,
	Fax                  varchar(40)     ,
	LocationID           integer     
 );

-- Table: dim_time
CREATE TABLE dim_time ( 
	TimeID               integer NOT NULL  PRIMARY KEY  ,
	Date                 datetime     ,
	Year                 integer     ,
	MonthName            varchar     ,
	Month                integer     ,
	Quarter              integer     ,
	QuarterName          varchar     ,
	DayOfMonth           integer     ,
	DayofWeek            integer     ,
	DayName              varchar     ,
	Week                 integer     ,
	Holiday              integer     ,
	MonthOfQuarter       integer     ,
	DayOfYear            integer     
 );

-- Table: factsales_order
CREATE TABLE factsales_order ( 
	OrderID              integer NOT NULL  PRIMARY KEY  ,
	EmployeeID           integer     ,
	ShipperID            integer     ,
	LocationID           integer     ,
	ProductID            integer     ,
	SupplierID           integer     ,
	RequeriedDate        datetime     ,
	ShippedDate          datetime     ,
	Freight              varchar     ,
	CategoryName         varchar(45)     ,
	UnitPrice            varchar     ,
	Quantity             smallint     ,
	Discount             bit     ,
	Total                varchar     ,
	TimeID               integer     ,
	CustomerID           integer     ,
	FOREIGN KEY ( TimeID ) REFERENCES dim_time( TimeID )  ,
	FOREIGN KEY ( CustomerID ) REFERENCES dim_customer( CustomerID )  ,
	FOREIGN KEY ( LocationID ) REFERENCES dim_location( LocationID )  ,
	FOREIGN KEY ( EmployeeID ) REFERENCES dim_employee( EmployeeID )  ,
	FOREIGN KEY ( ShipperID ) REFERENCES dim_shipper( ShipperID )  ,
	FOREIGN KEY ( SupplierID ) REFERENCES dim_supplier( SupplierID )  ,
	FOREIGN KEY ( ProductID ) REFERENCES dim_product( ProductID )  
 );

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
