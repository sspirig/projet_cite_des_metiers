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

function displayUserMessage(message) {
    let chatBox = document.getElementById("chat-box");
    chatBox.innerHTML += `<div class='message question'><strong>Vous :</strong> ${message}</div>`;
}

function initializeChatUI() {
    let welcomeMessage = document.getElementById("welcome-message");
    setTimeout(() => {
        welcomeMessage.style.opacity = "0";
    }, 3000);

    setTimeout(() => {
        let chatContainer = document.getElementById("chat-container");
        let inputContainer = document.getElementById("input-container");
        let suggestions = inputContainer.querySelector(".suggestions");
        chatContainer.classList.add("active");
        inputContainer.classList.add("active");
        suggestions.classList.add("active");
    }, 3500);
}
