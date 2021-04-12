# https://www.codewars.com/kata/536a155256eb459b8700077e

defmodule Clockwise_spiral do

  def create_spiral(n) when n < 1, do: []
  def create_spiral(n) do
    n
    |> fill_with_zeros
    |> fill_spiral(1, 0, 0, n - 1)
  end

  defp fill_with_zeros(n), do: for _ <- 1..n, do: for _ <- 1..n, do: 0

  defp replace_element(arr, x, y, value), do: List.replace_at(arr, x, List.replace_at(Enum.at(arr, x), y, value))

  defp fill_spiral(arr, _, _, _, n) when n < 0, do: arr
  defp fill_spiral(arr, start_number, x, y, n),
       do: fill_spiral(fill_layer(arr, start_number, x, y, n), start_number + 4 * n, x + 1, y + 1, n - 2)

  defp fill_layer(arr, start_number, x, y, 0),
       do: arr
           |> fill_top(start_number, x, y, 1, 0)
  defp fill_layer(arr, start_number, x, y, n),
       do: arr
           |> fill_top(start_number, x, y, n, 0)
           |> fill_right(start_number + n, x, y + n, n, 0)
           |> fill_bottom(start_number + 2 * n, x + n, y + n, n, 0)
           |> fill_left(start_number + 3 * n, x + n, y, n, 0)

  defp fill_top(arr, _, _, _, n, n), do: arr
  defp fill_top(arr, start_number, x, y, n, count),
       do: fill_top(replace_element(arr, x, y, start_number), start_number + 1, x, y + 1, n, count + 1)

  defp fill_right(arr, _, _, _, n, n), do: arr
  defp fill_right(arr, start_number, x, y, n, count),
       do: fill_right(replace_element(arr, x, y, start_number), start_number + 1, x + 1, y, n, count + 1)

  defp fill_bottom(arr, _, _, _, n, n), do: arr
  defp fill_bottom(arr, start_number, x, y, n, count),
       do: fill_bottom(replace_element(arr, x, y, start_number), start_number + 1, x, y - 1, n, count + 1)

  defp fill_left(arr, _, _, _, n, n), do: arr
  defp fill_left(arr, start_number, x, y, n, count),
       do: fill_left(replace_element(arr, x, y, start_number), start_number + 1, x - 1, y, n, count + 1)

end
