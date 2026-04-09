const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Введите N: ', (answer) => {
  let n = parseInt(answer);
  let count = 0;
  while (n >= 5) {
    n = Math.floor(n / 5);
    count += n;
  }
  console.log('Конечных нулей:', count);
  rl.close();
});