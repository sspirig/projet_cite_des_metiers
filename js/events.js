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

function sendMessage() {
    const input = document.getElementById("userInput");
    const message = input.value.trim();
    if (message === "") return;

    displayUserMessage(message);
    input.value = "";

    document.getElementById("input-container").classList.add("fixed-bottom");

    sendMessageToServer(message).then(data => {
        if (typeof data === "object" && data.suggestions) {
            addMessageToQueue(data.response); // le message "Voici plusieurs réponses..."
            messageQueue.push(() => displaySuggestions(data.suggestions)); // suggestions dynamiques
        } else if (Array.isArray(data)) {
            data.forEach(msg => addMessageToQueue(msg));
        } else {
            addMessageToQueue(data);
        }
    });



}



