-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_northwind
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productID` int NOT NULL,
  `productName` varchar(255) NOT NULL,
  `categoryID` int DEFAULT NULL,
  `supplierID` int DEFAULT NULL,
  `quantityPerUnit` varchar(255) DEFAULT NULL,
  `product_unitPrice` decimal(10,2) DEFAULT NULL,
  `unitsInStock` int DEFAULT NULL,
  `unitsOnOrder` int DEFAULT NULL,
  `reorderLevel` int DEFAULT NULL,
  `discontinued` tinyint DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productName_UNIQUE` (`productName`),
  KEY `Supplier_fk_idx` (`supplierID`),
  KEY `Category_fk_idx` (`categoryID`),
  CONSTRAINT `Category_fk` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `Supplier_fk` FOREIGN KEY (`supplierID`) REFERENCES `suppliers` (`supplierID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Chai',1,1,'10 boxes x 20 bags',18.00,39,0,10,0),(2,'Chang',1,1,'24 - 12 oz bottles',19.00,17,40,25,0),(3,'Aniseed Syrup',2,1,'12 - 550 ml bottles',10.00,13,70,25,0),(4,'Chef Anton\'s Cajun Seasoning',2,2,'48 - 6 oz jars',22.00,53,0,0,0),(5,'Chef Anton\'s Gumbo Mix',2,2,'36 boxes',21.00,0,0,0,1),(6,'Grandma\'s Boysenberry Spread',2,3,'12 - 8 oz jars',25.00,120,0,25,0),(7,'Uncle Bob\'s Organic Dried Pears',7,3,'12 - 1 lb pkgs.',30.00,15,0,10,0),(8,'Northwoods Cranberry Sauce',2,3,'12 - 12 oz jars',40.00,6,0,0,0),(9,'Mishi Kobe Niku',6,4,'18 - 500 g pkgs.',97.00,29,0,0,1),(10,'Ikura',8,4,'12 - 200 ml jars',31.00,31,0,0,0),(11,'Queso Cabrales',4,5,'1 kg pkg.',21.00,22,30,30,0),(12,'Queso Manchego La Pastora',4,5,'10 - 500 g pkgs.',38.00,86,0,0,0),(13,'Konbu',8,6,'2 kg box',6.00,24,0,5,0),(14,'Tofu',7,6,'40 - 100 g pkgs.',23.00,30,0,0,0),(15,'Genen Shouyu',2,6,'24 - 250 ml bottles',16.00,39,0,5,0),(16,'Pavlova',3,7,'32 - 500 g boxes',17.00,29,0,10,0),(17,'Alice Mutton',6,7,'20 - 1 kg tins',39.00,0,0,0,1),(18,'Carnarvon Tigers',8,7,'16 kg pkg.',63.00,42,0,0,0),(19,'Teatime Chocolate Biscuits',3,8,'10 boxes x 12 pieces',9.00,25,0,5,0),(20,'Sir Rodney\'s Marmalade',3,8,'30 gift boxes',81.00,40,0,0,0),(21,'Sir Rodney\'s Scones',3,8,'24 pkgs. x 4 pieces',10.00,3,40,5,0),(22,'Gustaf\'s Knäckebröd',5,9,'24 - 500 g pkgs.',21.00,104,0,25,0),(23,'Tunnbröd',5,9,'12 - 250 g pkgs.',9.00,61,0,25,0),(24,'Guaraná Fantástica',1,10,'12 - 355 ml cans',5.00,20,0,0,1),(25,'NuNuCa Nuß-Nougat-Creme',3,11,'20 - 450 g glasses',14.00,76,0,30,0),(26,'Gumbär Gummibärchen',3,11,'100 - 250 g bags',31.00,15,0,0,0),(27,'Schoggi Schokolade',3,11,'100 - 100 g pieces',44.00,49,0,30,0),(28,'Rössle Sauerkraut',7,12,'25 - 825 g cans',46.00,26,0,0,1),(29,'Thüringer Rostbratwurst',6,12,'50 bags x 30 sausgs.',124.00,0,0,0,1),(30,'Nord-Ost Matjeshering',8,13,'10 - 200 g glasses',26.00,10,0,15,0),(31,'Gorgonzola Telino',4,14,'12 - 100 g pkgs',13.00,0,70,20,0),(32,'Mascarpone Fabioli',4,14,'24 - 200 g pkgs.',32.00,9,40,25,0),(33,'Geitost',4,15,'500 g',3.00,112,0,20,0),(34,'Sasquatch Ale',1,16,'24 - 12 oz bottles',14.00,111,0,15,0),(35,'Steeleye Stout',1,16,'24 - 12 oz bottles',18.00,20,0,15,0),(36,'Inlagd Sill',8,17,'24 - 250 g  jars',19.00,112,0,20,0),(37,'Gravad lax',8,17,'12 - 500 g pkgs.',26.00,11,50,25,0),(38,'Côte de Blaye',1,18,'12 - 75 cl bottles',264.00,17,0,15,0),(39,'Chartreuse verte',1,18,'750 cc per bottle',18.00,69,0,5,0),(40,'Boston Crab Meat',8,19,'24 - 4 oz tins',18.00,123,0,30,0),(41,'Jack\'s New England Clam Chowder',8,19,'12 - 12 oz cans',10.00,85,0,10,0),(42,'Singaporean Hokkien Fried Mee',5,20,'32 - 1 kg pkgs.',14.00,26,0,0,1),(43,'Ipoh Coffee',1,20,'16 - 500 g tins',46.00,17,10,25,0),(44,'Gula Malacca',2,20,'20 - 2 kg bags',19.00,27,0,15,0),(45,'Rogede sild',8,21,'1k pkg.',10.00,5,70,15,0),(46,'Spegesild',8,21,'4 - 450 g glasses',12.00,95,0,0,0),(47,'Zaanse koeken',3,22,'10 - 4 oz boxes',10.00,36,0,0,0),(48,'Chocolade',3,22,'10 pkgs.',13.00,15,70,25,0),(49,'Maxilaku',3,23,'24 - 50 g pkgs.',20.00,10,60,15,0),(50,'Valkoinen suklaa',3,23,'12 - 100 g bars',16.00,65,0,30,0),(51,'Manjimup Dried Apples',7,24,'50 - 300 g pkgs.',53.00,20,0,10,0),(52,'Filo Mix',5,24,'16 - 2 kg boxes',7.00,38,0,25,0),(53,'Perth Pasties',6,24,'48 pieces',33.00,0,0,0,1),(54,'Tourtière',6,25,'16 pies',7.00,21,0,10,0),(55,'Pâté chinois',6,25,'24 boxes x 2 pies',24.00,115,0,20,0),(56,'Gnocchi di nonna Alice',5,26,'24 - 250 g pkgs.',38.00,21,10,30,0),(57,'Ravioli Angelo',5,26,'24 - 250 g pkgs.',20.00,36,0,20,0),(58,'Escargots de Bourgogne',8,27,'24 pieces',13.00,62,0,20,0),(59,'Raclette Courdavault',4,28,'5 kg pkg.',55.00,79,0,0,0),(60,'Camembert Pierrot',4,28,'15 - 300 g rounds',34.00,19,0,0,0),(61,'Sirop d\'érable',2,29,'24 - 500 ml bottles',29.00,113,0,25,0),(62,'Tarte au sucre',3,29,'48 pies',49.00,17,0,0,0),(63,'Vegie-spread',2,7,'15 - 625 g jars',44.00,24,0,5,0),(64,'Wimmers gute Semmelknödel',5,12,'20 bags x 4 pieces',33.00,22,80,30,0),(65,'Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles',21.00,76,0,0,0),(66,'Louisiana Hot Spiced Okra',2,2,'24 - 8 oz jars',17.00,4,100,20,0),(67,'Laughing Lumberjack Lager',1,16,'24 - 12 oz bottles',14.00,52,0,10,0),(68,'Scottish Longbreads',3,8,'10 boxes x 8 pieces',13.00,6,10,15,0),(69,'Gudbrandsdalsost',4,15,'10 kg pkg.',36.00,26,0,15,0),(70,'Outback Lager',1,7,'24 - 355 ml bottles',15.00,15,10,30,0),(71,'Flotemysost',4,15,'10 - 500 g pkgs.',22.00,26,0,0,0),(72,'Mozzarella di Giovanni',4,14,'24 - 200 g pkgs.',35.00,14,0,0,0),(73,'Röd Kaviar',8,17,'24 - 150 g jars',15.00,101,0,5,0),(74,'Longlife Tofu',7,4,'5 kg pkg.',10.00,4,20,5,0),(75,'Rhönbräu Klosterbier',1,12,'24 - 0.5 l bottles',8.00,125,0,25,0),(76,'Lakkalikööri',1,23,'500 ml',18.00,57,0,20,0),(77,'Original Frankfurter grüne Soße',2,12,'12 boxes',13.00,32,0,15,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-01 10:42:10
