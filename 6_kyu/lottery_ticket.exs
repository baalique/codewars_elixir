# https://www.codewars.com/kata/57f625992f4d53c24200070e

defmodule LotteryTicket do

  def bingo(ticket, win) do
    ticket_sum =
      ticket
      |> Enum.map(&is_win?/1)
      |> Enum.map(&bool_to_int/1)
      |> Enum.sum

    cond do
      ticket_sum >= win -> "Winner!"
      true -> "Loser!"
    end
  end

  def is_win?([letters, number]), do: number in String.to_charlist(letters)

  def bool_to_int(bool) do
    if bool, do: 1, else: 0
  end

end
