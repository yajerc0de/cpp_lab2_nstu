morse = [
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---",
    "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-",
    "..-", "...-", ".--", "-..-", "-.--", "--.."
]

print("Введите слова:")
line = input().strip()
words = line.split()

unique = set()

for word in words:
    dots = 0
    dashes = 0
    for ch in word.lower():
        if 'a' <= ch <= 'z':
            code = morse[ord(ch) - ord('a')]
            dots += code.count('.')
            dashes += code.count('-')
    unique.add((dots, dashes))

print("Уникальных слов:", len(unique))