<?php
$file = __DIR__ . '/pending_questions.json';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['index'])) {
    $index = intval($_POST['index']);
    $pending = file_exists($file) ? json_decode(file_get_contents($file), true) : [];

    if (isset($pending[$index])) {
        unset($pending[$index]);
        file_put_contents($file, json_encode(array_values($pending), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
    }
}
?>
