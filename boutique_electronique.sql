-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 10, 2025 at 06:52 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boutique_electronique`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Table structure for table `panier`
--

CREATE TABLE `panier` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `prix` decimal(10,2) NOT NULL DEFAULT 99.99,
  `image` varchar(255) NOT NULL,
  `categorie` varchar(100) NOT NULL DEFAULT 'Autre',
  `stock` int(11) NOT NULL DEFAULT 10,
  `date_ajout` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `image`, `categorie`, `stock`, `date_ajout`) VALUES
(99, 'Laptop HP 15\"', 'Ordinateur portable HP avec écran 15 pouces et SSD.', 750.00, 'ordinateurs.jpg', 'Ordinateurs', 10, '2025-03-10 04:29:59'),
(100, 'iPad Pro 12.9\"', 'Tablette puissante avec écran Liquid Retina XDR.', 1200.00, 'tablettes.jpg', 'Tablettes', 8, '2025-03-10 04:29:59'),
(101, 'Samsung QLED 65\"', 'Téléviseur 4K QLED avec technologie HDR avancée.', 1500.00, 'televiseurs.jpg', 'Téléviseurs', 5, '2025-03-10 04:29:59'),
(102, 'Clavier Mécanique RGB', 'Clavier gaming avec switches rapides et rétroéclairage.', 99.99, 'accessoires.jpg', 'Accessoires', 15, '2025-03-10 04:29:59'),
(103, 'MacBook Pro M2', 'MacBook Pro avec puce M2 pour des performances élevées.', 1800.00, 'ordinateurs.jpg', 'Ordinateurs', 5, '2025-03-10 04:29:59'),
(104, 'Samsung Galaxy Tab S9', 'Tablette Android avec écran AMOLED et stylet.', 950.00, 'tablettes.jpg', 'Tablettes', 10, '2025-03-10 04:29:59'),
(105, 'LG OLED 55\"', 'Téléviseur OLED avec noirs profonds et Dolby Vision.', 1400.00, 'televiseurs.jpg', 'Téléviseurs', 6, '2025-03-10 04:29:59'),
(106, 'Souris Logitech G502', 'Souris gaming haute précision avec poids ajustables.', 79.99, 'accessoires.jpg', 'Accessoires', 20, '2025-03-10 04:29:59'),
(107, 'Dell XPS 13', 'Ultrabook puissant avec écran tactile haute résolution.', 1400.00, 'ordinateurs.jpg', 'Ordinateurs', 7, '2025-03-10 04:29:59'),
(108, 'Huawei MatePad Pro', 'Tablette avec stylet, écran 2K et design premium.', 850.00, 'tablettes.jpg', 'Tablettes', 12, '2025-03-10 04:29:59'),
(109, 'Sony Bravia XR', 'Téléviseur OLED 4K avec intelligence artificielle.', 1800.00, 'televiseurs.jpg', 'Téléviseurs', 4, '2025-03-10 04:29:59'),
(110, 'Casque Bluetooth Bose', 'Casque sans fil avec réduction de bruit active.', 299.00, 'accessoires.jpg', 'Accessoires', 14, '2025-03-10 04:29:59'),
(111, 'Acer Aspire 5', 'PC portable polyvalent avec écran Full HD et SSD rapide.', 600.00, 'ordinateurs.jpg', 'Ordinateurs', 12, '2025-03-10 04:29:59'),
(112, 'Lenovo Tab M10', 'Tablette familiale avec écran HD et double haut-parleur.', 250.00, 'tablettes.jpg', 'Tablettes', 15, '2025-03-10 04:29:59'),
(113, 'Philips Ambilight', 'Téléviseur LED 4K avec éclairage Ambilight intégré.', 1200.00, 'televiseurs.jpg', 'Téléviseurs', 9, '2025-03-10 04:29:59'),
(114, 'Webcam Logitech C920', 'Webcam HD pour appels vidéo et streaming.', 110.00, 'accessoires.jpg', 'Accessoires', 25, '2025-03-10 04:29:59'),
(115, 'Asus ROG Zephyrus', 'Ordinateur portable gamer avec RTX et écran 144 Hz.', 2000.00, 'ordinateurs.jpg', 'Ordinateurs', 6, '2025-03-10 04:29:59'),
(116, 'Microsoft Surface', 'Surface Laptop élégant avec écran tactile et stylet.', 1300.00, 'ordinateurs.jpg', 'Ordinateurs', 10, '2025-03-10 04:29:59'),
(117, 'Galaxy Tab A8', 'Tablette économique avec écran large et Android 12.', 320.00, 'tablettes.jpg', 'Tablettes', 18, '2025-03-10 04:29:59'),
(118, 'TCL Mini-LED 75\"', 'Téléviseur 8K avec mini-LED et Dolby Vision.', 2200.00, 'televiseurs.jpg', 'Téléviseurs', 3, '2025-03-10 04:29:59'),
(119, 'Clavier sans fil Apple', 'Clavier Magic Keyboard avec rétroéclairage.', 150.00, 'accessoires.jpg', 'Accessoires', 20, '2025-03-10 04:29:59'),
(120, 'PC Gamer Ryzen', 'PC gaming puissant avec processeur Ryzen et RTX.', 2200.00, 'ordinateurs.jpg', 'Ordinateurs', 4, '2025-03-10 04:29:59'),
(121, 'HP Pavilion x360', 'Convertible 2-en-1 avec écran tactile et processeur i7.', 900.00, 'ordinateurs.jpg', 'Ordinateurs', 9, '2025-03-10 04:29:59'),
(122, 'iPad Mini 6', 'Petite tablette Apple avec processeur A15 Bionic.', 600.00, 'tablettes.jpg', 'Tablettes', 11, '2025-03-10 04:29:59'),
(123, 'Samsung Neo QLED 8K', 'Téléviseur 8K avec Quantum HDR et taux de rafraîch.', 3500.00, 'televiseurs.jpg', 'Téléviseurs', 2, '2025-03-10 04:29:59'),
(124, 'Disque SSD 1TB', 'Disque SSD rapide pour stockage et gaming.', 130.00, 'accessoires.jpg', 'Accessoires', 22, '2025-03-10 04:29:59'),
(125, 'Mac Mini M2', 'Mini ordinateur Apple performant avec puce M2.', 1200.00, 'ordinateurs.jpg', 'Ordinateurs', 5, '2025-03-10 04:29:59'),
(126, 'Lenovo IdeaPad 3', 'PC portable abordable avec SSD et écran Full HD.', 500.00, 'ordinateurs.jpg', 'Ordinateurs', 15, '2025-03-10 04:29:59'),
(127, 'Huawei MediaPad T5', 'Tablette 10\" Full HD avec son stéréo.', 300.00, 'tablettes.jpg', 'Tablettes', 13, '2025-03-10 04:29:59'),
(128, 'Sony 8K Master Series', 'Téléviseur ultra-haute résolution 8K HDR.', 5000.00, 'televiseurs.jpg', 'Téléviseurs', 1, '2025-03-10 04:29:59'),
(129, 'Souris sans fil MX Master', 'Souris ergonomique pour productivité maximale.', 120.00, 'accessoires.jpg', 'Accessoires', 30, '2025-03-10 04:29:59'),
(130, 'Dell Inspiron 15', 'PC portable bureautique avec autonomie longue durée.', 650.00, 'ordinateurs.jpg', 'Ordinateurs', 12, '2025-03-10 04:29:59'),
(131, 'MSI Stealth 15', 'Ordinateur gaming ultra-fin avec écran 240 Hz.', 2100.00, 'ordinateurs.jpg', 'Ordinateurs', 6, '2025-03-10 04:29:59'),
(132, 'Samsung Galaxy Tab S6', 'Tablette avec écran Super AMOLED et stylet.', 700.00, 'tablettes.jpg', 'Tablettes', 12, '2025-03-10 04:29:59'),
(133, 'LG NanoCell 75\"', 'Téléviseur 4K avec technologie NanoCell.', 1800.00, 'televiseurs.jpg', 'Téléviseurs', 7, '2025-03-10 04:29:59'),
(134, 'Micro-casque gaming Razer', 'Casque avec micro pour jeux en ligne.', 90.00, 'accessoires.jpg', 'Accessoires', 17, '2025-03-10 04:29:59'),
(135, 'iPhone 14', 'Smartphone Apple avec écran OLED et puce A15 Bionic.', 999.00, 'telephones.jpg', 'Téléphones', 10, '2025-03-10 04:53:05'),
(136, 'Samsung Galaxy S23', 'Smartphone Android avec écran AMOLED et processeur Snapdragon.', 950.00, 'telephones.jpg', 'Téléphones', 15, '2025-03-10 04:53:05'),
(137, 'Google Pixel 7', 'Smartphone Android avec caméra ultra-performante et stockages rapides.', 899.00, 'telephones.jpg', 'Téléphones', 12, '2025-03-10 04:53:05'),
(138, 'OnePlus 11', 'Smartphone OnePlus avec écran Fluid AMOLED et batterie longue durée.', 800.00, 'telephones.jpg', 'Téléphones', 14, '2025-03-10 04:53:05'),
(139, 'Xiaomi Mi 13', 'Smartphone Xiaomi avec caméra Leica et processeur Snapdragon.', 850.00, 'telephones.jpg', 'Téléphones', 18, '2025-03-10 04:53:05'),
(140, 'Samsung Galaxy Z Flip 5', 'Smartphone pliable avec écran AMOLED et design unique.', 1300.00, 'telephones.jpg', 'Téléphones', 8, '2025-03-10 04:53:05'),
(141, 'Oppo Find X5 Pro', 'Smartphone avec écran AMOLED 120Hz et caméra 50MP.', 1000.00, 'telephones.jpg', 'Téléphones', 10, '2025-03-10 04:53:05'),
(142, 'Sony Xperia 1 IV', 'Smartphone avec écran 4K HDR et caméra professionnelle.', 1200.00, 'telephones.jpg', 'Téléphones', 7, '2025-03-10 04:53:05'),
(143, 'Huawei P50 Pro', 'Smartphone Huawei avec caméra Leica et écran OLED incurvé.', 1100.00, 'telephones.jpg', 'Téléphones', 9, '2025-03-10 04:53:05'),
(144, 'Motorola Edge 30', 'Smartphone Motorola avec écran OLED 144Hz et 5G.', 750.00, 'telephones.jpg', 'Téléphones', 12, '2025-03-10 04:53:05'),
(145, 'iPhone 13 Pro Max', 'Smartphone Apple avec écran Super Retina XDR et 5G.', 1099.00, 'telephones.jpg', 'Téléphones', 11, '2025-03-10 04:53:05'),
(146, 'Samsung Galaxy A54', 'Smartphone Android avec caméra 50MP et écran Super AMOLED.', 400.00, 'telephones.jpg', 'Téléphones', 20, '2025-03-10 04:53:05'),
(147, 'Realme GT 2 Pro', 'Smartphone Android avec processeur Snapdragon 8 Gen 1 et écran AMOLED.', 800.00, 'telephones.jpg', 'Téléphones', 16, '2025-03-10 04:53:05'),
(148, 'Google Pixel 6a', 'Smartphone Google avec caméra Google Tensor et Google Assistant.', 450.00, 'telephones.jpg', 'Téléphones', 17, '2025-03-10 04:53:05'),
(149, 'Nokia G50', 'Smartphone Nokia avec 5G et batterie 5000mAh.', 300.00, 'telephones.jpg', 'Téléphones', 25, '2025-03-10 04:53:05'),
(150, 'Asus ZenFone 9', 'Smartphone Asus avec écran AMOLED et processeur Snapdragon 8 Gen 1.', 850.00, 'telephones.jpg', 'Téléphones', 14, '2025-03-10 04:53:05'),
(151, 'Samsung Galaxy S21 FE', 'Smartphone avec écran 120Hz et processeur Exynos.', 699.00, 'telephones.jpg', 'Téléphones', 10, '2025-03-10 04:53:05'),
(152, 'iPhone SE 3', 'Smartphone Apple compact avec puce A15 Bionic.', 429.00, 'telephones.jpg', 'Téléphones', 22, '2025-03-10 04:53:05'),
(153, 'Poco X4 Pro 5G', 'Smartphone avec écran AMOLED et caméra 108MP.', 350.00, 'telephones.jpg', 'Téléphones', 18, '2025-03-10 04:53:05'),
(154, 'Vivo V23 5G', 'Smartphone avec caméra 50MP et écran AMOLED.', 600.00, 'telephones.jpg', 'Téléphones', 20, '2025-03-10 04:53:05'),
(155, 'Honor Magic 4', 'Smartphone Honor avec écran OLED et processeur Snapdragon.', 900.00, 'telephones.jpg', 'Téléphones', 8, '2025-03-10 04:53:05'),
(156, 'Realme 9 Pro+', 'Smartphone avec écran AMOLED et caméra Sony IMX766.', 400.00, 'telephones.jpg', 'Téléphones', 15, '2025-03-10 04:53:05'),
(157, 'Redmi Note 12', 'Smartphone avec écran AMOLED 90Hz et processeur MediaTek.', 250.00, 'telephones.jpg', 'Téléphones', 30, '2025-03-10 04:53:05'),
(158, 'iPhone 12', 'Smartphone Apple avec écran OLED et caméra 12MP.', 749.00, 'telephones.jpg', 'Téléphones', 14, '2025-03-10 04:53:05'),
(159, 'Samsung Galaxy Z Fold 4', 'Smartphone pliable avec écran Dynamic AMOLED 2X.', 1800.00, 'telephones.jpg', 'Téléphones', 6, '2025-03-10 04:53:05'),
(160, 'LG Velvet', 'Smartphone LG avec écran OLED et caméra 48MP.', 400.00, 'telephones.jpg', 'Téléphones', 11, '2025-03-10 04:53:05'),
(161, 'Xiaomi Redmi Note 10', 'Smartphone avec écran AMOLED et batterie 48MP.', 250.00, 'telephones.jpg', 'Téléphones', 20, '2025-03-10 04:53:05'),
(162, 'Oppo Reno 8 Pro', 'Smartphone Oppo avec caméra 50MP et écran AMOLED.', 650.00, 'telephones.jpg', 'Téléphones', 12, '2025-03-10 04:53:05'),
(163, 'Motorola Edge 20', 'Smartphone avec caméra 108MP et écran OLED.', 700.00, 'telephones.jpg', 'Téléphones', 10, '2025-03-10 04:53:05'),
(164, 'iPhone 11', 'Smartphone Apple avec écran Liquid Retina et processeur A13 Bionic.', 649.00, 'telephones.jpg', 'Téléphones', 18, '2025-03-10 04:53:05'),
(165, 'OnePlus Nord 2', 'Smartphone avec caméra 50MP et écran AMOLED.', 500.00, 'telephones.jpg', 'Téléphones', 22, '2025-03-10 04:53:05'),
(166, 'Huawei Nova 9', 'Smartphone Huawei avec écran AMOLED et caméra 50MP.', 450.00, 'telephones.jpg', 'Téléphones', 14, '2025-03-10 04:53:05'),
(167, 'Xiaomi Mi 11', 'Smartphone Xiaomi avec écran AMOLED et Snapdragon 888.', 850.00, 'telephones.jpg', 'Téléphones', 9, '2025-03-10 04:53:05'),
(168, 'Google Pixel 5', 'Smartphone Google avec caméra grand angle et 5G.', 700.00, 'telephones.jpg', 'Téléphones', 13, '2025-03-10 04:53:05'),
(169, 'Sony Xperia 10 III', 'Smartphone avec écran OLED et triple caméra.', 400.00, 'telephones.jpg', 'Téléphones', 10, '2025-03-10 04:53:05'),
(170, 'Samsung Galaxy A32', 'Smartphone avec écran AMOLED et caméra 64MP.', 300.00, 'telephones.jpg', 'Téléphones', 19, '2025-03-10 04:53:05'),
(171, 'Realme Narzo 50', 'Smartphone avec batterie 5000mAh et écran 90Hz.', 200.00, 'telephones.jpg', 'Téléphones', 25, '2025-03-10 04:53:05'),
(172, 'iPhone 8', 'Smartphone Apple avec écran Retina et puce A11 Bionic.', 399.00, 'telephones.jpg', 'Téléphones', 16, '2025-03-10 04:53:05'),
(173, 'Nokia X20', 'Smartphone Nokia avec 5G et caméra 64MP.', 400.00, 'telephones.jpg', 'Téléphones', 8, '2025-03-10 04:53:05'),
(174, 'Samsung Galaxy A73 5G', 'Smartphone avec écran Super AMOLED et 5G.', 500.00, 'telephones.jpg', 'Téléphones', 12, '2025-03-10 04:53:05'),
(175, 'Motorola Moto G100', 'Smartphone avec écran 90Hz et processeur Snapdragon.', 550.00, 'telephones.jpg', 'Téléphones', 11, '2025-03-10 04:53:05'),
(176, 'Poco M4 Pro', 'Smartphone avec écran AMOLED et processeur MediaTek.', 250.00, 'telephones.jpg', 'Téléphones', 22, '2025-03-10 04:53:05'),
(177, 'Asus ROG Phone 6', 'Smartphone gaming avec écran AMOLED et processeur Snapdragon 8 Gen 1.', 999.00, 'telephones.jpg', 'Téléphones', 6, '2025-03-10 04:53:05'),
(178, 'Vivo Y21', 'Smartphone avec écran LCD et batterie 5000mAh.', 200.00, 'telephones.jpg', 'Téléphones', 18, '2025-03-10 04:53:05'),
(179, 'iPhone XR', 'Smartphone Apple avec écran Liquid Retina et puce A12 Bionic.', 499.00, 'telephones.jpg', 'Téléphones', 20, '2025-03-10 04:53:05'),
(180, 'Samsung Galaxy A03', 'Smartphone avec écran LCD et caméra 48MP.', 150.00, 'telephones.jpg', 'Téléphones', 30, '2025-03-10 04:53:05'),
(181, 'Redmi Note 11 Pro', 'Smartphone avec écran AMOLED 120Hz et caméra 108MP.', 350.00, 'telephones.jpg', 'Téléphones', 17, '2025-03-10 04:53:05'),
(182, 'OnePlus 9 Pro', 'Smartphone OnePlus avec écran AMOLED 120Hz et caméra Hasselblad.', 1069.00, 'telephones.jpg', 'Téléphones', 9, '2025-03-10 04:53:05'),
(183, 'iPhone 7', 'Smartphone Apple avec écran Retina HD et puce A10 Fusion.', 349.00, 'telephones.jpg', 'Téléphones', 24, '2025-03-10 04:53:05'),
(184, 'Xiaomi Poco F3', 'Smartphone avec processeur Snapdragon 870 et écran AMOLED.', 500.00, 'telephones.jpg', 'Téléphones', 15, '2025-03-10 04:53:05'),
(185, 'Huawei P40 Pro', 'Smartphone avec écran OLED et caméra Leica.', 1000.00, 'telephones.jpg', 'Téléphones', 8, '2025-03-10 04:53:05'),
(186, 'Realme GT Master Edition', 'Smartphone avec écran AMOLED 120Hz et processeur Snapdragon.', 450.00, 'telephones.jpg', 'Téléphones', 13, '2025-03-10 04:53:05'),
(187, 'iPhone 6S', 'Smartphone Apple avec écran Retina et processeur A9.', 300.00, 'telephones.jpg', 'Téléphones', 19, '2025-03-10 04:53:05'),
(188, 'Samsung Galaxy A52s', 'Smartphone avec écran Super AMOLED et processeur Snapdragon.', 400.00, 'telephones.jpg', 'Téléphones', 16, '2025-03-10 04:53:05'),
(189, 'OnePlus 8T', 'Smartphone avec écran AMOLED 120Hz et charge rapide 65W.', 749.00, 'telephones.jpg', 'Téléphones', 7, '2025-03-10 04:53:05'),
(190, 'Xiaomi Mi 9', 'Smartphone avec caméra 48MP et processeur Snapdragon 855.', 300.00, 'telephones.jpg', 'Téléphones', 18, '2025-03-10 04:53:05'),
(191, 'Nokia 7.2', 'Smartphone avec caméra 48MP et Android One.', 300.00, 'telephones.jpg', 'Téléphones', 10, '2025-03-10 04:53:05'),
(192, 'Google Pixel 4a', 'Smartphone Google avec caméra 12.2MP et écran OLED.', 350.00, 'telephones.jpg', 'Téléphones', 16, '2025-03-10 04:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `panier_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `produits` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
