# https://www.codewars.com/kata/58f5c63f1e26ecda7e000029

defmodule Wave do

  def wave(str) do
    str
    |> String.graphemes
    |> make_wave(0, [])
    |> Enum.map(&(Enum.join(&1)))
  end

  defp make_wave(seq, n, acc) when n == length(seq), do: Enum.reverse(acc)
  defp make_wave(seq, n, acc) do
    cond do
      Enum.at(seq, n) == " " -> make_wave(seq, n + 1, acc)
      true -> make_wave(seq, n + 1, [up_by_idx(seq, n) | acc])
    end
  end

  defp up_by_idx(seq, 0), do: [String.upcase(Enum.at(seq, 0))] ++ Enum.slice(seq, 1..-1)
  defp up_by_idx(seq, n), do: Enum.slice(seq, 0..n-1) ++ [String.upcase(Enum.at(seq, n))] ++ Enum.slice(seq, n + 1..-1)

end
