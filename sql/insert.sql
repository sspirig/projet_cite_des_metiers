INSERT INTO reponses (idReponse, reponse) VALUES 
(27, 'Trois formations : FA : Formation en 3 ans accélérée (maturité générale obligatoire) ; PT : Formation en 4 ans à plein temps (maturité pas obligatoire) ; DUAL : Formation en 3 ans (cours théoriques + apprentissage en entreprise).'),
(28, 'Les diplômés peuvent poursuivre en HES (hautes écoles spécialisées) ou en formation de technicien·ne ES.'),
(29, 'Certificat fédéral de capacité.'),
(30, '3 ans (avec maturité générale obligatoire).'),
(31, '3 ans (cours théoriques + apprentissage en entreprise).');

-- Insertion des nouvelles questions
INSERT INTO questions (idQuestion, question, idReponse) VALUES
(27, 'Quels sont les différents types de formations proposés ?', 27),
(28, 'Quels sont les débouchés après le CFC d’informaticien ?', 28),
(29, 'Que signifie l’abréviation CFC ?', 29),
(30, 'Quelle est la durée de la formation CFC informaticien orientation développement d’applications en filière accélérée (FA) ?', 30),
(31, 'Quelle est la durée de la formation CFC informaticien orientation développement d’applications en filière duale ?', 31);

-- Insertion des nouveaux mots-clés
INSERT INTO mot_clef (idMotClef, motClef) VALUES
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
(92, 'entreprise');

-- Relations questions <-> mots-clés
-- Q27
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES 
(27, 73), (27, 74), (27, 75), (27, 76), (27, 77), (27, 78), (27, 79), (27, 80), (27, 81);

-- Q28
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES 
(28, 82), (28, 1), (28, 83), (28, 84), (28, 85);

-- Q29
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES 
(29, 86), (29, 1), (29, 87), (29, 88), (29, 89);

-- Q30
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES 
(30, 2), (30, 1), (30, 90), (30, 74), (30, 3), (30, 77), (30, 81);

-- Q31
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES 
(31, 2), (31, 1), (31, 91), (31, 80), (31, 92), (31, 3), (31, 77);

-- Mise à jour des AUTO_INCREMENT pour garder la cohérence
ALTER TABLE questions AUTO_INCREMENT = 32;
ALTER TABLE reponses AUTO_INCREMENT = 32;
ALTER TABLE mot_clef AUTO_INCREMENT = 93;