defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  This Function return List of `Cards`.

  ## Examples

      iex> Cards.create_deck
      ["Ace of Spades", "Ace of Clubs", "Ace of Hearts", "Ace of Diamond",
      "Two of Spades", "Two of Clubs", "Two of Hearts", "Two of Diamond",
      "Three of Spades", "Three of Clubs", "Three of Hearts", "Three of Diamond",
      "Four of Spades", "Four of Clubs", "Four of Hearts", "Four of Diamond",
      "Five of Spades", "Five of Clubs", "Five of Hearts", "Five of Diamond"]
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]
    for value <- values, suit <- suits do
        "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffle all the deck Cards.

  ## Examples

      iex> deck = Cards.create_deck
      iex> deck != Cards.shuffle(deck)
      true
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end


  @doc """
  Function to check whether a card is valid.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
      iex> Cards.contains?(deck, "Ace of spades")
      false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    {hand, _rest_of_card} = Enum.split(deck, hand_size)
    hand
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
   {status, content} = File.read(filename)
   case status do
    :ok -> {:ok, :erlang.binary_to_term(content)}
    :error -> {:error, "File not Exits"}
   end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
