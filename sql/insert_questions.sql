-- Insertion des réponses
INSERT INTO reponses (idReponse, reponse) VALUES (1, '4 ans.');
INSERT INTO reponses (idReponse, reponse) VALUES (2, 'Dès août 2024.');
INSERT INTO reponses (idReponse, reponse) VALUES (3, 'L’enseignement général et les modules informatiques.');
INSERT INTO reponses (idReponse, reponse) VALUES (4, 'L’anglais et les mathématiques.');
INSERT INTO reponses (idReponse, reponse) VALUES (5, 'Langue & communication et société.');
INSERT INTO reponses (idReponse, reponse) VALUES (6, '24 modules.');
INSERT INTO reponses (idReponse, reponse) VALUES (7, '7 modules.');
INSERT INTO reponses (idReponse, reponse) VALUES (8, 'Obtenir une note supérieure ou égale à 4.');
INSERT INTO reponses (idReponse, reponse) VALUES (9, '0.8 × moyenne des modules école + 0.2 × moyenne des modules CIE.');
INSERT INTO reponses (idReponse, reponse) VALUES (10, '0.4 × TPI + 0.2 × CG + 0.1 × CBE + 0.3 × CI.');

-- Insertion des questions
INSERT INTO questions (idQuestion, question, idReponse) VALUES (1, 'Quelle est la durée de la formation CFC informaticien orientation développement d’applications à plein temps ?', 1);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (2, 'À partir de quelle date le plan de formation 2024 s’applique-t-il ?', 2);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (3, 'Quels sont les deux grands blocs de la formation théorique ?', 3);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (4, 'Quelles branches composent les compétences de base élargies (CBE) ?', 4);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (5, 'Quelles branches composent la culture générale (CG) ?', 5);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (6, 'Combien de modules informatiques « école » sont enseignés aux apprentis ?', 6);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (7, 'Combien y a-t-il de modules interentreprises (CIE) ?', 7);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (8, 'Quelle est la condition minimale pour réussir le Travail Pratique Individuel (TPI) ?', 8);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (9, 'Comment est calculée la note de compétences en informatique (CI) ?', 9);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (10, 'Quelle formule est utilisée pour calculer la note globale du CFC ?', 10);

-- Insertion des mots-clés
INSERT INTO mot_clef (idMotClef, motClef) VALUES (1, 'CFC');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (2, 'formation');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (3, 'durée');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (4, 'plein temps');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (5, 'développement d’applications');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (6, 'plan');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (7, 'date');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (8, 'août 2024');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (9, 'enseignement');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (10, 'général');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (11, 'modules');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (12, 'informatique');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (13, 'théorie');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (14, 'compétences de base élargies');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (15, 'anglais');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (16, 'mathématiques');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (17, 'CBE');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (18, 'culture générale');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (19, 'communication');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (20, 'société');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (21, 'CG');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (22, '24');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (23, 'CIE');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (24, 'cours interentreprises');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (25, '7');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (26, 'TPI');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (27, 'travail pratique individuel');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (28, 'note');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (29, 'réussite');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (30, 'CI');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (31, 'compétences');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (32, 'calcul');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (33, 'modules école');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (34, 'note globale');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (35, 'formule');

-- Relations questions <-> mots-clés
-- Q1
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (1, 1);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (1, 2);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (1, 3);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (1, 4);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (1, 5);

-- Q2
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (2, 6);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (2, 2);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (2, 7);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (2, 8);

-- Q3
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (3, 9);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (3, 10);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (3, 11);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (3, 12);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (3, 13);

-- Q4
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (4, 14);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (4, 15);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (4, 16);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (4, 17);

-- Q5
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (5, 18);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (5, 19);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (5, 20);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (5, 21);

-- Q6
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (6, 11);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (6, 12);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (6, 22);

-- Q7
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (7, 23);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (7, 24);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (7, 11);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (7, 25);

-- Q8
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (8, 26);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (8, 27);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (8, 28);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (8, 29);

-- Q9
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (9, 30);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (9, 31);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (9, 12);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (9, 32);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (9, 33);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (9, 23);

-- Q10
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (10, 34);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (10, 1);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (10, 35);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (10, 26);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (10, 21);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (10, 17);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (10, 30);


