-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: david
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
-- Temporary view structure for view `available_rooms_per_hotel`
--

DROP TABLE IF EXISTS `available_rooms_per_hotel`;
/*!50001 DROP VIEW IF EXISTS `available_rooms_per_hotel`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `available_rooms_per_hotel` AS SELECT 
 1 AS `hotel_id`,
 1 AS `available_rooms`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `booking_history`
--

DROP TABLE IF EXISTS `booking_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_history` (
  `id` varchar(20) NOT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_history`
--

LOCK TABLES `booking_history` WRITE;
/*!40000 ALTER TABLE `booking_history` DISABLE KEYS */;
INSERT INTO `booking_history` VALUES ('Booking-A001','123-45-6789',1101,'2023-04-05');
/*!40000 ALTER TABLE `booking_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` varchar(20) NOT NULL,
  `customer_id` varchar(20) NOT NULL,
  `room_id` int NOT NULL,
  `booking_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_ibfk_2` (`room_id`),
  KEY `bookings_ibfk_1` (`customer_id`),
  KEY `idx_booking_date` (`booking_date`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn_or_sin`) ON DELETE CASCADE,
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES ('Booking-A001','123-45-6789',1101,'2023-04-05'),('Booking-B001','123-45-6789',1102,'2023-04-09'),('Booking-C001','111-22-3333',1103,'2023-04-23'),('Booking-D001','222-33-4444',1104,'2023-05-12'),('Booking-E001','234-56-7890',1116,'2023-05-12');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `ssn_or_sin` varchar(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `registration_date` date NOT NULL,
  PRIMARY KEY (`ssn_or_sin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('111-22-33323','John Dcoe','1236789 Main St, New York, NY 10001','2023-01-01'),('111-22-3333','John Doe','123 Main St, New York, NY 10001','2023-01-01'),('123-45-6789','Henry Taylor','202 Beacon St, Boston, MA 02109','2023-04-08'),('222-33-4444','Jane Smith','456 Elm St, Los Angeles, CA 90001','2023-01-15'),('234-56-7890','David Loo','1850 Lexington Ave, New York, NY 10003','2023-04-12'),('333-44-5555','Alice Johnson','789 Maple St, Chicago, IL 60601','2023-02-05'),('345-67-8901','Jack Perez','1240 Pico Blvd, Los Angeles, CA 90003','2023-04-20'),('444-55-6666','Bob Brown','321 Oak St, San Francisco, CA 94101','2023-02-20'),('456-78-9012','Karen Roberts','1750 Michigan Ave, Chicago, IL 60603','2023-04-28'),('555-66-7777','Charlie Green','654 Pine St, Boston, MA 02108','2023-03-01'),('567-89-0123','Liam Nelson','3890 Pine St, San Francisco, CA 94103','2023-05-05'),('666-77-8888','Diana Williams','1280 Broadway St, New York, NY 10002','2023-03-10'),('678-90-1234','Mia Scott','2150 Beacon Hill Rd, Boston, MA 02110','2023-05-12'),('777-88-9999','Eva Jones','9275 Sunset Blvd, Los Angeles, CA 90002','2023-03-15'),('888-99-0000','Frank Lee','650 Lake Shore Dr, Chicago, IL 60602','2023-03-25'),('999-00-1111','Grace Adams','3140 Market St, San Francisco, CA 94102','2023-04-01');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `ssn_or_sin` varchar(20) NOT NULL,
  `hotel_id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`ssn_or_sin`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('11111135',17,'Martin Stan',' 42 Hamilton Dr. Glen Ellyn, IL 60137','Manager '),('11111136',17,'Paula Daniel',' 28 Park Drive Pawtucket, RI 02860','Receptionist'),('11111137',17,'Hora?iu Adam','658 Cedar Swamp StreetEast Orange, NJ 07017','Housekeeping'),('11111138',18,'Valentin Ciprian','592 San Juan St. Trussville, AL 35173','Manager '),('11111139',18,'Lidia Dorinel','474 Vermont St. Revere, MA 02151','Receptionist'),('11111140',18,'Mihail Bogdan',' 486 Colonial Ave. Philadelphia, PA 19111','Housekeeping'),('11111141',19,'Bianca Albert',' 712 Broad Avenue Meadville, PA 16335','Manager '),('11111142',19,'Olga Alexandra','58 Trenton Drive Flemington, NJ 08822','Receptionist'),('11111143',19,'Cezara Costel','384 Birchwood Drive Starkville, MS 39759','Housekeeping'),('11111144',20,'Marinela Cristi','8398 Briarwood Street Greenwood, SC 29646','Manager '),('11111145',20,'Bogdan Sandra','7545 Surrey Dr. Victoria, TX 77904','Receptionist'),('11111146',20,'Remus Sara','52 South El Dorado Lane Dearborn Heights, MI 48127','Housekeeping'),('11111147',21,'Codrin Filip','18 Corona Lane Riverview, FL 33569','Manager '),('11111148',21,'Simion Loredana',' 610 Marshall St. Potomac, MD 20854','Receptionist'),('11111149',21,'Gui Wanda','735 Meadowbrook Dr. Richardson, TX 75080','Housekeeping'),('11111150',22,'Nina Tatiana','9179 Golf Street Los Angeles, CA 90008','Manager '),('11111151',22,'Zeferino Bolek','8170 Columbia Rd. Baldwinsville, NY 13027','Receptionist'),('11111152',22,'Pelagia Simão',' 344 Birch Hill Drive Newark, NJ 07103','Housekeeping'),('11111153',23,'Rafinha Miron','9 Elmwood Street Rock Hill, SC 29730','Manager '),('11111154',23,'Ludwik Vilmar',' 9800 High Noon Lane Green Bay, WI 54302','Receptionist'),('11111155',23,'Adelina Calisto','65 Ashley Lane Manassas, VA 20109','Housekeeping'),('11111156',24,'Agata Marzena','9940 West Big Rock Cove Rd. Santa Cruz, CA 95060','Manager '),('11111157',24,'Igor Carlota','2 Snake Hill Lane Mokena, IL 60448','Receptionist'),('11111158',24,'Lina Lula','62 Woodsman St. East Brunswick, NJ 08816','Housekeeping'),('11111159',25,'Justyna Weronika','7137 Princeton Street Silver Spring, MD 20901','Manager '),('11111160',25,'Victoria Henryka','858 Talbot Drive Clarksburg, WV 26301','Receptionist'),('11111161',25,'Marzena Monica','876 Edgewater Ave. Trussville, AL 35173','Housekeeping'),('11111162',26,'Antônio Justyna','929 Manhattan Rd. Lilburn, GA 30047','Manager '),('11111163',26,'Sílvia Régulo','36 Clay St. Peabody, MA 01960','Receptionist'),('11111164',26,'Bolek Silvério','976 Union Road Sylvania, OH 43560','Housekeeping'),('11111165',27,'Gonçalo Delia','148 Pendergast Street Panama City, FL 32404','Manager '),('11111166',27,'Cloé Livia','91 Pennsylvania Dr. Deland, FL 32720','Receptionist'),('11111167',27,'Oliwia Zacarias','943 Wayne St. Milwaukee, WI 53204','Housekeeping'),('11111168',28,'Romualda Narcisa','762 E. Poplar St. Cary, NC 27511','Manager '),('11111169',28,'Albano Dulce','87 Foster Ave. Wheaton, IL 60187','Receptionist'),('11111170',28,'Rui Sebastiana','936 Cobblestone Ave. Johnson City, TN 37601','Housekeeping'),('11111171',29,'Anacleto Faustino','465 Del Monte Dr. North Andover, MA 01845','Manager '),('11111172',29,'Damian Rosalina','99 Cypress Street Lindenhurst, NY 11757','Receptionist'),('11111173',29,'Serafin Egídio','749 North Kingston Ave. Rockaway, NJ 07866','Housekeeping'),('11111174',30,'Ruben Manning','9502 Taylor Ave. Englewood, NJ 07631','Manager '),('11111175',30,'Hazel Wilkinson','487 Cross Street Whitestone, NY 11357','Receptionist'),('11111176',30,'Rodolfo Bell','12 S. Harvard St. Bay City, MI 48706','Housekeeping'),('11111177',31,'Gordon Hopper','7825 Ocean Lane Glen Ellyn, IL 60137','Manager '),('11111178',31,'Emma Woodward','884 Studebaker St. Rahway, NJ 07065','Receptionist'),('11111179',31,'Morgan Hatfield','4 North Sherman St. East Orange, NJ 07017','Housekeeping'),('11111180',32,'Brooke Stone','724 S. Magnolia Lane Burbank, IL 60459','Manager '),('11111181',32,'Bret Bruce','976 Union Road Sylvania, OH 43560','Receptionist'),('11111182',32,'Hannah Barr','148 Pendergast Street Panama City, FL 32404','Housekeeping'),('11111183',33,'Bert Delaney','91 Pennsylvania Dr. Deland, FL 32720','Manager '),('11111184',33,'Jackie Simon','943 Wayne St. Milwaukee, WI 53204','Receptionist'),('11111185',33,'Susie Read','762 E. Poplar St. Cary, NC 27511','Housekeeping'),('11111186',34,'Lourdes Meadows','87 Foster Ave. Wheaton, IL 60187','Manager '),('11111187',34,'Patty Patton','936 Cobblestone Ave. Johnson City, TN 37601','Receptionist'),('11111188',34,'Marvin Swift','465 Del Monte Dr. North Andover, MA 01845','Housekeeping'),('11111189',35,'Brendan Cantu','99 Cypress Street Lindenhurst, NY 11757','Manager '),('11111190',35,'Al Nelson','749 North Kingston Ave. Rockaway, NJ 07866','Receptionist'),('11111191',35,'Tomas Fritz','9502 Taylor Ave. Englewood, NJ 07631','Housekeeping'),('11111192',36,'Guadalupe McCclure','487 Cross Street Whitestone, NY 11357','Manager '),('11111193',36,'Traci Duncan','12 S. Harvard St. Bay City, MI 48706','Receptionist'),('11111194',36,'Angela Richardson','7825 Ocean Lane Glen Ellyn, IL 60137','Housekeeping'),('11111195',37,'Justin Dominguez','884 Studebaker St. Rahway, NJ 07065','Manager '),('11111196',37,'Marcos Kuhn','4 North Sherman St. East Orange, NJ 07017','Receptionist'),('11111197',37,'Rod Combs','724 S. Magnolia Lane Burbank, IL 60459','Housekeeping'),('11111198',38,'Rhonda Kelly','976 Union Road Sylvania, OH 43560','Manager '),('11111199',38,'Rodney Carter','148 Pendergast Street Panama City, FL 32404','Receptionist'),('11111200',38,'Karla Ashley','91 Pennsylvania Dr. Deland, FL 32720','Housekeeping'),('11111201',39,'Francine Fernandez','943 Wayne St. Milwaukee, WI 53204','Manager '),('11111202',39,'Joel McGinnis','762 E. Poplar St. Cary, NC 27511','Receptionist'),('11111203',39,'Byron Doty','87 Foster Ave. Wheaton, IL 60187','Housekeeping'),('11111204',40,'Martha Snow','936 Cobblestone Ave. Johnson City, TN 37601','Manager '),('11111205',40,'Lowell Gibson','465 Del Monte Dr. North Andover, MA 01845','Receptionist'),('11111206',40,'Stephen Ryan','99 Cypress Street Lindenhurst, NY 11757','Housekeeping'),('11111207',41,'Louise Dyer','749 North Kingston Ave. Rockaway, NJ 07866','Manager '),('11111208',41,'Bobbie Newton','9502 Taylor Ave. Englewood, NJ 07631','Receptionist'),('11111209',41,'Guillermo Bass','487 Cross Street Whitestone, NY 11357','Housekeeping'),('11111210',42,'Nick Downing','12 S. Harvard St. Bay City, MI 48706','Manager '),('11111211',42,'Samantha Nguyen','7825 Ocean Lane Glen Ellyn, IL 60137','Receptionist'),('11111212',42,'Pam Nolan','884 Studebaker St. Rahway, NJ 07065','Housekeeping'),('11111213',43,'Aurora Evans','4 North Sherman St. East Orange, NJ 07017','Manager '),('11111214',43,'Sammy Hagan','724 S. Magnolia Lane Burbank, IL 60459','Receptionist'),('11111215',43,'Clay Frederick','976 Union Road Sylvania, OH 43560','Housekeeping'),('11111216',44,'Douglas Byers','148 Pendergast Street Panama City, FL 32404','Manager '),('11111217',44,'Maryann Louis','91 Pennsylvania Dr. Deland, FL 32720','Receptionist'),('11111218',44,'Denise Bowen','943 Wayne St. Milwaukee, WI 53204','Housekeeping'),('11111219',45,'Ian O\'Connor','762 E. Poplar St. Cary, NC 27511','Manager '),('11111220',45,'Marcy Denton','87 Foster Ave. Wheaton, IL 60187','Receptionist'),('11111221',45,'Janette FitzPatrick','936 Cobblestone Ave. Johnson City, TN 37601','Housekeeping'),('11111222',46,'Elsie Higgins','465 Del Monte Dr. North Andover, MA 01845','Manager '),('11111223',46,'Stacy Middleton','99 Cypress Street Lindenhurst, NY 11757','Receptionist'),('11111224',46,'Jimmie Magee','749 North Kingston Ave. Rockaway, NJ 07866','Housekeeping'),('11111225',47,'Tammy Koch','9502 Taylor Ave. Englewood, NJ 07631','Manager '),('11111226',47,'Carla Barnes','487 Cross Street Whitestone, NY 11357','Receptionist'),('11111227',47,'Austin Fritz','12 S. Harvard St. Bay City, MI 48706','Housekeeping'),('11111228',48,'William Graham','7825 Ocean Lane Glen Ellyn, IL 60137','Manager '),('11111229',48,'Corey Loomis','884 Studebaker St. Rahway, NJ 07065','Receptionist'),('11111230',48,'Herman Riley','4 North Sherman St. East Orange, NJ 07017','Housekeeping'),('21111115',49,'?tefana Emanoil','566 Sulphur Springs Street Highland, IN 46322','Receptionist'),('21111116',49,'Liliana Manuela','774 Woodside Avenue Michigan City, IN 46360','Housekeeping'),('21111117',50,'Aurica Ioana',' 368 Crescent St. Sulphur, LA 70663','Manager '),('21111118',50,'Teodor Mariana',' 7431 S. Brickyard Drive Brainerd, MN 56401','Receptionist'),('21111119',50,'Antoniu Iuliu','916 Boston Dr. Elizabethton, TN 37643','Housekeeping'),('21111120',51,'?tefana Emanoil',' 9546 Bridgeton Street Tonawanda, NY 14150','Manager '),('21111121',51,'Liliana Manuela','656 Homestead Drive Glenside, PA 19038','Receptionist'),('21111122',51,'Aurica Ioana','8205 Brandywine Ave. Nazareth, PA 18064','Housekeeping'),('21111123',52,'Teodor Mariana',' 87 Westminster Dr. Muscatine, IA 52761','Manager '),('21111124',52,'Laura Sandra',' 374 Oak Lane Mason City, IA 50401','Receptionist'),('21111125',52,'Marin Silviu',' 8738 Lakeview Circle Sicklerville, NJ 08081','Housekeeping'),('21111126',53,'Dorina Marina',' 35 North Prince Street Stroudsburg, PA 18360','Manager '),('21111127',53,'Nicoleta Aurora','39 Dunbar Ave. Cleveland, TN 37312','Receptionist'),('21111128',53,'Nicu?or Simion','82 Cedarwood Dr. Elkhart, IN 46514','Housekeeping'),('21111129',54,'Aurelian Adela','889 San Pablo St. Carpentersville, IL 60110','Manager '),('21111130',54,'Dacian Gabriel',' 727 Rockaway Lane East Hartford, CT 06118','Receptionist'),('21111131',54,'Viorica Dan','801 Mill Pond Rd. Sun City, AZ 85351','Housekeeping'),('21111132',55,'Rebeca Liana','283 Pilgrim St. Grand Rapids, MI 49503','Manager '),('21111133',55,'Toma Daciana',' 935 Smith Dr. Independence, KY 41051','Receptionist'),('21111134',55,'Narcisa Valeriu',' 85 Thatcher Court Beachwood, OH 44122','Housekeeping'),('21111135',56,'Martin Stan',' 42 Hamilton Dr. Glen Ellyn, IL 60137','Manager '),('21111136',56,'Paula Daniel',' 28 Park Drive Pawtucket, RI 02860','Receptionist'),('21111137',56,'Hora?iu Adam','658 Cedar Swamp StreetEast Orange, NJ 07017','Housekeeping');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `star_category` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `num_rooms` int NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `hotel_chain_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_chain_id` (`hotel_chain_id`),
  KEY `idx_hotel_name` (`name`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`hotel_chain_id`) REFERENCES `hotel_chain` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (17,'Hotel B1',3,'123 Market St, San Francisco, CA 94101',5,'b1@hotelchainb.com','555-201-0001',3),(18,'Hotel B2',4,'234 Market St, San Francisco, CA 94102',5,'b2@hotelchainb.com','555-201-0002',3),(19,'Hotel B3',5,'345 Pine St, San Francisco, CA 94103',5,'b3@hotelchainb.com','555-201-0003',3),(20,'Hotel B4',2,'456 California St, San Francisco, CA 94104',5,'b4@hotelchainb.com','555-201-0004',3),(21,'Hotel B5',3,'567 Geary St, San Francisco, CA 94105',5,'b5@hotelchainb.com','555-201-0005',3),(22,'Hotel B6',4,'678 Sutter St, San Francisco, CA 94106',5,'b6@hotelchainb.com','555-201-0006',3),(23,'Hotel B7',3,'789 Union St, San Francisco, CA 94107',5,'b7@hotelchainb.com','555-201-0007',3),(24,'Hotel B8',5,'890 Chestnut St, San Francisco, CA 94108',5,'b8@hotelchainb.com','555-201-0008',3),(25,'Hotel C1',3,'123 Main St, Los Angeles, CA 90001',5,'c1@hotelchainc.com','555-301-0001',4),(26,'Hotel C2',4,'234 Main St, Los Angeles, CA 90002',5,'c2@hotelchainc.com','555-301-0002',4),(27,'Hotel C3',5,'345 Sunset Blvd, Los Angeles, CA 90003',5,'c3@hotelchainc.com','555-301-0003',4),(28,'Hotel C4',2,'456 Hollywood Blvd, Los Angeles, CA 90004',5,'c4@hotelchainc.com','555-301-0004',4),(29,'Hotel C5',3,'567 Santa Monica Blvd, Los Angeles, CA 90005',5,'c5@hotelchainc.com','555-301-0005',4),(30,'Hotel C6',4,'678 Wilshire Blvd, Los Angeles, CA 90006',5,'c6@hotelchainc.com','555-301-0006',4),(31,'Hotel C7',3,'789 Beverly Blvd, Los Angeles, CA 90007',5,'c7@hotelchainc.com','555-301-0007',4),(32,'Hotel C8',5,'890 Melrose Ave, Los Angeles, CA 90008',5,'c8@hotelchainc.com','555-301-0008',4),(33,'Hotel D1',3,'123 Oak St, Chicago, IL 60601',5,'d1@hotelchaind.com','555-401-0001',5),(34,'Hotel D2',4,'234 Oak St, Chicago, IL 60602',5,'d2@hotelchaind.com','555-401-0002',5),(35,'Hotel D3',5,'345 Michigan Ave, Chicago, IL 60603',5,'d3@hotelchaind.com','555-401-0003',5),(36,'Hotel D4',2,'456 Wacker Dr, Chicago, IL 60604',5,'d4@hotelchaind.com','555-401-0004',5),(37,'Hotel D5',3,'567 Lake Shore Dr, Chicago, IL 60605',5,'d5@hotelchaind.com','555-401-0005',5),(38,'Hotel D6',4,'678 State St, Chicago, IL 60606',5,'d6@hotelchaind.com','555-401-0006',5),(39,'Hotel D7',4,'789 Wabash Ave, Chicago, IL 60607',5,'d7@hotelchaind.com','555-401-0007',5),(40,'Hotel D8',5,'890 Michigan Ave, Chicago, IL 60608',5,'d8@hotelchaind.com','555-401-0008',5),(41,'Hotel E1',3,'123 Beacon St, Boston, MA 02108',5,'e1@hotelchaine.com','555-501-0001',6),(42,'Hotel E2',4,'234 Newbury St, Boston, MA 02116',5,'e2@hotelchaine.com','555-501-0002',6),(43,'Hotel E3',5,'345 Tremont St, Boston, MA 02118',5,'e3@hotelchaine.com','555-501-0003',6),(44,'Hotel E4',2,'456 Boylston St, Boston, MA 02115',5,'e4@hotelchaine.com','555-501-0004',6),(45,'Hotel E5',3,'567 Charles St, Boston, MA 02114',5,'e5@hotelchaine.com','555-501-0005',6),(46,'Hotel E6',4,'678 Washington St, Boston, MA 02111',5,'e6@hotelchaine.com','555-501-0006',6),(47,'Hotel E7',4,'789 Washington St, Boston, MA 02110',5,'e7@hotelchaine.com','555-501-0007',6),(48,'Hotel E8',5,'890 Cambridge St, Boston, MA 02134',5,'e8@hotelchaine.com','555-501-0008',6),(49,'Hotel A1',3,'10 First St, Miami, FL 33101',5,'a1@hotelchainf.com','555-201-0001',2),(50,'Hotel A2',4,'20 First St, Miami, FL 33102',5,'a2@hotelchainf.com','555-201-0002',2),(51,'Hotel A3',5,'30 Third St, Miami, FL 33103',5,'a3@hotelchainf.com','555-201-0003',2),(52,'Hotel A4',2,'40 Fourth St, Miami, FL 33104',5,'a4@hotelchainf.com','555-201-0004',2),(53,'Hotel A5',3,'50 Fifth St, Miami, FL 33105',5,'a5@hotelchainf.com','555-201-0005',2),(54,'Hotel A6',4,'60 Sixth St, Miami, FL 33106',5,'a6@hotelchainf.com','555-201-0006',2),(55,'Hotel A7',4,'70 Seventh St, Miami, FL 33107',5,'a7@hotelchainf.com','555-201-0007',2),(56,'Hotel A8',5,'80 Eighth St, Miami, FL 33108',5,'a8@hotelchainf.com','555-201-0008',2);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_chain`
--

DROP TABLE IF EXISTS `hotel_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_chain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `central_office_address` varchar(255) NOT NULL,
  `num_hotels` int NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_chain`
--

LOCK TABLES `hotel_chain` WRITE;
/*!40000 ALTER TABLE `hotel_chain` DISABLE KEYS */;
INSERT INTO `hotel_chain` VALUES (2,'Hotel Chain A','987 Union St, Miami, FL',8,'contact@hotelchainf.com','555-666-6666'),(3,'Hotel Chain B','456 Market St, San Francisco, CA',8,'contact@hotelchainb.com','555-222-2222'),(4,'Hotel Chain C','789 Central Ave, Los Angeles, CA',8,'contact@hotelchainc.com','555-333-3333'),(5,'Hotel Chain D','321 Oak St, Chicago, IL',8,'contact@hotelchaind.com','555-444-4444'),(6,'Hotel Chain E','654 Elm St, Boston, MA',8,'contact@hotelchaine.com','555-555-5555');
/*!40000 ALTER TABLE `hotel_chain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renting`
--

DROP TABLE IF EXISTS `renting`;
!40101 SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renting` (
  `renting_id` varchar(20) NOT NULL,
  `customer_id` varchar(20) NOT NULL,
  `room_id` int NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `booking_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`renting_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `renting_ibfk_2` (`room_id`),
  KEY `renting_ibfk_4` (`booking_id`),
  CONSTRAINT `renting_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn_or_sin`),
  CONSTRAINT `renting_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_number`) ON DELETE CASCADE,
  CONSTRAINT `renting_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`ssn_or_sin`),
  CONSTRAINT `renting_ibfk_4` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renting`
--

LOCK TABLES `renting` WRITE;
/*!40000 ALTER TABLE `renting` DISABLE KEYS */;
INSERT INTO `renting` VALUES ('rent0978','444-55-6666',1195,'11111187','2023-06-01','2023-06-02',NULL),('rent1234','111-22-3333',1103,'11111136','2023-06-01','2023-06-02','Booking-C001'),('rent1278','567-89-0123',1262,'11111229','2023-06-01','2023-06-02',NULL),('rent234','333-44-5555',1142,'11111163','2023-06-01','2023-06-02',NULL),('rent456','345-67-8901',1177,'11111184','2023-06-01','2023-06-02',NULL),('rent6512','555-66-7777',1210,'11111196','2023-06-01','2023-06-02',NULL),('rent728','666-77-8888',2038,'21111136','2023-06-01','2023-06-02',NULL),('rent7621','456-78-9012',1201,'11111193','2023-06-01','2023-06-02',NULL),('rent892','678-90-1234',2039,'21111136','2023-06-01','2023-06-02',NULL);
/*!40000 ALTER TABLE `renting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renting_history`
--

DROP TABLE IF EXISTS `renting_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renting_history` (
  `renting_id` varchar(20) NOT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `employee_id` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`renting_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `renting_history_ibfk_3_idx` (`room_id`),
  CONSTRAINT `renting_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn_or_sin`),
  CONSTRAINT `renting_history_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`ssn_or_sin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renting_history`
--

LOCK TABLES `renting_history` WRITE;
/*!40000 ALTER TABLE `renting_history` DISABLE KEYS */;
INSERT INTO `renting_history` VALUES ('rent0978','444-55-6666',1195,'11111187','2023-06-01','2023-06-02',NULL);
/*!40000 ALTER TABLE `renting_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_number` int NOT NULL,
  `hotel_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `amenities` text,
  `capacity` enum('single','double','triple','quad') NOT NULL,
  `view` enum('sea','mountain','none') NOT NULL,
  `extendable` tinyint(1) NOT NULL,
  `damages` text,
  `status` enum('available','unavailable') NOT NULL DEFAULT 'available',
  PRIMARY KEY (`room_number`),
  KEY `idx_rooms_hotel_id` (`hotel_id`),
  KEY `idx_room_status` (`status`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1101,17,130.50,'Wifi,TV,mini bar','double','sea',0,NULL,'unavailable'),(1102,17,124.23,'Wifi,TV,mini bar','double','sea',0,NULL,'unavailable'),(1103,17,131.23,'Wifi,TV,mini bar','single','mountain',1,NULL,'unavailable'),(1104,17,120.35,'Wifi,TV,mini bar','double','sea',1,NULL,'unavailable'),(1105,17,210.00,'Wifi, TV, Mini Fridge, Air Conditioning','quad','mountain',1,NULL,'available'),(1106,18,120.50,'Wifi,TV,mini bar','double','sea',0,NULL,'available'),(1107,18,125.24,'Wifi,TV,mini bar','single','sea',1,NULL,'available'),(1108,18,97.71,'Wifi,TV,mini bar','quad','sea',0,NULL,'available'),(1109,18,92.44,'Wifi,TV,mini bar','quad','none',1,NULL,'available'),(1110,18,116.37,'Wifi,TV,mini bar','quad','sea',0,NULL,'available'),(1111,19,133.62,'Wifi,TV,mini bar','triple','mountain',1,NULL,'available'),(1112,19,186.30,'Wifi,TV,mini bar','triple','mountain',1,NULL,'available'),(1113,19,152.06,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(1114,19,182.12,'Wifi,TV,mini bar','triple','none',0,NULL,'available'),(1115,19,112.08,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1116,20,157.35,'Wifi,TV,mini bar','triple','mountain',0,NULL,'unavailable'),(1117,20,128.76,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(1118,20,152.46,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(1119,20,150.29,'Wifi,TV,mini bar','quad','none',0,NULL,'available'),(1120,20,86.73,'Wifi,TV,mini bar','triple','sea',1,NULL,'available'),(1121,21,157.21,'Wifi,TV,mini bar','quad','mountain',1,NULL,'available'),(1122,21,196.86,'Wifi,TV,mini bar','triple','none',0,NULL,'available'),(1123,21,140.29,'Wifi,TV,mini bar','single','sea',1,NULL,'available'),(1124,21,198.64,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(1125,21,196.35,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(1126,22,98.84,'Wifi,TV,mini bar','single','none',1,NULL,'available'),(1127,22,198.04,'Wifi,TV,mini bar','single','none',1,NULL,'available'),(1128,22,173.99,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(1129,22,98.93,'Wifi,TV,mini bar','double','sea',1,NULL,'available'),(1130,22,142.94,'Wifi,TV,mini bar','double','none',0,NULL,'available'),(1131,23,153.19,'Wifi,TV,mini bar','single','none',1,NULL,'available'),(1132,23,120.54,'Wifi,TV,mini bar','single','sea',1,NULL,'available'),(1133,23,128.10,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(1134,23,97.12,'Wifi,TV,mini bar','triple','none',0,NULL,'available'),(1135,23,174.92,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(1136,24,158.46,'Wifi,TV,mini bar','single','none',0,NULL,'available'),(1137,24,142.85,'Wifi,TV,mini bar','single','none',0,NULL,'available'),(1138,24,129.67,'Wifi,TV,mini bar','quad','sea',0,NULL,'available'),(1139,24,184.25,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(1140,24,103.99,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(1141,26,85.75,'Wifi,TV,mini bar','single','sea',0,NULL,'available'),(1142,26,151.08,'Wifi,TV,mini bar','double','mountain',0,NULL,'available'),(1143,26,134.94,'Wifi,TV,mini bar','triple','mountain',1,NULL,'available'),(1144,26,148.91,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(1145,26,136.61,'Wifi,TV,mini bar','double','sea',0,NULL,'available'),(1146,27,193.68,'Wifi,TV,mini bar','double','mountain',0,NULL,'available'),(1147,27,164.55,'Wifi,TV,mini bar','triple','none',1,NULL,'available'),(1148,27,194.95,'Wifi,TV,mini bar','double','mountain',0,NULL,'available'),(1149,27,186.28,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(1150,27,89.43,'Wifi,TV,mini bar','quad','none',1,NULL,'available'),(1151,28,112.19,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1152,28,110.10,'Wifi,TV,mini bar','double','none',0,NULL,'available'),(1153,28,82.14,'Wifi,TV,mini bar','double','mountain',0,NULL,'available'),(1154,28,101.88,'Wifi,TV,mini bar','single','sea',1,NULL,'available'),(1155,28,105.08,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(1156,29,81.96,'Wifi,TV,mini bar','triple','mountain',1,NULL,'available'),(1157,29,89.50,'Wifi,TV,mini bar','triple','mountain',1,NULL,'available'),(1158,29,126.23,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1159,29,176.21,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(1160,29,132.25,'Wifi,TV,mini bar','double','none',0,NULL,'available'),(1161,30,119.70,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1162,30,159.84,'Wifi,TV,mini bar','single','none',1,NULL,'available'),(1163,30,114.30,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(1164,30,120.52,'Wifi,TV,mini bar','double','mountain',1,NULL,'available'),(1165,30,147.85,'Wifi,TV,mini bar','double','none',0,NULL,'available'),(1166,31,153.34,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(1167,31,137.70,'Wifi,TV,mini bar','quad','none',0,NULL,'available'),(1168,31,91.27,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(1169,31,84.35,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(1170,31,100.98,'Wifi,TV,mini bar','triple','none',1,NULL,'available'),(1171,32,191.23,'Wifi,TV,mini bar','double','mountain',1,NULL,'available'),(1172,32,132.77,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(1173,32,184.51,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1174,32,136.78,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(1175,32,136.75,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1176,33,141.86,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(1177,33,117.66,'Wifi,TV,mini bar','quad','none',0,NULL,'available'),(1178,33,116.55,'Wifi,TV,mini bar','triple','none',1,NULL,'available'),(1179,33,105.47,'Wifi,TV,mini bar','single','sea',1,NULL,'available'),(1180,33,124.24,'Wifi,TV,mini bar','quad','none',1,NULL,'available'),(1181,32,185.82,'Wifi,TV,mini bar','quad','mountain',1,NULL,'available'),(1182,32,102.47,'Wifi,TV,mini bar','double','sea',0,NULL,'available'),(1183,32,179.47,'Wifi,TV,mini bar','quad','mountain',1,NULL,'available'),(1184,32,154.94,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(1185,32,141.81,'Wifi,TV,mini bar','double','sea',1,NULL,'available'),(1186,33,158.81,'Wifi,TV,mini bar','single','sea',0,NULL,'available'),(1187,33,151.57,'Wifi,TV,mini bar','double','none',0,NULL,'available'),(1188,33,162.81,'Wifi,TV,mini bar','double','sea',0,NULL,'available'),(1189,33,125.19,'Wifi,TV,mini bar','double','none',0,NULL,'available'),(1190,33,92.31,'Wifi,TV,mini bar','quad','none',0,NULL,'available'),(1191,34,134.03,'Wifi,TV,mini bar','triple','sea',1,NULL,'available'),(1192,34,186.15,'Wifi,TV,mini bar','triple','sea',1,NULL,'available'),(1193,34,165.56,'Wifi,TV,mini bar','quad','none',1,NULL,'available'),(1194,34,102.73,'Wifi,TV,mini bar','double','sea',1,NULL,'available'),(1195,34,106.42,'Wifi,TV,mini bar','double','sea',0,NULL,'available'),(1196,35,117.97,'Wifi,TV,mini bar','quad','mountain',1,NULL,'available'),(1197,35,187.61,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(1198,35,95.94,'Wifi,TV,mini bar','single','none',0,NULL,'available'),(1199,35,81.20,'Wifi,TV,mini bar','triple','none',1,NULL,'available'),(1200,35,183.20,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(1201,36,167.68,'Wifi,TV,mini bar','single','none',0,NULL,'available'),(1202,36,198.70,'Wifi,TV,mini bar','triple','sea',1,NULL,'available'),(1203,36,165.91,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1204,36,169.81,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(1205,36,95.64,'Wifi,TV,mini bar','quad','sea',0,NULL,'available'),(1206,37,110.94,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1207,37,85.23,'Wifi,TV,mini bar','double','none',1,NULL,'available'),(1208,37,179.28,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(1209,37,158.07,'Wifi,TV,mini bar','triple','none',0,NULL,'available'),(1210,37,150.49,'Wifi,TV,mini bar','single','none',0,NULL,'available'),(1211,38,115.23,'Wifi,TV,mini bar','single','sea',1,NULL,'available'),(1212,38,130.45,'Wifi,TV,mini bar','triple','sea',1,NULL,'available'),(1213,38,121.76,'Wifi,TV,mini bar','double','none',1,NULL,'available'),(1214,38,130.24,'Wifi,TV,mini bar','quad','sea',0,NULL,'available'),(1215,38,132.75,'Wifi,TV,mini bar','quad','none',1,NULL,'available'),(1216,39,172.91,'Wifi,TV,mini bar','triple','sea',1,NULL,'available'),(1217,39,145.86,'Wifi,TV,mini bar','single','none',1,NULL,'available'),(1218,39,113.13,'Wifi,TV,mini bar','quad','sea',0,NULL,'available'),(1219,39,130.55,'Wifi,TV,mini bar','single','none',0,NULL,'available'),(1220,39,188.27,'Wifi,TV,mini bar','single','sea',0,NULL,'available'),(1221,40,135.68,'Wifi,TV,mini bar','double','sea',1,NULL,'available'),(1222,40,158.75,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(1223,40,98.22,'Wifi,TV,mini bar','double','mountain',1,NULL,'available'),(1224,40,179.86,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1225,40,128.23,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(1226,41,98.98,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(1227,41,135.05,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(1228,41,182.00,'Wifi,TV,mini bar','double','sea',0,NULL,'available'),(1229,41,191.71,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1230,41,94.86,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(1231,42,172.42,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(1232,42,120.18,'Wifi,TV,mini bar','quad','sea',0,NULL,'available'),(1233,42,139.48,'Wifi,TV,mini bar','quad','none',0,NULL,'available'),(1234,42,135.21,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1235,42,163.18,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(1236,43,191.97,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(1237,43,113.18,'Wifi,TV,mini bar','quad','mountain',0,NULL,'available'),(1238,43,128.53,'Wifi,TV,mini bar','quad','sea',0,NULL,'available'),(1239,43,100.57,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(1240,43,134.39,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(1241,44,113.68,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(1242,44,148.13,'Wifi,TV,mini bar','quad','none',1,NULL,'available'),(1243,44,138.31,'Wifi,TV,mini bar','quad','mountain',1,NULL,'available'),(1244,44,152.72,'Wifi,TV,mini bar','triple','mountain',1,NULL,'available'),(1245,44,193.84,'Wifi,TV,mini bar','quad','none',0,NULL,'available'),(1246,45,153.42,'Wifi,TV,mini bar','triple','sea',1,NULL,'available'),(1247,45,100.52,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(1248,45,141.32,'Wifi,TV,mini bar','triple','none',0,NULL,'available'),(1249,45,119.52,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(1250,45,137.82,'Wifi,TV,mini bar','double','none',1,NULL,'available'),(1251,46,85.93,'Wifi,TV,mini bar','single','sea',0,NULL,'available'),(1252,46,119.58,'Wifi,TV,mini bar','single','none',1,NULL,'available'),(1253,46,151.90,'Wifi,TV,mini bar','quad','none',0,NULL,'available'),(1254,46,111.01,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(1255,46,140.07,'Wifi,TV,mini bar','quad','none',0,NULL,'available'),(1256,47,165.50,'Wifi,TV,mini bar','quad','none',1,NULL,'available'),(1257,47,187.30,'Wifi,TV,mini bar','single','sea',0,NULL,'available'),(1258,47,178.61,'Wifi,TV,mini bar','double','none',0,NULL,'available'),(1259,47,126.69,'Wifi,TV,mini bar','double','none',0,NULL,'available'),(1260,47,83.04,'Wifi,TV,mini bar','single','none',1,NULL,'available'),(1261,48,105.16,'Wifi,TV,mini bar','double','sea',1,NULL,'available'),(1262,48,187.80,'Wifi,TV,mini bar','double','none',1,NULL,'available'),(1263,48,176.28,'Wifi,TV,mini bar','single','none',1,NULL,'available'),(1264,48,84.29,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(1265,48,82.23,'Wifi,TV,mini bar','triple','none',0,NULL,'available'),(2000,49,162.07,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(2001,49,141.57,'Wifi,TV,mini bar','single','sea',1,NULL,'available'),(2002,49,181.69,'Wifi,TV,mini bar','single','none',0,NULL,'available'),(2003,49,162.72,'Wifi,TV,mini bar','double','mountain',0,NULL,'available'),(2004,49,105.57,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(2005,50,140.67,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(2006,50,127.12,'Wifi,TV,mini bar','double','none',1,NULL,'available'),(2007,50,183.32,'Wifi,TV,mini bar','triple','none',1,NULL,'available'),(2008,50,166.62,'Wifi,TV,mini bar','double','none',0,NULL,'available'),(2009,50,84.50,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(2010,51,111.70,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(2011,51,112.56,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(2012,51,190.23,'Wifi,TV,mini bar','double','sea',1,NULL,'available'),(2013,51,144.79,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(2014,51,100.88,'Wifi,TV,mini bar','triple','mountain',0,NULL,'available'),(2015,52,139.75,'Wifi,TV,mini bar','quad','sea',0,NULL,'available'),(2016,52,99.35,'Wifi,TV,mini bar','double','none',0,NULL,'available'),(2017,52,124.84,'Wifi,TV,mini bar','double','mountain',0,NULL,'available'),(2018,52,125.29,'Wifi,TV,mini bar','quad','mountain',1,NULL,'available'),(2019,52,167.74,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(2020,53,135.46,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(2021,53,86.34,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(2022,53,180.15,'Wifi,TV,mini bar','double','none',1,NULL,'available'),(2023,53,198.49,'Wifi,TV,mini bar','triple','mountain',1,NULL,'available'),(2024,53,122.97,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(2025,54,103.22,'Wifi,TV,mini bar','double','mountain',0,NULL,'available'),(2026,54,183.81,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(2027,54,156.66,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(2028,54,170.89,'Wifi,TV,mini bar','quad','none',0,NULL,'available'),(2029,54,87.05,'Wifi,TV,mini bar','double','sea',1,NULL,'available'),(2030,55,182.61,'Wifi,TV,mini bar','quad','none',1,NULL,'available'),(2031,55,181.16,'Wifi,TV,mini bar','triple','sea',0,NULL,'available'),(2032,55,158.57,'Wifi,TV,mini bar','quad','sea',1,NULL,'available'),(2033,55,92.71,'Wifi,TV,mini bar','triple','none',0,NULL,'available'),(2034,55,117.03,'Wifi,TV,mini bar','double','sea',1,NULL,'available'),(2035,56,163.54,'Wifi,TV,mini bar','single','mountain',0,NULL,'available'),(2036,56,103.13,'Wifi,TV,mini bar','quad','none',0,NULL,'available'),(2037,56,164.01,'Wifi,TV,mini bar','double','mountain',0,NULL,'available'),(2038,56,112.86,'Wifi,TV,mini bar','single','mountain',1,NULL,'available'),(2039,56,121.16,'Wifi,TV,mini bar','single','mountain',1,NULL,'available');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rooms_capacity_per_hotel`
--

DROP TABLE IF EXISTS `rooms_capacity_per_hotel`;
/*!50001 DROP VIEW IF EXISTS `rooms_capacity_per_hotel`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rooms_capacity_per_hotel` AS SELECT 
 1 AS `hotel_id`,
 1 AS `capacity`,
 1 AS `total_rooms`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `available_rooms_per_hotel`
--

/*!50001 DROP VIEW IF EXISTS `available_rooms_per_hotel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;

/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `available_rooms_per_hotel` AS select `rooms`.`hotel_id` AS `hotel_id`,count(0) AS `available_rooms` from `rooms` where (`rooms`.`status` = 'available') group by `rooms`.`hotel_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;


--
-- Final view structure for view `rooms_capacity_per_hotel`
--

/*!50001 DROP VIEW IF EXISTS `rooms_capacity_per_hotel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;

/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `rooms_capacity_per_hotel` AS select `rooms`.`hotel_id` AS `hotel_id`,`rooms`.`capacity` AS `capacity`,count(0) AS `total_rooms` from `rooms` group by `rooms`.`hotel_id`,`rooms`.`capacity` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-31  0:05:16
