/* 
PROJECT: BUILD A BUSINESS DATABASE
A new client, the owner of a business has reached out for help building his business a database 
from the ground up 

THE OBJECTIVE
Design a database from scratch, which will capture information about the Categories, his Customers,
his Suppliers, his Orders, his Products and his Employees
*/

---------------------------------------------------------------------------------------------------------
-- DATABASE CREATION

-- Dropping the database if it exists 
DROP DATABASE IF EXISTS db_northwind;
-- creating the database using character encoding of utf-8
CREATE DATABASE db_northwind DEFAULT CHARACTER SET utf8mb4;

-- to check if the database was created 
SHOW DATABASES;
-- Another technique to use to check for databases can be seen below
/*
SELECT * 
FROM information_schema.columns
WHERE TABLE_SCHEMA = "northwind"
*/

-- CREATING THE TABLE
/* 
The data is in a CSV file and after observing the data, I figured out that the data is non-normalized and it 
would normalized after importing the data to a table. 

The next step is to create a table
*/
-- to make the db_northwind database the active database 
USE db_northwind;

-- To drop the table if it exists
DROP TABLE IF EXISTS TblNorthwind;

-- TO create the table for the northwind data
CREATE TABLE TblNorthwind (
    orderID INT,
    customerID INT,
    employeeID INT,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    shipVia INT,
    Freight DECIMAL(10,2),
    productID INT,
    unitPrice DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    companyName VARCHAR(255),
    contactName VARCHAR(255),
    contactTitle VARCHAR(255),
    lastName VARCHAR(255),
    firstName VARCHAR(255),
    title VARCHAR(255),
    productName VARCHAR(255),
    supplierID INT,
    categoryID INT,
    quantityPerUnit VARCHAR(255),
    unitPrice_1 DECIMAL(10,2),
    unitsInStock INT,
    unitsOnOrder INT,
    reorderLevel INT,
    discontinued TINYINT,
    categoryName VARCHAR(255),
    supplierCompanyName VARCHAR(255),
    supplierContactName VARCHAR(255),
    supplierContactTitle VARCHAR(255)
);

-- INSERTING DATA INTO THE CREATED TABLE
/* 
Currently, the dataset sits in my local device so I could either use the 
- Table Data Import WIzard
- Use a query to load the data from your local device

The Table Data Import Wizard was used because I was having diffulties scaling through this error

"ERROR: 3948: Loading local data is disabled; this must be enabled on both the client and server sides"

but this is the code to load using MySQL Command Prompt
*/

LOAD DATA LOCAL INFILE 'C:/Users/Data Analytics/SQL/MySQL DBA/Project Create a Database/Northwind.csv' -- table path
INTO TABLE TblNorthwind
FIELDS TERMINATED BY ',' -- csv file
ENCLOSED BY '"' -- for the strings
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- ignore the headers

-- to check the table for the loaded data
SELECT *
FROM TblNorthwind;

-- DATA NORMALIZATION
/* 
The data is denormalized and this section covers the normalization of the table. After observing the structure of the data,
I would be using the third normal form (3nf) normalization technique to normalize the table into several entities.
*/

-- To get the column names of the dataset
DESCRIBE TblNorthwind;

-- TO CREATE THE CUSTOMER TABLE
CREATE TABLE IF NOT EXISTS customers AS
SELECT DISTINCT customerID,
	   companyName,
       contactName,
       contactTitle       
FROM TblNorthwind;

-- To check if the table was created and the data was loaded
SELECT *
FROM customers;

-- TO CREATE THE CATEGORIES TABLE
CREATE TABLE IF NOT EXISTS categories AS 
SELECT DISTINCT categoryID,
	   categoryName
FROM TblNorthwind
ORDER BY categoryID;

-- To check if the table was created and the data was loaded
SELECT *
FROM categories;

-- TO CREATE THE SUPPLIERS TABLE
CREATE TABLE IF NOT EXISTS suppliers AS
SELECT DISTINCT supplierID,
	   suppliers_companyName AS companyName,
       suppliers_contactName AS contactName,
       suppliers_contactTitle AS contactTitle
