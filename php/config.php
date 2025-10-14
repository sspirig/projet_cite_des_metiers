<?php
// --- Génère automatiquement l'URL de base du projet ---
$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? "https://" : "http://";
$host = $_SERVER['HTTP_HOST'];

// Chemin vers le dossier racine du projet (ex: /2025-2026/projet_cite_des_metiers)
$projectPath = rtrim(dirname($_SERVER['SCRIPT_NAME']), '/\\');
$projectRoot = explode('/', $projectPath);

// On garde tout jusqu’à "projet_cite_des_metiers"
$index = array_search('projet_cite_des_metiers', $projectRoot);
if ($index !== false) {
    $basePath = implode('/', array_slice($projectRoot, 0, $index + 1));
} else {
    $basePath = $projectPath;
}

define('BASE_URL', $protocol . $host . '/' . ltrim($basePath, '/'));
?>
