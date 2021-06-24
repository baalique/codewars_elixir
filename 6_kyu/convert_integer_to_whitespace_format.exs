# https://www.codewars.com/kata/55b350026cc02ac1a7000032

defmodule Kata do

  def whitespace_number(0), do: " \n"
  def whitespace_number(n), do:
    get_leading(n) <> convert_integer(n) <> "\n"

  defp convert_integer(n) do
    n
    |> abs
    |> Integer.to_string(2)
    |> String.replace("0", " ")
    |> String.replace("1", "\t")
  end

  defp get_leading(n) when n > 0, do: " "
  defp get_leading(n), do: "\t"

end
