-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 19 août 2021 à 14:24
-- Version du serveur : 10.4.19-MariaDB
-- Version de PHP : 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `utilisateur_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`utilisateur_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `adresse_client`
--

CREATE TABLE `adresse_client` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_utilisateur_id` int(10) UNSIGNED NOT NULL,
  `numero` smallint(5) UNSIGNED DEFAULT NULL,
  `type_de_voie` varchar(32) DEFAULT NULL,
  `nom_de_voie` varchar(255) DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `code_postal` smallint(5) UNSIGNED NOT NULL,
  `ville` varchar(255) NOT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `principale` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `adresse_client`
--

INSERT INTO `adresse_client` (`id`, `client_utilisateur_id`, `numero`, `type_de_voie`, `nom_de_voie`, `complement`, `code_postal`, `ville`, `longitude`, `latitude`, `principale`) VALUES
(1, 5, 4, 'chemin', 'des Espigoules', NULL, 13390, 'Auriol', '4.564219', '45.598764', 1),
(2, 6, 125, 'quartier', 'Notre Dame de bon voyage', NULL, 13390, 'Auriol', '5.846975', '44.136245', 1),
(3, 7, 58, 'boulevard', 'de la métallurgie', NULL, 13390, 'Pont de Joux', '4.895620', '46.235690', 1),
(4, 8, 2, 'avenue', 'de la paix', NULL, 13390, 'Auriol', '4.563210', '45.365980', 1),
(5, 9, 34, 'impasse', 'de la création', NULL, 13390, 'Moulin de Redon', '4.235640', '45.231540', 1),
(6, 10, 81, 'traverse', 'de la défaite', NULL, 13390, 'Auriol', '4.879650', '45.216450', 1),
(7, 11, 1986, 'rue', 'des nuages', NULL, 13390, 'Pont de Joux', '4.854620', '46.495690', 1),
(8, 12, 3, 'boucle', 'des ardoisières', NULL, 13390, 'Auriol', '5.213650', '44.215465', 1),
(9, 5, NULL, 'quartier', 'Notre Dame', NULL, 13390, 'Auriol', '4.563210', '5.648945', 0);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `utilisateur_id` int(10) UNSIGNED NOT NULL,
  `telephone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`utilisateur_id`, `telephone`) VALUES
(5, '0442789546'),
(6, '0492230723'),
(7, '0442542136'),
(8, '0442846597'),
(9, '0442136458'),
(10, '0442451398'),
(11, '0442411311'),
(12, '0442446185');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_utilisateur_id` int(10) UNSIGNED NOT NULL,
  `reglement_id` int(10) UNSIGNED NOT NULL,
  `adresse_client_id` int(10) UNSIGNED NOT NULL,
  `heure_prise_en_charge` datetime DEFAULT NULL,
  `heure_remise_client` datetime DEFAULT NULL,
  `livreur_utilisateur_id` int(10) UNSIGNED DEFAULT NULL,
  `statut_commande_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `client_utilisateur_id`, `reglement_id`, `adresse_client_id`, `heure_prise_en_charge`, `heure_remise_client`, `livreur_utilisateur_id`, `statut_commande_id`) VALUES
