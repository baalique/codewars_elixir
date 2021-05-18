# https://www.codewars.com/kata/5286b2e162056fd0cb000c20

defmodule Collatz do

  def collatz(n), do: get_collatz(n)

  defp get_collatz(n), do:
    n
    |> get_collatz([])
    |> Enum.reverse
    |> Enum.map(&Integer.to_string/1)
    |> Enum.join("->")

  defp get_collatz(1, acc), do: [1 | acc]
  defp get_collatz(n, acc) when rem(n, 2) == 0, do: get_collatz(div(n, 2), [n | acc])
  defp get_collatz(n, acc) when rem(n, 2) == 1, do: get_collatz(3 * n + 1, [n | acc])

end
