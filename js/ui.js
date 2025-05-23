function typeResponse(text, callback) {
    const chatBox = document.getElementById("chat-box");
    const responseDiv = document.createElement("div");
    responseDiv.classList.add("message", "response");
    responseDiv.innerHTML = `<strong>Chatbot :</strong> <span class="typing"></span>`;
    chatBox.appendChild(responseDiv);

    const typingSpan = responseDiv.querySelector(".typing");
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
    const chatBox = document.getElementById("chat-box");
    const messageDiv = document.createElement("div");
    messageDiv.classList.add("message", "question");
    messageDiv.innerHTML = `<strong>Vous :</strong> ${message}`;
    chatBox.appendChild(messageDiv);
    chatBox.scrollTop = chatBox.scrollHeight;
}


function displaySuggestions(suggestions) {
    const chatBox = document.getElementById("chat-box");

    const suggestionDiv = document.createElement("div");
    suggestionDiv.className = "message response";
    suggestionDiv.innerHTML = `
        <strong>Chatbot :</strong>
        <p class="mb-2 mt-1">Voici quelques options à explorer :</p>
        <div class="suggestion-buttons d-flex flex-wrap gap-2"></div>
    `;

    const buttonContainer = suggestionDiv.querySelector(".suggestion-buttons");

    suggestions.forEach(item => {
        const btn = document.createElement("button");
        btn.textContent = item.title;
        btn.onclick = () => {
            document.getElementById("userInput").value = item.title;
            sendMessage();
        };
        buttonContainer.appendChild(btn);
    });

    chatBox.appendChild(suggestionDiv);
    chatBox.scrollTop = chatBox.scrollHeight;
}




function initializeChatUI() {
    const welcomeMessage = document.getElementById("welcome-message");
    setTimeout(() => {
        welcomeMessage.style.opacity = "0";
    }, 3000);

    setTimeout(() => {
        document.getElementById("chat-container").classList.add("active");
        document.getElementById("input-container").classList.add("active");
    }, 3500);
}

