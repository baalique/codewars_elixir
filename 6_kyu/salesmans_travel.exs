# https://www.codewars.com/kata/56af1a20509ce5b9b000001e

defmodule SalesmanTravel do

  def travel([], zipcode), do: "#{zipcode}:/"
  def travel(addresses, zipcode) do
    addresses
    |> String.split(",")
    |> Enum.map(&parse_address/1)
    |> Enum.filter(fn [_, _, _, zip] -> zip == zipcode end)
    |> Enum.reduce([[], []], fn [_, num, street, _], [nums, streets] -> [[num | nums], [street | streets]] end)
    |> Enum.map(&(Enum.reverse(&1)))
    |> (fn [nums, streets] -> "#{zipcode}:#{Enum.join(streets, ",")}/#{Enum.join(nums, ",")}" end).()
  end

  defp parse_address(address), do:
    Regex.run(~r/^([0-9]+) ([\. a-zA-Z]+) ([A-Z]{2} [0-9]{5})/, address)

end
