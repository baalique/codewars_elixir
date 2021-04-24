# https://www.codewars.com/kata/598106cb34e205e074000031

defmodule Kata do

  def count_deaf_rats(str) do
    str
    |> split_string
    |> count_rats
  end

  defp split_string(str), do: split_string(String.replace(str, " ", ""), [])
  defp split_string("", acc), do: Enum.reverse(acc)
  defp split_string(str, acc) do
    case str do
      "P" <> tail -> split_string(tail, [0 | acc])
      "~O" <> tail -> split_string(tail, [-1 | acc])
      "O~" <> tail -> split_string(tail, [1 | acc])
    end
  end

  defp count_rats(seq), do: count_rats(seq, -1, 0)
  defp count_rats([], _, acc), do: acc
  defp count_rats([0 | tail], pattern, acc), do: count_rats(tail, -pattern, acc)
  defp count_rats([pattern | tail], pattern, acc), do: count_rats(tail, pattern, acc)
  defp count_rats([x | tail], pattern, acc) when x == -pattern, do: count_rats(tail, pattern, acc + 1)

end
