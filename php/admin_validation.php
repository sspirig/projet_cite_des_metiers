<?php
require_once 'db.php';

$file = __DIR__ . '/pending_questions.json';
$pending = file_exists($file) ? json_decode(file_get_contents($file), true) : [];

$stmt = $pdo->query("SELECT idMotClef, motClef FROM mot_clef ORDER BY motClef");
$motsCles = $stmt->fetchAll(PDO::FETCH_ASSOC);
$listeMots = array_column($motsCles, 'motClef');

?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Validation des questions en attente</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css">
    <link rel="stylesheet" href="../css/admin_validation.css">
</head>

<body>
    <h2>Validation des questions en attente</h2>

    <?php if (empty($pending)): ?>
        <p style="text-align:center; font-size:18px;">Aucune question en attente</p>
    <?php else: ?>
        <?php foreach ($pending as $index => $q): ?>
            <form method="POST" action="add_question_to_db.php">
                <label>Question :</label>
                <input type="text" name="question" value="<?= htmlspecialchars($q['question']) ?>" required>

                <label>Réponse :</label>
                <textarea name="reponse" rows="4" required><?= htmlspecialchars($q['reponse']) ?></textarea>

                <label>Mots-clés :</label>
                <input name="keywords" class="tagify-input" placeholder="Ajoutez des mots-clés...">

                <input type="hidden" name="index" value="<?= $index ?>">

                <div class="buttons">
                    <button type="submit" class="valider">Valider</button>
                    <button type="button" class="refuser" onclick="refuserQuestion(<?= $index ?>)">Refuser</button>
                </div>
            </form>
        <?php endforeach; ?>
    <?php endif; ?>

    <script>
        const motsClesExistants = <?= json_encode($listeMots) ?>;

        document.querySelectorAll('.tagify-input').forEach(input => {
            new Tagify(input, {
                whitelist: motsClesExistants,
                dropdown: {
                    enabled: 0,
                    maxItems: 10,
                    classname: "motsclef-list",
                    fuzzySearch: true,
                    position: "input",
                    highlightFirst: true
                }
            });
        });

        function refuserQuestion(index) {
            if (confirm("Voulez-vous vraiment refuser cette question ?")) {
                $.post("refuser_question.php", { index: index }, function () {
                    alert("Question refusée avec succès !");
                    location.reload();
                });
            }
        }
    </script>

</body>
</html>
