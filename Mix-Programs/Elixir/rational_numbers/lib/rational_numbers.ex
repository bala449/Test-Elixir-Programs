defmodule RationalNumbers do
  @type rational :: {integer, integer}
  @doc """
  Find Rational number Using Gcd
  """
  def rational({a, b}) when a < 0 and b < 0, do: rational({-(a), -(b)})
  def rational({a, b}) when b < 0, do: rational({-(a), -(b)})
  def rational({a, b}) do
    var_gcd = Integer.gcd(a, b)
    {div(a, var_gcd), div(b, var_gcd)}
  end
  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}), do: rational({((a1 * b2) + (a2 * b1)), (b1 * b2)})
  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}), do: rational({((a1 * b2) - (a2 * b1)), (b1 * b2)})
  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}), do: rational({(a1 * a2), (b1 * b2)})
  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) when a2 != 0 or b1 != 0, do: rational({(a1 * b2), (a2 * b1)})
  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}), do: rational({Kernel.abs(a), Kernel.abs(b)})
  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n > 0, do: rational({Integer.pow(a, n), Integer.pow(b, n)})
  def pow_rational({a, b}, n), do: rational({Integer.pow(-(b), Kernel.abs(n)), Integer.pow(-(a), Kernel.abs(n))})
  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    x ** (a/b)
  end
  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}), do: rational({a, b})
end
