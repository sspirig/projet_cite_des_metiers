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

error_log("Message reçu : " . $userInput);

$stmt = $pdo->query("SELECT id, question_keywords FROM questions");
$matchingQuestions = [];

while ($row = $stmt->fetch()) {
    $keywords = json_decode($row['question_keywords'], true);
    $score = 0;

    foreach ($keywords as $keyword) {
        if (strpos($userInput, $keyword) !== false) {
            $score++;
        }
    }

    if ($score > 0) {
        $matchingQuestions[$row['id']] = $score;
    }
}

if (!empty($matchingQuestions)) {
    arsort($matchingQuestions);
    $bestMatches = array_keys(array_slice($matchingQuestions, 0, 3, true));

    $placeholders = implode(',', array_fill(0, count($bestMatches), '?'));
    $stmt = $pdo->prepare("SELECT response_text FROM responses WHERE question_id IN ($placeholders)");
    $stmt->execute($bestMatches);
    $responses = $stmt->fetchAll();

    if ($responses) {
        echo json_encode(["response" => array_column($responses, 'response_text')]);
        exit;
    }
}

saveUnansweredQuestion($userInput);
echo json_encode(["response" => "Je ne suis pas en mesure de comprendre ce que vous m'avez demandé !"]);
exit;

function saveUnansweredQuestion($question)
{
    $file = 'unanswered_questions.json';

    $questions = file_exists($file) ? json_decode(file_get_contents($file), true) : [];

    if (!is_array($questions)) {
        $questions = [];
    }

    if (!in_array($question, $questions)) {
        $questions[] = $question;
        file_put_contents($file, json_encode($questions, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
    }
}
