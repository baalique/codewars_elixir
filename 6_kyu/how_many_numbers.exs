# https://www.codewars.com/kata/55d8aa568dec9fb9e200004a

defmodule Howmanydig do

  def sel_number(n, d), do:
    0..n
    |> Enum.filter(&(is_okay?(&1, d)))
    |> length

  defp is_okay?(n, d), do:
    [&is_two_digits?/2, &is_increasing_digits?/2, &is_difference_not_exceed?/2]
    |> Enum.map(fn f -> f.(n, d) end)
    |> Enum.all?

  defp is_two_digits?(n, _), do: n >= 10

  defp is_increasing_digits?(n, _), do:
    Integer.to_string(n)
    |> String.graphemes
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce({0, true}, fn x, {val, res} -> if not res, do: {x, res}, else: {x, x > val} end)
    |> (fn {_, x} -> x end).()

  defp is_difference_not_exceed?(n, d), do:
    Integer.to_string(n)
    |> String.graphemes
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce({0, true}, fn x, {val, res} -> if res and val != 0, do: {x, x - val <= d}, else: {x, res} end)
    |> (fn {_, x} -> x end).()

end
