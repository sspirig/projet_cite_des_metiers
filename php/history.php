<?php
require_once 'db.php';
header('Content-Type: application/json; charset=UTF-8');
ob_clean();

$action = $_GET['action'] ?? '';

if ($action === 'save') {
    // Enregistrer une conversation
    $data = json_decode(file_get_contents('php://input'), true);
    if (!isset($data['conversation']) || !is_array($data['conversation'])) {
        echo json_encode(['success' => false, 'error' => 'Conversation manquante']);
        exit;
    }
    $stmt = $pdo->prepare("INSERT INTO historique (conversation_json) VALUES (?)");
    $stmt->execute([json_encode($data['conversation'], JSON_UNESCAPED_UNICODE)]);
    echo json_encode(['success' => true, 'id' => $pdo->lastInsertId()]);
    exit;
}

if ($action === 'list') {
    // Liste des conversations
    $stmt = $pdo->query("SELECT id_historique, date_conversation FROM historique ORDER BY date_conversation DESC");
    echo json_encode($stmt->fetchAll());
    exit;
}

if ($action === 'get') {
    // Détail d'une conversation
    $id = intval($_GET['id'] ?? 0);
    $stmt = $pdo->prepare("SELECT conversation_json FROM historique WHERE id_historique = ?");
    $stmt->execute([$id]);
    $row = $stmt->fetch();
    if ($row) {
        echo $row['conversation_json'];
    } else {
        echo json_encode([]);
    }
    exit;
}

echo json_encode(['error' => 'Action inconnue']);