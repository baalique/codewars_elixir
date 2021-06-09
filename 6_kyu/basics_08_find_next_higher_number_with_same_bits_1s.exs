# https://www.codewars.com/kata/56bdd0aec5dc03d7780010a5

defmodule Kata do

  def next_higher(n), do:
    n
    |> Integer.digits(2)
    |> Enum.reverse
    |> get_next([])
    |> Enum.reverse
    |> Integer.undigits(2)

  defp get_next([], acc), do: tl(acc) ++ [0, 1]
  defp get_next([h1, h2 | tail], acc) when h1 == 1 and h2 == 0, do: Enum.reverse(Enum.sort(acc)) ++ [h2, h1] ++ tail
  defp get_next([head | tail], acc), do: get_next(tail, [head | acc])

end
