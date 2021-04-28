# https://www.codewars.com/kata/51b6249c4612257ac0000005

defmodule Solution do

  @roman_map %{
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000
  }

  def decode(roman), do: convert_from_roman(roman)

  defp convert_from_roman(roman), do: convert_from_roman(String.graphemes(roman), 0)
  defp convert_from_roman([], acc), do: acc
  defp convert_from_roman([head], acc), do: get_roman(head) + acc
  defp convert_from_roman([h1, h2 | tail], acc) do
    cond do
      Map.has_key?(@roman_map, h1 <> h2) -> convert_from_roman(tail, get_roman(h1 <> h2) + acc)
      true -> convert_from_roman([h2 | tail], get_roman(h1) + acc)
    end
  end

  defp get_roman(str), do: Map.get(@roman_map, str)

end
