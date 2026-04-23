import Foundation

print("Введите количество чисел N:")
guard let nStr = readLine(), let n = Int(nStr) else {
    fatalError("Неверный ввод")
}

print("Введите \(n) чисел через пробел:")
guard let numbersLine = readLine() else {
    fatalError("Нет данных")
}

let numbers = numbersLine.split(separator: " ")
var count = 0
for i in 0..<n {
    let num = i < numbers.count ? String(numbers[i]) : ""
    if num.count % 2 == 0 {
        count += 1
    }
}

print("Результат: \(count)")