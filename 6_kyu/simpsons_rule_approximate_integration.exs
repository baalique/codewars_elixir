# https://www.codewars.com/kata/565abd876ed46506d600000d

defmodule Simpson do

  def simpson(n), do: formula(fn x -> 3 / 2 * :math.pow(:math.sin(x), 3) end, 0, :math.pi, n)

  defp formula(f, a, b, n), do:
    [&term_1/4, &term_2/4, &term_3/4]
    |> Enum.map(& &1.(f, a, b, n))
    |> Enum.sum
    |> Kernel.*((b - a) / (3 * n))

  defp term_1(f, a, b, _n), do: f.(a) + f.(b)
  defp term_2(f, a, b, n), do: (&(4 * Enum.sum(for i <- 1..div(n, 2), do: f.(a + (2 * i - 1) * &1)))).((b - a) / n)
  defp term_3(f, a, b, n), do: (&(2 * Enum.sum(for i <- 1..div(n, 2) - 1, do: f.(a + 2 * i * &1)))).((b - a) / n)

end
