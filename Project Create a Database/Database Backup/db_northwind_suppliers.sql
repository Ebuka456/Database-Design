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
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplierID` int NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) NOT NULL,
  `contactName` varchar(255) NOT NULL,
  `contactTitle` varchar(255) NOT NULL,
  PRIMARY KEY (`supplierID`),
  UNIQUE KEY `supplierID_UNIQUE` (`supplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Exotic Liquids','Charlotte Cooper','Purchasing Manager'),(2,'New Orleans Cajun Delights','Shelley Burke','Order Administrator'),(3,'Grandma Kelly\'s Homestead','Regina Murphy','Sales Representative'),(4,'Tokyo Traders','Yoshi Nagase','Marketing Manager'),(5,'Cooperativa de Quesos \'Las Cabras\'','Antonio del Valle Saavedra','Export Administrator'),(6,'Mayumi\'s','Mayumi Ohno','Marketing Representative'),(7,'Pavlova',' Ltd.','Ian Devling'),(8,'Specialty Biscuits',' Ltd.','Peter Wilson'),(9,'PB Knäckebröd AB','Lars Peterson','Sales Agent'),(10,'Refrescos Americanas LTDA','Carlos Diaz','Marketing Manager'),(11,'Heli Süßwaren GmbH & Co. KG','Petra Winkler','Sales Manager'),(12,'Plutzer Lebensmittelgroßmärkte AG','Martin Bein','International Marketing Mgr.'),(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Coordinator Foreign Markets'),(14,'Formaggi Fortini s.r.l.','Elio Rossi','Sales Representative'),(15,'Norske Meierier','Beate Vileid','Marketing Manager'),(16,'Bigfoot Breweries','Cheryl Saylor','Regional Account Rep.'),(17,'Svensk Sjöföda AB','Michael Björn','Sales Representative'),(18,'Aux joyeux ecclésiastiques','Guylène Nodier','Sales Manager'),(19,'New England Seafood Cannery','Robb Merchant','Wholesale Account Agent'),(20,'Leka Trading','Chandra Leka','Owner'),(21,'Lyngbysild','Niels Petersen','Sales Manager'),(22,'Zaanse Snoepfabriek','Dirk Luchte','Accounting Manager'),(23,'Karkki Oy','Anne Heikkonen','Product Manager'),(24,'G\'day',' Mate','Wendy Mackenzie'),(25,'Ma Maison','Jean-Guy Lauzon','Marketing Manager'),(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Order Administrator'),(27,'Escargots Nouveaux','Marie Delamare','Sales Manager'),(28,'Gai pâturage','Eliane Noz','Sales Representative'),(29,'Forêts d\'érables','Chantal Goulet','Accounting Manager');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
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
