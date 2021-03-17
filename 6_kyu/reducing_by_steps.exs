# https://www.codewars.com/kata/56efab15740d301ab40002ee

defmodule Reducebystep do

  def som(a, b), do: a + b

  def maxi(a, b), do: if a > b, do: a, else: b

  def mini(a, b), do: if a > b, do: b, else: a

  def gcdi(a, b), do: Integer.gcd(abs(a), abs(b))

  def lcmu(a, b), do: div(abs(a * b), gcdi(a, b))

  def oper_array(fct, arr, init) do
    [_init | tail] =
      arr
      |> Enum.reduce([init], &([&2 | [fct.(&1, List.last(&2))]]))
      |> List.flatten
    tail
  end

end
