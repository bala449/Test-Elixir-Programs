defmodule RpsGameLogicTests do
  use ExUnit.Case
  alias Rps.GameLogic, as: Logic
  test "checks the validity of Gestures" do
    assert Logic.gesture_valid?(:rock) == true
    assert Logic.gesture_valid?(:paper) != false
    refute Logic.gesture_valid?(:scissors) == false
    refute Logic.gesture_valid?(:pencil) == true
  end
end