-- Insertion des réponses (suite)
INSERT INTO reponses (idReponse, reponse) VALUES (11, 'La moyenne des compétences de base élargies doit être supérieure ou égale à 4.0.');
INSERT INTO reponses (idReponse, reponse) VALUES (12, 'La moyenne de culture générale doit être supérieure ou égale à 4.0.');
INSERT INTO reponses (idReponse, reponse) VALUES (13, 'Les modules et les modules CIE doivent avoir une note supérieure ou égale à 4.0.');
INSERT INTO reponses (idReponse, reponse) VALUES (14, 'La note de l’atelier doit être supérieure ou égale à 4.0.');
INSERT INTO reponses (idReponse, reponse) VALUES (15, 'Deux fois par an, fin janvier et fin juin.');
INSERT INTO reponses (idReponse, reponse) VALUES (16, 'Entre 70 et 90 heures.');
INSERT INTO reponses (idReponse, reponse) VALUES (17, 'Exécution et résultat du travail (50%), documentation (20%), présentation et entretien professionnel (30%).');
INSERT INTO reponses (idReponse, reponse) VALUES (18, '1 heure au maximum.');
INSERT INTO reponses (idReponse, reponse) VALUES (19, 'Obtenir une note supérieure ou égale à 4.');
INSERT INTO reponses (idReponse, reponse) VALUES (20, 'Mme Manfrini (doyenne) et M. Wanner (maître adjoint).');
INSERT INTO reponses (idReponse, reponse) VALUES (21, 'Cours interentreprises.');
INSERT INTO reponses (idReponse, reponse) VALUES (22, 'Compétences de Base Élargies.');
INSERT INTO reponses (idReponse, reponse) VALUES (23, 'Compétence en informatique.');
INSERT INTO reponses (idReponse, reponse) VALUES (24, 'Culture générale.');
INSERT INTO reponses (idReponse, reponse) VALUES (25, 'Travail Pratique Individuel.');
INSERT INTO reponses (idReponse, reponse) VALUES (26, 'Maturité Professionnelle Technique.');

-- Insertion des questions (suite)
INSERT INTO questions (idQuestion, question, idReponse) VALUES (11, 'Quelle est la note minimale exigée pour les compétences de base élargies afin d’être promu ?', 11);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (12, 'Quelle est la note minimale exigée pour la culture générale pour passer à l’année suivante ?', 12);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (13, 'Quelle est la note minimale pour réussir les modules informatiques et interentreprises ?', 13);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (14, 'Quelle est la note minimale en atelier pour être promu ?', 14);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (15, 'Quand ont lieu les conseils des maîtres chaque année ?', 15);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (16, 'Quelle est la durée du Travail Pratique Individuel (TPI) ?', 16);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (17, 'Quels sont les critères d’évaluation du TPI ?', 17);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (18, 'Combien de temps dure la présentation et l’entretien du TPI ?', 18);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (19, 'Quelle est la condition minimale pour réussir le TPI ?', 19);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (20, 'Qui sont les référents du plan de formation ?', 20);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (21, 'Que signifie l’abréviation CIE ?', 21);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (22, 'Que signifie l’abréviation CBE ?', 22);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (23, 'Que signifie l’abréviation CI ?', 23);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (24, 'Que signifie l’abréviation CG ?', 24);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (25, 'Que signifie l’abréviation TPI ?', 25);
INSERT INTO questions (idQuestion, question, idReponse) VALUES (26, 'Que signifie l’abréviation MPT ?', 26);

-- Insertion des mots-clés (suite)
INSERT INTO mot_clef (idMotClef, motClef) VALUES (36, 'promotion');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (37, 'compétences de base élargies');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (38, 'CBE');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (39, 'note');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (40, '4.0');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (41, 'culture générale');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (42, 'CG');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (43, 'modules');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (44, 'CIE');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (45, 'informatique');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (46, 'atelier');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (47, 'pratique professionnelle');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (48, 'conseil des maîtres');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (49, 'calendrier');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (50, 'janvier');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (51, 'juin');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (52, 'TPI');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (53, 'travail pratique individuel');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (54, 'durée');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (55, '70 heures');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (56, '90 heures');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (57, 'critères');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (58, 'évaluation');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (59, 'exécution');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (60, 'documentation');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (61, 'présentation');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (62, 'entretien');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (63, '1 heure');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (64, 'réussite');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (65, 'référents');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (66, 'Manfrini');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (67, 'Wanner');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (68, 'école d’informatique');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (69, 'abréviations');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (70, 'CI');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (71, 'MPT');
INSERT INTO mot_clef (idMotClef, motClef) VALUES (72, 'maturité professionnelle');

-- Relations questions <-> mots-clés (suite)
-- Q11
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (11, 36);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (11, 37);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (11, 38);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (11, 39);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (11, 40);

-- Q12
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (12, 36);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (12, 41);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (12, 42);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (12, 39);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (12, 40);

-- Q13
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (13, 36);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (13, 43);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (13, 44);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (13, 45);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (13, 39);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (13, 40);

-- Q14
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (14, 36);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (14, 46);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (14, 47);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (14, 39);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (14, 40);

-- Q15
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (15, 48);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (15, 49);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (15, 50);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (15, 51);

-- Q16
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (16, 52);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (16, 53);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (16, 54);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (16, 55);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (16, 56);

-- Q17
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (17, 52);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (17, 57);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (17, 58);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (17, 59);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (17, 60);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (17, 61);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (17, 62);

-- Q18
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (18, 52);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (18, 61);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (18, 62);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (18, 54);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (18, 63);

-- Q19
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (19, 52);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (19, 64);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (19, 39);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (19, 40);

-- Q20
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (20, 65);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (20, 66);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (20, 67);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (20, 68);

-- Q21
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (21, 69);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (21, 44);

-- Q22
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (22, 69);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (22, 37);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (22, 38);

-- Q23
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (23, 69);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (23, 70);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (23, 45);

-- Q24
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (24, 69);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (24, 41);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (24, 42);

-- Q25
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (25, 69);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (25, 52);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (25, 53);

-- Q26
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (26, 69);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (26, 71);
INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (26, 72);