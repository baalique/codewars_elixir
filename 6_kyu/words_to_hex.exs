# https://www.codewars.com/kata/596e91b48c92ceff0c00001f

defmodule Kata do

  def words_to_hex(words), do: get_words_to_hex(words)

  defp get_words_to_hex(words), do: Enum.map(String.split(words, " "), &convert/1)

  defp convert(word) do
    word
    |> String.graphemes
    |> Enum.slice(0..2)
    |> Enum.map(&:binary.first/1)
    |> Enum.map(&Integer.to_string(&1, 16))
    |> Enum.join
    |> String.pad_trailing(6, "0")
    |> (fn str -> "#" <> str end).()
  end

end
