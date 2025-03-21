let messageQueue = [];
let isTyping = false;

function processQueue() {
    if (isTyping || messageQueue.length === 0) return;

    isTyping = true;
    let text = messageQueue.shift();
    typeResponse(text, () => {
        isTyping = false;
        processQueue();
    });
}

function addMessageToQueue(message) {
    messageQueue.push(message);
    processQueue();
}
