# https://www.codewars.com/kata/581d1d669ae06274d5000074
# unsolved

defmodule Kata do

  def permutation_by_number(word, n), do: get_nth_permutation_with_repetitions(n, word)

  defp get_nth_permutation_with_repetitions(n, abc) when is_binary(abc), do:
    get_nth_permutation_with_repetitions(n, Enum.sort(String.graphemes(abc)))

  defp get_nth_permutation_with_repetitions(n, abc) do
    case get_number_of_possible_words(abc) > n do
      false -> ""
      true -> get_nth_permutation_with_repetitions(n, abc, [])
    end
  end

  defp get_nth_permutation_with_repetitions(_, [], acc), do: Enum.join(Enum.reverse(acc))
  defp get_nth_permutation_with_repetitions(n, abc, acc), do:
    get_nth_permutation_with_repetitions(n, hd(Enum.dedup(abc)), tl(Enum.dedup(abc)), abc, acc)

  defp get_nth_permutation_with_repetitions(n, current, [], abc, acc), do:
    get_nth_permutation_with_repetitions(n, List.delete(abc, current), [current | acc])

  defp get_nth_permutation_with_repetitions(n, current, [head | tail], abc, acc) do
    remainders = List.delete(abc, current)
                 |> get_number_of_possible_words
    cond do
      n < remainders -> get_nth_permutation_with_repetitions(n, List.delete(abc, current), [current | acc])
      true -> get_nth_permutation_with_repetitions(n - remainders, head, tail, abc, acc)
    end
  end

  defp get_number_of_possible_words(word) when is_binary(word), do:
    get_number_of_possible_words(String.graphemes(word))

  defp get_number_of_possible_words(word), do:
    word
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Enum.reduce(1, fn {_, v}, acc -> acc * factorial(v) end)
    |> (&(div(factorial(length(word)), &1))).()

  defp factorial(n), do: factorial(n, 1)
  defp factorial(0, acc), do: acc
  defp factorial(n, acc), do: factorial(n - 1, acc * n)

end

Kata.permutation_by_number("DMIOPHH", 2421)
|> IO.inspect
"PMHHIOD"