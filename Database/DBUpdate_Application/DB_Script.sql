CREATE DATABASE CPHackathon
CREATE DATABASE DmartHackathon
CREATE DATABASE HackathornDataLake

======================================================================================================================================================================

CREATE TABLE CP_CUSTOMER
(  
    CUSTOMER_NO nvarchar(10) NOT NULL PRIMARY KEY,
    CUSTOMER_FIRST_NAME nvarchar(50) NOT NULL,  
    CUSTOMER_LAST_NAME nvarchar(50) NOT NULL, 
    CUSTOMER_CUST_CHECK BIT NULL DEFAULT 0
);

CREATE TABLE CP_PRODUCT
(  
    PRODUCT_ID nvarchar(10) NOT NULL PRIMARY KEY,
    PRODUCT_NAME nvarchar(50) NOT NULL,  
    PRODUCT_PRICE nvarchar(10) NOT NULL
);

CREATE TABLE CP_SALES (
    SALES_ID nvarchar(10) NOT NULL PRIMARY KEY,
	SALES_CUST_NO nvarchar(10) FOREIGN KEY REFERENCES CP_CUSTOMER(CUSTOMER_NO),
	SALES_PROD_ID nvarchar(10) FOREIGN KEY REFERENCES CP_PRODUCT(PRODUCT_ID),
	SALES_PROD_NAME nvarchar(50) ,
	SALES_PROD_PRICE nvarchar(10) ,
	SALES_MOVED_TO_LAKE NVARCHAR(5)
);


======================================================================================================================================================================


CREATE TABLE DMART_CUSTOMER
(  
    CUSTOMER_NO nvarchar(10) NOT NULL PRIMARY KEY,
    CUSTOMER_FIRST_NAME nvarchar(50) NOT NULL,  
    CUSTOMER_LAST_NAME nvarchar(50) NOT NULL, 
    CUSTOMER_CUST_CHECK BIT NULL DEFAULT 0
);

CREATE TABLE DMART_PRODUCT
(  
    PRODUCT_ID nvarchar(10) NOT NULL PRIMARY KEY,
    PRODUCT_NAME nvarchar(50) NOT NULL,  
    PRODUCT_PRICE nvarchar(10) NOT NULL
);

CREATE TABLE DMART_SALES 
(
    SALES_ID nvarchar(10) NOT NULL PRIMARY KEY,
	SALES_CUST_NO nvarchar(10) FOREIGN KEY REFERENCES DMART_CUSTOMER(CUSTOMER_NO),
	SALES_PROD_ID nvarchar(10) FOREIGN KEY REFERENCES DMART_PRODUCT(PRODUCT_ID),
	SALES_PROD_NAME nvarchar(50) ,
	SALES_PROD_PRICE nvarchar(10) ,
	SALES_MOVED_TO_LAKE NVARCHAR(5)
)

======================================================================================================================================================================

CREATE TABLE SALESDATA
(  
	SD_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    SD_CUST_NO nvarchar(10) NOT NULL,
    SD_PROD_ID nvarchar(10) NOT NULL, 
	SD_PRODUCT_NAME nvarchar(50) NOT NULL,
	SD_PRODUCT_PRICE nvarchar(10) NOT NULL,
    SD_STORE_ID nvarchar(50) NOT NULL
);

======================================================================================================================================================================


INSERT INTO DBO.CP_CUSTOMER(
    CUSTOMER_NO,
    CUSTOMER_FIRST_NAME,
    CUSTOMER_LAST_NAME
   )
VALUES (
    'RD100'
   ,'Ritesh'
   ,'Deshmukh'
   ) 

INSERT INTO DBO.CP_CUSTOMER(
    CUSTOMER_NO,
    CUSTOMER_FIRST_NAME,
    CUSTOMER_LAST_NAME
   )
VALUES (
    'SK200'
   ,'Shahrukh'
   ,'Khan'
   )

INSERT INTO DBO.CP_CUSTOMER(
    CUSTOMER_NO,
    CUSTOMER_FIRST_NAME,
    CUSTOMER_LAST_NAME
   )
VALUES (
    'KK300'
   ,'Kareena'
   ,'Kapoor'
   )
   
======================================================================================================================================================================
   

   
INSERT INTO DBO.DMART_CUSTOMER(
    CUSTOMER_NO,
    CUSTOMER_FIRST_NAME,
    CUSTOMER_LAST_NAME
   )
VALUES (
    'RD100'
   ,'Ritesh'
   ,'Deshmukh'
   ) 

INSERT INTO DBO.DMART_CUSTOMER(
    CUSTOMER_NO,
    CUSTOMER_FIRST_NAME,
    CUSTOMER_LAST_NAME
   )
VALUES (
    'SK200'
   ,'Shahrukh'
   ,'Khan'
   )

INSERT INTO DBO.DMART_CUSTOMER(
    CUSTOMER_NO,
    CUSTOMER_FIRST_NAME,
    CUSTOMER_LAST_NAME
   )
