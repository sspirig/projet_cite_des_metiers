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
    SELECT qc.id, r.response_text
    FROM question_complete qc
    JOIN responses r ON r.question_id = qc.id
    WHERE LOWER(TRIM(qc.question_text)) = LOWER(TRIM(?))
");
$stmt->execute([$userInput]);
$exactMatch = $stmt->fetch(PDO::FETCH_ASSOC);
if ($exactMatch) {
    echo json_encode(["response" => $exactMatch['response_text']]);
    exit;
}

// 3. Récupérer tous les mots-clés (simples et composés) depuis la base, triés par longueur décroissante
$stmt = $pdo->query("
    SELECT id, keyword AS motClef
    FROM keywords
    ORDER BY LENGTH(keyword) DESC
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
    SELECT DISTINCT qc.id, qc.question_text, qc.related_question_id
    FROM question_complete qc
    JOIN question_keywords qk ON qk.question_id = qc.id
    WHERE qk.keyword_id IN ($placeholders)
");
$stmt->execute($matchedKeywordIds);
$questions = $stmt->fetchAll();

if (count($questions) === 0) {
    // Si aucune question, retourner les réponses des thématiques principales
    $stmt = $pdo->prepare("
        SELECT DISTINCT r.response_text
        FROM responses r
        JOIN question_keywords qk ON qk.question_id = r.question_id
        WHERE qk.keyword_id IN ($placeholders)
    ");
    $stmt->execute($matchedKeywordIds);
    $responses = $stmt->fetchAll(PDO::FETCH_COLUMN);
    echo json_encode(["response" => implode("\n\n", array_unique($responses))]);
    exit;
}

if (count($questions) === 1) {
    // Une seule question = réponse directe
    $stmt = $pdo->prepare("SELECT response_text FROM responses WHERE question_id = ?");
    $stmt->execute([$questions[0]['id']]);
    $response = $stmt->fetchColumn();
    echo json_encode(["response" => $response]);
    exit;
}

// 6. Sinon, retourner les suggestions
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
    "response" => "Voici plusieurs réponses en lien avec votre question :",
    "suggestions" => $suggestions
]);

// --- Fonctions utilitaires ---
function normalizeText($text) {
    // Supprimer ponctuation et espaces multiples, convertir en minuscules
    $text = preg_replace('/[^\w\s]/u', ' ', $text);
    $text = preg_replace('/\s+/', ' ', $text);
    return strtolower(trim($text));
}

function extractKeywords($text, $motsCles) {
    $matchedIds = [];
    $remainingText = $text;
    // D'abord, chercher les mots-clés composés
    foreach ($motsCles as $motCle) {
        $pattern = '/\b' . preg_quote($motCle['motClef'], '/') . '\b/u';
        if (preg_match($pattern, $text, $matches)) {
            $matchedIds[] = $motCle['id'];
            // Supprimer le mot-clé trouvé du texte restant
            $remainingText = str_replace($matches[0], '', $remainingText);
        }
    }
    // Ensuite, segmenter les mots simples restants (optionnel, si besoin)
    $remainingWords = preg_split('/\s+/', trim($remainingText));
    $stopwords = ['le', 'la', 'de', 'des', 'et', 'est', 'que', 'qui', 'à', 'pour', 'en', 'un', 'une', 'du'];
    foreach ($remainingWords as $word) {
        if (!in_array($word, $stopwords) && strlen($word) > 2) {
            // Ici, tu pourrais chercher si le mot simple existe en base
            // et ajouter son id à $matchedIds si oui
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