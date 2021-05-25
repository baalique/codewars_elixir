# https://www.codewars.com/kata/56b861671d36bb0aa8000819

defmodule Kata do

  def reverse_and_combine_text(text), do: do_reverse_and_combine(text)

  defp do_reverse_and_combine(text) do
    case text =~ " " do
      false -> text
      true -> text |> String.split(" ") |> concat |> do_reverse_and_combine
    end
  end

  defp concat(seq), do:
    seq
    |> Enum.map(&String.reverse/1)
    |> concat([])
    |> Enum.reverse
    |> Enum.join(" ")

  defp concat([], acc), do: acc
  defp concat([tail], acc), do: [tail | acc]
  defp concat([h1, h2 | tail], acc), do: concat(tail, [h1 <> h2 | acc])

end
