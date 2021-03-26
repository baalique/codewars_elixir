# https://www.codewars.com/kata/55b2d9bd2d3e974dfb000030

defmodule GuessIt do

  def guess(n, m) do
    for green <- 0..n, red <- 0..n, blue <- 0..n, green + red + blue == n, 5 * green + 4 * red + 3 * blue == m,
        do: {green, red, blue}
  end

end
