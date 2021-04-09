# https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991

defmodule Revrot do

  def revrot(_, 0), do: ""
  def revrot(str, sz) do
    str
    |> String.graphemes
    |> Enum.chunk_every(sz, sz, :discard)
    |> Enum.map(fn seq -> Enum.map(seq, &String.to_integer/1) end)
    |> Enum.map(
         fn seq ->
           case is_sum_of_cubes_even?(seq) do
             true -> Enum.reverse(seq)
             false -> rotate_left(seq, 1)
           end
         end
       )
    |> List.flatten
    |> Enum.join
  end

  defp is_sum_of_cubes_even?(seq),
       do: Enum.reduce(seq, &(&1 * &1 * &1 + &2))
           |> Kernel.rem(2)
           |> Kernel.==(0)

  defp rotate_left(seq, 0), do: seq
  defp rotate_left([head], _), do: [head]
  defp rotate_left([head | tail], n), do: rotate_left(tail ++ [head], n - 1)

end
