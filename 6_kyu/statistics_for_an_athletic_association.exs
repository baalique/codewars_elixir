# https://www.codewars.com/kata/55b3425df71c1201a800009c

defmodule AthleticAssociation do

  def stat(""), do: ""
  def stat(str) do
    str
    |> String.split(", ")
    |> Enum.map(&to_time/1)
    |> get_metrics
  end

  defp to_time(str) when is_binary(str), do: to_time(String.split(str, "|"))
  defp to_time([hours, minutes, seconds]),
       do: 60 * 60 * String.to_integer(hours) + 60 * String.to_integer(minutes) + String.to_integer(seconds)

  defp from_time(num), do: """
  #{
    div(num, 3600)
    |> add_head_zeros
  }\
  |#{
    div((num - div(num, 3600) * 3600), 60)
    |> add_head_zeros
  }\
  |#{
    rem(num, 60)
    |> add_head_zeros
  }\
  """

  defp add_head_zeros(num) when num < 10, do: "0#{num}"
  defp add_head_zeros(num), do: "#{num}"

  defp get_range(seq), do: Enum.max(seq) - Enum.min(seq)

  defp get_average(seq), do: div(Enum.sum(seq), length(seq))

  defp get_median(seq) when rem(length(seq), 2) == 1, do: Enum.at(Enum.sort(seq), div(length(seq), 2))
  defp get_median(seq) when rem(length(seq), 2) != 1, do:
    trunc((Enum.at(Enum.sort(seq), div(length(seq), 2) - 1) + Enum.at(Enum.sort(seq), div(length(seq), 2))) / 2)

  defp get_metrics(num), do:
    "Range: #{add_head_zeros(from_time(get_range(num)))} " <>
    "Average: #{add_head_zeros(from_time(get_average(num)))} " <>
    "Median: #{add_head_zeros(from_time(get_median(num)))}"

end
