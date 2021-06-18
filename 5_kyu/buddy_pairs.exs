# https://www.codewars.com/kata/59ccf051dcc4050f7800008f

defmodule Bud do

  def buddy(start, stop), do: get_buddy(start, stop)

  defp get_buddy(start, stop) when start > stop, do: "Nothing"
  defp get_buddy(start, stop) do
    sum = get_sum_of_divisors(start)
    case sum - 1 > start and start == get_sum_of_divisors(sum - 1) - 1 do
      true -> "#{start} #{sum - 1}"
      false -> get_buddy(start + 1, stop)
    end
  end

  defp get_sum_of_divisors(n) do
    1..round(:math.pow(n, 0.5))
    |> Enum.filter(& rem(n, &1) == 0)
    |> Enum.map(& [&1, div(n, &1)])
    |> List.flatten
    |> Enum.uniq
    |> Enum.sum
    |> Kernel.-(n)
  end

end