(1, 6, 1, 2, '2021-08-09 11:45:58', '2021-08-09 11:59:25', 2, 3),
(2, 5, 2, 1, '2021-08-09 11:53:18', '2021-08-09 12:17:01', 2, 3),
(3, 5, 3, 9, '2021-08-10 11:35:18', '2021-08-10 12:08:33', 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `cuisinier`
--

CREATE TABLE `cuisinier` (
  `utilisateur_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cuisinier`
--

INSERT INTO `cuisinier` (`utilisateur_id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Structure de la table `fiche_produit`
--

CREATE TABLE `fiche_produit` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `type_produit_id` tinyint(3) UNSIGNED NOT NULL,
  `nom` varchar(32) NOT NULL,
  `img_file_path` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `recette` text DEFAULT NULL,
  `prix` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fiche_produit`
--

INSERT INTO `fiche_produit` (`id`, `type_produit_id`, `nom`, `img_file_path`, `description`, `recette`, `prix`) VALUES
(1, 1, 'Boeuf bourguigon', '/path/to/file/prod001.jpg', 'Le bœuf bourguignon est composé de morceaux de viande de bœuf, cuits à la cocotte dans une sauce bourguignonne, à base de vin rouge, avec une garniture aromatique.', NULL, '7.50'),
(2, 1, 'Langoustines gratinées', '/path/to/file/prod002.jpg', 'Langoustines du bassin méditéranéen gratinées, beurre, ail, accompagnée de riz pilaf', NULL, '7.50'),
(3, 1, 'Liguini alle vongole', '/path/to/file/prod003.jpg', 'Recette traditionelle napolitaine de pates accompagnées de palourdes, piments, tomates cerises confites et aromates', NULL, '7.50'),
(4, 1, 'Paela negra', '/path/to/file/prod004.jpg', 'Paela et encre de seiche, recette typique de catalogne qui vous fera oublier la traditionnelle valanciana', NULL, '7.50'),
(5, 1, 'Canard à la périgourdine', '/path/to/file/prod005.jpg', 'Confit de canard du périgord, agrémenté de foie gras et truffes, accompagné de pommes de terre façon landaise', NULL, '7.50'),
(6, 1, 'Pavé de Saumon', '/path/to/file/prod006.jpg', 'Pavé de saumon cuit à l\'unilatérale, assaisonné ,d\'anteh et zests de citron, accompagné d\'un riz au fenoil', NULL, '7.50'),
(7, 1, 'Hampe de boeuf grillée', '/path/to/file/prod007.jpg', 'Pièce de boeuf de 280gr, saisie au grill, accompagnée de légumes du jour', NULL, '7.50'),
(8, 1, 'Fish and Chips', '/path/to/file/prod008.jpg', 'L\'incontournable de la cuisine de rue britanique, poisson pané à l\'anglaise accompagné de frites', NULL, '7.50'),
(9, 1, 'Raviolis fungi e ricotta', '/path/to/file/prod009.jpg', 'Gros raviollis aux cèpes, girolles et ricotta AOP de Lombardie', NULL, '7.50'),
(10, 1, 'Calamars farcis', '/path/to/file/prod010.jpg', 'Recette méridionnale de calamars farcis aux trois viandes et pignons de pin, accompagnés de riz pilaf', NULL, '7.50'),
(11, 1, 'Salade César', '/path/to/file/prod011.jpg', 'La traditionnalle sallade César, reine de la cuisine de bistrot', NULL, '7.50'),
(12, 1, 'Porc laqué', '/path/to/file/prod012.jpg', 'Recette de porc laqué au miel, accompagné de riz cantonais', NULL, '7.50'),
(13, 1, 'Couscous royal', '/path/to/file/prod013.jpg', 'On ne le présente plus: le couscous royal revisité par nos chefs', NULL, '7.50'),
(14, 1, 'Tielle Sétoise', '/path/to/file/prod0014.jpg', 'Tielle sétoise à la seiche et au pimenbt, accompagnée d\'éépautre et blé bio', NULL, '7.50'),
(15, 2, 'Cheescake au mures', '/path/to/file/prod015.jpg', 'Variante du célèbre dessert américain, réalisé avec des mures bio de Provence', NULL, '3.50'),
(16, 2, 'Panacota', '/path/to/file/prod016.jpg', 'Incontournable dessert italien', NULL, '3.50'),
(17, 2, 'Tartelette alpine', '/path/to/file/prod017.jpg', 'Dessert traditionnel du sud des ales françaises, réalisé avec des mirtilles bio des Hautes Alpes', NULL, '3.50'),
(18, 2, 'Tartellete citron meringuée', '/path/to/file/prod018.jpg', 'Le grand classique de tratorias italiennes revisité par nos chefs', NULL, '3.50'),
(19, 2, 'Crème brulée', '/path/to/file/prod019.jpg', 'On ne présente plus ce dessert de la cuisine bistrot', NULL, '3.50'),
(20, 2, 'Fondant au chocolat', '/path/to/file/prod020.jpg', 'Fondant au chocolat issu de cacao bio du Guatémala', NULL, '3.50'),
(21, 2, 'Salade de fruits', '/path/to/file/prod021.jpg', 'Salade de fruits du jour bio, préparée dans nos ateliers', NULL, '3.50'),
(22, 2, 'Tiramissu', '/path/to/file/prod022.jpg', 'Grand classique revisité par notre chef patissier', NULL, '3.50'),
(23, 2, 'Tarte amandine', '/path/to/file/prod023.jpg', 'Tarte amandine aux poires bio de Provence', NULL, '3.50'),
(24, 2, 'Ile flottante', '/path/to/file/prod024.jpg', 'L\'incontournable de notre enfance... réalisé entièrement à partir d\'ingrédients bio', NULL, '3.50'),
(25, 2, 'salade de melon et pastèque', '/path/to/file/prod025.jpg', 'Salade fraiche de melons bio de Charaente et pastèque bio de Sicile', NULL, '3.50'),
(26, 2, 'Poire belle hélène', '/path/to/file/prod026.jpg', 'Poire bio de provence, pochée dans un vin bio aux épices et nappée de chocolat noir', NULL, '3.50'),
(27, 2, 'Eclairs café et chocolat', '/path/to/file/prod027.jpg', 'Deux petits éclairs patissiers, un au café, l\'autre au chocolat', NULL, '3.50'),
(28, 2, 'Tartelette frangipane', '/path/to/file/prod028.jpg', 'Classique de la cuisine provençale, la tartelette frangipane est réalié à partir d\'amandes bio du Lubéron', NULL, '3.50');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `id` int(10) UNSIGNED NOT NULL,
  `commande_id` int(10) UNSIGNED NOT NULL,
  `quantite` smallint(6) NOT NULL,
  `fiche_produit_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id`, `commande_id`, `quantite`, `fiche_produit_id`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 15),
(3, 2, 1, 2),
(4, 2, 1, 15),
(5, 2, 1, 16),
(6, 3, 1, 3),
(7, 3, 1, 4),
(8, 3, 2, 17);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_menu_du_jour`
--

CREATE TABLE `ligne_menu_du_jour` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `fiche_produit_id` smallint(5) UNSIGNED NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ligne_menu_du_jour`
--

INSERT INTO `ligne_menu_du_jour` (`id`, `fiche_produit_id`, `date`) VALUES
(1, 1, '2021-08-09'),
(2, 2, '2021-08-09'),
(3, 15, '2021-08-09'),
(4, 16, '2021-08-09'),
(5, 3, '2021-08-10'),
(6, 4, '2021-08-10'),
(7, 17, '2021-08-10'),
(8, 18, '2021-08-10'),
(9, 5, '2021-08-11'),
(10, 6, '2021-08-11'),
(11, 15, '2021-08-11'),
(12, 20, '2021-08-11'),
(13, 7, '2021-08-12'),
(14, 8, '2021-08-12'),
(15, 21, '2021-08-12'),
(16, 22, '2021-08-12'),
(17, 9, '2021-08-13'),
(18, 10, '2021-08-13'),
(19, 23, '2021-08-13'),
(20, 24, '2021-08-13'),
(21, 11, '2021-08-16'),
(22, 12, '2021-08-16'),
(23, 25, '2021-08-16'),
(24, 26, '2021-08-16'),
(25, 13, '2021-08-17'),
(26, 14, '2021-08-17'),
(27, 27, '2021-08-17'),
(28, 28, '2021-08-17'),
(29, 1, '2021-08-18'),
(30, 3, '2021-08-18'),
(31, 15, '2021-08-18'),
(32, 16, '2021-08-18'),
(33, 5, '2021-08-19'),
(34, 7, '2021-08-19'),
(35, 17, '2021-08-19'),
(36, 18, '2021-08-19'),
(37, 9, '2021-08-20'),
(38, 11, '2021-08-20'),
(39, 19, '2021-08-20'),
(40, 20, '2021-08-20'),
(41, 13, '2021-08-23'),
(42, 14, '2021-08-23'),
(43, 21, '2021-08-23'),
(44, 22, '2021-08-23'),
(45, 2, '2021-08-24'),
(46, 4, '2021-08-24'),
(47, 23, '2021-08-24'),
(48, 24, '2021-08-24'),
(49, 6, '2021-08-25'),
(50, 8, '2021-08-25'),
(51, 25, '2021-08-25'),
(52, 26, '2021-08-25'),
(53, 10, '2021-08-26'),
(54, 12, '2021-08-26'),
(55, 27, '2021-08-26'),
(56, 28, '2021-08-26'),
(57, 1, '2021-08-27'),
(58, 2, '2021-08-27'),
(59, 15, '2021-08-27'),
(60, 16, '2021-08-27'),
(61, 3, '2021-08-30'),
(62, 4, '2021-08-30'),
(63, 17, '2021-08-30'),
(64, 18, '2021-08-30'),
(65, 5, '2021-08-31'),
(66, 6, '2021-08-31'),
(67, 19, '2021-08-31'),
(68, 20, '2021-08-31'),
(69, 5, '2021-09-01'),
(70, 8, '2021-09-01'),
(71, 21, '2021-09-01'),
(72, 22, '2021-09-01'),
(73, 9, '2021-09-02'),
(74, 10, '2021-09-02'),
(75, 23, '2021-09-02'),
(76, 24, '2021-09-02'),
(77, 11, '2021-09-03'),
(78, 12, '2021-09-03'),
(79, 25, '2021-09-03'),
(80, 26, '2021-09-03'),
(81, 13, '2021-09-06'),
(82, 14, '2021-09-06'),
(83, 27, '2021-09-06'),
(84, 28, '2021-09-06'),
(85, 1, '2021-09-07'),
(86, 3, '2021-09-07'),
(87, 15, '2021-09-07'),
(88, 16, '2021-09-07'),
(89, 5, '2021-09-08'),
(90, 5, '2021-09-08'),
(91, 17, '2021-09-08'),
(92, 18, '2021-09-08'),
(93, 9, '2021-09-09'),
(94, 11, '2021-09-09'),
(95, 19, '2021-09-09'),
(96, 20, '2021-09-09'),
(97, 13, '2021-09-10'),
(98, 14, '2021-09-10'),
(99, 21, '2021-09-10'),
(100, 22, '2021-09-10'),
(101, 2, '2021-09-12'),
(102, 4, '2021-09-12'),
(103, 23, '2021-09-12'),
(104, 24, '2021-09-12'),
(105, 6, '2021-09-13'),
(106, 8, '2021-09-13'),
(107, 25, '2021-09-13'),
(108, 26, '2021-09-13'),
(109, 10, '2021-09-14'),
(110, 12, '2021-09-14'),
(111, 27, '2021-09-14'),
(112, 28, '2021-09-14'),
(113, 1, '2021-09-15'),
(114, 2, '2021-09-15'),
(115, 15, '2021-09-15'),
(116, 16, '2021-09-15'),
(117, 3, '2021-09-16'),
(118, 4, '2021-09-16'),
(119, 17, '2021-09-16'),
(120, 18, '2021-09-16');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `utilisateur_id` int(10) UNSIGNED NOT NULL,
  `statut_livreur_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `telephone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`utilisateur_id`, `statut_livreur_id`, `telephone`) VALUES
(2, 1, '0665124879'),
(3, 1, '0765128833');

-- --------------------------------------------------------

--
-- Structure de la table `position`
--

CREATE TABLE `position` (
  `livreur_utilisateur_id` int(10) UNSIGNED NOT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(10) UNSIGNED NOT NULL,
  `ligne_menu_du_jour_id` smallint(5) UNSIGNED NOT NULL,
  `fiche_produit_id` smallint(5) UNSIGNED NOT NULL,
  `cuisinier_utilisateur_id` int(10) UNSIGNED NOT NULL,
  `livreur_utilisateur_id` int(10) UNSIGNED DEFAULT NULL,
  `commande_id` int(10) UNSIGNED DEFAULT NULL,
  `commande_reglement_client_utilisateur_id` int(10) UNSIGNED DEFAULT NULL,
  `commande_reglement_id` int(10) UNSIGNED DEFAULT NULL,
  `commande_adresse_client_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `ligne_menu_du_jour_id`, `fiche_produit_id`, `cuisinier_utilisateur_id`, `livreur_utilisateur_id`, `commande_id`, `commande_reglement_client_utilisateur_id`, `commande_reglement_id`, `commande_adresse_client_id`) VALUES
(1, 1, 1, 4, 2, 1, NULL, NULL, NULL),
(2, 1, 1, 4, 2, NULL, NULL, NULL, NULL),
(3, 1, 1, 4, 2, NULL, NULL, NULL, NULL),
(4, 1, 1, 4, 2, NULL, NULL, NULL, NULL),
(5, 1, 1, 4, 2, NULL, NULL, NULL, NULL),
(6, 1, 1, 4, 2, NULL, NULL, NULL, NULL),
(7, 1, 1, 4, 2, NULL, NULL, NULL, NULL),
(8, 1, 1, 4, 2, NULL, NULL, NULL, NULL),
(9, 1, 1, 4, 2, NULL, NULL, NULL, NULL),
(10, 1, 1, 4, 2, NULL, NULL, NULL, NULL),
(11, 1, 1, 4, 3, NULL, NULL, NULL, NULL),
(12, 1, 1, 4, 3, NULL, NULL, NULL, NULL),
(13, 1, 1, 4, 3, NULL, NULL, NULL, NULL),
(14, 1, 1, 4, 3, NULL, NULL, NULL, NULL),
(15, 1, 1, 4, 3, NULL, NULL, NULL, NULL),
(16, 1, 1, 4, 3, NULL, NULL, NULL, NULL),
(17, 1, 1, 4, 3, NULL, NULL, NULL, NULL),
(18, 1, 1, 4, 3, NULL, NULL, NULL, NULL),
(19, 1, 1, 4, 3, NULL, NULL, NULL, NULL),
(20, 1, 1, 4, 3, NULL, NULL, NULL, NULL),
(21, 2, 2, 4, 2, NULL, NULL, NULL, NULL),
(22, 2, 2, 4, 2, NULL, NULL, NULL, NULL),
(23, 2, 2, 4, 2, NULL, NULL, NULL, NULL),
(24, 2, 2, 4, 2, NULL, NULL, NULL, NULL),
(25, 2, 2, 4, 2, NULL, NULL, NULL, NULL),
(26, 2, 2, 4, 2, NULL, NULL, NULL, NULL),
(27, 2, 2, 4, 2, NULL, NULL, NULL, NULL),
(28, 2, 2, 4, 2, NULL, NULL, NULL, NULL),
(29, 2, 2, 4, 2, NULL, NULL, NULL, NULL),
(30, 2, 2, 4, 2, NULL, NULL, NULL, NULL),
(31, 2, 2, 4, 3, 2, NULL, NULL, NULL),
(32, 2, 2, 4, 3, NULL, NULL, NULL, NULL),
(33, 2, 2, 4, 3, NULL, NULL, NULL, NULL),
(34, 2, 2, 4, 3, NULL, NULL, NULL, NULL),
(35, 2, 2, 4, 3, NULL, NULL, NULL, NULL),
(36, 2, 2, 4, 3, NULL, NULL, NULL, NULL),
(37, 2, 2, 4, 3, NULL, NULL, NULL, NULL),
(38, 2, 2, 4, 3, NULL, NULL, NULL, NULL),
(39, 2, 2, 4, 3, NULL, NULL, NULL, NULL),
(40, 2, 2, 4, 3, NULL, NULL, NULL, NULL),
(41, 3, 15, 4, 2, 1, NULL, NULL, NULL),
(42, 3, 15, 4, 2, NULL, NULL, NULL, NULL),
(43, 3, 15, 4, 2, NULL, NULL, NULL, NULL),
(44, 3, 15, 4, 2, NULL, NULL, NULL, NULL),
(45, 3, 15, 4, 2, NULL, NULL, NULL, NULL),
(46, 3, 15, 4, 2, NULL, NULL, NULL, NULL),
(47, 3, 15, 4, 2, NULL, NULL, NULL, NULL),
(48, 3, 15, 4, 2, NULL, NULL, NULL, NULL),
(49, 3, 15, 4, 2, NULL, NULL, NULL, NULL),
(50, 3, 15, 4, 2, NULL, NULL, NULL, NULL),
(51, 3, 15, 4, 3, 2, NULL, NULL, NULL),
(52, 3, 15, 4, 3, NULL, NULL, NULL, NULL),
(53, 3, 15, 4, 3, NULL, NULL, NULL, NULL),
(54, 3, 15, 4, 3, NULL, NULL, NULL, NULL),
(55, 3, 15, 4, 3, NULL, NULL, NULL, NULL),
(56, 3, 15, 4, 3, NULL, NULL, NULL, NULL),
(57, 3, 15, 4, 3, NULL, NULL, NULL, NULL),
(58, 3, 15, 4, 3, NULL, NULL, NULL, NULL),
(59, 3, 15, 4, 3, NULL, NULL, NULL, NULL),
(60, 3, 15, 4, 3, NULL, NULL, NULL, NULL),
(61, 4, 16, 4, 2, NULL, NULL, NULL, NULL),
(62, 4, 16, 4, 2, NULL, NULL, NULL, NULL),
(63, 4, 16, 4, 2, NULL, NULL, NULL, NULL),
(64, 4, 16, 4, 2, NULL, NULL, NULL, NULL),
(65, 4, 16, 4, 2, NULL, NULL, NULL, NULL),
(66, 4, 16, 4, 2, NULL, NULL, NULL, NULL),
(67, 4, 16, 4, 2, NULL, NULL, NULL, NULL),
(68, 4, 16, 4, 2, NULL, NULL, NULL, NULL),
(69, 4, 16, 4, 2, NULL, NULL, NULL, NULL),
(70, 4, 16, 4, 2, NULL, NULL, NULL, NULL),
(71, 4, 16, 4, 3, 2, NULL, NULL, NULL),
(72, 4, 16, 4, 3, NULL, NULL, NULL, NULL),
(73, 4, 16, 4, 3, NULL, NULL, NULL, NULL),
(74, 4, 16, 4, 3, NULL, NULL, NULL, NULL),
(75, 4, 16, 4, 3, NULL, NULL, NULL, NULL),
(76, 4, 16, 4, 3, NULL, NULL, NULL, NULL),
(77, 4, 16, 4, 3, NULL, NULL, NULL, NULL),
(78, 4, 16, 4, 3, NULL, NULL, NULL, NULL),
(79, 4, 16, 4, 3, NULL, NULL, NULL, NULL),
(80, 4, 16, 4, 3, NULL, NULL, NULL, NULL),
(81, 1, 1, 4, NULL, NULL, NULL, NULL, NULL),
(82, 1, 1, 4, NULL, NULL, NULL, NULL, NULL),
(83, 1, 1, 4, NULL, NULL, NULL, NULL, NULL),
(84, 1, 1, 4, NULL, NULL, NULL, NULL, NULL),
(85, 5, 3, 4, 2, NULL, NULL, NULL, NULL),
(86, 5, 3, 4, 2, NULL, NULL, NULL, NULL),
(87, 5, 3, 4, 2, NULL, NULL, NULL, NULL),
(88, 5, 3, 4, 2, NULL, NULL, NULL, NULL),
(89, 5, 3, 4, 2, NULL, NULL, NULL, NULL),
(90, 5, 3, 4, 2, NULL, NULL, NULL, NULL),
(91, 5, 3, 4, 2, NULL, NULL, NULL, NULL),
(92, 5, 3, 4, 2, NULL, NULL, NULL, NULL),
(93, 5, 3, 4, 2, NULL, NULL, NULL, NULL),
(94, 5, 3, 4, 2, NULL, NULL, NULL, NULL),
(95, 5, 3, 4, 3, 3, NULL, NULL, NULL),
(96, 5, 3, 4, 3, NULL, NULL, NULL, NULL),
(97, 5, 3, 4, 3, NULL, NULL, NULL, NULL),
(98, 5, 3, 4, 3, NULL, NULL, NULL, NULL),
(99, 5, 3, 4, 3, NULL, NULL, NULL, NULL),
(100, 5, 3, 4, 3, NULL, NULL, NULL, NULL),
(101, 5, 3, 4, 3, NULL, NULL, NULL, NULL),
(102, 5, 3, 4, 3, NULL, NULL, NULL, NULL),
(103, 5, 3, 4, 3, NULL, NULL, NULL, NULL),
(104, 5, 3, 4, 3, NULL, NULL, NULL, NULL),
(105, 6, 4, 4, 2, NULL, NULL, NULL, NULL),
(106, 6, 4, 4, 2, NULL, NULL, NULL, NULL),
(107, 6, 4, 4, 2, NULL, NULL, NULL, NULL),
(108, 6, 4, 4, 2, NULL, NULL, NULL, NULL),
(109, 6, 4, 4, 2, NULL, NULL, NULL, NULL),
(110, 6, 4, 4, 2, NULL, NULL, NULL, NULL),
(111, 6, 4, 4, 2, NULL, NULL, NULL, NULL),
(112, 6, 4, 4, 2, NULL, NULL, NULL, NULL),
(113, 6, 4, 4, 2, NULL, NULL, NULL, NULL),
(114, 6, 4, 4, 2, NULL, NULL, NULL, NULL),
(115, 6, 4, 4, 3, 3, NULL, NULL, NULL),
(116, 6, 4, 4, 3, NULL, NULL, NULL, NULL),
(117, 6, 4, 4, 3, NULL, NULL, NULL, NULL),
(118, 6, 4, 4, 3, NULL, NULL, NULL, NULL),
(119, 6, 4, 4, 3, NULL, NULL, NULL, NULL),
(120, 6, 4, 4, 3, NULL, NULL, NULL, NULL),
(121, 6, 4, 4, 3, NULL, NULL, NULL, NULL),
(122, 6, 4, 4, 3, NULL, NULL, NULL, NULL),
(123, 6, 4, 4, 3, NULL, NULL, NULL, NULL),
(124, 6, 4, 4, 3, NULL, NULL, NULL, NULL),
(125, 7, 17, 4, 2, NULL, NULL, NULL, NULL),
(126, 7, 17, 4, 2, NULL, NULL, NULL, NULL),
(127, 7, 17, 4, 2, NULL, NULL, NULL, NULL),
(128, 7, 17, 4, 2, NULL, NULL, NULL, NULL),
(129, 7, 17, 4, 2, NULL, NULL, NULL, NULL),
(130, 7, 17, 4, 2, NULL, NULL, NULL, NULL),
(131, 7, 17, 4, 2, NULL, NULL, NULL, NULL),
(132, 7, 17, 4, 2, NULL, NULL, NULL, NULL),
(133, 7, 17, 4, 2, NULL, NULL, NULL, NULL),
(134, 7, 17, 4, 2, NULL, NULL, NULL, NULL),
(135, 7, 17, 4, 3, 3, NULL, NULL, NULL),
(136, 7, 17, 4, 3, 3, NULL, NULL, NULL),
(137, 7, 17, 4, 3, NULL, NULL, NULL, NULL),
(138, 7, 17, 4, 3, NULL, NULL, NULL, NULL),
(139, 7, 17, 4, 3, NULL, NULL, NULL, NULL),
(140, 7, 17, 4, 3, NULL, NULL, NULL, NULL),
(141, 7, 17, 4, 3, NULL, NULL, NULL, NULL),
(142, 7, 17, 4, 3, NULL, NULL, NULL, NULL),
(143, 7, 17, 4, 3, NULL, NULL, NULL, NULL),
(144, 7, 17, 4, 3, NULL, NULL, NULL, NULL),
(145, 8, 18, 4, 2, NULL, NULL, NULL, NULL),
(146, 8, 18, 4, 2, NULL, NULL, NULL, NULL),
(147, 8, 18, 4, 2, NULL, NULL, NULL, NULL),
(148, 8, 18, 4, 2, NULL, NULL, NULL, NULL),
(149, 8, 18, 4, 2, NULL, NULL, NULL, NULL),
(150, 8, 18, 4, 2, NULL, NULL, NULL, NULL),
(151, 8, 18, 4, 2, NULL, NULL, NULL, NULL),
(152, 8, 18, 4, 2, NULL, NULL, NULL, NULL),
(153, 8, 18, 4, 2, NULL, NULL, NULL, NULL),
(154, 8, 18, 4, 2, NULL, NULL, NULL, NULL),
(155, 8, 18, 4, 3, NULL, NULL, NULL, NULL),
(156, 8, 18, 4, 3, NULL, NULL, NULL, NULL),
(157, 8, 18, 4, 3, NULL, NULL, NULL, NULL),
(158, 8, 18, 4, 3, NULL, NULL, NULL, NULL),
(159, 8, 18, 4, 3, NULL, NULL, NULL, NULL),
(160, 8, 18, 4, 3, NULL, NULL, NULL, NULL),
(161, 8, 18, 4, 3, NULL, NULL, NULL, NULL),
(162, 8, 18, 4, 3, NULL, NULL, NULL, NULL),
(163, 8, 18, 4, 3, NULL, NULL, NULL, NULL),
(164, 8, 18, 4, 3, NULL, NULL, NULL, NULL),
(165, 9, 5, 4, 2, NULL, NULL, NULL, NULL),
(166, 9, 5, 4, 2, NULL, NULL, NULL, NULL),
(167, 9, 5, 4, 2, NULL, NULL, NULL, NULL),
(168, 9, 5, 4, 2, NULL, NULL, NULL, NULL),
(169, 9, 5, 4, 2, NULL, NULL, NULL, NULL),
(170, 9, 5, 4, 2, NULL, NULL, NULL, NULL),
(171, 9, 5, 4, 2, NULL, NULL, NULL, NULL),
(172, 9, 5, 4, 2, NULL, NULL, NULL, NULL),
(173, 9, 5, 4, 2, NULL, NULL, NULL, NULL),
(174, 9, 5, 4, 2, NULL, NULL, NULL, NULL),
(175, 9, 5, 4, 3, NULL, NULL, NULL, NULL),
(176, 9, 5, 4, 3, NULL, NULL, NULL, NULL),
(177, 9, 5, 4, 3, NULL, NULL, NULL, NULL),
(178, 9, 5, 4, 3, NULL, NULL, NULL, NULL),
(179, 9, 5, 4, 3, NULL, NULL, NULL, NULL),
(180, 9, 5, 4, 3, NULL, NULL, NULL, NULL),
(181, 9, 5, 4, 3, NULL, NULL, NULL, NULL),
(182, 9, 5, 4, 3, NULL, NULL, NULL, NULL),
(183, 9, 5, 4, 3, NULL, NULL, NULL, NULL),
(184, 9, 5, 4, 3, NULL, NULL, NULL, NULL),
(185, 10, 6, 4, 2, NULL, NULL, NULL, NULL),
(186, 10, 6, 4, 2, NULL, NULL, NULL, NULL),
(187, 10, 6, 4, 2, NULL, NULL, NULL, NULL),
(188, 10, 6, 4, 2, NULL, NULL, NULL, NULL),
(189, 10, 6, 4, 2, NULL, NULL, NULL, NULL),
(190, 10, 6, 4, 2, NULL, NULL, NULL, NULL),
(191, 10, 6, 4, 2, NULL, NULL, NULL, NULL),
(192, 10, 6, 4, 2, NULL, NULL, NULL, NULL),
(193, 10, 6, 4, 2, NULL, NULL, NULL, NULL),
(194, 10, 6, 4, 2, NULL, NULL, NULL, NULL),
(195, 10, 6, 4, 3, NULL, NULL, NULL, NULL),
(196, 10, 6, 4, 3, NULL, NULL, NULL, NULL),
(197, 10, 6, 4, 3, NULL, NULL, NULL, NULL),
(198, 10, 6, 4, 3, NULL, NULL, NULL, NULL),
(199, 10, 6, 4, 3, NULL, NULL, NULL, NULL),
(200, 10, 6, 4, 3, NULL, NULL, NULL, NULL),
(201, 10, 6, 4, 3, NULL, NULL, NULL, NULL),
(202, 10, 6, 4, 3, NULL, NULL, NULL, NULL),
(203, 10, 6, 4, 3, NULL, NULL, NULL, NULL),
(204, 10, 6, 4, 3, NULL, NULL, NULL, NULL),
(205, 11, 15, 4, 2, NULL, NULL, NULL, NULL),
(206, 11, 15, 4, 2, NULL, NULL, NULL, NULL),
(207, 11, 15, 4, 2, NULL, NULL, NULL, NULL),
(208, 11, 15, 4, 2, NULL, NULL, NULL, NULL),
(209, 11, 15, 4, 2, NULL, NULL, NULL, NULL),
(210, 11, 15, 4, 2, NULL, NULL, NULL, NULL),
(211, 11, 15, 4, 2, NULL, NULL, NULL, NULL),
(212, 11, 15, 4, 2, NULL, NULL, NULL, NULL),
(213, 11, 15, 4, 2, NULL, NULL, NULL, NULL),
(214, 11, 15, 4, 2, NULL, NULL, NULL, NULL),
(215, 11, 15, 4, 3, NULL, NULL, NULL, NULL),
(216, 11, 15, 4, 3, NULL, NULL, NULL, NULL),
(217, 11, 15, 4, 3, NULL, NULL, NULL, NULL),
(218, 11, 15, 4, 3, NULL, NULL, NULL, NULL),
(219, 11, 15, 4, 3, NULL, NULL, NULL, NULL),
(220, 11, 15, 4, 3, NULL, NULL, NULL, NULL),
(221, 11, 15, 4, 3, NULL, NULL, NULL, NULL),
(222, 11, 15, 4, 3, NULL, NULL, NULL, NULL),
(223, 11, 15, 4, 3, NULL, NULL, NULL, NULL),
(224, 11, 15, 4, 3, NULL, NULL, NULL, NULL),
(225, 12, 20, 4, 2, NULL, NULL, NULL, NULL),
(226, 12, 20, 4, 2, NULL, NULL, NULL, NULL),
(227, 12, 20, 4, 2, NULL, NULL, NULL, NULL),
(228, 12, 20, 4, 2, NULL, NULL, NULL, NULL),
(229, 12, 20, 4, 2, NULL, NULL, NULL, NULL),
(230, 12, 20, 4, 2, NULL, NULL, NULL, NULL),
(231, 12, 20, 4, 2, NULL, NULL, NULL, NULL),
(232, 12, 20, 4, 2, NULL, NULL, NULL, NULL),
(233, 12, 20, 4, 2, NULL, NULL, NULL, NULL),
(234, 12, 20, 4, 2, NULL, NULL, NULL, NULL),
(235, 12, 20, 4, 3, NULL, NULL, NULL, NULL),
(236, 12, 20, 4, 3, NULL, NULL, NULL, NULL),
(237, 12, 20, 4, 3, NULL, NULL, NULL, NULL),
(238, 12, 20, 4, 3, NULL, NULL, NULL, NULL),
(239, 12, 20, 4, 3, NULL, NULL, NULL, NULL),
(240, 12, 20, 4, 3, NULL, NULL, NULL, NULL),
(241, 12, 20, 4, 3, NULL, NULL, NULL, NULL),
(242, 12, 20, 4, 3, NULL, NULL, NULL, NULL),
(243, 12, 20, 4, 3, NULL, NULL, NULL, NULL),
(244, 12, 20, 4, 3, NULL, NULL, NULL, NULL),
(245, 13, 7, 4, 2, NULL, NULL, NULL, NULL),
(246, 13, 7, 4, 2, NULL, NULL, NULL, NULL),
(247, 13, 7, 4, 2, NULL, NULL, NULL, NULL),
(248, 13, 7, 4, 2, NULL, NULL, NULL, NULL),
(249, 13, 7, 4, 2, NULL, NULL, NULL, NULL),
(250, 13, 7, 4, 2, NULL, NULL, NULL, NULL),
(251, 13, 7, 4, 2, NULL, NULL, NULL, NULL),
(252, 13, 7, 4, 2, NULL, NULL, NULL, NULL),
(253, 13, 7, 4, 2, NULL, NULL, NULL, NULL),
(254, 13, 7, 4, 2, NULL, NULL, NULL, NULL),
(255, 13, 7, 4, 3, NULL, NULL, NULL, NULL),
(256, 13, 7, 4, 3, NULL, NULL, NULL, NULL),
(257, 13, 7, 4, 3, NULL, NULL, NULL, NULL),
(258, 13, 7, 4, 3, NULL, NULL, NULL, NULL),
(259, 13, 7, 4, 3, NULL, NULL, NULL, NULL),
(260, 13, 7, 4, 3, NULL, NULL, NULL, NULL),
(261, 13, 7, 4, 3, NULL, NULL, NULL, NULL),
(262, 13, 7, 4, 3, NULL, NULL, NULL, NULL),
(263, 13, 7, 4, 3, NULL, NULL, NULL, NULL),
(264, 13, 7, 4, 3, NULL, NULL, NULL, NULL),
(265, 14, 8, 4, 2, NULL, NULL, NULL, NULL),
(266, 14, 8, 4, 2, NULL, NULL, NULL, NULL),
(267, 14, 8, 4, 2, NULL, NULL, NULL, NULL),
(268, 14, 8, 4, 2, NULL, NULL, NULL, NULL),
(269, 14, 8, 4, 2, NULL, NULL, NULL, NULL),
(270, 14, 8, 4, 2, NULL, NULL, NULL, NULL),
(271, 14, 8, 4, 2, NULL, NULL, NULL, NULL),
(272, 14, 8, 4, 2, NULL, NULL, NULL, NULL),
(273, 14, 8, 4, 2, NULL, NULL, NULL, NULL),
(274, 14, 8, 4, 2, NULL, NULL, NULL, NULL),
(275, 14, 8, 4, 3, NULL, NULL, NULL, NULL),
(276, 14, 8, 4, 3, NULL, NULL, NULL, NULL),
(277, 14, 8, 4, 3, NULL, NULL, NULL, NULL),
(278, 14, 8, 4, 3, NULL, NULL, NULL, NULL),
(279, 14, 8, 4, 3, NULL, NULL, NULL, NULL),
(280, 14, 8, 4, 3, NULL, NULL, NULL, NULL),
(281, 14, 8, 4, 3, NULL, NULL, NULL, NULL),
(282, 14, 8, 4, 3, NULL, NULL, NULL, NULL),
(283, 14, 8, 4, 3, NULL, NULL, NULL, NULL),
(284, 14, 8, 4, 3, NULL, NULL, NULL, NULL),
(285, 15, 21, 4, 2, NULL, NULL, NULL, NULL),
(286, 15, 21, 4, 2, NULL, NULL, NULL, NULL),
(287, 15, 21, 4, 2, NULL, NULL, NULL, NULL),
(288, 15, 21, 4, 2, NULL, NULL, NULL, NULL),
(289, 15, 21, 4, 2, NULL, NULL, NULL, NULL),
(290, 15, 21, 4, 2, NULL, NULL, NULL, NULL),
(291, 15, 21, 4, 2, NULL, NULL, NULL, NULL),
(292, 15, 21, 4, 2, NULL, NULL, NULL, NULL),
(293, 15, 21, 4, 2, NULL, NULL, NULL, NULL),
(294, 15, 21, 4, 2, NULL, NULL, NULL, NULL),
(295, 15, 21, 4, 3, NULL, NULL, NULL, NULL),
(296, 15, 21, 4, 3, NULL, NULL, NULL, NULL),
(297, 15, 21, 4, 3, NULL, NULL, NULL, NULL),
(298, 15, 21, 4, 3, NULL, NULL, NULL, NULL),
(299, 15, 21, 4, 3, NULL, NULL, NULL, NULL),
(300, 15, 21, 4, 3, NULL, NULL, NULL, NULL),
(301, 15, 21, 4, 3, NULL, NULL, NULL, NULL),
(302, 15, 21, 4, 3, NULL, NULL, NULL, NULL),
(303, 15, 21, 4, 3, NULL, NULL, NULL, NULL),
(304, 15, 21, 4, 3, NULL, NULL, NULL, NULL),
(305, 16, 22, 4, 2, NULL, NULL, NULL, NULL),
(306, 16, 22, 4, 2, NULL, NULL, NULL, NULL),
(307, 16, 22, 4, 2, NULL, NULL, NULL, NULL),
(308, 16, 22, 4, 2, NULL, NULL, NULL, NULL),
(309, 16, 22, 4, 2, NULL, NULL, NULL, NULL),
(310, 16, 22, 4, 2, NULL, NULL, NULL, NULL),
(311, 16, 22, 4, 2, NULL, NULL, NULL, NULL),
(312, 16, 22, 4, 2, NULL, NULL, NULL, NULL),
(313, 16, 22, 4, 2, NULL, NULL, NULL, NULL),
(314, 16, 22, 4, 2, NULL, NULL, NULL, NULL),
(315, 16, 22, 4, 3, NULL, NULL, NULL, NULL),
(316, 16, 22, 4, 3, NULL, NULL, NULL, NULL),
(317, 16, 22, 4, 3, NULL, NULL, NULL, NULL),
(318, 16, 22, 4, 3, NULL, NULL, NULL, NULL),
(319, 16, 22, 4, 3, NULL, NULL, NULL, NULL),
(320, 16, 22, 4, 3, NULL, NULL, NULL, NULL),
(321, 16, 22, 4, 3, NULL, NULL, NULL, NULL),
(322, 16, 22, 4, 3, NULL, NULL, NULL, NULL),
(323, 16, 22, 4, 3, NULL, NULL, NULL, NULL),
(324, 16, 22, 4, 3, NULL, NULL, NULL, NULL),
(325, 17, 9, 4, 2, NULL, NULL, NULL, NULL),
(326, 17, 9, 4, 2, NULL, NULL, NULL, NULL),
(327, 17, 9, 4, 2, NULL, NULL, NULL, NULL),
(328, 17, 9, 4, 2, NULL, NULL, NULL, NULL),
(329, 17, 9, 4, 2, NULL, NULL, NULL, NULL),
(330, 17, 9, 4, 2, NULL, NULL, NULL, NULL),
(331, 17, 9, 4, 2, NULL, NULL, NULL, NULL),
(332, 17, 9, 4, 2, NULL, NULL, NULL, NULL),
(333, 17, 9, 4, 2, NULL, NULL, NULL, NULL),
(334, 17, 9, 4, 2, NULL, NULL, NULL, NULL),
(335, 17, 9, 4, 3, NULL, NULL, NULL, NULL),
(336, 17, 9, 4, 3, NULL, NULL, NULL, NULL),
(337, 17, 9, 4, 3, NULL, NULL, NULL, NULL),
(338, 17, 9, 4, 3, NULL, NULL, NULL, NULL),
(339, 17, 9, 4, 3, NULL, NULL, NULL, NULL),
(340, 17, 9, 4, 3, NULL, NULL, NULL, NULL),
(341, 17, 9, 4, 3, NULL, NULL, NULL, NULL),
(342, 17, 9, 4, 3, NULL, NULL, NULL, NULL),
(343, 17, 9, 4, 3, NULL, NULL, NULL, NULL),
(344, 17, 9, 4, 3, NULL, NULL, NULL, NULL),
(345, 18, 10, 4, 2, NULL, NULL, NULL, NULL),
(346, 18, 10, 4, 2, NULL, NULL, NULL, NULL),
(347, 18, 10, 4, 2, NULL, NULL, NULL, NULL),
(348, 18, 10, 4, 2, NULL, NULL, NULL, NULL),
(349, 18, 10, 4, 2, NULL, NULL, NULL, NULL),
(350, 18, 10, 4, 2, NULL, NULL, NULL, NULL),
(351, 18, 10, 4, 2, NULL, NULL, NULL, NULL),
(352, 18, 10, 4, 2, NULL, NULL, NULL, NULL),
(353, 18, 10, 4, 2, NULL, NULL, NULL, NULL),
(354, 18, 10, 4, 2, NULL, NULL, NULL, NULL),
(355, 18, 10, 4, 3, NULL, NULL, NULL, NULL),
(356, 18, 10, 4, 3, NULL, NULL, NULL, NULL),
(357, 18, 10, 4, 3, NULL, NULL, NULL, NULL),
(358, 18, 10, 4, 3, NULL, NULL, NULL, NULL),
(359, 18, 10, 4, 3, NULL, NULL, NULL, NULL),
(360, 18, 10, 4, 3, NULL, NULL, NULL, NULL),
(361, 18, 10, 4, 3, NULL, NULL, NULL, NULL),
(362, 18, 10, 4, 3, NULL, NULL, NULL, NULL),
(363, 18, 10, 4, 3, NULL, NULL, NULL, NULL),
(364, 18, 10, 4, 3, NULL, NULL, NULL, NULL),
(365, 19, 23, 4, 2, NULL, NULL, NULL, NULL),
(366, 19, 23, 4, 2, NULL, NULL, NULL, NULL),
(367, 19, 23, 4, 2, NULL, NULL, NULL, NULL),
(368, 19, 23, 4, 2, NULL, NULL, NULL, NULL),
(369, 19, 23, 4, 2, NULL, NULL, NULL, NULL),
(370, 19, 23, 4, 2, NULL, NULL, NULL, NULL),
(371, 19, 23, 4, 2, NULL, NULL, NULL, NULL),
(372, 19, 23, 4, 2, NULL, NULL, NULL, NULL),
(373, 19, 23, 4, 2, NULL, NULL, NULL, NULL),
(374, 19, 23, 4, 2, NULL, NULL, NULL, NULL),
(375, 19, 23, 4, 3, NULL, NULL, NULL, NULL),
(376, 19, 23, 4, 3, NULL, NULL, NULL, NULL),
(377, 19, 23, 4, 3, NULL, NULL, NULL, NULL),
(378, 19, 23, 4, 3, NULL, NULL, NULL, NULL),
(379, 19, 23, 4, 3, NULL, NULL, NULL, NULL),
(380, 19, 23, 4, 3, NULL, NULL, NULL, NULL),
(381, 19, 23, 4, 3, NULL, NULL, NULL, NULL),
(382, 19, 23, 4, 3, NULL, NULL, NULL, NULL),
(383, 19, 23, 4, 3, NULL, NULL, NULL, NULL),
(384, 19, 23, 4, 3, NULL, NULL, NULL, NULL),
(385, 20, 24, 4, 2, NULL, NULL, NULL, NULL),
(386, 20, 24, 4, 2, NULL, NULL, NULL, NULL),
(387, 20, 24, 4, 2, NULL, NULL, NULL, NULL),
(388, 20, 24, 4, 2, NULL, NULL, NULL, NULL),
(389, 20, 24, 4, 2, NULL, NULL, NULL, NULL),
(390, 20, 24, 4, 2, NULL, NULL, NULL, NULL),
(391, 20, 24, 4, 2, NULL, NULL, NULL, NULL),
(392, 20, 24, 4, 2, NULL, NULL, NULL, NULL),
(393, 20, 24, 4, 2, NULL, NULL, NULL, NULL),
(394, 20, 24, 4, 2, NULL, NULL, NULL, NULL),
(395, 20, 24, 4, 3, NULL, NULL, NULL, NULL),
(396, 20, 24, 4, 3, NULL, NULL, NULL, NULL),
(397, 20, 24, 4, 3, NULL, NULL, NULL, NULL),
(398, 20, 24, 4, 3, NULL, NULL, NULL, NULL),
(399, 20, 24, 4, 3, NULL, NULL, NULL, NULL),
(400, 20, 24, 4, 3, NULL, NULL, NULL, NULL),
(401, 20, 24, 4, 3, NULL, NULL, NULL, NULL),
(402, 20, 24, 4, 3, NULL, NULL, NULL, NULL),
(403, 20, 24, 4, 3, NULL, NULL, NULL, NULL),
(404, 20, 24, 4, 3, NULL, NULL, NULL, NULL),
(405, 21, 11, 4, 2, NULL, NULL, NULL, NULL),
(406, 21, 11, 4, 2, NULL, NULL, NULL, NULL),
(407, 21, 11, 4, 2, NULL, NULL, NULL, NULL),
(408, 21, 11, 4, 2, NULL, NULL, NULL, NULL),
(409, 21, 11, 4, 2, NULL, NULL, NULL, NULL),
(410, 21, 11, 4, 2, NULL, NULL, NULL, NULL),
(411, 21, 11, 4, 2, NULL, NULL, NULL, NULL),
(412, 21, 11, 4, 2, NULL, NULL, NULL, NULL),
(413, 21, 11, 4, 2, NULL, NULL, NULL, NULL),
(414, 21, 11, 4, 2, NULL, NULL, NULL, NULL),
(415, 21, 11, 4, 3, NULL, NULL, NULL, NULL),
(416, 21, 11, 4, 3, NULL, NULL, NULL, NULL),
(417, 21, 11, 4, 3, NULL, NULL, NULL, NULL),
(418, 21, 11, 4, 3, NULL, NULL, NULL, NULL),
(419, 21, 11, 4, 3, NULL, NULL, NULL, NULL),
(420, 21, 11, 4, 3, NULL, NULL, NULL, NULL),
(421, 21, 11, 4, 3, NULL, NULL, NULL, NULL),
(422, 21, 11, 4, 3, NULL, NULL, NULL, NULL),
(423, 21, 11, 4, 3, NULL, NULL, NULL, NULL),
(424, 21, 11, 4, 3, NULL, NULL, NULL, NULL),
(425, 22, 12, 4, 2, NULL, NULL, NULL, NULL),
(426, 22, 12, 4, 2, NULL, NULL, NULL, NULL),
(427, 22, 12, 4, 2, NULL, NULL, NULL, NULL),
(428, 22, 12, 4, 2, NULL, NULL, NULL, NULL),
(429, 22, 12, 4, 2, NULL, NULL, NULL, NULL),
(430, 22, 12, 4, 2, NULL, NULL, NULL, NULL),
(431, 22, 12, 4, 2, NULL, NULL, NULL, NULL),
(432, 22, 12, 4, 2, NULL, NULL, NULL, NULL),
(433, 22, 12, 4, 2, NULL, NULL, NULL, NULL),
(434, 22, 12, 4, 2, NULL, NULL, NULL, NULL),
(435, 22, 12, 4, 3, NULL, NULL, NULL, NULL),
(436, 22, 12, 4, 3, NULL, NULL, NULL, NULL),
(437, 22, 12, 4, 3, NULL, NULL, NULL, NULL),
(438, 22, 12, 4, 3, NULL, NULL, NULL, NULL),
(439, 22, 12, 4, 3, NULL, NULL, NULL, NULL),
(440, 22, 12, 4, 3, NULL, NULL, NULL, NULL),
(441, 22, 12, 4, 3, NULL, NULL, NULL, NULL),
(442, 22, 12, 4, 3, NULL, NULL, NULL, NULL),
(443, 22, 12, 4, 3, NULL, NULL, NULL, NULL),
(444, 22, 12, 4, 3, NULL, NULL, NULL, NULL),
(445, 23, 25, 4, 2, NULL, NULL, NULL, NULL),
(446, 23, 25, 4, 2, NULL, NULL, NULL, NULL),
(447, 23, 25, 4, 2, NULL, NULL, NULL, NULL),
(448, 23, 25, 4, 2, NULL, NULL, NULL, NULL),
(449, 23, 25, 4, 2, NULL, NULL, NULL, NULL),
(450, 23, 25, 4, 2, NULL, NULL, NULL, NULL),
(451, 23, 25, 4, 2, NULL, NULL, NULL, NULL),
(452, 23, 25, 4, 2, NULL, NULL, NULL, NULL),
(453, 23, 25, 4, 2, NULL, NULL, NULL, NULL),
(454, 23, 25, 4, 2, NULL, NULL, NULL, NULL),
(455, 23, 25, 4, 3, NULL, NULL, NULL, NULL),
(456, 23, 25, 4, 3, NULL, NULL, NULL, NULL),
(457, 23, 25, 4, 3, NULL, NULL, NULL, NULL),
(458, 23, 25, 4, 3, NULL, NULL, NULL, NULL),
(459, 23, 25, 4, 3, NULL, NULL, NULL, NULL),
(460, 23, 25, 4, 3, NULL, NULL, NULL, NULL),
(461, 23, 25, 4, 3, NULL, NULL, NULL, NULL),
(462, 23, 25, 4, 3, NULL, NULL, NULL, NULL),
(463, 23, 25, 4, 3, NULL, NULL, NULL, NULL),
(464, 23, 25, 4, 3, NULL, NULL, NULL, NULL),
(465, 24, 26, 4, 2, NULL, NULL, NULL, NULL),
(466, 24, 26, 4, 2, NULL, NULL, NULL, NULL),
(467, 24, 26, 4, 2, NULL, NULL, NULL, NULL),
(468, 24, 26, 4, 2, NULL, NULL, NULL, NULL),
(469, 24, 26, 4, 2, NULL, NULL, NULL, NULL),
(470, 24, 26, 4, 2, NULL, NULL, NULL, NULL),
(471, 24, 26, 4, 2, NULL, NULL, NULL, NULL),
(472, 24, 26, 4, 2, NULL, NULL, NULL, NULL),
(473, 24, 26, 4, 2, NULL, NULL, NULL, NULL),
(474, 24, 26, 4, 2, NULL, NULL, NULL, NULL),
(475, 24, 26, 4, 3, NULL, NULL, NULL, NULL),
(476, 24, 26, 4, 3, NULL, NULL, NULL, NULL),
(477, 24, 26, 4, 3, NULL, NULL, NULL, NULL),
(478, 24, 26, 4, 3, NULL, NULL, NULL, NULL),
(479, 24, 26, 4, 3, NULL, NULL, NULL, NULL),
(480, 24, 26, 4, 3, NULL, NULL, NULL, NULL),
(481, 24, 26, 4, 3, NULL, NULL, NULL, NULL),
(482, 24, 26, 4, 3, NULL, NULL, NULL, NULL),
(483, 24, 26, 4, 3, NULL, NULL, NULL, NULL),
(484, 24, 26, 4, 3, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reglement`
--

CREATE TABLE `reglement` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_utilisateur_id` int(10) UNSIGNED NOT NULL,
  `montant` decimal(5,2) UNSIGNED NOT NULL,
  `date_paiement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reglement`
--

INSERT INTO `reglement` (`id`, `client_utilisateur_id`, `montant`, `date_paiement`) VALUES
(1, 6, '11.00', '2021-08-09 11:45:37'),
(2, 5, '14.50', '2021-08-09 11:52:03'),
(3, 5, '22.00', '2021-08-10 11:35:03');

-- --------------------------------------------------------

--
-- Structure de la table `statut_commande`
--

CREATE TABLE `statut_commande` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `statut` varchar(45) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `statut_commande`
--

INSERT INTO `statut_commande` (`id`, `statut`) VALUES
(1, 'en attente de prise en charge'),
(2, 'en cours de livraison'),
(3, 'livrée');

-- --------------------------------------------------------

--
-- Structure de la table `statut_livreur`
--

CREATE TABLE `statut_livreur` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `statut` varchar(12) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `statut_livreur`
--

INSERT INTO `statut_livreur` (`id`, `statut`) VALUES
(1, 'indisponible'),
(2, 'libre'),
(3, 'en livraison');

-- --------------------------------------------------------

--
-- Structure de la table `type_produit`
--

CREATE TABLE `type_produit` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `type` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_produit`
--

INSERT INTO `type_produit` (`id`, `type`) VALUES
(1, 'plat'),
(2, 'dessert');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `password`) VALUES
(1, 'Allard', 'Philippe', 'allard.philippe@allphil.com', 'braininvacation1977'),
(2, 'Morrison', 'Jean', 'jeamo@gamil.com', 'ouistiti++'),
(3, 'Labringe', 'Yvan', 'lbryv@yahoo.fr', 'gpasmal13'),
(4, 'Robiscoun', 'Joseph', 'robijo@protonmail.com', 'youpala'),
(5, 'Giboubu', 'Hélène', 'giboustar@gmail.com', 'holliday84'),
(6, 'Savoy', 'Claire', 'yourt13@yahoo.fr', 'elisa+valentine'),
(7, 'Posterki', 'Richard', 'kikiki@protonmail.com', 'toutenbleu+partout+'),
(8, 'Lacreme', 'Boris', 'randalflepetit@gmail.com', '8888super33lelay'),
(9, 'Paspeur', 'Orst', 'monseigneur@guingan.fr', 'derrriQ2000++THX'),
(10, 'Amersmith', 'Peter', 'amerszmithpet@caramail.fr', 'ieuvBCP1900'),
(11, 'Klein', 'Henry', 'fritssswepperr@protonmail.com', '17081941---MNCH'),
(12, 'Vetaire', 'Sophie', 'sosolabrune@gmail.com', 'gxckqSPO2561RGDQhe');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`utilisateur_id`);

