<?php
/**
 * Projet: projet_cite_des_metiers
 * Fichier: fetch.php (version améliorée)
 * Date: 09.09.2025
 */
require_once 'db.php';
header('Content-Type: application/json; charset=UTF-8');
ob_clean();

// 1. Récupérer et normaliser l'entrée utilisateur
$data = json_decode(file_get_contents('php://input'), true);
if (!isset($data['message']) || empty(trim($data['message']))) {
    echo json_encode(["response" => "Je n'ai pas compris votre question."]);
    exit;
}
$userInput = trim($data['message']);
$normalizedInput = normalizeText($userInput);

// 2. Vérifier si la question correspond exactement à une question complète
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

// 3. Récupérer tous les mots-clés (simples et composés) depuis la base, triés par longueur décroissante
$stmt = $pdo->query("
    SELECT idMotClef AS id, motClef
    FROM mot_clef
    ORDER BY LENGTH(motClef) DESC
");
$motsCles = $stmt->fetchAll();

// 4. Extraire les mots-clés composés et simples
$matchedKeywordIds = extractKeywords($normalizedInput, $motsCles);

if (empty($matchedKeywordIds)) {
    saveUnansweredQuestion($userInput);
    echo json_encode(["response" => "Je ne suis pas en mesure de comprendre ce que vous m'avez demandé !"]);
    exit;
}

// 5. Trouver les questions associées aux mots-clés trouvés
$placeholders = implode(',', array_fill(0, count($matchedKeywordIds), '?'));
$stmt = $pdo->prepare("
    SELECT DISTINCT q.idQuestion, q.question
    FROM questions q
    JOIN questions_mot_clef qmc ON qmc.idQuestion = q.idQuestion
    WHERE qmc.idMotClef IN ($placeholders)
");
$stmt->execute($matchedKeywordIds);
$questions = $stmt->fetchAll();

if (count($questions) === 0) {
    // Si aucune question, retourner les réponses des thématiques principales
    $stmt = $pdo->prepare("
        SELECT DISTINCT r.reponse
        FROM reponses r
        JOIN questions q ON q.idReponse = r.idReponse
        JOIN questions_mot_clef qmc ON qmc.idQuestion = q.idQuestion
        WHERE qmc.idMotClef IN ($placeholders)
    ");
    $stmt->execute($matchedKeywordIds);
    $responses = $stmt->fetchAll(PDO::FETCH_COLUMN);
    echo json_encode(["response" => implode("\n\n", array_unique($responses))]);
    exit;
}

if (count($questions) === 1) {
    // Une seule question = réponse directe
    $stmt = $pdo->prepare("SELECT reponse FROM reponses WHERE idReponse = ?");
    $stmt->execute([$questions[0]['idQuestion']]);
    $response = $stmt->fetchColumn();
    echo json_encode(["response" => $response]);
    exit;
}

// 6. Sinon, retourner les suggestions
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
    "response" => "Voici plusieurs réponses en lien avec votre question :",
    "suggestions" => $suggestions
]);

// --- Fonctions utilitaires ---
function normalizeText($text) {
    $text = preg_replace('/[^\w\s]/u', ' ', $text);
    $text = preg_replace('/\s+/', ' ', $text);
    return strtolower(trim($text));
}

function extractKeywords($text, $motsCles) {
    $matchedIds = [];
    $remainingText = $text;
    foreach ($motsCles as $motCle) {
        $pattern = '/\b' . preg_quote($motCle['motClef'], '/') . '\b/u';
        if (preg_match($pattern, $text, $matches)) {
            $matchedIds[] = $motCle['id'];
            $remainingText = str_replace($matches[0], '', $remainingText);
        }
    }
    $remainingWords = preg_split('/\s+/', trim($remainingText));
    $stopwords = ['le', 'la', 'de', 'des', 'et', 'est', 'que', 'qui', 'à', 'pour', 'en', 'un', 'une', 'du'];
    foreach ($remainingWords as $word) {
        if (!in_array($word, $stopwords) && strlen($word) > 2) {
            // possibilité d'ajouter un check ici
        }
    }
    return array_unique($matchedIds);
}

function saveUnansweredQuestion($question) {
    $file = __DIR__ . '/unanswered_questions.json';
    $questions = file_exists($file) ? json_decode(file_get_contents($file), true) : [];
    if (!in_array($question, $questions)) {
        $questions[] = $question;
        file_put_contents($file, json_encode($questions, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
    }
}
?>
