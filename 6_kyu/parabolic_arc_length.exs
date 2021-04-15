# https://www.codewars.com/kata/562e274ceca15ca6e70000d3

defmodule Parab do

  def len_curve(n),
      do: 0..n - 1
          |> Enum.map(&(&1 / n))
          |> Enum.map(&({&1, &1 * &1, (&1 + 1 / n), :math.pow(&1 + 1 / n, 2)}))
          |> Enum.map(fn {x1, y1, x2, y2} -> distance(x1, y1, x2, y2) end)
          |> Enum.sum

  defp distance(x1, y1, x2, y2), do: :math.sqrt(:math.pow(x2 - x1, 2) + :math.pow(y2 - y1, 2))

end
