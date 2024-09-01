-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 01 sep. 2024 à 15:37
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gomycode`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `NomDeCategorie` varchar(50) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `CustomerID` int(11) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `NomDeFamille` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telephone` varchar(15) NOT NULL,
  `Adresse` varchar(150) NOT NULL,
  `Ville` varchar(50) NOT NULL,
  `Etat` varchar(50) NOT NULL,
  `CodePostal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `détailsdecommande`
--

CREATE TABLE `détailsdecommande` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `PrixUnitaire` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ordres`
--

CREATE TABLE `ordres` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `DateDeCommande` date NOT NULL,
  `MontantTotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `ProductID` int(11) NOT NULL,
  `NomDuProduit` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Prix` decimal(10,2) NOT NULL,
  `QuantiteEnStock` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Index pour la table `détailsdecommande`
--
ALTER TABLE `détailsdecommande`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Index pour la table `ordres`
--
ALTER TABLE `ordres`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `détailsdecommande`
--
ALTER TABLE `détailsdecommande`
  ADD CONSTRAINT `détailsdecommande_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `ordres` (`OrderID`),
  ADD CONSTRAINT `détailsdecommande_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `produits` (`ProductID`);

--
-- Contraintes pour la table `ordres`
--
ALTER TABLE `ordres`
  ADD CONSTRAINT `ordres_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `clients` (`CustomerID`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
