# https://www.codewars.com/kata/5b40b666dfb4291ad9000049

defmodule Walker do

  @pi 3.14159265358979323846

  def solve(a, b, c, alpha, beta, gamma) do
    {x, y} = get_point_coordinates(a, b, c, to_radians(alpha), to_radians(beta), to_radians(gamma))
    len = get_length_from_coordinates({x, y})
    degrees = {x, y}
              |> get_angle_from_coordinates
              |> get_dms_from_decimal
    [len] ++ degrees
  end

  defp to_radians(angle), do: angle / 180 * @pi

  defp get_point_coordinates(a, b, c, alpha, beta, gamma), do:
    {a * :math.cos(alpha), a * :math.sin(alpha)}
    |> (fn {x, y} -> {x - b * :math.sin(beta), y + b * :math.cos(beta)} end).()
    |> (fn {x, y} -> {x - c * :math.cos(gamma), y - c * :math.sin(gamma)} end).()

  defp get_length_from_coordinates({x, y}), do:
    :math.pow(x * x + y * y, 0.5)
    |> round

  defp get_angle_from_coordinates({x, y}), do: :math.atan2(y, x) / @pi * 180

  defp get_dms_from_decimal(angle) do
    degrees = trunc(angle)
    minutes = trunc((angle - degrees) * 60)
    seconds = trunc((((angle - degrees) * 60) - minutes) * 60)
    [degrees, minutes, seconds]
  end

end
