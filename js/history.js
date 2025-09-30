let currentConversation = [];

function addToConversation(role, message) {
    currentConversation.push({ role, message, timestamp: new Date().toISOString() });
}

function saveConversation() {
    if (currentConversation.length === 0) return;
    fetch('../php/history.php?action=save', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ conversation: currentConversation })
    }).then(() => {
        currentConversation = [];
        loadConversationList();
    });
}

function loadConversationList() {
    fetch('../php/history.php?action=list')
        .then(res => res.json())
        .then(list => {
            const sidebar = document.getElementById('conversation-list');
            sidebar.innerHTML = '';
            list.forEach(conv => {
                const li = document.createElement('li');
                li.textContent = `Chat du ${new Date(conv.date_conversation).toLocaleString()}`;
                li.dataset.id = conv.id_historique;
                li.onclick = () => loadConversationDetail(conv.id_historique);
                sidebar.appendChild(li);
            });
        });
}

function loadConversationDetail(id) {
    fetch(`../php/history.php?action=get&id=${id}`)
        .then(res => res.json())
        .then(messages => {
            const chatBox = document.getElementById('chat-box');
            chatBox.innerHTML = '';
            messages.forEach(msg => {
                if (msg.role === 'user') {
                    displayUserMessage(msg.message);
                } else {
                    typeResponse(msg.message, () => {});
                }
            });
        });
}