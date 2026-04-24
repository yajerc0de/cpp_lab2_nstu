import java.util.*;

public class task2 {
    private static final String[] MORSE = {
        ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---",
        "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-",
        "..-", "...-", ".--", "-..-", "-.--", "--.."
    };

    public static void main(String[] args) throws Exception {
        System.setOut(new java.io.PrintStream(System.out, true, "UTF-8"));
        java.util.Locale.setDefault(java.util.Locale.forLanguageTag("ru-RU"));

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
            unique.add(dots + "," + dashes);
        }

        System.out.println("Результат: " + unique.size());
    }
}