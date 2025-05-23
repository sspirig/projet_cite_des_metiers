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
    messageDiv.className = "message question";
    messageDiv.innerHTML = `<strong>Vous :</strong> ${message}`;
    chatBox.appendChild(messageDiv);
    chatBox.scrollTop = chatBox.scrollHeight;
}

function displaySuggestedQuestions() {
    const questions = [
        "Combien de temps dure la formation ?",
        "Comment se déroule les inscriptions ?",
        "Quelles sont les différentes formations disponibles ?"
    ];

    const container = document.getElementById("suggested-questions");
    if (!container) return;

    container.innerHTML = "";

    questions.forEach(question => {
        const btn = document.createElement("button");
        btn.className = "btn btn-light";
        btn.textContent = question;
        btn.onclick = () => {
            document.getElementById("userInput").value = question;
            sendMessage();
        };
        container.appendChild(btn);
    });

    document.getElementById("suggestions-container").style.display = "block";
}

function displaySuggestions(suggestions) {
    const container = document.getElementById("suggested-questions");
    container.innerHTML = "";

    suggestions.forEach(item => {
        const btn = document.createElement("button");
        btn.className = "btn btn-outline-primary";
        btn.textContent = item.title;
        btn.onclick = () => {
            addMessageToQueue(item.text); // affiche la réponse directement
            container.innerHTML = "";      // vide les suggestions
            document.getElementById("suggestions-container").style.display = "none";
        };
        container.appendChild(btn);
    });

    document.getElementById("suggestions-container").style.display = "block";
}

function initializeChatUI() {
    const welcomeMessage = document.getElementById("welcome-message");
    setTimeout(() => {
        welcomeMessage.style.opacity = "0";
    }, 3000);

    setTimeout(() => {
        document.getElementById("chat-container").classList.add("active");
        document.getElementById("input-container").classList.add("active");
        displaySuggestedQuestions(); // suggestions initiales
    }, 3500);

    document.getElementById("suggestions-container").style.display = "none"; // masqué au départ
}
