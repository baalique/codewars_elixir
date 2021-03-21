# https://www.codewars.com/kata/559a28007caad2ac4e000083

defmodule Perim do

  def perimeter(n) do
    4 * Enum.sum(fib(n + 1))
  end

  defp fib(n), do: fib([1, 1], n)
  defp fib(seq, 2), do: Enum.reverse(seq)
  defp fib([h1, h2 | tail], n), do: fib([h1 + h2 | [h1, h2 | tail]], n - 1)

end
