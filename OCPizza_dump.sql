-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: ocPizza
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `adresse_client`
--

DROP TABLE IF EXISTS `adresse_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresse_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant_client` int(11) NOT NULL,
  `adresse_actuelle` tinyint(1) DEFAULT '1',
  `num_voie` varchar(20) DEFAULT NULL,
  `voie` varchar(250) NOT NULL,
  `complement_adresse` varchar(250) DEFAULT NULL,
  `commentaire` text,
  `code_postal` int(11) NOT NULL,
  `commune` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_adresse_fk` (`identifiant_client`),
  CONSTRAINT `client_adresse_fk` FOREIGN KEY (`identifiant_client`) REFERENCES `client` (`identifiant`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse_client`
--

LOCK TABLES `adresse_client` WRITE;
/*!40000 ALTER TABLE `adresse_client` DISABLE KEYS */;
INSERT INTO `adresse_client` VALUES (1,15,1,'92','Lotheville',NULL,NULL,67029,'Strasbourg'),(2,18,1,'65','Mariners Cove','Nord-Pas-de-Calais','Europe/Paris',59463,'Lomme'),(3,14,1,'80','5th','Basse-Normandie','Europe/Paris',61015,'Alençon'),(4,3,1,'77','Aberg',NULL,NULL,59865,'Lille'),(5,28,1,'58','Beilfuss',NULL,NULL,78604,'Maisons-Laffitte'),(6,3,1,'36','Towne',NULL,NULL,95761,'Roissy Charles-de-Gaulle'),(7,19,1,'22','Glacier Hill',NULL,NULL,19117,'Brive-la-Gaillarde'),(8,30,1,'100','Maywood',NULL,NULL,92504,'Rueil-Malmaison'),(9,16,1,'2','Lukken',NULL,NULL,88020,'Épinal'),(10,6,1,'74','Rieder',NULL,NULL,20414,'Bastia'),(11,23,1,'23','Lyons','Poitou-Charentes','Europe/Paris',17184,'Périgny'),(12,26,1,'3','Sutherland',NULL,NULL,71332,'Chalon-sur-Saône'),(13,20,1,'58','Leroy',NULL,NULL,60922,'Creil'),(14,30,1,'60','Waxwing',NULL,NULL,74999,'Annecy'),(15,11,1,'32','Oneill',NULL,NULL,75080,'Paris 02'),(16,21,1,'38','Acker',NULL,NULL,18035,'Bourges'),(17,7,1,'71','Pearson','Île-de-France','Europe/Paris',93344,'Le Raincy'),(18,4,1,'30','Marcy',NULL,NULL,69669,'Villefranche-sur-Saône'),(19,1,1,'54','Shasta',NULL,NULL,95194,'Goussainville'),(20,15,1,'74','Packers',NULL,NULL,95118,'Sannois');
/*!40000 ALTER TABLE `adresse_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affectation_staff`
--

DROP TABLE IF EXISTS `affectation_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affectation_staff` (
  `pizzeria_id` int(11) NOT NULL,
  `identifiant_staff` int(11) NOT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`pizzeria_id`,`identifiant_staff`),
  KEY `mb_staff_affectation_staff_fk` (`identifiant_staff`),
  CONSTRAINT `mb_staff_affectation_staff_fk` FOREIGN KEY (`identifiant_staff`) REFERENCES `mb_staff` (`identifiant`),
  CONSTRAINT `pizzeria_affectation_staff_fk` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affectation_staff`
--

LOCK TABLES `affectation_staff` WRITE;
/*!40000 ALTER TABLE `affectation_staff` DISABLE KEYS */;
INSERT INTO `affectation_staff` VALUES (1,7,'2019-04-23 23:28:57',NULL),(1,19,'2019-04-01 00:18:38',NULL),(2,6,'2019-01-22 19:54:04',NULL),(2,13,'2019-09-11 13:05:31',NULL),(2,16,'2019-07-24 06:31:13',NULL),(2,21,'2019-03-01 01:21:22',NULL),(2,30,'2019-07-06 10:09:23',NULL),(3,1,'2019-07-30 01:04:30',NULL),(3,12,'2018-12-04 02:14:32',NULL),(3,18,'2019-08-06 10:31:37',NULL),(3,20,'2019-08-10 00:02:02',NULL),(3,22,'2019-07-15 10:21:02',NULL),(4,10,'2019-02-22 06:56:44',NULL),(5,5,'2019-04-03 07:45:48',NULL),(5,15,'2018-12-17 00:08:40',NULL),(5,23,'2018-12-04 08:49:58',NULL),(5,28,'2019-09-10 02:15:31',NULL),(6,3,'2019-06-30 04:58:12',NULL),(6,17,'2019-07-26 06:11:32',NULL),(6,26,'2019-04-01 05:15:12',NULL),(6,27,'2019-07-06 21:52:49',NULL),(7,24,'2018-10-21 10:54:12',NULL),(7,29,'2019-09-04 16:44:31',NULL),(8,14,'2018-10-28 05:59:29',NULL),(8,25,'2019-09-30 02:45:27',NULL),(9,2,'2019-08-23 09:12:15',NULL),(9,4,'2019-01-29 01:49:09',NULL),(9,8,'2019-01-16 07:14:22',NULL),(10,9,'2018-10-19 04:14:28','2019-01-16 07:14:22'),(10,11,'2018-10-17 00:41:46',NULL);
/*!40000 ALTER TABLE `affectation_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie_ingredient`
--

DROP TABLE IF EXISTS `categorie_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie_ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie_ingredient`
--

LOCK TABLES `categorie_ingredient` WRITE;
/*!40000 ALTER TABLE `categorie_ingredient` DISABLE KEYS */;
INSERT INTO `categorie_ingredient` VALUES (1,'bases'),(2,'pates'),(3,'ingredients pates pizza'),(4,'viandes & poissons'),(5,'fromages'),(6,'condiments'),(7,'legumes'),(8,'boissons'),(9,'snacks'),(10,'desserts');
/*!40000 ALTER TABLE `categorie_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie_produit`
--

DROP TABLE IF EXISTS `categorie_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie_produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie_produit`
--

LOCK TABLES `categorie_produit` WRITE;
/*!40000 ALTER TABLE `categorie_produit` DISABLE KEYS */;
INSERT INTO `categorie_produit` VALUES (1,'Pizzas'),(2,'Pâtes'),(3,'Plats chauds'),(4,'Salades'),(5,'Boissons'),(6,'Desserts'),(7,'Suppléments');
/*!40000 ALTER TABLE `categorie_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `identifiant` int(11) NOT NULL AUTO_INCREMENT,
  `cpte_en_ligne` tinyint(1) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `mail` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`identifiant`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,0,'Spilsted','Dorothée','kspilsted0@stumbleupon.com','OBi6VWUIfD'),(2,1,'Pietron','Eléa','mpietron1@myspace.com','liYcLWOoet'),(3,1,'Sey','Irène','csey2@so-net.ne.jp','xnbMZleW88'),(4,1,'Benedicto','Cléa','lbenedicto3@list-manage.com','W6LJ43I'),(5,1,'Plastow','Cléopatre','yplastow4@addthis.com','JmdIUHOMaj8'),(6,0,'Seargeant','Félicie','fseargeant5@opensource.org','WNXm11p7l'),(7,1,'Gosson','Lèi','dgosson6@bloglines.com','6Ws3h7D7'),(8,1,'Dennick','Pélagie','edennick7@seesaa.net','ysrf6jomDDK'),(9,1,'Drillingcourt','Hélène','mdrillingcourt8@cnet.com','2UeRZFUmVn'),(10,1,'Seel','Réjane','iseel9@intel.com','mJG5YWafQ'),(11,0,'Stallon','Marie-thérèse','gstallona@twitpic.com','rvVqwntCff'),(12,1,'Bugdell','Gaëlle','cbugdellb@youtube.com','l32mzmq2B'),(13,1,'Izzett','Lèi','cizzettc@twitpic.com','QNkXSp0'),(14,0,'Charlin','Almérinda','echarlind@oaic.gov.au','ulv4zZl30J'),(15,0,'Lante','Béatrice','alantee@elegantthemes.com','S6QRWHeN4'),(16,0,'Matchett','Annotée','dmatchettf@goo.ne.jp','tBiz8DCu'),(17,1,'Dykes','Lauréna','pdykesg@indiatimes.com','s0Cc07eF'),(18,1,'MacArte','Kévina','gmacarteh@nature.com','IHfr4nE6k8x3'),(19,1,'Barg','Léana','cbargi@squarespace.com','DtRyvI'),(20,0,'Skace','Maïly','kskacej@sogou.com','IPOJfA'),(21,1,'Colin','Thérèsa','dcolink@1und1.de','Arhexk6uek'),(22,1,'MacWilliam','Médiamass','amacwilliaml@huffingtonpost.com','bgs8ofbAlLJ'),(23,0,'Lehemann','Mélys','alehemannm@google.com','AkoBUAEyyP'),(24,1,'Allpress','Léane','aallpressn@patch.com','PQHmpRtQSR'),(25,1,'Nestor','Estève','rnestoro@phpbb.com','iKydxF9cb3w'),(26,0,'Trow','Åke','dtrowp@fema.gov','JkOWHUDygm'),(27,1,'Hellicar','Athéna','khellicarq@ovh.net','ialzJ9tUHr'),(28,1,'Gorke','Régine','dgorker@nba.com','iIsV3AZR'),(29,1,'Klaaassen','Marie-françoise','bklaaassens@dell.com','SnfEy5mFlk'),(30,1,'Summerskill','Solène','ssummerskillt@vkontakte.ru','d55OTstwvp');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `numero_cmde` varchar(150) NOT NULL,
  `pizzeria_id` int(11) NOT NULL,
  `identifiant_client` int(11) NOT NULL,
  `adresse_client` int(11) DEFAULT NULL,
  `date_cmde` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `statut` varchar(100) NOT NULL DEFAULT 'En attente de préparation',
  `reduction_100` int(11) DEFAULT NULL,
  `paiement` tinyint(1) DEFAULT '0',
  `type_paiement` varchar(20) DEFAULT NULL,
  `serveur` int(11) DEFAULT NULL,
  `pizzaiolo` int(11) DEFAULT NULL,
  `time_debut_preparation` time DEFAULT NULL,
  `time_fin_preparation` time DEFAULT NULL,
  `pb_cmde` text,
  PRIMARY KEY (`numero_cmde`),
  KEY `pizzeria_commande_fk` (`pizzeria_id`),
  KEY `mb_staff_commande_fk` (`serveur`),
  KEY `mb_staff_commande_fk1` (`pizzaiolo`),
  KEY `client_commande_fk` (`identifiant_client`),
  CONSTRAINT `client_commande_fk` FOREIGN KEY (`identifiant_client`) REFERENCES `client` (`identifiant`),
  CONSTRAINT `mb_staff_commande_fk` FOREIGN KEY (`serveur`) REFERENCES `mb_staff` (`identifiant`),
  CONSTRAINT `mb_staff_commande_fk1` FOREIGN KEY (`pizzaiolo`) REFERENCES `mb_staff` (`identifiant`),
  CONSTRAINT `pizzeria_commande_fk` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES ('C10_201810_10475',10,3,NULL,'2018-10-13 21:26:51','Livrée',NULL,1,'En ligne',NULL,13,'21:39:51','21:59:51',NULL),('C10_201903_1',10,14,NULL,'2019-10-03 11:25:18','Livrée',NULL,1,'CB',3,12,'11:45:18','12:05:18',NULL),('C1_201811_27000',1,20,NULL,'2019-10-29 19:01:02','Livrée',NULL,1,'Espèce',4,11,'19:05:02','19:16:02',NULL),('C2_201903_390',2,26,NULL,'2019-03-26 19:46:21','Livrée',NULL,1,'CB',3,10,'19:54:21','20:05:21',NULL),('C3_201901_1',3,3,NULL,'2019-01-04 12:50:50','Livrée',NULL,1,'En ligne',NULL,15,'12:54:50','13:05:50',NULL),('C3_201908_7684',3,7,NULL,'2019-10-29 18:30:14','En cours de livraison',NULL,1,'En ligne',NULL,15,'19:19:14','19:35:15',NULL),('C4_201904_2903',4,30,NULL,'2019-10-29 19:15:12','En cours de livraison',NULL,0,NULL,5,12,'19:26:12','19:39:12',NULL),('C4_201910_489',4,11,NULL,'2019-10-29 19:43:28','En attente de préparation',NULL,0,NULL,9,NULL,NULL,NULL,NULL),('C5_201901_12',5,30,NULL,'2019-01-30 20:47:36','Livrée',NULL,1,'En ligne',NULL,17,'20:54:36','20:57:36',NULL),('C5_201907_8739',6,11,NULL,'2019-10-29 19:37:55','En attente de livraison',NULL,0,NULL,6,13,'19:40:52','19:49:52',NULL),('C6_201811_2756',6,28,NULL,'2018-11-07 20:52:04','Livrée',NULL,1,'En ligne',NULL,14,'20:55:04','21:10:04',NULL),('C6_201811_9843',6,6,NULL,'2018-11-26 18:51:46','Livrée',NULL,1,'CB',1,19,'21:12:46','21:37:46',NULL),('C6_201812_40932',1,21,NULL,'2019-10-29 19:25:04','En cours de livraison',10,1,'En ligne',NULL,14,'19:32:35','19:45:21',NULL),('C6_201908_489',6,15,NULL,'2019-10-29 19:47:37','En attente de préparation',NULL,1,'CB',7,NULL,NULL,NULL,NULL),('C6_201908_546',6,4,NULL,'2019-10-29 19:18:26','En cours de péparation',NULL,1,'En ligne',NULL,16,'19:30:31','19:42:26','augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices'),('C6_201908_579',6,16,NULL,'2019-08-25 19:27:31','Livrée',NULL,1,'Chèque',9,18,'19:56:52','20:05:31',NULL),('C6_201910_1005',6,19,NULL,'2019-10-02 13:20:10','Livrée',NULL,0,'En ligne',NULL,16,'13:25:10','13:35:10','justo nec condimentum neque sapien placerat ante nulla justo aliquam'),('C6_210906_678',6,15,NULL,'2019-06-14 12:28:53','Livrée',NULL,1,'CB',1,10,'12:35:53','12:50:53',NULL),('C7_201908_1',7,18,NULL,'2019-08-03 13:09:55','Livrée',NULL,1,'En ligne',NULL,11,'13:15:00','13:40:25','a odio in hac habitasse platea dictumst maecenas ut massa'),('C8_201905_584',8,23,NULL,'2019-05-31 19:15:32','Livrée',NULL,1,'Espèce',2,20,'19:30:32','19:45:32',NULL);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_tel_client`
--

DROP TABLE IF EXISTS `contact_tel_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_tel_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant_client` int(11) NOT NULL,
  `num_tel` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_contact_tel_fk` (`identifiant_client`),
  CONSTRAINT `client_contact_tel_fk` FOREIGN KEY (`identifiant_client`) REFERENCES `client` (`identifiant`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_tel_client`
--

LOCK TABLES `contact_tel_client` WRITE;
/*!40000 ALTER TABLE `contact_tel_client` DISABLE KEYS */;
INSERT INTO `contact_tel_client` VALUES (1,1,'0763574719'),(2,2,'0127298138'),(3,3,'0242741180'),(4,4,'0561735956'),(5,5,'0778991586'),(6,6,'0364354868'),(7,7,'0233790703'),(8,8,'0821690843'),(9,9,'0175909289'),(10,10,'0578317785'),(11,11,'0324522943'),(12,12,'0454893103'),(13,13,'0776531544'),(14,14,'0989735032'),(15,15,'0422352693'),(16,16,'0455020874'),(17,17,'0622272026'),(18,18,'0512346991'),(19,19,'0641634647'),(20,20,'0643396884'),(21,21,'0379232329'),(22,22,'0806736924'),(23,23,'0121128663'),(24,24,'0282364675'),(25,25,'0849073400'),(26,26,'0823147208'),(27,27,'0971865270'),(28,28,'0974405947'),(29,29,'0127449297'),(30,30,'0875379746'),(31,16,'0118234403'),(32,28,'0195368551'),(33,3,'0695783722'),(34,1,'0851453607'),(35,12,'0984687268');
/*!40000 ALTER TABLE `contact_tel_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facture` (
  `numero_fact` varchar(150) NOT NULL,
  `numero_cmde` varchar(150) NOT NULL,
  `date_fact` datetime NOT NULL,
  PRIMARY KEY (`numero_fact`),
  KEY `commande_facture_fk` (`numero_cmde`),
  CONSTRAINT `commande_facture_fk` FOREIGN KEY (`numero_cmde`) REFERENCES `commande` (`numero_cmde`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture`
--

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;
INSERT INTO `facture` VALUES ('1','C6_210906_678','2019-03-11 19:51:06'),('10','C6_201811_9843','2019-04-01 23:03:25'),('11','C8_201905_584','2019-05-29 23:02:14'),('12','C2_201903_390','2019-07-07 00:59:53'),('13','C1_201811_27000','2019-05-31 18:33:50'),('16','C6_201812_40932','2019-09-23 10:22:46'),('17','C3_201908_7684','2019-05-10 07:28:42'),('18','C6_201908_546','2019-09-26 06:23:56'),('2','C7_201908_1','2018-11-27 02:24:39'),('20','C6_201908_489','2019-05-28 12:27:45'),('3','C10_201903_1','2018-11-13 04:47:41'),('4','C10_201810_10475','2018-10-29 13:33:47'),('5','C6_201811_2756','2019-03-01 22:00:18'),('6','C3_201901_1','2019-05-17 10:43:20'),('8','C5_201901_12','2019-06-28 23:46:56'),('9','C6_201908_579','2019-08-23 16:17:40');
/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `unite_de_mesure` varchar(20) DEFAULT 'unité',
  `categorie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorie_ingredient_ingredient_fk` (`categorie_id`),
  CONSTRAINT `categorie_ingredient_ingredient_fk` FOREIGN KEY (`categorie_id`) REFERENCES `categorie_ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Tomates','g',7),(2,'creme fraiche','g',1),(3,'sauce tomate','g',1),(4,'salade','g',7),(5,'champignon','g',7),(6,'coca','u',8),(7,'fanta','u',8),(8,'creme brulees','u',10),(9,'mousse chocolat','u',10),(10,'chicken wings','u',9),(11,'roti','g',4),(12,'pennes','g',2),(13,'lasagnes','g',2),(14,'sauce boloniaise','g',1),(15,'beurre','g',3),(16,'camembert','g',5),(17,'fromage à fondue','g',5),(18,'sel','g',6),(19,'anchois','g',4),(20,'origan','g',6),(21,'olives','g',7),(22,'Poivrons ','g',7),(23,'Artichauts','g',7),(24,'Aubergine','g',7),(25,'Mozzarella','g',5),(26,'Basilic','g',6),(27,'Jambon','g',4),(28,'Thon','g',4),(29,'Chorizo','g',4),(30,'Cantal','g',5),(31,'EAU MINÉRALE','u',5),(32,'COCA 33CL','u',5),(33,'FANTA 33CL','u',5),(34,'NESTEA PECHE 33CL','u',5),(35,'FONDANT AU CHOCOLAT','u',5),(36,'fromage','g',5),(37,'câpres','g',6),(38,'persillade','g',6),(39,'maïs','g',7),(40,'gruyère','g',5),(41,'coeur de palmier','g',7),(42,'lardons','g',4),(43,'EAU MINÉRALE','u',8),(44,'COCA 33CL','u',8),(45,'FANTA 33CL','u',8),(46,'NESTEA PECHE 33CL','u',8),(47,'FONDANT AU CHOCOLAT','u',10),(48,'GLACE  CHOCOLAT 100ML','u',10),(49,'vinaigrette','ml',6),(50,'oeuf','u',4);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_pizza`
--

DROP TABLE IF EXISTS `ingredient_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_pizza` (
  `produit_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantite` decimal(10,0) NOT NULL,
  PRIMARY KEY (`produit_id`,`ingredient_id`),
  KEY `ingredient_ingredient_pizza_fk` (`ingredient_id`),
  CONSTRAINT `ingredient_ingredient_pizza_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `produit_ingredient_pizza_fk` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_pizza`
--

LOCK TABLES `ingredient_pizza` WRITE;
/*!40000 ALTER TABLE `ingredient_pizza` DISABLE KEYS */;
INSERT INTO `ingredient_pizza` VALUES (1,3,50),(1,20,71),(1,21,37),(1,36,75),(2,3,10),(2,19,64),(2,20,11),(2,21,4),(2,36,3),(3,3,36),(3,19,42),(3,20,6),(3,21,28),(3,36,38),(3,37,57),(4,3,5),(4,20,12),(4,21,90),(4,22,19),(4,23,44),(4,36,67),(5,3,95),(5,20,26),(5,21,45),(5,24,14),(5,36,5),(6,3,53),(6,20,97),(6,21,100),(6,25,24),(6,26,50),(7,3,41),(7,20,19),(7,21,40),(7,27,58),(7,36,2),(8,3,11),(8,21,18),(8,28,93),(8,36,88),(8,38,70),(9,3,74),(9,11,55),(9,20,33),(9,29,40),(9,36,8),(10,3,91),(10,20,9),(10,21,73),(10,27,87),(10,30,20),(11,3,48),(11,5,81),(11,20,20),(11,21,16),(11,27,24),(11,36,22),(12,1,48),(12,4,63),(12,21,32),(12,25,14),(12,26,68),(13,1,76),(13,4,73),(13,21,31),(13,39,24),(13,40,97),(13,41,78),(14,1,22),(14,12,92),(14,21,45),(14,23,34),(14,27,31),(14,39,97),(15,4,45),(15,49,54),(16,1,54),(16,13,19),(16,14,26),(17,2,89),(17,12,70),(18,43,41),(19,44,22),(20,45,27),(21,46,93),(22,47,81),(23,48,31),(24,30,53),(25,29,52),(26,19,46),(27,23,5),(28,25,4),(29,27,69),(30,50,1);
/*!40000 ALTER TABLE `ingredient_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ligne_commande` (
  `numero_ligne` int(11) NOT NULL AUTO_INCREMENT,
  `numero_cmde` varchar(150) NOT NULL,
  `produit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire_HT` decimal(7,3) DEFAULT NULL,
  `taux_TVA_100` decimal(3,1) DEFAULT '5.5',
  PRIMARY KEY (`numero_ligne`),
  KEY `produit_ligne_commande_fk` (`produit`),
  KEY `commande_ligne_commande_fk` (`numero_cmde`),
  CONSTRAINT `commande_ligne_commande_fk` FOREIGN KEY (`numero_cmde`) REFERENCES `commande` (`numero_cmde`),
  CONSTRAINT `produit_ligne_commande_fk` FOREIGN KEY (`produit`) REFERENCES `produit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_commande`
--

LOCK TABLES `ligne_commande` WRITE;
/*!40000 ALTER TABLE `ligne_commande` DISABLE KEYS */;
INSERT INTO `ligne_commande` VALUES (1,'C6_210906_678',4,5,9.005,5.5),(2,'C6_210906_678',30,4,1.137,5.5),(3,'C7_201908_1',18,5,1.137,5.5),(4,'C7_201908_1',6,3,9.194,5.5),(5,'C7_201908_1',19,2,1.706,5.5),(6,'C10_201903_1',10,2,9.573,5.5),(7,'C10_201903_1',30,1,1.137,5.5),(8,'C10_201810_10475',28,2,1.137,5.5),(9,'C6_201811_2756',11,4,9.763,5.5),(10,'C3_201901_1',1,1,8.057,5.5),(11,'C6_201910_1005',25,5,1.137,5.5),(12,'C6_201910_1005',8,2,1.137,5.5),(13,'C5_201901_12',26,1,1.137,5.5),(14,'C6_201908_579',28,3,1.137,5.5),(15,'C6_201811_9843',14,4,6.825,5.5),(16,'C6_201811_9843',3,4,8.530,5.5),(17,'C8_201905_584',2,4,8.246,5.5),(18,'C2_201903_390',25,3,1.137,5.5),(19,'C2_201903_390',30,3,1.137,5.5),(20,'C2_201903_390',5,1,9.005,5.5),(21,'C1_201811_27000',8,2,1.137,5.5),(22,'C1_201811_27000',9,3,9.289,5.5),(23,'C4_201904_2903',3,1,8.530,5.5),(24,'C4_201904_2903',25,5,1.137,5.5),(25,'C5_201907_8739',29,3,1.896,5.5),(26,'C6_201812_40932',19,5,1.706,5.5),(27,'C3_201908_7684',24,3,1.137,5.5),(28,'C3_201908_7684',12,3,6.825,5.5),(29,'C3_201908_7684',10,2,9.573,5.5),(30,'C6_201908_546',11,4,9.763,5.5),(31,'C6_201908_546',6,5,9.194,5.5),(32,'C6_201908_546',28,5,1.137,5.5),(33,'C6_201908_546',17,3,6.825,5.5),(34,'C6_201908_546',16,4,6.825,5.5),(35,'C4_201910_489',22,5,2.280,5.5),(36,'C4_201910_489',13,2,6.825,5.5),(37,'C6_201908_489',16,1,6.825,5.5),(38,'C6_201908_489',9,3,9.289,5.5),(39,'C6_201908_489',10,3,9.573,5.5),(40,'C6_201908_489',17,3,6.825,5.5);
/*!40000 ALTER TABLE `ligne_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livraison` (
  `numero_cmde` varchar(150) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  `time_souhaitee_livr` datetime NOT NULL,
  `contact_client` int(11) DEFAULT NULL,
  `type_livraison` varchar(150) NOT NULL DEFAULT 'À emporter',
  `livreur` int(11) DEFAULT NULL,
  `time_debut_livraison` time DEFAULT NULL,
  `time_fin_livraison` time DEFAULT NULL,
  `pb_livraison` text,
  PRIMARY KEY (`numero_cmde`,`id_adresse`),
  KEY `mb_staff_livraisons_fk` (`livreur`),
  KEY `adresse_client_livraisons_fk` (`id_adresse`),
  KEY `contact_tel_client_livraison_fk` (`contact_client`),
  CONSTRAINT `adresse_client_livraisons_fk` FOREIGN KEY (`id_adresse`) REFERENCES `adresse_client` (`id`),
  CONSTRAINT `commande_livraisons_fk` FOREIGN KEY (`numero_cmde`) REFERENCES `commande` (`numero_cmde`),
  CONSTRAINT `contact_tel_client_livraison_fk` FOREIGN KEY (`contact_client`) REFERENCES `contact_tel_client` (`id`),
  CONSTRAINT `mb_staff_livraisons_fk` FOREIGN KEY (`livreur`) REFERENCES `mb_staff` (`identifiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
INSERT INTO `livraison` VALUES ('C10_201810_10475',4,'2018-10-13 22:14:51',NULL,'Livraison',23,'22:01:03','22:13:14',NULL),('C10_201903_1',3,'2019-10-03 12:30:00',NULL,'À emporter',3,'12:26:46','12:26:46',NULL),('C1_201811_27000',13,'2019-10-29 19:21:02',NULL,'À emporter',4,'19:23:24','19:23:24',NULL),('C2_201903_390',12,'2019-03-26 19:29:21',NULL,'Livraison',21,'20:08:14','20:18:21',NULL),('C3_201901_1',6,'2019-01-04 13:35:50',NULL,'Livraison',25,'13:12:35','13:29:52',NULL),('C3_201908_7684',17,'2019-10-29 20:00:14',NULL,'Livraison',25,'19:39:24',NULL,NULL),('C4_201904_2903',14,'2019-10-29 20:00:12',NULL,'Livraison',23,'19:48:12',NULL,NULL),('C4_201910_489',19,'2019-10-29 19:15:28',NULL,'À emporter',NULL,NULL,NULL,NULL),('C5_201901_12',8,'2019-01-30 21:32:36',NULL,'Livraison',27,'21:06:53','21:19:32',NULL),('C5_201907_8739',15,'2019-10-29 19:57:55',NULL,'À emporter',NULL,NULL,NULL,NULL),('C6_201811_2756',5,'2018-11-07 20:38:04',NULL,'Livraison',24,'21:11:35','21:25:59',NULL),('C6_201811_9843',10,'2018-11-26 21:30:00',NULL,'À emporter',1,'21:30:00','21:30:00',NULL),('C6_201812_40932',16,'2019-10-29 20:10:04',NULL,'Livraison',24,'19:49:53',NULL,NULL),('C6_201908_489',20,'2019-10-29 19:01:37',NULL,'À emporter',NULL,NULL,NULL,NULL),('C6_201908_546',18,'2019-10-29 20:17:10',NULL,'Livraison',NULL,NULL,NULL,NULL),('C6_201908_579',9,'2019-08-25 21:30:00',NULL,'Livraison',28,'21:13:53','21:28:46',NULL),('C6_201910_1005',7,'2019-10-02 14:05:10',NULL,'Livraison',26,'13:45:32',NULL,'nobody home'),('C6_210906_678',1,'2019-06-14 13:13:53',NULL,'Livraison',20,'13:02:43','13:12:17',NULL),('C7_201908_1',2,'2019-08-03 14:04:55',NULL,'Livraison',21,'13:50:21','14:02:01',NULL),('C8_201905_584',11,'2019-05-31 20:00:32',NULL,'Livraison',30,'19:53:32','20:00:32',NULL);
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mb_staff`
--

DROP TABLE IF EXISTS `mb_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mb_staff` (
  `identifiant` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `poste_principal` varchar(100) NOT NULL,
  `autorisation` int(11) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mail` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`identifiant`),
  KEY `niv_autorisation_mb_staff_fk` (`autorisation`),
  CONSTRAINT `niv_autorisation_mb_staff_fk` FOREIGN KEY (`autorisation`) REFERENCES `niv_autorisation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mb_staff`
--

LOCK TABLES `mb_staff` WRITE;
/*!40000 ALTER TABLE `mb_staff` DISABLE KEYS */;
INSERT INTO `mb_staff` VALUES (1,'Kinglake','Marie-noël','manager',1,'5416863045','bkinglake0@nymag.com','ZP2DZs5Dyyp'),(2,'Killiner','Anaëlle','manager',1,'5842923458','gkilliner1@photobucket.com','xzG6dlIP'),(3,'Featherby','Yénora','manager',1,'3046262888','ffeatherby2@mozilla.com','9ehd2I4'),(4,'Partridge','Léone','serveur',2,'2254297068','lpartridge3@usa.gov','qUwIGjZO'),(5,'Merrall','Almérinda','serveur',2,'8752744571','amerrall4@oracle.com','Bfbjkj8j'),(6,'Ollander','Bécassine','serveur',2,'6513659332','nollander5@admin.ch','2GfMr0LMc8'),(7,'Itzkovsky','Tán','serveur',2,'6546808504','sitzkovsky6@amazon.co.uk','FdgeCTkgp'),(8,'Nevill','Vénus','serveur',2,'2274571323','knevill7@sciencedirect.com','vHVKFt3ph'),(9,'Olive','Rachèle','serveur',2,'4321133010','colive8@statcounter.com','iXcHwcnkv'),(10,'Axelbee','Simplifiés','pizzaiolo',3,'3427691594','kaxelbee9@cbsnews.com','1yqzF6q1ZmuO'),(11,'Dreye','Marie-josée','pizzaiolo',3,'3636487821','fdreyea@fc2.com','p11jSW6e'),(12,'Calver','Laïla','pizzaiolo',3,'5118535146','ncalverb@berkeley.edu','LmRXSCH2N0'),(13,'Dundon','Magdalène','pizzaiolo',3,'1174106835','ddundonc@cloudflare.com','BIGlaT5'),(14,'Grayer','Athéna','pizzaiolo',3,'3469672336','egrayerd@cloudflare.com','gWfvdtG7o'),(15,'Tampen','Gaïa','pizzaiolo',3,'5837884768','mtampene@rambler.ru','8BhBduQ'),(16,'Poyner','Kallisté','pizzaiolo',3,'8162906243','rpoynerf@mozilla.org','NtzOYQ5tJu'),(17,'McGraith','Maëline','pizzaiolo',3,'9732953596','mmcgraithg@theatlantic.com','rYj6ZuXi5'),(18,'Greenman','Méthode','pizzaiolo',3,'9817756409','fgreenmanh@soup.io','yOPJlkpu'),(19,'Beedham','Anaé','pizzaiolo',3,'3327889272','bbeedhami@slate.com','0OIxY5w'),(20,'Zorzin','Aimée','livreur',4,'2052921814','pzorzinj@domainmarket.com','VjHIZcRFTF7s'),(21,'Rubert','Célestine','livreur',4,'6499607611','grubertk@gizmodo.com','PjESG5'),(22,'Kupke','Léone','livreur',4,'1592705162','nkupkel@cdbaby.com','xj9pwWb'),(23,'Gillet','Danièle','livreur',4,'8915344891','rgilletm@yahoo.com','qDH2n6UUOq'),(24,'Seager','Björn','livreur',4,'9473585787','lseagern@networksolutions.com','Gkmi16U22bL'),(25,'Ellery','Mélissandre','livreur',4,'4341819206','eelleryo@smugmug.com','gGKw73vv'),(26,'Izzett','Céline','livreur',4,'8249075960','mizzettp@yandex.ru','3OnF6Dk'),(27,'Upham','Mahélie','livreur',4,'6415962015','muphamq@princeton.edu','rYffyUQfYicr'),(28,'Pleavin','Jú','livreur',4,'1519505517','gpleavinr@ftc.gov','06RR6AekQ9M'),(29,'Cady','Åsa','livreur',4,'6401542551','vcadys@goo.ne.jp','p0Nbvf'),(30,'Alexandersson','Monty','livreur',4,'1627686214','ealexanderssont@xinhuanet.com','K6TXRp'),(31,'OCPizza','Franck','direction',0,'1627686214','ealexanderssont@xinhuanet.com','K6TXRp'),(32,'OCPizza','Lola','direction',0,'1627686214','ealexanderssont@xinhuanet.com','K6TXRp');
/*!40000 ALTER TABLE `mb_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mouvement_stock`
--

DROP TABLE IF EXISTS `mouvement_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mouvement_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pizzeria_id` int(11) NOT NULL,
  `quantite` decimal(10,0) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ingredient_mouvement_stock_fk` (`ingredient_id`),
  KEY `restaurant_mouvement_stock_fk` (`pizzeria_id`),
  CONSTRAINT `ingredient_mouvement_stock_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `restaurant_mouvement_stock_fk` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mouvement_stock`
--

LOCK TABLES `mouvement_stock` WRITE;
/*!40000 ALTER TABLE `mouvement_stock` DISABLE KEYS */;
INSERT INTO `mouvement_stock` VALUES (1,4,69,1),(2,10,12,2),(3,1,74,3),(4,6,68,4),(5,1,49,5),(6,8,20,6),(7,2,58,7),(8,2,46,8),(9,4,4,9),(10,10,47,10),(11,2,16,11),(12,1,94,12),(13,9,86,13),(14,5,3,14),(15,10,66,15),(16,3,76,16),(17,4,78,17),(18,8,77,18),(19,4,22,19),(20,1,90,20),(21,4,59,21),(22,6,26,22),(23,3,66,23),(24,9,38,24),(25,10,83,25),(26,3,43,26),(27,3,54,27),(28,10,31,28),(29,9,100,29),(30,4,6,30);
/*!40000 ALTER TABLE `mouvement_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niv_autorisation`
--

DROP TABLE IF EXISTS `niv_autorisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niv_autorisation` (
  `id` int(11) NOT NULL DEFAULT '4',
  `nom` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niv_autorisation`
--

LOCK TABLES `niv_autorisation` WRITE;
/*!40000 ALTER TABLE `niv_autorisation` DISABLE KEYS */;
INSERT INTO `niv_autorisation` VALUES (0,'direction'),(1,'manager'),(2,'serveur'),(3,'pizzaiolo'),(4,'livreur');
/*!40000 ALTER TABLE `niv_autorisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzeria`
--

DROP TABLE IF EXISTS `pizzeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `tel` char(20) NOT NULL,
  `num_voie` int(11) DEFAULT NULL,
  `voie` varchar(250) NOT NULL,
  `complement_adresse` varchar(250) DEFAULT NULL,
  `commentaire` text,
  `code_postal` int(11) NOT NULL,
  `commune` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzeria`
--

LOCK TABLES `pizzeria` WRITE;
/*!40000 ALTER TABLE `pizzeria` DISABLE KEYS */;
INSERT INTO `pizzeria` VALUES (1,'Pizzaioletta','4586333114',85305,'Green Ridge',NULL,NULL,44094,'Nantes'),(2,'Pizzivore','6971183761',88754,'Harper',NULL,NULL,44265,'Nantes'),(3,'Plateau télé','6447463336',2240,'Dixon',NULL,NULL,92622,'Gennevilliers'),(4,'La pizza c\'est la vie','4973071518',2523,'Monica',NULL,NULL,94434,'Chennevières-sur-Marne'),(5,'En bonne compagnie','2423445357',7042,'Pleasure',NULL,NULL,75326,'Paris 07'),(6,'C\'est pas d\'la tarte','6451900674',646,'Swallow',NULL,NULL,72080,'Le Mans'),(7,'Des pizzas et des rêves','9335401787',2,'Corben',NULL,NULL,7404,'Le Teil'),(8,'OCPizza Hôtel de ville','9211101829',69,'Service',NULL,NULL,31709,'Blagnac'),(9,'Ô qu\'c\'est bon','5074689872',8,'Spohn','Île-de-France','nullam varius nulla facilisi cras non velit nec',91129,'Palaiseau'),(10,'Castafiore','7929277002',62915,'Melody',NULL,NULL,26504,'Bourg-lès-Valence');
/*!40000 ALTER TABLE `pizzeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prix_unitaire_HT` decimal(7,3) DEFAULT NULL,
  `taux_TVA_100` decimal(3,1) DEFAULT '5.5',
  `type_produit` varchar(150) NOT NULL DEFAULT 'Revente',
  `categorie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorie_produit_produit_fk` (`categorie_id`),
  CONSTRAINT `categorie_produit_produit_fk` FOREIGN KEY (`categorie_id`) REFERENCES `categorie_produit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'MARGARITA',8.057,5.5,'Transformé',1),(2,'NAPOLITAINE',8.246,5.5,'Transformé',1),(3,'SICILIENNE',8.530,5.5,'Transformé',1),(4,'4 SAISONS',9.005,5.5,'Transformé',1),(5,'PAYSANNE',9.005,5.5,'Transformé',1),(6,'ITALIENNE',9.194,5.5,'Transformé',1),(7,'MARGUERITE EPAULE',9.194,5.5,'Transformé',1),(8,'NEPTUNE',10.137,5.5,'Transformé',1),(9,'ESPAGNOLE',10.289,5.5,'Transformé',1),(10,'CANTAL',9.573,5.5,'Transformé',1),(11,'REINE',9.763,5.5,'Transformé',1),(12,'SALADE MOZZARELLA',6.825,5.5,'Transformé',4),(13,'SALADE CHEF',6.825,5.5,'Transformé',4),(14,'SALADE PASTA',6.825,5.5,'Transformé',4),(15,'SALADE VERTE',2.180,5.5,'Transformé',4),(16,'LASAGNE',6.825,5.5,'Transformé',2),(17,'PENNE CARBONARA',6.825,5.5,'Transformé',2),(18,'EAU MINÉRALE',1.137,5.5,'Revente',5),(19,'COCA 33CL',1.706,5.5,'Revente',5),(20,'FANTA 33CL',1.706,5.5,'Revente',5),(21,'NESTEA PECHE 33CL',1.706,5.5,'Revente',5),(22,'FONDANT AU CHOCOLAT',2.280,5.5,'Revente',6),(23,'GLACE  CHOCOLAT 100ML',2.843,5.5,'Revente',6),(24,'supplément cantal',1.137,5.5,'Suppléments',7),(25,'supplément chorizo',1.137,5.5,'Suppléments',7),(26,'supplément anchois',1.137,5.5,'Suppléments',7),(27,'supplément Artichauts',1.137,5.5,'Suppléments',7),(28,'supplément Mozzarella',1.137,5.5,'Suppléments',7),(29,'supplément jambon',1.896,5.5,'Suppléments',7),(30,'supplément oeuf',1.137,5.5,'Suppléments',7);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_actuel`
--

DROP TABLE IF EXISTS `stock_actuel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_actuel` (
  `ingredient_id` int(11) NOT NULL,
  `pizzeria_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `quantite_alerte` int(11) DEFAULT NULL,
  `alerte` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`,`pizzeria_id`),
  KEY `restaurant_stock_actuel_fk` (`pizzeria_id`),
  CONSTRAINT `ingredient_stock_actuel_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `restaurant_stock_actuel_fk` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_actuel`
--

LOCK TABLES `stock_actuel` WRITE;
/*!40000 ALTER TABLE `stock_actuel` DISABLE KEYS */;
INSERT INTO `stock_actuel` VALUES (1,1,129,83,0),(1,2,32,18,0),(1,3,110,44,0),(1,4,465,281,0),(1,5,261,120,0),(1,6,425,415,0),(1,7,443,107,0),(1,8,28,251,1),(1,9,23,258,1),(1,10,372,35,0),(2,1,51,253,1),(2,2,72,350,1),(2,3,279,187,0),(2,4,310,108,0),(2,5,207,207,1),(2,6,45,492,1),(2,7,445,500,1),(2,8,451,167,0),(2,9,479,249,0),(2,10,475,239,0),(3,1,364,444,1),(3,2,463,387,0),(3,3,74,132,1),(3,4,258,471,1),(3,5,73,35,0),(3,6,185,214,1),(3,7,446,483,1),(3,8,124,349,1),(3,9,67,246,1),(3,10,246,353,1),(4,1,243,302,1),(4,2,19,96,1),(4,3,50,217,1),(4,4,103,425,1),(4,5,202,401,1),(4,6,210,95,0),(4,7,63,27,0),(4,8,405,327,0),(4,9,195,413,1),(4,10,181,369,1),(5,1,86,200,1),(5,2,344,71,0),(5,3,248,358,1),(5,4,113,417,1),(5,5,482,303,0),(5,6,108,268,1),(5,7,144,466,1),(5,8,161,30,0),(5,9,40,46,1),(5,10,331,113,0),(6,1,273,93,0),(6,2,290,183,0),(6,3,273,223,0),(6,4,26,56,1),(6,5,455,156,0),(6,6,319,91,0),(6,7,82,50,0),(6,8,469,360,0),(6,9,495,489,0),(6,10,6,470,1),(7,1,125,458,1),(7,2,185,464,1),(7,3,423,361,0),(7,4,354,315,0),(7,5,498,16,0),(7,6,34,213,1),(7,7,318,495,1),(7,8,213,384,1),(7,9,135,218,1),(7,10,77,485,1),(8,1,453,491,1),(8,2,419,434,1),(8,3,335,52,0),(8,4,459,316,0),(8,5,499,329,0),(8,6,404,401,0),(8,7,362,241,0),(8,8,105,402,1),(8,9,323,496,1),(8,10,138,138,1),(9,1,319,311,0),(9,2,104,386,1),(9,3,477,92,0),(9,4,224,184,0),(9,5,412,274,0),(9,6,252,90,0),(9,7,61,132,1),(9,8,345,219,0),(9,9,404,192,0),(9,10,337,90,0),(10,1,487,14,0),(10,2,107,67,0),(10,3,235,135,0),(10,4,307,127,0),(10,5,114,324,1),(10,6,382,289,0),(10,7,328,384,1),(10,8,281,135,0),(10,9,185,57,0),(10,10,232,65,0),(11,1,449,63,0),(11,2,178,492,1),(11,3,334,303,0),(11,4,486,44,0),(11,5,289,158,0),(11,6,289,454,1),(11,7,92,38,0),(11,8,59,419,1),(11,9,298,479,1),(11,10,300,280,0),(12,1,142,472,1),(12,2,356,123,0),(12,3,271,474,1),(12,4,405,152,0),(12,5,431,377,0),(12,6,58,265,1),(12,7,261,34,0),(12,8,195,395,1),(12,9,87,311,1),(12,10,99,303,1),(13,1,167,100,0),(13,2,29,396,1),(13,3,350,161,0),(13,4,491,25,0),(13,5,74,365,1),(13,6,214,19,0),(13,7,137,144,1),(13,8,56,169,1),(13,9,155,77,0),(13,10,145,225,1),(14,1,371,55,0),(14,2,424,203,0),(14,3,107,111,1),(14,4,14,278,1),(14,5,87,295,1),(14,6,99,55,0),(14,7,190,208,1),(14,8,401,250,0),(14,9,124,414,1),(14,10,373,231,0),(15,1,151,290,1),(15,2,72,93,1),(15,3,108,240,1),(15,4,266,321,1),(15,5,463,445,0),(15,6,49,99,1),(15,7,364,74,0),(15,8,361,256,0),(15,9,486,482,0),(15,10,241,406,1),(16,1,426,471,1),(16,2,161,339,1),(16,3,58,156,1),(16,4,97,174,1),(16,5,171,321,1),(16,6,466,228,0),(16,7,56,424,1),(16,8,26,254,1),(16,9,303,115,0),(16,10,19,352,1),(17,1,246,498,1),(17,2,176,130,0),(17,3,462,62,0),(17,4,43,97,1),(17,5,114,182,1),(17,6,81,127,1),(17,7,81,203,1),(17,8,461,463,1),(17,9,328,368,1),(17,10,154,45,0),(18,1,333,301,0),(18,2,136,249,1),(18,3,253,156,0),(18,4,103,434,1),(18,5,485,123,0),(18,6,283,393,1),(18,7,334,341,1),(18,8,161,259,1),(18,9,190,268,1),(18,10,179,480,1),(19,1,55,407,1),(19,2,301,129,0),(19,3,218,451,1),(19,4,340,47,0),(19,5,279,6,0),(19,6,301,23,0),(19,7,62,73,1),(19,8,287,214,0),(19,9,162,421,1),(19,10,385,318,0),(20,1,401,359,0),(20,2,23,261,1),(20,3,286,153,0),(20,4,411,118,0),(20,5,312,16,0),(20,6,192,369,1),(20,7,278,410,1),(20,8,371,389,1),(20,9,423,168,0),(20,10,284,315,1),(21,1,97,200,1),(21,2,216,142,0),(21,3,388,352,0),(21,4,93,480,1),(21,5,298,130,0),(21,6,331,338,1),(21,7,169,495,1),(21,8,389,184,0),(21,9,307,256,0),(21,10,338,100,0),(22,1,242,232,0),(22,2,62,325,1),(22,3,329,111,0),(22,4,345,40,0),(22,5,183,127,0),(22,6,65,192,1),(22,7,98,311,1),(22,8,178,434,1),(22,9,337,195,0),(22,10,263,347,1),(23,1,54,384,1),(23,2,498,393,0),(23,3,204,132,0),(23,4,212,442,1),(23,5,49,166,1),(23,6,39,428,1),(23,7,311,147,0),(23,8,348,298,0),(23,9,270,441,1),(23,10,24,354,1),(24,1,140,358,1),(24,2,188,395,1),(24,3,340,142,0),(24,4,281,489,1),(24,5,122,270,1),(24,6,85,210,1),(24,7,327,255,0),(24,8,16,39,1),(24,9,467,170,0),(24,10,312,342,1),(25,1,414,254,0),(25,2,166,396,1),(25,3,224,54,0),(25,4,271,94,0),(25,5,460,21,0),(25,6,260,163,0),(25,7,143,265,1),(25,8,255,471,1),(25,9,137,40,0),(25,10,416,462,1),(26,1,70,107,1),(26,2,398,56,0),(26,3,91,144,1),(26,4,11,195,1),(26,5,261,301,1),(26,6,147,140,0),(26,7,206,411,1),(26,8,107,273,1),(26,9,448,424,0),(26,10,157,149,0),(27,1,218,268,1),(27,2,80,357,1),(27,3,105,406,1),(27,4,361,31,0),(27,5,304,8,0),(27,6,224,358,1),(27,7,106,465,1),(27,8,82,340,1),(27,9,485,141,0),(27,10,489,365,0),(28,1,476,366,0),(28,2,169,176,1),(28,3,301,180,0),(28,4,3,484,1),(28,5,498,402,0),(28,6,41,340,1),(28,7,483,65,0),(28,8,491,387,0),(28,9,126,324,1),(28,10,435,139,0),(29,1,38,192,1),(29,2,180,346,1),(29,3,426,309,0),(29,4,157,79,0),(29,5,339,407,1),(29,6,461,142,0),(29,7,46,22,0),(29,8,16,251,1),(29,9,21,55,1),(29,10,426,221,0),(30,1,0,297,0),(30,2,118,247,1),(30,3,78,67,0),(30,4,325,82,0),(30,5,66,320,1),(30,6,407,367,0),(30,7,438,287,0),(30,8,468,78,0),(30,9,347,482,1),(30,10,283,36,0);
/*!40000 ALTER TABLE `stock_actuel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-25 10:37:56
