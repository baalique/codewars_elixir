# https://www.codewars.com/kata/581ee0db1bbdd04e010002fd

defmodule Approxinter do

  def interp(func, start, stop, n), do: do_interp(func, start, stop, n)

  defp do_interp(func, start, stop, n), do:
    do_interp(func, start, stop, (stop - start) / n, 0, n, [])
    |> Enum.map(fn x -> floor(x * 100) / 100 end)
    |> Enum.reverse

  defp do_interp(_, _, _, _, counter, n, acc) when counter >= n, do: acc
  defp do_interp(func, start, stop, d, counter, n, acc), do:
    do_interp(func, start + d, stop, d, counter + 1, n, [func.(start) | acc])

end
