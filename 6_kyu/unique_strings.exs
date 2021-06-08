# https://www.codewars.com/kata/586c7cd3b98de02ef60001ab

defmodule UniqueStrings do

  def uniq_count(str), do: get_permutations(str)

  defp get_permutations(word), do:
    word
    |> String.upcase
    |> String.graphemes
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Enum.reduce(1, fn {_, v}, acc -> acc * factorial(v) end)
    |> (&(div(factorial(String.length(word)), &1))).()

  defp factorial(n), do: factorial(n, 1)
  defp factorial(0, acc), do: acc
  defp factorial(n, acc), do: factorial(n - 1, acc * n)

end
