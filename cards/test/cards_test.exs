defmodule CardsTest do
  use ExUnit.Case
  # doctest Cards

  test "greets the world" do
    assert Cards.hello() == :world
  end

  test "create deck makes 52 cards" do
    deck = Cards.create_deck
    assert length(deck) == 52
  end

  test "create hand" do
    hand_size = 5
    deck = Cards.create_deck
    {hand, rest_of_deck} = Cards.deal(deck, hand_size)
    assert length(hand) == hand_size
    assert length(rest_of_deck) == 52 - hand_size
  end

  test "shuffle" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
