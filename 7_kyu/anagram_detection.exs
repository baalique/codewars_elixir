# https://www.codewars.com/kata/529eef7a9194e0cbc1000255

defmodule Anagram do
  def anagram?(first_string, second_string) do
    alphabet_sort(first_string) == alphabet_sort(second_string)
  end

  defp alphabet_sort(str) do
    str
    |> String.downcase()
    |> String.to_char_list()
    |> Enum.sort()
  end
end