FROM TblNorthwind
ORDER BY supplierID;


-- To check if the table was created and the data was loaded
SELECT *
FROM suppliers;

-- TO CREATE THE PRODUCT TABLE
CREATE TABLE IF NOT EXISTS products AS
SELECT DISTINCT productID,
	   productName,
       categoryID,
       supplierID,
       quantityPerUnit,
       product_unitPrice,
	   unitsInStock,
	   unitsOnOrder,
	   reorderLevel,
	   discontinued
FROM TblNorthwind
ORDER BY productID;

-- To check if the table was created and the data was loaded
SELECT *
FROM products;


-- TO CREATE THE EMPLOYEES TABLE
CREATE TABLE IF NOT EXISTS employees AS
SELECT DISTINCT employeeID,
       employees_lastName,
       employees_firstName,
       CONCAT(employees_firstName, ' ', employees_lastName) AS full_name,
       employees_title
FROM TblNorthwind
ORDER BY employeeID;

-- To check if the table was created and the data was loaded
SELECT *
FROM employees;

-- TO CREATE THE ORDERS TABLE
CREATE TABLE IF NOT EXISTS orders AS
SELECT orderID,
	   customerID,
       employeeID,
       STR_TO_DATE(orderDate, '%m/%d/%Y') orderDate,
       STR_TO_DATE(requiredDate, '%m/%d/%Y') requiredDate,
       STR_TO_DATE(shippedDate, '%m/%d/%Y') shippedDate,
       shipVia,
       Freight,
       productID,
       unitPrice,
       quantity,
       discount
FROM TblNorthwind
ORDER BY orderID;


-- To check if the table was created and the data was loaded
SELECT *
FROM orders;

-- ALTER TABLE CONSTRAINTS
/* 
In this section, I would be altering the table constraints of the respective tables in the database
*/

-- FOR THE CATEGORIES TABLE
DESCRIBE categories;

-- From observing the table, the category ID should be a Primary key (NOT NULL & UNIQUE) and AUTO INCREMENT. 
-- The CategoryName column should be not be null and it should be Unique. The datatype should be VARCHAR(255)
-- To Alter the table constraints below

ALTER TABLE categories
MODIFY categoryID INT AUTO_INCREMENT PRIMARY KEY, -- For Category ID
MODIFY categoryName VARCHAR(255) NOT NULL UNIQUE; -- For Category Name

-- FOR THE CUSTOMERS TABLE
DESCRIBE customers;

/* 
From observing the table, the customerID is the Primary Key. The Company Name, Contact Name and Contact Title
column should not be null. 
*/

ALTER TABLE customers 
CHANGE COLUMN customerID customerID CHAR(5) NOT NULL ,
CHANGE COLUMN companyName companyName VARCHAR(255) NOT NULL ,
CHANGE COLUMN contactName contactName VARCHAR(255) NOT NULL ,
CHANGE COLUMN contactTitle contactTitle VARCHAR(255) NOT NULL ,
ADD PRIMARY KEY (customerID);
;

-- FOR THE SUPPLIERS TABLE
DESCRIBE suppliers;

/* 
From observing the columns in the table, the supplierID is the Primary Key and AUTO INCREMENT. The companyname, contactname 
and contactTitle should not be null
*/

ALTER TABLE suppliers 
CHANGE COLUMN supplierID supplierID INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN companyName companyName VARCHAR(255) NOT NULL ,
CHANGE COLUMN contactName contactName VARCHAR(255) NOT NULL ,
CHANGE COLUMN contactTitle contactTitle VARCHAR(255) NOT NULL ,
ADD PRIMARY KEY (supplierID),
ADD UNIQUE INDEX supplierID_UNIQUE (supplierID ASC) VISIBLE;
;


-- FOR THE EMPLOYEES TABLE
DESCRIBE employees;

/* 
From observing the table, the Employee ID is the Primary Key & Auto Increment then other columns are Not Null and the Data type
would be changed to VARCHAR(255)
*/

