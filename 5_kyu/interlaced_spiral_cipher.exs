# https://www.codewars.com/kata/5a24a35a837545ab04001614

defmodule InterlacedSpiralCipher do

  def encode(str), do: do_encode(str)

  def decode(str), do: do_decode(str)

  defp do_encode(str) do
    square = get_square(ceil(:math.sqrt(String.length(str))))
    str
    |> String.graphemes
    |> fill_square(square)
    |> List.flatten
    |> Enum.map(fn sym -> if sym == "", do: " ", else: sym end)
    |> Enum.join
  end

  defp do_decode(str) do
    str
    |> String.graphemes
    |> to_square
    |> get_from_square
    |> Enum.reverse
    |> Enum.join
    |> String.trim_trailing(" ")
  end

  defp get_square(len), do: List.duplicate(List.duplicate("", len), len)

  defp fill_square(seq, square), do: fill_square(seq, square, length(square), 0, 0, 0)
  defp fill_square([], square, _, _, _, _), do: square

  defp fill_square([head | tail], square, len, layer, 3, pos) when pos == len - 2 * (layer + 1), do:
    fill_square(tail, fill_square_at(square, head, len, layer, 3, pos), len, layer + 1, 0, 0)

  defp fill_square([head | tail], square, len, layer, 3, pos), do:
    fill_square(tail, fill_square_at(square, head, len, layer, 3, pos), len, layer, 0, pos + 1)

  defp fill_square([head | tail], square, len, layer, side, pos), do:
    fill_square(tail, fill_square_at(square, head, len, layer, side, pos), len, layer, side + 1, pos)

  defp fill_square_at(square, val, _len, layer, 0, pos), do: insert_at_matrix(square, val, layer + pos, layer)
  defp fill_square_at(square, val, len, layer, 1, pos), do: insert_at_matrix(square, val, len - layer - 1, layer + pos)
  defp fill_square_at(square, val, len, layer, 2, pos), do:
    insert_at_matrix(square, val, len - layer - pos - 1, len - layer - 1)

  defp fill_square_at(square, val, len, layer, 3, pos), do: insert_at_matrix(square, val, layer, len - layer - pos - 1)

  defp insert_at_matrix(matrix, val, x, y), do: List.replace_at(matrix, y, List.replace_at(Enum.at(matrix, y), x, val))

  defp to_square(seq), do: to_square(seq, get_square(ceil(:math.sqrt(length(seq)))), 0)
  defp to_square([], square, _), do: square
  defp to_square([head | tail], square, idx),
       do: to_square(tail, insert_at_matrix(square, head, rem(idx, length(square)), div(idx, length(square))), idx + 1)

  defp get_from_square(square), do: get_from_square(square, length(square), 0, 0, 0, [])
  defp get_from_square(_, len, _, _, _, acc) when length(acc) == len * len, do: acc
  defp get_from_square(square, len, layer, 3, pos, acc) when pos == len - 2 * (layer + 1), do:
    get_from_square(square, len, layer + 1, 0, 0, [get_from_square_at(square, len, layer, 3, pos) | acc])

  defp get_from_square(square, len, layer, 3, pos, acc), do:
    get_from_square(square, len, layer, 0, pos + 1, [get_from_square_at(square, len, layer, 3, pos) | acc])

  defp get_from_square(square, len, layer, side, pos, acc), do:
    get_from_square(square, len, layer, side + 1, pos, [get_from_square_at(square, len, layer, side, pos) | acc])

  def get_from_square_at(square, _len, layer, 0, pos), do: get_from_matrix(square, layer + pos, layer)
  def get_from_square_at(square, len, layer, 1, pos), do: get_from_matrix(square, len - layer - 1, layer + pos)
  def get_from_square_at(square, len, layer, 2, pos), do:
    get_from_matrix(square, len - layer - pos - 1, len - layer - 1)

  def get_from_square_at(square, len, layer, 3, pos), do: get_from_matrix(square, layer, len - layer - pos - 1)

  defp get_from_matrix(matrix, x, y), do: Enum.at(Enum.at(matrix, y), x)

end
