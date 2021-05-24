# https://www.codewars.com/kata/58708934a44cfccca60000c4

defmodule RoboscriptOne do

  def highlight(code), do:
    code
    |> split_into_groups
    |> Enum.map(fn seq -> wrap(Enum.join(seq), Enum.at(seq, 0)) end)
    |> Enum.join


  defp split_into_groups(code), do:
    code
    |> String.graphemes
    |> split_into_groups([], [])
    |> Enum.map(& Enum.reverse(&1))
    |> Enum.reverse

  defp split_into_groups([], stack, acc), do: [stack | acc]
  defp split_into_groups([head | tail], [], acc), do: split_into_groups(tail, [head], acc)
  defp split_into_groups([head | tail], stack, acc) do
    case is_same?(head, Enum.at(stack, 0)) do
      true -> split_into_groups(tail, [head | stack], acc)
      false -> split_into_groups(tail, [head], [stack | acc])
    end
  end

  defp is_same?(s1, s2) when s1 == s2 or ("0" <= s1 and s1 <= "9") and ("0" <= s2 and s2 <= "9"), do: true
  defp is_same?(_, _), do: false

  defp wrap(str, "F"), do: "<span style=\"color: pink\">#{str}</span>"
  defp wrap(str, "L"), do: "<span style=\"color: red\">#{str}</span>"
  defp wrap(str, "R"), do: "<span style=\"color: green\">#{str}</span>"
  defp wrap(str, sym) when "0" <= sym and sym <= "9", do: "<span style=\"color: orange\">#{str}</span>"
  defp wrap(str, _), do: str

end
