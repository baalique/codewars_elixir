# https://www.codewars.com/kata/5921c0bc6b8f072e840000c0

defmodule Kata do

  def sequence_classifier(seq), do: classify(seq)

  defp classify(seq), do: classify(seq, [5, 3, 4, 1, 2, 0])

  defp classify([_], codes), do: hd(codes)
  defp classify([h1, h2 | tail], codes) when h1 == h2, do: classify([h2 | tail], delete_seq(codes, [1, 3]))
  defp classify([h1, h2 | tail], codes) when h1 < h2, do: classify([h2 | tail], delete_seq(codes, [3, 4, 5]))
  defp classify([h1, h2 | tail], codes) when h1 > h2, do: classify([h2 | tail], delete_seq(codes, [1, 2, 5]))

  defp delete_seq(seq, []), do: seq
  defp delete_seq(seq, [head | tail]), do: delete_seq(List.delete(seq, head), tail)

end
