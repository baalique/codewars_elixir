# https://www.codewars.com/kata/566543703c72200f0b0000c9

defmodule Disease do

  def epidemic(tm, n, s0, i0, b, a), do: trunc(get_epidemic(tm, n, s0, i0, b, a))

  defp get_epidemic(tm, n, s0, i0, b, a), do: get_epidemic(s0, i0, 0, a, b, tm / n, 0, n, [])
  defp get_epidemic(_, _, _, _, _, _, current, n, acc_i) when current >= n, do: Enum.max(acc_i)
  defp get_epidemic(s, i, r, a, b, dt, current, n, acc_i), do:
    get_epidemic(
      get_s(s, i, r, a, b, dt),
      get_i(s, i, r, a, b, dt),
      get_r(s, i, r, a, b, dt),
      a,
      b,
      dt,
      current + 1,
      n,
      [i | acc_i]
    )

  defp get_s(s, i, _r, _a, b, dt), do: s - dt * b * s * i

  defp get_i(s, i, _r, a, b, dt), do: i + dt * (b * s * i - a * i)

  defp get_r(_s, i, r, a, _b, dt), do: r + dt * i * a

end
