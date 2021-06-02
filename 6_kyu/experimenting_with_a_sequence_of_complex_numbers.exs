# https://www.codewars.com/kata/5b06c990908b7eea73000069

defmodule F do

  def f(x, y, eps), do: get_f(x, y, eps)

  defp get_f(x, y, eps), do: get_f(:math.log(eps) / :math.log(:math.sqrt(x * x + y * y)))
  defp get_f(x) when x < 0, do: -1
  defp get_f(x), do: x

end
