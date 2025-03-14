<?php
require_once 'db.php';

if (!isset($_POST['message']) || empty(trim($_POST['message']))) {
    echo json_encode(["response" => "Je n'ai pas compris votre question."]);
    exit;
}

$userInput = strtolower(trim($_POST['message']));

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
        $matchingQuestions[] = $row['id']; 
    }
}

if (!empty($matchingQuestions)) {
    $placeholders = str_repeat('?,', count($matchingQuestions) - 1) . '?'; 
    $stmt = $pdo->prepare("SELECT response_text FROM responses WHERE question_id IN ($placeholders)");
    $stmt->execute($matchingQuestions);
    $responses = $stmt->fetchAll();

    if ($responses) {
        $responseTexts = [];
        
        foreach ($responses as $response) {
            $responseTexts[] = $response['response_text'];
        }
        
        echo json_encode(["response" => $responseTexts]);
    } else {
        echo json_encode(["response" => "Je n'ai pas trouvé de réponse appropriée."]);
    }
} else {
    echo json_encode(["response" => "Je ne suis pas en mesure de comprendre ce que vous m'avez demandé !"]);
}
?>
