# https://www.codewars.com/kata/5868b2de442e3fb2bb000119

defmodule Closest do

  def closest(str), do: get_closest(str)

  defp get_closest(""), do: [{}, {}]
  defp get_closest(str) when is_binary(str), do: get_closest(String.split(str))
  defp get_closest(seq), do:
    seq
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index
    |> Enum.map(fn {val, idx} -> {get_weight(val), idx, val} end)
    |> get_permutations
    |> Enum.min(&compare/2)

  defp compare([{wx1, ix1, _}, {wy1, iy1, _}], [{wx2, ix2, _}, {wy2, iy2, _}]), do:
    {abs(wx1 - wy1), {wx1, wy1}, {ix1, iy1}} < {abs(wx2 - wy2), {wx2, wy2}, {ix2, iy2}}

  defp get_permutations(seq), do: for x <- seq, y <- seq, x != y, do: [x, y]

  defp get_weight(num), do:
    num
    |> Integer.digits
    |> Enum.sum

end
