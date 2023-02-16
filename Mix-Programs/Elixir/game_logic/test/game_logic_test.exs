defmodule GameLogicTest do
  use ExUnit.Case
  doctest GameLogic

  test "game logic" do
    assert GameLogic.find_result(:rock, :scissor) == :invalid
    assert GameLogic.find_result(:rock, :rock) == :tie
    assert GameLogic.find_result(:rock, :scissors) == :first_win
    assert GameLogic.find_result(:paper, :rock) == :first_win
    assert GameLogic.find_result(:scissors, :paper) == :first_win
    assert GameLogic.find_result(:rock, :paper) == :second_win
    assert GameLogic.find_result(:paper, :scissors) == :second_win
    assert GameLogic.find_result(:scissors, :rock) == :second_win
  end
end
