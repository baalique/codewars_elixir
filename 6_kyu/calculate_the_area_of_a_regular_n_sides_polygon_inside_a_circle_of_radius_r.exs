# https://www.codewars.com/kata/5a58ca28e626c55ae000018a

defmodule Kata do

  def area_of_polygon_inside_circle(circle_radius, number_of_sides), do:
    Float.round(1 / 2 * :math.pow(circle_radius, 2) * number_of_sides * :math.sin(2 * :math.pi() / number_of_sides), 3)

end
