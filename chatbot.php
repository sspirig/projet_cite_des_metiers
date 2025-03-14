<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbot</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f3f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
            position: relative;
            overflow: hidden;
        }

        .background-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 123, 255, 0.2);
            backdrop-filter: blur(10px);
            z-index: -1;
        }

        .welcome-message {
            font-size: 48px;
            font-weight: bold;
            text-align: center;
            color: #007bff;
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 1;
            transition: opacity 1s ease-out;
            animation: fadeIn 2s ease-out;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

        #btnChat {
            margin-top: 0;
        }

        .chat-container {
            width: 80%;
            max-width: 600px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            visibility: hidden;
            opacity: 0;
            transition: visibility 1s, opacity 1s;
            flex-direction: column;
            align-items: center;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .chat-box {
            width: 100%;
            max-height: 400px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            padding: 10px;
        }

        .message {
            max-width: 75%;
            padding: 12px;
            border-radius: 18px;
            margin: 5px 0;
        }

        .question {
            background-color: #007bff;
            color: white;
            align-self: flex-end;
            text-align: right;
        }

        .response {
            background-color: #e9ecef;
            align-self: flex-start;
        }

        .input-group {
            border-top: 1px solid #ccc;
            padding-top: 10px;
            width: 100%;
        }

        .form-control {
            border-radius: 50px;
            padding: 20px;
            font-size: 18px;
            width: 100%;
            max-width: 500px;
            border: 2px solid #007bff;
            box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2);
            transition: box-shadow 0.3s ease;
        }

        .form-control:focus {
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
            border-color: #0056b3;
        }

        .btn-primary {
            margin-top: 20px;
            padding: 15px 25px;
            font-size: 16px;
            border-radius: 50px;
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .chat-container.active {
            visibility: visible;
            opacity: 1;
            animation: slideUp 1s ease-out;
        }

        @keyframes slideUp {
            0% {
                transform: translate(-50%, 50%);
                opacity: 0;
            }

            100% {
                transform: translate(-50%, -50%);
                opacity: 1;
            }
        }
    </style>
</head>

<body>
    <div class="background-overlay"></div>
    <div class="welcome-message" id="welcome-message">
        Bienvenue sur notre chatbot !
    </div>

    <div class="chat-container" id="chat-container">
        <div class="chat-box" id="chat-box"></div>
        <div class="input-group">
            <input type="text" id="userInput" class="form-control" placeholder="Posez votre question..." required>
            <button onclick="sendMessage()" id="btnChat" class="btn btn-primary">Envoyer</button>
        </div>
    </div>

    <script>
        function sendMessage() {
            let input = document.getElementById("userInput");
            let message = input.value.trim();
            if (message === "") return;

            let chatBox = document.getElementById("chat-box");

            chatBox.innerHTML += `<div class='message question'><strong>Vous :</strong> ${message}</div>`;
            input.value = ""; 

            fetch('fetch.php', {
                    method: 'POST',
                    body: new URLSearchParams({
                        'message': message
                    })
                })
                .then(response => response.json())
                .then(data => {
                    let botResponses = data.response;

                    if (Array.isArray(botResponses)) {

                        botResponses.forEach(response => {
                            chatBox.innerHTML += `<div class='message response'><strong>Chatbot :</strong> ${response}</div>`;
                        });
                    } else {

                        chatBox.innerHTML += `<div class='message response'><strong>Chatbot :</strong> ${botResponses}</div>`;
                    }

                    chatBox.scrollTop = chatBox.scrollHeight;
                })
                .catch(error => {
                    chatBox.innerHTML += `<div class='message response'><strong>Chatbot :</strong> Désolé, il y a eu un problème.</div>`;
                    chatBox.scrollTop = chatBox.scrollHeight;
                });
        }


        window.onload = function() {
            let welcomeMessage = document.getElementById("welcome-message");
            setTimeout(() => {
                welcomeMessage.style.opacity = "0";
            }, 3000);

            setTimeout(() => {
                let chatContainer = document.getElementById("chat-container");
                chatContainer.classList.add("active"); 
            }, 3500);
        };

        document.getElementById("userInput").addEventListener("click", function() {
            let welcomeMessage = document.getElementById("welcome-message");
            welcomeMessage.style.display = "none";
        });

        document.getElementById("userInput").addEventListener("keypress", function(event) {
            if (event.key === "Enter") sendMessage();
        });
    </script>
</body>

</html>