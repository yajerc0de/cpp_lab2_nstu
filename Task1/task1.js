let input = prompt("Введите N:");
let n = parseInt(input);
let count = 0;
while (n >= 5) {
    n = Math.floor(n / 5);
    count += n;
}
console.log("Конечных нулей: " + count);
alert("Конечных нулей: " + count);