-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
<<<<<<< HEAD
-- Généré le : sam. 27 juin 2026 à 19:19
=======
-- Généré le : mer. 24 juin 2026 à 16:07
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226
-- Version du serveur : 12.3.2-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` int(11) NOT NULL,
<<<<<<< HEAD
  `nom_categorie` varchar(50) NOT NULL,
  `icone` varchar(50) DEFAULT 'ti-tag',
  `ordre` int(11) DEFAULT 0
=======
  `nom_categorie` varchar(50) NOT NULL
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `categories`
--

<<<<<<< HEAD
INSERT INTO `categories` (`id_categorie`, `nom_categorie`, `icone`, `ordre`) VALUES
(1, 'Vetements', 'ti-tag', 0),
(2, 'Gaming', 'ti-tag', 0),
(3, 'Maison', 'ti-tag', 0),
(4, 'Telephones & Accessoires', 'ti-tag', 0);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id_commande` int(11) NOT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(8) NOT NULL,
  `localisation` varchar(150) NOT NULL,
  `date_commande` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id_commande`, `id_utilisateur`, `nom`, `prenom`, `email`, `telephone`, `localisation`, `date_commande`, `total`) VALUES
(1, 1, 'Ben Salah', 'Eya', 'eya.bensalah@example.com', '20123456', 'Tunis, Tunisie', '2026-06-14 22:20:05', 129.98),
(2, NULL, 'Karray', 'Sami', 'sami.karray@example.com', '22334455', 'Sfax, Tunisie', '2026-06-14 22:20:05', 49.99),
(3, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 09:41:19', 1349.99),
(4, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 09:50:57', 1349.99),
(5, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 09:59:55', 1349.99),
(6, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 10:02:58', 1349.99),
(7, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 11:36:32', 499.99),
(8, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 11:49:41', 319.98),
(9, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 12:01:05', 1179.99),
(10, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '12312312', 'djerba', '2026-06-18 11:50:26', 599.99),
(11, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '12312312', 'djerba', '2026-06-18 11:50:43', 599.99),
(12, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '12312312', 'djerba', '2026-06-18 11:51:08', 699.99),
(13, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-18 11:51:38', 1179.99),
(14, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '12312312', 'djerba', '2026-06-18 12:03:04', 699.99),
(15, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '12312312', 'djerba', '2026-06-18 12:06:18', 799.99),
(16, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-22 12:01:21', 649.99),
(17, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-24 10:44:51', 49.99),
(18, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '98666159', 'djerba', '2026-06-24 11:03:39', 60.50),
(19, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '98666159', 'djerba', '2026-06-24 19:32:07', 100.00),
(20, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-26 09:38:58', 1649.99),
(21, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-26 09:41:46', 1899.99),
(22, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '98666159', 'djerba', '2026-06-26 09:48:07', 1899.99),
(23, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-26 09:52:27', 399.99),
(24, NULL, 'mohamed', 'zemzem', 'mohamedzemzem@gmail.com', '98675214', 'tatawin', '2026-06-26 10:03:57', 49.99),
(25, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '98675214', 'djerba', '2026-06-26 10:07:11', 19.99),
(26, NULL, 'mohamed', 'zemzem', 'mohamedzemzem@gmail.com', '98675214', 'tatawin', '2026-06-26 10:12:01', 299.99),
(27, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '98666159', 'djerba', '2026-06-26 10:28:58', 599.99),
(28, NULL, 'mohamed', 'zemzem', 'mohamedzemzem@gmail.com', '98675214', 'tatawin', '2026-06-27 17:41:09', 1899.99);

-- --------------------------------------------------------

--
-- Structure de la table `commande_produits`
--

CREATE TABLE `commande_produits` (
  `id_commande_produit` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `nom_produit` varchar(255) NOT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL DEFAULT 1,
  `prix_unitaire` decimal(10,2) NOT NULL,
  `prix` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `commande_produits`
--

INSERT INTO `commande_produits` (`id_commande_produit`, `id_commande`, `nom_produit`, `id_produit`, `quantite`, `prix_unitaire`, `prix`) VALUES
(1, 1, '', 1, 1, 19.99, NULL),
(2, 1, '', 13, 1, 109.99, NULL),
(3, 2, '', 3, 1, 49.99, NULL),
(4, 6, 'PC MSI Thin 15 B13UDX i5 13è Gén 8G RTX3050', NULL, 1, 1349.99, NULL),
(5, 7, 'Canapé Moderne 3 Places', NULL, 1, 499.99, NULL),
(6, 8, 'Fauteuil Confort x1, Tapis Salon Gris x1', NULL, 1, 319.98, NULL),
(7, 9, 'iphone 17 PRO MAX 256GB', NULL, 1, 1179.99, NULL),
(8, 15, 'iPhone 17 256GB', NULL, 1, 799.99, 800),
(9, 16, 'PS5 Slim', NULL, 1, 649.99, 650),
(10, 17, 'veste - Taille L / Noir', NULL, 1, 49.99, 50),
(11, 18, 'ensemble fille - Taille 8 ans / Rose', NULL, 1, 60.50, 61),
(12, 19, 'set djeans - Taille L / Noir', NULL, 1, 100.00, 100),
(13, 20, 'PC Dell Alienware 16 Core 5 RTX 3050 / Bleu', NULL, 1, 1649.99, 1650),
(14, 21, 'PC Lenovo LOQ 15ARP10E Ryzen 5 RTX 3050 / Gris', NULL, 1, 1899.99, 1900),
(15, 22, 'PC Lenovo LOQ 15ARP10E Ryzen 5 RTX 3050 / Gris', NULL, 1, 1899.99, 1900),
(16, 23, 'Nintendo Switch 1', NULL, 1, 399.99, 400),
(17, 24, 'Casque Micro Gamer Havit HV-H2232D RGB', NULL, 1, 49.99, 50),
(18, 25, 'Coussin Décoratif', NULL, 1, 19.99, 20),
(19, 26, 'Machine à Café Delonghi', NULL, 1, 299.99, 300),
(20, 27, 'Samsung Galaxy Watch Ultra', NULL, 1, 599.99, 600),
(21, 28, 'PC Lenovo LOQ 15ARP10E Ryzen 5 RTX 3050 / Gris', NULL, 1, 1899.99, 1900);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id_produit` int(11) NOT NULL,
  `nom_produit` varchar(150) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id_sous_categorie` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `nom_produit`, `prix`, `image`, `id_sous_categorie`, `quantite`) VALUES
(1, 'pantalon', 19.99, './images/pant.jpg', 1, 10),
(2, 'chemise', 14.99, './images/chemise.webp', 1, 10),
(3, 'veste', 49.99, './images/jacket.jpg', 1, 10),
(4, 'set homme', 60.00, './images/sethomme .jpg', 1, 10),
(5, 'pantalon a pince', 85.00, './images/pantalonh.jpg', 1, 10),
(6, 'short', 40.00, './images/short.jpg', 1, 10),
(7, 'set djean', 140.00, './images/setdjeanh.jpg', 1, 10),
(8, 'set plage', 95.00, './images/setplage.jpg', 1, 10),
(9, 'pull', 35.00, './images/pull.jpg', 1, 10),
(10, 'veste', 120.00, './images/doudoun.jpg', 1, 10),
(11, 'costume chic', 200.00, './images/costume.jpg', 1, 10),
(12, 'pull', 30.00, './images/pullh.jpg', 1, 10),
(13, 'Robe long', 109.99, './images/robe.webp', 2, 10),
(14, 'set djeans', 100.00, './images/setdjeans.jpg', 2, 10),
(15, 'robe blanc', 90.99, './images/téléchargement.webp', 2, 10),
(16, 'Robe rose', 50.99, './images/roberose.jpg', 2, 10),
(17, 'Robe satin', 150.99, './images/robesatin.webp', 2, 10),
(18, 'robe chic', 80.00, './images/robelong.jpg', 2, 10),
(19, 'jupe blanc', 90.00, './images/jupe.webp', 2, 10),
(20, 'jupe vert', 50.50, './images/jupevert.jpg', 2, 10),
(21, 'pull hivers', 70.50, './images/pullhivers.jpg', 2, 10),
(22, 'pull ete', 60.50, './images/pullete.jpg', 2, 10),
(23, 'pantalons a pince', 100.00, './images/pantalonapince.jpg', 2, 10),
(24, 'pantalonlarge', 90.50, './images/pantalonlarge.jpg', 2, 10),
(25, 'cachecolfemme', 20.50, './images/cachecolfemme.jpg', 2, 10),
(26, 'pantalon', 30.50, './images/pantalonf.jpg', 2, 10),
(27, 'burkinni', 60.00, './images/burkini.jpg', 2, 10),
(28, 'ensemble fille', 60.50, './images/ensemblef.jpg', 3, 10),
(29, 'robe fille', 30.50, './images/Vestido Amarelo Floral Com Alças Finas Para Meninas Jovens.jpg', 3, 10),
(30, 'jupe fille', 40.00, './images/jupeenf.jpg', 3, 10),
(31, 'pantalon large fille', 20.00, './images/pantalonlargeenf.jpg', 3, 10),
(32, 'set djeans', 80.00, './images/setdjeans.jpg', 3, 10),
(33, 'ensemble garcon', 50.99, './images/ensemblegarcon.jpg', 3, 10),
(34, 'tenue garcon blanc', 60.99, './images/setblac2pc.jpg', 3, 10),
(35, 'pantalon a pince', 30.00, './images/pantalonapincegarcon.jpg', 3, 10),
(36, 'set bebe', 20.00, './images/setbebe.jpg', 3, 10),
(37, 'robe bebe', 40.00, './images/robebebe.jpg', 3, 10),
(38, 'robe bebe hivers', 50.00, './images/robebebeete.jpg', 3, 10),
(39, 'set bebe garcon', 30.00, './images/setbebegarcon.jpg', 3, 10),
(40, 'ensemble fille et garcon', 100.00, './images/ensemblefetg.jpg', 3, 10),
(41, 'botillons bebe', 10.00, './images/botillonbebe.jpg', 3, 10),
(42, 'chaussures de course', 29.99, './images/runningshoes.jpg', 4, 10),
(43, 'blanc chaussures', 64.99, './images/whaite shoes.jpg', 4, 10),
(44, 'chaussures marron', 49.99, './images/ssss.jpg', 4, 10),
(45, 'air force blanc', 110.00, './images/airforce.jpg', 4, 10),
(46, 'puma rouge', 80.00, './images/puma.jpg', 4, 10),
(47, 'tallon chic', 250.00, './images/tallonred.jpg', 4, 10),
(48, 'tallon chic', 80.00, './images/sandales.jpg', 4, 10),
(49, 'claquette', 75.00, './images/claquetteh.jpg', 4, 10),
(50, 'chaussures bebe', 45.00, './images/chf.jpg', 4, 10),
(51, 'PC MSI Thin 15 B13UDX RTX3050', 1349.99, './images/gaming/msi-pc-gaming.jpg', 5, 8),
(52, 'PC ASUS TUF Gaming A15 RTX2050', 999.99, './images/gaming/pc asus tuf .jpg', 5, 9),
(53, 'PC LENOVO LOQ 15IAX9 RTX3050', 1279.99, './images/gaming/pc gaming loq.jpg', 5, 10),
(54, 'PC ASUS Vivobook 16X RTX3050', 1549.99, './images/gaming/pc asus vivobook.jpg', 5, 10),
(55, 'PC HP Victus 15 RYZEN 5 RTX2050', 1129.99, './images/gaming/pc gaming victus.jpg', 5, 10),
(56, 'PC Gigabyte AERO X16 RTX5070', 2849.99, './images/gaming/pc gigabite AERO.jpg', 5, 10),
(57, 'PC Dell Alienware 16 RTX3050', 1649.99, './images/gaming/pc gaming dell.jpg', 5, 8),
(58, 'PC Lenovo LOQ 15ARP10E RTX3050', 1899.99, './images/gaming/pc loq 2.jpg', 5, 8),
(59, 'PC Gigabyte G6KF RTX4060', 2049.99, './images/gaming/pc gaming gigabite.jpg', 5, 10),
(60, 'PC Lenovo Legion 5 RTX5050', 2699.99, './images/gaming/pc legion .jpg', 5, 10),
(61, 'PC Gigabyte GAMING A16 RTX5050', 2399.99, './images/gaming/pc gigabite 2.jpg', 5, 10),
(62, 'PC Dell Alienware 16X RTX5070', 3049.99, './images/gaming/pc dell alianware.jpg', 5, 10),
(63, 'PS5 Slim', 649.99, './images/ps5.jpg', 6, 10),
(64, 'Nintendo Switch 1', 399.99, './images/switch1.jpg', 6, 9),
(65, 'PS4 Slim', 379.99, './images/ps4.jpg', 6, 10),
(66, 'XBOX ONE', 449.99, './images/xbox 1.jfif', 6, 10),
(67, 'XBOX SERIES X', 549.99, './images/xbox serie x.jfif', 6, 10),
(68, 'PS4 PRO', 529.99, './images/ps4 pro.avif', 6, 10),
(69, 'PS5 PRO', 899.99, './images/console-ps5-pro.jpg', 6, 10),
(70, 'Switch 2', 599.99, './images/switch 2.jpg', 6, 10),
(71, 'Nintendo 3DS XL', 199.99, './images/nintendo 3DS XL.jpg', 6, 10),
(72, 'Nintendo Switch Lite', 199.99, './images/switch lite .jpg', 6, 10),
(73, 'XBOX SERIES S', 449.99, './images/xbox series s.jpg', 6, 10),
(74, 'Steam Deck', 749.99, './images/steam-deck.jpg', 6, 10),
(75, 'Écouteurs XIAOMI Redmi Buds 6', 29.99, './images/gaming/ecouteurs sans files xiaomi.jpg', 7, 10),
(76, 'Casque Havit HV-H2232D RGB', 49.99, './images/gaming/casque havit .jpg', 7, 9),
(77, 'Casque Alastor T-DAGGER USB', 59.99, './images/gaming/casque gamer alastor.jpg', 7, 10),
(78, 'Casque Baracuda BGH-011 PEARL RGB', 69.99, './images/gaming/casque baracuda.jpg', 7, 10),
(79, 'Casque Gamer T-Wolf RGB', 54.99, './images/gaming/casque gamer t-wolf.jpg', 7, 10),
(80, 'Écouteurs Hama', 39.99, './images/gaming/ecouteurs Hama.jpg', 7, 10),
(81, 'Casque Redragon Hylas H260 RGB', 64.99, './images/gaming/casque redragon.jpg', 7, 10),
(82, 'Casque Gamer Havic RGB', 79.99, './images/gaming/casque gamer havic.jpg', 7, 10),
(83, 'Casque White Shark PEACOCK RGB', 79.99, './images/gaming/casque white shark.jpg', 7, 10),
(84, 'Casque MEETION MT-HP099', 99.99, './images/gaming/casque meetion.jpg', 7, 10),
(85, 'Casque AQIRYS ALTAIR', 109.99, './images/gaming/casque AQIRYS.jpg', 7, 10),
(86, 'Écouteurs Redmi Buds 6 / Blanc', 149.99, './images/gaming/ecouteurs redmi.jpg', 7, 10),
(87, 'Canapé Moderne 3 Places', 499.99, './images/maison/canape moderne.jpg', 8, 10),
(88, 'Table Basse en Bois', 149.99, './images/maison/table basse bois.jpg', 8, 10),
(89, 'Meuble TV Moderne', 299.99, './images/maison/meuble tv moderne.jpg', 8, 10),
(90, 'Fauteuil Confort', 229.99, './images/maison/fauteuil confort.jpg', 8, 10),
(91, 'Tapis Salon Gris', 89.99, './images/maison/tapis salon gris.jpg', 8, 10),
(92, 'Lampadaire Design', 79.99, './images/maison/lampadaire design.jpg', 8, 10),
(93, 'Bibliothèque Moderne', 189.99, './images/maison/bibliotheque moderne.jpg', 8, 10),
(94, 'Étagère Murale', 49.99, './images/maison/etagere murale.jpg', 8, 10),
(95, 'Pouf Rond Salon', 59.99, './images/maison/pouf rond.jpg', 8, 10),
(96, 'Rideaux Salon', 69.99, './images/maison/rideaux salon.jpg', 8, 10),
(97, 'Coussin Décoratif', 19.99, './images/maison/coussin decoratif.jpg', 8, 9),
(98, 'Table d’Appoint', 99.99, './images/maison/table appoint.jpg', 8, 10),
(99, 'Réfrigérateur Samsung', 899.99, './images/maison/refrigerateur samsung.jpg', 9, 10),
(100, 'Four Encastrable Bosch', 499.99, './images/maison/four bosch.jpg', 9, 10),
(101, 'Micro-ondes LG', 149.99, './images/maison/micro onde lg.jpg', 9, 10),
(102, 'Machine à Café Delonghi', 299.99, './images/maison/machine cafe delonghi.jpg', 9, 9),
(103, 'Blender Philips', 89.99, './images/maison/blender philips.jpg', 9, 10),
(104, 'Grille-Pain Tefal', 49.99, './images/maison/grille pain tefal.jpg', 9, 10),
(105, 'Bouilloire Électrique', 39.99, './images/maison/bouilloire.jpg', 9, 10),
(106, 'Robot Cuisine Moulinex', 349.99, './images/maison/robot cuisine.jpg', 9, 10),
(107, 'Friteuse Air Fryer', 129.99, './images/maison/air fryer.jpg', 9, 10),
(108, 'Mixeur Plongeant', 59.99, './images/maison/mixeur plongeant.jpg', 9, 10),
(109, 'Set Casseroles Inox', 99.99, './images/maison/casseroles inox.jpg', 9, 10),
(110, 'Plaque Induction', 279.99, './images/maison/plaque induction.jpg', 9, 10),
(111, 'Miroir Rond Design', 89.99, './images/maison/miroir rond.jpg', 10, 10),
(112, 'Horloge Murale Moderne', 49.99, './images/maison/horloge murale.jpg', 10, 10),
(113, 'Vase Décoratif', 39.99, './images/maison/vase decoratif.jpg', 10, 10),
(114, 'Cadre Photo Élégant', 29.99, './images/maison/cadre photo.jpg', 10, 10),
(115, 'Plante Artificielle', 24.99, './images/maison/plante artificielle.jpg', 10, 10),
(116, 'Lampe de Table Moderne', 69.99, './images/maison/lampe table.jpg', 10, 10),
(117, 'Guirlande LED Décorative', 19.99, './images/maison/guirlande led.jpg', 10, 10),
(118, 'Statue Moderne', 79.99, './images/maison/statue moderne.jpg', 10, 10),
(119, 'Lot de Bougies Parfumées', 34.99, './images/maison/bougies parfumees.jpg', 10, 10),
(120, 'Panneau Décoratif Mural', 59.99, './images/maison/panneau mural.jpg', 10, 10),
(121, 'Lampe Murale', 24.99, './images/maison/lampe murale.jpg', 10, 10),
(122, 'Fontaine Intérieure Zen', 99.99, './images/maison/fontaine zen.jpg', 10, 10),
(123, 'iphone 17 256GB', 799.99, './images/teleEtAcces/iphone 17.jfif', 11, 10),
(124, 'Samsung Galaxy S25 256GB', 699.99, './images/teleEtAcces/samsung Galaxy S25.jpg', 11, 10),
(125, 'iphone 17 PRO MAX 256GB', 1179.99, './images/teleEtAcces/iphone 17 pro max .jfif', 11, 10),
(126, 'Nothing Phone 1 256GB', 449.99, './images/teleEtAcces/nothing phone 1.jpg', 11, 10),
(127, 'Samsung A17 5G 128GB', 249.99, './images/teleEtAcces/samsung A17 5G.jpg', 11, 10),
(128, 'samsung Galaxy S26 Ultra 5G 512GB', 1349.99, './images/teleEtAcces/samsung Galaxy S26 Ultra .jpg', 11, 10),
(129, 'Google Pixel 7 126GB', 899.99, './images/teleEtAcces/google pixel 9.jfif', 11, 10),
(130, 'iphone 15 126GB', 599.99, './images/teleEtAcces/iphone 15.jfif', 11, 10),
(131, 'Xiaomi Redmi 15', 199.99, './images/teleEtAcces/Redmi 15.webp', 11, 10),
(132, 'Samsung A56 256GB', 419.99, './images/teleEtAcces/samsung A56.jfif', 11, 10),
(133, 'Google Pixel 10 PRO XL', 1249.99, './images/teleEtAcces/pixel 10 pro XL.jfif', 11, 10),
(134, 'iphone air 256GB', 849.99, './images/teleEtAcces/iphone air.jfif', 11, 10),
(135, 'Apple Watch Series 10', 499.99, './images/teleEtAcces/apple watch series 10.jpg', 12, 10),
(136, 'Samsung Galaxy Watch 7', 349.99, './images/teleEtAcces/samsung galaxy watch 7.jpg', 12, 10),
(137, 'Samsung Galaxy Watch Ultra', 599.99, './images/teleEtAcces/samsung galaxy watch ultra.jpg', 12, 9),
(138, 'Xiaomi Watch S4', 199.99, './images/teleEtAcces/xiaomi watch s4.jpg', 12, 10),
(139, 'Huawei Watch Fit 4', 179.99, './images/teleEtAcces/huawei watch fit 4.jpg', 12, 10),
(140, 'Huawei Watch GT 5', 299.99, './images/teleEtAcces/huawei watch gt 5.jpg', 12, 10),
(141, 'Garmin Venu 3', 449.99, './images/teleEtAcces/garmin venu 3.jpg', 12, 10),
(142, 'Amazfit Balance', 229.99, './images/teleEtAcces/amazfit balance.jpg', 12, 10),
(143, 'Redmi Watch 5', 99.99, './images/teleEtAcces/redmi watch 5.jpg', 12, 10),
(144, 'OnePlus Watch 3', 279.99, './images/teleEtAcces/oneplus watch 3.png', 12, 10),
(145, 'Google Pixel Watch 3', 399.99, './images/teleEtAcces/google pixel watch 3.jpg', 12, 10),
(146, 'Honor Watch 5', 149.99, './images/teleEtAcces/honor watch 5.jpg', 12, 10),
(147, 'Power Bank Anker 20000mAh', 79.99, './images/teleEtAcces/anker powerbank.jpg', 13, 10),
(148, 'Chargeur USB-C 65W', 39.99, './images/teleEtAcces/chargeur usbc.jpg', 13, 10),
(149, 'Coque iPhone 17', 24.99, './images/teleEtAcces/coque iphone.jpg', 13, 10),
(150, 'Coque Samsung S25', 24.99, './images/teleEtAcces/coque samsung.jpg', 13, 10),
(151, 'Clavier Bluetooth Logitech', 89.99, './images/teleEtAcces/clavier bluetooth.jpg', 13, 10),
(152, 'Souris Logitech MX Master 3', 99.99, './images/teleEtAcces/logitech mx master 3.jpg', 13, 10),
(153, 'Trépied Smartphone', 29.99, './images/teleEtAcces/tripod smartphone.jpg', 13, 10),
(154, 'Support Téléphone Voiture', 19.99, './images/teleEtAcces/support voiture.jpg', 13, 10),
(155, 'Batterie MagSafe Apple', 89.99, './images/teleEtAcces/batterie magsafe.jpg', 13, 10),
(156, 'Station Charge Sans Fil 3-en-1', 69.99, './images/teleEtAcces/station charge sans fil.jpg', 13, 10),
(157, 'Tapis Souris XXL Legion', 29.99, './images/teleEtAcces/tapis souris lzgion.jpg', 13, 10),
(158, 'SSD Externe Samsung T9 1To', 129.99, './images/teleEtAcces/ssd samsung t9.jpg', 13, 10);

-- --------------------------------------------------------

--
-- Structure de la table `produits_catalogue`
--

CREATE TABLE `produits_catalogue` (
  `id_produit` int(11) NOT NULL,
  `nom_produit` varchar(200) NOT NULL,
  `prix` decimal(10,2) DEFAULT 0.00,
  `image_url` varchar(500) DEFAULT '',
  `id_sous_categorie` int(11) NOT NULL,
  `quantite` int(11) DEFAULT 0,
  `est_vetement` tinyint(1) DEFAULT 0,
  `date_ajout` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `produits_catalogue`
--

INSERT INTO `produits_catalogue` (`id_produit`, `nom_produit`, `prix`, `image_url`, `id_sous_categorie`, `quantite`, `est_vetement`, `date_ajout`) VALUES
(1, 't-shirt Marvel Spider-Man', 40.00, './images/spiderman.png', 3, 8, 0, '2026-06-26 11:03:11'),
(2, 't-shirt spider man', 50.00, './images/spiderman.png', 3, 8, 0, '2026-06-26 11:36:43');

-- --------------------------------------------------------

--
-- Structure de la table `produits_stock`
--

CREATE TABLE `produits_stock` (
  `id_produit` int(11) NOT NULL,
  `id_sous_categorie` int(11) NOT NULL,
  `nom_produit` varchar(255) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 15
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `produits_stock`
--

INSERT INTO `produits_stock` (`id_produit`, `id_sous_categorie`, `nom_produit`, `quantite`) VALUES
(1, 5, 'Canapé Moderne 3 Places', 15),
(2, 5, 'Table Basse en Bois', 15),
(3, 5, 'Meuble TV Moderne', 15),
(4, 5, 'Fauteuil Confort', 15),
(5, 5, 'Tapis Salon Gris', 15),
(6, 5, 'Lampadaire Design', 15),
(7, 5, 'Bibliothèque Moderne', 15),
(8, 5, 'Étagère Murale', 15),
(9, 5, 'Pouf Rond Salon', 15),
(10, 5, 'Rideaux Salon', 15),
(11, 5, 'Coussin Décoratif', 15),
(12, 5, 'Table d\'Appoint', 15),
(13, 6, 'Réfrigérateur Samsung', 15),
(14, 6, 'Four Encastrable Bosch', 15),
(15, 6, 'Micro-ondes LG', 15),
(16, 6, 'Machine à Café Delonghi', 15),
(17, 6, 'Blender Philips', 15),
(18, 6, 'Grille-Pain Tefal', 15),
(19, 6, 'Bouilloire Électrique', 15),
(20, 6, 'Robot Cuisine Moulinex', 15),
(21, 6, 'Friteuse Air Fryer', 15),
(22, 6, 'Mixeur Plongeant', 15),
(23, 6, 'Set Casseroles Inox', 15),
(24, 6, 'Plaque Induction', 15),
(25, 7, 'Miroir Rond Design', 15),
(26, 7, 'Horloge Murale Moderne', 15),
(27, 7, 'Vase Décoratif', 15),
(28, 7, 'Cadre Photo Élégant', 15),
(29, 7, 'Plante Artificielle', 15),
(30, 7, 'Lampe de Table Moderne', 15),
(31, 7, 'Guirlande LED Décorative', 15),
(32, 7, 'Statue Moderne', 15),
(33, 7, 'Lot de Bougies Parfumées', 15),
(34, 7, 'Panneau Décoratif Mural', 15),
(35, 7, 'lampe murale', 15),
(36, 7, 'Fontaine Intérieure Zen', 15),
(37, 8, 'PS5 Slim', 15),
(38, 8, 'Nintendo Switch 1', 15),
(39, 8, 'PS4 Slim', 15),
(40, 8, 'XBOX ONE', 15),
(41, 8, 'XBOX SERIES X', 15),
(42, 8, 'PS4 PRO', 15),
(43, 8, 'PS5 PRO', 15),
(44, 8, 'Nintendo Switch 2', 15),
(45, 8, 'Nintendo 3DS XL', 15),
(46, 8, 'Nintendo Switch Lite', 15),
(47, 8, 'XBOX SERIES S', 15),
(48, 8, 'Steam Deck', 15),
(49, 9, 'PC MSI Thin 15 B13UDX i5 13è Gén 8G RTX3050', 15),
(50, 9, 'PC ASUS TUF Gaming A15 RYZEN 5 8Go RTX 2050', 14),
(51, 9, 'PC LENOVO LOQ 15IAX9 i5 12è Gén 8G RTX 3050', 15),
(52, 9, 'PC ASUS Vivobook 16X i5 13è Gén 24Go RTX3050', 15),
(53, 9, 'PC HP Victus 15 RYZEN 5 16Go RTX 2050', 15),
(54, 9, 'PC Gigabyte AERO X16 Ryzen AI 7 RTX 5070', 15),
(55, 9, 'PC Dell Alienware 16 Core 5 RTX 3050 / Bleu', 15),
(56, 9, 'PC Lenovo LOQ 15ARP10E Ryzen 5 RTX 3050 / Gris', 14),
(57, 9, 'PC Gigabyte G6KF i7 RTX 4060 / Noir', 15),
(58, 9, 'PC Lenovo Legion 5 i7 RTX 5050 / Noir', 15),
(59, 9, 'PC Gigabyte GAMING A16 Ryzen 7 RTX 5050 / Noir', 15),
(60, 9, 'PC Dell Alienware 16X Ultra 9 RTX 5070 / Bleu', 15),
(61, 10, 'Écouteurs Sans Fil XIAOMI Redmi Buds 6 Play / Noir', 15),
(62, 10, 'Casque Micro Gamer Havit HV-H2232D RGB', 15),
(63, 10, 'Casque Gamer Alastor T-DAGGER T-RGH217-USB', 15),
(64, 10, 'Micro-Casque Gaming Baracuda BGH-011 PEARL RGB / Noir', 15),
(65, 10, 'Casque Gamer T-Wolf RGB', 15),
(66, 10, 'Écouteurs Hama', 15),
(67, 10, 'Casque Micro Gaming Redragon Hylas H260 RGB', 15),
(68, 10, 'Casque Gamer Havic RGB', 15),
(69, 10, 'Casque White Shark PEACOCK GH-2444 RGB / Blanc', 15),
(70, 10, 'Casque Gamer MEETION MT-HP099 / Noir', 15),
(71, 10, 'Casque AQIRYS ALTAIR Filaire / Blanc', 15),
(72, 10, 'Écouteurs Redmi Buds 6 / Blanc', 15),
(73, 11, 'iPhone 17 256GB', 15),
(74, 11, 'Samsung Galaxy S25 256GB', 15),
(75, 11, 'iphone 17 PRO MAX 256GB', 15),
(76, 11, 'Nothing Phone 1 256GB', 15),
(77, 11, 'Samsung A17 5G 128GB', 15),
(78, 11, 'samsung Galaxy S26 Ultra 5G 512GB', 15),
(79, 11, 'Google Pixel 7 126GB', 15),
(80, 11, 'iphone 15 126GB', 15),
(81, 11, 'Xiaomi Redmi 15', 15),
(82, 11, 'Samsung A56 256GB', 15),
(83, 11, 'Google Pixel 10 PRO XL', 15),
(84, 11, 'iphone air 256GB', 15),
(85, 12, 'Apple Watch Series 10', 15),
(86, 12, 'Samsung Galaxy Watch 7', 15),
(87, 12, 'Samsung Galaxy Watch Ultra', 15),
(88, 12, 'Xiaomi Watch S4', 15),
(89, 12, 'Huawei Watch Fit 4', 15),
(90, 12, 'Huawei Watch GT 5', 15),
(91, 12, 'Garmin Venu 3', 15),
(92, 12, 'Amazfit Balance', 15),
(93, 12, 'Redmi Watch 5', 15),
(94, 12, 'OnePlus Watch 3', 15),
(95, 12, 'Google Pixel Watch 3', 15),
(96, 12, 'Honor Watch 5', 15),
(97, 13, 'Power Bank Anker 20000mAh', 15),
(98, 13, 'Chargeur USB-C 65W', 15),
(99, 13, 'Coque iPhone 17', 15),
(100, 13, 'Coque Samsung S25', 15),
(101, 13, 'Clavier Bluetooth Logitech', 15),
(102, 13, 'Souris Logitech MX Master 3', 15),
(103, 13, 'Trépied Smartphone', 15),
(104, 13, 'Support Téléphone Voiture', 15),
(105, 13, 'Batterie MagSafe Apple', 15),
(106, 13, 'Station Charge Sans Fil 3-en-1', 15),
(107, 13, 'Tapis Souris XXL Legion', 15),
(108, 13, 'SSD Externe Samsung T9 1To', 15),
(109, 3, 't-shirt marvel spider man', 0);

-- --------------------------------------------------------

--
-- Structure de la table `produit_variantes`
--

CREATE TABLE `produit_variantes` (
  `id_variante` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `taille` varchar(10) NOT NULL,
  `couleur` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `produit_variantes`
--

=======
INSERT INTO `categories` (`id_categorie`, `nom_categorie`) VALUES
(1, 'Vetements'),
(2, 'Gaming'),
(3, 'Maison'),
(4, 'Telephones & Accessoires');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id_commande` int(11) NOT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(8) NOT NULL,
  `localisation` varchar(150) NOT NULL,
  `date_commande` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id_commande`, `id_utilisateur`, `nom`, `prenom`, `email`, `telephone`, `localisation`, `date_commande`, `total`) VALUES
(1, 1, 'Ben Salah', 'Eya', 'eya.bensalah@example.com', '20123456', 'Tunis, Tunisie', '2026-06-14 22:20:05', 129.98),
(2, NULL, 'Karray', 'Sami', 'sami.karray@example.com', '22334455', 'Sfax, Tunisie', '2026-06-14 22:20:05', 49.99),
(3, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 09:41:19', 1349.99),
(4, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 09:50:57', 1349.99),
(5, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 09:59:55', 1349.99),
(6, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 10:02:58', 1349.99),
(7, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 11:36:32', 499.99),
(8, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 11:49:41', 319.98),
(9, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-17 12:01:05', 1179.99),
(10, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '12312312', 'djerba', '2026-06-18 11:50:26', 599.99),
(11, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '12312312', 'djerba', '2026-06-18 11:50:43', 599.99),
(12, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '12312312', 'djerba', '2026-06-18 11:51:08', 699.99),
(13, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-18 11:51:38', 1179.99),
(14, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '12312312', 'djerba', '2026-06-18 12:03:04', 699.99),
(15, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '12312312', 'djerba', '2026-06-18 12:06:18', 799.99),
(16, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-22 12:01:21', 649.99),
(17, NULL, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'djerba', '2026-06-24 10:44:51', 49.99),
(18, NULL, 'eya', 'esside', 'eyaesside@gmail.com', '98666159', 'djerba', '2026-06-24 11:03:39', 60.50);

-- --------------------------------------------------------

--
-- Structure de la table `commande_produits`
--

CREATE TABLE `commande_produits` (
  `id_commande_produit` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `nom_produit` varchar(255) NOT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL DEFAULT 1,
  `prix_unitaire` decimal(10,2) NOT NULL,
  `prix` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `commande_produits`
--

INSERT INTO `commande_produits` (`id_commande_produit`, `id_commande`, `nom_produit`, `id_produit`, `quantite`, `prix_unitaire`, `prix`) VALUES
(1, 1, '', 1, 1, 19.99, NULL),
(2, 1, '', 13, 1, 109.99, NULL),
(3, 2, '', 3, 1, 49.99, NULL),
(4, 6, 'PC MSI Thin 15 B13UDX i5 13è Gén 8G RTX3050', NULL, 1, 1349.99, NULL),
(5, 7, 'Canapé Moderne 3 Places', NULL, 1, 499.99, NULL),
(6, 8, 'Fauteuil Confort x1, Tapis Salon Gris x1', NULL, 1, 319.98, NULL),
(7, 9, 'iphone 17 PRO MAX 256GB', NULL, 1, 1179.99, NULL),
(8, 15, 'iPhone 17 256GB', NULL, 1, 799.99, 800),
(9, 16, 'PS5 Slim', NULL, 1, 649.99, 650),
(10, 17, 'veste - Taille L / Noir', NULL, 1, 49.99, 50),
(11, 18, 'ensemble fille - Taille 8 ans / Rose', NULL, 1, 60.50, 61);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id_produit` int(11) NOT NULL,
  `nom_produit` varchar(150) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id_sous_categorie` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `nom_produit`, `prix`, `image`, `id_sous_categorie`, `quantite`) VALUES
(1, 'pantalon', 19.99, './images/pant.jpg', 1, 10),
(2, 'chemise', 14.99, './images/chemise.webp', 1, 10),
(3, 'veste', 49.99, './images/jacket.jpg', 1, 10),
(4, 'set homme', 60.00, './images/sethomme .jpg', 1, 10),
(5, 'pantalon a pince', 85.00, './images/pantalonh.jpg', 1, 10),
(6, 'short', 40.00, './images/short.jpg', 1, 10),
(7, 'set djean', 140.00, './images/setdjeanh.jpg', 1, 10),
(8, 'set plage', 95.00, './images/setplage.jpg', 1, 10),
(9, 'pull', 35.00, './images/pull.jpg', 1, 10),
(10, 'veste', 120.00, './images/doudoun.jpg', 1, 10),
(11, 'costume chic', 200.00, './images/costume.jpg', 1, 10),
(12, 'pull', 30.00, './images/pullh.jpg', 1, 10),
(13, 'Robe long', 109.99, './images/robe.webp', 2, 10),
(14, 'set djeans', 100.00, './images/setdjeans.jpg', 2, 10),
(15, 'robe blanc', 90.99, './images/téléchargement.webp', 2, 10),
(16, 'Robe rose', 50.99, './images/roberose.jpg', 2, 10),
(17, 'Robe satin', 150.99, './images/robesatin.webp', 2, 10),
(18, 'robe chic', 80.00, './images/robelong.jpg', 2, 10),
(19, 'jupe blanc', 90.00, './images/jupe.webp', 2, 10),
(20, 'jupe vert', 50.50, './images/jupevert.jpg', 2, 10),
(21, 'pull hivers', 70.50, './images/pullhivers.jpg', 2, 10),
(22, 'pull ete', 60.50, './images/pullete.jpg', 2, 10),
(23, 'pantalons a pince', 100.00, './images/pantalonapince.jpg', 2, 10),
(24, 'pantalonlarge', 90.50, './images/pantalonlarge.jpg', 2, 10),
(25, 'cachecolfemme', 20.50, './images/cachecolfemme.jpg', 2, 10),
(26, 'pantalon', 30.50, './images/pantalonf.jpg', 2, 10),
(27, 'burkinni', 60.00, './images/burkini.jpg', 2, 10),
(28, 'ensemble fille', 60.50, './images/ensemblef.jpg', 3, 10),
(29, 'robe fille', 30.50, './images/Vestido Amarelo Floral Com Alças Finas Para Meninas Jovens.jpg', 3, 10),
(30, 'jupe fille', 40.00, './images/jupeenf.jpg', 3, 10),
(31, 'pantalon large fille', 20.00, './images/pantalonlargeenf.jpg', 3, 10),
(32, 'set djeans', 80.00, './images/setdjeans.jpg', 3, 10),
(33, 'ensemble garcon', 50.99, './images/ensemblegarcon.jpg', 3, 10),
(34, 'tenue garcon blanc', 60.99, './images/setblac2pc.jpg', 3, 10),
(35, 'pantalon a pince', 30.00, './images/pantalonapincegarcon.jpg', 3, 10),
(36, 'set bebe', 20.00, './images/setbebe.jpg', 3, 10),
(37, 'robe bebe', 40.00, './images/robebebe.jpg', 3, 10),
(38, 'robe bebe hivers', 50.00, './images/robebebeete.jpg', 3, 10),
(39, 'set bebe garcon', 30.00, './images/setbebegarcon.jpg', 3, 10),
(40, 'ensemble fille et garcon', 100.00, './images/ensemblefetg.jpg', 3, 10),
(41, 'botillons bebe', 10.00, './images/botillonbebe.jpg', 3, 10),
(42, 'chaussures de course', 29.99, './images/runningshoes.jpg', 4, 10),
(43, 'blanc chaussures', 64.99, './images/whaite shoes.jpg', 4, 10),
(44, 'chaussures marron', 49.99, './images/ssss.jpg', 4, 10),
(45, 'air force blanc', 110.00, './images/airforce.jpg', 4, 10),
(46, 'puma rouge', 80.00, './images/puma.jpg', 4, 10),
(47, 'tallon chic', 250.00, './images/tallonred.jpg', 4, 10),
(48, 'tallon chic', 80.00, './images/sandales.jpg', 4, 10),
(49, 'claquette', 75.00, './images/claquetteh.jpg', 4, 10),
(50, 'chaussures bebe', 45.00, './images/chf.jpg', 4, 10),
(51, 'PC MSI Thin 15 B13UDX RTX3050', 1349.99, './images/gaming/msi-pc-gaming.jpg', 5, 10),
(52, 'PC ASUS TUF Gaming A15 RTX2050', 999.99, './images/gaming/pc asus tuf .jpg', 5, 10),
(53, 'PC LENOVO LOQ 15IAX9 RTX3050', 1279.99, './images/gaming/pc gaming loq.jpg', 5, 10),
(54, 'PC ASUS Vivobook 16X RTX3050', 1549.99, './images/gaming/pc asus vivobook.jpg', 5, 10),
(55, 'PC HP Victus 15 RYZEN 5 RTX2050', 1129.99, './images/gaming/pc gaming victus.jpg', 5, 10),
(56, 'PC Gigabyte AERO X16 RTX5070', 2849.99, './images/gaming/pc gigabite AERO.jpg', 5, 10),
(57, 'PC Dell Alienware 16 RTX3050', 1649.99, './images/gaming/pc gaming dell.jpg', 5, 10),
(58, 'PC Lenovo LOQ 15ARP10E RTX3050', 1899.99, './images/gaming/pc loq 2.jpg', 5, 10),
(59, 'PC Gigabyte G6KF RTX4060', 2049.99, './images/gaming/pc gaming gigabite.jpg', 5, 10),
(60, 'PC Lenovo Legion 5 RTX5050', 2699.99, './images/gaming/pc legion .jpg', 5, 10),
(61, 'PC Gigabyte GAMING A16 RTX5050', 2399.99, './images/gaming/pc gigabite 2.jpg', 5, 10),
(62, 'PC Dell Alienware 16X RTX5070', 3049.99, './images/gaming/pc dell alianware.jpg', 5, 10),
(63, 'PS5 Slim', 649.99, './images/ps5.jpg', 6, 10),
(64, 'Nintendo Switch 1', 399.99, './images/switch1.jpg', 6, 10),
(65, 'PS4 Slim', 379.99, './images/ps4.jpg', 6, 10),
(66, 'XBOX ONE', 449.99, './images/xbox 1.jfif', 6, 10),
(67, 'XBOX SERIES X', 549.99, './images/xbox serie x.jfif', 6, 10),
(68, 'PS4 PRO', 529.99, './images/ps4 pro.avif', 6, 10),
(69, 'PS5 PRO', 899.99, './images/console-ps5-pro.jpg', 6, 10),
(70, 'Switch 2', 599.99, './images/switch 2.jpg', 6, 10),
(71, 'Nintendo 3DS XL', 199.99, './images/nintendo 3DS XL.jpg', 6, 10),
(72, 'Nintendo Switch Lite', 199.99, './images/switch lite .jpg', 6, 10),
(73, 'XBOX SERIES S', 449.99, './images/xbox series s.jpg', 6, 10),
(74, 'Steam Deck', 749.99, './images/steam-deck.jpg', 6, 10),
(75, 'Écouteurs XIAOMI Redmi Buds 6', 29.99, './images/gaming/ecouteurs sans files xiaomi.jpg', 7, 10),
(76, 'Casque Havit HV-H2232D RGB', 49.99, './images/gaming/casque havit .jpg', 7, 10),
(77, 'Casque Alastor T-DAGGER USB', 59.99, './images/gaming/casque gamer alastor.jpg', 7, 10),
(78, 'Casque Baracuda BGH-011 PEARL RGB', 69.99, './images/gaming/casque baracuda.jpg', 7, 10),
(79, 'Casque Gamer T-Wolf RGB', 54.99, './images/gaming/casque gamer t-wolf.jpg', 7, 10),
(80, 'Écouteurs Hama', 39.99, './images/gaming/ecouteurs Hama.jpg', 7, 10),
(81, 'Casque Redragon Hylas H260 RGB', 64.99, './images/gaming/casque redragon.jpg', 7, 10),
(82, 'Casque Gamer Havic RGB', 79.99, './images/gaming/casque gamer havic.jpg', 7, 10),
(83, 'Casque White Shark PEACOCK RGB', 79.99, './images/gaming/casque white shark.jpg', 7, 10),
(84, 'Casque MEETION MT-HP099', 99.99, './images/gaming/casque meetion.jpg', 7, 10),
(85, 'Casque AQIRYS ALTAIR', 109.99, './images/gaming/casque AQIRYS.jpg', 7, 10),
(86, 'Écouteurs Redmi Buds 6 / Blanc', 149.99, './images/gaming/ecouteurs redmi.jpg', 7, 10),
(87, 'Canapé Moderne 3 Places', 499.99, './images/maison/canape moderne.jpg', 8, 10),
(88, 'Table Basse en Bois', 149.99, './images/maison/table basse bois.jpg', 8, 10),
(89, 'Meuble TV Moderne', 299.99, './images/maison/meuble tv moderne.jpg', 8, 10),
(90, 'Fauteuil Confort', 229.99, './images/maison/fauteuil confort.jpg', 8, 10),
(91, 'Tapis Salon Gris', 89.99, './images/maison/tapis salon gris.jpg', 8, 10),
(92, 'Lampadaire Design', 79.99, './images/maison/lampadaire design.jpg', 8, 10),
(93, 'Bibliothèque Moderne', 189.99, './images/maison/bibliotheque moderne.jpg', 8, 10),
(94, 'Étagère Murale', 49.99, './images/maison/etagere murale.jpg', 8, 10),
(95, 'Pouf Rond Salon', 59.99, './images/maison/pouf rond.jpg', 8, 10),
(96, 'Rideaux Salon', 69.99, './images/maison/rideaux salon.jpg', 8, 10),
(97, 'Coussin Décoratif', 19.99, './images/maison/coussin decoratif.jpg', 8, 10),
(98, 'Table d’Appoint', 99.99, './images/maison/table appoint.jpg', 8, 10),
(99, 'Réfrigérateur Samsung', 899.99, './images/maison/refrigerateur samsung.jpg', 9, 10),
(100, 'Four Encastrable Bosch', 499.99, './images/maison/four bosch.jpg', 9, 10),
(101, 'Micro-ondes LG', 149.99, './images/maison/micro onde lg.jpg', 9, 10),
(102, 'Machine à Café Delonghi', 299.99, './images/maison/machine cafe delonghi.jpg', 9, 10),
(103, 'Blender Philips', 89.99, './images/maison/blender philips.jpg', 9, 10),
(104, 'Grille-Pain Tefal', 49.99, './images/maison/grille pain tefal.jpg', 9, 10),
(105, 'Bouilloire Électrique', 39.99, './images/maison/bouilloire.jpg', 9, 10),
(106, 'Robot Cuisine Moulinex', 349.99, './images/maison/robot cuisine.jpg', 9, 10),
(107, 'Friteuse Air Fryer', 129.99, './images/maison/air fryer.jpg', 9, 10),
(108, 'Mixeur Plongeant', 59.99, './images/maison/mixeur plongeant.jpg', 9, 10),
(109, 'Set Casseroles Inox', 99.99, './images/maison/casseroles inox.jpg', 9, 10),
(110, 'Plaque Induction', 279.99, './images/maison/plaque induction.jpg', 9, 10),
(111, 'Miroir Rond Design', 89.99, './images/maison/miroir rond.jpg', 10, 10),
(112, 'Horloge Murale Moderne', 49.99, './images/maison/horloge murale.jpg', 10, 10),
(113, 'Vase Décoratif', 39.99, './images/maison/vase decoratif.jpg', 10, 10),
(114, 'Cadre Photo Élégant', 29.99, './images/maison/cadre photo.jpg', 10, 10),
(115, 'Plante Artificielle', 24.99, './images/maison/plante artificielle.jpg', 10, 10),
(116, 'Lampe de Table Moderne', 69.99, './images/maison/lampe table.jpg', 10, 10),
(117, 'Guirlande LED Décorative', 19.99, './images/maison/guirlande led.jpg', 10, 10),
(118, 'Statue Moderne', 79.99, './images/maison/statue moderne.jpg', 10, 10),
(119, 'Lot de Bougies Parfumées', 34.99, './images/maison/bougies parfumees.jpg', 10, 10),
(120, 'Panneau Décoratif Mural', 59.99, './images/maison/panneau mural.jpg', 10, 10),
(121, 'Lampe Murale', 24.99, './images/maison/lampe murale.jpg', 10, 10),
(122, 'Fontaine Intérieure Zen', 99.99, './images/maison/fontaine zen.jpg', 10, 10),
(123, 'iphone 17 256GB', 799.99, './images/teleEtAcces/iphone 17.jfif', 11, 10),
(124, 'Samsung Galaxy S25 256GB', 699.99, './images/teleEtAcces/samsung Galaxy S25.jpg', 11, 10),
(125, 'iphone 17 PRO MAX 256GB', 1179.99, './images/teleEtAcces/iphone 17 pro max .jfif', 11, 10),
(126, 'Nothing Phone 1 256GB', 449.99, './images/teleEtAcces/nothing phone 1.jpg', 11, 10),
(127, 'Samsung A17 5G 128GB', 249.99, './images/teleEtAcces/samsung A17 5G.jpg', 11, 10),
(128, 'samsung Galaxy S26 Ultra 5G 512GB', 1349.99, './images/teleEtAcces/samsung Galaxy S26 Ultra .jpg', 11, 10),
(129, 'Google Pixel 7 126GB', 899.99, './images/teleEtAcces/google pixel 9.jfif', 11, 10),
(130, 'iphone 15 126GB', 599.99, './images/teleEtAcces/iphone 15.jfif', 11, 10),
(131, 'Xiaomi Redmi 15', 199.99, './images/teleEtAcces/Redmi 15.webp', 11, 10),
(132, 'Samsung A56 256GB', 419.99, './images/teleEtAcces/samsung A56.jfif', 11, 10),
(133, 'Google Pixel 10 PRO XL', 1249.99, './images/teleEtAcces/pixel 10 pro XL.jfif', 11, 10),
(134, 'iphone air 256GB', 849.99, './images/teleEtAcces/iphone air.jfif', 11, 10),
(135, 'Apple Watch Series 10', 499.99, './images/teleEtAcces/apple watch series 10.jpg', 12, 10),
(136, 'Samsung Galaxy Watch 7', 349.99, './images/teleEtAcces/samsung galaxy watch 7.jpg', 12, 10),
(137, 'Samsung Galaxy Watch Ultra', 599.99, './images/teleEtAcces/samsung galaxy watch ultra.jpg', 12, 10),
(138, 'Xiaomi Watch S4', 199.99, './images/teleEtAcces/xiaomi watch s4.jpg', 12, 10),
(139, 'Huawei Watch Fit 4', 179.99, './images/teleEtAcces/huawei watch fit 4.jpg', 12, 10),
(140, 'Huawei Watch GT 5', 299.99, './images/teleEtAcces/huawei watch gt 5.jpg', 12, 10),
(141, 'Garmin Venu 3', 449.99, './images/teleEtAcces/garmin venu 3.jpg', 12, 10),
(142, 'Amazfit Balance', 229.99, './images/teleEtAcces/amazfit balance.jpg', 12, 10),
(143, 'Redmi Watch 5', 99.99, './images/teleEtAcces/redmi watch 5.jpg', 12, 10),
(144, 'OnePlus Watch 3', 279.99, './images/teleEtAcces/oneplus watch 3.png', 12, 10),
(145, 'Google Pixel Watch 3', 399.99, './images/teleEtAcces/google pixel watch 3.jpg', 12, 10),
(146, 'Honor Watch 5', 149.99, './images/teleEtAcces/honor watch 5.jpg', 12, 10),
(147, 'Power Bank Anker 20000mAh', 79.99, './images/teleEtAcces/anker powerbank.jpg', 13, 10),
(148, 'Chargeur USB-C 65W', 39.99, './images/teleEtAcces/chargeur usbc.jpg', 13, 10),
(149, 'Coque iPhone 17', 24.99, './images/teleEtAcces/coque iphone.jpg', 13, 10),
(150, 'Coque Samsung S25', 24.99, './images/teleEtAcces/coque samsung.jpg', 13, 10),
(151, 'Clavier Bluetooth Logitech', 89.99, './images/teleEtAcces/clavier bluetooth.jpg', 13, 10),
(152, 'Souris Logitech MX Master 3', 99.99, './images/teleEtAcces/logitech mx master 3.jpg', 13, 10),
(153, 'Trépied Smartphone', 29.99, './images/teleEtAcces/tripod smartphone.jpg', 13, 10),
(154, 'Support Téléphone Voiture', 19.99, './images/teleEtAcces/support voiture.jpg', 13, 10),
(155, 'Batterie MagSafe Apple', 89.99, './images/teleEtAcces/batterie magsafe.jpg', 13, 10),
(156, 'Station Charge Sans Fil 3-en-1', 69.99, './images/teleEtAcces/station charge sans fil.jpg', 13, 10),
(157, 'Tapis Souris XXL Legion', 29.99, './images/teleEtAcces/tapis souris lzgion.jpg', 13, 10),
(158, 'SSD Externe Samsung T9 1To', 129.99, './images/teleEtAcces/ssd samsung t9.jpg', 13, 10);

-- --------------------------------------------------------

--
-- Structure de la table `produits_stock`
--

CREATE TABLE `produits_stock` (
  `id_produit` int(11) NOT NULL,
  `id_sous_categorie` int(11) NOT NULL,
  `nom_produit` varchar(255) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 15
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `produits_stock`
--

INSERT INTO `produits_stock` (`id_produit`, `id_sous_categorie`, `nom_produit`, `quantite`) VALUES
(1, 5, 'Canapé Moderne 3 Places', 15),
(2, 5, 'Table Basse en Bois', 15),
(3, 5, 'Meuble TV Moderne', 15),
(4, 5, 'Fauteuil Confort', 15),
(5, 5, 'Tapis Salon Gris', 15),
(6, 5, 'Lampadaire Design', 15),
(7, 5, 'Bibliothèque Moderne', 15),
(8, 5, 'Étagère Murale', 15),
(9, 5, 'Pouf Rond Salon', 15),
(10, 5, 'Rideaux Salon', 15),
(11, 5, 'Coussin Décoratif', 15),
(12, 5, 'Table d\'Appoint', 15),
(13, 6, 'Réfrigérateur Samsung', 15),
(14, 6, 'Four Encastrable Bosch', 15),
(15, 6, 'Micro-ondes LG', 15),
(16, 6, 'Machine à Café Delonghi', 15),
(17, 6, 'Blender Philips', 15),
(18, 6, 'Grille-Pain Tefal', 15),
(19, 6, 'Bouilloire Électrique', 15),
(20, 6, 'Robot Cuisine Moulinex', 15),
(21, 6, 'Friteuse Air Fryer', 15),
(22, 6, 'Mixeur Plongeant', 15),
(23, 6, 'Set Casseroles Inox', 15),
(24, 6, 'Plaque Induction', 15),
(25, 7, 'Miroir Rond Design', 15),
(26, 7, 'Horloge Murale Moderne', 15),
(27, 7, 'Vase Décoratif', 15),
(28, 7, 'Cadre Photo Élégant', 15),
(29, 7, 'Plante Artificielle', 15),
(30, 7, 'Lampe de Table Moderne', 15),
(31, 7, 'Guirlande LED Décorative', 15),
(32, 7, 'Statue Moderne', 15),
(33, 7, 'Lot de Bougies Parfumées', 15),
(34, 7, 'Panneau Décoratif Mural', 15),
(35, 7, 'lampe murale', 15),
(36, 7, 'Fontaine Intérieure Zen', 15),
(37, 8, 'PS5 Slim', 15),
(38, 8, 'Nintendo Switch 1', 15),
(39, 8, 'PS4 Slim', 15),
(40, 8, 'XBOX ONE', 15),
(41, 8, 'XBOX SERIES X', 15),
(42, 8, 'PS4 PRO', 15),
(43, 8, 'PS5 PRO', 15),
(44, 8, 'Nintendo Switch 2', 15),
(45, 8, 'Nintendo 3DS XL', 15),
(46, 8, 'Nintendo Switch Lite', 15),
(47, 8, 'XBOX SERIES S', 15),
(48, 8, 'Steam Deck', 15),
(49, 9, 'PC MSI Thin 15 B13UDX i5 13è Gén 8G RTX3050', 15),
(50, 9, 'PC ASUS TUF Gaming A15 RYZEN 5 8Go RTX 2050', 15),
(51, 9, 'PC LENOVO LOQ 15IAX9 i5 12è Gén 8G RTX 3050', 15),
(52, 9, 'PC ASUS Vivobook 16X i5 13è Gén 24Go RTX3050', 15),
(53, 9, 'PC HP Victus 15 RYZEN 5 16Go RTX 2050', 15),
(54, 9, 'PC Gigabyte AERO X16 Ryzen AI 7 RTX 5070', 15),
(55, 9, 'PC Dell Alienware 16 Core 5 RTX 3050 / Bleu', 15),
(56, 9, 'PC Lenovo LOQ 15ARP10E Ryzen 5 RTX 3050 / Gris', 15),
(57, 9, 'PC Gigabyte G6KF i7 RTX 4060 / Noir', 15),
(58, 9, 'PC Lenovo Legion 5 i7 RTX 5050 / Noir', 15),
(59, 9, 'PC Gigabyte GAMING A16 Ryzen 7 RTX 5050 / Noir', 15),
(60, 9, 'PC Dell Alienware 16X Ultra 9 RTX 5070 / Bleu', 15),
(61, 10, 'Écouteurs Sans Fil XIAOMI Redmi Buds 6 Play / Noir', 15),
(62, 10, 'Casque Micro Gamer Havit HV-H2232D RGB', 15),
(63, 10, 'Casque Gamer Alastor T-DAGGER T-RGH217-USB', 15),
(64, 10, 'Micro-Casque Gaming Baracuda BGH-011 PEARL RGB / Noir', 15),
(65, 10, 'Casque Gamer T-Wolf RGB', 15),
(66, 10, 'Écouteurs Hama', 15),
(67, 10, 'Casque Micro Gaming Redragon Hylas H260 RGB', 15),
(68, 10, 'Casque Gamer Havic RGB', 15),
(69, 10, 'Casque White Shark PEACOCK GH-2444 RGB / Blanc', 15),
(70, 10, 'Casque Gamer MEETION MT-HP099 / Noir', 15),
(71, 10, 'Casque AQIRYS ALTAIR Filaire / Blanc', 15),
(72, 10, 'Écouteurs Redmi Buds 6 / Blanc', 15),
(73, 11, 'iPhone 17 256GB', 15),
(74, 11, 'Samsung Galaxy S25 256GB', 15),
(75, 11, 'iphone 17 PRO MAX 256GB', 15),
(76, 11, 'Nothing Phone 1 256GB', 15),
(77, 11, 'Samsung A17 5G 128GB', 15),
(78, 11, 'samsung Galaxy S26 Ultra 5G 512GB', 15),
(79, 11, 'Google Pixel 7 126GB', 15),
(80, 11, 'iphone 15 126GB', 15),
(81, 11, 'Xiaomi Redmi 15', 15),
(82, 11, 'Samsung A56 256GB', 15),
(83, 11, 'Google Pixel 10 PRO XL', 15),
(84, 11, 'iphone air 256GB', 15),
(85, 12, 'Apple Watch Series 10', 15),
(86, 12, 'Samsung Galaxy Watch 7', 15),
(87, 12, 'Samsung Galaxy Watch Ultra', 15),
(88, 12, 'Xiaomi Watch S4', 15),
(89, 12, 'Huawei Watch Fit 4', 15),
(90, 12, 'Huawei Watch GT 5', 15),
(91, 12, 'Garmin Venu 3', 15),
(92, 12, 'Amazfit Balance', 15),
(93, 12, 'Redmi Watch 5', 15),
(94, 12, 'OnePlus Watch 3', 15),
(95, 12, 'Google Pixel Watch 3', 15),
(96, 12, 'Honor Watch 5', 15),
(97, 13, 'Power Bank Anker 20000mAh', 15),
(98, 13, 'Chargeur USB-C 65W', 15),
(99, 13, 'Coque iPhone 17', 15),
(100, 13, 'Coque Samsung S25', 15),
(101, 13, 'Clavier Bluetooth Logitech', 15),
(102, 13, 'Souris Logitech MX Master 3', 15),
(103, 13, 'Trépied Smartphone', 15),
(104, 13, 'Support Téléphone Voiture', 15),
(105, 13, 'Batterie MagSafe Apple', 15),
(106, 13, 'Station Charge Sans Fil 3-en-1', 15),
(107, 13, 'Tapis Souris XXL Legion', 15),
(108, 13, 'SSD Externe Samsung T9 1To', 15);

-- --------------------------------------------------------

--
-- Structure de la table `produit_variantes`
--

CREATE TABLE `produit_variantes` (
  `id_variante` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `taille` varchar(10) NOT NULL,
  `couleur` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `produit_variantes`
--

>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226
INSERT INTO `produit_variantes` (`id_variante`, `id_produit`, `taille`, `couleur`, `quantite`) VALUES
(1, 1, 'S', 'Noir', 12),
(2, 1, 'S', 'Blanc', 9),
(3, 1, 'M', 'Noir', 9),
(4, 1, 'M', 'Blanc', 4),
(5, 1, 'M', 'Bleu', 2),
(6, 1, 'L', 'Noir', 8),
(7, 1, 'L', 'Gris', 11),
(8, 1, 'XL', 'Noir', 6),
(9, 1, 'XL', 'Bleu', 5),
(10, 1, 'XXL', 'Noir', 6),
(11, 2, 'S', 'Noir', 11),
(12, 2, 'S', 'Blanc', 5),
(13, 2, 'M', 'Noir', 13),
(14, 2, 'M', 'Blanc', 10),
(15, 2, 'M', 'Bleu', 10),
<<<<<<< HEAD
(16, 2, 'L', 'Noir', 11),
=======
(16, 2, 'L', 'Noir', 13),
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226
(17, 2, 'L', 'Gris', 6),
(18, 2, 'XL', 'Noir', 11),
(19, 2, 'XL', 'Bleu', 3),
(20, 2, 'XXL', 'Noir', 2),
(21, 3, 'S', 'Noir', 11),
(22, 3, 'S', 'Blanc', 12),
(23, 3, 'M', 'Noir', 13),
(24, 3, 'M', 'Blanc', 4),
(25, 3, 'M', 'Bleu', 5),
<<<<<<< HEAD
(26, 3, 'L', 'Noir', 7),
=======
(26, 3, 'L', 'Noir', 8),
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226
(27, 3, 'L', 'Gris', 6),
(28, 3, 'XL', 'Noir', 2),
(29, 3, 'XL', 'Bleu', 2),
(30, 3, 'XXL', 'Noir', 3),
(31, 4, 'S', 'Noir', 8),
(32, 4, 'S', 'Blanc', 6),
(33, 4, 'M', 'Noir', 3),
(34, 4, 'M', 'Blanc', 10),
(35, 4, 'M', 'Bleu', 2),
(36, 4, 'L', 'Noir', 2),
(37, 4, 'L', 'Gris', 13),
(38, 4, 'XL', 'Noir', 11),
(39, 4, 'XL', 'Bleu', 4),
(40, 4, 'XXL', 'Noir', 7),
(41, 5, 'S', 'Noir', 9),
(42, 5, 'S', 'Blanc', 13),
(43, 5, 'M', 'Noir', 11),
(44, 5, 'M', 'Blanc', 2),
(45, 5, 'M', 'Bleu', 12),
<<<<<<< HEAD
(46, 5, 'L', 'Noir', 6),
(47, 5, 'L', 'Gris', 6),
(48, 5, 'XL', 'Noir', 7),
(49, 5, 'XL', 'Bleu', 5),
=======
(46, 5, 'L', 'Noir', 7),
(47, 5, 'L', 'Gris', 6),
(48, 5, 'XL', 'Noir', 7),
(49, 5, 'XL', 'Bleu', 6),
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226
(50, 5, 'XXL', 'Noir', 6),
(51, 6, 'S', 'Noir', 13),
(52, 6, 'S', 'Blanc', 8),
(53, 6, 'M', 'Noir', 12),
(54, 6, 'M', 'Blanc', 9),
(55, 6, 'M', 'Bleu', 10),
(56, 6, 'L', 'Noir', 8),
(57, 6, 'L', 'Gris', 11),
(58, 6, 'XL', 'Noir', 2),
(59, 6, 'XL', 'Bleu', 13),
(60, 6, 'XXL', 'Noir', 10),
(61, 7, 'S', 'Noir', 11),
(62, 7, 'S', 'Blanc', 11),
(63, 7, 'M', 'Noir', 6),
(64, 7, 'M', 'Blanc', 9),
(65, 7, 'M', 'Bleu', 13),
(66, 7, 'L', 'Noir', 13),
(67, 7, 'L', 'Gris', 2),
(68, 7, 'XL', 'Noir', 6),
(69, 7, 'XL', 'Bleu', 8),
(70, 7, 'XXL', 'Noir', 10),
(71, 8, 'S', 'Noir', 2),
(72, 8, 'S', 'Blanc', 12),
(73, 8, 'M', 'Noir', 6),
(74, 8, 'M', 'Blanc', 5),
(75, 8, 'M', 'Bleu', 5),
(76, 8, 'L', 'Noir', 7),
(77, 8, 'L', 'Gris', 7),
(78, 8, 'XL', 'Noir', 11),
(79, 8, 'XL', 'Bleu', 10),
(80, 8, 'XXL', 'Noir', 3),
(81, 9, 'S', 'Noir', 7),
(82, 9, 'S', 'Blanc', 12),
(83, 9, 'M', 'Noir', 4),
(84, 9, 'M', 'Blanc', 6),
(85, 9, 'M', 'Bleu', 2),
(86, 9, 'L', 'Noir', 4),
(87, 9, 'L', 'Gris', 12),
(88, 9, 'XL', 'Noir', 11),
(89, 9, 'XL', 'Bleu', 7),
(90, 9, 'XXL', 'Noir', 9),
(91, 10, 'S', 'Noir', 2),
(92, 10, 'S', 'Blanc', 3),
(93, 10, 'M', 'Noir', 7),
(94, 10, 'M', 'Blanc', 2),
(95, 10, 'M', 'Bleu', 11),
(96, 10, 'L', 'Noir', 10),
(97, 10, 'L', 'Gris', 7),
(98, 10, 'XL', 'Noir', 12),
(99, 10, 'XL', 'Bleu', 2),
(100, 10, 'XXL', 'Noir', 7),
(101, 11, 'S', 'Noir', 4),
(102, 11, 'S', 'Blanc', 12),
(103, 11, 'M', 'Noir', 10),
(104, 11, 'M', 'Blanc', 13),
(105, 11, 'M', 'Bleu', 9),
(106, 11, 'L', 'Noir', 3),
(107, 11, 'L', 'Gris', 12),
(108, 11, 'XL', 'Noir', 13),
(109, 11, 'XL', 'Bleu', 6),
(110, 11, 'XXL', 'Noir', 10),
(111, 12, 'S', 'Noir', 7),
(112, 12, 'S', 'Blanc', 6),
(113, 12, 'M', 'Noir', 6),
(114, 12, 'M', 'Blanc', 11),
(115, 12, 'M', 'Bleu', 11),
(116, 12, 'L', 'Noir', 7),
(117, 12, 'L', 'Gris', 12),
(118, 12, 'XL', 'Noir', 2),
(119, 12, 'XL', 'Bleu', 9),
(120, 12, 'XXL', 'Noir', 12),
(121, 13, 'S', 'Noir', 7),
(122, 13, 'S', 'Blanc', 12),
(123, 13, 'M', 'Noir', 2),
(124, 13, 'M', 'Blanc', 9),
(125, 13, 'M', 'Bleu', 13),
(126, 13, 'L', 'Noir', 12),
(127, 13, 'L', 'Gris', 7),
(128, 13, 'XL', 'Noir', 12),
(129, 13, 'XL', 'Bleu', 10),
(130, 13, 'XXL', 'Noir', 2),
(131, 14, 'S', 'Noir', 2),
(132, 14, 'S', 'Blanc', 13),
(133, 14, 'M', 'Noir', 13),
(134, 14, 'M', 'Blanc', 9),
(135, 14, 'M', 'Bleu', 6),
<<<<<<< HEAD
(136, 14, 'L', 'Noir', 2),
=======
(136, 14, 'L', 'Noir', 3),
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226
(137, 14, 'L', 'Gris', 4),
(138, 14, 'XL', 'Noir', 13),
(139, 14, 'XL', 'Bleu', 3),
(140, 14, 'XXL', 'Noir', 8),
(141, 15, 'S', 'Noir', 9),
(142, 15, 'S', 'Blanc', 6),
(143, 15, 'M', 'Noir', 12),
(144, 15, 'M', 'Blanc', 4),
(145, 15, 'M', 'Bleu', 10),
(146, 15, 'L', 'Noir', 9),
(147, 15, 'L', 'Gris', 4),
(148, 15, 'XL', 'Noir', 4),
(149, 15, 'XL', 'Bleu', 4),
(150, 15, 'XXL', 'Noir', 7),
(151, 16, 'S', 'Noir', 8),
(152, 16, 'S', 'Blanc', 9),
(153, 16, 'M', 'Noir', 6),
(154, 16, 'M', 'Blanc', 11),
(155, 16, 'M', 'Bleu', 3),
(156, 16, 'L', 'Noir', 3),
(157, 16, 'L', 'Gris', 6),
(158, 16, 'XL', 'Noir', 8),
(159, 16, 'XL', 'Bleu', 6),
(160, 16, 'XXL', 'Noir', 8),
(161, 17, 'S', 'Noir', 5),
(162, 17, 'S', 'Blanc', 12),
(163, 17, 'M', 'Noir', 9),
(164, 17, 'M', 'Blanc', 7),
(165, 17, 'M', 'Bleu', 6),
(166, 17, 'L', 'Noir', 10),
(167, 17, 'L', 'Gris', 4),
(168, 17, 'XL', 'Noir', 2),
(169, 17, 'XL', 'Bleu', 7),
(170, 17, 'XXL', 'Noir', 3),
(171, 18, 'S', 'Noir', 6),
(172, 18, 'S', 'Blanc', 9),
(173, 18, 'M', 'Noir', 10),
(174, 18, 'M', 'Blanc', 12),
(175, 18, 'M', 'Bleu', 3),
(176, 18, 'L', 'Noir', 3),
(177, 18, 'L', 'Gris', 2),
(178, 18, 'XL', 'Noir', 13),
(179, 18, 'XL', 'Bleu', 10),
(180, 18, 'XXL', 'Noir', 8),
(181, 19, 'S', 'Noir', 10),
(182, 19, 'S', 'Blanc', 12),
(183, 19, 'M', 'Noir', 6),
(184, 19, 'M', 'Blanc', 5),
(185, 19, 'M', 'Bleu', 2),
(186, 19, 'L', 'Noir', 9),
(187, 19, 'L', 'Gris', 12),
(188, 19, 'XL', 'Noir', 8),
(189, 19, 'XL', 'Bleu', 4),
(190, 19, 'XXL', 'Noir', 6),
(191, 20, 'S', 'Noir', 3),
(192, 20, 'S', 'Blanc', 8),
(193, 20, 'M', 'Noir', 5),
(194, 20, 'M', 'Blanc', 11),
(195, 20, 'M', 'Bleu', 5),
(196, 20, 'L', 'Noir', 13),
(197, 20, 'L', 'Gris', 2),
(198, 20, 'XL', 'Noir', 3),
(199, 20, 'XL', 'Bleu', 10),
(200, 20, 'XXL', 'Noir', 4),
(201, 21, 'S', 'Noir', 11),
(202, 21, 'S', 'Blanc', 7),
(203, 21, 'M', 'Noir', 11),
(204, 21, 'M', 'Blanc', 7),
(205, 21, 'M', 'Bleu', 13),
(206, 21, 'L', 'Noir', 9),
(207, 21, 'L', 'Gris', 4),
(208, 21, 'XL', 'Noir', 13),
(209, 21, 'XL', 'Bleu', 6),
(210, 21, 'XXL', 'Noir', 11),
(211, 22, 'S', 'Noir', 2),
(212, 22, 'S', 'Blanc', 11),
(213, 22, 'M', 'Noir', 9),
(214, 22, 'M', 'Blanc', 2),
(215, 22, 'M', 'Bleu', 3),
(216, 22, 'L', 'Noir', 9),
(217, 22, 'L', 'Gris', 10),
(218, 22, 'XL', 'Noir', 9),
(219, 22, 'XL', 'Bleu', 13),
(220, 22, 'XXL', 'Noir', 13),
(221, 23, 'S', 'Noir', 2),
(222, 23, 'S', 'Blanc', 3),
(223, 23, 'M', 'Noir', 9),
(224, 23, 'M', 'Blanc', 10),
(225, 23, 'M', 'Bleu', 8),
(226, 23, 'L', 'Noir', 11),
(227, 23, 'L', 'Gris', 4),
(228, 23, 'XL', 'Noir', 11),
(229, 23, 'XL', 'Bleu', 6),
(230, 23, 'XXL', 'Noir', 5),
(231, 24, 'S', 'Noir', 5),
(232, 24, 'S', 'Blanc', 9),
(233, 24, 'M', 'Noir', 6),
(234, 24, 'M', 'Blanc', 11),
(235, 24, 'M', 'Bleu', 12),
(236, 24, 'L', 'Noir', 2),
(237, 24, 'L', 'Gris', 8),
(238, 24, 'XL', 'Noir', 7),
(239, 24, 'XL', 'Bleu', 12),
(240, 24, 'XXL', 'Noir', 2),
(241, 25, 'S', 'Noir', 9),
(242, 25, 'S', 'Blanc', 13),
(243, 25, 'M', 'Noir', 2),
(244, 25, 'M', 'Blanc', 4),
(245, 25, 'M', 'Bleu', 2),
(246, 25, 'L', 'Noir', 9),
(247, 25, 'L', 'Gris', 2),
(248, 25, 'XL', 'Noir', 5),
(249, 25, 'XL', 'Bleu', 6),
(250, 25, 'XXL', 'Noir', 13),
(251, 26, 'S', 'Noir', 9),
(252, 26, 'S', 'Blanc', 6),
(253, 26, 'M', 'Noir', 2),
(254, 26, 'M', 'Blanc', 2),
(255, 26, 'M', 'Bleu', 13),
(256, 26, 'L', 'Noir', 12),
(257, 26, 'L', 'Gris', 5),
(258, 26, 'XL', 'Noir', 2),
(259, 26, 'XL', 'Bleu', 5),
(260, 26, 'XXL', 'Noir', 7),
(261, 27, 'S', 'Noir', 3),
(262, 27, 'S', 'Blanc', 7),
(263, 27, 'M', 'Noir', 10),
(264, 27, 'M', 'Blanc', 7),
(265, 27, 'M', 'Bleu', 2),
(266, 27, 'L', 'Noir', 9),
(267, 27, 'L', 'Gris', 5),
(268, 27, 'XL', 'Noir', 7),
(269, 27, 'XL', 'Bleu', 5),
(270, 27, 'XXL', 'Noir', 5),
(271, 28, 'S', 'Noir', 8),
(272, 28, 'S', 'Blanc', 9),
(273, 28, 'M', 'Noir', 11),
(274, 28, 'M', 'Blanc', 13),
(275, 28, 'M', 'Bleu', 5),
(276, 28, 'L', 'Noir', 11),
(277, 28, 'L', 'Gris', 2),
(278, 28, 'XL', 'Noir', 13),
(279, 28, 'XL', 'Bleu', 6),
(280, 28, 'XXL', 'Noir', 4),
(281, 29, 'S', 'Noir', 11),
(282, 29, 'S', 'Blanc', 8),
(283, 29, 'M', 'Noir', 3),
(284, 29, 'M', 'Blanc', 13),
(285, 29, 'M', 'Bleu', 9),
(286, 29, 'L', 'Noir', 4),
(287, 29, 'L', 'Gris', 3),
(288, 29, 'XL', 'Noir', 3),
(289, 29, 'XL', 'Bleu', 5),
(290, 29, 'XXL', 'Noir', 12),
(291, 30, 'S', 'Noir', 9),
(292, 30, 'S', 'Blanc', 8),
(293, 30, 'M', 'Noir', 12),
(294, 30, 'M', 'Blanc', 8),
(295, 30, 'M', 'Bleu', 4),
(296, 30, 'L', 'Noir', 7),
(297, 30, 'L', 'Gris', 11),
(298, 30, 'XL', 'Noir', 6),
(299, 30, 'XL', 'Bleu', 6),
(300, 30, 'XXL', 'Noir', 2),
(301, 31, 'S', 'Noir', 13),
(302, 31, 'S', 'Blanc', 9),
(303, 31, 'M', 'Noir', 4),
(304, 31, 'M', 'Blanc', 5),
(305, 31, 'M', 'Bleu', 11),
(306, 31, 'L', 'Noir', 13),
(307, 31, 'L', 'Gris', 9),
(308, 31, 'XL', 'Noir', 3),
(309, 31, 'XL', 'Bleu', 11),
(310, 31, 'XXL', 'Noir', 8),
(311, 32, 'S', 'Noir', 7),
(312, 32, 'S', 'Blanc', 7),
(313, 32, 'M', 'Noir', 13),
(314, 32, 'M', 'Blanc', 5),
(315, 32, 'M', 'Bleu', 10),
(316, 32, 'L', 'Noir', 8),
(317, 32, 'L', 'Gris', 8),
(318, 32, 'XL', 'Noir', 6),
(319, 32, 'XL', 'Bleu', 13),
(320, 32, 'XXL', 'Noir', 11),
(321, 33, 'S', 'Noir', 4),
(322, 33, 'S', 'Blanc', 9),
(323, 33, 'M', 'Noir', 6),
(324, 33, 'M', 'Blanc', 12),
(325, 33, 'M', 'Bleu', 7),
(326, 33, 'L', 'Noir', 9),
(327, 33, 'L', 'Gris', 10),
(328, 33, 'XL', 'Noir', 10),
(329, 33, 'XL', 'Bleu', 7),
(330, 33, 'XXL', 'Noir', 4),
(331, 34, 'S', 'Noir', 11),
(332, 34, 'S', 'Blanc', 4),
(333, 34, 'M', 'Noir', 8),
(334, 34, 'M', 'Blanc', 4),
(335, 34, 'M', 'Bleu', 8),
(336, 34, 'L', 'Noir', 13),
(337, 34, 'L', 'Gris', 5),
(338, 34, 'XL', 'Noir', 7),
(339, 34, 'XL', 'Bleu', 5),
(340, 34, 'XXL', 'Noir', 5),
(341, 35, 'S', 'Noir', 9),
(342, 35, 'S', 'Blanc', 2),
(343, 35, 'M', 'Noir', 5),
(344, 35, 'M', 'Blanc', 8),
(345, 35, 'M', 'Bleu', 13),
(346, 35, 'L', 'Noir', 12),
(347, 35, 'L', 'Gris', 11),
(348, 35, 'XL', 'Noir', 2),
(349, 35, 'XL', 'Bleu', 13),
(350, 35, 'XXL', 'Noir', 8),
(351, 36, 'S', 'Noir', 12),
(352, 36, 'S', 'Blanc', 11),
(353, 36, 'M', 'Noir', 4),
(354, 36, 'M', 'Blanc', 10),
(355, 36, 'M', 'Bleu', 12),
(356, 36, 'L', 'Noir', 4),
(357, 36, 'L', 'Gris', 9),
(358, 36, 'XL', 'Noir', 8),
(359, 36, 'XL', 'Bleu', 9),
(360, 36, 'XXL', 'Noir', 9),
(361, 37, 'S', 'Noir', 6),
(362, 37, 'S', 'Blanc', 13),
(363, 37, 'M', 'Noir', 9),
(364, 37, 'M', 'Blanc', 4),
(365, 37, 'M', 'Bleu', 6),
(366, 37, 'L', 'Noir', 13),
(367, 37, 'L', 'Gris', 12),
(368, 37, 'XL', 'Noir', 8),
(369, 37, 'XL', 'Bleu', 2),
(370, 37, 'XXL', 'Noir', 9),
(371, 38, 'S', 'Noir', 2),
(372, 38, 'S', 'Blanc', 6),
(373, 38, 'M', 'Noir', 8),
(374, 38, 'M', 'Blanc', 11),
(375, 38, 'M', 'Bleu', 4),
(376, 38, 'L', 'Noir', 11),
(377, 38, 'L', 'Gris', 6),
(378, 38, 'XL', 'Noir', 7),
(379, 38, 'XL', 'Bleu', 5),
(380, 38, 'XXL', 'Noir', 13),
(381, 39, 'S', 'Noir', 12),
(382, 39, 'S', 'Blanc', 9),
(383, 39, 'M', 'Noir', 6),
(384, 39, 'M', 'Blanc', 3),
(385, 39, 'M', 'Bleu', 7),
(386, 39, 'L', 'Noir', 12),
(387, 39, 'L', 'Gris', 13),
(388, 39, 'XL', 'Noir', 4),
(389, 39, 'XL', 'Bleu', 5),
(390, 39, 'XXL', 'Noir', 12),
(391, 40, 'S', 'Noir', 8),
(392, 40, 'S', 'Blanc', 2),
(393, 40, 'M', 'Noir', 10),
(394, 40, 'M', 'Blanc', 6),
(395, 40, 'M', 'Bleu', 9),
(396, 40, 'L', 'Noir', 13),
(397, 40, 'L', 'Gris', 12),
(398, 40, 'XL', 'Noir', 8),
(399, 40, 'XL', 'Bleu', 2),
(400, 40, 'XXL', 'Noir', 9),
(401, 41, 'S', 'Noir', 12),
(402, 41, 'S', 'Blanc', 10),
(403, 41, 'M', 'Noir', 11),
(404, 41, 'M', 'Blanc', 10),
(405, 41, 'M', 'Bleu', 6),
(406, 41, 'L', 'Noir', 10),
(407, 41, 'L', 'Gris', 8),
(408, 41, 'XL', 'Noir', 6),
(409, 41, 'XL', 'Bleu', 6),
(410, 41, 'XXL', 'Noir', 9),
(512, 42, '38', 'Noir', 8),
(513, 43, '38', 'Noir', 2),
(514, 44, '38', 'Noir', 6),
(515, 45, '38', 'Noir', 1),
(516, 46, '38', 'Noir', 3),
(517, 47, '38', 'Noir', 4),
(518, 48, '38', 'Noir', 3),
(519, 49, '38', 'Noir', 3),
(520, 50, '38', 'Noir', 6),
(521, 42, '39', 'Blanc', 2),
(522, 43, '39', 'Blanc', 8),
(523, 44, '39', 'Blanc', 1),
(524, 45, '39', 'Blanc', 5),
(525, 46, '39', 'Blanc', 7),
(526, 47, '39', 'Blanc', 1),
(527, 48, '39', 'Blanc', 6),
(528, 49, '39', 'Blanc', 6),
(529, 50, '39', 'Blanc', 4),
(530, 42, '40', 'Noir', 7),
(531, 43, '40', 'Noir', 8),
(532, 44, '40', 'Noir', 3),
(533, 45, '40', 'Noir', 5),
(534, 46, '40', 'Noir', 8),
(535, 47, '40', 'Noir', 7),
(536, 48, '40', 'Noir', 3),
(537, 49, '40', 'Noir', 8),
(538, 50, '40', 'Noir', 8),
(539, 42, '41', 'Marron', 8),
(540, 43, '41', 'Marron', 1),
(541, 44, '41', 'Marron', 3),
(542, 45, '41', 'Marron', 2),
(543, 46, '41', 'Marron', 8),
(544, 47, '41', 'Marron', 5),
(545, 48, '41', 'Marron', 5),
(546, 49, '41', 'Marron', 2),
(547, 50, '41', 'Marron', 2),
(548, 42, '42', 'Noir', 3),
(549, 43, '42', 'Noir', 3),
(550, 44, '42', 'Noir', 4),
(551, 45, '42', 'Noir', 3),
(552, 46, '42', 'Noir', 3),
(553, 47, '42', 'Noir', 5),
(554, 48, '42', 'Noir', 6),
(555, 49, '42', 'Noir', 1),
(556, 50, '42', 'Noir', 1),
(557, 42, '43', 'Blanc', 3),
(558, 43, '43', 'Blanc', 3),
(559, 44, '43', 'Blanc', 6),
(560, 45, '43', 'Blanc', 5),
(561, 46, '43', 'Blanc', 6),
(562, 47, '43', 'Blanc', 6),
(563, 48, '43', 'Blanc', 2),
(564, 49, '43', 'Blanc', 7),
(565, 50, '43', 'Blanc', 8),
(566, 42, '44', 'Gris', 7),
(567, 43, '44', 'Gris', 5),
(568, 44, '44', 'Gris', 3),
(569, 45, '44', 'Gris', 6),
(570, 46, '44', 'Gris', 5),
(571, 47, '44', 'Gris', 7),
(572, 48, '44', 'Gris', 4),
(573, 49, '44', 'Gris', 5),
(574, 50, '44', 'Gris', 6),
(575, 101, '2 ans', 'Rose', 15),
(576, 101, '2 ans', 'Blanc', 10),
(577, 101, '4 ans', 'Rose', 12),
(578, 101, '4 ans', 'Bleu', 8),
(579, 101, '6 ans', 'Rose', 10),
(580, 101, '6 ans', 'Vert', 6),
(581, 101, '8 ans', 'Rose', 4),
(582, 101, '8 ans', 'Blanc', 7),
(583, 102, '2 ans', 'Jaune', 12),
(584, 102, '4 ans', 'Jaune', 10),
(585, 102, '4 ans', 'Rose', 8),
(586, 102, '6 ans', 'Jaune', 7),
(587, 102, '6 ans', 'Blanc', 5),
(588, 102, '8 ans', 'Jaune', 6),
(589, 103, '4 ans', 'Rose', 10),
(590, 103, '4 ans', 'Bleu', 8),
(591, 103, '6 ans', 'Rose', 9),
(592, 103, '6 ans', 'Violet', 6),
(593, 103, '8 ans', 'Rose', 7),
(594, 103, '10 ans', 'Bleu', 5),
(595, 104, '4 ans', 'Noir', 12),
(596, 104, '4 ans', 'Beige', 8),
(597, 104, '6 ans', 'Noir', 10),
(598, 104, '6 ans', 'Gris', 7),
(599, 104, '8 ans', 'Noir', 9),
(600, 104, '10 ans', 'Beige', 6),
(601, 105, '2 ans', 'Bleu', 8),
(602, 105, '4 ans', 'Bleu', 10),
(603, 105, '4 ans', 'Noir', 6),
(604, 105, '6 ans', 'Bleu', 7),
(605, 105, '8 ans', 'Bleu', 5),
(606, 106, '2 ans', 'Bleu', 10),
(607, 106, '2 ans', 'Gris', 7),
(608, 106, '4 ans', 'Bleu', 8),
(609, 106, '4 ans', 'Vert', 6),
(610, 106, '6 ans', 'Bleu', 9),
(611, 106, '8 ans', 'Gris', 5),
(612, 107, '2 ans', 'Blanc', 10),
(613, 107, '4 ans', 'Blanc', 8),
(614, 107, '6 ans', 'Blanc', 7),
(615, 107, '8 ans', 'Blanc', 5),
(616, 108, '4 ans', 'Noir', 10),
(617, 108, '4 ans', 'Beige', 7),
(618, 108, '6 ans', 'Noir', 8),
(619, 108, '8 ans', 'Beige', 6),
(620, 108, '10 ans', 'Noir', 5),
(621, 109, '0-3 m', 'Rose', 12),
(622, 109, '0-3 m', 'Bleu', 10),
(623, 109, '3-6 m', 'Rose', 9),
(624, 109, '3-6 m', 'Blanc', 8),
(625, 109, '6-12m', 'Rose', 7),
(626, 109, '6-12m', 'Bleu', 6),
(627, 110, '0-3 m', 'Rose', 12),
(628, 110, '0-3 m', 'Blanc', 8),
(629, 110, '3-6 m', 'Rose', 10),
(630, 110, '3-6 m', 'Jaune', 7),
(631, 110, '6-12m', 'Rose', 8),
(632, 111, '0-3 m', 'Blanc', 10),
(633, 111, '3-6 m', 'Blanc', 8),
(634, 111, '3-6 m', 'Beige', 6),
(635, 111, '6-12m', 'Blanc', 7),
(636, 112, '0-3 m', 'Bleu', 12),
(637, 112, '0-3 m', 'Gris', 8),
(638, 112, '3-6 m', 'Bleu', 10),
(639, 112, '6-12m', 'Bleu', 7),
(640, 112, '6-12m', 'Vert', 5),
(641, 113, '2 ans', 'Rose', 6),
(642, 113, '2 ans', 'Bleu', 6),
(643, 113, '4 ans', 'Rose', 5),
(644, 113, '4 ans', 'Bleu', 5),
(645, 113, '6 ans', 'Rose', 4),
(646, 113, '6 ans', 'Bleu', 4),
(647, 114, '16', 'Marron', 10),
(648, 114, '16', 'Noir', 8),
(649, 114, '17', 'Marron', 9),
(650, 114, '17', 'Rose', 7),
(651, 114, '18', 'Marron', 8),
(652, 114, '18', 'Beige', 6);

-- --------------------------------------------------------

--
-- Structure de la table `sous_categories`
--

CREATE TABLE `sous_categories` (
  `id_sous_categorie` int(11) NOT NULL,
  `nom_sous_categorie` varchar(50) NOT NULL,
<<<<<<< HEAD
  `id_categorie` int(11) NOT NULL,
  `icone` varchar(50) DEFAULT 'ti-folder'
=======
  `id_categorie` int(11) NOT NULL
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `sous_categories`
--

<<<<<<< HEAD
INSERT INTO `sous_categories` (`id_sous_categorie`, `nom_sous_categorie`, `id_categorie`, `icone`) VALUES
(1, 'Homme', 1, 'ti-folder'),
(2, 'Femme', 1, 'ti-folder'),
(3, 'Enfant', 1, 'ti-folder'),
(4, 'Chaussures', 1, 'ti-folder'),
(5, 'PC', 2, 'ti-folder'),
(6, 'Consoles', 2, 'ti-folder'),
(7, 'Audio & Casques', 2, 'ti-folder'),
(8, 'Salon', 3, 'ti-folder'),
(9, 'Cuisine', 3, 'ti-folder'),
(10, 'Decoration', 3, 'ti-folder'),
(11, 'Smartphones', 4, 'ti-folder'),
(12, 'Montres Connectees', 4, 'ti-folder'),
(13, 'Accessoires', 4, 'ti-folder');
=======
INSERT INTO `sous_categories` (`id_sous_categorie`, `nom_sous_categorie`, `id_categorie`) VALUES
(1, 'Homme', 1),
(2, 'Femme', 1),
(3, 'Enfant', 1),
(4, 'Chaussures', 1),
(5, 'PC', 2),
(6, 'Consoles', 2),
(7, 'Audio & Casques', 2),
(8, 'Salon', 3),
(9, 'Cuisine', 3),
(10, 'Decoration', 3),
(11, 'Smartphones', 4),
(12, 'Montres Connectees', 4),
(13, 'Accessoires', 4);
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(8) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `date_inscription` datetime DEFAULT current_timestamp(),
  `role` varchar(20) NOT NULL DEFAULT 'client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_utilisateur`, `nom`, `prenom`, `email`, `telephone`, `mot_de_passe`, `date_inscription`, `role`) VALUES