--
-- Index pour la table `adresse_client`
--
ALTER TABLE `adresse_client`
  ADD PRIMARY KEY (`id`,`client_utilisateur_id`),
  ADD KEY `fk_adresse_client_client1_idx` (`client_utilisateur_id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`utilisateur_id`),
  ADD KEY `fk_client_utilisateur1_idx` (`utilisateur_id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`,`client_utilisateur_id`,`reglement_id`,`adresse_client_id`),
  ADD KEY `fk_commande_livreur1_idx` (`livreur_utilisateur_id`),
  ADD KEY `fk_commande_statut_commande1_idx` (`statut_commande_id`),
  ADD KEY `fk_commande_adresse_client1_idx` (`adresse_client_id`),
  ADD KEY `fk_commande_reglement1_idx` (`reglement_id`,`client_utilisateur_id`);

--
-- Index pour la table `cuisinier`
--
ALTER TABLE `cuisinier`
  ADD PRIMARY KEY (`utilisateur_id`);

--
-- Index pour la table `fiche_produit`
--
ALTER TABLE `fiche_produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produit_type_produit1_idx` (`type_produit_id`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id`,`commande_id`),
  ADD KEY `fk_ligne_commande_commande1_idx` (`commande_id`),
  ADD KEY `fk_ligne_commande_fiche_produit1_idx` (`fiche_produit_id`);

