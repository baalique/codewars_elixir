# https://www.codewars.com/kata/555624b601231dc7a400017a

defmodule Josephus do

  def survivor(n, k), do: get_survivor(Enum.to_list(1..n), k, 0)

  defp get_survivor([item], _k, _current_idx), do: item
  defp get_survivor(items, k, current_idx) do
    current_idx = rem(current_idx + k - 1, length(items))
    get_survivor(List.delete_at(items, current_idx), k, current_idx)
  end

end
