# Database Design Project: Building A Business Database from Scratch
---

<img src="https://github.com/Ebuka456/Database-Design/blob/main/Project%20Create%20a%20Database/database-concept-database-design-on-digital-background-FYT7BG.jpg" alt="Alt text" style= "width: 900px; height: 450px"/>

## 🟠 Introduction
---
In a nutshell, a database is like having a reliable and organized assistant that helps a business keep track of everything, make smarter decisions, and ensure data security. It's a must-have tool that keeps the business running smoothly and ensures its success in the fast-paced world of today.

## 🟠 Project Overview
---
Recently, a business owner approached me seeking assistance in creating a brand-new database for their company. They needed a database built from scratch to efficiently manage their business operations. I gladly accepted the challenge and embarked on the journey of designing a robust and tailored database solution to meet their unique needs.

The business data is currently on an excel file. You can download the Excel file here. A snapshot of the data is seen below. The data has 31 columns and 1000 rows. The Database Management System used for this project is MySQL (MySQL WorkBench).

After reviewing the data structure and the steps needed to help the business, I have broken down these steps into the following steps
- Database Creation & Data Loading
- Normalization and Denormalization
- Database Diagram Design
- Table Alterations
- Views, Triggers, and Stored Procedures
- User Management and Privileges
- Database Backup


## 🟠 Database Creation & Data Loading
---
Before creating the database, the data on excel was examined and cleaned then saved in a CSV format.
Cleaning steps involves
- Ensuring Date types are in "yyyy-mm-dd"
- Ensuring the right number format is used. Presence of currency symbols or comma separators or any symbols are not allowed

The next step I took was to create a database and load the data into my database. The database name of choice is `db_northwind` 
The SQL script below was used to create the database, create the table and load the dataset into the table is seen below

``` sql
-- Dropping the database if it exists 
DROP DATABASE IF EXISTS db_northwind;

-- creating the database using character encoding of utf-8
CREATE DATABASE db_northwind DEFAULT CHARACTER SET utf8mb4;

-- to check if the database was created 
SHOW DATABASES;

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
    product_unitPrice DECIMAL(10,2),
    unitsInStock INT,
    unitsOnOrder INT,
    reorderLevel INT,
    discontinued TINYINT,
    categoryName VARCHAR(255),
    supplier_CompanyName VARCHAR(255),
    supplier_ContactName VARCHAR(255),
    supplier_ContactTitle VARCHAR(255)
);

-- INSERTING DATA INTO THE CREATED TABLE
LOAD DATA LOCAL INFILE 'C:/Users/Data Analytics/MySQL DBA/Northwind.csv' 
          -- table path
INTO TABLE TblNorthwind
FIELDS TERMINATED BY ',' -- for a csv file
ENCLOSED BY '"' -- for the strings
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- ignore the headers

-- to check the table for the loaded data
SELECT *
FROM TblNorthwind;
```

## 🟠 Normalization and Denormalization
---
After observing the imported data, I noticed the data is denormalized. This brings me to my next step, Data Normalization

Normalization involves organizing data based on assigned attributes as a part of a larger data model. The main objective of database normalization is to eliminate redundant data, minimize data modification errors, and simplify the query process.

After Normalizing the table, The table was sub-divided into the following entities
- `Customers`
- `Categories`
- `Suppliers`
- `Products`
- `Orders`
- `Employees`

## 🟠 Database Diagram Design and Table Alterations
---
The next step is to design an ER (Entity Relationship) Diagram. ER diagrams use symbols to represent entities, attributes, and relationships, which help to illustrate the relationships between the entities in the database. 

Using the Reverse Engineer feature of MySQL, I was able to create the ER Diagram below

![Database Schema](https://github.com/Ebuka456/Database-Design/blob/main/Project%20Create%20a%20Database/Database%20ERD%20Model.png)

The scripts used to alter the table constraints and make modifications can be found [HERE](https://github.com/Ebuka456/Database-Design/blob/main/Project%20Create%20a%20Database/SQL%20Script%20for%20database%20project.sql)

## 🟠 Creating Views, Triggers, and Stored Procedures
---

At this point, the database for the business has been setup. The business owner made three requests.

- Create a view that shows the number of Quantity sold and The Revenue made by Each Employee
- Create a Trigger on the products table that automatically removes the number of Units of product in stock, after an order has been made
- Write a Procedure to check if a certain products needs to be restocked and also list the products that needs to be restocked

Below is the scripts used to write the stored procedure

``` sql
-- Creating a stored procedure

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

-- To test if the procedures worked, to check if the product that contains
-- "che" has reached restocked level
CALL getRestock_products("che");

```

The views and triggers created can created to help the business can be found in the scripts.

## 🟠 User Management and Privileges

![](https://github.com/Ebuka456/Database-Design/blob/main/Project%20Create%20a%20Database/Screenshot%202023-08-01%20071623.png)

The business Owner requested I created two users; a Database Administrator and a Data Analyst and grant them some privileges on the database.

I Created two Users and give them access to the database. The first user, "TuckerReilly", will be a DBA, and should get full database administrator privileges. The second user, "EllaBrody" is an Analyst and only need read access.

Designing a database also entails User Management, Granting and Revoking User privileges. This would be done using SQL commands GRANT and REVOKE.


## 🟠 Database Backup
The primary purpose of backing up a database is to create a duplicate copy of its data and structure at a specific point in time. This process involves making a snapshot of the entire database or selected portions of it, and storing this copy in a secure location.

This database was backed up on a Hard Drive using MySQL local instance Data Export feature.

## 🟠 Relevance to Business Owners
Having a database helps the business run smoothly and efficiently. It stores all the important data in one place, making it easy to find what we need whenever we need it. It's like having everything neatly sorted and labeled, so we can access information with just a few clicks.

A database also helps the business make better decisions. It can show us which products are selling well, who our most loyal customers are, and how much money we're making. Armed with this information, we can plan and strategize to grow the business and keep customers happy.

Moreover, a database keeps data safe and secure. It makes sure only the right people can access sensitive information and prevents unauthorized access. Just like we lock our important documents in a safe, a database acts as a digital safe for our business data.

---

![](https://github.com/Ebuka456/Database-Design/blob/main/Project%20Create%20a%20Database/thank%20you.gif)

Thank you for Reading!
