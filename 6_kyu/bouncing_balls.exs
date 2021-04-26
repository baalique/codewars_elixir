# https://www.codewars.com/kata/5544c7a5cb454edb3c000047

defmodule Bouncingball do

  def bouncing_ball(h, bounce, window), do: count_bounces(h, bounce, window, 0)

  defp count_bounces(h, bounce, _, _) when bounce <= 0 or bounce >= 1, do: -1
  defp count_bounces(h, _, window, counter) when h <= window, do: counter - 1
  defp count_bounces(h, bounce, window, counter), do: count_bounces(h * bounce, bounce, window, counter + 2)

end
