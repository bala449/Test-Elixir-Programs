defmodule DbTestTest do
  use ExUnit.Case
  doctest DbTest

  test "greets the world" do
    assert DbTest.hello() == :world
  end
end
