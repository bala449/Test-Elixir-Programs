defmodule GameLogicOops do

  @gestures [:rock, :paper, :scissors]

  def find_result(gesture1, gesture2) do
    if(gesture1 not in @gestures or gesture2 not in @gestures) do
      :invalid
    else
      if(gesture1 == gesture2) do
        :tie
      else
        if(gesture1 == :rock && gesture2 == :scissors or gesture1 == :scissors && gesture2 == :paper or gesture1 == :paper && gesture2 == :rock) do
          :first_win
        else
          :second_win
        end
      end
    end
  end
end
