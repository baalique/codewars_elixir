# https://www.codewars.com/kata/5613d06cee1e7da6d5000055

defmodule StepPrimes do

  def step(_k, start, stop) when start == stop, do: []
  def step(k, start, stop) do
    cond do
      start + k <= stop and is_prime(start) and is_prime(start + k) -> [start, start + k]
      true -> step(k, start + 1, stop)
    end
  end

  defp is_prime(n) when rem(n, 2) == 0, do: false
  defp is_prime(n), do: is_prime(n, 3)
  defp is_prime(n, divisor) when divisor * divisor > n + 1, do: true
  defp is_prime(n, divisor) when rem(n, divisor) == 0, do: false
  defp is_prime(n, divisor), do: is_prime(n, divisor + 2)

end
