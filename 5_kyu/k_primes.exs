# https://www.codewars.com/kata/5726f813c8dcebf5ed000a6b

defmodule Kpremiers do

  def count_Kprimes(k, start, nd) do
    start..nd
    |> Enum.to_list
    |> Enum.filter(fn x -> get_kprime(x) == k end)
  end

  def puzzle(s) do
    a = count_Kprimes(1, 0, s)
    b = count_Kprimes(3, 0, s)
    c = count_Kprimes(7, 0, s)
    solutions =
      for x <- a, y <- b, z <- c, x + y + z == s, do: {x, y, z}
    length(solutions)
  end

  defp get_kprime(n), do: length(get_prime_factors(n))

  defp get_prime_factors(n) when n <= 1, do: []
  defp get_prime_factors(n), do: get_prime_factors(n, 2, [])
  defp get_prime_factors(n, current, acc) when current > n + 1, do: acc
  defp get_prime_factors(n, current, acc) when rem(n, current) == 0,
       do: get_prime_factors(div(n, current), current, [current | acc])
  defp get_prime_factors(n, current, acc), do: get_prime_factors(n, current + 1, acc)

end
