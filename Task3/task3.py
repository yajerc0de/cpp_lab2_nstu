n = int(input("Введите количество чисел N: "))
print(f"Введите {n} чисел через пробел (или по одному на строку):")

numbers = []
while len(numbers) < n:
    numbers.extend(input().split())

count = sum(1 for num in numbers[:n] if len(num) % 2 == 0)
print("Результат:", count)