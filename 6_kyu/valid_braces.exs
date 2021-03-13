# https://www.codewars.com/kata/5277c8a221e209d3f6000b56

defmodule Challenge do

  @braces_mapping %{"{" => "}", "(" => ")", "[" => "]"}

  def valid_braces(braces) do
    is_valid_braces(braces, [])
  end

  defp is_valid_braces("", []), do: true

  defp is_valid_braces("", _), do: false

  defp is_valid_braces(braces, stack) do
    current_brace = String.at(braces, 0)
    case current_brace do
      b when b in ["{", "(", "["] -> is_valid_braces(String.slice(braces, 1..-1), [b | stack])
      b when b in ["}", ")", "]"] ->
        if current_brace == Map.get(@braces_mapping, Enum.at(stack, 0)) do
          is_valid_braces(String.slice(braces, 1..-1), Enum.slice(stack, 1..-1))
        else
          false
        end
    end
  end

end
