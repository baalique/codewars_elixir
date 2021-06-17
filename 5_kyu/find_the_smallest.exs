# https://www.codewars.com/kata/573992c724fc289553000e95

defmodule Tosmallest do

  def smallest(n), do: get_smallest(Integer.digits(n))

  defp get_smallest(seq) do
    swapped_seq = for first <- 0..length(seq) - 1,
                      second <- 0..length(seq) - 1, do:
                        {swap_indexes(seq, first, second), first, second}
    swapped_seq
    |> Enum.map(fn {nums, first, second} -> [Integer.undigits(nums), first, second] end)
    |> Enum.min
  end

  defp swap_indexes(seq, first, second) do
    seq
    |> List.delete_at(first)
    |> List.insert_at(second, Enum.at(seq, first))
  end

end
