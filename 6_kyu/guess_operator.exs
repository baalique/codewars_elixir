# https://www.codewars.com/kata/60512be8bbc51a000a83d767

defmodule Kata do

  def operator(a, n, b), do: evaluate(a, b, n)

  defp evaluate(a, b, 0), do: 1 + b
  defp evaluate(a, b, 1), do: a + b
  defp evaluate(a, b, 2), do: a * b
  defp evaluate(a, b, 3), do: round(:math.pow(a, b))
  defp evaluate(a, b, 4), do: hyperpower(a, b)

  defp hyperpower(a, 1), do: a
  defp hyperpower(a, b), do: round(:math.pow(a, hyperpower(a, b - 1)))

end
