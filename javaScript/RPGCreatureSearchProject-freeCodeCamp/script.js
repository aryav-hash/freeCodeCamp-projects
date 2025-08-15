//const URL = "https://rpg-creature-api.freecodecamp.rocks/api/creatures";
let details_URL = "https://rpg-creature-api.freecodecamp.rocks/api/creature/";

const input = document.getElementById('search-input');
const submitBtn = document.getElementById('search-button');
const displayName = document.getElementById('creature-name');
const displayId = document.getElementById('creature-id');
const displayWeight = document.getElementById('weight');
const displayHeight = document.getElementById('height');
const displayTypes = document.getElementById('types');
const displayHp = document.getElementById('hp');
const displayAttack = document.getElementById('attack');
const displayDefense = document.getElementById('defense');
const displaySA = document.getElementById('special-attack');
const displaySD = document.getElementById('special-defense');
const displaySpeed = document.getElementById('speed');

const api = async(userInput) => {
    try {
        let result = await fetch(details_URL + `${userInput.toLowerCase()}`);
        let data = await result.json();
        return data;
    }
    catch(err) {
        console.log(err);
    }
};

const clearOutput = () => {
    displayName.textContent = '';
    displayId.textContent = '';
    displayWeight.textContent = '';
    displayHeight.textContent = '';
    displayTypes.innerHTML = '';
    displayHp.textContent = '';
    displayAttack.textContent = '';
    displayDefense.textContent = '';
    displaySA.textContent = '';
    displaySD.textContent = '';
    displaySpeed.textContent = '';
};

const run = () => {
    clearOutput();
    const userInput = input.value;
    api(userInput).then((data) => {
        if (!data || !data.id) {
            alert("Creature not found");
            return;
        }

        displayName.innerHTML = `${data.name.toUpperCase()}`;
        displayId.textContent = `#${data.id}`;
        displayWeight.textContent = `Weight: ${data.weight}`;
        displayHeight.textContent = `Height: ${data.height}`;

        data.types.forEach(({name}) => {
            const span = document.createElement("span");
            span.className = "type";
            span.textContent = name;
            displayTypes.appendChild(span);
        });

        data.stats.forEach(({base_stat, name}) => {
            document.getElementById(name).textContent = base_stat;
        });
    });

};

submitBtn.addEventListener('click', run);