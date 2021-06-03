# https://www.codewars.com/kata/55b22ef242ad87345c0000b2

defmodule Kata do

  def choose(n, k), do: div(mul(n - k + 1, n), mul(1, k))

  defp mul(a, b), do: Enum.reduce(a..b, 1, & &1 * &2)

end
