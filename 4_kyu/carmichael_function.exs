# https://www.codewars.com/kata/53c92d34689f84a2d5000e48

defmodule Kata do

  def carmichael(n), do: get_carmichael(n)

  defp get_carmichael(n) when not is_integer(n) or n <= 0, do: 0
  defp get_carmichael(n) do
    n
    |> get_prime_divisors
    |> Map.to_list
    |> Enum.map(fn {p, k} -> carmichael_prime_power(p, k) end)
    |> lcm
  end

  defp carmichael_prime_power(p, k) when p != 2, do: euler_function(p, k)
  defp carmichael_prime_power(p, k) when p == 2 and k in [1, 2], do: euler_function(p, k)
  defp carmichael_prime_power(p, k), do: div(euler_function(p, k), 2)

  defp euler_function(p, k), do: round(:math.pow(p, k - 1)) * (p - 1)

  defp lcm([]), do: 1
  defp lcm([a]), do: a
  defp lcm([a, b]), do: div(a * b, Integer.gcd(a, b))
  defp lcm([head | tail]), do: lcm([head, lcm(tail)])

  defp get_prime_divisors(n), do: get_prime_divisors(n, 2, %{})
  defp get_prime_divisors(1, _, acc), do: acc
  defp get_prime_divisors(n, d, acc) when d * d > n, do: Map.update(acc, n, 1, & &1 + 1)
  defp get_prime_divisors(n, d, acc) when rem(n, d) != 0, do: get_prime_divisors(n, d + 1, acc)
  defp get_prime_divisors(n, d, acc), do: get_prime_divisors(div(n, d), d, Map.update(acc, d, 1, & &1 + 1))

end
