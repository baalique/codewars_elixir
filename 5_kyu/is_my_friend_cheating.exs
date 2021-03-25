# https://www.codewars.com/kata/5547cc7dcad755e480000004

defmodule Removenb do

  def remov_nb(n) do
    total = div(n * (n + 1), 2)
    check_sum_equals_product(1, total, n, [])
  end

  defp check_sum_equals_product(n, _total, n, acc), do: Enum.reverse(acc)
  defp check_sum_equals_product(a, total, n, acc) do
    b = div(total - a, a + 1)
    cond do
      b == (total - a) / (a + 1) and b <= n -> check_sum_equals_product(a + 1, total, n, [{a, b} | acc])
      true -> check_sum_equals_product(a + 1, total, n, acc)
    end
  end

end
