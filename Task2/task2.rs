use std::collections::HashSet;
use std::io;

fn main() {
    let morse: [&str; 26] = [
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---",
        "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-",
        "..-", "...-", ".--", "-..-", "-.--", "--.."
    ];

    println!("Введите слова:");
    let mut line = String::new();
    io::stdin().read_line(&mut line).unwrap();

    let mut unique = HashSet::new();

    for word in line.split_whitespace() {
        let mut dots = 0;
        let mut dashes = 0;

        for ch in word.chars() {
            if ch.is_ascii_alphabetic() {
                let idx = (ch.to_ascii_lowercase() as u8 - b'a') as usize;
                let code = morse[idx];
                dots += code.chars().filter(|&c| c == '.').count();
                dashes += code.chars().filter(|&c| c == '-').count();
            }
        }

        unique.insert((dots, dashes));
    }

    println!("Уникальных слов: {}", unique.len());
}