# https://www.codewars.com/kata/56c04261c3fcf33f2d000534

defmodule Magnet do

  def doubles(maxk, maxn), do: s(maxk, maxn)

  defp v(k, n), do: 1 / (k * :math.pow(n + 1, 2 * k))

  defp u(k, maxn), do: Enum.sum(Enum.map(1..maxn, &v(k, &1)))

  defp s(maxk, maxn), do: Enum.sum(Enum.map(1..maxk, &u(&1, maxn)))

end
