<?php
require_once 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $question = trim($_POST['question']);
    $reponse = trim($_POST['reponse']);
    $keywords = json_decode($_POST['keywords'], true);
    $index = intval($_POST['index']);

    if (empty($question) || empty($reponse)) {
        die("Erreur : la question ou la réponse est vide.");
    }

    $file = __DIR__ . '/pending_questions.json';
    $pending = file_exists($file) ? json_decode(file_get_contents($file), true) : [];

    try {
        $pdo->beginTransaction();

        $stmt = $pdo->prepare("INSERT INTO reponses (reponse) VALUES (?)");
        $stmt->execute([$reponse]);
        $idReponse = $pdo->lastInsertId();

        $stmt = $pdo->prepare("INSERT INTO questions (question, idReponse) VALUES (?, ?)");
        $stmt->execute([$question, $idReponse]);
        $idQuestion = $pdo->lastInsertId();

        if (!empty($keywords)) {
            foreach ($keywords as $kw) {
                $motClef = trim($kw['value']);
                if ($motClef === '') continue;

                $stmt = $pdo->prepare("SELECT idMotClef FROM mot_clef WHERE LOWER(motClef) = LOWER(?)");
                $stmt->execute([$motClef]);
                $mot = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($mot) {
                    $idMotClef = $mot['idMotClef'];
                } else {
                    $stmt = $pdo->prepare("INSERT INTO mot_clef (motClef) VALUES (?)");
                    $stmt->execute([$motClef]);
                    $idMotClef = $pdo->lastInsertId();
                }

                $stmt = $pdo->prepare("INSERT INTO questions_mot_clef (idQuestion, idMotClef) VALUES (?, ?)");
                $stmt->execute([$idQuestion, $idMotClef]);
            }
        }

        if (isset($pending[$index])) {
            unset($pending[$index]);
            file_put_contents($file, json_encode(array_values($pending), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
        }

        $pdo->commit();

        header("Location: admin_validation.php");
        exit;
    } catch (Exception $e) {
        $pdo->rollBack();
        echo "Erreur lors de l'ajout : " . htmlspecialchars($e->getMessage());
    }
}
?>
