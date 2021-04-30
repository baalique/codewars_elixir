# https://www.codewars.com/kata/5ce399e0047a45001c853c2b

defmodule SumsParts do

  def parts_sums(seq), do: get_parts_sums(seq)

  defp get_parts_sums(seq), do: get_parts_sums(seq, [Enum.sum(seq)])
  defp get_parts_sums([], acc), do: Enum.reverse(acc)
  defp get_parts_sums([head | tail], [acc_head | acc_tail]), do:
    get_parts_sums(tail, [acc_head - head, acc_head | acc_tail])

end
