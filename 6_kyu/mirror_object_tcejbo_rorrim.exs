# https://www.codewars.com/kata/586305e8916e244b66001a93

defmodule MapMirror do

  def mirror(map), do:
    map
    |> Map.to_list
    |> Enum.map(fn {key, _} -> {key, reflect(to_string(key))} end)
    |> Map.new

  defp reflect(str), do:
    str
    |> String.graphemes
    |> Enum.reverse
    |> Enum.join

end
