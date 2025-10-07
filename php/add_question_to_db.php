<?php
require_once 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $question = trim($_POST['question']);
    $reponse = trim($_POST['reponse']);
    $keywords = json_decode($_POST['keywords'], true);
    $index = intval($_POST['index']);

    $file = __DIR__ . '/pending_questions.json';
    $pending = json_decode(file_get_contents($file), true);

    // Insertion de la question dans la base
    $stmt = $pdo->prepare("INSERT INTO question (libelleQuestion, reponse) VALUES (?, ?)");
    $stmt->execute([$question, $reponse]);
    $idQuestion = $pdo->lastInsertId();

    // Gestion des mots-clés
    foreach ($keywords as $kw) {
        $motClef = trim($kw['value']);

        // Vérifie si le mot-clé existe déjà
        $stmt = $pdo->prepare("SELECT idMotClef FROM mot_clef WHERE motClef = ?");
        $stmt->execute([$motClef]);
        $mot = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$mot) {
            // Nouveau mot-clé → on l’ajoute
            $stmt = $pdo->prepare("INSERT INTO mot_clef (motClef) VALUES (?)");
            $stmt->execute([$motClef]);
            $idMot = $pdo->lastInsertId();
        } else {
            $idMot = $mot['idMotClef'];
        }

        // Associe la question au mot-clé
        $stmt = $pdo->prepare("INSERT INTO question_mot_clef (idQuestion, idMotClef) VALUES (?, ?)");
        $stmt->execute([$idQuestion, $idMot]);
    }

    // Supprime la question du fichier JSON
    unset($pending[$index]);
    file_put_contents($file, json_encode(array_values($pending), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));

    header("Location: admin_validation.php");
    exit;
}
?>
