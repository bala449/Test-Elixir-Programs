defmodule Recursion do
  def factorial(0), do: 1

  def factorial(n), do: n * factorial(n - 1)

  def gcd(a, 0), do: a

  def gcd(a, b), do: gcd(b, rem(a, b))

  def map([], _func), do: []

  def map([head | tail], func) do
    [func.(head) | map(tail, func)]
  end

  def combine([head | []], _func), do: []

  def combine([head | tail], func) do
    [func.(head, List.first(tail)) | combine(tail, func)]
  end

  def reduce([], _func, val), do: val

  def reduce([head | tail], func, val \\ 0) do
    result = func.(head, val)
    reduce(tail, func, result)
  end

  # Find Absolute Value

  def s_abs(x) when x < 0, do: -(x)
  def s_abs(x), do: x

  ## Birds count

  def has_day_without_birds?([]), do: false
  # def has_day_without_birds?(0), do: true
  def has_day_without_birds?([0 | t]), do: true
  def has_day_without_birds?([h | t]), do: has_day_without_birds?(t)
  # def has_day_without_birds?(_h), do: false
end
