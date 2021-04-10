# https://www.codewars.com/kata/53ea3ad17b5dfe1946000278

defmodule Kata do

  def sierpinski(0), do: "L"
  def sierpinski(n), do: sierpinski(n - 1) <> "\n" <> double(sierpinski(n - 1))

  defp double(str) do
    str
    |> fill_string_with_whitespaces
    |> Enum.map(fn s -> s <> " " <> s end)
    |> Enum.map(&String.trim/1)
    |> Enum.join("\n")
  end

  defp fill_string_with_whitespaces(str) do
    bottom_length =
      str
      |> String.split("\n")
      |> Enum.at(-1)
      |> String.length
    str
    |> String.split("\n")
    |> Enum.map(fn s -> s <> String.duplicate(" ", bottom_length - String.length(s)) end)
  end

end
