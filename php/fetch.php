<?php
require_once 'db.php';
header('Content-Type: application/json; charset=UTF-8');
ob_clean();

$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['message']) || empty(trim($data['message']))) {
    echo json_encode(["response" => "Je n'ai pas compris votre question."]);
    exit;
}

$userInput = strtolower(trim($data['message']));

// Étape 1 : recherche par mots-clés dans `questions`
$stmt = $pdo->query("SELECT id, question_keywords FROM questions");
$matchingThemes = [];

while ($row = $stmt->fetch()) {
    $keywords = json_decode($row['question_keywords'], true);
    $score = 0;
    foreach ($keywords as $keyword) {
        if (strpos($userInput, strtolower($keyword)) !== false) {
            $score++;
        }
    }
    if ($score > 0) {
        $matchingThemes[$row['id']] = $score;
    }
}

if (empty($matchingThemes)) {
    saveUnansweredQuestion($userInput);
    echo json_encode(["response" => "Je ne suis pas en mesure de comprendre ce que vous m'avez demandé !"]);
    exit;
}

// Étape 2 : déterminer la meilleure thématique
arsort($matchingThemes);
$bestThemeId = array_key_first($matchingThemes);

// Étape 3 : récupérer les questions spécifiques liées à cette thématique
$stmt = $pdo->prepare("SELECT id, question_text FROM question_complete WHERE related_question_id = ?");
$stmt->execute([$bestThemeId]);
$questions = $stmt->fetchAll();

if (count($questions) === 1) {
    // Une seule sous-question, on donne la réponse directe
    $stmt = $pdo->prepare("SELECT response_text FROM responses WHERE question_id = ?");
    $stmt->execute([$bestThemeId]);
    $response = $stmt->fetchColumn();
    echo json_encode(["response" => $response]);
    exit;
}

// Sinon : plusieurs réponses disponibles => on génère des suggestions
$suggestions = [];
foreach ($questions as $q) {
    $stmt = $pdo->prepare("SELECT response_text FROM responses WHERE question_id = ?");
    $stmt->execute([$q['id']]);
    $response = $stmt->fetchColumn();
    if ($response) {
        $suggestions[] = [
            "title" => $q['question_text'],
            "text" => $response
        ];
    }
}

echo json_encode([
    "response" => "Plusieurs réponses correspondent à votre question. Veuillez choisir une option ci-dessous.",
    "suggestions" => $suggestions
]);
exit;

function saveUnansweredQuestion($question) {
    $file = 'unanswered_questions.json';
    $questions = file_exists($file) ? json_decode(file_get_contents($file), true) : [];
    if (!in_array($question, $questions)) {
        $questions[] = $question;
        file_put_contents($file, json_encode($questions, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
    }
}
