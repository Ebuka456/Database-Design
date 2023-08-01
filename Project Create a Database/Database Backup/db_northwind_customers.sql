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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerID` char(5) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `contactName` varchar(255) NOT NULL,
  `contactTitle` varchar(255) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('ANATR','Ana Trujillo Emparedados y helados','Ana Trujillo','Owner'),('ANTON','Antonio Moreno Taquería','Antonio Moreno','Owner'),('AROUT','Around the Horn','Thomas Hardy','Sales Representative'),('BERGS','Berglunds snabbköp','Christina Berglund','Order Administrator'),('BLAUS','Blauer See Delikatessen','Hanna Moos','Sales Representative'),('BLONP','Blondesddsl père et fils','Frédérique Citeaux','Marketing Manager'),('BOLID','Bólido Comidas preparadas','Martín Sommer','Owner'),('BONAP','Bon app\'','Laurence Lebihan','Owner'),('BOTTM','Bottom-Dollar Markets','Elizabeth Lincoln','Accounting Manager'),('BSBEV','B\'s Beverages','Victoria Ashworth','Sales Representative'),('CACTU','Cactus Comidas para llevar','Patricio Simpson','Sales Agent'),('CENTC','Centro comercial Moctezuma','Francisco Chang','Marketing Manager'),('CHOPS','Chop-suey Chinese','Yang Wang','Owner'),('COMMI','Comércio Mineiro','Pedro Afonso','Sales Associate'),('CONSH','Consolidated Holdings','Elizabeth Brown','Sales Representative'),('DRACD','Drachenblut Delikatessen','Sven Ottlieb','Order Administrator'),('DUMON','Du monde entier','Janine Labrune','Owner'),('EASTC','Eastern Connection','Ann Devon','Sales Agent'),('ERNSH','Ernst Handel','Roland Mendel','Sales Manager'),('FAMIA','Familia Arquibaldo','Aria Cruz','Marketing Assistant'),('FOLIG','Folies gourmandes','Martine Rancé','Assistant Sales Agent'),('FOLKO','Folk och fä HB','Maria Larsson','Owner'),('FRANK','Frankenversand','Peter Franken','Marketing Manager'),('FRANS','Franchi S.p.A.','Paolo Accorti','Sales Representative'),('FURIB','Furia Bacalhau e Frutos do Mar','Lino Rodriguez','Sales Manager'),('GALED','Galería del gastrónomo','Eduardo Saavedra','Marketing Manager'),('GODOS','Godos Cocina Típica','José Pedro Freyre','Sales Manager'),('GOURL','Gourmet Lanchonetes','André Fonseca','Sales Associate'),('GREAL','Great Lakes Food Market','Howard Snyder','Marketing Manager'),('GROSR','GROSELLA-Restaurante','Manuel Pereira','Owner'),('HANAR','Hanari Carnes','Mario Pontes','Accounting Manager'),('HILAA','HILARION-Abastos','Carlos Hernández','Sales Representative'),('HUNGC','Hungry Coyote Import Store','Yoshi Latimer','Sales Representative'),('HUNGO','Hungry Owl All-Night Grocers','Patricia McKenna','Sales Associate'),('ISLAT','Island Trading','Helen Bennett','Marketing Manager'),('KOENE','Königlich Essen','Philip Cramer','Sales Associate'),('LAMAI','La maison d\'Asie','Annette Roulet','Sales Manager'),('LAUGB','Laughing Bacchus Wine Cellars','Yoshi Tannamuri','Marketing Assistant'),('LAZYK','Lazy K Kountry Store','John Steel','Marketing Manager'),('LEHMS','Lehmanns Marktstand','Renate Messner','Sales Representative'),('LETSS','Let\'s Stop N Shop','Jaime Yorres','Owner'),('LILAS','LILA-Supermercado','Carlos González','Accounting Manager'),('LINOD','LINO-Delicateses','Felipe Izquierdo','Owner'),('LONEP','Lonesome Pine Restaurant','Fran Wilson','Sales Manager'),('MAGAA','Magazzini Alimentari Riuniti','Giovanni Rovelli','Marketing Manager'),('MAISD','Maison Dewey','Catherine Dewey','Sales Agent'),('MEREP','Mère Paillarde','Jean Fresnière','Marketing Assistant'),('MORGK','Morgenstern Gesundkost','Alexander Feuer','Marketing Assistant'),('NORTS','North/South','Simon Crowther','Sales Associate'),('OCEAN','Océano Atlántico Ltda.','Yvonne Moncada','Sales Agent'),('OLDWO','Old World Delicatessen','Rene Phillips','Sales Representative'),('OTTIK','Ottilies Käseladen','Henriette Pfalzheim','Owner'),('PERIC','Pericles Comidas clásicas','Guillermo Fernández','Sales Representative'),('PICCO','Piccolo und mehr','Georg Pipps','Sales Manager'),('PRINI','Princesa Isabel Vinhos','Isabel de Castro','Sales Representative'),('QUEDE','Que Delícia','Bernardo Batista','Accounting Manager'),('QUEEN','Queen Cozinha','Lúcia Carvalho','Marketing Assistant'),('QUICK','QUICK-Stop','Horst Kloss','Accounting Manager'),('RANCH','Rancho grande','Sergio Gutiérrez','Sales Representative'),('RATTC','Rattlesnake Canyon Grocery','Paula Wilson','Assistant Sales Representative'),('REGGC','Reggiani Caseifici','Maurizio Moroni','Sales Associate'),('RICAR','Ricardo Adocicados','Janete Limeira','Assistant Sales Agent'),('RICSU','Richter Supermarkt','Michael Holz','Sales Manager'),('ROMEY','Romero y tomillo','Alejandra Camino','Accounting Manager'),('SANTG','Santé Gourmet','Jonas Bergulfsen','Owner'),('SAVEA','Save-a-lot Markets','Jose Pavarotti','Sales Representative'),('SEVES','Seven Seas Imports','Hari Kumar','Sales Manager'),('SIMOB','Simons bistro','Jytte Petersen','Owner'),('SPLIR','Split Rail Beer & Ale','Art Braunschweiger','Sales Manager'),('SUPRD','Suprêmes délices','Pascale Cartrain','Accounting Manager'),('THEBI','The Big Cheese','Liz Nixon','Marketing Manager'),('THECR','The Cracker Box','Liu Wong','Marketing Assistant'),('TOMSP','Toms Spezialitäten','Karin Josephs','Marketing Manager'),('TORTU','Tortuga Restaurante','Miguel Angel Paolino','Owner'),('TRADH','Tradição Hipermercados','Anabela Domingues','Sales Representative'),('TRAIH','Trail\'s Head Gourmet Provisioners','Helvetius Nagy','Sales Associate'),('VAFFE','Vaffeljernet','Palle Ibsen','Sales Manager'),('VICTE','Victuailles en stock','Mary Saveley','Sales Agent'),('VINET','Vins et alcools Chevalier','Paul Henriot','Accounting Manager'),('WANDK','Die Wandernde Kuh','Rita Müller','Sales Representative'),('WARTH','Wartian Herkku','Pirkko Koskitalo','Accounting Manager'),('WELLI','Wellington Importadora','Paula Parente','Sales Manager'),('WHITC','White Clover Markets','Karl Jablonski','Owner'),('WILMK','Wilman Kala','Matti Karttunen','Owner/Marketing Assistant'),('WOLZA','Wolski  Zajazd','Zbyszek Piestrzeniewicz','Owner');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
