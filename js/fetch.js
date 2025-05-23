let messageQueue = [];
let isTyping = false;

function sendMessage() {
    let input = document.getElementById("userInput");
    let message = input.value.trim();
    if (message === "") return;

    let chatBox = document.getElementById("chat-box");
    chatBox.innerHTML += `<div class='message question'><strong>Vous :</strong> ${message}</div>`;
    input.value = "";

    console.log(message);
    
    fetch('../php/fetch.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                'message': message
            })
        })
        .then(response => response.text())
        .then(text => {
            console.log("Réponse brute du serveur : ", text);

            try {
                if (text.trim().startsWith("{") || text.trim().startsWith("[")) {
                    let data = JSON.parse(text);
                    let botResponses = Array.isArray(data.response) ? data.response : [data.response];

                    if (botResponses.length === 0 || botResponses[0].trim() === "") {
                        messageQueue.push("Désolé, je n'ai pas encore de réponse à cette question.");
                    } else {
                        botResponses.forEach(response => {
                            messageQueue.push(response);
                        });
                    }

                    processQueue();
                } else {  
                    throw new Error("Réponse invalide du serveur");
                }
            } catch (error) {
                console.error("Erreur de parsing JSON :", error);
                messageQueue.push("Désolé, il y a eu un problème avec la réponse.");
                processQueue();
            }
        })
        .catch(error => {
            console.error("Erreur de requête :", error);
            messageQueue.push("Désolé, il y a eu un problème.");
            processQueue();
        });
}

function processQueue() {
    if (isTyping || messageQueue.length === 0) return;

    isTyping = true;
    let text = messageQueue.shift();
    typeResponse(text, () => {
        isTyping = false;
        processQueue();
    });
}

function typeResponse(text, callback) {
    let chatBox = document.getElementById("chat-box");
    let responseDiv = document.createElement("div");
    responseDiv.classList.add("message", "response");
    responseDiv.innerHTML = `<strong>Chatbot :</strong> <span class="typing"></span>`;
    chatBox.appendChild(responseDiv);

    let typingSpan = responseDiv.querySelector(".typing");
    let index = 0;

    function typeCharacter() {
        if (index < text.length) {
            typingSpan.innerHTML += text.charAt(index);
            index++;
            setTimeout(typeCharacter, 40);
        } else {
            chatBox.scrollTop = chatBox.scrollHeight;
            setTimeout(callback, 500);
        }
    }

    typeCharacter();
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
