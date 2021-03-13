# https://www.codewars.com/kata/558fc85d8fd1938afb000014

defmodule SmallSummer do

  def sum_two_smallest_numbers(numbers) do
    [a, b | _rest] =
      numbers
      |> Enum.sort()

    a + b
  end

end
