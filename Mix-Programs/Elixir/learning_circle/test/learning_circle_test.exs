defmodule LearningCircleTest do
  use ExUnit.Case
  doctest LearningCircle

  test "greets the world" do
    assert LearningCircle.hello() == :world
  end
end
