# https://www.codewars.com/kata/5a045fee46d843effa000070

defmodule FactDecomp do

  def decomp(n), do: do_decomp(n)

  defp do_decomp(n) do
    n
    |> get_factorial_divisors
    |> Enum.frequencies
    |> Enum.sort(fn {n1, _}, {n2, _} -> n1 < n2 end)
    |> Enum.map(&get_power_string/1)
    |> Enum.join(" * ")
  end

  defp get_power_string({num, 1}), do: "#{num}"
  defp get_power_string({num, pow}), do: "#{num}^#{pow}"

  defp get_factorial_divisors(n), do: get_factorial_divisors(n, [])
  defp get_factorial_divisors(1, acc), do: acc
  defp get_factorial_divisors(n, acc), do: get_factorial_divisors(n - 1, get_prime_divisors(n) ++ acc)

  defp get_prime_divisors(n), do: get_prime_divisors(n, 2, [])
  defp get_prime_divisors(1, _, acc), do: acc
  defp get_prime_divisors(n, d, acc) when rem(n, d) == 0, do: get_prime_divisors(div(n, d), d, [d | acc])
  defp get_prime_divisors(n, d, acc), do: get_prime_divisors(n, d + 1, acc)

end
