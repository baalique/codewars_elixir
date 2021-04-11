# https://www.codewars.com/kata/5b1cd19fcd206af728000056

defmodule Solv do

  def solve(m), do: (2 * m + 1 - :math.sqrt(4 * m + 1)) / (2 * m)

end
