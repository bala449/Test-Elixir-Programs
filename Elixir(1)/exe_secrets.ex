defmodule Secrets do
  def secret_add(secret) do
    fn val -> val + secret end
  end

  def secret_subtract(secret) do
    fn val -> val - secret end
  end

  def secret_multiply(secret) do
    fn val -> val * secret end
  end

  def secret_divide(secret) do
    fn val -> div(val, secret) end
  end

  def secret_and(secret) do
    fn val -> Bitwise.band(val, secret) end
  end

  def secret_xor(secret) do
    fn val -> Bitwise.bxor(val, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    f = secret_add(secret_function1)
    g = secret_subtract(secret_function2)
    fn x -> f.(x) |> g.() end
  end
end
