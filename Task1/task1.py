def trailing_zeroes(n):
    count = 0
    while n >= 5:
        n //= 5
        count += n
    return count

n = int(input("Введите N: "))
print("Конечных нулей:", trailing_zeroes(n))