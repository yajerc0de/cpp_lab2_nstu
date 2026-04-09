let nInput = prompt("Введите количество чисел N:");
let n = parseInt(nInput);

let numbersInput = prompt(`Введите ${n} чисел через пробел:`);
let numbers = numbersInput.trim().split(/\s+/);

let evenCount = 0;
for (let i = 0; i < n; i++) {
  let num = numbers[i] || ""; // если вдруг ввели меньше чисел
  if (num.length % 2 === 0) {
    evenCount++;
  }
}

console.log("Результат: " + evenCount);
alert("Результат: " + evenCount);