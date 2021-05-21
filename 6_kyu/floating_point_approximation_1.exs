# https://www.codewars.com/kata/58184387d14fc32f2b0012b2

defmodule Approxsqrt do

  def f(x), do: calc(x)

  defp calc(x), do: calc(x, 1, 0)
  defp calc(_, 50, acc), do: acc
  defp calc(x, n, acc), do: calc(x, n + 1, acc + get_term(x, n))

  defp get_term(x, n), do:
    (:math.pow(-1, n) * factorial(2 * n) * :math.pow(x, n)) /
    ((1 - 2 * n) * :math.pow(factorial(n), 2) * :math.pow(4, n))

  defp factorial(n), do: factorial(n, 1)
  defp factorial(0, acc), do: acc
  defp factorial(n, acc), do: factorial(n - 1, acc * n)

end
