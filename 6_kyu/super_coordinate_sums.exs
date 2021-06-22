# https://www.codewars.com/kata/5966ec8e62d030d8530000a7

defmodule Kata do

  def super_sum(d, n), do: div(pow(n, d - 1) * d * (n - 1) * n, 2)

  defp pow(x, n), do: pow(x, n, 1)
  defp pow(_, 0, acc), do: acc
  defp pow(x, n, acc), do: pow(x, n - 1, x * acc)

end