(1, 'Ben Salah', 'Eya', 'eya.bensalah@example.com', '20123456', 'motdepasse123', '2026-06-14 22:20:05', 'client'),
(2, 'Trabelsi', 'Ahmed', 'ahmed.trabelsi@example.com', '21987654', 'azerty123', '2026-06-14 22:20:05', 'client'),
(3, 'Admin', 'Super', 'admin@supermarket.com', '00000000', 'Admin1234', '2026-06-18 11:23:45', 'admin'),
(4, 'adem', 'balbali', 'balbaliadem@gmail.com', '58999753', 'Adem1234', '2026-06-18 11:58:56', 'client'),
(5, 'samer', 'sghaier', 'samersghaier@gmail.com', '98666159', 'samer1234', '2026-06-22 12:13:36', 'client');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `commande_produits`
--
ALTER TABLE `commande_produits`
  ADD PRIMARY KEY (`id_commande_produit`),
  ADD KEY `id_commande` (`id_commande`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `id_sous_categorie` (`id_sous_categorie`);

--
<<<<<<< HEAD
-- Index pour la table `produits_catalogue`
--
ALTER TABLE `produits_catalogue`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `id_sous_categorie` (`id_sous_categorie`);

--
=======
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226
-- Index pour la table `produits_stock`
--
ALTER TABLE `produits_stock`
  ADD PRIMARY KEY (`id_produit`),
  ADD UNIQUE KEY `uq_produit_cat` (`id_sous_categorie`,`nom_produit`);

--
-- Index pour la table `produit_variantes`
--
ALTER TABLE `produit_variantes`
  ADD PRIMARY KEY (`id_variante`),
  ADD UNIQUE KEY `uk_variante` (`id_produit`,`taille`,`couleur`);

--
-- Index pour la table `sous_categories`
--
ALTER TABLE `sous_categories`
  ADD PRIMARY KEY (`id_sous_categorie`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
<<<<<<< HEAD
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
=======
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226

--
-- AUTO_INCREMENT pour la table `commande_produits`
--
ALTER TABLE `commande_produits`
<<<<<<< HEAD
  MODIFY `id_commande_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
=======
  MODIFY `id_commande_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
<<<<<<< HEAD
-- AUTO_INCREMENT pour la table `produits_catalogue`
--
ALTER TABLE `produits_catalogue`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `produits_stock`
--
ALTER TABLE `produits_stock`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
=======
-- AUTO_INCREMENT pour la table `produits_stock`
--
ALTER TABLE `produits_stock`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226

--
-- AUTO_INCREMENT pour la table `produit_variantes`
--
ALTER TABLE `produit_variantes`
  MODIFY `id_variante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=661;

--
-- AUTO_INCREMENT pour la table `sous_categories`
--
ALTER TABLE `sous_categories`
  MODIFY `id_sous_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL;

--
-- Contraintes pour la table `commande_produits`
--
ALTER TABLE `commande_produits`
  ADD CONSTRAINT `1` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`) ON DELETE CASCADE,
  ADD CONSTRAINT `2` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `1` FOREIGN KEY (`id_sous_categorie`) REFERENCES `sous_categories` (`id_sous_categorie`) ON DELETE CASCADE;

--
<<<<<<< HEAD
-- Contraintes pour la table `produits_catalogue`
--
ALTER TABLE `produits_catalogue`
  ADD CONSTRAINT `1` FOREIGN KEY (`id_sous_categorie`) REFERENCES `sous_categories` (`id_sous_categorie`) ON DELETE CASCADE;

--
=======
>>>>>>> 32562a80719a4f4b451bd6cd80e3c8dc7a657226
-- Contraintes pour la table `produit_variantes`
--
ALTER TABLE `produit_variantes`
  ADD CONSTRAINT `1` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sous_categories`
--
ALTER TABLE `sous_categories`
  ADD CONSTRAINT `1` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id_categorie`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
