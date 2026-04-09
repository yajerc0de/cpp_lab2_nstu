#include <iostream>
#include <locale.h>
using namespace std;

int trailingZeroes(int n) {
    int count = 0;
    while (n >= 5) {
        n /= 5;
        count += n;
    }
    return count;
}

int main() {
    setlocale(LC_ALL, "Russian");
    int n;
    cout << "Введите N: ";
    cin >> n;
    cout << "Конечных нулей: " << trailingZeroes(n) << endl;
    cin.ignore();
    cout << "Нажмите Enter для выхода...";
    cin.get();
    return 0;
}