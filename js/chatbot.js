/**
 * Projet: projet_cite_des_metiers
 * Fichier: chatbot.js
 * Auteurs: Louis.RBNSN, Zackary.IST, Santiago.SPRG
 * Date: 06.06.2025
 */
let messageQueue = [];
let isTyping = false;

function processQueue() {
    if (isTyping || messageQueue.length === 0) return;

    isTyping = true;
    const next = messageQueue.shift();

    if (typeof next === "function") {
        next();
        isTyping = false;
        processQueue();
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

