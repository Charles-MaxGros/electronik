const Translate = (function () {

    'use strict';
    class EnglishObject {
        static accueil = "Home"
        static catalogue = "Catalog"
        static contact = "Contact-Us"
        static seConnecter = "Login"
        static sInscrire = "SignUp"
        static saluer = "Hello"

    }
    class SpainObject {
        static accueil = "Hogar"
        static catalogue = "Catálogo"
        static contact = "Contáctenos"
        static seConnecter = "Inicia sesión"
        static sInscrire = "Para registrarse"
        static saluer = "Hola"

    }
    class FrenchObject {
        static accueil = "Accueil"
        static catalogue = "Catalogue"
        static contact = "Nous contacter"
        static seConnecter = "Se connecter"
        static sInscrire = "S'inscrire"
        static saluer = "Bonjour"

    }
    class itemBuilder {
        langage
        constructor(langage) {
            this.langage = langage;
        }
        createElement(tagName, attributes) {
            const element = document.createElement(tagName);
            attributes.forEach((value, key, attributes) => {
                element.setAttribute(key, value);
            });
            return element;
        }

    }
    class liItemBuilder extends  itemBuilder {
        link
        constructor(langage, link) {
            super(langage);
            this.link = link;
        }
        build(classe) {
            const aAttributes = new Map();
            aAttributes.set('href', this.link);
            const liAttributes = new Map();
            liAttributes.set('class', classe);
            const a = super.createElement('a', aAttributes);
            a.innerHTML = this.langage;
            const li = super.createElement('li', liAttributes);
            li.appendChild(a);
            return li;
        }
    }
    class pItemBuilder extends  itemBuilder {
        constructor(langage) {
            super(langage);
        }
        build(classe) {
            const aAttributes = new Map();

            const p = super.createElement('h3', aAttributes);
            p.innerHTML = this.langage;

            return p;
        }
    }


    function navListManager(navList, lang) {
        const accueilManager = new liItemBuilder(lang.accueil, 'index?page=index');
        const catalogueManager = new liItemBuilder(lang.catalogue, 'index?page=catalogue');
        const contactManager = new liItemBuilder(lang.contact, 'index?page=contact');


        const accueil = accueilManager.build('navItem');
        const catalogue = catalogueManager.build('navItem');
        const contact = contactManager.build('navItem');
        navList.appendChild(accueil);
        navList.appendChild(catalogue);
        navList.appendChild(contact);

    }
    function connectPanelManager(connectPanel, lang) {
        const seConnecterManager = new liItemBuilder(lang.seConnecter, 'index?page=login');
        const sInscrireManager = new liItemBuilder(lang.sInscrire, 'index?page=sign');

        const seConnecter = seConnecterManager.build('connectPanelItem');
        const sInscrire = sInscrireManager.build('connectPanelItem');

        connectPanel.appendChild(seConnecter);
        connectPanel.appendChild(sInscrire);
    }
    function greatMessageManager(greatMessage, lang) {
        const greatManager = new pItemBuilder(lang.saluer);
        const great = greatManager.build("great");
        greatMessage.appendChild(great);
    }

    function ChangeLangageGreat(greatMessage, navList, lang) {
        while (navList.firstElementChild) {
            navList.removeChild(navList.firstElementChild);
        }
        while (greatMessage.firstElementChild) {
            greatMessage.removeChild(greatMessage.firstElementChild);
        }
        if (lang === "en") {
            navListManager(navList, EnglishObject);
            greatMessageManager(greatMessage, EnglishObject);
        } else if (lang === "sp") {
            navListManager(navList, SpainObject);
            greatMessageManager(greatMessage, SpainObject);
        } else if (lang === "fr") {
            navListManager(navList, FrenchObject);
            greatMessageManager(greatMessage, FrenchObject);
        }
    }
    function ChangeLangage(connectPanel, navList, lang) {

        while (navList.firstElementChild) {
            navList.removeChild(navList.firstElementChild);
        }
        while (connectPanel.firstElementChild) {
            connectPanel.removeChild(connectPanel.firstElementChild);

        }
        if (lang === "en") {
            navListManager(navList, EnglishObject);
            connectPanelManager(connectPanel, EnglishObject);
        } else if (lang === "sp") {
            navListManager(navList, SpainObject);
            connectPanelManager(connectPanel, SpainObject);
        } else if (lang === "fr") {
            navListManager(navList, FrenchObject);
            connectPanelManager(connectPanel, FrenchObject);
        }
    }


    return {
        init: function () {

            const navList = document.getElementById('navList');

            navListManager(navList, FrenchObject);
            const connectPanel = document.getElementById('connectPanel');
            if (connectPanel !== null) {
                connectPanelManager(connectPanel, FrenchObject);

            }
            

            const optionMenu = document.querySelector(".select-menu"),
                    selectBtn = optionMenu.querySelector(".select-btn"),
                    options = optionMenu.querySelectorAll(".option"),
                    sBtn_text = optionMenu.querySelector(".sBtn-text");
            const greatMessage = document.getElementById("great");
            if (greatMessage !== null) {
                greatMessageManager(greatMessage, FrenchObject);

            }
            console.log(greatMessage);

            selectBtn.addEventListener("click", () => optionMenu.classList.toggle("active"));

            options.forEach(option => {
                option.addEventListener("click", () => {
                    let selectedOption = option.innerHTML;
                    sBtn_text.innerHTML = selectedOption;
                    if (connectPanel !== null) {
                        ChangeLangage(connectPanel, navList, option.getAttribute("data-lang"));

                    } else if (greatMessage !== null) {
                        ChangeLangageGreat(greatMessage, navList, option.getAttribute("data-lang"));

                    }

                    optionMenu.classList.remove("active");
                });

            });

        }
    };
}());
const navBarManager = (function (){
    const nav = document.querySelector(".nav"),
  searchIcon = document.querySelector("#searchIcon"),
  navOpenBtn = document.querySelector(".navOpenBtn"),
  navCloseBtn = document.querySelector(".navCloseBtn");

searchIcon.addEventListener("click", () => {
  nav.classList.toggle("openSearch");
  nav.classList.remove("openNav");
  if (nav.classList.contains("openSearch")) {
    return searchIcon.classList.replace("uil-search", "uil-times");
  }
  searchIcon.classList.replace("uil-times", "uil-search");
});

navOpenBtn.addEventListener("click", () => {
  nav.classList.add("openNav");
  nav.classList.remove("openSearch");
  searchIcon.classList.replace("uil-times", "uil-search");
});
navCloseBtn.addEventListener("click", () => {
  nav.classList.remove("openNav");
});

})();


