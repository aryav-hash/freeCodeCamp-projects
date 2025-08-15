const URL = "https://rpg-creature-api.freecodecamp.rocks/api/creatures";
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


const api = async() => {
    try {
        let result = await fetch(URL);
        let data = await result.json();
        return data;
    }
    catch(err) {
        console.log(err);
    }
};

const creatureApiCall = async(new_URL) => {
    try {
        let result = await fetch(new_URL);
        let data = await result.json();
        return data;
    }
    catch (err) {
        console.log(err);
    }
}   

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
    api().then((data) => {
        const creature = data.find(({id, name}) =>
            id === Number(userInput) || name.toLowerCase() === userInput.toLowerCase() 
        );

        if (!creature) {
            alert("Creature not found");
            return;
        }

        const new_url = details_URL + `${creature.id}`; 
        creatureApiCall(new_url).then((data) => {
            displayName.textContent = data.name;
            displayId.textContent = '#' + data.id;
            displayId.textContent = data.id;
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
    });

};

submitBtn.addEventListener('click', run);

