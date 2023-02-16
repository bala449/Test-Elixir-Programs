defmodule GameLogicOopsTest do
  use ExUnit.Case
  doctest GameLogicOops

  test "game logic oops" do
    assert GameLogicOops.find_result(:rock, :scissor) == :invalid
    assert GameLogicOops.find_result(:rock, :rock) == :tie
    assert GameLogicOops.find_result(:rock, :scissors) == :first_win
    assert GameLogicOops.find_result(:paper, :rock) == :first_win
    assert GameLogicOops.find_result(:scissors, :paper) == :first_win
    assert GameLogicOops.find_result(:rock, :paper) == :second_win
    assert GameLogicOops.find_result(:paper, :scissors) == :second_win
    assert GameLogicOops.find_result(:scissors, :rock) == :second_win
  end
end
