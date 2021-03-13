# https://www.codewars.com/kata/566fc12495810954b1000030

defmodule Countdigit do

  def nb_dig(n, d) do
    0..n
    |> Enum.map(&(&1 * &1))
    |> Enum.map(&(Integer.to_string(&1)))
    |> List.to_string
    |> String.graphemes
    |> Enum.filter(&(&1 == Integer.to_string(d)))
    |> Kernel.length
  end

end
