# https://www.codewars.com/kata/57eb8fcdf670e99d9b000272

defmodule Kata do

  def high(""), do: ""
  def high(str) do
    str
    |> String.split
    |> Enum.reduce(
         fn a, b ->
           if get_score(a) > get_score(b), do: a, else: b
         end
       )
  end

  def get_score(str),
      do: str
          |> String.to_charlist
          |> Enum.map(&(&1 - 96))
          |> Enum.sum

end
