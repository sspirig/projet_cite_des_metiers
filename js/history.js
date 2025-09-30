let currentConversation = [];

function addToConversation(role, message) {
    currentConversation.push({ role, message, timestamp: new Date().toISOString() });
}

function saveConversation() {
    const chatBox = document.getElementById('chat-box');
    const conversationHTML = chatBox.innerHTML;
    if (!conversationHTML.trim()) return;
    fetch('../php/history.php?action=save', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ conversation_html: conversationHTML })
    }).then(() => {
        loadConversationList();
    });
}

function loadConversationDetail(id) {
    fetch(`../php/history.php?action=get&id=${id}`)
        .then(res => res.json())
        .then(data => {
            const chatBox = document.getElementById('chat-box');
            chatBox.innerHTML = data.conversation_html || '';
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
                li.style.cursor = 'pointer';
                li.onclick = () => loadConversationDetail(conv.id_historique);
                sidebar.appendChild(li);
            });
        });
}

window.addEventListener('DOMContentLoaded', loadConversationList);