# https://www.codewars.com/kata/537ba77315ddd92659000fec

defmodule Goldbach do

  def check_goldbach(n), do: check(n)

  defp check(n) when rem(n, 2) == 1, do: {}
  defp check(n) when n <= 2, do: {}
  defp check(n), do: check(n, 2)
  defp check(n, x) do
    case is_prime?(x) and is_prime?(n - x) do
      true -> {x, n - x}
      false -> check(n, x + 1)
    end
  end

  defp is_prime?(2), do: true
  defp is_prime?(n) when rem(n, 2) == 0, do: false
  defp is_prime?(n), do: is_prime?(n, 3)
  defp is_prime?(n, divisor) when divisor * divisor > n + 1, do: true
  defp is_prime?(n, divisor) when rem(n, divisor) == 0, do: false
  defp is_prime?(n, divisor), do: is_prime?(n, divisor + 2)

end
