# https://www.codewars.com/kata/5592e3bd57b64d00f3000047

defmodule Pilecubes do

  def find_nb(m), do: find_nb(m, 0)

  defp find_nb(0, current), do: current - 1
  defp find_nb(remain, current) when remain < current * current * current, do: -1
  defp find_nb(remain, current), do: find_nb(remain - current * current * current, current + 1)

end
