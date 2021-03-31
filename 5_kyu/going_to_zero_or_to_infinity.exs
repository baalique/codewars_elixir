# https://www.codewars.com/kata/55a29405bc7d2efaff00007c

defmodule Going do

  def going(n) do
    n
    |> get_factors([1])
    |> Enum.filter(&(&1 < :math.pow(10, 200)))
    |> Enum.map(&(1 / &1))
    |> Enum.sum
    |> Float.floor(6)
  end

  defp get_factors(1, acc), do: acc
  defp get_factors(current, acc), do: get_factors(current - 1, [hd(acc) * current | acc])

end
