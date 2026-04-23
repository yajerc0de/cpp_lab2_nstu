import java.util.*;

public class task2 {
    // Международные коды Морзе для a..z
    private static final String[] MORSE = {
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---",
        "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-",
        "..-", "...-", ".--", "-..-", "-.--", "--.."
    };

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in, "UTF-8");
        System.out.println("Введите слова через пробел:");
        String line = scanner.nextLine();
        scanner.close();

        String[] words = line.trim().split("\\s+");
        Set<String> unique = new HashSet<>();

        for (String word : words) {
            int dots = 0;
            int dashes = 0;

            for (char ch : word.toLowerCase().toCharArray()) {
                if (ch >= 'a' && ch <= 'z') {
                    String code = MORSE[ch - 'a'];
                    for (char symbol : code.toCharArray()) {
                        if (symbol == '.') dots++;
                        else if (symbol == '-') dashes++;
                    }
                }
            }
            // Пара точек и тире как уникальный ключ
            unique.add(dots + "," + dashes);
        }

        System.out.println("Результат: " + unique.size());
    }
}