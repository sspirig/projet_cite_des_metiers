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

// Étape 1 : recherche toutes les thématiques correspondant au message
$stmt = $pdo->query("SELECT id, question_keywords FROM questions");
$matchedThemeIds = [];

while ($row = $stmt->fetch()) {
    $keywords = json_decode($row['question_keywords'], true);
    foreach ($keywords as $keyword) {
        if (strpos($userInput, strtolower($keyword)) !== false) {
            $matchedThemeIds[] = $row['id'];
            break; // Une seule correspondance suffit par thématique
        }
    }
}

if (empty($matchedThemeIds)) {
    saveUnansweredQuestion($userInput);
    echo json_encode(["response" => "Je ne suis pas en mesure de comprendre ce que vous m'avez demandé !"]);
    exit;
}

// Étape 2 : pour toutes les thématiques matched, récupérer les questions détaillées
$placeholders = implode(',', array_fill(0, count($matchedThemeIds), '?'));
$stmt = $pdo->prepare("SELECT id, question_text, related_question_id FROM question_complete WHERE related_question_id IN ($placeholders)");
$stmt->execute($matchedThemeIds);
$questions = $stmt->fetchAll();

if (count($questions) === 0) {
    // Si aucune question complète, afficher réponse brute des thématiques principales
    $stmt = $pdo->prepare("SELECT response_text FROM responses WHERE question_id IN ($placeholders)");
    $stmt->execute($matchedThemeIds);
    $responses = $stmt->fetchAll(PDO::FETCH_COLUMN);

    echo json_encode(["response" => implode("\n\n", $responses)]);
    exit;
}

if (count($questions) === 1) {
    // Une seule question complète = réponse directe
    $stmt = $pdo->prepare("SELECT response_text FROM responses WHERE question_id = ?");
    $stmt->execute([$questions[0]['id']]);
    $response = $stmt->fetchColumn();
    echo json_encode(["response" => $response]);
    exit;
}

// Sinon, on retourne toutes les suggestions regroupées
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

error_log(print_r([
  "response" => $response,
  "suggestions" => $suggestions
], true));


echo json_encode([
    "response" => "Voici plusieurs réponses en lien avec votre question :",
    "suggestions" => $suggestions
]);
exit;

function saveUnansweredQuestion($question) {
    $file = __DIR__ . '/unanswered_questions.json';
    $questions = file_exists($file) ? json_decode(file_get_contents($file), true) : [];
    if (!in_array($question, $questions)) {
        $questions[] = $question;
        file_put_contents($file, json_encode($questions, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
    }
}
