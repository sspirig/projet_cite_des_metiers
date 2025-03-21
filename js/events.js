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

    sendMessageToServer(message).then(response => {
        if (Array.isArray(response)) {
            response.forEach(msg => addMessageToQueue(msg));
        } else {
            addMessageToQueue(response);
        }
    });
}
