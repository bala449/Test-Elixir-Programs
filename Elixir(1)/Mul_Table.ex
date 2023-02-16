defmodule MulTable do
  @doc "Get input from user"
  def multable do
    input1 = IO.gets("Enter Which multiplication table do you want : ") |> String.trim_trailing |> String.to_integer
    input2 = IO.gets("Enter How many columns do you want : ") |> String.trim_trailing |> String.to_integer
    num = 1
    cal_table(num, input1, input2)
  end

  @doc "Calculating the Multiplication Table"
  def cal_table(num, input1, input2) do
    result = input1 * num
    IO.puts "#{num} * #{input1} = #{result}"
    num = num + 1
    if num <= input2 do
      cal_table(num, input1, input2)
    end
  end
end
