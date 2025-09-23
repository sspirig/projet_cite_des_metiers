-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 09 sep. 2025 à 07:14
-- Version du serveur : 10.11.13-MariaDB-0ubuntu0.24.04.1
-- Version de PHP : 8.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `chatbot_cfpt`
--

-- --------------------------------------------------------

--
-- Structure de la table `mot_clef`
--

CREATE TABLE `mot_clef` (
  `idMotClef` int(10) UNSIGNED NOT NULL,
  `motClef` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `mot_clef`
--

INSERT INTO `mot_clef` (`idMotClef`, `motClef`) VALUES
(1, 'CFC'),
(2, 'formation'),
(3, 'durée'),
(4, 'plein temps'),
(5, 'développement'),
(6, 'plan'),
(7, 'date'),
(8, 'août 2024'),
(9, 'enseignement'),
(10, 'général'),
(11, 'modules'),
(12, 'informatique'),
(13, 'théorie'),
(14, 'compétences de base élargies'),
(15, 'anglais'),
(16, 'mathématiques'),
(17, 'CBE'),
(18, 'culture générale'),
(19, 'communication'),
(20, 'société'),
(21, 'CG'),
(22, '24'),
(23, 'CIE'),
(24, 'cours interentreprises'),
(25, '7'),
(26, 'TPI'),
(27, 'travail pratique individuel'),
(28, 'note'),
(29, 'réussite'),
(30, 'CI'),
(31, 'compétences'),
(32, 'calcul'),
(33, 'modules école'),
(34, 'note globale'),
(35, 'formule'),
(36, 'promotion'),
(37, 'compétences de base élargies'),
(38, 'CBE'),
(39, 'note'),
(40, '4.0'),
(41, 'culture générale'),
(42, 'CG'),
(43, 'modules'),
(44, 'CIE'),
(45, 'informatique'),
(46, 'atelier'),
(47, 'pratique professionnelle'),
(48, 'conseil des maîtres'),
(49, 'calendrier'),
(50, 'janvier'),
(51, 'juin'),
(52, 'TPI'),
(53, 'travail pratique individuel'),
(54, 'durée'),
(55, '70 heures'),
(56, '90 heures'),
(57, 'critères'),
(58, 'évaluation'),
(59, 'exécution'),
(60, 'documentation'),
(61, 'présentation'),
(62, 'entretien'),
(63, '1 heure'),
(64, 'réussite'),
(65, 'référents'),
(66, 'Manfrini'),
(67, 'Wanner'),
(68, 'école d’informatique'),
(69, 'abréviations'),
(70, 'CI'),
(71, 'MPT'),
(72, 'maturité professionnelle');

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `idQuestion` int(10) UNSIGNED NOT NULL,
  `question` varchar(200) NOT NULL,
  `idReponse` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`idQuestion`, `question`, `idReponse`) VALUES
(1, 'Quelle est la durée de la formation CFC informaticien orientation développement d’applications à plein temps ?', 1),
(2, 'À partir de quelle date le plan de formation 2024 s’applique-t-il ?', 2),
(3, 'Quels sont les deux grands blocs de la formation théorique ?', 3),
(4, 'Quelles branches composent les compétences de base élargies (CBE) ?', 4),
(5, 'Quelles branches composent la culture générale (CG) ?', 5),
(6, 'Combien de modules informatiques « école » sont enseignés aux apprentis ?', 6),
(7, 'Combien y a-t-il de modules interentreprises (CIE) ?', 7),
(8, 'Quelle est la condition minimale pour réussir le Travail Pratique Individuel (TPI) ?', 8),
(9, 'Comment est calculée la note de compétences en informatique (CI) ?', 9),
(10, 'Quelle formule est utilisée pour calculer la note globale du CFC ?', 10),
(11, 'Quelle est la note minimale exigée pour les compétences de base élargies afin d’être promu ?', 11),
(12, 'Quelle est la note minimale exigée pour la culture générale pour passer à l’année suivante ?', 12),
(13, 'Quelle est la note minimale pour réussir les modules informatiques et interentreprises ?', 13),
(14, 'Quelle est la note minimale en atelier pour être promu ?', 14),
(15, 'Quand ont lieu les conseils des maîtres chaque année ?', 15),
(16, 'Quelle est la durée du Travail Pratique Individuel (TPI) ?', 16),
(17, 'Quels sont les critères d’évaluation du TPI ?', 17),
(18, 'Combien de temps dure la présentation et l’entretien du TPI ?', 18),
(19, 'Quelle est la condition minimale pour réussir le TPI ?', 19),
(20, 'Qui sont les référents du plan de formation ?', 20),
(21, 'Que signifie l’abréviation CIE ?', 21),
(22, 'Que signifie l’abréviation CBE ?', 22),
(23, 'Que signifie l’abréviation CI ?', 23),
(24, 'Que signifie l’abréviation CG ?', 24),
(25, 'Que signifie l’abréviation TPI ?', 25),
(26, 'Que signifie l’abréviation MPT ?', 26);

-- --------------------------------------------------------

--
-- Structure de la table `questions_mot_clef`
--

