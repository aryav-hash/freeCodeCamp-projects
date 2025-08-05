const convertBtn = document.getElementById('convert-btn');
const input = document.getElementById('number');
const output = document.getElementById('output')

const romanNumeralConverter = () => {
    const str = input.value;
    if (str === '') {
        output.innerHTML = `
            <p style="text-align: center;" id="output-text">Please enter a valid number</p>
        `;
        output.style.visibility = 'visible';
        return;
    }

    const strNum = Number(str);
    if (strNum <= 0) {
        output.innerHTML = `
            <p style="text-align: center;" id="output-text">Please enter a number greater than or equal to 1</p>
        `;
        output.style.visibility = 'visible';
        return;
    }
    else if (strNum > 3999) {
        output.innerHTML = `
            <p style="text-align: center;" id="output-text">Please enter a number less than or equal to 3999</p>
        `;
        output.style.visibility = 'visible';
        return;
    }
    else {
        const chars = ["I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"];
        const nums = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000];
        
        let result = '';
        let n = strNum;
        while (n > 0) {
            const initialValue = n;
            for (let i = 0; i < 13; i++) {
                if (nums[i] === n) {
                    result += chars[i];
                    n = 0;
                    break;
                }
                else if (nums[i] > n) {
                    result += chars[i-1];
                    n -= nums[i-1];
                    break;
                }
            }
            
            if (n === initialValue) {
                n -= nums[12];
                result += chars[12];
            }
        }

        output.innerHTML = `
            <p style="text-align: center;" id="output-text">${result}</p>
        `;
        output.style.visibility = 'visible';
    }

};

convertBtn.addEventListener('click', romanNumeralConverter);
