defmodule Armstrong do
  def armstrong do
    input = IO.gets("Enter the Number : ") |> String.trim_trailing
    if(is_arms?(input)) do
      IO.puts("Yes! #{input} is a Armstrong Number")
      acknowledgement()
    else
      IO.puts("No! #{input} is Not a Armstrong Number")
      acknowledgement()
    end
  end
  def is_arms?(input) do
    list_val = String.split(input, "", trim: true)
    int_len = length(list_val)
    result = Enum.map(list_val, fn x -> cal_arms(String.to_integer(x), int_len) end) |> Enum.reduce(fn(x, acc) -> x + acc end)
    result == String.to_integer(input)
  end
  def cal_arms(input, int_len) do
    :math.pow(input, int_len) |> round
  end
  def acknowledgement do
    acknowledge = IO.gets("Would you want to check with another number(yes/no) : ") |> String.trim_trailing
    case acknowledge do
      "yes" -> armstrong()
      "no" -> IO.puts("Thanks!")
      _ ->
        IO.puts("Please Enter valid Input \n")
        acknowledgement()
    end
  end
end
