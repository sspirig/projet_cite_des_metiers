<?php
/**
 * Projet: projet_cite_des_metiers
 * Fichier: fetch.php (version corrigée et stable)
 * Date: 07.10.2025
 */

require_once 'db.php';
require_once 'config.php';


// --- Configuration de sortie propre ---
header('Content-Type: application/json; charset=UTF-8');
ob_clean();
error_reporting(0);

// --- Lecture et validation du JSON d’entrée ---
$rawInput = file_get_contents('php://input');
$data = json_decode($rawInput, true);

if ($data === null && json_last_error() !== JSON_ERROR_NONE) {
    echo json_encode(["response" => "Erreur de décodage JSON reçue depuis le client."]);
    exit;
}

if (!isset($data['message']) || empty(trim($data['message']))) {
    echo json_encode(["response" => "Je n'ai pas compris votre question."]);
    exit;
}

$userInput = trim($data['message']);
$normalizedInput = normalizeText($userInput);

// --- 1. Vérification correspondance exacte ---
$stmt = $pdo->prepare("
    SELECT q.idQuestion, r.reponse
    FROM questions q
    JOIN reponses r ON r.idReponse = q.idReponse
    WHERE LOWER(TRIM(q.question)) = LOWER(TRIM(?))
");
$stmt->execute([$userInput]);
$exactMatch = $stmt->fetch(PDO::FETCH_ASSOC);

if ($exactMatch) {
    echo json_encode(["response" => $exactMatch['reponse']]);
    exit;
}

// --- 2. Récupération de tous les mots-clés ---
$stmt = $pdo->query("
    SELECT idMotClef AS id, motClef
    FROM mot_clef
    ORDER BY LENGTH(motClef) DESC
");
$motsCles = $stmt->fetchAll(PDO::FETCH_ASSOC);

// --- 3. Extraction des mots-clés trouvés dans la question ---
$matchedKeywordIds = extractKeywords($normalizedInput, $motsCles);

// --- 4. Si aucun mot-clé reconnu ---
if (empty($matchedKeywordIds)) {
    saveUnansweredQuestion($userInput);
    echo json_encode([
    "response" => "Je n'ai malheureusement pas encore la réponse à cette question.",
    "suggestions" => [
        [
            "title" => "Soumettre la question",
            "link" => BASE_URL . "/php/formUnanswered.php?question=" . urlencode($userInput)
        ]
    ]
]);

    exit;
}

// --- 5. Recherche de questions associées aux mots-clés trouvés ---
$placeholders = implode(',', array_fill(0, count($matchedKeywordIds), '?'));
$stmt = $pdo->prepare("
    SELECT DISTINCT q.idQuestion, q.question
    FROM questions q
    JOIN questions_mot_clef qmc ON qmc.idQuestion = q.idQuestion
    WHERE qmc.idMotClef IN ($placeholders)
");
$stmt->execute($matchedKeywordIds);
$questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

// --- 6. Aucun résultat lié aux mots-clés ---
if (count($questions) === 0) {
    saveUnansweredQuestion($userInput);
    echo json_encode([
    "response" => "Je n'ai malheureusement pas encore la réponse à cette question.",
    "suggestions" => [
        [
            "title" => "Soumettre la question",
            "link" => BASE_URL . "/php/formUnanswered.php?question=" . urlencode($userInput)
        ]
    ]
]);

    exit;
}

// --- 7. Si une seule question correspond ---
if (count($questions) === 1) {
    $stmt = $pdo->prepare("
        SELECT r.reponse
        FROM reponses r
        JOIN questions q ON q.idReponse = r.idReponse
        WHERE q.idQuestion = ?
    ");
    $stmt->execute([$questions[0]['idQuestion']]);
    $response = $stmt->fetchColumn();

    if ($response) {
        echo json_encode(["response" => $response]);
    } else {
        saveUnansweredQuestion($userInput);
        echo json_encode([
            "response" => "Je n'ai malheureusement pas encore la réponse à cette question.",
            "suggestions" => [
                [
                    "title" => "Soumettre la question",
                    "link" => BASE_URL . "/php/formUnanswered.php?question=" . urlencode($userInput)
                ]
            ]
        ]);

    }
    exit;
}

// --- 8. Plusieurs résultats trouvés → proposer plusieurs réponses ---
$suggestions = [];
foreach ($questions as $q) {
    $stmt = $pdo->prepare("
        SELECT r.reponse
        FROM reponses r
        JOIN questions q2 ON q2.idReponse = r.idReponse
        WHERE q2.idQuestion = ?
    ");
    $stmt->execute([$q['idQuestion']]);
    $response = $stmt->fetchColumn();

    if ($response) {
        $suggestions[] = [
            "title" => $q['question'],
            "text" => $response
        ];
    }
}

echo json_encode([
    "response" => "Voici plusieurs réponses possibles liées à votre question :",
    "suggestions" => $suggestions
]);
exit;


// --- Fonctions utilitaires ---
function normalizeText($text)
{
    $text = preg_replace('/[^\w\s]/u', ' ', $text);
    $text = preg_replace('/\s+/', ' ', $text);
    return strtolower(trim($text));
}

function extractKeywords($text, $motsCles)
{
    $matchedIds = [];
    $remainingText = $text;
    foreach ($motsCles as $motCle) {
        $pattern = '/\b' . preg_quote($motCle['motClef'], '/') . '\b/u';
        if (preg_match($pattern, $text, $matches)) {
            $matchedIds[] = $motCle['id'];
            $remainingText = str_replace($matches[0], '', $remainingText);
        }
    }
    return array_unique($matchedIds);
}

function saveUnansweredQuestion($question)
{
    $file = __DIR__ . '/unanswered_questions.json';
    $questions = file_exists($file) ? json_decode(file_get_contents($file), true) : [];

    if (!in_array($question, $questions)) {
        $questions[] = $question;
        file_put_contents($file, json_encode($questions, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
    }
}
?>