defmodule NewStructTest do
  use ExUnit.Case
  doctest NewStruct

  test "greets the world" do
    assert NewStruct.hello() == :world
  end
end
