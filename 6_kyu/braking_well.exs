# https://www.codewars.com/kata/565c0fa6e3a7d39dee000125

defmodule Brakingwell do

  @g 9.81
  @reaction_time 1

  def dist(v, mu), do: (fn u -> u * u / 2 / mu / @g + u * @reaction_time end).(to_mps(v))

  def speed(d, mu), do:
    (fn discr -> (:math.sqrt(discr) - @reaction_time) * (mu * @g) end).(:math.pow(@reaction_time, 2) + 2 * d / mu / @g)
    |> to_kmph

  defp to_mps(v), do: v / 3.6

  defp to_kmph(v), do: v * 3.6

end
