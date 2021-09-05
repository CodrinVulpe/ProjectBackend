-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: database-movies
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Craiova','Romania','Dolj','Chinezu','231241243'),(2,'Craiova','Romania','Dolj','Chinezu','231241243'),(3,'Craiova','Romania','Dolj','Chinezu','231241243'),(4,'Craiova','Romania','Dolj','Chinezu','231241243'),(5,'Craiova','Romania','Dolj','Chinezu','231241243'),(6,'Craiova','Romania','Dolj','Chinezu','231241243');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` smallint unsigned NOT NULL,
  `code` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'RO','Romania'),(2,'CA','Canada'),(3,'DE','Germany'),(4,'US','United States');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'GIgi','Ion','gigi_ion@test.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `K_order_id` (`order_id`),
  KEY `FK_product_id` (`product_id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,'assets/images/products/movies/movies-1002.png',1,199.99,1,3),(2,'assets/images/products/movies/movies-1000.png',1,144.99,1,1),(3,'assets/images/products/movies/movies-1000.png',2,144.99,2,1),(4,'assets/images/products/movies/movies-1001.png',1,219.99,3,2),(5,'assets/images/products/movies/movies-1000.png',1,144.99,3,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `total_quantity` int DEFAULT NULL,
  `billing_address_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_billing_address_id` (`billing_address_id`),
  UNIQUE KEY `UK_shipping_address_id` (`shipping_address_id`),
  KEY `K_customer_id` (`customer_id`),
  CONSTRAINT `FK_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'8bd0ee98-af20-4890-a518-7381875b6472',344.98,2,1,1,2,NULL,'2021-07-03 10:49:43.053000','2021-07-03 10:49:43.053000'),(2,'fb71c708-d863-4cd4-9584-33e274720223',289.98,2,3,1,4,NULL,'2021-07-08 10:08:06.716000','2021-07-08 10:08:06.716000'),(3,'4573ac97-f496-47e2-a944-19bfc10a0b10',364.98,2,5,1,6,NULL,'2021-08-07 11:33:31.049000','2021-08-07 11:33:31.049000');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `unit_price` decimal(13,2) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `units_in_stock` int DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'MOVIES-1000','The Marksman (2021)','This is only the second film by director Robert Lorenzo.',144.99,'assets/images/products/movies/movies-1000.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,1),(2,'MOVIES-1001','Judas and the Black Messiah (2021)','When I saw \"The Trial of the Chicago 7\" less than a year ago, I commented that there was likely a more interesting movie to be made about Fred Hampton.',219.99,'assets/images/products/movies/movies-1001.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,1),(3,'MOVIES-1002','The White Tiger (2021)','Balram Halwai (Adarsh Gourav) narrates his epic and darkly humorous rise from poor villager to successful entrepreneur in modern India.',199.99,'assets/images/products/movies/movies-1002.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,1),(4,'MOVIES-1003','The Godfather (1972)','An organized crime dynasty aging patriarch transfers control of his clandestine empire to his reluctant son.',279.99,'assets/images/products/movies/movies-1003.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,1),(5,'MOVIES-1004','Cruella (2021)','A live-action prequel feature film following a young Cruella de Vil.',259.99,'assets/images/products/movies/movies-1004.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,1),(6,'MOVIES-1005','Fast & Furious 9 (2021)','Cipher enlists the help of Jakob, Dom younger brother to take revenge on Dom and his team.',399.99,'assets/images/products/movies/movies-1005.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,1),(7,'MOVIES-1006','Friends Reunion Special (2021)','An unscripted Friends reunion special.',239.99,'assets/images/products/movies/movies-1006.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,1),(8,'COFFEEMUG-1000','Coffee Mug - 1','If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1000.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(9,'COFFEEMUG-1001','Coffee Mug - 2','If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1001.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(10,'COFFEEMUG-1002','Coffee Mug - 3',' If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1002.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(11,'COFFEEMUG-1003','Coffee Mug - 4',' If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1003.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(12,'COFFEEMUG-1004','Coffee Mug - 5',' If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1004.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(13,'COFFEEMUG-1005','Coffee Mug - 6',' If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1005.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(14,'COFFEEMUG-1006','Coffee Mug - 7',' If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1006.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(15,'COFFEEMUG-1007','Coffee Mug - 8',' If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1007.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(16,'COFFEEMUG-1008','Coffee Mug - 9',' If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1008.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(17,'COFFEEMUG-1000','Coffee Mug - 10',' If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1009.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(18,'COFFEEMUG-1010','Coffee Mug - 11',' If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug1010.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,2),(19,'FIGURES-1000','Hot Toys Avengers: Endgame Nano Gauntlet Hulk','Version Life-Size Prop Replica',409.99,'assets/images/products/figures/figures-1000.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,3),(20,'FIGURES-1001','Sideshow Collectibles Star Wars The Mandalorian','The Child Life-Size Statue',349.99,'assets/images/products/figures/figures-1001.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,3),(21,'FIGURES-1002','Asmus Toys Ace Ventura: Pet Detective Ace Ventura 1/6 Action Figure','Ace Ventura Sixth Scale Collectible Figure.',319.99,'assets/images/products/figures/figures-1002.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,3),(22,'FIGURES-1003','Series James Bond Limited Edition 1/6 Action Figure','James Bond is despatched to Jamaica to investigate the disappearance of a fellow British agent.',399.99,'assets/images/products/figures/figures-1003.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,3),(23,'FIGURES-1004','Chief Studios Laurel & Hardy Classic Suits','In celebration of Laurel & Hardy BIG Chief Studios in association with Larry Harmon Pictures Corp.',549.99,'assets/images/products/figures/figures-1004.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,3),(24,'FIGURES-1005','Avengers Iron Man Tony Stark (Birth of Iron Man)','From the first Iron Man film, genius billionaire Tony Stark joins S.H.Figuarts.',239.99,'assets/images/products/figures/figures-1005.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,3),(25,'FIGURES-1006','Beast Kingdom Stan Lee Egg Attack Action Figure','Excelsior!!! Yes, the de facto father of all that is Marvel, Stan Lee.',469.99,'assets/images/products/figures/figures-1006.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,3),(26,'FIGURES-1007','Damtoys The Godfather Vito Corleone Golden Years','The Godfather Vito Corleone- Golden Years Version Sixth Scale Collectible Figure!',709.99,'assets/images/products/figures/figures-1007.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,3),(27,'FIGURES-1008','Aquaman Movie Aquaman 1/6','Sideshow and Hot Toys are thrilled to introduce the Aquaman Sixth Scale Collectible Figure in his iconic outfit!',199.99,'assets/images/products/figures/figures-1008.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,3),(28,'FIGURES-1009','Batman Arkham Knight Videogame Harley Quinn 1/6','Take this Harley figure home, as she will stand out from the rest of your DC collection!',599.99,'assets/images/products/figures/figures-1009.png',_binary '',100,'2021-06-26 03:22:07.000000',NULL,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Movies'),(2,'Coffee Mugs'),(3,'Accessories');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country` (`country_id`),
  CONSTRAINT `fk_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Arad',1),(2,'Timis',1),(3,'Iasi',1),(4,'Gorj',1),(5,'Mehedinti',1),(6,'Dolj',1),(7,'Bucuresti',1),(8,'Satu-Mare',1),(9,'Constanta',1),(10,'Sibiu',1),(11,'Galati',1),(12,'Olt',1),(13,'Valcea',1),(14,'Vaslui',1),(15,'Alberta',2),(16,'British Columbia',2),(17,'Manitoba',2),(18,'New Brunswick',2),(19,'Newfoundland and Labrador',2),(20,'Northwest Territories',2),(21,'Nova Scotia',2),(22,'Nunavut',2),(23,'Ontario',2),(24,'Prince Edward Island',2),(25,'Quebec',2),(26,'Saskatchewan',2),(27,'Yukon',2),(28,'Baden-Württemberg',3),(29,'Bavaria',3),(30,'Berlin',3),(31,'Brandenburg',3),(32,'Bremen',3),(33,'Hamburg',3),(34,'Hesse',3),(35,'Lower Saxony',3),(36,'Mecklenburg-Vorpommern',3),(37,'North Rhine-Westphalia',3),(38,'Rhineland-Palatinate',3),(39,'Saarland',3),(40,'Saxony',3),(41,'Saxony-Anhalt',3),(42,'Schleswig-Holstein',3),(43,'Thuringia',3),(44,'Alabama',4),(45,'Alaska',4),(46,'Arizona',4),(47,'Arkansas',4),(48,'California',4),(49,'Colorado',4),(50,'Connecticut',4),(51,'Delaware',4),(52,'District Of Columbia',4),(53,'Florida',4),(54,'Hawaii',4),(55,'Idaho',4),(56,'Illinois',4),(57,'Indiana',4),(58,'Iowa',4),(59,'Kansas',4),(60,'Kentucky',4),(61,'Louisiana',4),(62,'Maine',4),(63,'Maryland',4),(64,'Massachusetts',4),(65,'Michigan',4),(66,'Minnesota',4),(67,'Mississippi',4),(68,'Missouri',4),(69,'Montana',4),(70,'Nebraska',4),(71,'Nevada',4),(72,'New Hampshire',4),(73,'New Jersey',4),(74,'New Mexico',4),(75,'New York',4),(76,'North Carolina',4),(77,'North Dakota',4),(78,'Ohio',4),(79,'Oklahoma',4),(80,'Oregon',4),(81,'Pennsylvania',4),(82,'Rhode Island',4),(83,'South Carolina',4),(84,'South Dakota',4),(85,'Tennessee',4),(86,'Texas',4),(87,'Utah',4),(88,'Vermont',4),(89,'Virginia',4),(90,'Washington',4),(91,'West Virginia',4),(92,'Wisconsin',4),(93,'Wyoming',4);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-03 17:53:31
