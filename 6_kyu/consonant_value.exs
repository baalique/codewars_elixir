# https://www.codewars.com/kata/59c633e7dcc4053512000073

defmodule Kata do

  @vowels ["a", "e", "i", "o", "u"]
  @alphabet String.graphemes("abcdefghijklmnopqrstuvwxyz")

  def solve(str) do
    str
    |> String.graphemes
    |> Enum.map(&replace_char/1)
    |> List.to_string
    |> String.split(" ")
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&get_sum_of_letter_seq/1)
    |> Enum.max
  end

  defp replace_char(sym) when sym in @vowels, do: " "
  defp replace_char(sym), do: sym

  def get_sum_of_letter_seq(str) do
    str
    |> String.graphemes
    |> Enum.map(&get_letter_value/1)
    |> Enum.sum
  end

  def get_letter_value(sym) do
    alphabet_map = Enum.zip(@alphabet, 1..Kernel.length(@alphabet))
                   |> Enum.into(%{})
    Map.get(alphabet_map, sym)
  end

end
