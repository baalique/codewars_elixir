# https://www.codewars.com/kata/5539fecef69c483c5a000015

defmodule Back do

  def backwards_prime(start, stop) do
    start..stop
    |> Enum.to_list
    |> Enum.filter(
         fn x ->
           y = get_backwards_number(x)
           is_prime(x) and is_prime(y) and x != y
         end
       )
  end

  defp get_backwards_number(n),
       do: n
           |> to_string
           |> String.reverse
           |> Integer.parse
           |> (fn {x, _} -> x end).()

  defp is_prime(n) when rem(n, 2) == 0, do: false
  defp is_prime(n), do: is_prime(n, 3)
  defp is_prime(n, divisor) when divisor * divisor > n + 1, do: true
  defp is_prime(n, divisor) when rem(n, divisor) == 0, do: false
  defp is_prime(n, divisor), do: is_prime(n, divisor + 2)

end
