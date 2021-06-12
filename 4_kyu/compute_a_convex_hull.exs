# https://www.codewars.com/kata/5657d8bdafec0a27c800000f

defmodule Kata do

  def hull_method(points), do: get_convex_hull(Enum.uniq(points))

  defp get_convex_hull(points) do
    start = get_start_point(points)
    sorted_points =
      points
      |> List.delete(start)
      |> Enum.sort_by(&{get_polar_angle(&1, start), get_distance(&1, start)})
    get_convex_hull(List.delete_at(sorted_points, 0), [Enum.at(sorted_points, 0), start])
    |> filter_collinear
  end

  defp get_convex_hull([], stack), do: stack
  defp get_convex_hull([head | tail], stack) do
    get_convex_hull(tail, [head | get_stack(head, stack)])
  end

  defp get_stack(point, [h1, h2 | tail]) do
    case is_left_rotation?(h2, h1, point) do
      true -> [h1, h2 | tail]
      false -> get_stack(point, [h2 | tail])
    end
  end

  defp is_left_rotation?({ax, ay}, {bx, by}, {cx, cy}), do: (bx - ax) * (cy - by) - (by - ay) * (cx - bx) >= 0

  defp get_start_point(points), do: Enum.min_by(points, fn {x, y} -> {y, x} end)

  defp get_distance({x1, y1}, {x2, y2}), do: :math.sqrt(:math.pow(x2 - x1, 2) + :math.pow(y2 - y1, 2))

  defp get_polar_angle({x, y}, {x0, y0}), do: :math.atan2(y - y0, x - x0)

  defp filter_collinear(points) do
    odd_points = get_collinear_points(points)
    points
    |> Enum.reduce([], fn x, acc -> if x in odd_points, do: acc, else: [x | acc] end)
  end

  defp get_collinear_points([h1, h2 | tail]), do: get_collinear_points([h1, h2 | tail] ++ [h1, h2], [])

  defp get_collinear_points([_, _], acc), do: acc

  defp get_collinear_points([h1, h2, h3 | tail], acc) do
    case are_points_on_same_line?(h2, h1, h3) do
      true -> get_collinear_points([h2, h3 | tail], [h2 | acc])
      false -> get_collinear_points([h2, h3 | tail], acc)
    end
  end

  defp are_points_on_same_line?(a, b, c), do: get_distance(a, b) + get_distance(a, c) == get_distance(b, c)

end
