# https://www.codewars.com/kata/58afce23b0e8046a960000eb

defmodule ATM do

  def withdraw(n) do
    get_hundreds = &div(&1, 100)
    get_twenties = &div(&1 - 100 * div(&1, 100), 20)

    case rem(n, 20) == 0 do
      true -> [get_hundreds.(n), 0, get_twenties.(n)]
      false -> [get_hundreds.(n - 50), 1, get_twenties.(n - 50)]
    end
  end

end
