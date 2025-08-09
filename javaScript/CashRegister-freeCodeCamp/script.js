const input = document.getElementById('cash');
const submit = document.getElementById('purchase-btn');
const change = document.getElementById('change-due');
let price = '3.26';

let cid = [
  ['PENNY', 1.01],
  ['NICKEL', 2.05],
  ['DIME', 3.1],
  ['QUARTER', 4.25],
  ['ONE', 90],
  ['FIVE', 55],
  ['TEN', 20],
  ['TWENTY', 60],
  ['ONE HUNDRED', 100]
];

let m = {
    'PENNY': 0.01,
    'NICKEL': 0.05,
    'DIME': 0.1,
    'QUARTER': 0.25,
    'ONE': 1,
    'FIVE': 5,
    'TEN': 10,
    'TWENTY': 20,
    'ONE HUNDRED': 100
}

const updateCashDrawer = (cid) => {
    cid.forEach(([str, amt]) => {
        document.getElementById(str.toLowerCase()).textContent = `${str}: ${amt}`;
    });
}

updateCashDrawer(cid);

const calculateFunds = () => {
    const size = cid.length;
    let price = Number(input.value);
    for (let i = size-1; i >= 0; i--) {
        if (m[cid[i][0]] > price) {
            continue;
        }
        else {
            while (price > m[cid[i][0]] && cid[i][1] > 0 && cid[i][0] - price) {

            }
        }
    }
}

const validateCash = () => {
    if (input.value < 3.26) {
        change.innerHTML = '';
        change.style.display = 'none';
        alert('Customer does not have enough money to purchase the item');
        return ;
    }
    if (input.value === price) {
        change.innerHTML = '';
        change.style.display = 'block';
        const para = document.createElement('p');
        para.textContent = 'No change due - customer paid with exact cash';
        change.appendChild(para);
        return ;
    }

    calculateFunds();
    return ;
};

submit.addEventListener('click', validateCash);

