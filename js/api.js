function sendMessageToServer(message) {
    return fetch('../php/fetch.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ 'message': message })
    })
    .then(response => response.text())
    .then(text => {
        console.log("Réponse brute du serveur : ", text);
        try {
            if (text.trim().startsWith("{") || text.trim().startsWith("[")) {
                let data = JSON.parse(text);
                let botResponses = Array.isArray(data.response) ? data.response : [data.response];

                if (botResponses.length === 0 || botResponses[0].trim() === "") {
                    return "Désolé, je n'ai pas encore de réponse à cette question.";
                } else {
                    return botResponses;
                }
            } else {
                throw new Error("Réponse invalide du serveur");
            }
        } catch (error) {
            console.error("Erreur de parsing JSON :", error);
            return "Désolé, il y a eu un problème avec la réponse.";
        }
    })
    .catch(error => {
        console.error("Erreur de requête :", error);
        return "Désolé, il y a eu un problème.";
    });
}
