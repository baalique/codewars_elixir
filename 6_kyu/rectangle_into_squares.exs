# https://www.codewars.com/kata/55466989aeecab5aac00003e

defmodule Rec2sq do

  def squares_in_rect(l, w) when l == w, do: nil
  def squares_in_rect(l, w), do: Enum.reverse(squares_in_rect(l, w, []))
  def squares_in_rect(l, w, seq) when l == 1, do: List.duplicate(1, w) ++ seq
  def squares_in_rect(l, w, seq) when w == 1, do: List.duplicate(1, l) ++ seq
  def squares_in_rect(l, w, seq) when l > w, do: squares_in_rect(l - w, w, [w | seq])
  def squares_in_rect(l, w, seq) when l < w, do: squares_in_rect(l, w - l, [l | seq])
  def squares_in_rect(l, w, seq) when l == w, do: [l | seq]

end
