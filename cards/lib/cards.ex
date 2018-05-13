defmodule Cards do
  @moduledoc """
    Methods for creating and handling a deck of cards
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world

  """
  def hello do
    :world
  end

  @doc """
  Creates a deck of cards.

  Returns:
  * a `deck` (list of strings) representing a deck of 52 cards - 4 suits of 13 values

  ## Examples

      iex> Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", ...]

  """
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

  @doc """
  Shuffles cards within a deck.

  Argument:
  * `deck` (list of strings)

  Returns:
  * a new `deck` with the strings stuffled

  ## Examples

      iex> Cards.shuffle(deck)
      ["Two of Hearts", "King of Spades", "Ten of Spades", ...]

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Checks to see if a card is within a deck.

  Arguments:
  * `deck` (list of strings)
  * `card` (single string)

  Returns:
  * `true` or `false`.

  ## Examples

      iex> Cards.contains?(deck, "Two of Hearts")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Creates hand and a remaining deck from an initial deck given a hand_size.

  Arguments:
  * `deck` (list of strings)
  * `hand_size` (int)

  Returns:
  * Tupul {`hand` (list of strings of `hand_size`), `rest_of_deck` (list of strings minus `hand_size`)}

  ## Examples

      iex> Cards.deal(deck, 5)
      {["card", "card"], ["card", "card", "card"]}

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Saves a deck to the hard-drive.

  Arguments:
  * `deck` (list of strings)
  * `filename` (string)

  Returns:
  * :ok

  ## Examples

      iex> Cards.save(deck, "my_file")
      :ok

  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Loads a deck from the hard-drive.

  Arguments:
  * `filename` (string)

  Returns:
  * `deck` (list of strings) if successful or `error message` (string) if unsuccessful.

  ## Examples

      iex> Cards.load("my_file")
      ["card", "card", "card", ...]

      ie> Cards.load("garbage")
      "That file does not exist"

  """
  def load(filename) do

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end

  end

  @doc """
  Runs 3 functions using the pipe opporator: `create_deck` -> `shuffle` -> `deal(hand_size)`

  Arguments:
  * `hand_size` (int)

  Returns:
  * Tupul {`hand` (list of strings of `hand_size`), `rest_of_deck` (list of strings minus `hand_size`)}

  ## Examples

      iex> Cards.create_hand(5)
      {["card", "card"], ["card", "card", "card"]}

  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end