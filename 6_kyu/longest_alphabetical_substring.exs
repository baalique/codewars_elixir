# https://www.codewars.com/kata/5a7f58c00025e917f30000f1

defmodule Kata do

  def longest(str), do:
    str
    |> String.graphemes
    |> get_longest([], [])
    |> Enum.reverse
    |> Enum.reduce([], fn x, acc -> if length(x) > length(acc), do: x, else: acc end)
    |> Enum.reverse
    |> Enum.join

  defp get_longest([head], [], acc), do: [[head] | acc]
  defp get_longest([h1], [cur_h | cur_t], acc) when h1 >= cur_h, do: [[h1, cur_h | cur_t] | acc]
  defp get_longest([h1], [cur_h | cur_t], acc), do: [[h1], [cur_h | cur_t] | acc]
  defp get_longest([h1, h2 | tail], current, acc) when h1 > h2, do: get_longest([h2 | tail], [], [[h1 | current] | acc])
  defp get_longest([h1, h2 | tail], current, acc), do: get_longest([h2 | tail], [h1 | current], acc)

end
