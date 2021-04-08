# https://www.codewars.com/kata/52c31f8e6605bcc646000082

defmodule TwoSum do

  def two_sum(numbers, target) do
    idxs =
      for {a, idx_a} <- Enum.with_index(numbers),
          {b, idx_b} <- Enum.with_index(numbers),
          idx_a != idx_b,
          a + b == target,
          do: {idx_a, idx_b}
    hd(idxs)
  end

end
