# https://www.codewars.com/kata/5a057ec846d843c81a0000ad

defmodule Cycle1N do

  def cycle(n), do: get_cycle(n)

  defp get_cycle(n) when rem(n, 2) == 0 or rem(n, 5) == 0, do: -1
  defp get_cycle(n), do: get_cycle(n, 1, rem(10, n))
  defp get_cycle(_, counter, 1), do: counter
  defp get_cycle(n, counter, r), do: get_cycle(n, counter + 1, rem(r * 10, n))

end
