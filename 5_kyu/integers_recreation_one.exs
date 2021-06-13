# https://www.codewars.com/kata/55aa075506463dac6600010d

defmodule RecreationOne do

  def list_squared(m, n), do:
    m..n
    |> Enum.map(&is_squared_list/1)
    |> Enum.filter(& &1 != -1)

  defp is_squared_list(n), do:
    n
    |> get_divisors
    |> Enum.map(& &1 * &1)
    |> Enum.sum
    |> (&(if is_square(&1), do: {n, &1}, else: -1)).()

  defp get_divisors(n), do: get_divisors(n, 1, [])
  defp get_divisors(n, current, acc) when current > n / 2, do: [n | acc]
  defp get_divisors(n, current, acc) when rem(n, current) == 0, do: get_divisors(n, current + 1, [current | acc])
  defp get_divisors(n, current, acc), do: get_divisors(n, current + 1, acc)

  defp is_square(n), do: :math.sqrt(n) == round(:math.sqrt(n))

end
