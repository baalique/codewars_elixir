# https://www.codewars.com/kata/59d7c910f703c460a2000034

defmodule Quest do

  def solomons_quest(seq), do: quest(seq)

  defp quest(seq), do: quest(seq, {0, {0, 0}})
  defp quest([], {_, {x, y}}), do: {x, y}
  defp quest([head | tail], {level, coords}), do: quest(tail, {get_level(head, level), get_coords(head, level, coords)})

  defp get_level({level_delta, _, _}, level), do: Enum.max([level + level_delta, 0])

  defp get_distance(level, distance), do: distance * round(:math.pow(2, level))

  defp get_coords({level_delta, direction, distance}, level, {x, y}), do:
    get_coords(get_level({level_delta, direction, distance}, level), direction, distance, {x, y})

  defp get_coords(level, 0, distance, {x, y}), do: {x, y + get_distance(level, distance)}
  defp get_coords(level, 1, distance, {x, y}), do: {x + get_distance(level, distance), y}
  defp get_coords(level, 2, distance, {x, y}), do: {x, y - get_distance(level, distance)}
  defp get_coords(level, 3, distance, {x, y}), do: {x - get_distance(level, distance), y}

end
