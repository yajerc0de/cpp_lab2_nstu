use std::io;

fn main() {
    println!("Введите количество чисел N:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let n: usize = input.trim().parse().unwrap();

    println!("Введите {} чисел через пробел (или по одному на строку):", n);
    let mut numbers = Vec::new();
    let mut line = String::new();
    io::stdin().read_line(&mut line).unwrap();
    
    for word in line.split_whitespace() {
        numbers.push(word.to_string());
    }

    // Если ввели меньше чисел, чем N, добираем из оставшихся строк
    while numbers.len() < n {
        let mut extra = String::new();
        io::stdin().read_line(&mut extra).unwrap();
        for word in extra.split_whitespace() {
            numbers.push(word.to_string());
        }
    }

    let count = numbers.iter().take(n).filter(|num| num.len() % 2 == 0).count();
    println!("Результат: {}", count);
}