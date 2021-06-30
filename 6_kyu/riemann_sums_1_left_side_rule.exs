# https://www.codewars.com/kata/5562ab5d6dca8009f7000050

defmodule Riemann do

  def left(f, n, a, b) do
    delta = (a - b) / n
    0..n - 1
    |> Enum.map(fn k -> f.(a + k * delta) end)
    |> Enum.sum
    |> Kernel.*(delta)
  end

end
