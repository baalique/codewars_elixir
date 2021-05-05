# https://www.codewars.com/kata/55e2adece53b4cdcb900006c

defmodule Tortoise do

  def race(v1, v2, _) when v1 >= v2, do: nil
  def race(v1, v2, g), do:
    g / (v2 - v1) * 3600
    |> floor
    |> convert_seconds

  defp convert_seconds(n), do:
    [div(n, 3600), div(rem(n, 3600), 60), rem(n, 60)]

end
