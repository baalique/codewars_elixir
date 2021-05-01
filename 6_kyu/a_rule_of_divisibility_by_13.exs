# https://www.codewars.com/kata/564057bc348c7200bd0000ff

defmodule Divisible13 do

  @remainders_seq [1, 10, 9, 12, 3, 4]

  def thirt(n), do: do_thirt(n)

  defp do_thirt(n), do: do_thirt(n, nil)
  defp do_thirt(n, n), do: n
  defp do_thirt(n, _), do: do_thirt(get_next_number(n), n)

  defp get_next_number(n), do:
    n
    |> Integer.digits
    |> Enum.reverse
    |> Enum.zip(Stream.cycle(@remainders_seq))
    |> Enum.reduce(0, fn {a, b}, acc -> a * b + acc end)

end
