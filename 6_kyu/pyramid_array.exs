# https://www.codewars.com/kata/515f51d438015969f7000013

defmodule Kata do

  def pyramid(0), do: []
  def pyramid(n), do: for x <- 1..n, do: make_list(x)

  defp make_list(1), do: [1]
  defp make_list(n), do: [1 | make_list(n - 1)]

end
