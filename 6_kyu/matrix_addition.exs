# https://www.codewars.com/kata/526233aefd4764272800036f

defmodule Kata do

  def matrix_addition(a, b), do: add_rows(a, b, [])

  defp add_rows(a, b), do: add_rows(a, b, [])
  defp add_rows([], [], acc), do: Enum.reverse(acc)
  defp add_rows([h1 | t1], [h2 | t2], acc) when is_integer(h1), do: add_rows(t1, t2, [h1 + h2 | acc])
  defp add_rows([h1 | t1], [h2 | t2], acc), do: add_rows(t1, t2, [add_rows(h1, h2) | acc])

end
