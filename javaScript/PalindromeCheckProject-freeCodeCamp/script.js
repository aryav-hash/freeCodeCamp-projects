const output = document.getElementById('result-text');
const checkBtn = document.getElementById('check-btn');
const input = document.getElementById('text-input');

const updateOutputToTrue = (text) => {
    output.textContent = `${text} is a palindrome`;
};

const updateOutputToFalse = (text) => {
    output.textContent = `${text} is not a palindrome`;
};

const checkForPalindrome = () => {
    const text = input.value;
    if (text === '') {
        alert("Please input a value.");
        return;
    }
    
    const currText = text.replace(/[.,\/#!$%\^&\*;:{}=\-_`~()\s]/g, '').toLowerCase();
    const tempString = currText.split('').reverse().join('');
    
    if (tempString === currText) {
        updateOutputToTrue(text);
    }
    else{
        updateOutputToFalse(text);
    }

    input.value = '';
};

checkBtn.addEventListener('click', checkForPalindrome);
