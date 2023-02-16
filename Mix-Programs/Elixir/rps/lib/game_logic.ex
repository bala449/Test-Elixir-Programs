defmodule Rps.GameLogic do
  @gestures [:rock, :paper, :scissors]
  def gesture_valid?(gesture) do
    gesture in @gestures
  end
end
