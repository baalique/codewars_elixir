# https://www.codewars.com/kata/515decfd9dcfc23bb6000006

defmodule Solution do

  def is_valid_ip(ip), do:
    Regex.match?(
      ~r/^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/,
      ip
    )

end
