# https://www.codewars.com/kata/556206664efbe6376700005c

defmodule Kata do
  @chars "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

  def is_polydivisible(num, base), do:
    0..String.length(num) - 1
    |> Enum.map(fn idx -> String.slice(num, 0..idx) end)
    |> Enum.with_index
    |> Enum.map(fn {val, idx} -> rem(convert_base_to_ten(val, base), idx + 1) == 0 end)
    |> Enum.all?

  def get_polydivisible(num, base), do: do_get_polydivisible(num, base, "0", 1)

  defp do_get_polydivisible(num, base, val, idx) do
    cond do
      is_polydivisible(val, base) and idx == num -> val
      is_polydivisible(val, base) -> do_get_polydivisible(num, base, incr_value(val, base), idx + 1)
      true -> do_get_polydivisible(num, base, incr_value(val, base), idx)
    end
  end

  defp incr_value(val, base), do:
    val
    |> convert_base_to_ten(base)
    |> Kernel.+(1)
    |> convert_base_from_ten(base)

  defp convert_base_to_ten(num, base), do:
    num
    |> String.graphemes
    |> Enum.with_index
    |> Enum.map(fn {val, idx} -> {val, String.length(num) - idx - 1} end)
    |> Enum.map(fn {val, idx} -> get_ord(val) * round(:math.pow(base, idx)) end)
    |> Enum.sum

  defp convert_base_from_ten(num, base), do: convert_base_from_ten(num, base, [])
  defp convert_base_from_ten(num, _, acc) when num == 0, do: Enum.join(acc)
  defp convert_base_from_ten(num, base, acc),
       do: convert_base_from_ten(div(num, base), base, [get_abc(rem(num, base)) | acc])

  defp get_ord(sym),
       do: @chars
           |> String.graphemes
           |> Enum.with_index
           |> Enum.filter(fn {value, _} -> value == sym end)
           |> (fn [{_, idx}] -> idx end).()

  defp get_abc(num), do: String.at(@chars, num)

end
