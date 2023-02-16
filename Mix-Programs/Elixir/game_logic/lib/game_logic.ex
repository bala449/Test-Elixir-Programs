defmodule GameLogic do
  @moduledoc """
  Documentation for `GameLogic`.
  """

  @gestures [:rock, :paper, :scissors]

  def find_result(gesture1, gesture2) when gesture1 not in @gestures
      or gesture2 not in @gestures do
    :invalid
  end
  def find_result(gesture1, gesture2) when gesture1 == gesture2 do
    :tie
  end
  def find_result(:rock, :scissors), do: :first_win
  def find_result(:paper, :rock), do: :first_win
  def find_result(:scissors, :paper), do: :first_win
  def find_result(_gesture1, _gesture2), do: :second_win
end
