# https://www.codewars.com/kata/56cac350145912e68b0006f0

defmodule Updown do

  def arrange(""), do: ""
  def arrange(str), do: do_arrange(str)

  defp do_arrange(str), do:
    str
    |> String.split
    |> do_arrange(1, [])
    |> make_wave
    |> Enum.join(" ")

  defp do_arrange([head], _, acc), do: Enum.reverse([head | acc])

  defp do_arrange([h1, h2 | tail], sign, acc) do
    cond do
      String.length(h1) > String.length(h2) and sign == 1 or String.length(h1) < String.length(h2) and sign == -1 ->
        do_arrange([h1 | tail], -sign, [h2 | acc])
      true ->
        do_arrange([h2 | tail], -sign, [h1 | acc])
    end
  end

  defp make_wave(seq), do:
    seq
    |> Enum.reduce(
         {[], 1},
         fn x, {acc, sign} -> {[(if sign == 1, do: String.downcase(x), else: String.upcase(x)) | acc], -sign} end
       )
    |> (fn {seq, _} -> seq end).()
    |> Enum.reverse

end
