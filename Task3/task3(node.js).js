const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Введите количество чисел N: ', (nInput) => {
  const n = parseInt(nInput);
  
  rl.question(`Введите ${n} чисел через пробел: `, (numbersInput) => {
    const numbers = numbersInput.trim().split(/\s+/);
    let count = 0;
    
    for (let i = 0; i < n; i++) {
      const num = numbers[i] || '';
      if (num.length % 2 === 0) {
        count++;
      }
    }
    
    console.log('Результат:', count);
    rl.close();
  });
});