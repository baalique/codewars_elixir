# https://www.codewars.com/kata/56fe17fcc25bf3e19a000292

defmodule Disguised2 do

  def v1(n, p) do
    0..n |> Enum.map(& :math.pow(-1, &1) * p * :math.pow(4, n - &1) * binomial(2 * n - &1, &1)) |> Enum.sum
  end

  def u1(n, p) do
    0..n |> Enum.map(& :math.pow(-1, &1) * p * :math.pow(4, n - &1) * binomial(2 * n - &1 + 1, &1)) |> Enum.sum
  end

  def v_eff(n, p), do: 2 * n * p + p

  def u_eff(n, p), do: n * p + p

  def binomial(n, k), do: div(factorial(n), factorial(k) * factorial(n - k))

  defp factorial(n), do: factorial(n, 1)
  defp factorial(0, acc), do: acc
  defp factorial(n, acc), do: factorial(n - 1, acc * n)

end
