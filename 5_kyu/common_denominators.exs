# https://www.codewars.com/kata/54d7660d2daf68c619000d95

defmodule Denom do

  def convert_fracts([]), do: []
  def convert_fracts(seq) do
    seq
    |> Enum.map(&reduce_fraction/1)
    |> do_convert_fracts
  end

  def do_convert_fracts(seq) do
    lcm =
      seq
      |> Enum.map(&List.last/1)
      |> get_lcm

    seq
    |> Enum.map(&(convert_fraction(&1, lcm)))
  end

  defp get_lcm([a, b]), do: div(a * b, Integer.gcd(a, b))
  defp get_lcm([head | tail]), do: get_lcm([head, get_lcm(tail)])

  defp convert_fraction([num, denom], lcm), do: [num * div(lcm, denom), lcm]
  defp reduce_fraction([num, denom]), do: [div(num, Integer.gcd(num, denom)), div(denom, Integer.gcd(num, denom))]

end