--
-- Index pour la table `ligne_menu_du_jour`
--
ALTER TABLE `ligne_menu_du_jour`
  ADD PRIMARY KEY (`id`,`fiche_produit_id`),
  ADD KEY `fk_ligne_menu_du_jour_fiche_produit1_idx` (`fiche_produit_id`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`utilisateur_id`),
  ADD KEY `fk_livreur_utilisateur1_idx` (`utilisateur_id`),
  ADD KEY `fk_livreur_statut_livreur1_idx` (`statut_livreur_id`);

--
-- Index pour la table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`livreur_utilisateur_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`,`ligne_menu_du_jour_id`,`fiche_produit_id`,`cuisinier_utilisateur_id`),
  ADD KEY `fk_produit_ligne_menu_du_jour1_idx` (`ligne_menu_du_jour_id`,`fiche_produit_id`),
  ADD KEY `fk_produit_livreur1_idx` (`livreur_utilisateur_id`),
  ADD KEY `fk_produit_cuisinier1_idx` (`cuisinier_utilisateur_id`),
  ADD KEY `fk_produit_commande1_idx` (`commande_id`,`commande_reglement_client_utilisateur_id`,`commande_reglement_id`,`commande_adresse_client_id`);

--
-- Index pour la table `reglement`
--
ALTER TABLE `reglement`
  ADD PRIMARY KEY (`id`,`client_utilisateur_id`),
  ADD KEY `fk_reglement_client1_idx` (`client_utilisateur_id`);

