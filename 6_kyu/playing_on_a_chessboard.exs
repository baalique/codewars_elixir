# https://www.codewars.com/kata/55ab4f980f2d576c070000f4

defmodule Chessboard do

  def game(n) when rem(n, 2) == 0, do: [round(n * n / 2)]
  def game(n) when rem(n, 2) != 0, do: [n * n, 2]

end
