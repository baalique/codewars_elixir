# https://www.codewars.com/kata/5d16af632cf48200254a6244

defmodule StrongestEvenNumber do

  def strongest_even(start, stop), do: get_strongest(start, stop, floor(:math.log2(stop)))

  defp get_strongest(start, stop, n) do
    case is_current_power_of_2_inside_interval?(start, stop, n) do
      true -> get_factor_inside_interval(start, stop, n)
      false -> get_strongest(start, stop, n - 1)
    end
  end

  defp get_factor_inside_interval(start, stop, n), do:
    get_factor_inside_interval(start, stop, n, div(start, round(:math.pow(2, n))))

  defp get_factor_inside_interval(start, stop, n, k) do
    current_factor = k * round(:math.pow(2, n))
    case current_factor >= start and current_factor <= stop do
      true -> current_factor
      false -> get_factor_inside_interval(start, stop, n, k + 1)
    end
  end

  defp is_current_power_of_2_inside_interval?(start, stop, n), do:
    (fn p -> div(start, p) != div(stop, p) or rem(start, p) == 0 end).(round(:math.pow(2, n)))

end
