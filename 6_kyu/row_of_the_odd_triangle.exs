# https://www.codewars.com/kata/5d5a7525207a674b71aa25b5

defmodule OddRow do

  def odd_row(n), do: for x <- 0..n - 1, do: n * n - n + 1 + 2 * x

end
