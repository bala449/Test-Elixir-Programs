defmodule Fibonnaci do
  def fibonnaci(n) do
    num1 = 0
    num2 = 1
    t = 0
    IO.puts num1
    cal_fibo(num1, num2, t, n)
  end
  def cal_fibo(num1, num2, t, n) do
    num3 = num2 + num1
    num1 = num2
    num2 = num3
    t = t+1
    IO.puts num1
    if t <= n do
      cal_fibo(num1, num2, t, n)
    end
  end

  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n-1) + fib(n-2)
  def fib_view(n) do
    Enum.map(2..(n+1), &fib/1)
    |> Enum.filter(fn x -> rem(x, 2) == 0 end)
    |> Enum.reduce(fn x,acc -> x + acc end)
  end
end
