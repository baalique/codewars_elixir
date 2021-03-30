# https://www.codewars.com/kata/5550d638a99ddb113e0000a2

defmodule Josephus do

  def permutation(items, k), do: do_permutation(items, 0, k, [])

  defp do_permutation([], _current_idx, _k, acc), do: Enum.reverse(acc)
  defp do_permutation(items, current_idx, k, acc) do
    current_idx = rem(current_idx + k - 1, length(items))
    do_permutation(List.delete_at(items, current_idx), current_idx, k, [Enum.at(items, current_idx) | acc])
  end

end
