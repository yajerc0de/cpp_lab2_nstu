#include <iostream>
#include <string>
#include <sstream>
#include <locale.h>
using namespace std;

int main() {
    setlocale(LC_ALL, "Russian");

    int n;
    cout << "Введите количество чисел N: ";
    cin >> n;
    cin.ignore(); // очищаем буфер после ввода числа

    cout << "Введите " << n << " чисел через пробел (или по одному на строку):\n";
    string line;
    getline(cin, line);
    istringstream iss(line);

    int count = 0;
    string num;
    for (int i = 0; i < n; ++i) {
        if (!(iss >> num)) {
            // если чисел в строке не хватило, ждём дополнительный ввод
            cin >> num;
        }
        if (num.length() % 2 == 0)
            count++;
    }

    cout << "Результат: " << count << endl;
    return 0;
}