ALTER TABLE employees
CHANGE COLUMN employeeID employeeID INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN employees_lastName employees_lastName VARCHAR(255) NOT NULL ,
CHANGE COLUMN employees_firstName employees_firstName VARCHAR(255) NOT NULL ,
CHANGE COLUMN full_name full_name VARCHAR(255) NOT NULL ,
CHANGE COLUMN employees_title employees_title VARCHAR(255) NOT NULL ,
ADD PRIMARY KEY (employeeID);
;


-- FOR THE PRODUCTS TABLE
DESCRIBE products;

/* 
From my Observation, Product ID is the Primary Key, Category ID and Supplier ID are Foreign keys. Discontinued is a Boolean 
so it would be TinyINT since MySQL doesnt support Boolean. The Unit Price should be a Decimal Data Type. 
*/ 

ALTER TABLE products 
CHANGE COLUMN productID productID INT NOT NULL ,
CHANGE COLUMN productName productName VARCHAR(255) NOT NULL ,
CHANGE COLUMN quantityPerUnit quantityPerUnit VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN product_unitPrice product_unitPrice DECIMAL(10,2) NULL DEFAULT NULL ,
CHANGE COLUMN discontinued discontinued TINYINT NULL DEFAULT NULL ,
ADD PRIMARY KEY (productID),
ADD UNIQUE INDEX productName_UNIQUE (productName ASC) VISIBLE,
ADD INDEX Supplier_fk_idx (supplierID ASC) VISIBLE,
ADD INDEX Category_fk_idx (categoryID ASC) VISIBLE;
;

-- To Include the Foreign key for Supplier ID and Category ID
ALTER TABLE products 
ADD CONSTRAINT Supplier_fk
  FOREIGN KEY (supplierID)
  REFERENCES db_northwind.suppliers (supplierID)
  ON DELETE CASCADE 
  ON UPDATE RESTRICT,
ADD CONSTRAINT Category_fk
  FOREIGN KEY (categoryID)
  REFERENCES db_northwind.categories (categoryID)
  ON DELETE CASCADE 
  ON UPDATE RESTRICT;
  

-- FOR THE ORDERS TABLE
DESCRIBE orders;

/* AFter observing the tabel, the following constraints were added to the table */

ALTER TABLE orders 
CHANGE COLUMN orderID orderID INT NOT NULL ,
CHANGE COLUMN customerID customerID CHAR(5) NULL DEFAULT NULL ,
CHANGE COLUMN productID productID INT NOT NULL ,
CHANGE COLUMN unitPrice unitPrice DOUBLE NOT NULL ,
CHANGE COLUMN quantity quantity INT NOT NULL ,
ADD INDEX employee_fk_idx (employeeID ASC) VISIBLE,
ADD INDEX customer_fk_idx (customerID ASC) VISIBLE,
ADD INDEX product_fk_idx (productID ASC) VISIBLE;


