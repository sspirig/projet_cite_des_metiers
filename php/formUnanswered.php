<?php
require_once 'config.php';

$question = isset($_GET['question']) ? htmlspecialchars($_GET['question']) : '';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Soumettre une nouvelle question</title>
    <link rel="stylesheet" href="../css/formUnanswered.css">
</head>

<body>
    <div class="background-overlay"></div>

    <div class="form-container">
        <h2>Soumettre une nouvelle question</h2>

        <form action="submit_question.php" method="POST">
            <label for="question">Question :</label>
            <input type="text" id="question" name="question" value="<?= $question ?>" placeholder="Entrez votre question ici..." required>

            <label for="reponse">Votre suggestion de réponse (facultatif) :</label>
            <textarea id="reponse" name="reponse" rows="5" placeholder="Proposez une réponse ou laissez vide..."></textarea>

            <button type="submit">Envoyer la question</button>
        </form>

        <a class="back-link" href="<?= BASE_URL ?>/view/chatbot.html">← Retour au chatbot</a>
    </div>
</body>
</html>
