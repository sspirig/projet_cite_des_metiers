<?php
$question = isset($_GET['question']) ? htmlspecialchars($_GET['question']) : '';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Soumettre une nouvelle question</title>
    <style>
        /* === FOND ET ANIMATION === */
        body {
            background: linear-gradient(45deg, #33b0ea, #e6f5ff, #a3fffa);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            height: 100vh;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
            box-shadow: inset 0 0 20px rgba(255, 255, 255, 0.3);
            filter: brightness(1.2);
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .background-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(rgba(0, 123, 255, 0.15), rgba(0, 109, 226, 0.3));
            backdrop-filter: blur(5px);
            z-index: -1;
        }

        /* === FORMULAIRE === */
        .form-container {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
            padding: 40px 35px;
            border-radius: 25px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
            width: 420px;
            max-width: 90%;
            animation: fadeIn 1.2s ease-in-out;
            text-align: center;
            transition: transform 300ms ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-container h2 {
            font-size: 2rem;
            color: #007bff;
            text-shadow: 0 0 20px rgba(70, 165, 228, 0.8), 0 0 30px rgba(208, 231, 253, 0.671);
            margin-bottom: 25px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #033a5d;
            text-align: left;
        }

        input[type=text],
        textarea {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 2px solid rgba(0, 123, 255, 0.2);
            border-radius: 12px;
            font-size: 15px;
            background: rgba(255, 255, 255, 0.7);
            transition: all 0.3s ease;
            resize: none;
        }

        input[type=text]:focus,
        textarea:focus {
            border-color: #5aaaff;
            box-shadow: 0 0 15px rgba(89, 187, 233, 0.5);
            outline: none;
            background: rgba(255, 255, 255, 0.9);
        }

        /* === BOUTON === */
        button {
            width: 100%;
            padding: 15px;
            font-size: 1.2rem;
            font-weight: bold;
            color: white;
            border: none;
            border-radius: 35px;
            cursor: pointer;
            background: linear-gradient(135deg, #c5edff, #0777d3);
            background-size: 200% 200%;
            animation: neonGlow 1.5s infinite alternate;
            filter: drop-shadow(0 4px 8px rgba(154, 223, 255, 0.5));
            transition: all 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            letter-spacing: 1px;
        }

        button:hover {
            transform: translateY(-4px);
            box-shadow: 0 0 20px rgba(36, 154, 209, 0.8), 0 0 30px rgba(255, 255, 255, 0.5);
            background: linear-gradient(135deg, #b1fffb, #48b1bf);
        }

        button:active {
            transform: translateY(2px);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.6);
        }

        @keyframes neonGlow {
            from {
                background-position: 0% 50%;
            }
            to {
                background-position: 100% 50%;
            }
        }

        /* === LIEN RETOUR === */
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            font-weight: 500;
            color: #007bff;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .back-link:hover {
            color: #033a5d;
            transform: scale(1.05);
            text-shadow: 0 0 10px rgba(0, 123, 255, 0.4);
        }

        /* === RESPONSIVE === */
        @media (max-width: 500px) {
            .form-container {
                width: 90%;
                padding: 30px 25px;
            }

            .form-container h2 {
                font-size: 1.6rem;
            }

            button {
                font-size: 1rem;
                padding: 12px;
            }
        }
    </style>
</head>

<body>
    <div class="background-overlay"></div>

    <div class="form-container">
        <h2>Soumettre une nouvelle question</h2>

        <form action="submit_question.php" method="POST">
            <label for="question">Question :</label>
            <input type="text" id="question" name="question" value="<?= $question ?>" placeholder="Entrez votre question ici..." required>

            <label for="reponse">Votre suggestion de réponse (facultatif) :</label>
            <textarea id="reponse" name="reponse" rows="5" placeholder="Proposez une réponse ou laissez vide..."></textarea>

            <button type="submit">Envoyer la question</button>
        </form>

        <a class="back-link" href="http://localhost/2025-2026/projet_cite_des_metiers/view/chatbot.html">← Retour au chatbot</a>
    </div>
</body>
</html>
