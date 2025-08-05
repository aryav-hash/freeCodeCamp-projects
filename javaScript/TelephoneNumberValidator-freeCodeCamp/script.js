const checkBtn = document.getElementById("check-btn");
const clearBtn = document.getElementById("clear-btn");
const result = document.getElementById("results-div");
const input = document.getElementById("user-input");

const showIncorrect = (num) => {
    const p = document.createElement("p");
    p.className = "output-text";
    p.textContent = `Invalid US number: ${num}`;
    p.style = "color: red";
    result.appendChild(p);
};

const showCorrect = (num) => {
    const p = document.createElement("p");
    p.className = "output-text";
    p.textContent = `Valid US number: ${num}`;
    p.style = "color: green";
    result.appendChild(p);
};

const checkParenthesis = (arr) => {
    let digits = 0;
    let i = 0, j = 0;
    
    while (i < arr.length && arr[i] != '(') {
        i++;
        if (arr[i] === ')') {
            return false;
        }
        if (/[0-9]/.test(arr[i])) {
            digits++;
        }
    }
    
    if (i === arr.length) {
        return true; 
    }
    else if (digits > 1) {
        return false;
    }
    
    j = i;
    while (j < arr.length && arr[j] != ')') {
        j++;
    }

    if (j === arr.length || j-i-1 !== 3) {
        return false;
    }

    j += 1;
    while (j < arr.length) {
        if (arr[j] === '(' || arr[j] === ')') {
            return false;
        }
        j++;
    }

    return true;
};

const check = () => {
    if (input.value === '') {
        alert("Please provide a phone number");
        return;
    }

    const inputNumber = input.value;
    let number = input.value;
    const accepted = /[0-9(]/;
    const regex = /[0-9()-\s]/;
    const checkCharacters =  number.split('').some((n) => !regex.test(n));

    if (!/[0-9]/.test(number[number.length-1]) || !accepted.test(number[0]) || number.length > 16 || number.length < 10 || checkCharacters) {
        showIncorrect(inputNumber);
        return;
    }
    
    const validParenthesis = checkParenthesis(number.split(''));
    if (validParenthesis) {
        number = number.replace(/[()]/g, '');
        number = number.replace(/-/g, " ");
    }
    else {
        showIncorrect(inputNumber);
        return ;
    }

    const dupSpace =/(\s\s)/;
    if (dupSpace.test(number)) {
        showIncorrect(inputNumber);
        return ;
    }

    const lastRegex = /^1?\s?\d{3}\s?\d{3}\s?\d{4}$/;
    if (lastRegex.test(number)) {
        showCorrect(inputNumber);
        return;
    }

    showIncorrect(inputNumber);

};

const remove = () => {
    result.innerHTML = '';
};

checkBtn.addEventListener("click", check);
clearBtn.addEventListener("click", remove);
