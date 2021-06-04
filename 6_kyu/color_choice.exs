# https://www.codewars.com/kata/55be10de92aad5ef28000023

defmodule Checkchoose do

  def checkchoose(total, n), do: get_number(total, n)

  defp get_number(total, n), do: get_number(total, n, 1)
  defp get_number(total, n, k) when n == k, do: -1

  defp get_number(total, n, k) do
    case choose(n, k) == total do
      false -> get_number(total, n, k + 1)
      true -> k
    end
  end

  defp choose(n, k), do: div(mul(n - k + 1, n), mul(1, k))

  defp mul(a, b), do: Enum.reduce(a..b, 1, & &1 * &2)

end
