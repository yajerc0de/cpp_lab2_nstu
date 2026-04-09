const morse = [
  ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---",
  "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-",
  "..-", "...-", ".--", "-..-", "-.--", "--.."
];

let input = prompt("Введите слова через пробел:");
if (input) {
  let words = input.trim().split(/\s+/);
  let unique = new Set();

  words.forEach(word => {
    let dots = 0;
    let dashes = 0;

    for (let ch of word.toLowerCase()) {
      let idx = ch.charCodeAt(0) - 'a'.charCodeAt(0);
      if (idx >= 0 && idx < 26) {
        let code = morse[idx];
        for (let s of code) {
          if (s === '.') dots++;
          else if (s === '-') dashes++;
        }
      }
    }

    unique.add(dots + ',' + dashes);
  });

  console.log("Уникальных слов: " + unique.size);
  alert("Уникальных слов: " + unique.size);
}