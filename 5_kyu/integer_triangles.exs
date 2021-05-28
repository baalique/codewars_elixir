# https://www.codewars.com/kata/55db7b239a11ac71d600009d

defmodule Intriangle do

  def give_triang(max_per) do
    max_per
    |> get_perimeters
    |> Enum.map(&(get_perimeters_with_coef(&1, max_per)))
    |> List.flatten
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.sort/1)
    |> MapSet.new
    |> MapSet.size
  end

  defp get_perimeters(per) do
    for m <- 1..per,
        n <- 1..per,
        n < m,
        Integer.gcd(n, m) == 1,
        p = (2 * m + n) * (m + n),
        p <= per,
        do: {m * m + m * n + n * n, 2 * m * n + n * n, m * m - n * n}
  end

  defp get_perimeters_with_coef(per, max_per), do: get_perimeters_with_coef(per, max_per, 1, [])
  defp get_perimeters_with_coef({a, b, c}, max_per, coef, acc) when (a + b + c) * coef > max_per, do: acc
  defp get_perimeters_with_coef({a, b, c}, max_per, coef, acc), do:
    get_perimeters_with_coef({a, b, c}, max_per, coef + 1, [{a * coef, b * coef, c * coef} | acc])

end