CREATE TABLE `questions_mot_clef` (
  `idQuestion` int(10) UNSIGNED NOT NULL,
  `idMotClef` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `questions_mot_clef`
--

INSERT INTO `questions_mot_clef` (`idQuestion`, `idMotClef`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 2),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(5, 18),
(5, 19),
(5, 20),
(5, 21),
(6, 11),
(6, 12),
(6, 22),
(7, 23),
(7, 24),
(7, 11),
(7, 25),
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(9, 30),
(9, 31),
(9, 12),
(9, 32),
(9, 33),
(9, 23),
(10, 34),
(10, 1),
(10, 35),
(10, 26),
(10, 21),
(10, 17),
(10, 30),
(11, 36),
(11, 37),
(11, 38),
(11, 39),
(11, 40),
(12, 36),
(12, 41),
(12, 42),
(12, 39),
(12, 40),
(13, 36),
(13, 43),
(13, 44),
(13, 45),
(13, 39),
(13, 40),
(14, 36),
(14, 46),
(14, 47),
(14, 39),
(14, 40),
(15, 48),
(15, 49),
(15, 50),
(15, 51),
(16, 52),
(16, 53),
(16, 54),
(16, 55),
(16, 56),
(17, 52),
(17, 57),
(17, 58),
(17, 59),
(17, 60),
(17, 61),
(17, 62),
(18, 52),
(18, 61),
(18, 62),
(18, 54),
(18, 63),
(19, 52),
(19, 64),
(19, 39),
(19, 40),
(20, 65),
(20, 66),
(20, 67),
(20, 68),
(21, 69),
(21, 44),
(22, 69),
(22, 37),
(22, 38),
(23, 69),
(23, 70),
(23, 45),
(24, 69),
(24, 41),
(24, 42),
(25, 69),
(25, 52),
(25, 53),
(26, 69),
(26, 71),
(26, 72);

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

CREATE TABLE `reponses` (
  `idReponse` int(10) UNSIGNED NOT NULL,
  `reponse` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reponses`
--

INSERT INTO `reponses` (`idReponse`, `reponse`) VALUES
(1, '4 ans.'),
(2, 'Dès août 2024.'),
(3, 'L’enseignement général et les modules informatiques.'),
(4, 'L’anglais et les mathématiques.'),
(5, 'Langue & communication et société.'),
(6, '24 modules.'),
(7, '7 modules.'),
(8, 'Obtenir une note supérieure ou égale à 4.'),
(9, '0.8 × moyenne des modules école + 0.2 × moyenne des modules CIE.'),
(10, '0.4 × TPI + 0.2 × CG + 0.1 × CBE + 0.3 × CI.'),
(11, 'La moyenne des compétences de base élargies doit être supérieure ou égale à 4.0.'),
(12, 'La moyenne de culture générale doit être supérieure ou égale à 4.0.'),
(13, 'Les modules et les modules CIE doivent avoir une note supérieure ou égale à 4.0.'),
(14, 'La note de l’atelier doit être supérieure ou égale à 4.0.'),
(15, 'Deux fois par an, fin janvier et fin juin.'),
(16, 'Entre 70 et 90 heures.'),
(17, 'Exécution et résultat du travail (50%), documentation (20%), présentation et entretien professionnel (30%).'),
(18, '1 heure au maximum.'),
(19, 'Obtenir une note supérieure ou égale à 4.'),
(20, 'Mme Manfrini (doyenne) et M. Wanner (maître adjoint).'),
(21, 'Cours interentreprises.'),
(22, 'Compétences de Base Élargies.'),
(23, 'Compétence en informatique.'),
(24, 'Culture générale.'),
(25, 'Travail Pratique Individuel.'),
(26, 'Maturité Professionnelle Technique.');



CREATE TABLE historique (
    id_historique INT AUTO_INCREMENT PRIMARY KEY,
    date_conversation DATETIME DEFAULT CURRENT_TIMESTAMP,
    conversation_json JSON NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mot_clef`
--
ALTER TABLE `mot_clef`
  ADD PRIMARY KEY (`idMotClef`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`idQuestion`),
  ADD KEY `questions_reponses_FK` (`idReponse`);

--
-- Index pour la table `questions_mot_clef`
--
ALTER TABLE `questions_mot_clef`
  ADD KEY `questions_mot_clef_mot_clef_FK` (`idMotClef`),
  ADD KEY `questions_mot_clef_questions_FK` (`idQuestion`);

--
-- Index pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD PRIMARY KEY (`idReponse`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mot_clef`
--
ALTER TABLE `mot_clef`
  MODIFY `idMotClef` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `idQuestion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `reponses`
--
ALTER TABLE `reponses`
  MODIFY `idReponse` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_reponses_FK` FOREIGN KEY (`idReponse`) REFERENCES `reponses` (`idReponse`);

--
-- Contraintes pour la table `questions_mot_clef`
--
ALTER TABLE `questions_mot_clef`
  ADD CONSTRAINT `questions_mot_clef_mot_clef_FK` FOREIGN KEY (`idMotClef`) REFERENCES `mot_clef` (`idMotClef`),
  ADD CONSTRAINT `questions_mot_clef_questions_FK` FOREIGN KEY (`idQuestion`) REFERENCES `questions` (`idQuestion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
