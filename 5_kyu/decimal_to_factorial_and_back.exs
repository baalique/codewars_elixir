# https://www.codewars.com/kata/54e320dcebe1e583250008fd

defmodule Dec2Fact do

  def dec_2_fact_string(num), do:
    do_decode(num)

  def fact_string_2_dec(str) do
    str
    |> String.graphemes
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index
    |> Enum.map(fn {value, idx} -> {value, String.length(str) - idx - 1} end)
    |> Enum.map(fn {value, idx} -> value * factorial(idx) end)
    |> Enum.sum
  end

  defp do_decode(num), do:
    num
    |> do_decode(36, [])
    |> Enum.reverse
    |> Enum.map(fn {n, _} -> get_abc(n) end)
    |> Enum.join
    |> String.trim_leading("0")

  defp do_decode(_, 0, acc), do: [{0, 0} | acc]
  defp do_decode(num, factor, acc) do
    possible_factor = factorial(factor)
    quotient = div(num, possible_factor)
    do_decode(num - quotient * possible_factor, factor - 1, [{quotient, factor} | acc])
  end

  defp factorial(n), do: factorial(n, 1)
  defp factorial(0, acc), do: acc
  defp factorial(n, acc), do: factorial(n - 1, acc * n)

  defp get_abc(n), do:
    "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    |> String.at(n)

end
