<?php
require_once 'db.php';
header('Content-Type: application/json; charset=UTF-8');

$action = $_GET['action'] ?? '';

if ($action === 'save') {
    // Enregistrer le HTML de la conversation
    $data = json_decode(file_get_contents('php://input'), true);
    if (!isset($data['conversation_html']) || !is_string($data['conversation_html'])) {
        http_response_code(400);
        echo json_encode(['success' => false, 'error' => 'HTML manquant']);
        exit;
    }
    $stmt = $pdo->prepare("INSERT INTO historique (conversation_html) VALUES (?)");
    $stmt->execute([$data['conversation_html']]);
    echo json_encode(['success' => true, 'id' => $pdo->lastInsertId()]);
    exit;
}

if ($action === 'list') {
    // Liste des conversations
    $stmt = $pdo->query("SELECT id_historique, date_conversation FROM historique ORDER BY date_conversation DESC");
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result, JSON_UNESCAPED_UNICODE);
    exit;
}

if ($action === 'get') {
    // Détail d'une conversation (HTML brut)
    $id = intval($_GET['id'] ?? 0);
    $stmt = $pdo->prepare("SELECT conversation_html FROM historique WHERE id_historique = ?");
    $stmt->execute([$id]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($row && !empty($row['conversation_html'])) {
        echo json_encode(['conversation_html' => $row['conversation_html']]);
    } else {
        echo json_encode(['conversation_html' => '']);
    }
    exit;
}

http_response_code(400);
echo json_encode(['error' => 'Action inconnue']);