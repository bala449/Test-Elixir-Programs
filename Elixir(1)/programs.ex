defmodule Helloworld do
  def test do
    num1 = IO.gets("Enter the first Number : ") |> String.trim_trailing |> String.to_integer
    num2 = IO.gets("Enter the second Number : ") |> String.trim_trailing |> String.to_integer
    calculate(num1, num2)
  end

  def calculate(val1, val2) do
    operator = IO.gets("Enter the operator (+,-,*,/,%) : ") |> String.trim_trailing
    case operator do
      "+" ->
        add(val1, val2)
      "-" ->
        sub(val1, val2)
      "*" ->
        mul(val1, val2)
      "/" ->
        divi(val1, val2)
      "%" ->
        mod(val1, val2)
      _ ->
        IO.puts("(Please select valied operator)")
        calculate(val1, val2)
    end
  end

  def add(val1, val2) do
    IO.puts("Given value Addition is : #{val1 + val2}")
    acknowledgement()
  end

  def sub(val1, val2) do
    IO.puts("Given value Subtraction is : #{val1 - val2}")
    acknowledgement()
  end

  def mul(val1, val2) do
    IO.puts("Given value Multiplication is : #{val1 * val2}")
    acknowledgement()
  end

  def divi(val1, val2) do
    IO.puts("Given value Division is : #{val1 / val2}")
    acknowledgement()
  end

  def mod(val1, val2) do
    IO.puts("Given value remaining is : #{rem(val1, val2)}")
    acknowledgement()
  end

  def acknowledgement do
    conf = IO.gets("Would you like to do again (yes/no) : ") |> String.trim_trailing
    case conf do
      "yes" ->
        test()
      "no" ->
        IO.puts("Byebye")
      _ ->
        IO.puts("(Invalid input Please Enter valid Input)")
        acknowledgement()
    end
  end
end

# Helloworld.test()


defmodule Test do
  def test_list do
    list = [1,2,3,4]
    # Pattern Matching...
    [a,b,c,d] = list
    Enum.each(list,
      fn(x) ->
        IO.puts(x+1)
      end)
  end

  ##square given input values..

  def input_list do
    input = IO.gets("Enter numbers using comma separated : ") |> String.trim_trailing
    process_list(input)
  end
  def process_list(input) do
    list = String.split(input, ",")
    convert_to_list(list)
  end
  def convert_to_list(list) do
    Enum.map(list, &(String.to_integer(&1) * String.to_integer(&1)))
  end

  # Anagram Exercise

  def anagram(first_val, second_val) do
    first_list = first_val |> String.replace(" ", "") |> String.upcase() |> String.split("", trim: true) |> Enum.sort()
    second_list = second_val |> String.replace(" ", "") |> String.upcase() |> String.split("", trim: true) |> Enum.sort()
    case first_list == second_list do
      true -> IO.puts("This is an Anagram")
      false -> IO.puts("This is Not an Anagram")
    end
    IO.puts(first_list)
    IO.puts(second_list)
  end
end

## Error Handling...

defmodule ExceptionDemo do
  def show(value) do
    try do
      exec(value)
    rescue
    error in [ArithmeticError] ->
      IO.puts("ArithmeticError - #{error.message}")
    FunctionClauseError ->
      IO.puts("Function Clause error")
    after
      IO.puts("Handled the error")
    end
  end
  defp exec(:ok) do
    IO.puts("Executed correctly!")
  end
  defp exec(:dbz) do
    1 / 0
  end
  defp exec(:unknown) do
    exec(:unk)
  end
end
