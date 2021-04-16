# https://www.codewars.com/kata/554a44516729e4d80b000012

defmodule Buycar do

  def nb_months(start_price_old, start_price_new, saving_per_month, percent_loss_by_month), do:
    make_calc(start_price_old, start_price_new, saving_per_month, percent_loss_by_month, 0, 0)

  defp make_calc(old, new, _, _, total, months) when old + total >= new, do:
    {months, round(old + total - new)}
  defp make_calc(old, new, saving, loss, total, months),
       do: make_calc(
         old * (1 - loss / 100),
         new * (1 - loss / 100),
         saving,
         count_loss(loss, months),
         total + saving,
         months + 1
       )

  defp count_loss(loss, months) do
    cond do
      rem(months, 2) == 0 -> loss + 0.5
      true -> loss
    end
  end

end
