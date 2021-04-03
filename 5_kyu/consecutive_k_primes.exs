# https://www.codewars.com/kata/573182c405d14db0da00064e

defmodule Kconsec do

  def consec_Kprimes(k, arr) do
    arr
    |> Enum.map(&get_kprime/1)
    |> count_consec(k)
  end

  defp count_consec(seq, k), do: count_consec(seq, k, 0)
  defp count_consec([], _k, acc), do: acc
  defp count_consec([k, k | tail], k, acc), do: count_consec([k | tail], k, acc + 1)
  defp count_consec([_head | tail], k, acc), do: count_consec(tail, k, acc)

  defp get_kprime(n), do: length(get_prime_factors(n))

  defp get_prime_factors(n) when n <= 1, do: []
  defp get_prime_factors(n), do: get_prime_factors(n, 2, [])
  defp get_prime_factors(n, current, acc) when current > n + 1, do: acc
  defp get_prime_factors(n, current, acc) when rem(n, current) == 0,
       do: get_prime_factors(div(n, current), current, [current | acc])
  defp get_prime_factors(n, current, acc), do: get_prime_factors(n, current + 1, acc)

end
