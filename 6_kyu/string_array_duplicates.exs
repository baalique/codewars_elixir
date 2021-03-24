# https://www.codewars.com/kata/59f08f89a5e129c543000069

defmodule Kata do

  def dup(seq), do:
    seq
    |> Enum.map(&remove_duplicate/1)

  defp remove_duplicate(str) when is_binary(str), do:
    str
    |> String.graphemes
    |> remove_duplicate
    |> Enum.join
  defp remove_duplicate(seq), do: Enum.reverse(remove_duplicate(seq, []))
  defp remove_duplicate([], acc), do: acc
  defp remove_duplicate([h1, h2 | tail], acc) when h1 == h2, do: remove_duplicate([h1 | tail], acc)
  defp remove_duplicate([head | tail], acc), do: remove_duplicate(tail, [head | acc])

end
