# https://www.codewars.com/kata/515de9ae9dcfc28eb6000001

defmodule SplitStrings do

  def solution(str) do
    case rem(String.length(str), 2) do
      1 -> split_strings(str <> "_", [])
      0 -> split_strings(str, [])
    end
  end

  defp split_strings("", stack), do: Enum.reverse(stack)
  defp split_strings(str, stack), do: split_strings(String.slice(str, 2..-1), [String.slice(str, 0..1) | stack])

end
