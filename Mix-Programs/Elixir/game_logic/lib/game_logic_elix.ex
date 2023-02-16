defmodule GameLogicElix do

  @gestures [:rock, :paper, :scissors]

  def find_result(gesture1, gesture2) do
    cond do
      gesture1 not in @gestures or gesture2 not in @gestures -> :invalid
      gesture1 == gesture2 -> :tie
      gesture1 == :rock && gesture2 == :scissors || gesture1 == :scissors && gesture2 == :paper || gesture1 == :paper && gesture2 == :rock -> :first_win
      true -> :second_win
    end
  end

end
