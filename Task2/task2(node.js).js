const readline = require('readline');

const morse = [
  ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---",
  "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-",
  "..-", "...-", ".--", "-..-", "-.--", "--.."
];

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

console.log("Введите слова:");
rl.on('line', (line) => {
  const words = line.trim().split(/\s+/);
  const unique = new Set();

  words.forEach(word => {
    let dots = 0;
    let dashes = 0;

    for (let ch of word.toLowerCase()) {
      const idx = ch.charCodeAt(0) - 'a'.charCodeAt(0);
      if (idx >= 0 && idx < 26) {
        const code = morse[idx];
        for (let s of code) {
          if (s === '.') dots++;
          else if (s === '-') dashes++;
        }
      }
    }

    unique.add(`${dots},${dashes}`);
  });

  console.log('Уникальных слов:', unique.size);
  rl.close();
});