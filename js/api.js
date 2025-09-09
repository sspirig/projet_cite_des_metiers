/**
 * Projet: projet_cite_des_metiers
 * Fichier: api.js
 * Auteurs: Louis.RBNSN, Zackary.IST, Santiago.SPRG
 * Date: 06.06.2025
 */
function sendMessageToServer(message){
    return fetch('../php/fetch.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ 'message': message })
    })
    .then(response => response.json())
    .then(data => {
        let botResponses = Array.isArray(data.response) ? data.response : [data.response];
        console.log("Réponse analysée du serveur :", data);
        if (data.suggestions != undefined) {
            return data;
        }
        return botResponses.length > 0 ? botResponses : ["Désolé, je n'ai pas encore de réponse à cette question."];
    })
    .catch(error => {
        console.error("Erreur :", error);
        return ["Désolé, il y a eu un problème."];
    });
    
}

