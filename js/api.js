/**
 * Projet: projet_cite_des_metiers
 * Fichier: api.js
 * Auteurs: Louis.RBNSN, Zackary.IST, Santiago.SPRG
 * Date: 06.06.2025
 */
function sendMessageToServer(message) {
    return fetch('../php/fetch.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ message: message })
    })
    .then(response => response.json())
    .then(data => {
        console.log("Réponse analysée du serveur :", data);

        let finalResponse = {
            type: "error",
            message: ["Désolé, une erreur est survenue."]
        };

        // CAS 1 — Aucune réponse trouvée -> lien vers formulaire
        if (data.suggestions && data.suggestions.length === 1 && data.suggestions[0].link) {
            finalResponse.type = "no_answer";
            finalResponse.message = data.response || "Je n'ai malheureusement pas encore la réponse à cette question.";
            finalResponse.suggestions = [
                {
                    title: data.suggestions[0].title || "Soumettre la question",
                    link: data.suggestions[0].link
                }
            ];
            return finalResponse;
        }

        // CAS 2 — Suggestions multiples
        if (data.suggestions && data.suggestions.length > 0) {
            finalResponse.type = "suggestions";
            finalResponse.message = data.response || "Voici quelques suggestions :";
            finalResponse.suggestions = data.suggestions.map(s => ({
                title: s.title || s.question || "Suggestion",
                text: s.text || ""
            }));
            return finalResponse;
        }

        // CAS 3 — Réponse simple
        if (data.response) {
            let responses = Array.isArray(data.response) ? data.response : [data.response];
            finalResponse.type = "simple";
            finalResponse.message = responses; // <-- garder un tableau pour UI
            return finalResponse;
        }

        // CAS 4 — Erreur
        return finalResponse;
    })
    .catch(error => {
        console.error("Erreur fetch API :", error);

        return {
            type: "error",
            message: ["Désolé, il y a eu un problème de connexion avec le serveur."]
        };
    });
}