-- To add the foreign key to the tables
ALTER TABLE db_northwind.orders 
ADD CONSTRAINT employee_fk
  FOREIGN KEY (employeeID)
  REFERENCES db_northwind.employees (employeeID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT customer_fk
  FOREIGN KEY (customerID)
  REFERENCES db_northwind.customers (customerID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT product_fk
  FOREIGN KEY (productID)
  REFERENCES db_northwind.products (productID)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-------------------------------------------------------------------------------------------------------------
-- TASK: Create a View to show the number of Quantity sold and The Revenue made by Each Employee
CREATE OR REPLACE VIEW employee_record AS
SELECT e.employeeID,
	   e.full_name AS "Full Name",
       e.employees_title AS "Title",
	   SUM(o.quantity) AS "Quantity Sold",
       CONCAT( '$',
		  ROUND(SUM(o.unitPrice * o.quantity), 2)
          ) AS Revenue
FROM employees e JOIN
	 orders o 
     ON e.employeeID = o.employeeID
GROUP BY e.employeeID,
		 e.full_name,
         e.employees_title
ORDER BY SUM(o.unitPrice * o.quantity) DESC
;

-- To check the results of the view
SELECT *
FROM employee_record;

-- TASK: Create a Trigger on the products table that automatically removes the number of Units of product in stock, after 
-- an order has been made

-- To fist drop the Trigger if it exists
DROP TRIGGER update_products;

-- To create the trigger
DELIMITER //
CREATE TRIGGER update_products
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
UPDATE products
SET unitsInStock = products.unitsInStock - NEW.quantity
WHERE productID = NEW.productID;
END //
DELIMITER ;

-- To test the trigger, rows would be added to the Orders table
INSERT INTO orders (orderID, customerID, employeeID, orderDate, requiredDate, shippedDate, shipVia, Freight, 
	productID, unitPrice, quantity, discount)
VALUES
(10626, 'WARTH', 2, '2023-07-30', '2023-08-10', '2023-08-05', 3, 25.50, 14, 10.99, 5, 0),
(2, 102, 202, '2023-07-31', '2023-08-11', '2023-08-06', 2, 15.75, 1002, 12.49, 2, 0.05),
(3, 103, 203, '2023-08-01', '2023-08-12', '2023-08-07', 1, 10.00, 1003, 8.99, 8, 0)
-- Add more rows as needed
;

-- TASK: Write a Procedure to list the products that needs to be restocked
/* 
Products that needs to be restocked are products that the amount of unit in stock is less
than the reorder level. So a procedure would be used to generate the list of products that fall
into this category. 

This helps the business Owner identify the products that need to be restocked
*/
DELIMITER $$
CREATE PROCEDURE getRestock_products ( IN product_name VARCHAR(255))
BEGIN
-- TAKING THE LOWER CASE OF THE INPUT PARAMETER
SET product_name = LOWER(product_name);
-- To check if a certain product needs to be restocked
SELECT productName,
	   CASE WHEN unitsInStock < reorderLevel THEN "Restock Level reached"
       WHEN unitsInStock = reorderLevel THEN "On Restock Level"
       WHEN unitsInStock - reorderLevel <= 5 THEN "Close to Restock Level"
       ELSE "Above Restocked Level"
       END AS "Restock Status"
FROM products
WHERE LOWER(productName) LIKE CONCAT('%', product_name, '%');

-- Products that needs to be restocked
SELECT productID,
	   productName,
       unitsInStock,
       reorderLevel
FROM products
WHERE unitsInStock < reorderLevel;
END $$
DELIMITER ;

-- To test if the procedures worked
CALL getRestock_products("che");


-- TASK: CREATE TWO USERS AND GIVE THEM ACCESS TO THE DATABASE 
/* 
THE FIRST USER "TuckerRelly" WILL BE A DBA AND SHOULD GET FULL DATABASE ADMINISTRATOR PRIVILEGES
THE SECOND USER "EllaBrody" IS AN ANALYST AND NEEDS READ ACCESS
*/

-- To check for the existing privileges granted
SHOW GRANTS FOR 
root@localhost;

-- USER CREATION

-- FOR THE FIRST USER NAMED "TuckerRelly"
CREATE USER IF NOT EXISTS
'TuckerRelly'@'localhost'
IDENTIFIED BY 'user_password';

-- FOR THE SECOND USER NAMED "EllaBrody"
CREATE USER IF NOT EXISTS
'EllaBrody'@'localhost'
IDENTIFIED BY 'user_password';

-- ASSIGNING USER PRIVILEGES

-- FOR THE FIRST USER, PRIVILEGES ARE FULL DATABASE ADMINISTRATOR
-- DBA GETS FULL PRIVILEGES ON THE DATABASE
GRANT ALL PRIVILEGES
ON db_northwind.*
TO 'TuckerRelly'@'localhost';

-- FOR THE SECOND USER, PRIVILEGES ARE FOR A DATA ANALYST
-- DATA ANALYSTS GET READ ONLY ACCESS WHICH IS ONLY THE SELECT STATEMENT
GRANT 
	SELECT
ON db_northwind.*
TO 'EllaBrody'@'localhost';