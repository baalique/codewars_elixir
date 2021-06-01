# https://www.codewars.com/kata/536e9a7973130a06eb000e9f

defmodule Kata do

  def calculate_damage(your_type, opponent_type, attack, defense), do:
    50 * (attack / defense) * get_effectiveness(your_type, opponent_type)

  defp get_effectiveness(a, a), do: 0.5
  defp get_effectiveness(:fire, :grass), do: 2
  defp get_effectiveness(:grass, :fire), do: 0.5
  defp get_effectiveness(:fire, :water), do: 0.5
  defp get_effectiveness(:water, :fire), do: 2
  defp get_effectiveness(:fire, :electric), do: 1
  defp get_effectiveness(:electric, :fire), do: 1
  defp get_effectiveness(:water, :grass), do: 0.5
  defp get_effectiveness(:grass, :water), do: 2
  defp get_effectiveness(:water, :electric), do: 0.5
  defp get_effectiveness(:electric, :water), do: 2
  defp get_effectiveness(:grass, :electric), do: 1
  defp get_effectiveness(:electric, :grass), do: 1

end
