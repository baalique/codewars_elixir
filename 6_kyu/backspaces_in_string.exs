# https://www.codewars.com/kata/5727bb0fe81185ae62000ae3

defmodule Kata do

  def clean_string(str), do: do_clean_string(str)

  defp do_clean_string(str), do:
    str
    |> String.graphemes
    |> do_clean_string([])
    |> Enum.filter(&(&1 != "#"))
    |> Enum.reverse
    |> Enum.join
  defp do_clean_string([], acc), do: acc
  defp do_clean_string(["#" | tail], [_ | acc_tail]), do: do_clean_string(tail, acc_tail)
  defp do_clean_string([head | tail], acc), do: do_clean_string(tail, [head | acc])

end
