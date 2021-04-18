# https://www.codewars.com/kata/56445c4755d0e45b8c00010a

defmodule Bankerplan do

  def fortune(deposit, _, _, 1, _), do: deposit >= 0
  def fortune(deposit, percent, withdraw, years, inflation), do:
    fortune(
      deposit + trunc(deposit * percent / 100) - withdraw,
      percent,
      withdraw + trunc(withdraw * inflation / 100),
      years - 1,
      inflation
    )

end
