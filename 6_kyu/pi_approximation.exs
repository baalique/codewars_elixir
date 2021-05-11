# https://www.codewars.com/kata/550527b108b86f700000073f

defmodule Piapprox do

  def iter_pi(epsilon), do: get_pi(1, 1, epsilon, 0, 0)

  defp get_pi(denominator, sign, precision, counter, acc) do
    case abs(4 * acc - :math.pi) <= precision do
      false -> get_pi(denominator + 2, -sign, precision, counter + 1, acc + 1 / denominator * sign)
      true -> [counter, Float.floor(4 * acc, 10)]
    end
  end

end
