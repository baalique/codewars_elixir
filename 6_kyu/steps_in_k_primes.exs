# https://www.codewars.com/kata/5a48948e145c46820b00002f

defmodule KPStep do

  def kprimes_step(k, step, start, stop) do
    kprimes =
      start..stop
      |> Enum.to_list
      |> Enum.filter(fn x -> get_kprime(x) == k end)

    kprimes
    |> Enum.map(fn x -> [x, x + step] end)
    |> Enum.filter(fn [a, b] -> a in kprimes and b in kprimes end)
  end

  defp get_kprime(n), do: length(get_prime_factors(n))

  defp get_prime_factors(n) when n <= 1, do: []
  defp get_prime_factors(n), do: get_prime_factors(n, 2, [])
  defp get_prime_factors(n, current, acc) when current * current > n, do: [n | acc]
  defp get_prime_factors(n, current, acc) when rem(n, current) == 0,
       do: get_prime_factors(div(n, current), current, [current | acc])
  defp get_prime_factors(n, current, acc), do: get_prime_factors(n, current + 1, acc)

end
