defmodule GameLogicElixTest do
  use ExUnit.Case
  doctest GameLogicElix

  test "game logic Elix" do
    assert GameLogicElix.find_result(:rock, :scissor) == :invalid
    assert GameLogicElix.find_result(:rock, :rock) == :tie
    assert GameLogicElix.find_result(:rock, :scissors) == :first_win
    assert GameLogicElix.find_result(:paper, :rock) == :first_win
    assert GameLogicElix.find_result(:scissors, :paper) == :first_win
    assert GameLogicElix.find_result(:rock, :paper) == :second_win
    assert GameLogicElix.find_result(:paper, :scissors) == :second_win
    assert GameLogicElix.find_result(:scissors, :rock) == :second_win
  end
end
