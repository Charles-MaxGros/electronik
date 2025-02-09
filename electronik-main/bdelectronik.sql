-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: electronik
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categorie` (
  `id_categorie` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'ordinateurs'),(2,'tablettes'),(3,'televiseurs'),(4,'auto_tech'),(5,'smartphones'),(6,'audios'),(7,'electromenagers'),(8,'cameras');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commande` (
  `id_commande` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_commande` date NOT NULL,
  `montant` double NOT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `sku` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `commande_FK` (`id_client`),
  KEY `commande_FK_1` (`sku`),
  CONSTRAINT `commande_FK` FOREIGN KEY (`id_client`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commande_FK_1` FOREIGN KEY (`sku`) REFERENCES `produit` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `favorite` (
  `id_favorite` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` bigint(20) unsigned NOT NULL,
  `sku` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_favorite`),
  KEY `favorite_FK` (`id_client`),
  KEY `favorite_FK_1` (`sku`),
  CONSTRAINT `favorite_FK` FOREIGN KEY (`id_client`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_FK_1` FOREIGN KEY (`sku`) REFERENCES `produit` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produit` (
  `sku` bigint(20) unsigned NOT NULL DEFAULT 0,
  `nom_produit` varchar(200) NOT NULL,
  `desc_produit` varchar(1000) NOT NULL,
  `prix` double NOT NULL,
  `id_categorie` tinyint(3) unsigned NOT NULL,
  `url_image1_produit` varchar(1000) NOT NULL,
  `url_image2_produit` varchar(1000) NOT NULL,
  `url_image3_produit` varchar(1000) DEFAULT NULL,
  `url_image4_produit` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`sku`),
  KEY `produit_FK` (`id_categorie`),
  CONSTRAINT `produit_FK` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1000,'Portable de jeu 15,6 po Nitro R7 d\'Acer - Noir (Ryzen R76800H d\'AMD/SSD 1 To/RAM 16 Go/RTX 3070 Ti/Windows 11)','Ayez beau jeu avec le portable de jeu Nitro R7 d\'Acer. Il est doté d\'un processeur Ryzen d\'AMD avec carte graphique RTX Ti de NVIDIA qui prend en charge les jeux et les tâches de création multimédia avec facilité. Son écran DEL QHD de 15,6 po offre 165 ips pour afficher des scènes d\'action fluides et cristallines durant les combats les plus intenses. Ce portable comprend aussi un disque SSD de 1 To très rapide et sécuritaire.',1500.39,1,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16693/16693216.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16693/16693216_5.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16693/16693216_4.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16693/16693216_3.jpg'),(1001,'Boîte ouverte - Portable de jeu de 15,6 po TUF A15 d\'ASUS (Ryzen 7 5800H d\'AMD/SSD 512 Go/RAM 16 Go/GeForce RTX 3060) - Anglais','Produit boîte ouverte certifié Geek Squad. Détails ci-dessous.\r\n\r\nSoyez productif plus facilement, surtout durant vos déplacements, avec le portable à écran tactile ZenBook Flip d\'Asus. Doté d\'un processeur Ryzen 7 5800H d\'AMD et d\'une mémoire vive de 16 Go, il offre une performance impressionnante pour vos tâches comme la navigation, la productivité, le divertissement et plus encore. Le design mince et léger facilite le transport.',1100.39,1,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/164/16488/16488740.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/164/16488/16488740.jpg',NULL,NULL),(1002,'Portable 2-en-1 écran tactile 2,2K 14 po Yoga 7i de Lenovo - Gris (Core i5-1235U d\'Intel/SSD 512Go/RAM 16 Go/Windows 11)','Vous êtes toujours prêt à offrir le meilleur de vous-même grâce au portable 2-en-1 à écran tactile de 14 po Yoga 7i de Lenovo. Doté d\'un processeur Core i5-1235U d\'Intel, d\'une mémoire vive de 16 Go et d\'un disque SSD de 512 Go, il offre une performance constante pour répondre à tous vos besoins créatifs. Le modèle convertible avec charnière à 360 degrés permet une transition fluide entre les modes tablette et portable pour offrir une double dose de productivité.',1500.39,1,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/162/16204/16204911.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/162/16204/16204911_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/162/16204/16204911_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/162/16204/16204911_4.jpg'),(1003,'Refurbished (Excellent) - Microsoft Surface Laptop Go 12.4\" Multi-Touch - Intel Core i5, 8GB RAM, 128GB SSD, Windows 10 Home in S Mode - Platinum - Certified Refurbished','Il s’agit d’un produit remis à neuf. Une garantie minimale de90 jours est incluse.',899,1,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15758/15758822.jpeg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15758/15758822_1.jpeg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15758/15758822_3.jpeg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15758/15758822_5.jpeg'),(2000,'iPad 10,2 po 64 Go avec Wi-Fi d\'Apple (9e génération) d\'Apple - Gris cosmique','L\'iPad d\'Apple combine un magnifique écran Retina de 10,2 po avec une capacité incroyable, une polyvalence inégalée et une grande convivialité. Avec sa puissante puce A13 Bionic, une caméra avant ultralarge avec Center Stage, la prise en charge du stylet Apple Pencil et les capacités incroyables du système iPadOS 15, vous adorerez cet iPad.',450.39,2,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15733/15733042.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15733/15733042_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15733/15733042_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15733/15733042_3.jpg'),(2001,'iPad Pro de 12,9 po et de 128 Go d\'Apple avec Wi-Fi (6e génération) - Gris cosmique','L\'iPad Pro d\'Apple vous offre la meilleure expérience iPad. Doté d\'une puissante puce M2 d\'Apple et d\'un écran Liquid Retina de 12,9 po, il offre une performance incroyable, des écrans incroyablement évolués et une connectivité sans fil ultrarapide. De nouvelles fonctions puissantes sont offertes avec iPadOS 16.',1500.39,2,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/165/16567/16567275.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/165/16567/16567275_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/165/16567/16567275_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/165/16567/16567275_3.jpg'),(2002,'Galaxy Tab A8 10,5 po 32 Go Android de Samsung à processeur octocoeur Unisoc 618 - Gris','Peu importe où vous allez, restez diverti et productif avec la tablette Galaxy Tab A8 de Samsung. Dotée d\'un écran de 10,5 po, elle offre une vue complète de vos vidéos, sites Web, applications et plus encore. Elle a une mémoire spacieuse intégrée de 32 Go, extensible à l\'aide d\'une carte microSD (vendue séparément).',2500.39,2,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/159/15917/15917162.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/159/15917/15917162_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/159/15917/15917162_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/159/15917/15917162_3.jpg'),(2003,'Tablette 10,1 po 32 Go Android 10 Q (2e gén.) Tab M10 HD de Lenovo à processeur octocoeur Helio P22T de MediaTek - Gris fer','Dotée d\'un écran HD de 10 po éclatant avec processeur Helio de MediaTek, la tablette Tab M10 de Lenovo est idéale pour le divertissement. Elle est équipée de caméras avant et arrière qui prennent des photos cristallines pour les égoportraits et les vidéos. Cette tablette est dotée de fonctions familiales, dont une protection oculaire TUV, du contenu éducatif pour les enfants et des contrôles parentaux.',150,2,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16685/16685845.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16685/16685845_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16685/16685845_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16685/16685845_5.jpg'),(3000,'Téléviseur intelligent Google HDR DEL UHD 4K de 85 po BRAVIA de Sony (XR85X90K) - 2022','Profitez d\'une expérience cinématographique incroyable à la maison avec ce puissant téléviseur intelligent BRAVIA de 65 po de Sony. Doté d\'une résolution Ultra HD 4K impressionnante et de technologies d\'amélioration des couleurs, il rend votre expérience de visionnement plus vraie que nature. Le système d\'exploitation Google TV permet d\'accéder rapidement à votre assistant vocal et de diffuser du contenu quasiment illimité.',2713.74,3,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16006/16006298.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16006/16006298_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16006/16006298_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16006/16006298_3.jpg'),(3001,'Téléviseur intelligent webOS HDR QNED UHD 4K de 86 po de LG (86QNED85UQA) - 2022 - Argenté titane foncé/Bleu cendré','Plongez dans les images de qualité supérieure offertes par le téléviseur intelligent UHD 4K de 86 po de LG. Doté du processeur 4K a7 AI de 5e génération avec technologie révolutionnaire Quantum Dot NanoCell Colour, il vous en mettra plein la vue avec les images nettes et raffinées de sa résolution UHD. Ce téléviseur intelligent comprend de nombreuses applications de diffusion en continu pour vous divertir facilement.',3313.74,3,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16157/16157503.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16157/16157503_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16157/16157503_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16157/16157503_4.jpg'),(3002,'Téléviseur intelligent webOS Evo ThinQ AI HDR DELO UHD 4K de 83 po de LG (OLED83C2PUA) - 2022 - Argenté titane foncé','Obtenez l\'espace de divertissement dont vous avez toujours rêvé avec le téléviseur intelligent DELO 4K Evo ThinQ AI de 83 po de LG. Optimisé par le processeur 4K a9 AI de 5e génération, ce téléviseur intelligent est doté d\'un écran de 83 po à cadre mince, pour des images spectaculaires aux noirs parfaits, des angles de visionnement larges et des mouvements impressionnants. Conçu pour le visionnement cinématographique et les jeux, il vous offre une expérience de divertissement complète.',6013.74,3,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16157/16157493.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16157/16157493_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16157/16157493_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16157/16157493_4.jpg'),(3003,'Téléviseur intelligent Tizen HDR QLED UHD 4K de 85 po de Samsung (QN85Q60BAFXZC) - Gris titan','Profitez d\'une qualité d\'image claire et nette avec ce téléviseur intelligent de 85 po de Samsung. L\'écran UHD 4K est amélioré par la technologie QLED, ce qui vous permet de jouer à des jeux, de regarder des films et plus encore avec une performance sans décalage et des couleurs éclatantes. Il offre également des améliorations audio ambiophoniques pour une expérience d\'écoute plus immersive et des capacités de connexion sans fil.',2813.74,3,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16009/16009713.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16009/16009713_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16009/16009713_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16009/16009713_5.jpg'),(4000,'GPS de 6,95 po DriveSmart 65 et trafic de Garmin\r\n','Conduire peut être plus simple et sécuritaire avec le GPS DriveSmart de Garmin. Il est doté d\'un écran tactile haute résolution de 6,95 po avec des menus clairs, des cartes détaillées et des instructions vocales facilitant les déplacements. De plus, le service info-trafic inclus de Garmin vous envoie des alertes et des suggestions d\'itinéraire alternatives pour vous aider à éviter les embouteillages.',322.49,4,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/139/13985/13985656.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/139/13985/13985656_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/139/13985/13985656_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/139/13985/13985656_3.jpg'),(4001,'Alarme de sports motorisés 3121V de Viper pour moto et VTT','Sentez-vous en sécurité avec l’alarme de sports motorisés 3121V de Viper pour moto et VTT',152.49,4,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/126/12652/12652292.png','https://multimedia.bbycastatic.ca/multimedia/products/500x500/126/12652/12652292_1.jpg',NULL,NULL),(4002,'Caméra de tableau de bord HD intégrale 1080p F200 Pro de Thinkware avec Wi-Fi - Exclusivité BBY','Vos yeux ne seront plus seuls à surveiller la route grâce à la caméra de tableau de bord F200 PRO de Thinkware. Elle est dotée de fonctions telles que le Wi-Fi et un mode de stationnement poussé, mais il reste mince et discret. Vous pouvez facilement le synchroniser avec un téléphone intelligent grâce à l\'application téléchargeable et obtenir des notifications ou visionner le flux vidéo sur la route.',261.99,4,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/153/15325/15325324.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/153/15325/15325324_4.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/153/15325/15325324_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/153/15325/15325324_5.jpg'),(4003,'KAPPA 90CSX 6 po x 9 po à composants audio pour l’auto avec filtre passif à bascule','Les haut-parleurs Kappa d’Infinity sont une nouvelle norme en matière d’audio pour l’auto. Nos haut-parleurs de graves brevetés plus One™ produisent des basses puissantes et une puissance de sortie élevée, détaillées et musicales. Les haut-parleurs d’aigus à dôme en tissu Edge avec bobines acoustiques surdimensionnées produisent des aigus fluides avec une meilleure gestion de la puissance thermique pour les amateurs de volume élevé.',579.99,4,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16162/16162386.jpeg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16162/16162386_2.jpeg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16162/16162386_3.jpeg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/161/16162/16162386_4.png'),(5000,'iPhone 13 de 128 Go d\'Apple offert par TELUS - Rose -','Démarquez-vous et démontrez vos superpouvoirs avec l\'iPhone 13. Doté de la puce A15 Bionic, de la technologie 5G ultra rapide pour télécharger et diffuser des images, d\'un écran Super Retina XDR de 6,1 po et du matériau Ceramic Shield résistant aux chutes. Autres caractéristiques : Enregistrement en 4K HDR Dolby Vision, système avancé à deux caméras avec mode nuit, une autonomie extraordinaire et bien plus encore.',899,5,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15727/15727045.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15727/15727045_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15727/15727045_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/157/15727/15727045_4.jpg'),(5001,'iPhone 14 Pro Max de 128 Go d\'Apple offert par Freedom Mobile - Violet sombre','Vivez l\'expérience iPhone d\'une toute nouvelle façon grâce à l\'iPhone 14 Pro Max. Ayez l\'esprit tranquille grâce aux fonctions d\'urgence révolutionnaires qui vous gardent en sécurité et qui saisissent des détails incroyables en images et en vidéos avec la caméra principale de 48 Mpx. Les fonctions d\'écran AOD et de Dynamic Island vous aident à interagir avec votre téléphone plus intuitivement qu\'avant.',1499,5,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/164/16482/16482195.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/164/16482/16482195_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/164/16482/16482195_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/164/16482/16482195_4.jpg'),(5002,'Galaxy S23+ (Plus) de 256 Go de Samsung avec TELUS - Crème','Partagez du contenu épique avec le Galaxy S23+ (Plus) de Samsung. Avec une caméra haute résolution de 50 Mpx et un mode nocturne impressionnant optimisé par Nightography, les moments ordinaires deviendront extraordinaires en un clic, peu importe l\'éclairage. Son écran adaptatif, conjointement avec un traitement rapide et une autonomie puissante, vous permet de voir votre contenu avec des détails riches à tout moment de la journée.',1099,5,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16667/16667226.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16667/16667226_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16667/16667226_4.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/166/16667/16667226_7.jpg'),(5003,'Pixel 7 Pro de 128 Go de Google offert par Bell - Noir volcanique','Le Pixel 7 Pro de Google offre tout ce qu\'il y a de mieux dans un téléphone. Alimenté par le processeur Tensor G2 de Google, il est rapide et sécuritaire avec un grand écran et une autonomie incroyable. Il est doté d\'un système de caméras de niveau professionnel qui inclut un téléobjectif et des fonctions avancées comme la mise au point macro. De plus, grâce aux fonctions de sécurité de nouvelle génération et au RPV intégré, il aide à protéger vos données personnelles.',899,5,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/164/16497/16497812.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/164/16497/16497812_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/164/16497/16497812_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/164/16497/16497812_5.jpg'),(6000,'Haut-parleur Home Speaker 500 sans fil multipièce de Bose avec commande vocale intégrée','Le haut-parleur Home Speaker 500 de Bose offre un son stéréo mur à mur, à partir d\'un seul haut-parleur. Les commandes vocales intégrées de l\'Assistant Google et d\'Alexa d\'Amazon vous permettent d\'écouter facilement des millions de chansons, de listes de lecture, etc. Contrôlez la musique à votre façon : avec votre voix, d\'un toucher sur les commandes du dessus, ou avec l\'application.',482.49,6,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/129/12907/12907056.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/129/12907/12907056_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/129/12907/12907056_4.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/129/12907/12907056_5.jpg'),(6001,'Haut-parleur sans fil Bluetooth Roam de Sonos avec assistant Google et Alexa d\'Amazon','Profitez d\'un son exceptionnel partout avec le haut-parleur sans fil Bluetooth Roam de Sonos. Avec son Wi-Fi et Bluetooth, il se jumelle à votre téléphone intelligent, diffuse de la musique et plus encore pendant 10 heures avec une seule charge. Utilisez l\'application Sonos, Alexa d\'Amazon, l\'Assistant Google ou AirPlay 2 d\'Apple pour contrôler le son et créer un système dans la maison avec plusieurs haut-parleurs de Sonos (vendus séparément).',232.49,6,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/153/15324/15324271.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/153/15324/15324271_9.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/153/15324/15324271_6.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/153/15324/15324271_12.jpg'),(6002,'Casque d\'écoute Bluetooth à isolation sonore Solo3 Icon de Beats by Dr. Dre','Ne vous contentez pas d\'écouter; ressentez vos chansons avec le casque d\'écoute Bluetooth Solo3 de Beats by Dr. Dre. Les oreillettes douces et coussinées réduisent la tension en plus d\'amortir les bruits externes pour une écoute sans interruption. La technologie Fast Fuel offre une autonomie de jusqu\'à 3 heures après un chargement de seulement 5 minutes.',220.59,6,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/143/14363/14363856.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/143/14363/14363856_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/143/14363/14363856_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/143/14363/14363856_5.jpg'),(6003,'Écouteurs Bluetooth à conduction osseuse OpenRun de Shokz','D\'allure sportive, élégants et novateurs, les écouteurs OpenRun de Shokz sont dotés de la connectivité Bluetooth pour une liberté sans fil, et d\'une technologie de conduction osseuse pour offrir un son incroyable sans couvrir vos oreilles. Ils sont légers et confortables, et sont dotés de la cote d\'étanchéité IP67 pour résister à la pluie, à la neige et à la sueur lors de vos entraînements les plus intenses.',170.59,6,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/159/15954/15954868.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/159/15954/15954868_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/159/15954/15954868_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/159/15954/15954868_3.jpg'),(7000,'Réfrigérateur cong. inf. 18,6 pi³ 30 po; Cuisinière gaz; Lave-vaisselle d\'Insignia; Batterie - Inox','Transformez votre cuisine en un clin d\'oeil avec cet ensemble de gros électroménagers d\'Insignia. Vous obtenez une cuisinière à gaz encastrable à 5 brûleurs avec friture à air chaud de 4,8 pi³ de 30 po d\'Insignia, un réfrigérateur à congélateur inférieur de 18,6 pi³ de 30 po, un lave-vaisselle encastrable de 24 po de 51 dB avec cuve en acier inoxydable et une batterie de cuisine de 10 pièces Nouvelle de Meyer.',2512.99,7,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/b00/b0016/b0016960.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/b00/b0016/b0016960.jpg',NULL,NULL),(7001,'Four à micro-ondes à hotte intégrée de Samsung - 1,9 pi³ - Acier inoxydable','Faites cuire des repas délicieux plus vite grâce à ce four à micro-ondes à hotte intégrée de 1,9 pi³ de Samsung. Avec une élégante porte en verre de style moniteur panoramique, ce four à micro-ondes a l\'air fantastique dans n\'importe quelle cuisine. Il utilise une technologie de cuisson par capteur unique pour chauffer chaque plat avec la durée parfaite pour que vous puissiez manger rapidement.',379.99,7,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/138/13801/13801361.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/138/13801/13801361_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/138/13801/13801361_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/138/13801/13801361_3.jpg'),(7002,'Machine à espresso automatique 2200 de Philips avec moussoir à lait LatteGo - Noir','Commencez votre journée avec un bon café au goût authentique et aux arômes rafraîchissants avec la machine à expresso automatique 2200 de Philips. Son écran tactile intuitif vous permet de choisir parmi 3 options : expresso, café et cappucino, ainsi qu\'une option d\'eau chaude. Le moussoir à lait LatteGo produit un lait velouté et peut être nettoyé en 15 secondes.',899.99,7,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/148/14801/14801579.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/148/14801/14801579_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/148/14801/14801579_2.jpg',NULL),(7003,'Raclette-gril classique de Swissmar','Honorez la tradition suisse le temps d\'un repas avec cette raclette-gril classique pour 8 personnes. Faites cuire des légumes, des viandes ou des crêpes sur la surface antiadhésive en fonte pendant que de délicieux fromages fondent sur les coupelles au-dessous. Cet appareil de cuisine amusant et polyvalent permettra à chacun de laisser aller sa créativité culinaire.',195.99,7,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/103/10372/10372547.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/103/10372/10372547.jpg',NULL,NULL),(8000,'Appareil photo numérique PowerShot G7 X Mark III Wi-Fi 20,1 Mpx et zoom optique 4,2x de Canon - Noir','Laissez libre cours à votre créativité simplement en appuyant sur l\'obturateur du PowerShot G7 X MARK III compact de Canon. Doté de fonctions intéressantes conçues pour les utilisateurs modernes, comme l\'enregistrement vidéo vertical et la diffusion en direct, sans oublier la qualité d\'image légendaire de Canon, cet appareil photo offre de meilleures capacités photographiques d\'un téléphone intelligent.',1000.59,8,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/137/13799/13799023.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/137/13799/13799023_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/137/13799/13799023_4.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/137/13799/13799023_5.jpg'),(8001,'Drone quadricoptère Mini 3 Pro de DJI avec caméra et manette intelligente','Revivez vos aventures en plein air en tout temps avec le drone quadricoptère Mini 3 Pro de DJI. Il est équipé d\'une caméra HDR 4K et d\'un cardan mécanique à trois axes pour des photos et vidéos détaillées et stables à une hauteur maximale de 4000 m. Ce drone léger offre un temps de vol impressionnant de 34 minutes et inclut une manette intelligente pour une utilisation facile.',1250.05,8,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16081/16081121_1.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16081/16081121.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16081/16081121_3.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16081/16081121_6.jpg'),(8002,'Caméra 5,3K FY23 étanche pour sports et casque GoPro HERO10 Black','Immortalisez des aventures amusantes et époustouflantes avec la caméra HERO10 de GoPro. Cette caméra pour sports et casque est dotée d\'un capteur CMOS de 23 Mpx et d\'une résolution de 15,8 Mpx GP2 pouvant filmer des vidéos fantastiques en 5K. Elle est également dotée d\'un écran tactile ACL de 2,27 po pour un visionnement en direct et un réglage pratique des paramètres.',520.59,8,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16009/16009646.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16009/16009646_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16009/16009646_4.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/160/16009/16009646_7.jpg'),(8003,'Appareil photo instantané Instax Mini 40 de Fujifilm','Immortalisez des moments précieux durant vos déplacements avec l\'appareil photo instantané Instax Mini 40 de Fujifilm. Cet appareil photo compact produit des images époustouflantes de la taille d\'une carte de crédit avec une netteté et une précision des couleurs incroyables. Vous pouvez même utiliser l\'objectif à égoportrait à une touche et le miroir pour cadrer parfaitement vos portraits avec l\'exposition automatique pour des impressions de grande qualité.',130.59,8,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/163/16391/16391304.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/163/16391/16391304_2.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/163/16391/16391304_6.jpg','https://multimedia.bbycastatic.ca/multimedia/products/500x500/163/16391/16391304_5.jpg');
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id_user` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nom_complet` varchar(300) NOT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `couriel` varchar(100) NOT NULL,
  `adresse` varchar(500) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `permission` varchar(100) NOT NULL DEFAULT 'client',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Jane Doe','555-5678','janedoe@example.com','456 Maple Ave','password2','client'),(3,'Bob Smith','555-8765','bobsmith@example.com','789 Oak St','password3','client'),(4,'Alice Brown','555-4321','alicebrown@example.com','246 Elm St','password4','client'),(5,'Mike Johnson','555-7890','mikejohnson@example.com','135 Pine St','password5','client'),(6,'Sara Lee','555-3456','saralee@example.com','678 Cedar St','password6','client'),(7,'Chris Evans','555-0987','chrisevans@example.com','901 Birch St','password7','client'),(8,'Emily Clark','555-6543','emilyclark@example.com','234 Walnut St','password8','client'),(9,'Alex Rodriguez','555-3210','alexrodriguez@example.com','567 Cherry St','password9','client'),(10,'Jessica White','555-9876','jessicawhite@example.com','890 Sycamore St','password10','client'),(69,'John Doe','555-1234','johndoe@example.com','123 Main St','password1','client');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'electronik'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-09 12:02:59
