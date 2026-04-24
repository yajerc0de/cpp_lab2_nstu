fun main() {

    System.setOut(java.io.PrintStream(System.out, true, "UTF-8"))
    
    print("Введите количество чисел N: ")
    val n = readln().toInt()

    println("Введите $n чисел через пробел:")
    val input = readln().trim().split("\\s+".toRegex())
    var count = 0

    for (i in 0 until n) {
        val num = if (i < input.size) input[i] else ""
        if (num.length % 2 == 0) count++
    }

    println("Результат: $count")
}