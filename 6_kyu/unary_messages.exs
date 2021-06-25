# https://www.codewars.com/kata/5e5ccbda30e9d0001ec77bb6

defmodule Kata do

  def send(s) do
    s
    |> String.graphemes
    |> encode
  end

  def receive(s) do
    s
    |> String.split(" ")
    |> decode
  end

  defp encode(seq) do
    seq
    |> Enum.map(&to_bits/1)
    |> Enum.join
    |> String.graphemes
    |> Enum.chunk_by(& &1)
    |> Enum.map(&convert_chunk_to/1)
    |> Enum.join(" ")
  end

  defp decode(seq) do
    seq
    |> Enum.chunk_every(2)
    |> Enum.map(&convert_chunk_from/1)
    |> Enum.join
    |> String.graphemes
    |> Enum.chunk_every(7)
    |> Enum.map(&Enum.join/1)
    |> Enum.map(&from_bits/1)
    |> List.to_string
  end

  defp to_bits(sym) do
    sym
    |> :binary.first
    |> Integer.to_string(2)
    |> String.pad_leading(7, "0")
  end

  defp from_bits(str) do
    str
    |> Integer.parse(2)
    |> elem(0)
  end

  defp convert_chunk_to(seq) when hd(seq) == "0", do: "00 " <> String.duplicate("0", length(seq))
  defp convert_chunk_to(seq) when hd(seq) == "1", do: "0 " <> String.duplicate("0", length(seq))

  defp convert_chunk_from(["0", str]), do: String.duplicate("1", String.length(str))
  defp convert_chunk_from(["00", str]), do: String.duplicate("0", String.length(str))

end
