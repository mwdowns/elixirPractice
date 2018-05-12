defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world

  """
  def hello do
    "hey yo!"
  end

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # WRONG WAY - because it returns nested arrays
    # for suit <- suits do
    #   for value <- values do
    #     value <> " of " <> suit
    #     # "#{value} of #{suit}"
    #   end
    # end

    # RIGHT WAY
    # OPTION 1 - better, returns a flattened array
    # cards = for suit <- suits do
    #   for value <- values do
    #     value <> " of " <> suit
    #     # "#{value} of #{suit}"
    #   end
    # end

    # List.flatten(cards)

    # OPTION 2 - best because it's shorter
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end