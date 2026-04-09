use std::io;

fn trailing_zeroes(mut n: i32) -> i32 {
    let mut count = 0;
    while n >= 5 {
        n /= 5;
        count += n;
    }
    count
}

fn main() {
    println!("Введите N:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let n: i32 = input.trim().parse().unwrap();
    println!("Конечных нулей: {}", trailing_zeroes(n));
}