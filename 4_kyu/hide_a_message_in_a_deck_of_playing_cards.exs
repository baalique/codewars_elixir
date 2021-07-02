# https://www.codewars.com/kata/59b9a92a6236547247000110

defmodule PlayingCards do

  @abc " ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  @deck for suit <- String.graphemes("CDHS"), rank <- String.graphemes("A23456789TJQK"), do: rank <> suit

  def encode(message) do
    case is_valid_encode_input?(message) do
      true -> do_encode(message)
      false -> nil
    end
  end

  def decode(deck) do
    case is_valid_decode_input?(deck) do
      true -> do_decode(deck)
      false -> nil
    end
  end

  defp do_encode(message) do
    message
    |> convert_base_to_ten(@abc)
    |> get_nth_permutation(@deck)
  end

  defp do_decode(deck) do
    deck
    |> get_permutation_index(@deck)
    |> convert_ten_to_base(@abc)
    |> Enum.join
  end

  defp is_valid_encode_input?(message), do:
    Enum.all?(String.graphemes(message), fn sym -> sym in String.graphemes(@abc) end)
    and convert_base_to_ten(message, @abc) < factorial(52)

  defp is_valid_decode_input?(deck), do: length(deck) == length(@deck) and MapSet.new(deck) == MapSet.new(@deck)

  defp convert_base_to_ten(str, abc) do
    str
    |> String.graphemes
    |> Enum.with_index
    |> Enum.map(fn {val, idx} -> get_index(abc, val) * (pow(String.length(abc), String.length(str) - idx - 1)) end)
    |> Enum.sum
    |> round
  end

  defp convert_ten_to_base(n, abc), do: convert_ten_to_base(n, String.graphemes(abc), [])
  defp convert_ten_to_base(0, _, acc), do: acc
  defp convert_ten_to_base(n, abc, acc), do:
    convert_ten_to_base(div(n, length(abc)), abc, [Enum.at(abc, rem(n, length(abc))) | acc])

  defp get_nth_permutation(n, abc), do: get_nth_permutation(n, abc, rem(n, factorial(length(abc) - 1)), [])
  defp get_nth_permutation(n, abc, r, acc) do
    idx = div(n, factorial(length(abc) - 1))
    acc = [Enum.at(abc, idx) | acc]
    abc = List.delete_at(abc, idx)

    case r do
      0 -> Enum.reverse(acc) ++ abc
      _ -> get_nth_permutation(r, abc, rem(n, factorial(length(abc) - 1)), acc)
    end
  end

  defp get_permutation_index(deck, abc), do: get_permutation_index(deck, abc, 0)
  defp get_permutation_index([], _, acc), do: acc
  defp get_permutation_index([head | tail], abc, acc), do:
    get_permutation_index(tail, List.delete(abc, head), acc + get_index(abc, head) * factorial(length(abc) - 1))

  defp get_index(seq, val) when is_binary(seq), do: get_index(String.graphemes(seq), val)
  defp get_index(seq, val), do: Enum.find_index(seq, & &1 == val)

  defp factorial(n), do: factorial(n, 1)
  defp factorial(0, acc), do: acc
  defp factorial(n, acc), do: factorial(n - 1, acc * n)

  defp pow(x, n), do: pow(x, n, 1)
  defp pow(_, 0, acc), do: acc
  defp pow(x, n, acc), do: pow(x, n - 1, x * acc)

end
