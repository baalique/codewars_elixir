# https://www.codewars.com/kata/55e86e212fce2aae75000060

defmodule Recre do

  def prod_2_sum(a, b, c, d), do: get_terms(a, b, c, d)

  defp get_terms(a, b, c, d) do
    sum = (a * a + b * b) * (c * c + d * d)
    all_terms = get_possible_terms([a, b, c, d])
    terms =
      for x <- all_terms, y <- all_terms, x * x + y * y == sum, do: [x, y]
    terms
    |> Enum.map(&Enum.sort/1)
    |> Enum.uniq
    |> Enum.sort
    |> Enum.reduce({}, fn x, acc -> Tuple.append(acc, x) end)
  end

  defp get_possible_terms([a, b, c, d]) do
    [{a * b, c * d}, {a * c, b * d}, {a * d, b * c}]
    |> Enum.map(fn {x, y} -> [abs(x + y), abs(x - y)] end)
    |> List.flatten
    |> Enum.uniq
    |> Enum.sort
  end

end
