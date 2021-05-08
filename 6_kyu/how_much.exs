# https://www.codewars.com/kata/55b4d87a3766d9873a0000d4

defmodule Howmuch do

  def howmuch(start, stop), do:
    count(min(start, stop), max(start, stop), [])
    |> Enum.map(fn x -> ["M: #{x}", "B: #{div(x, 7)}", "C: #{div(x, 9)}"] end)

  defp count(n, stop, acc) when n > stop, do: Enum.reverse(acc)
  defp count(n, stop, acc) when rem(n, 9) == 1 and rem(n, 7) == 2, do: count(n + 1, stop, [n | acc])
  defp count(n, stop, acc), do: count(n + 1, stop, acc)

end
