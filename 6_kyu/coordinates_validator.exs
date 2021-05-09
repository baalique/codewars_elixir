# https://www.codewars.com/kata/5269452810342858ec000951

defmodule Solution do

  def isValidCoordinates(coordinates), do:
    Regex.match?(
      ~r/^-?([0-8][0-9]|[0-9]|90)(\.[0-9]+)?, -?(180|[1][0-7][0-9]|0?[0-9][0-9]|[0-9])(\.[0-9]+)?$/,
      coordinates
    )

end
