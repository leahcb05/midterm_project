require_relative 'card'

class Deck
  attr_reader :cards

  SUITS = %w[Hearts Diamonds Clubs Spades].freeze
  VALUES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze

  def initialize
    @cards = create_deck
  end

  def create_deck
    deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        deck << Card.new(suit, value)
      end
    end
    deck
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(num_cards)
    remaining_cards = @cards.length
    cards_to_deal = [num_cards, remaining_cards].min
    @cards.slice!(0, cards_to_deal)
  end
end
