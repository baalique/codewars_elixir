# https://www.codewars.com/kata/5a3357ae8058425bde002674

defmodule IterativeRotationCipher do

  def encode(n, str), do: do_encode(n, str)

  def decode(str), do: do_decode(str)

  defp do_encode(n, str), do: do_encode(n, str, 0)
  defp do_encode(n, str, n), do: "#{n} " <> str
  defp do_encode(n, str, cur), do: do_encode(n, encode_iter(n, str), cur + 1)

  defp do_decode(str), do: (&do_decode(String.to_integer(hd(&1)), Enum.join(tl(&1), " "), 0)).(String.split(str, " "))
  defp do_decode(n, str, n), do: str
  defp do_decode(n, str, cur), do: do_decode(n, decode_iter(n, str), cur + 1)

  defp encode_iter(n, str) do
    str
    |> String.graphemes
    |> Enum.filter(& &1 != " ")
    |> shift_seq(n)
    |> insert_spaces(get_spaces_indexes(str))
    |> Enum.join
    |> String.split(" ")
    |> Enum.map(&shift_seq(&1, n))
    |> Enum.join(" ")
  end

  defp decode_iter(n, str) do
    str
    |> String.split(" ")
    |> Enum.map(&shift_seq(&1, -n))
    |> Enum.join
    |> shift_seq(-n)
    |> insert_spaces(get_spaces_indexes(str))
    |> Enum.join
  end

  defp shift_seq([], _), do: []
  defp shift_seq(seq, n) when is_binary(seq), do: shift_seq(String.graphemes(seq), n)
  defp shift_seq(seq, n), do: (&Enum.slice(seq, -&1..-1) ++ Enum.slice(seq, 0..-&1 - 1)).
    ((&if &1 == 0, do: length(seq), else: &1).(rem(n, length(seq))))

  defp get_spaces_indexes(str) do
    str
    |> String.graphemes
    |> Enum.with_index
    |> Enum.reduce([], fn {val, idx}, acc -> if val == " ", do: [idx | acc], else: acc end)
    |> Enum.reverse
  end

  defp insert_spaces(seq, []), do: seq
  defp insert_spaces(seq, [head | tail]), do: insert_spaces(List.insert_at(seq, head, " "), tail)

end
