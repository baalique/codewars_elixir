# https://www.codewars.com/kata/550554fd08b86f84fe000a58

defmodule Whicharein do

  def in_array(array1, array2) do
    array1
    |> Enum.filter(fn el -> Enum.any?(array2, &(&1 =~ el)) end)
    |> Enum.sort
  end

end
