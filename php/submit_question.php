<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $question = trim($_POST['question'] ?? '');
    $reponse = trim($_POST['reponse'] ?? '');

    if ($question === '') {
        die("Erreur : la question est vide.");
    }

    $file = __DIR__ . '/pending_questions.json';
    $pending = file_exists($file) ? json_decode(file_get_contents($file), true) : [];

    $pending[] = [
        'question' => $question,
        'reponse' => $reponse,
        'date' => date('Y-m-d H:i:s')
    ];

    file_put_contents($file, json_encode($pending, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));

    header("Location: http://localhost/2025-2026/projet_cite_des_metiers/view/chatbot.html");
    exit;
}
?>
