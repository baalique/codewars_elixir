# https://www.codewars.com/kata/5365bb5d5d0266cd010009be

defmodule Currency do

  @coins [H: 50, Q: 25, D: 10, N: 5, P: 1]

  def make_change(amount), do: do_change(amount, @coins, %{})

  defp do_change(0, _, acc), do:
    Enum.filter(acc, fn {_, val} -> val > 0  end)
    |> Map.new(fn {k, v} -> {k, v} end)

  defp do_change(amount, [{c, val} | tail], acc), do:
    do_change(amount - val * div(amount, val), tail, Map.update(acc, c, div(amount, val), fn _ -> 0 end))

end
