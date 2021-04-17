# https://www.codewars.com/kata/5efae11e2d12df00331f91a6

defmodule CodeWars do

  def crack(hash), do:
    do_crack(hash, "00000")

  defp do_crack(hash, str) do
    cond do
      hash == get_hash(str) -> str
      true -> do_crack(hash, get_next_pin(str))
    end
  end

  defp get_hash(str),
       do: str
           |> (&:crypto.hash(:md5, &1)).()
           |> Base.encode16
           |> String.downcase

  defp get_next_pin(str),
       do: str
           |> String.to_integer
           |> Kernel.+(1)
           |> Integer.to_string
           |> fill_with_zeros

  defp fill_with_zeros(str), do: String.duplicate("0", 5 - String.length(str)) <> str

end
