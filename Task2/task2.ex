defmodule MorseUnique do
  @morse [
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---",
    "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-",
    "..-", "...-", ".--", "-..-", "-.--", "--.."
  ]

  def main do
    IO.puts("Enter words (multiple lines, Ctrl+D to finish):")
    
    input = 
      IO.stream(:stdio, :line)
      |> Stream.take_while(&(&1 != :eof))
      |> Enum.join(" ")

    words = String.split(input, ~r/\s+/, trim: true)
    
    unique =
      words
      |> Enum.map(&count_dots_dashes/1)
      |> Enum.uniq()
      |> length()

    IO.puts("Result: #{unique}")
  end

  defp count_dots_dashes(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.reduce({0, 0}, fn ch, {dots, dashes} ->
      if ch in ?a..?z do
        code = Enum.at(@morse, ch - ?a)
        code_chars = String.to_charlist(code)
        dots = dots + Enum.count(code_chars, &(&1 == ?.))
        dashes = dashes + Enum.count(code_chars, &(&1 == ?-))
        {dots, dashes}
      else
        {dots, dashes}
      end
    end)
  end
end

MorseUnique.main()