# https://www.codewars.com/kata/587d7544f1be39c48c000109

defmodule Save do

  def harvester_rescue(data), do: get_rescue(data)

  defp get_rescue([harvester: h_coords, worm: [w_coords, w_speed], carryall: [c_coords, c_speed]]) do
    case get_distance(h_coords, c_coords) / c_speed + 1 < get_distance(h_coords, w_coords) / w_speed do
      true -> "The spice must flow! Rescue the harvester!"
      false -> "Damn the spice! I'll rescue the miners!"
    end
  end

  defp get_distance([x1, y1], [x2, y2]), do: :math.sqrt(:math.pow(x2 - x1, 2) + :math.pow(y2 - y1, 2))

end
