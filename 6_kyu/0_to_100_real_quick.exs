# https://www.codewars.com/kata/57d0dd58eca260728900140d

defmodule CountWithFingers do

  @fingers_map Enum.map(["0000", "1000", "1100", "1110", "1111"], &String.graphemes/1)

  def decode(fingers), do: do_decode(String.graphemes(fingers))

  defp do_decode(fingers) do
    left = Enum.reverse(Enum.slice(fingers, 0..4))
    right = Enum.slice(fingers, 5..9)

    case is_valid_hand?(left) and is_valid_hand?(right) do
      true -> 10 * decode_hand(left) + decode_hand(right)
      false -> -1
    end
  end

  defp is_valid_hand?([_ | tail]), do: tail in @fingers_map

  defp decode_hand([head | tail]), do: String.to_integer(head) * 5 + Enum.count(tail, & &1 == "1")

end
