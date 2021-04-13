# https://www.codewars.com/kata/55f5efd21ad2b48895000040

defmodule Maxsumdig do

  def max_sum_dig(n, max_sum) do
    seq = 1000..n
          |> Enum.filter(&(is_correct?(&1, max_sum)))
    [
      length(seq),
      get_closest_number(get_mean(seq), seq),
      Enum.sum(seq)
    ]
  end

  defp is_correct?(n, max_sum) do
    n
    |> Integer.to_string
    |> String.graphemes
    |> Enum.map(&String.to_integer/1)
    |> get_sum_for_every_four_consec_digits
    |> Enum.all?(fn x -> x <= max_sum end)
  end

  defp get_sum_for_every_four_consec_digits(seq), do:
    for idx <- 0..length(seq) - 4,
    do: Enum.slice(seq, idx..idx + 3)
        |> Enum.sum

  defp get_mean(seq), do: Enum.sum(seq) / length(seq)

  defp get_closest_number(n, seq),
       do: seq
           |> Enum.map(fn x -> {x, abs(x - n)} end)
           |> Enum.reduce(
                fn {x, diff_x}, {acc, diff_acc} -> if diff_x < diff_acc, do: {x, diff_x}, else: {acc, diff_acc} end
              )
           |> (fn {x, _} -> x end).()

end
