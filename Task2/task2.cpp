#include <iostream>
#include <vector>
#include <string>
#include <set>
#include <sstream>

using namespace std;

const string morseCodes[26] = {
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---",
    "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-",
    "..-", "...-", ".--", "-..-", "-.--", "--.."
};

int main() {
    cout << "Введите слова:\n";

    string line;
    getline(cin, line);

    istringstream iss(line);
    string word;

    set<pair<int, int>> unique; // (точки, тире)

    while (iss >> word) {

        int dots = 0;
        int dashes = 0;

        for (char c : word) {
            c = tolower(c);
            string code = morseCodes[c - 'a'];

            for (char s : code) {
                if (s == '.') dots++;
                else if (s == '-') dashes++;
            }
        }

        unique.insert({dots, dashes});
    }

    cout << "Уникальных слов: " << unique.size() << endl;

    return 0;
}