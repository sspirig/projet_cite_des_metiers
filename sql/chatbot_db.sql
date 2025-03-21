-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 21 mars 2025 à 12:23
-- Version du serveur : 10.11.8-MariaDB-0ubuntu0.24.04.1
-- Version de PHP : 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `chatbot_db`
--

CREATE DATABASE IF NOT EXISTS chatbot_db;
-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question_keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`question_keywords`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `question_keywords`) VALUES
(1, '[\"formation\", \"durée\", \"combien de temps\"]'),
(2, '[\"lieu\", \"adresse\", \"où\", \"endroit\"]'),
(3, '[\"admission\", \"conditions\", \"inscription\", \"comment s\'inscrire\", \"prérequis\"]'),
(4, '[\"coût\", \"prix\", \"frais\", \"combien ça coûte\"]'),
(5, '[\"maturité\", \"MP\", \"MPTASV\", \"option\", \"maturité professionnelle\"]'),
(6, '[\"diplôme\", \"certification\", \"CFC\", \"qualification\"]'),
(7, '[\"début\", \"rentrée\", \"quand commence\", \"date de début\"]'),
(8, '[\"portes ouvertes\", \"visite\", \"journée\", \"découverte\"]'),
(9, '[\"contact\", \"renseignement\", \"email\", \"téléphone\", \"secrétariat\"]'),
(10, '[\"stage\", \"demande de stage\", \"comment faire un stage\"]'),
(11, '[\"contenu\", \"matières\", \"cours\", \"programme\"]'),
(12, '[\"examen\", \"test\", \"épreuve\", \"concours d\'entrée\"]');

-- --------------------------------------------------------

--
-- Structure de la table `question_complete`
--

CREATE TABLE `question_complete` (
  `id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`keywords`)),
  `related_question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `question_complete`
--

INSERT INTO `question_complete` (`id`, `question_text`, `keywords`, `related_question_id`) VALUES
(1, 'Quel est le temps de la formation ?', '[\"formation\", \"durée\", \"combien de temps\"]', 1),
(2, 'Où se trouve le centre de formation ?', '[\"lieu\", \"adresse\", \"où\", \"endroit\"]', 2),
(3, 'Comment s\'inscrire à la formation ?', '[\"admission\", \"conditions\", \"inscription\", \"comment s\'inscrire\", \"prérequis\"]', 3),
(4, 'Combien coûte la formation ?', '[\"coût\", \"prix\", \"frais\", \"combien ça coûte\"]', 4),
(5, 'Qu\'est-ce que la maturité professionnelle ?', '[\"maturité\", \"MP\", \"MPTASV\", \"option\", \"maturité professionnelle\"]', 5),
(6, 'Quelles certifications sont obtenues à la fin de la formation ?', '[\"diplôme\", \"certification\", \"CFC\", \"qualification\"]', 6),
(7, 'Quand commence la rentrée scolaire ?', '[\"début\", \"rentrée\", \"quand commence\", \"date de début\"]', 7),
(8, 'Quelles sont les dates des journées portes ouvertes ?', '[\"portes ouvertes\", \"visite\", \"journée\", \"découverte\"]', 8),
(9, 'Comment contacter le secrétariat ?', '[\"contact\", \"renseignement\", \"email\", \"téléphone\", \"secrétariat\"]', 9),
(10, 'Comment faire une demande de stage ?', '[\"stage\", \"demande de stage\", \"comment faire un stage\"]', 10),
(11, 'Quel est le programme des cours ?', '[\"contenu\", \"matières\", \"cours\", \"programme\"]', 11),
(12, 'Quand se déroulent les concours d\'entrée ?', '[\"examen\", \"test\", \"épreuve\", \"concours d\'entrée\"]', 12);

-- --------------------------------------------------------

--
-- Structure de la table `responses`
--

CREATE TABLE `responses` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `response_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `responses`
--

INSERT INTO `responses` (`id`, `question_id`, `response_text`) VALUES
(1, 1, 'La formation standard dure 4 ans. Une formation accélérée en 3 ans est possible avec la maturité professionnelle.'),
(2, 1, 'Le cursus inclut des stages en entreprise et des cours théoriques répartis sur la durée de la formation.'),
(3, 2, 'La formation a lieu au Centre de formation professionnelle Technique (CFPT), situé Route du Pont-Butin 43, 1213 Petit-Lancy, Genève.'),
(4, 2, 'Le CFPT est accessible en transports en commun via les lignes de bus et tram de Genève.'),
(5, 3, 'L\'admission requiert un âge minimum de 15 ans et un diplôme de fin de Cycle d\'orientation.'),
(6, 3, 'Les tests d\'entrée évaluent les compétences en mathématiques, logique et français.'),
(7, 3, 'L\'inscription se fait en ligne du 20 janvier au 28 février 2025 via le compte e-démarches du répondant légal.'),
(8, 4, 'Les frais de formation sont pris en charge par l\'État, mais des coûts supplémentaires pour le matériel et les livres peuvent s\'appliquer.'),
(9, 4, 'Des aides financières ou bourses sont disponibles selon la situation des étudiants.'),
(10, 5, 'La maturité professionnelle technique (MPTASV) peut être suivie en parallèle de la formation ou après l\'obtention du CFC.'),
(11, 5, 'Elle ouvre l\'accès aux Hautes écoles spécialisées (HES) pour poursuivre les études supérieures.'),
(12, 6, 'À la fin de la formation, un Certificat Fédéral de Capacité (CFC) en informatique est délivré.'),
(13, 6, 'Une Maturité Professionnelle peut également être obtenue pour ceux qui suivent l\'option correspondante.'),
(14, 7, 'La rentrée scolaire a lieu chaque année à la fin du mois d\'août.'),
(15, 7, 'Les dates précises sont communiquées sur le site officiel du CFPT.'),
(16, 8, 'Les journées portes ouvertes auront lieu le samedi 23 novembre 2024 de 9h à 16h à Petit-Lancy.'),
(17, 8, 'C\'est l\'occasion idéale pour découvrir les infrastructures, rencontrer les enseignants et poser des questions.'),
(18, 9, 'Pour toute question, contactez le secrétariat au +41 22 388 87 28 ou par e-mail à cfptinformatique@edu.ge.ch.'),
(19, 9, 'Les bureaux sont ouverts du lundi au vendredi de 8h à 17h.'),
(20, 10, 'Les stages sont intégrés à la formation et permettent d\'acquérir une expérience professionnelle.'),
(21, 10, 'Les demandes de stage se font en ligne via Edu.ge.ch > CFPT Informatique > Stage Demande de stage.'),
(22, 11, 'Les cours incluent la programmation, les mathématiques, la physique, l\'économie d\'entreprise et l\'anglais technique.'),
(23, 11, 'Des ateliers pratiques et des projets collaboratifs sont organisés tout au long de la formation.'),
(24, 12, 'Le concours d\'entrée comprend des épreuves de mathématiques, français et logique.'),
(25, 12, 'Les tests se déroulent en mars et avril, une convocation est envoyée aux candidats inscrits.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `question_complete`
--
ALTER TABLE `question_complete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `related_question_id` (`related_question_id`);

--
-- Index pour la table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `question_complete`
--
ALTER TABLE `question_complete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `question_complete`
--
ALTER TABLE `question_complete`
  ADD CONSTRAINT `question_complete_ibfk_1` FOREIGN KEY (`related_question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `responses`
--
ALTER TABLE `responses`
  ADD CONSTRAINT `responses_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
