# https://www.codewars.com/kata/59b401e24f98a813f9000026

defmodule IntegerDepth do

  def compute_depth(n), do: get_depth(n)

  defp get_depth(n), do: get_depth(n, 1, MapSet.new(0..9))
  defp get_depth(_, counter, %MapSet{map: map}) when map_size(map) == 0, do: counter - 1
  defp get_depth(n, counter, set), do:
    get_depth(n, counter + 1, MapSet.difference(set, MapSet.new(Integer.digits(n * counter))))

end
