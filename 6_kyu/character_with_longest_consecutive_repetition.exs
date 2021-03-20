# https://www.codewars.com/kata/586d6cefbcc21eed7a001155

defmodule Kata do

  def longest_repetition(""), do: {"", 0}
  def longest_repetition(str) do
    str
    |> String.graphemes
    |> divide_into_subsequences([], [])
    |> Enum.filter(&(&1 != []))
    |> Enum.map(&({hd(&1), length(&1)}))
    |> Enum.reduce(&compare_tuples/2)
  end

  defp divide_into_subsequences([], last_subseq, acc), do: [last_subseq | acc]
  defp divide_into_subsequences([head | tail], last_subseq, acc) do
    cond do
      head in last_subseq -> divide_into_subsequences(tail, [head | last_subseq], acc)
      true -> divide_into_subsequences(tail, [head], [last_subseq | acc])
    end
  end

  defp compare_tuples({sym_a, count_a}, {sym_b, count_b}) do
    cond do
      count_a >= count_b -> {sym_a, count_a}
      true -> {sym_b, count_b}
    end
  end

end
