// Version simplifiée avec syntaxe moderne
const menuTrigger = document.querySelector('.menu-trigger');
menuTrigger.textContent = "☰";


if (menuTrigger) {
    menuTrigger.addEventListener('click', () => {
        document.body.classList.toggle('menu-active');
        console.info(menuTrigger.textContent);
        if (menuTrigger.textContent == "☰") {
            menuTrigger.textContent = "✖";
        } else if (menuTrigger.textContent == "✖") {
            menuTrigger.textContent = "☰";
        }
    });
}