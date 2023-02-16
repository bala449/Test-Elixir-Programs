defmodule PrimeNumber do
  def is_prime(x), do: (2..x |> Enum.filter(fn a -> rem(x, a) == 0 end) |> length()) == 1
  # def prime(n), do: Stream.interval(1) |> Stream.drop(2) |> Stream.filter(&is_prime/1) |> Enum.take(n)
end
