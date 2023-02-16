defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
