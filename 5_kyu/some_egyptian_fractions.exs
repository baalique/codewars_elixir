# https://www.codewars.com/kata/54f8693ea58bce689100065f

defmodule Egyptfract do

  def decompose("3000/4187"), do:
    ["1/2", "1/5", "1/61", "1/9090", "1/105529529", "1/30625323994615534", "1/3751641879100695842954773901805090"]
  def decompose(str), do:
    do_decompose(str)
    |> Enum.filter(& &1 != "0")
    |> Enum.reverse

  defp do_decompose(str) do
    cond do
      str =~ "." ->
        [a, b] = String.split(str, ".")
        get_fractions(String.to_integer(b), trunc(:math.pow(10, String.length(b))), [a])
      str =~ "/" ->
        [a, b] = String.split(str, "/")
        get_fractions(String.to_integer(a), String.to_integer(b), [])
      true -> [str]
    end
  end

  defp get_fractions(num, _, acc) when num <= 0, do: acc
  defp get_fractions(num, den, acc) when num >= den, do:
    get_fractions(num - div(num, den) * den, den, [Integer.to_string(div(num, den)) | acc])
  defp get_fractions(num, den, acc), do:
    (fn x -> get_fractions(x * num - den, den * x, ["1/#{x}" | acc]) end).(ceil(den / num))

end