VALUES (
    'KK300'
   ,'Kareena'
   ,'Kapoor'
   )
   
======================================================================================================================================================================
   

   INSERT INTO DBO.CP_PRODUCT(
    PRODUCT_ID,
    PRODUCT_NAME,
	PRODUCT_PRICE
   )
VALUES (
    'CD001',
   'Cadbury',
   '50'
   ) 


INSERT INTO DBO.CP_PRODUCT(
    PRODUCT_ID,
    PRODUCT_NAME,
	PRODUCT_PRICE
   )
VALUES (
    'PK002',
   'Park',
   '30'
   ) 


INSERT INTO DBO.CP_PRODUCT(
    PRODUCT_ID,
    PRODUCT_NAME,
	PRODUCT_PRICE
   )
VALUES (
    'BR003',
   'Biryani',
   '400'
   ) 

   
INSERT INTO DBO.CP_PRODUCT(
    PRODUCT_ID,
    PRODUCT_NAME,
	PRODUCT_PRICE
   )
VALUES (
    'LS004',
   'Lassi',
   '50'
   ) 

INSERT INTO DBO.CP_PRODUCT(
    PRODUCT_ID,
    PRODUCT_NAME,
	PRODUCT_PRICE
   )
VALUES (
    'ID005',
   'Idli',
   '100'
   )
   
   
======================================================================================================================================================================

   
  INSERT INTO DBO.DMART_PRODUCT(
    PRODUCT_ID,
    PRODUCT_NAME,
	PRODUCT_PRICE
   )
VALUES (
    'CD001',
   'Cadbury',
   '50'
   ) 


INSERT INTO DBO.DMART_PRODUCT(
    PRODUCT_ID,
    PRODUCT_NAME,
	PRODUCT_PRICE
   )
VALUES (
    'PK002',
   'Park',
   '30'
   ) 


INSERT INTO DBO.DMART_PRODUCT(
    PRODUCT_ID,
    PRODUCT_NAME,
	PRODUCT_PRICE
   )
VALUES (
    'BR003',
   'Biryani',
   '400'
   ) 

   
INSERT INTO DBO.DMART_PRODUCT(
    PRODUCT_ID,
    PRODUCT_NAME,
	PRODUCT_PRICE
   )
VALUES (
    'SD004',
   'Pepsi',
   '50'
   ) 

INSERT INTO DBO.DMART_PRODUCT(
    PRODUCT_ID,
    PRODUCT_NAME,
	PRODUCT_PRICE
   )
VALUES (
    'DS005',
   'Dosa',
   '200'
   )
   
======================================================================================================================================================================
   
   
INSERT INTO DBO.CP_SALES(
    SALES_ID,
    SALES_CUST_NO,
	SALES_PROD_ID,
	SALES_PROD_NAME,
	SALES_PROD_PRICE,
	SALES_MOVED_TO_LAKE
   )
VALUES (
    'CP001',
   'KK300',
   'BR003',
   'Biryani',
   '400',
   'N'
   )

   INSERT INTO DBO.CP_SALES(
    SALES_ID,
    SALES_CUST_NO,
	SALES_PROD_ID,
	SALES_PROD_NAME,
	SALES_PROD_PRICE,
	SALES_MOVED_TO_LAKE
   )
VALUES (
    'CP002',
   'RD100',
   'ID005',
   'Idli',
   '100',
   'N'
   )

   INSERT INTO DBO.CP_SALES(
    SALES_ID,
    SALES_CUST_NO,
	SALES_PROD_ID,
	SALES_PROD_NAME,
	SALES_PROD_PRICE,
	SALES_MOVED_TO_LAKE
   )
VALUES (
    'CP003',
   'SK200',
   'CD001',
   'Cadbury',
   '50',
   'N'
   )

======================================================================================================================================================================
   
   
 INSERT INTO DBO.DMART_SALES(
    SALES_ID,
    SALES_CUST_NO,
	SALES_PROD_ID,
	SALES_PROD_NAME,
	SALES_PROD_PRICE,
	SALES_MOVED_TO_LAKE
   )
VALUES (
    'DM001',
   'KK300',
   'SD004',
   'Pepsi',
   '50',
   'N'
   )

   INSERT INTO DBO.DMART_SALES(
    SALES_ID,
    SALES_CUST_NO,
	SALES_PROD_ID,
	SALES_PROD_NAME,
	SALES_PROD_PRICE,
	SALES_MOVED_TO_LAKE
   )
VALUES (
    'DM002',
   'RD100',
   'BR003',
   'Biryani',
   '400',
   'N'
   )

   INSERT INTO DBO.DMART_SALES(
    SALES_ID,
    SALES_CUST_NO,
	SALES_PROD_ID,
	SALES_PROD_NAME,
	SALES_PROD_PRICE,
	SALES_MOVED_TO_LAKE
   )
VALUES (
    'DM003',
   'SK200',
   'CD001',
   'Cadbury',
   '50',
   'N'
   )

