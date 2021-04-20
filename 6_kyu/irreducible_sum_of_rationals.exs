# https://www.codewars.com/kata/5517fcb0236c8826940003c9

defmodule Sumfracts do

  def sum_fracts([]), do: nil
  def sum_fracts(seq) do
    denominator = get_divisor(seq)
    numerator =
      seq
      |> Enum.map(fn {a, b} -> div(a * denominator, b) end)
      |> Enum.sum
    cond do
      rem(numerator, denominator) == 0 ->
        div(numerator, denominator)
      true ->
        {div(numerator, Integer.gcd(numerator, denominator)), div(denominator, Integer.gcd(numerator, denominator))}
    end
  end

  defp get_divisor(seq), do:
    seq
    |> Enum.reduce(1, fn {_, b}, acc -> b * acc end)

end
