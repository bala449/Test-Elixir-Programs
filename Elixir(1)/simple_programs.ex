defmodule Calculator do
  def add(a,b), do: a+b
  def sub(a,b), do: a-b
  def mul(a,b), do: a*b
  def divi(a,b) do
    # proper coding way
    if b != 0 do
      {:ok, a/b}
    else
      {:error, "divide by zero"}
    end
  end
  def divide(_a,0), do: {:error, "divide by zero"}
  def divide(a,b), do: {:ok, a/b}

  ## if the output is boolean then use ? in function

  def is_odd?(n), do: rem(n, 2) == 1

  ## Capture Named functions using capture operator

  def capture do
    list = [1,2,3,4,5]
    Enum.map(list, &is_odd?/1)
  end

  ## FizzBuzz

  def fizz do
    Enum.map(1..100, &fizz_buzz/1)
  end
  def fizz_buzz(val) when rem(val, 3) == 0 and rem(val, 5) == 0, do: "FizzBuzz"
  def fizz_buzz(val) when rem(val, 3) == 0, do: "Fizz"
  def fizz_buzz(val) when rem(val, 5) == 0, do: "Buzz"
  def fizz_buzz(val), do: val

  ## Multiples of 3 or 5

  def sum_of_values(n) do
    Enum.filter(1..(n-1), fn x -> rem(x, 3) == 0 or rem(x, 5) == 0 end)
    |> Enum.reduce(fn(x, acc) -> x + acc end)
  end

  ## Reverse List

  def reverse(list) do
    Enum.reduce(list, [], fn(x, acc) -> [x | acc] end)
  end

  #find power single value

  def power(x, 0), do: 1
  def power(x, n), do: x * power(x, (n-1))

  #find power for multivalue

  def mul_power({_, _}, 0), do: 1
  def mul_power({a, b}, n), do: {a * power(a, (n-1)), b * power(b, (n-1))}

end
