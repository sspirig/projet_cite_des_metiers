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
    
    const suggestions = chatbox.querySelectorAll("#suggestionDiv");
    
    suggestions.forEach(div => {
    
        div.querySelectorAll("button").forEach(btn => {
            console.info(btn.innerHTML);
            btn.addEventListener("click", () => {
                handleSuggestionClick(btn.innerHTML);
                addClickEventSuggestions();
            });
        })
    })

}

function sendMessage() {
    const input = document.getElementById("userInput");
    const message = input.value.trim();
    if (message === "") return;

    displayUserMessage(message);
    addToConversation('user', message); // Ajout historique
    input.value = "";

    document.getElementById("input-container").classList.add("fixed-bottom");

    let data = sendMessageToServer(message).then(data => {
        if (typeof data === "object" && data.suggestions) {
            addMessageToQueue(data.response);
            addToConversation('bot', data.response); // Ajout historique
            messageQueue.push(() => displaySuggestions(data.suggestions));
        } else if (Array.isArray(data)) {
            data.forEach(msg => {
                addMessageToQueue(msg);
                addToConversation('bot', msg); // Ajout historique
            });
        } else {
            addMessageToQueue(data);
            addToConversation('bot', data); // Ajout historique
        }
    })
    console.log(data);
}


