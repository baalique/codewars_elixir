# https://www.codewars.com/kata/554f76dca89983cc400000bb

defmodule Dioph do

  def sol_equa(n), do:
    n
    |> get_factors
    |> Enum.filter(&is_correct?/1)
    |> Enum.map(&convert/1)
    |> Enum.reverse

  defp get_factors(n), do: get_factors(n, 1, [])
  defp get_factors(n, a, acc) when a * a > n, do: acc
  defp get_factors(n, a, acc),
       do: if rem(n, a) == 0, do: get_factors(n, a + 1, [{a, div(n, a)} | acc]), else: get_factors(n, a + 1, acc)

  defp is_correct?({a, b}), do: rem(a + b, 2) == 0 and rem(b - a, 4) == 0

  defp convert({a, b}), do: {div(a + b, 2), div(b - a, 4)}

end