--
-- Index pour la table `statut_commande`
--
ALTER TABLE `statut_commande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `statut_livreur`
--
ALTER TABLE `statut_livreur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_produit`
--
ALTER TABLE `type_produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse_client`
--
ALTER TABLE `adresse_client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `fiche_produit`
--
ALTER TABLE `fiche_produit`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `ligne_menu_du_jour`
--
ALTER TABLE `ligne_menu_du_jour`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT pour la table `reglement`
--
ALTER TABLE `reglement`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `statut_commande`
--
ALTER TABLE `statut_commande`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `statut_livreur`
--
ALTER TABLE `statut_livreur`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `type_produit`
--
ALTER TABLE `type_produit`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `adresse_client`
--
ALTER TABLE `adresse_client`
  ADD CONSTRAINT `fk_adresse_client_client1` FOREIGN KEY (`client_utilisateur_id`) REFERENCES `client` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_adresse_client1` FOREIGN KEY (`adresse_client_id`) REFERENCES `adresse_client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_livreur1` FOREIGN KEY (`livreur_utilisateur_id`) REFERENCES `livreur` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_reglement1` FOREIGN KEY (`reglement_id`,`client_utilisateur_id`) REFERENCES `reglement` (`id`, `client_utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_statut_commande1` FOREIGN KEY (`statut_commande_id`) REFERENCES `statut_commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cuisinier`
--
ALTER TABLE `cuisinier`
  ADD CONSTRAINT `fk_cuisinier_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `fiche_produit`
--
ALTER TABLE `fiche_produit`
  ADD CONSTRAINT `fk_produit_type_produit1` FOREIGN KEY (`type_produit_id`) REFERENCES `type_produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_ligne_commande_commande1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ligne_commande_fiche_produit1` FOREIGN KEY (`fiche_produit_id`) REFERENCES `fiche_produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligne_menu_du_jour`
--
ALTER TABLE `ligne_menu_du_jour`
  ADD CONSTRAINT `fk_ligne_menu_du_jour_fiche_produit1` FOREIGN KEY (`fiche_produit_id`) REFERENCES `fiche_produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_livreur_statut_livreur1` FOREIGN KEY (`statut_livreur_id`) REFERENCES `statut_livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livreur_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `fk_position_livreur1` FOREIGN KEY (`livreur_utilisateur_id`) REFERENCES `livreur` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_commande1` FOREIGN KEY (`commande_id`,`commande_reglement_client_utilisateur_id`,`commande_reglement_id`,`commande_adresse_client_id`) REFERENCES `commande` (`id`, `client_utilisateur_id`, `reglement_id`, `adresse_client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produit_cuisinier1` FOREIGN KEY (`cuisinier_utilisateur_id`) REFERENCES `cuisinier` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produit_ligne_menu_du_jour1` FOREIGN KEY (`ligne_menu_du_jour_id`,`fiche_produit_id`) REFERENCES `ligne_menu_du_jour` (`id`, `fiche_produit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produit_livreur1` FOREIGN KEY (`livreur_utilisateur_id`) REFERENCES `livreur` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reglement`
--
ALTER TABLE `reglement`
  ADD CONSTRAINT `fk_reglement_client1` FOREIGN KEY (`client_utilisateur_id`) REFERENCES `client` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
