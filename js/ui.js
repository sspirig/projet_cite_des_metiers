

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

function handleSuggestionClick(questionText) {
    const chatBox = document.getElementById("chat-box");

    chatBox.innerHTML += `<div class='message question'><strong>Vous :</strong> ${questionText}</div>`;
    document.getElementById("userInput").value = "";

    fetch('../php/fetch.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ message: questionText })
    })
        .then(res => res.text())
        .then(text => {
            try {
                let data = JSON.parse(text);

                if (data.response) {
                    const responses = Array.isArray(data.response) ? data.response : [data.response];
                    responses.forEach(resp => messageQueue.push(resp));
                }

                processQueue();
            } catch (e) {
                messageQueue.push("Désolé, une erreur est survenue.");
                processQueue();
            }
        })
        .catch(error => {
            console.error("Erreur fetch suggestion :", error);
            messageQueue.push("Erreur lors du traitement de la suggestion.");
            processQueue();
        });
}




function displaySuggestions(suggestions) {
    try {
        const chatBox = document.getElementById("chat-box");

        const suggestionDiv = document.createElement("div");
        suggestionDiv.className = "message response";
        suggestionDiv.innerHTML = `
        <strong>Chatbot :</strong>
        <p class="mb-2 mt-1">Voici quelques options à explorer :</p>
        <div class="suggestion-buttons d-flex flex-wrap gap-2"></div>
        `;

        const buttonContainer = suggestionDiv.querySelector(".suggestion-buttons");
        console.log("Suggestions reçues :", suggestions);
        suggestions.forEach(item => {
            const btn = document.createElement("button");
            btn.innerHTML = item.title;
            btn.classList.add("btn", "btn-outline-primary");
            btn.onclick = () => {
                handleSuggestionClick(item.title);
            };

            buttonContainer.appendChild(btn);
        });

        chatBox.appendChild(suggestionDiv);
        chatBox.scrollTop = chatBox.scrollHeight;
    } catch (error) {
        console.error(error);
    }

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


