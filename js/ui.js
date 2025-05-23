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

function displaySuggestedQuestions() {
    const questions = [
        "Combien de temps dure la formation ?",
        "Comment se déroule les inscriptions ?",
        "Quelles sont les différentes formations disponibles ?"
    ];

    const container = document.getElementById('suggested-questions');
    if (!container) return;

    container.innerHTML = ""; 

    questions.forEach(question => {
        const btn = document.createElement('button');
        btn.className = "btn btn-light";
        btn.textContent = question;
        btn.onclick = () => {
            document.getElementById('userInput').value = question;
            sendMessage();
        };
        container.appendChild(btn);
    });
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
        displaySuggestedQuestions(); 
        inputContainer.classList.add("active");
        suggestions.classList.add("active");
    }, 3500);
}
