# https://www.codewars.com/kata/559b8e46fa060b2c6a0000bf

defmodule Easydiagonal do

  def diagonal(n, p), do: get_diagonal(n, p)

  defp get_diagonal(n, 0), do: n + 1
  defp get_diagonal(n, p), do: get_diagonal(n, p, 0)
  defp get_diagonal(0, _, acc), do: acc
  defp get_diagonal(n, p, acc), do: get_diagonal(n - 1, p, acc + choose(n, p))

  defp choose(n, k), do: div(mul(n - k + 1, n), mul(1, k))

  defp mul(a, b), do: Enum.reduce(a..b, 1, & &1 * &2)

end
