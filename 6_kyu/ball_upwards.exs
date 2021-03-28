# https://www.codewars.com/kata/566be96bb3174e155300001b

defmodule Maxball do

  def max_ball(v0) do
    v0
    |> convert_speed
    |> get_time_of_max_height(0, 0)
  end

  defp get_time_of_max_height(v, t, h) do
    cond do
      h <= get_height(v, t / 10) -> get_time_of_max_height(v, t + 1, get_height(v, t / 10))
      true -> t - 1
    end
  end

  defp convert_speed(v), do: v / 3.6

  defp get_height(v, t), do: v * t - 0.5 * 9.81 * t * t

end
