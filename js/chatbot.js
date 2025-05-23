let messageQueue = [];
let isTyping = false;

function processQueue() {
    if (isTyping || messageQueue.length === 0) return;

    isTyping = true;
    const next = messageQueue.shift();

    if (typeof next === "function") {
        next(); // exécute une fonction comme displaySuggestions()
        isTyping = false;
        processQueue(); // continue la queue
    } else {
        typeResponse(next, () => {
            isTyping = false;
            processQueue();
        });
    }
}

function addMessageToQueue(message) {
    messageQueue.push(message);
    processQueue();
}
