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
    let input = document.getElementById("userInput");
    let message = input.value.trim();
    if (message === "") return;

    displayUserMessage(message);
    input.value = "";

    sendMessageToServer(message).then(data => {
        if (typeof data === "object" && data.suggestions) {
            addMessageToQueue(data.response);
            displaySuggestions(data.suggestions);
        } else if (Array.isArray(data)) {
            data.forEach(msg => addMessageToQueue(msg));
        } else {
            addMessageToQueue(data);
        }
    });
}

