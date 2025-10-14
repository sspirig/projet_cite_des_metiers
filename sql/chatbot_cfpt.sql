-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 14 oct. 2025 à 07:05
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

CREATE USER 'chatbot_admin'@'%' IDENTIFIED BY 'MotDePasseSuperSecurise!';
GRANT ALL PRIVILEGES ON chatbot_cfpt.* TO 'chatbot_admin'@'%';
FLUSH PRIVILEGES;


--
-- Structure de la table `historique`
--

CREATE TABLE `historique` (
  `id_historique` int(11) NOT NULL,
  `date_conversation` datetime NOT NULL DEFAULT current_timestamp(),
  `conversation_html` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(72, 'maturité professionnelle'),
(73, 'formations'),
(74, 'FA'),
(75, 'PT'),
(76, 'DUAL'),
(77, '3 ans'),
(78, '4 ans'),
(79, 'plein temps'),
(80, 'apprentissage'),
(81, 'maturité'),
(82, 'débouchés'),
(83, 'HES'),
(84, 'hautes écoles spécialisées'),
(85, 'technicien·ne ES'),
(86, 'abréviations'),
(87, 'certificat'),
(88, 'fédéral'),
(89, 'capacité'),
(90, 'accélérée'),
(91, 'dual'),
(92, 'entreprise'),
(93, 'domaines'),
(94, 'école'),
(95, 'apprentissage'),
(96, 'BDD'),
(97, 'bases de données'),
(98, 'INFRA'),
(99, 'infrastructure'),
(100, 'réseau'),
(101, 'scripting'),
(102, 'scripts'),
(103, 'sécurité'),
(104, 'protection'),
(105, 'web'),
(106, 'applications'),
(107, 'autonomie'),
(108, 'professionnelle'),
(109, 'blockchain'),
(110, 'technologie'),
(111, 'ICT'),
(112, 'cloud'),
(113, 'services'),
(114, 'sécurité'),
(115, 'protection'),
(116, 'données'),
(117, 'NoSQL'),
(118, 'virtualisation'),
(119, 'conteneurs'),
(120, 'programmation'),
(121, 'orienté objet'),
(122, 'développement'),
(123, 'web'),
(124, 'site'),
(125, 'front-end'),
(126, 'back-end'),
(127, 'machine learning'),
(128, 'intelligence artificielle'),
(129, 'processus métier'),
(130, 'environnement professionnel'),
(131, 'interface utilisateur'),
(132, 'design'),
(133, 'méthodes agiles'),
(134, 'logiciel'),
(135, 'technologies récentes'),
(136, 'innovation'),
(137, 'solutions'),
(138, 'modernes'),
(139, 'analyse'),
(140, 'représentation'),
(141, 'données'),
(142, 'outils'),
(143, 'sécurité'),
(144, 'applications'),
(145, 'PME'),
(146, 'entreprises'),
(147, 'IoE'),
(148, 'Internet des objets'),
(149, 'multi-utilisateurs'),
(150, 'orienté objet'),
(151, 'projets'),
(152, 'pratiques'),
(153, 'programmation fonctionnelle'),
(154, 'mobile'),
(155, 'tests'),
(156, 'validation'),
(157, 'innovation'),
(158, 'ICT'),
(159, 'systèmes distribués'),
(160, 'DevOps'),
(161, 'outils logiciels'),
(162, 'planification'),
(163, 'gestion'),
(164, 'processus'),
(165, 'modélisation'),
(166, 'collaboration'),
(167, 'travail en équipe');

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
(26, 'Que signifie l’abréviation MPT ?', 26),
(27, 'Quels sont les différents types de formations proposés ?', 27),
(28, 'Quels sont les débouchés après le CFC d’informaticien ?', 28),
(29, 'Que signifie l’abréviation CFC ?', 29),
(30, 'Quelle est la durée de la formation CFC informaticien orientation développement d’applications en filière accélérée (FA) ?', 30),
(31, 'Quelle est la durée de la formation CFC informaticien orientation développement d’applications en filière duale ?', 31),
(32, 'Qu’est-ce qu’on apprend dans cette école ?', 32),
(33, 'Qu’est-ce qu’on apprend en BDD ?', 33),
(34, 'Qu’est-ce qu’on apprend en INFRA ?', 34),
(35, 'Qu’est-ce qu’on apprend en scripting ?', 35),
(36, 'Qu’est-ce qu’on apprend en sécurité ?', 36),
(37, 'Qu’est-ce qu’on apprend en développement web et applications ?', 37),
(38, 'Qu’est-ce qu’on apprend en autonomie professionnelle ?', 38),
(39, 'Est-ce qu’on apprend la technologie blockchain à l’école ?', 39),
(40, 'Est-ce qu’on apprend à utiliser le cloud à l’école ?', 40),
(41, 'Est-ce qu’on apprend à protéger les données ?', 41),
(42, 'Est-ce qu’on apprend à utiliser des bases de données NoSQL ?', 42),
(43, 'Apprend-on à utiliser la virtualisation ?', 43),
(44, 'Est-ce qu’on apprend à programmer en orienté objet ?', 44),
(45, 'Est-ce qu’on apprend à créer des sites web ?', 45),
(46, 'Est-ce qu’on apprend à utiliser le machine learning ?', 46),
(47, 'Est-ce qu’on apprend à décrire des processus métier ?', 47),
(48, 'Est-ce qu’on apprend à concevoir des interfaces utilisateur ?', 48),
(49, 'Est-ce qu’on apprend à travailler avec des méthodes agiles ?', 49),
(50, 'Est-ce qu’on apprend à utiliser des technologies récentes ?', 50),
(51, 'Est-ce qu’on apprend à créer des applications web ?', 51),
(52, 'Est-ce qu’on apprend à exploiter des services en ligne ?', 52),
(53, 'Est-ce qu’on apprend à utiliser des conteneurs ?', 53),
(54, 'Est-ce qu’on apprend à développer des solutions innovantes ?', 54),
(55, 'Est-ce qu’on apprend à analyser et représenter des données ?', 55),
(56, 'Est-ce qu’on apprend à sécuriser des applications ?', 56),
(57, 'Est-ce qu’on apprend la sécurité informatique des entreprises ?', 57),
(58, 'Est-ce qu’on apprend à travailler avec l’Internet des objets (IoE) ?', 58),
(59, 'Est-ce qu’on apprend à créer des applications multi-utilisateurs ?', 59),
(60, 'Est-ce qu’on fait des projets pratiques à l’école ?', 60),
(61, 'Est-ce qu’on apprend la programmation fonctionnelle ?', 61),
(62, 'Est-ce qu’on apprend à développer des applications mobiles ?', 62),
(63, 'Est-ce qu’on apprend à tester des applications ?', 63),
(64, 'Est-ce qu’on apprend à innover dans le domaine ICT ?', 64),
(65, 'Est-ce qu’on apprend à concevoir des systèmes distribués ?', 65),
(66, 'Est-ce qu’on apprend le DevOps à l’école ?', 66),
(67, 'Est-ce qu’on apprend à planifier des projets informatiques ?', 67),
(68, 'Est-ce qu’on apprend à représenter des processus informatiques ?', 68),
(69, 'Est-ce qu’on apprend à utiliser des outils de collaboration logicielle ?', 69);

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
(26, 72),
(27, 73),
(27, 74),
(27, 75),
(27, 76),
(27, 77),
(27, 78),
(27, 79),
(27, 80),
(27, 81),
(28, 82),
(28, 1),
(28, 83),
(28, 84),
(28, 85),
(29, 86),
(29, 1),
(29, 87),
(29, 88),
(29, 89),
(30, 2),
(30, 1),
(30, 90),
(30, 74),
(30, 3),
(30, 77),
(30, 81),
(31, 2),
(31, 1),
(31, 91),
(31, 80),
(31, 92),
(31, 3),
(31, 77),
(32, 93),
(32, 94),
(32, 95),
(32, 96),
(32, 98),
(32, 101),
(32, 103),
(32, 105),
(32, 107),
(33, 96),
(33, 97),
(34, 98),
(34, 99),
(34, 100),
(35, 101),
(35, 102),
(36, 103),
(36, 104),
(37, 105),
(37, 106),
(38, 107),
(38, 108),
(39, 109),
(39, 110),
(39, 111),
(40, 112),
(40, 113),
(40, 111),
(41, 114),
(41, 115),
(41, 116),
(42, 117),
(42, 116),
(42, 110),
(43, 118),
(43, 119),
(43, 111),
(44, 120),
(44, 121),
(44, 122),
(45, 123),
(45, 124),
(45, 125),
(45, 126),
(45, 122),
(46, 127),
(46, 128),
(46, 111),
(47, 129),
(47, 130),
(48, 131),
(48, 132),
(48, 123),
(49, 133),
(49, 134),
(49, 122),
(50, 135),
(50, 111),
(51, 123),
(51, 125),
(51, 126),
(51, 122),
(52, 113),
(52, 112),
(52, 111),
(53, 119),
(53, 118),
(53, 111),
(54, 136),
(54, 137),
(54, 138),
(54, 111),
(55, 139),
(55, 140),
(55, 141),
(55, 142),
(56, 143),
(56, 144),
(57, 143),
(57, 145),
(57, 146),
(58, 147),
(58, 148),
(58, 158),
(59, 144),
(59, 149),
(59, 150),
(60, 151),
(60, 152),
(60, 158),
(61, 153),
(61, 158),
(62, 154),
(62, 144),
(62, 158),
(63, 155),
(63, 156),
(63, 144),
(64, 157),
(64, 158),
(65, 159),
(65, 158),
(66, 160),
(66, 161),
(66, 158),
(67, 151),
(67, 162),
(67, 163),
(67, 158),
(68, 164),
(68, 165),
(68, 158),
(69, 166),
(69, 161),
(69, 167),
(69, 158);

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

CREATE TABLE `reponses` (
  `idReponse` int(10) UNSIGNED NOT NULL,
  `reponse` varchar(500) NOT NULL
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
(26, 'Maturité Professionnelle Technique.'),
(27, 'Trois formations : FA : Formation en 3 ans accélérée (maturité générale obligatoire) ; PT : Formation en 4 ans à plein temps (maturité pas obligatoire) ; DUAL : Formation en 3 ans (cours théoriques + apprentissage en entreprise).'),
(28, 'Les diplômés peuvent poursuivre en HES (hautes écoles spécialisées) ou en formation de technicien·ne ES.'),
(29, 'Certificat fédéral de capacité.'),
(30, '3 ans (avec maturité générale obligatoire).'),
(31, '3 ans (cours théoriques + apprentissage en entreprise).'),
(32, 'Voici les principaux domaines que vous étudierez à l’école : bases de données (BDD), infrastructure informatique et réseau (INFRA), automatisation et scripting, sécurité informatique, développement web et applications, et autonomie professionnelle.'),
(33, 'En BDD, vous apprendrez à interroger, traiter et assurer la maintenance des bases de données, analyser et modéliser des données, et créer des bases de données.'),
(34, 'En INFRA, vous apprendrez à mettre en place l’infrastructure informatique et réseau d’une petite entreprise, à installer des postes ICT et à intégrer des terminaux IoE.'),
(35, 'En scripting, vous apprendrez à automatiser des procédures à l’aide de scripts.'),
(36, 'En sécurité, vous verrez comment appliquer la protection et la sécurité des données.'),
(37, 'En développement web et applications, vous apprendrez à créer et publier un site web et à concevoir des applications.'),
(38, 'En autonomie professionnelle, vous apprendrez à exécuter des mandats de manière autonome dans votre environnement de travail.'),
(39, 'Oui, les élèves découvrent la technologie blockchain et apprennent à mettre en œuvre des solutions ICT basées sur cette technologie.'),
(40, 'Oui, la formation comprend l’utilisation et la gestion de services dans le cloud public et la création de solutions cloud.'),
(41, 'Oui, la sécurité et la protection des données font partie intégrante de la formation en informatique.'),
(42, 'Oui, la formation aborde aussi l’utilisation des bases de données NoSQL et les nouvelles technologies de stockage de données.'),
(43, 'Oui, les étudiants apprennent à mettre en place et exploiter des plateformes de virtualisation et à utiliser des conteneurs.'),
(44, 'Oui, la programmation orientée objet fait partie du cursus pour comprendre les bases du développement logiciel.'),
(45, 'Oui, les élèves apprennent à concevoir des sites web, à créer des interfaces et à développer des applications interactives.'),
(46, 'Oui, la formation introduit les bases du machine learning pour développer des solutions ICT intelligentes.'),
(47, 'Oui, les élèves apprennent à comprendre et décrire les processus métier liés à leur environnement professionnel.'),
(48, 'Oui, la formation comprend la conception et l’implémentation d’interfaces utilisateur ergonomiques et modernes.'),
(49, 'Oui, les étudiants apprennent à développer des logiciels en appliquant des méthodes agiles.'),
(50, 'Oui, la formation intègre l’usage de technologies récentes et actuelles du domaine ICT.'),
(51, 'Oui, les étudiants conçoivent et développent des applications web complètes, du front-end au back-end.'),
(52, 'Oui, la formation aborde l’exploitation et la surveillance de services dans le cloud public et privé.'),
(53, 'Oui, les étudiants découvrent la mise en place et l’utilisation de services basés sur des conteneurs.'),
(54, 'Oui, la formation met l’accent sur la réalisation de solutions ICT innovantes avec des technologies modernes.'),
(55, 'Oui, la formation inclut l’analyse et la représentation des données à l’aide d’outils spécialisés.'),
(56, 'Oui, les étudiants apprennent à implémenter des mesures de sécurité dans les applications.'),
(57, 'Oui, la formation aborde l’analyse et la mise en place de mesures de sécurité pour les PME.'),
(58, 'Oui, les étudiants conçoivent et mettent en place des services basés sur l’Internet des objets (IoE).'),
(59, 'Oui, la formation inclut la réalisation d’applications orientées objets accessibles à plusieurs utilisateurs.'),
(60, 'Oui, les étudiants réalisent des projets concrets dans leur environnement professionnel.'),
(61, 'Oui, la formation aborde la programmation fonctionnelle pour développer selon un autre paradigme.'),
(62, 'Oui, les étudiants conçoivent et réalisent des applications pour mobile.'),
(63, 'Oui, la formation enseigne comment planifier et exécuter des tests pour valider des applications.'),
(64, 'Oui, les étudiants apprennent à initialiser et à mettre en œuvre des solutions ICT innovantes.'),
(65, 'Oui, la formation comprend la programmation et la gestion de systèmes distribués.'),
(66, 'Oui, la formation aborde les processus DevOps et l’utilisation d’outils logiciels pour les automatiser.'),
(67, 'Oui, les étudiants apprennent à planifier, concevoir et gérer des projets ICT du début à la fin.'),
(68, 'Oui, la formation inclut la modélisation et la représentation de processus informatiques.'),
(69, 'Oui, les étudiants utilisent des outils collaboratifs et logiciels pour le travail en équipe et le développement.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `historique`
--
ALTER TABLE `historique`
  ADD PRIMARY KEY (`id_historique`);

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
-- AUTO_INCREMENT pour la table `historique`
--
ALTER TABLE `historique`
  MODIFY `id_historique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `mot_clef`
--
ALTER TABLE `mot_clef`
  MODIFY `idMotClef` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `idQuestion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `reponses`
--
ALTER TABLE `reponses`
  MODIFY `idReponse` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

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
