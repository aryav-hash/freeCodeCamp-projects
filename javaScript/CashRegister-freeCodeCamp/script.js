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
};

const updateCashDrawer = () => {
    cid.forEach(([str, amt]) => {
        document.getElementById(str.toLowerCase()).textContent = `${str}: \$${amt}`;
    });
};

const updateCid = (sub) => {
    cid.forEach(([str, amt]) => {
        amt -= sub[str];
        document.getElementById(str.toLowerCase()).textContent = `${str}: \$${amt}`;
    });
};

const handOutChange = (dict) => {
    change.innerHTML = '';
    change.style.display = 'block';
    const p = document.createElement('p');
    p.textContent = 'Status: OPEN';
    change.appendChild(p);
    Object.entries(dict).forEach(([key, value]) => {
        if (value !== 0) {
            const p = document.createElement('p');
            p.textContent = `${key}: \$${value}`;
            change.appendChild(p);
        }
    });
    return ;
}; 

const close = (dict) => {
    change.innerHTML = '';
    change.style.display = 'block';
    const p = document.createElement('p');
    p.textContent = 'STATUS: CLOSED';
    change.appendChild(p);
    Object.entries(dict).forEach(([key, value]) => {
        if (value !== 0) {
            const p = document.createElement('p');
            p.textContent = `${key}: \$${value}`;
            change.appendChild(p);
        }
    });
    return ;
}

updateCashDrawer();

const calculateFunds = () => {
    const size = cid.length;
    let rem = Number(input.value) - Number(price);
    rem = Math.round(rem * 100) / 100;
    let sub = {
        'PENNY': 0,
        'NICKEL': 0,
        'DIME': 0,
        'QUARTER': 0,
        'ONE': 0,
        'FIVE': 0,
        'TEN': 0,
        'TWENTY': 0,
        'ONE HUNDRED': 0
    };

    let dict = {
        'PENNY': 0,
        'NICKEL': 0,
        'DIME': 0,
        'QUARTER': 0,
        'ONE': 0,
        'FIVE': 0,
        'TEN': 0,
        'TWENTY': 0,
        'ONE HUNDRED': 0
    };

    for (let i = size-1; i >= 0; i--) {
        if (m[cid[i][0]] > rem) {
            continue;
        }
        else {
            let currentAmt = cid[i][1];
            while (rem >= m[cid[i][0]] && currentAmt > 0) {
                rem = Math.round((rem - m[cid[i][0]])*100)/100;
                sub[cid[i][0]] += m[cid[i][0]];
                currentAmt = Math.round((currentAmt - m[cid[i][0]])*100)/100;
                dict[cid[i][0]] += m[cid[i][0]];
            }
        }
    }

    console.log(rem);
    if (rem !== 0) {
        change.innerHTML = '';
        change.style.display = 'block';
        const para = document.createElement('p');
        para.textContent = 'Status: INSUFFICIENT_FUNDS';
        change.appendChild(para);
        return ;
    }

    updateCid(sub);

    const val = cid.reduce((acc, curr) => acc + curr[1], 0);
    if (val === 0) {
        close(dict);
        return ;
    }
    handOutChange(dict);
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

