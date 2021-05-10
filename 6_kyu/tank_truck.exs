# https://www.codewars.com/kata/55f3da49e83ca1ddae0000ad

defmodule Tank do

  def tank_vol(h, d, vt), do:
    (fn theta -> vt * (theta - :math.sin(theta)) / (2 * :math.pi) end).(2 * :math.acos(1 - 2 * h / d))
    |> floor

end
