-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: foodorderingdb
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  `available` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`menu_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Farmhouse Pizza','Veg Pizza',299.00,'Pizza','https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=800&q=85',1,1),(2,1,'Cheese Burst','Extra Cheese',399.00,'Pizza','https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=800&q=85',1,1),(3,2,'Chicken Bucket','Hot Chicken',499.00,'Chicken','https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=800&q=85',1,1),(4,2,'Zinger Burger','Burger',199.00,'Burger','https://images.unsplash.com/photo-1610970881699-44a5587cabec?auto=format&fit=crop&w=800&q=85',1,1),(5,3,'Whopper','Veg Whopper',249.00,'Burger','https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=85',1,1),(6,3,'French Fries','Crispy Fries',129.00,'Snacks','https://images.unsplash.com/photo-1563379091339-03246963d96c?auto=format&fit=crop&w=800&q=85',1,1),(7,4,'Veg Supreme','Pizza',349.00,'Pizza','https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=85',1,1),(8,4,'Garlic Bread','Bread',149.00,'Bread','https://images.unsplash.com/photo-1563379091339-03246963d96c?auto=format&fit=crop&w=800&q=85',1,1),(9,5,'Chicken Biryani','Hyderabadi Style',299.00,'Biryani','https://images.unsplash.com/photo-1527477396000-e27163b481c2?auto=format&fit=crop&w=800&q=85',1,1),(10,5,'Mutton Biryani','Special',399.00,'Biryani','https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&fit=crop&w=800&q=85',1,1),(11,1,'Paneer Tikka Pizza','Spicy paneer with onions and capsicum',349.00,'Pizza','https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=85',1,1),(12,1,'Veggie Paradise','Delicious vegetables with cheese',329.00,'Pizza','https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=800&q=85',1,1),(13,1,'Garlic Bread','Crispy garlic bread with herbs',149.00,'Sides','https://images.unsplash.com/photo-1606755962773-d324e0a13086?auto=format&fit=crop&w=800&q=85',1,1),(14,2,'Chicken Popcorn','Crispy bite-sized chicken pieces',229.00,'Chicken','https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&fit=crop&w=800&q=85',1,1),(15,2,'Hot Wings','Spicy crispy chicken wings',249.00,'Chicken','https://images.unsplash.com/photo-1579954115545-a95591f28bfc?auto=format&fit=crop&w=800&q=85',1,1),(16,2,'French Fries','Crispy golden fries',119.00,'Sides','https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=800&q=85',1,1),(17,3,'Veg Whopper','Delicious vegetarian burger',229.00,'Burger','https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=800&q=85',1,1),(18,3,'Chicken Burger','Crispy chicken burger',219.00,'Burger','https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=800&q=85',1,1),(19,3,'Chocolate Shake','Rich creamy chocolate shake',149.00,'Beverage','https://images.unsplash.com/photo-1619535860434-cf9b902a5d7d?auto=format&fit=crop&w=800&q=85',1,1),(20,4,'Cheese Pizza','Classic cheese pizza',299.00,'Pizza','https://images.unsplash.com/photo-1473093295043-cdd812d0e601?auto=format&fit=crop&w=800&q=85',1,1),(21,4,'Farmhouse Pizza','Fresh vegetables and cheese',329.00,'Pizza','https://images.unsplash.com/photo-1563379091339-03246963d96c?auto=format&fit=crop&w=800&q=85',1,1),(22,4,'Pasta','Creamy Italian pasta',199.00,'Pasta','https://images.unsplash.com/photo-1563379091339-03246963d96c?auto=format&fit=crop&w=800&q=85',1,1),(23,5,'Veg Biryani','Flavourful vegetable biryani',229.00,'Biryani','https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=800&q=85',1,1),(24,5,'Paneer Biryani','Paneer cooked with aromatic rice',259.00,'Biryani','https://images.unsplash.com/photo-1563379091339-03246963d96c?auto=format&fit=crop&w=800&q=85',1,1),(25,5,'Chicken Kebab','Juicy grilled chicken kebabs',249.00,'Starter','https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=800&q=85',1,1),(26,6,'Jolada Rotti','Traditional North Karnataka sorghum flatbread',40.00,'North Karnataka','https://upload.wikimedia.org/wikipedia/commons/2/23/%E0%B2%9C%E0%B3%8B%E0%B2%B3%E0%B2%A6_%E0%B2%B0%E0%B3%8A%E0%B2%9F%E0%B3%8D%E0%B2%9F%E0%B2%B0%E0%B3%8D%E0%B0%9F%E0%B2%BF_J%C5%8D%E1%B8%B7ada_ro%E1%B9%AD%E1%B9%ADi.jpg?_=20240506194218',1,1),(27,6,'Ennegayi','Stuffed brinjal cooked in spicy North Karnataka masala',120.00,'North Karnataka','https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?auto=format&fit=crop&w=800&q=85',1,1),(28,6,'Jolada Rotti Oota','Jolada rotti served with curry, palya and chutney',180.00,'Meals','https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=800&q=85',1,1),(29,6,'North Karnataka Thali','Complete traditional North Karnataka vegetarian meal',220.00,'Meals','https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?auto=format&fit=crop&w=800&q=85',1,1),(30,6,'Badnekayi Palya','Traditional brinjal vegetable preparation',100.00,'Vegetarian','https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=800&q=85',1,1),(31,7,'Jolada Rotti','Fresh traditional Jolada Rotti served hot',40.00,'North Karnataka','https://upload.wikimedia.org/wikipedia/commons/2/23/%E0%B2%9C%E0%B3%8B%E0%B2%B3%E0%B2%A6_%E0%B2%B0%E0%B3%8A%E0%B2%9F%E0%B3%8D%E0%B2%9F%E0%B2%B0%E0%B3%8D%E0%B0%9F%E0%B2%BF_J%C5%8D%E1%B8%B7ada_ro%E1%B9%AD%E1%B9%ADi.jpg?_=20240506194218',1,1),(32,7,'Ennegayi Palya','Spicy stuffed brinjal curry with traditional masala',120.00,'North Karnataka','https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=800&q=85',1,1),(33,7,'Jowar Roti Oota','Traditional meal with jowar roti and Karnataka-style curries',180.00,'Meals','https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?auto=format&fit=crop&w=800&q=85',1,1),(34,7,'North Karnataka Special Thali','Traditional Karnataka thali with multiple dishes',220.00,'Meals','https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?auto=format&fit=crop&w=800&q=85',1,1),(35,7,'Shenga Chutney','Traditional peanut chutney from North Karnataka',80.00,'Sides','https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=800&q=85',1,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `delivery_address` text,
  `payment_method` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(100) NOT NULL,
  `description` text,
  `address` text,
  `city` varchar(100) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `delivery_time` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Dominos Pizza','Pizza and Fast Food','MG Road','Bangalore',12.9716,77.5946,4.5,30,'dominos.jpg',1),(2,'KFC','Fried Chicken','Indiranagar','Bangalore',12.9784,77.6408,4.4,25,'kfc.jpg',1),(3,'Burger King','Burgers','Whitefield','Bangalore',12.9698,77.75,4.3,35,'burgerking.jpg',1),(4,'Pizza Hut','Italian Pizza','Koramangala','Bangalore',12.9352,77.6245,4.2,40,'pizzahut.jpg',1),(5,'Biryani House','Hyderabadi Biryani','HSR Layout','Bangalore',12.9116,77.6474,4.7,28,'biryani.jpg',1),(6,'Basaveshwara Khanavali','Authentic North Karnataka food with traditional Jolada Rotti','Tavarekeri Main Road','Bangalore',12.9716,77.5946,4.6,30,'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=900&q=85',1),(7,'North Karnataka Khanavali','Traditional Jolada Rotti, Ennegayi and North Karnataka special dishes','Near Tavarekeri','Bangalore',12.9784,77.6408,4.5,35,'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=900&q=85',1);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Darshan Patil','darshanpatil108@gmail.com','123','Darshan@123','','2026-07-28 11:42:56'),(5,'Darshan Patil','darshanpatil1108@gmail.com','1234','Darshan@123','','2026-07-28 11:46:47'),(6,'Dacchu','darshanpatil110@gmail.com','123456','123','','2026-07-28 12:57:02'),(10,'Darshan New','darshannew999@gmail.com','9876543210','123456','','2026-07-28 13:13:24'),(12,'Test User','testuser999@gmail.com','9999999999','Test@1234','','2026-08-02 03:26:30'),(14,'Demo User','demo20260802@gmail.com','9876543211','Demo@123','','2026-08-02 03:32:07'),(17,'Darshan Patil','darshan98765@gmail.com','9988776655','Darshan@123','Bangalore','2026-08-18 06:21:58'),(18,'Preeti','preetidd3@gmail.com','1234567899','Preeti@123','btm','2026-08-18 06:37:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-18 12:49:39
