# https://www.codewars.com/kata/5eb9a92898f59000184c8e34

defmodule Kata do

  def sum_arrangements(num), do:
    num
    |> Integer.digits
    |> Enum.sum
    |> Kernel.*(factorial(length(Integer.digits(num)) - 1))
    |> Kernel.*(String.to_integer(String.duplicate("1", length(Integer.digits(num)))))

  defp factorial(n), do: factorial(n, 1)
  defp factorial(0, acc), do: acc
  defp factorial(n, acc), do: factorial(n - 1, acc * n)

end
