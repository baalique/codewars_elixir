# https://www.codewars.com/kata/5a99a03e4a6b34bb3c000124

defmodule NumPrimorial do

  def num_primorial(n) do
    n
    |> get_prime_seq
    |> Enum.reduce(&(&1 * &2))
  end

  defp get_prime_seq(n), do: get_prime_seq(n - 1, 2, [])
  defp get_prime_seq(-1, _, acc), do: Enum.reverse(acc)
  defp get_prime_seq(n, current, acc) do
    cond do
      is_prime(current) -> get_prime_seq(n - 1, current + 1, [current | acc])
      true -> get_prime_seq(n, current + 1, acc)
    end
  end

  defp is_prime(n), do: is_prime(n, 2)
  defp is_prime(n, current) when current > n / 2, do: true
  defp is_prime(n, current) when rem(n, current) == 0, do: false
  defp is_prime(n, current), do: is_prime(n, current + 1)

end
