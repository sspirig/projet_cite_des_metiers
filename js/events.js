function setupEventListeners() {
    document.getElementById("userInput").addEventListener("click", function () {
        let welcomeMessage = document.getElementById("welcome-message");
        welcomeMessage.style.display = "none";
    });

    document.getElementById("userInput").addEventListener("keypress", function (event) {
        if (event.key === "Enter") sendMessage();
    });

    document.getElementById("btnChat").addEventListener("click", sendMessage);
}

function addClickEventSuggestions() {
    const chatbox = document.querySelector(".chat-box");
    const suggestionDivs = chatbox.querySelectorAll("#suggestionDiv");

    suggestionDivs.forEach(div => {
        div.querySelectorAll("button").forEach(btn => {
            // Supprimer les anciens écouteurs pour éviter doublons
            btn.replaceWith(btn.cloneNode(true));
        });
    });

    // Ré-attacher les événements
    const buttons = chatbox.querySelectorAll("#suggestionDiv button");
    buttons.forEach(btn => {
        btn.addEventListener("click", () => {
            // Si un lien est présent → ouvre le lien dans un nouvel onglet
            if (btn.dataset.link) {
                window.open(btn.dataset.link, "_blank");
            } else {
                // Sinon envoie la suggestion au chatbot
                handleSuggestionClick(btn.innerHTML);
            }
        });
    });
}


function sendMessage() {
    const input = document.getElementById("userInput");
    const message = input.value.trim();
    if (message === "") return;

    displayUserMessage(message);
    addToConversation('user', message);
    input.value = "";

    document.getElementById("input-container").classList.add("fixed-bottom");

    let data = sendMessageToServer(message).then(data => {

        // CAS 1 — Aucun réponse + lien vers formulaire
        if (data.type === "no_answer") {
            addMessageToQueue(data.message);
            addToConversation("bot", data.message);

            messageQueue.push(() => displaySuggestions(data.suggestions));
            return;
        }

        // CAS 2 — Suggestions multiples
        if (data.type === "suggestions") {
            addMessageToQueue(data.message);
            addToConversation("bot", data.message);

            messageQueue.push(() => displaySuggestions(data.suggestions));
            return;
        }

        // CAS 3 — Réponse simple
        if (data.type === "simple") {
            data.message.forEach(msg => {
                addMessageToQueue(msg);
                addToConversation("bot", msg);
            });
            return;
        }

        // CAS 4 — Erreur
        addMessageToQueue("Désolé, une erreur est survenue.");
        addToConversation("bot", "Désolé, une erreur est survenue.");
    });

    console.log(data);
}


