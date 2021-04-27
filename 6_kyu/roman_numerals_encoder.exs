# https://www.codewars.com/kata/51b62bf6a9c58071c600001b

defmodule ArabicToRoman do

  @roman_map %{
               1 => "I",
               4 => "IV",
               5 => "V",
               9 => "IX",
               10 => "X",
               40 => "XL",
               50 => "L",
               90 => "XC",
               100 => "C",
               400 => "CD",
               500 => "D",
               900 => "CM",
               1000 => "M"
             }
             |> Map.to_list
             |> Enum.reverse


  def solution(number), do: convert_to_roman(number)

  defp convert_to_roman(n), do: convert_to_roman(n, @roman_map, [])
  defp convert_to_roman(_, [], acc), do:
    acc
    |> Enum.filter(&(&1))
    |> Enum.reverse
    |> Enum.join
  defp convert_to_roman(n, [{num, val} | tail], acc), do:
    convert_to_roman(n - div(n, num) * num, tail, [String.duplicate(val, div(n, num)) | acc])

end
