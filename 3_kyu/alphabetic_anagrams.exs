# https://www.codewars.com/kata/53e57dada0cb0400ba000688

defmodule Kata do

  def list_position(word), do: get_list_position(word, 0, get_number_of_possible_words(word))

  defp get_list_position(word, left, right) do
    average = div(left + right, 2)
    current_word = get_nth_permutation_with_repetitions(average, Enum.sort(String.graphemes(word)))
    cond do
      word == current_word -> average + 1
      word > current_word -> get_list_position(word, average, right)
      word < current_word -> get_list_position(word, left, average)
    end
  end

  defp get_number_of_possible_words(word) when is_binary(word), do:
    get_number_of_possible_words(String.graphemes(word))
  defp get_number_of_possible_words(word), do:
    word
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Enum.reduce(1, fn {_, v}, acc -> acc * factorial(v) end)
    |> (&(div(factorial(length(word)), &1))).()

  defp get_nth_permutation_with_repetitions(n, abc) when is_binary(abc), do:
    get_nth_permutation_with_repetitions(n, String.graphemes(abc))
  defp get_nth_permutation_with_repetitions(n, abc), do: get_nth_permutation_with_repetitions(n, abc, [])
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

  defp factorial(n), do: factorial(n, 1)
  defp factorial(0, acc), do: acc
  defp factorial(n, acc), do: factorial(n - 1, acc * n)

end
