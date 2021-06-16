# https://www.codewars.com/kata/5edc8c53d7cede0032eb6029

defmodule SqNum do

  def solve(n), do: do_solve(n)

  defp do_solve(n), do: do_solve(n, round(:math.sqrt(n)))

  defp do_solve(_, k) when k < 1, do: -1
  defp do_solve(n, k) when rem(n, k) == 0 and rem(div(n, k) + k, 2) == 0 and div(n, k) != k, do:
    (& &1 * &1).(div(div(n, k) - k, 2))
  defp do_solve(n, k), do: do_solve(n, k - 1)

end
